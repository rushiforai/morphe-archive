package app.czyeru.patches.tiktok.misc.likes

import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val SETTINGS_STATUS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/settings/SettingsStatus;"

private const val FAVORITE_SEARCH_DATA =
    "Lcom/ss/android/ugc/profile/business/profile/tab/search/FavoriteSearchData;"

private const val STRING = "Ljava/lang/String;"

@Suppress("unused")
val likedVideosServerSearchPatch = bytecodePatch(
    name = "Liked videos search V2",
    description = "Liked videos search V1 plus an experimental server search: each query also asks " +
        "TikTok's server for matching liked videos, so videos that have not loaded yet show up right away. " +
        "Falls back to V1 when the server does not return your liked videos.",
    default = false,
) {
    dependsOn(likedVideosSearchPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $SETTINGS_STATUS_DESCRIPTOR->enableLikedVideosServerSearch()V",
        )

        // Every TikTok reference comes from TikTok's own favorites search request, so the
        // generated request matches it in this build.
        val instructions = FavoriteSearchRequestFingerprint.method.implementation!!.instructions.toList()

        fun fail(what: String): Nothing = throw PatchException("Liked videos search V2: $what not found.")

        fun Instruction.methodRef() = ((this as? ReferenceInstruction)?.reference as? MethodReference)
        fun Instruction.fieldRef() = ((this as? ReferenceInstruction)?.reference as? FieldReference)

        if (instructions.none {
                it.opcode == Opcode.CONST_CLASS &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == FAVORITE_SEARCH_DATA
            }
        ) {
            fail("FavoriteSearchData response class")
        }

        // The URL builder call right after each parameter name.
        fun putAfter(name: String, vararg parameters: String): MethodReference {
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == name
            }
            val reference = instructions.getOrNull(index + 1)?.methodRef()
            if (index < 0 || reference == null || reference.parameterTypes.toList() != parameters.toList()) {
                fail("URL parameter setter for \"$name\"")
            }
            return reference
        }

        val putInt = putAfter("scene_id", "I", STRING)
        val putString = putAfter("keyword", STRING, STRING)
        val putLong = putAfter("cursor", "J", STRING)
        val builder = putInt.definingClass
        if (putString.definingClass != builder || putLong.definingClass != builder) fail("single URL builder")

        val builderInitIndex = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_DIRECT && it.methodRef()?.let { ref ->
                ref.definingClass == builder && ref.name == "<init>" && ref.parameterTypes.toList() == listOf(STRING)
            } == true
        }
        if (builderInitIndex < 1) fail("URL builder constructor")
        val builderInit = instructions[builderInitIndex].methodRef()!!
        val pathField = instructions[builderInitIndex - 1].takeIf { it.opcode == Opcode.SGET_OBJECT }
            ?.fieldRef()?.takeIf { it.type == STRING } ?: fail("search path field")

        val build = instructions.firstNotNullOfOrNull { instruction ->
            instruction.methodRef()?.takeIf {
                instruction.opcode == Opcode.INVOKE_VIRTUAL && it.definingClass == builder &&
                    it.parameterTypes.isEmpty() && it.returnType == STRING
            }
        } ?: fail("URL builder build method")

        val api = instructions.firstNotNullOfOrNull { instruction ->
            instruction.methodRef()?.takeIf { it.name == "apiExecuteGetJSONObject" }
        } ?: fail("network client call")
        val apiParameters = api.parameterTypes.map { it.toString() }
        if (apiParameters.size != 7 || apiParameters[0] != "I" || apiParameters[1] != STRING ||
            apiParameters[2] != "Ljava/lang/Class;" || apiParameters[3] != STRING ||
            apiParameters[5] != "Z" || apiParameters[6] != STRING || api.returnType != "Ljava/lang/Object;"
        ) {
            fail("network client call with the expected parameters")
        }
        val apiInstance = instructions.firstNotNullOfOrNull { instruction ->
            instruction.fieldRef()?.takeIf {
                instruction.opcode == Opcode.SGET_OBJECT && it.type == api.definingClass
            }
        } ?: fail("network client instance")
        val extraParameters = apiParameters[4]

        fun enumField(name: String) = instructions.firstNotNullOfOrNull { instruction ->
            instruction.fieldRef()?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.name == name }
        } ?: fail("request source $name")

        val manualRefresh = enumField("MANUAL_REFRESH")
        val manualLoadMore = enumField("MANUAL_LOAD_MORE")
        if (manualRefresh.type != manualLoadMore.type) fail("one request source type")
        val getValue = instructions.firstNotNullOfOrNull { instruction ->
            instruction.methodRef()?.takeIf {
                it.definingClass == manualRefresh.type && it.name == "getValue" && it.returnType == "I"
            }
        } ?: fail("request source value getter")

        // Replace the extension stub with a copy of TikTok's request. 26 registers: v0-v19 are
        // locals, p0 = scene (v20), p1 = keyword, p2-p3 = cursor, p4 = count, p5 = search method.
        ServerSearchRequestStubFingerprint.let { stubFingerprint ->
            val stub = stubFingerprint.method
            val extensionClass = stubFingerprint.classDef
            val request = ImmutableMethod(
                stub.definingClass,
                stub.name,
                stub.parameters,
                stub.returnType,
                stub.accessFlags,
                null,
                null,
                MutableMethodImplementation(26),
            ).toMutable()

            request.addInstructions(
                0,
                """
                    new-instance v0, $builder
                    sget-object v1, $pathField
                    invoke-direct {v0, v1}, $builderInit
                    move/from16 v1, p0
                    const-string v2, "scene_id"
                    invoke-virtual {v0, v1, v2}, $putInt
                    const-string v1, "keyword"
                    move-object/from16 v2, p1
                    invoke-virtual {v0, v1, v2}, $putString
                    move-wide/from16 v1, p2
                    const-string v3, "cursor"
                    invoke-virtual {v0, v1, v2, v3}, $putLong
                    move/from16 v1, p4
                    const-string v2, "count"
                    invoke-virtual {v0, v1, v2}, $putInt
                    const-string v1, "search_method"
                    move-object/from16 v2, p5
                    invoke-virtual {v0, v1, v2}, $putString
                    const-wide/16 v4, 0x0
                    move-wide/from16 v6, p2
                    cmp-long v1, v6, v4
                    if-gtz v1, :load_more
                    sget-object v1, $manualRefresh
                    goto :request_source
                    :load_more
                    sget-object v1, $manualLoadMore
                    :request_source
                    invoke-virtual {v1}, $getValue
                    move-result v1
                    const-string v2, "request_source"
                    invoke-virtual {v0, v1, v2}, $putInt
                    invoke-virtual {v0}, $build
                    move-result-object v12
                    sget-object v10, $apiInstance
                    const/4 v11, 0x0
                    const-class v13, $FAVORITE_SEARCH_DATA
                    const/4 v14, 0x0
                    new-instance v15, $extraParameters
                    invoke-direct {v15}, $extraParameters-><init>()V
                    const/4 v8, 0x1
                    cmp-long v1, v6, v4
                    if-lez v1, :first_page
                    const/4 v8, 0x0
                    :first_page
                    move/from16 v16, v8
                    const/4 v9, 0x0
                    move-object/from16 v17, v9
                    invoke-virtual/range {v10 .. v17}, $api
                    move-result-object v0
                    return-object v0
                """,
            )

            mutableClassDefBy(extensionClass).methods.apply {
                remove(stub)
                add(request)
            }
        }
    }
}
