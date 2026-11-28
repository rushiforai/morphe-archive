package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val READ_RECEIPTS_ANCHOR = "ReadReceipts/sendReceiptForIncomingMessage ignoring key="
private const val SEND_READ_RECEIPT_JOB =
    "Lcom/whatsapp/messaging/receipts/jobqueue/job/SendReadReceiptJob;"
private const val JOB_QUEUE_PARAM = "Lorg/whispersystems/jobqueue/Job;"

/**
 * Stops outgoing read receipts (blue ticks) at the point where WhatsApp queues them.
 *
 * There are two send paths on 2.26.x:
 *  - a `Message`-based path used for single messages;
 *  - a `SendReadReceiptJob` queue used for batches/self receipts.
 *
 * We NOP only the queue calls and the small message-send helper. The surrounding
 * methods still update local read state, so the chat list does not keep everything
 * unread while no receipt goes to the server.
 */
@Suppress("unused")
val disableReadReceiptsPatch = bytecodePatch(
    name = "Read receipts",
    description = "Blocks outgoing read receipts (blue ticks). Local read state is kept.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    execute {
        val classes = classDefByStrings(READ_RECEIPTS_ANCHOR)
        if (classes.isEmpty()) {
            throw PatchException(
                "Read receipts: could not find the ReadReceipts class " +
                    "(anchor: \"$READ_RECEIPTS_ANCHOR\").",
            )
        }

        var queueCalls = 0
        var messageSends = 0

        for (def in classes) {
            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }

            for (method in clazz.methods) {
                if (method.name == "<init>" || method.name == "<clinit>") continue
                val impl = method.implementation ?: continue

                val buildsReadReceiptJob = impl.instructions.any { instruction ->
                    instruction.opcode == Opcode.NEW_INSTANCE &&
                        ((instruction as? ReferenceInstruction)?.reference?.toString() ==
                            SEND_READ_RECEIPT_JOB)
                }

                // Replace enqueue(job) calls with a NOP. The job object is simply unused.
                if (buildsReadReceiptJob) {
                    for ((index, instruction) in impl.instructions.withIndex()) {
                        val reference = (instruction as? ReferenceInstruction)?.reference
                            as? MethodReference ?: continue
                        if (reference.returnType != "V") continue
                        if (reference.parameterTypes.none {
                                it.toString() == JOB_QUEUE_PARAM ||
                                    it.toString() == SEND_READ_RECEIPT_JOB
                            }
                        ) {
                            continue
                        }
                        method.replaceInstruction(index, "nop")
                        queueCalls++
                    }
                }

                // The single-message helper is a tiny static method that only forwards
                // a Message to the connection writer. No local state lives here.
                if (method.returnType == "V" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0].toString() == "Landroid/os/Message;" &&
                    method.parameterTypes[1].toString() == clazz.type
                ) {
                    method.addInstructions(0, "return-void")
                    messageSends++
                }
            }
        }

        if (queueCalls == 0 && messageSends == 0) {
            throw PatchException("Read receipts: found the class but no send sites matched.")
        }
    }
}
