/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.patches.youtube.video.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.extension.Constants.EXTENSION_UTILS_CLASS_DESCRIPTOR
import app.morphe.patches.youtube.utils.extension.Constants.GENERAL_PATH
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val OFFLINE_STREAM_SOURCE = "$GENERAL_PATH/offline/OfflineStreamSource;"
private const val EXO_PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"
private const val ANDROID_URI = "Landroid/net/Uri;"
private const val ANDROID_CONTEXT = "Landroid/content/Context;"

private object AndroidFrameworkWatchPlayerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("AndroidFwPlayer: Factory failed to create a MediaPlayer for the stream"),
)

/** Reuses Medialib's progressive Media3 adapter for our local stream, leaving all other requests alone. */
context(context: BytecodePatchContext)
internal fun installOfflineWatchProgressiveExo() {
    val install = try {
        val method = AndroidFrameworkWatchPlayerFingerprint.method
        val code = method.instructions
        val constructor = code.mapNotNull { instruction ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) return@mapNotNull null
            instruction.getReference<MethodReference>()?.takeIf {
                it.name == "<init>" && it.parameterTypes.size == 5 && it.parameterTypes[0] == ANDROID_CONTEXT &&
                    it.parameterTypes[3] == "J" &&
                    context.classDefByOrNull(it.definingClass)?.fields?.any { field -> field.type == EXO_PLAYER } == true
            }
        }.single()
        val allocation = code.indices.single { index ->
            code[index].opcode == Opcode.NEW_INSTANCE &&
                code[index].getReference<TypeReference>()?.type == constructor.definingClass
        }

        // Just before constructing the adapter, the stock controller checks the request flag,
        // the experiment flag, and finally the presence of a video ID on the FormatStreamModel.
        val requestFlagIndex = allocation - 10
        val firstBranch = allocation - 6
        val videoIdIndex = allocation - 2
        check(code.subList(requestFlagIndex, allocation).map { it.opcode } == listOf(
            Opcode.IGET_BOOLEAN, Opcode.IGET_WIDE, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_WIDE,
            Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT,
            Opcode.IF_EQZ,
        )) { "Progressive player selection changed" }

        val requestFlag = code[requestFlagIndex] as TwoRegisterInstruction
        val flagRegister = (code[firstBranch] as OneRegisterInstruction).registerA
        val flagField = code[requestFlagIndex].getReference<FieldReference>()!!
        val videoIdRead = code[videoIdIndex] as TwoRegisterInstruction
        val formatType = constructor.parameterTypes[2].toString()
        val videoIdField = code[videoIdIndex].getReference<FieldReference>()!!
        val lengthRead = code[firstBranch - 2].getReference<MethodReference>()!!
        val positionRegister = (code[requestFlagIndex + 1] as TwoRegisterInstruction).registerA
        val lengthRegister = (code[firstBranch - 1] as OneRegisterInstruction).registerA
        check(requestFlag.registerA == flagRegister && videoIdField.definingClass == formatType &&
            videoIdField.type == "Ljava/lang/String;" && lengthRead.definingClass == formatType &&
            lengthRead.returnType == "J" && requestFlag.registerB !in positionRegister..positionRegister + 1 &&
            requestFlag.registerB !in lengthRegister..lengthRegister + 1) {
            "Progressive player selection registers changed"
        }
        val requestOption = requireNotNull(context.classDefByOrNull(flagField.definingClass)).instanceFields.single {
            it.name == flagField.name && it.type == "Z"
        }
        check(!AccessFlags.FINAL.isSet(requestOption.accessFlags)) { "Progressive request flag is no longer mutable" }
        val uriField = requireNotNull(context.classDefByOrNull(formatType)).instanceFields.single {
            it.type == ANDROID_URI && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }

        val controller = context.mutableClassDefBy(method.definingClass)
        val request = requireNotNull(context.classDefByOrNull(flagField.definingClass))
        val engine = controller.fields.single { field ->
            context.classDefByOrNull(field.type)?.superclass == "Ljava/lang/Enum;" &&
                request.fields.any { it.type == field.type }
        }
        val requestEngine = request.fields.single { it.type == engine.type }
        val enumCode = requireNotNull(context.classDefByOrNull(engine.type)).methods
            .single { it.name == "<clinit>" }.implementation!!.instructions.toList()
        val progressiveEnumIndex = enumCode.indexOfFirst {
            it.getReference<StringReference>()?.string == "ANDROID_BASE_EXOPLAYER"
        }
        check(progressiveEnumIndex >= 0) { "Progressive player engine changed" }
        val progressiveEnum = enumCode.drop(progressiveEnumIndex + 1).first { it.opcode == Opcode.SPUT_OBJECT }
            .getReference<FieldReference>()!!
        check(progressiveEnum.definingClass == engine.type && progressiveEnum.type == engine.type)

        val controllerRegister = code.take(requestFlagIndex).single {
            it.opcode == Opcode.IPUT_OBJECT &&
                it.getReference<FieldReference>()?.let { field ->
                    field.definingClass == method.definingClass && field.type == flagField.definingClass
                } == true
        }.let { (it as TwoRegisterInstruction).registerB }
        // The wrapper passes a no-op error listener for its framework path. Use its active listener
        // for the local progressive load, as it would when selecting this adapter itself.
        val controllerInit = controller.methods.single { it.name == "<init>" }
        val wrapperType = controllerInit.parameterTypes.first().toString()
        val wrapper = controller.fields.single { it.type == wrapperType }
        val loadListener = controllerInit.instructions.single {
            it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.definingClass == wrapperType
        }.getReference<FieldReference>()!!
        val requestListener = request.fields.single { it.type == loadListener.type }

        val installTransport = resolveProgressiveLocalTransport(constructor, uriField)
        // Keep the stock video-ID guard, then identify this load as progressive for ready, seek and speed callbacks.
        val apply: () -> Unit = {
            method.addInstructionsAtControlFlowLabel(
                firstBranch,
                """
                    iget-object v$flagRegister, v${videoIdRead.registerB}, $uriField
                    invoke-static { v$flagRegister }, $OFFLINE_STREAM_SOURCE->useStockProgressiveExo($ANDROID_URI)Z
                    move-result v$flagRegister
                    if-eqz v$flagRegister, :stock_flags
                    iget-object v$flagRegister, v${videoIdRead.registerB}, $videoIdField
                    if-eqz v$flagRegister, :stock_flags
                    const/4 v$flagRegister, 0x1
                    iput-boolean v$flagRegister, v${requestFlag.registerB}, $flagField
                    sget-object v$flagRegister, $progressiveEnum
                    iput-object v$flagRegister, v${requestFlag.registerB}, $requestEngine
                    iput-object v$flagRegister, v$controllerRegister, $engine
                    iget-object v$flagRegister, v$controllerRegister, $wrapper
                    iget-object v$flagRegister, v$flagRegister, $loadListener
                    iput-object v$flagRegister, v${requestFlag.registerB}, $requestListener
                    goto :create_progressive
                    :stock_flags
                    iget-boolean v$flagRegister, v${requestFlag.registerB}, $flagField
                """.trimIndent(),
                ExternalLabel("create_progressive", code[allocation]),
            )
            method.removeInstruction(requestFlagIndex)
            installTransport()
        }
        apply
    } catch (ex: Exception) {
        printWarn("Offline watch player: could not resolve the progressive Media3 adapter: ${ex.message}")
        return
    }
    install()
}

/**
 * Only this adapter's authenticated loads bypass Medialib's network/cache policy. Use the stock
 * scheme dispatcher for both file:// and MediaStore content://, with a non-network base source.
 */
context(context: BytecodePatchContext)
private fun resolveProgressiveLocalTransport(
    constructor: MethodReference,
    formatUri: FieldReference,
): () -> Unit {
    val adapter = context.mutableClassDefBy(constructor.definingClass)
    val init = adapter.methods.single { it == constructor }
    val nativeFactory = requireNotNull(context.classDefByOrNull(constructor.parameterTypes[1].toString()))
    val factoryContract = nativeFactory.interfaces.map {
        requireNotNull(context.classDefByOrNull(it))
    }.single { candidate ->
        candidate.methods.singleOrNull()?.let { it.parameterTypes.isEmpty() && it.returnType.startsWith('L') } == true
    }
    val createSource = factoryContract.methods.single()
    val sourceType = createSource.returnType
    val defaultSource = requireNotNull(context.classDefByOrNull { candidate ->
        sourceType in candidate.interfaces && candidate.methods.any { method ->
            method.containsString("/android_asset/") && method.containsString("content")
        }
    }) { "Stock local data source is unavailable" }
    val defaultConstructor = defaultSource.methods.single {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(ANDROID_CONTEXT, sourceType)
    }
    val placeholder = requireNotNull(context.classDefByOrNull { candidate ->
        sourceType in candidate.interfaces && candidate.methods.any {
            it.containsString("PlaceholderDataSource cannot be opened")
        }
    }) { "Stock placeholder data source is unavailable" }
    val noNetwork = placeholder.staticFields.single {
        it.type == placeholder.type && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }

    val initCode = init.instructions
    val factoryIndex = initCode.indices.single { index ->
        val insn = initCode[index]
        insn.opcode == Opcode.INVOKE_DIRECT && insn.getReference<MethodReference>()?.let {
            it.name == "<init>" && it.parameterTypes.firstOrNull() == factoryContract.type
        } == true
    }
    val factoryArgument = (initCode[factoryIndex] as FiveRegisterInstruction).registerD
    val thisRegister = init.implementation!!.registerCount - 7 // receiver, Context, factory, format, long, config
    val formatRegister = thisRegister + 3
    check(thisRegister in 0..15 && formatRegister in 0..15)
    val scratch = init.findFreeRegister(
        factoryIndex,
        (thisRegister until init.implementation!!.registerCount).toList() +
            (16 until init.implementation!!.registerCount).toList() + factoryArgument,
    )

    val prepare = adapter.methods.single {
        it.parameterTypes.take(3).map(CharSequence::toString) ==
            listOf(ANDROID_CONTEXT, ANDROID_URI, "Ljava/util/Map;") && it.returnType == "V"
    }
    val uriReadIndex = prepare.instructions.indices.single { index ->
        val insn = prepare.instructions[index]
        insn.opcode == Opcode.IGET_OBJECT && insn.getReference<FieldReference>() == formatUri
    }
    val uriRegister = (prepare.instructions[uriReadIndex] as TwoRegisterInstruction).registerA
    val uriUse = prepare.instructions[uriReadIndex + 1]
    val prepareThis = prepare.implementation!!.registerCount - 5
    check(prepareThis in 0..15)
    val uriScratch = prepare.findFreeRegister(
        uriReadIndex + 1,
        (16 until prepare.implementation!!.registerCount).toList() + listOf(uriRegister, prepareThis),
    )

    val uriField = ImmutableField(
        adapter.type, "patchOfflineLocalUri", ANDROID_URI, AccessFlags.PRIVATE.value, null, null, null,
    ).toMutable()
    val installSurface = resolveOfflineWatchSurface(prepare, uriField)
    check(adapter.methods.none { it.name == createSource.name && it.parameterTypes.isEmpty() })
    val factoryMethod = ImmutableMethod(
        adapter.type, createSource.name, emptyList(), sourceType, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null, null, MutableMethodImplementation(4),
    ).toMutable().apply {
        addInstructions(0, """
            new-instance v0, ${defaultSource.type}
            invoke-static {}, $EXTENSION_UTILS_CLASS_DESCRIPTOR->getContext()$ANDROID_CONTEXT
            move-result-object v1
            sget-object v2, $noNetwork
            invoke-direct {v0, v1, v2}, $defaultConstructor
            return-object v0
        """.trimIndent())
    }

    return {
        adapter.interfaces.add(factoryContract.type)
        adapter.fields.add(uriField)
        adapter.methods.add(factoryMethod)
        installSurface()

        val createFactory = initCode[factoryIndex]
        init.addInstructionsWithLabels(
            factoryIndex,
            """
                iget-object v$scratch, v$formatRegister, $formatUri
                invoke-static {v$scratch}, $OFFLINE_STREAM_SOURCE->stockProgressiveLocalUri($ANDROID_URI)$ANDROID_URI
                move-result-object v$scratch
                if-eqz v$scratch, :create_factory
                iput-object v$scratch, v$thisRegister, $uriField
                move-object v$factoryArgument, v$thisRegister
            """.trimIndent(),
            ExternalLabel("create_factory", createFactory),
        )
        prepare.addInstructionsWithLabels(
            uriReadIndex + 1,
            """
                iget-object v$uriScratch, v$prepareThis, $uriField
                if-eqz v$uriScratch, :use_uri
                move-object v$uriRegister, v$uriScratch
            """.trimIndent(),
            ExternalLabel("use_uri", uriUse),
        )
    }
}

private fun Method.containsString(value: String) =
    implementation?.instructions?.any { it.getReference<StringReference>()?.string == value } == true
