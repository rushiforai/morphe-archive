/*
 * Ported from ajstrick81's HBO Max Android TV patches (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/hbomax
 * ALL CREDIT FOR THE AD-ORIGIN BLOCK AND THE NOWTILUS SWITCH GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.hbomax.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants

private const val ORIGIN_FILTER = "Lsemicoloncolonel/mobilestream/extension/hbomax/ads/HboAdOriginFilter;"

// HBO Max phone 7.14.0.530. Unlike the TV build, the phone build strips the
// source names of the Bolt overlay fetcher and the SSAI / live timeline
// builders, so the TV patch's marker and overlay hooks are not ported yet.
// What survives by name is media3's DefaultHttpDataSource (its own log tag)
// and MediaMelon's RegisterAPI.

// media3 DefaultHttpDataSource.open(DataSpec), found by its log-tag string
// as in the TV patch. Its superclass is media3's BaseDataSource; the patch
// guards open() on every data source that extends it.
internal object DefaultHttpDataSourceOpenFingerprint : Fingerprint(
    returnType = "J",
    custom = { method, classDef ->
        method.name == "open" &&
            method.parameterTypes.size == 1 &&
            classDef.methods.any { candidate ->
                candidate.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.CONST_STRING &&
                        ((instruction as ReferenceInstruction).reference as? StringReference)
                            ?.string == "DefaultHttpDataSource"
                } == true
            }
    },
)

internal object NowtilusEnabledFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, _ ->
        method.definingClass == "Lcom/mediamelon/core/qubit/ep/RegisterAPI;" &&
            method.name == "isNowtilusEnabled"
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Blocks HBO Max's ad servers inside the app, the way a DNS ad blocker would, " +
        "so the player falls back to its clean stream and the ad video does not play. On TV " +
        "this sometimes shows \"Couldn't Play Content\" (error 39999) when a resumed episode " +
        "reaches a mid-roll; if that happens, start the episode from the beginning.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // 1) Guard every media3 data source's open(DataSpec): HTTP, Cronet,
        //    OkHttp, file, asset... Non-network sources have no host and pass.
        val base = DefaultHttpDataSourceOpenFingerprint.classDef.superclass
            ?: error("HBO Skip ads: DefaultHttpDataSource has no superclass")
        val dataSpecType = DefaultHttpDataSourceOpenFingerprint.method.parameterTypes.first().toString()
        val sources = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.superclass == base &&
                classDef.methods.any { it.isDataSourceOpen(dataSpecType) }
            ) {
                sources += classDef.type
            }
        }
        check(sources.isNotEmpty()) { "HBO Skip ads: no data sources found" }
        sources.forEach { type ->
            mutableClassDefBy(type).methods
                .filter { it.isDataSourceOpen(dataSpecType) }
                .forEach { method ->
                    method.addInstructions(
                        0,
                        "invoke-static/range { p1 .. p1 }, $ORIGIN_FILTER->guard(Ljava/lang/Object;)V",
                    )
                }
        }

        // 2) MediaMelon's Nowtilus SSAI integration off, as in the TV patch.
        //    isNowtilusEnabled has .locals 1.
        NowtilusEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isDataSourceOpen(dataSpecType: String) =
    name == "open" &&
        returnType == "J" &&
        implementation != null &&
        parameterTypes.size == 1 &&
        parameterTypes[0].toString() == dataSpecType
