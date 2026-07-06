package app.morphe.patches.piko.misc.shim.jniLibs

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.piko.misc.version.is_11_88_or_greater
import app.morphe.patches.piko.misc.version.is_12_05_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import app.morphe.patches.piko.shared.Constants.COMPATIBILITY_PIKO
import app.morphe.patches.piko.util.cloneMethod
import app.morphe.patches.piko.util.getReference
import app.morphe.util.cloneMutable
import app.morphe.util.inputStreamFromBundledResource
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private val abstractShimLayerNativeLibraryResourcePatch = rawResourcePatch {
    dependsOn(versionCheckPatch)

    execute {
        if (!is_11_88_or_greater) {
            return@execute
        }
        if (is_12_05_or_greater) {
            return@execute
        }
        val nativeLibraries = setOf(
            // Fix XChat call.
            "libjingle_peerconnection_so.so",
            // Fix XChat decryption failure.
            "libjuicebox_sdk_jni.so",
        )
        val architectures = setOf(
            "arm64-v8a",
            "armeabi-v7a",
            "x86",
            "x86_64"
        )
        architectures.forEach { arch ->
            val archPath = "lib/$arch"
            val archFile = get(archPath)
            if (archFile.exists()) {
                nativeLibraries.forEach { nativeLibrary ->
                    inputStreamFromBundledResource(
                        "jniLibs",
                        "$arch/$nativeLibrary"
                    )?.copyTo(archFile.resolve(nativeLibrary).outputStream())
                }
            }
        }
    }
}

@Suppress("unused")
val abstractShimLayerNativeLibraryPatch = bytecodePatch(
    name = "Abstract shim layer for native library",
    description = "Adds an abstracted shim layer for native libraries, which improves compatibility to allow legacy patches to work."
) {
    compatibleWith(COMPATIBILITY_PIKO)

    dependsOn(abstractShimLayerNativeLibraryResourcePatch)

    execute {
        if (!is_11_88_or_greater) {
            return@execute
        }
        if (is_12_05_or_greater) {
            return@execute
        }

        val bridgeMethod : MutableMethod

        NativeCreatePeerConnectionFactoryFingerprint.let {
            it.classDef.apply {
                val nativeFindFieldParameters = listOf(
                    ImmutableMethodParameter("Ljava/lang/String;", null, null)
                )
                val nativePeerConnectionParameters = listOf(
                    ImmutableMethodParameter("Landroid/content/Context;", null, null),
                    ImmutableMethodParameter($$"Lorg/webrtc/PeerConnectionFactory$Options;", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("Lorg/webrtc/VideoEncoderFactory;", null, null),
                    ImmutableMethodParameter("Lorg/webrtc/VideoDecoderFactory;", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("J", null, null),
                    ImmutableMethodParameter("J", null, null),
                )

                val originalMethod = it.method
                val nativeFindFieldMethod = originalMethod.cloneMutable(
                    name = "nativeFindFieldTrialsFullName",
                    parameters = nativeFindFieldParameters,
                    returnType = "Ljava/lang/String;"
                )
                val nativePeerConnectionMethod = originalMethod.cloneMutable(
                    parameters = nativePeerConnectionParameters
                )

                bridgeMethod = ImmutableMethod(
                    type,
                    "patch_nativeCreatePeerConnectionFactory",
                    nativePeerConnectionParameters,
                    PEER_CONNECTION_FACTORY_CLASS,
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.BRIDGE.value or AccessFlags.SYNTHETIC.value,
                    null,
                    null,
                    MutableMethodImplementation(21),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            invoke-static/range { p0 .. p19 }, $nativePeerConnectionMethod
                            move-result-object v0
                            return-object v0
                        """
                    )
                }

                val findFieldMethod = ImmutableMethod(
                    type,
                    "fieldTrialsFindFullName",
                    nativeFindFieldParameters,
                    "Ljava/lang/String;",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(3),
                ).toMutable().apply {
                    addInstructionsWithLabels(
                        0,
                        """
                            invoke-static { }, Lorg/webrtc/NativeLibrary;->isLoaded()Z
                            move-result v0
                            if-eqz v0, :ignore
                            invoke-static { p0 }, $nativeFindFieldMethod
                            move-result-object v0
                            return-object v0
                            :ignore
                            const-string v0, ""
                            return-object v0
                        """
                    )
                }

                methods.remove(originalMethod)
                methods.add(bridgeMethod)
                methods.add(findFieldMethod)
                methods.add(nativeFindFieldMethod)
                methods.add(nativePeerConnectionMethod)
            }
        }

        val checkInitializeHasBeenCalledMethod = PeerConnectionFactoryBuilderFingerprint
            .getReference<MethodReference>()

        PeerConnectionFactoryBuilderFingerprint.let {
            val checkInitializeHasBeenCalledMethod = it.getReference<MethodReference>()
            val originalMethod = it.method

            val helperMethod = ImmutableMethod(
                originalMethod.definingClass,
                originalMethod.name,
                listOf(),
                originalMethod.returnType,
                originalMethod.accessFlags,
                null,
                null,
                MutableMethodImplementation(26),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    $$$"""
                        move-object/from16 v0, p0
                        invoke-static { }, $$$checkInitializeHasBeenCalledMethod
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->audioDeviceModule:Lorg/webrtc/audio/AudioDeviceModule;
                        if-nez v1, :ignore_0
                        invoke-static { }, Lorg/webrtc/ContextUtils;->getApplicationContext()Landroid/content/Context;
                        move-result-object v1
                        invoke-static { v1 }, Lorg/webrtc/audio/JavaAudioDeviceModule;->builder(Landroid/content/Context;)Lorg/webrtc/audio/JavaAudioDeviceModule$Builder;
                        move-result-object v1
                        invoke-virtual { v1 }, Lorg/webrtc/audio/JavaAudioDeviceModule$Builder;->createAudioDeviceModule()Lorg/webrtc/audio/JavaAudioDeviceModule;
                        move-result-object v1
                        iput-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->audioDeviceModule:Lorg/webrtc/audio/AudioDeviceModule;
                        :ignore_0
                        invoke-static { }, Lorg/webrtc/ContextUtils;->getApplicationContext()Landroid/content/Context;
                        move-result-object v2
                        iget-object v3, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->options:Lorg/webrtc/PeerConnectionFactory$Options;
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->audioDeviceModule:Lorg/webrtc/audio/AudioDeviceModule;
                        invoke-interface { v1 }, Lorg/webrtc/audio/AudioDeviceModule;->getNativeAudioDeviceModulePointer()J
                        move-result-wide v4
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->audioEncoderFactoryFactory:Lorg/webrtc/AudioEncoderFactoryFactory;
                        invoke-interface { v1 }, Lorg/webrtc/AudioEncoderFactoryFactory;->createNativeAudioEncoderFactory()J
                        move-result-wide v6
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->audioDecoderFactoryFactory:Lorg/webrtc/AudioDecoderFactoryFactory;
                        invoke-interface {v1}, Lorg/webrtc/AudioDecoderFactoryFactory;->createNativeAudioDecoderFactory()J
                        move-result-wide v8
                        iget-object v10, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->videoEncoderFactory:Lorg/webrtc/VideoEncoderFactory;
                        iget-object v11, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->videoDecoderFactory:Lorg/webrtc/VideoDecoderFactory;
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->audioProcessingFactory:Lorg/webrtc/AudioProcessingFactory;
                        const-wide/16 v12, 0x0
                        if-nez v1, :ignore_1
                        move-wide v14, v12
                        goto :jump_0
                        :ignore_1
                        invoke-interface { v1 }, Lorg/webrtc/AudioProcessingFactory;->createNative()J
                        move-result-wide v14
                        :jump_0
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->fecControllerFactoryFactory:Lorg/webrtc/FecControllerFactoryFactoryInterface;
                        if-nez v1, :ignore_2
                        move-wide/from16 v16, v12
                        goto :jump_1
                        :ignore_2
                        invoke-interface { v1 }, Lorg/webrtc/FecControllerFactoryFactoryInterface;->createNative()J
                        move-result-wide v16
                        :jump_1
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->networkControllerFactoryFactory:Lorg/webrtc/NetworkControllerFactoryFactory;
                        if-nez v1, :ignore_3
                        move-wide/from16 v18, v12
                        goto :jump_2
                        :ignore_3
                        invoke-interface { v1 }, Lorg/webrtc/NetworkControllerFactoryFactory;->createNativeNetworkControllerFactory()J
                        move-result-wide v18
                        :jump_2
                        iget-object v1, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->networkStatePredictorFactoryFactory:Lorg/webrtc/NetworkStatePredictorFactoryFactory;
                        if-nez v1, :ignore_4
                        move-wide/from16 v20, v12
                        goto :jump_3
                        :ignore_4
                        invoke-interface { v1 }, Lorg/webrtc/NetworkStatePredictorFactoryFactory;->createNativeNetworkStatePredictorFactory()J
                        move-result-wide v20
                        :jump_3
                        iget-object v0, v0, Lorg/webrtc/PeerConnectionFactory$Builder;->neteqFactoryFactory:Lorg/webrtc/NetEqFactoryFactory;
                        if-nez v0, :ignore_5
                        goto :jump_4
                        :ignore_5
                        invoke-interface { v0 }, Lorg/webrtc/NetEqFactoryFactory;->createNativeNetEqFactory()J
                        move-result-wide v12
                        :jump_4
                        move-wide/from16 v22, v20
                        move-wide/from16 v20, v12
                        move-wide v12, v14
                        move-wide/from16 v14, v16
                        move-wide/from16 v16, v18
                        move-wide/from16 v18, v22
                        invoke-static/range { v2 .. v21 }, $$$bridgeMethod
                        move-result-object v0
                        return-object v0
                    """
                )
            }

            it.classDef.methods.remove(originalMethod)
            it.classDef.methods.add(helperMethod)
        }

        val helperMethodName = "getNativeAudioDeviceModulePointer"

        AudioDeviceModuleFingerprint.let {
            val originalMethod = it.method
            val abstractMethod = originalMethod.cloneMutable(
                name = helperMethodName,
                parameters = listOf()
            )

            it.classDef.methods.remove(originalMethod)
            it.classDef.methods.add(abstractMethod)
        }

        val nativeMethod : MutableMethod

        NativeCreateAudioDeviceModuleFingerprint.let {
            val nativeParameters = listOf(
                ImmutableMethodParameter("Landroid/content/Context;", null, null),
                ImmutableMethodParameter("Landroid/media/AudioManager;", null, null),
                ImmutableMethodParameter("Lorg/webrtc/audio/WebRtcAudioRecord;", null, null),
                ImmutableMethodParameter("Lorg/webrtc/audio/WebRtcAudioTrack;", null, null),
                ImmutableMethodParameter("I", null, null),
                ImmutableMethodParameter("I", null, null),
                ImmutableMethodParameter("Z", null, null),
                ImmutableMethodParameter("Z", null, null),
            )

            val originalMethod = it.method
            nativeMethod = originalMethod.cloneMutable(
                parameters = nativeParameters
            )

            it.classDef.methods.remove(originalMethod)
            it.classDef.methods.add(nativeMethod)
        }

        JavaAudioDeviceModuleFingerprint.let {
            it.method.apply {
                val startIndex = it.instructionMatches[0].index
                val endIndex = it.instructionMatches[8].index

                val startRegister = getInstruction<TwoRegisterInstruction>(startIndex).registerA
                var register = startRegister

                for (i in startIndex until endIndex) {
                    val ins = getInstruction(i) as Instruction22c

                    replaceInstruction(
                        i,
                        "${ins.opcode.name} v${register++}, v${ins.registerB}, ${ins.reference}"
                    )
                }

                replaceInstruction(
                    endIndex,
                    "nop"
                )
                replaceInstruction(
                    endIndex + 1,
                    "invoke-static/range { v$startRegister .. v${register - 1} }, $nativeMethod"
                )

                // cloneMutable does not allow negative additional registers.
                val newRegisterCount = implementation!!.registerCount - 2
                val helperMethod = cloneMethod(
                    registerCount = newRegisterCount,
                    name = helperMethodName,
                    parameters = listOf(),
                ).apply {
                    val lastIndex = implementation!!.instructions.lastIndex
                    val freeRegister = newRegisterCount - 3

                    for (index in lastIndex downTo 0) {
                        val ins = getInstruction(index)
                        val isOneRegisterInstruction = ins is Instruction11x
                        val isTwoRegisterInstruction = ins is Instruction22c
                        if (isOneRegisterInstruction || isTwoRegisterInstruction) {
                            if (ins.registerA == newRegisterCount) {
                                replaceInstruction(
                                    index,
                                    if (isTwoRegisterInstruction) {
                                        "${ins.opcode.name} v$freeRegister, v${ins.registerB}, ${ins.reference}"
                                    } else {
                                        "${ins.opcode.name} v$freeRegister"
                                    }
                                )
                            }
                        }
                    }
                }

                it.classDef.methods.remove(this)
                it.classDef.methods.add(helperMethod)
            }
        }

        PeerConnectionRTCConfigurationFingerprint.let {
            it.classDef.apply {
                val activeResetSrtpParamsField = ImmutableField(
                    type,
                    "activeResetSrtpParams",
                    "Z",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    null
                ).toMutable()

                val activeResetSrtpParamsMethod = ImmutableMethod(
                    type,
                    "getActiveResetSrtpParams",
                    listOf(),
                    "Z",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            iget-boolean v0, p0, $activeResetSrtpParamsField
                            return v0
                        """
                    )
                }

                fields.add(activeResetSrtpParamsField)
                methods.add(activeResetSrtpParamsMethod)

                it.method.apply {
                    val index = it.instructionMatches.first().index
                    val register = getInstruction<TwoRegisterInstruction>(index).registerA

                    addInstruction(
                        index,
                        "iput-boolean v$register, p0, $activeResetSrtpParamsField"
                    )
                }
            }
        }
    }
}
