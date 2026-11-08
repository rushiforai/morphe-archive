package io.github.sazap10.patches.sync.targetsdk

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.util.logging.Logger

private const val EXTENSION_PACKAGE = "Lio/github/sazap10/extension/"
private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}sync/ReceiverFlags;"

private const val BROADCAST_RECEIVER = "Landroid/content/BroadcastReceiver;"
private const val INTENT_FILTER = "Landroid/content/IntentFilter;"

/**
 * Receivers that must accept broadcasts sent by another app. Everything else only receives
 * broadcasts from Sync itself or from system_server, which RECEIVER_NOT_EXPORTED still allows.
 *
 * Matched by package prefix or by a string in the registering method, not by obfuscated name.
 */
private fun needsExport(classDef: ClassDef, method: Method): Boolean {
    // Play Billing: PURCHASES_UPDATED is sent by the Play Store.
    if (classDef.type.startsWith("Lcom/android/billingclient/")) return true
    // Play Core install/update state listeners: broadcasts come from the Play Store.
    if (classDef.type.startsWith("Lcom/google/android/play/core/listener/")) return true

    val strings = (method.implementation?.instructions ?: emptyList())
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    return strings.any {
        // ML Kit model downloads: DOWNLOAD_COMPLETE is sent by the DownloadManager provider.
        it == "android.intent.action.DOWNLOAD_COMPLETE" ||
            // Mobile Ads debug toggle, sent by Google Play services.
            it == "com.google.android.ads.intent.DEBUG_LOGGING_ENABLEMENT_CHANGED"
    }
}

/** Matches `Context.registerReceiver(...)` overloads on Context or any Context subclass. */
private fun Instruction.registerReceiverCall(): MethodReference? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    if (reference.name != "registerReceiver") return null
    if (reference.returnType != "Landroid/content/Intent;") return null
    val parameters = reference.parameterTypes.map(CharSequence::toString)
    if (parameters.size < 2 || parameters[0] != BROADCAST_RECEIVER || parameters[1] != INTENT_FILTER) return null
    // Remaining parameters: (), (I), (String, Handler) or (String, Handler, I).
    val rest = parameters.drop(2)
    val known = listOf(
        emptyList(),
        listOf("I"),
        listOf("Ljava/lang/String;", "Landroid/os/Handler;"),
        listOf("Ljava/lang/String;", "Landroid/os/Handler;", "I"),
    )
    if (rest !in known) throw PatchException("Unexpected registerReceiver overload: $reference")
    return reference
}

internal val receiverExportFlagsPatch = patch(
    description = "Adds RECEIVER_EXPORTED or RECEIVER_NOT_EXPORTED to every runtime receiver registration.",
) {
    extendWith("extensions/sync.mpe")

    // Runs in finalize so code added by other patches and bundles is covered too.
    finalize {
        data class Site(val classDef: ClassDef, val method: Method, val index: Int, val exported: Boolean)

        val sites = mutableListOf<Site>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions ?: continue
                var exported: Boolean? = null
                instructions.forEachIndexed { index, instruction ->
                    instruction.registerReceiverCall() ?: return@forEachIndexed
                    val export = exported ?: needsExport(classDef, method).also { exported = it }
                    sites += Site(classDef, method, index, export)
                }
            }
        }

        if (sites.isEmpty()) throw PatchException("No registerReceiver call sites found")

        sites.groupBy { it.classDef.type }.forEach { (type, classSites) ->
            val mutableClass = mutableClassDefBy(type)
            classSites.forEach { site ->
                val mutableMethod = mutableClass.methods.first { MethodUtil.methodSignaturesMatch(it, site.method) }
                val original = mutableMethod.implementation!!.instructions[site.index]
                val target = original.registerReceiverCall()
                    ?: throw PatchException("Call site moved in ${site.method}")

                val helper = ImmutableMethodReference(
                    EXTENSION_CLASS,
                    if (site.exported) "registerExported" else "registerNotExported",
                    listOf("Landroid/content/Context;") + target.parameterTypes.map(CharSequence::toString),
                    "Landroid/content/Intent;",
                )

                // The receiver object becomes the first argument, so the registers stay the same.
                val replacement = when (original) {
                    is Instruction35c -> BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        original.registerCount,
                        original.registerC,
                        original.registerD,
                        original.registerE,
                        original.registerF,
                        original.registerG,
                        helper,
                    )

                    is Instruction3rc -> BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE,
                        original.startRegister,
                        original.registerCount,
                        helper,
                    )

                    else -> throw PatchException("Unexpected instruction format at ${site.method}")
                }
                mutableMethod.replaceInstruction(site.index, replacement)
            }
        }

        Logger.getLogger("ReceiverExportFlags").info(
            "Rewrote ${sites.size} registerReceiver calls (${sites.count { it.exported }} exported): " +
                sites.joinToString { "${it.classDef.type}->${it.method.name}[${if (it.exported) "E" else "N"}]" },
        )
    }
}
