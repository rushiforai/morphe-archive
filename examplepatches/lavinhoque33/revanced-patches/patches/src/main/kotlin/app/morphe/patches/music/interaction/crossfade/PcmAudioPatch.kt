/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-12.
 * Modified by lavinhoque33, 2026-11-13.
 */

package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.playservice.is_9_00_or_greater
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private const val STATE = "$PCM_ADAPTER->state:Ljava/lang/Object;"
private const val OBJECT = "Ljava/lang/Object;"
private const val BUFFER = "Ljava/nio/ByteBuffer;"
private const val STRING = "Ljava/lang/String;"

private data class PcmMethodEdit(
    val method: MutableMethod,
    val edit: MutableMethod.() -> Unit,
) {
    fun install() {
        method.edit()
    }
}

private data class PcmInstallation(
    val adapter: MutableClass,
    val processorType: String,
    val adapterMethods: List<MutableMethod>,
    val edits: List<PcmMethodEdit>,
    val branchCount: Int,
    val sinkOwner: MutableClass,
    val sinkMethods: List<MutableMethod>,
) {
    fun install() {
        // Discovery reads only complete member sets, never Patcher's cached partitioned views.
        // Keep those views lazy so later patches can still add members to any scanned class.
        adapter.methods.clear()
        adapter.methods.addAll(adapterMethods)
        adapter.interfaces.add(processorType)
        sinkOwner.methods.addAll(sinkMethods)
        edits.forEach { it.install() }
    }
}

private fun adapterMethod(
    name: String,
    parameters: List<String>,
    result: String,
    registers: Int,
    body: String,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    owner: String = PCM_ADAPTER,
): MutableMethod = ImmutableMethod(
    owner,
    name,
    parameters.map { ImmutableMethodParameter(it, null, null) },
    result,
    flags,
    null,
    null,
    MutableMethodImplementation(registers),
).toMutable().apply { addInstructions(0, body) }

/** No reflection/proxy invocation or argument-array allocations occur on the audio thread. */
private fun createAdapterMethods(abi: PcmNativeAbi): List<MutableMethod> {
    val nativeArray = "[${abi.processorType}"
    val methods = mutableListOf(
        adapterMethod(
            "<init>", emptyList(), "V", 2,
            """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                invoke-static {}, $PCM_BRIDGE->create()Ljava/lang/Object;
                move-result-object v0
                iput-object v0, p0, $STATE
                return-void
            """,
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
        ),
        adapterMethod(
            "install", listOf(nativeArray), "V", 3,
            """
                array-length v0, p0
                add-int/lit8 v0, v0, -0x1
                new-instance v1, $PCM_ADAPTER
                invoke-direct {v1}, $PCM_ADAPTER-><init>()V
                aput-object v1, p0, v0
                return-void
            """,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        ),
        adapterMethod(
            "sinkConfigured", listOf(nativeArray, OBJECT, STRING), "V", 4,
            """
                array-length v0, p0
                add-int/lit8 v0, v0, -0x1
                aget-object v0, p0, v0
                check-cast v0, $PCM_ADAPTER
                iget-object v0, v0, $STATE
                invoke-static {v0, p1, p2}, $PCM_BRIDGE->sinkConfigured($OBJECT$OBJECT$STRING)V
                return-void
            """,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        ),
        adapterMethod("a", listOf("J"), "J", 3, "return-wide p1"),
        adapterMethod(
            "b", listOf(abi.formatType), abi.formatType, 6,
            """
                iget-object v0, p0, $STATE
                iget v1, p1, ${abi.sampleRate}
                iget v2, p1, ${abi.channelCount}
                iget v3, p1, ${abi.encoding}
                invoke-static {v0, v1, v2, v3}, $PCM_BRIDGE->configure(Ljava/lang/Object;III)Z
                move-result v0
                if-eqz v0, :unsupported
                return-object p1
                :unsupported
                sget-object v0, ${abi.notSet}
                return-object v0
            """,
        ),
        adapterMethod(
            "c", emptyList(), BUFFER, 2,
            """
                iget-object v0, p0, $STATE
                invoke-static {v0}, $PCM_BRIDGE->getOutput(Ljava/lang/Object;)Ljava/nio/ByteBuffer;
                move-result-object v0
                return-object v0
            """,
        ),
        adapterMethod(
            "f", listOf(BUFFER), "V", 3,
            """
                iget-object v0, p0, $STATE
                invoke-static {v0, p1}, $PCM_BRIDGE->queueInput(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
                return-void
            """,
        ),
    )
    // d is the deprecated flush entry; j is its current equivalent. g is reset, not flush.
    listOf("d" to "flush", "e" to "queueEndOfStream", "g" to "reset", "j" to "flush")
        .forEach { (native, bridge) ->
            methods.add(
                adapterMethod(
                    native, emptyList(), "V", 2,
                    """
                        iget-object v0, p0, $STATE
                        invoke-static {v0}, $PCM_BRIDGE->$bridge(Ljava/lang/Object;)V
                        return-void
                    """,
                ),
            )
        }
    listOf("h" to "isActive", "i" to "isEnded").forEach { (native, bridge) ->
        methods.add(
            adapterMethod(
                native, emptyList(), "Z", 2,
                """
                    iget-object v0, p0, $STATE
                    invoke-static {v0}, $PCM_BRIDGE->$bridge(Ljava/lang/Object;)Z
                    move-result v0
                    return v0
                """,
            ),
        )
    }
    return methods
}

private fun BytecodePatchContext.preparePcmInstallation(discovery: PcmDiscovery): PcmInstallation {
    fun validatedEdit(original: Method, edit: MutableMethod.() -> Unit): PcmMethodEdit {
        val owner = mutableClassDefBy(original.definingClass)
        val live = owner.methods.single {
            it.name == original.name && it.parameterTypes == original.parameterTypes
                && it.returnType == original.returnType
        }
        // Assemble against a detached copy first, then edit the same live member in place.
        ImmutableMethod.of(live).toMutable().apply(edit)
        return PcmMethodEdit(live, edit)
    }

    val nativeArray = "[${discovery.abi.processorType}"
    val chain = validatedEdit(discovery.chainConstructor) {
        // Expand the existing single allocation; retain custom -> silence -> speed -> gain ordering.
        replaceInstruction(
            discovery.chainSizeIndex,
            "add-int/lit8 v${discovery.chainSize.registerA}, v${discovery.chainSize.registerB}, 0x3",
        )
        addInstructions(
            discovery.chainFinalStoreIndex + 1,
            "invoke-static {v${discovery.chainArrayRegister}}, $PCM_ADAPTER->install($nativeArray)V",
        )
    }
    val factory = validatedEdit(discovery.factory) {
        val instructions = implementation!!.instructions.toList()
        instructions.indices.reversed().forEach { index ->
            when (instructions[index].opcode) {
                Opcode.RETURN_OBJECT -> {
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    addInstructions(
                        index,
                        "invoke-static/range {v$register .. v$register}, " +
                            "$PCM_BRIDGE->endPlayer(Ljava/lang/Object;)V",
                    )
                }
                Opcode.THROW -> addInstructions(index, "invoke-static {}, $PCM_BRIDGE->cancelPlayer()V")
                else -> Unit
            }
        }
        // This native factory is shared by initial playback and the crossfade factory bridge.
        addInstructions(0, "invoke-static {}, $PCM_BRIDGE->beginPlayer()V")
    }
    val sinkType = discovery.sinkConfigure.definingClass
    val configurationName = "patch_reportPcmConfiguration"
    val formatType = discovery.sampleMime.definingClass
    val configurationReporter = adapterMethod(
        configurationName, listOf(formatType), "V", 5,
        """
            iget-object v0, p0, ${discovery.sinkChain}
            iget-object v0, v0, ${discovery.chainArray}
            check-cast v0, $nativeArray
            iget-object v1, p1, ${discovery.sampleMime}
            invoke-static {v0, p0, v1}, $PCM_ADAPTER->sinkConfigured($nativeArray$OBJECT$STRING)V
            return-void
        """,
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        sinkType,
    )
    val sink = validatedEdit(discovery.sinkConfigure) {
        val instructions = implementation!!.instructions.toList()
        instructions.indices.reversed().forEach { index ->
            if (instructions[index].opcode == Opcode.RETURN_VOID) {
                // A native parameter slot need not retain its original type at a return. The
                // preceding store proves its receiver; discovery proves the source format's lifetime.
                val store = instructions.getOrNull(index - 1)
                check(store?.opcode == Opcode.IPUT_OBJECT &&
                    store.getReference<FieldReference>()?.definingClass == sinkType
                ) { "PCM sink exit has no proven receiver reference" }
                val receiver = (store as TwoRegisterInstruction).registerB
                check(receiver <= 15 && discovery.sinkFormatRegister <= 15) {
                    "PCM sink exit references exceed invoke-direct register encoding"
                }
                addInstructions(
                    index,
                    "invoke-direct {v$receiver, v${discovery.sinkFormatRegister}}, " +
                        "$sinkType->$configurationName($formatType)V",
                )
            }
        }
    }
    val telemetryName = "patch_reportPcmHead"
    val telemetry = adapterMethod(
        telemetryName, emptyList(), "V", 8,
        """
            iget-object v0, p0, ${discovery.sinkChain}
            iget-object v0, v0, ${discovery.chainArray}
            check-cast v0, $nativeArray
            array-length v1, v0
            add-int/lit8 v1, v1, -0x1
            aget-object v0, v0, v1
            check-cast v0, $PCM_ADAPTER
            iget-object v0, v0, $STATE
            iget-object v1, p0, ${discovery.outputHolder}
            instance-of v2, v1, ${discovery.nativeTrack.definingClass}
            if-eqz v2, :done
            check-cast v1, ${discovery.nativeTrack.definingClass}
            iget-object v2, v1, ${discovery.nativeTrack}
            if-eqz v2, :done
            invoke-static {v0, p0, v2}, $PCM_BRIDGE->beginPlayed($OBJECT$OBJECT$OBJECT)J
            move-result-wide v4
            invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I
            move-result v3
            invoke-static {v0, v2, v3, v4, v5}, $PCM_BRIDGE->played($OBJECT${OBJECT}IJ)V
            :done
            return-void
        """,
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        sinkType,
    )
    val position = validatedEdit(discovery.sinkPosition) {
        addInstructions(0, "invoke-direct/range {p0 .. p0}, $sinkType->$telemetryName()V")
    }
    val flush = validatedEdit(discovery.sinkFlush) {
        addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, ${discovery.sinkChain}
                iget-object v0, v0, ${discovery.chainArray}
                check-cast v0, $nativeArray
                array-length v1, v0
                add-int/lit8 v1, v1, -0x1
                aget-object v0, v0, v1
                check-cast v0, $PCM_ADAPTER
                iget-object v0, v0, $STATE
                invoke-static {v0}, $PCM_BRIDGE->sinkFlushed($OBJECT)V
            """,
        )
    }
    return PcmInstallation(
        mutableClassDefBy(discovery.adapter), discovery.abi.processorType, createAdapterMethods(discovery.abi),
        listOf(chain, factory, sink, position, flush), discovery.rendererBranchCount,
        mutableClassDefBy(sinkType), listOf(telemetry, configurationReporter),
    )
}

/**
 * Invoke after the owned native graph has passed preflight, before hooks or settings mutate the application.
 * Discovery and smali assembly finish on detached methods before any class/method is changed.
 */
internal fun BytecodePatchContext.installPcmCrossfade(discovery: PcmDiscovery): Boolean {
    if (!is_9_00_or_greater) {
        printWarn("Track crossfade PCM requires YouTube Music 9.00 or newer; leaving older playback unchanged.")
        return false
    }
    val installation = runCatching {
        preparePcmInstallation(discovery)
    }.getOrElse {
        printWarn("Track crossfade PCM discovery failed; leaving playback unchanged: ${it.message}")
        return false
    }
    installation.install()
    Logger.getLogger("Track crossfade PCM").info(
        "Installed concrete ${installation.processorType} PCM adapter after silence/speed; " +
            "covered ${installation.branchCount} coordinator sink branches and native cold/warm player factory.",
    )
    return true
}
