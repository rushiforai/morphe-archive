package app.morphe.patches.reddit.customclients.sync.syncforreddit.ultra

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patcher.Fingerprint
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PREVIEW_PICTURE_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/http/posts/WebsitePreviewImagePatch;"

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ultra/UltraFeatures;"

private const val YES_METHOD = "yes()Z"

private const val WEBSITE_PREVIEW_METHOD = "websitePreviewFor(Ljava/lang/String;)Z"


/** Whether the copy is paid for. Asked in more than forty places, and answered in six. */
private const val PAID_FOR = "Luc/b;"

private const val PAID_FOR_METHOD = "j"

/**
 * Whether a flag was turned on from afar. There are several; this is the one that stands beside
 * the features that were finished but never given out, and it is off for everyone.
 */
private const val FROM_AFAR = "Lt7/d0;"

private const val FROM_AFAR_METHOD = "d"

/** What the developer's own accounts are named with, which nobody else's are. */
private const val A_DEVELOPER_ACCOUNT = ".AO-"

private const val ASKS_ABOUT_THE_ACCOUNT = "containsIgnoreCase"

/** How far after the first question the other two are asked. */
private const val WITHIN = 8
private const val AND_THE_ACCOUNT_WITHIN = 24

/** Where whether to show a preview of a website is decided. */
private const val DECIDES_A_PREVIEW = "Lwc/q;"

/**
 * Features finished, shipped, and then kept back from everyone: behind the subscription, behind
 * a flag that was never turned on, and behind an account only the developer has. All three are
 * asked together, and none of the three has anything to say about whether the feature works.
 */
private val KEPT_BACK_FROM_EVERYONE = listOf(
    // Reading text out of an image, which a library on the device does.
    "Lcom/laurencedawson/reddit_sync/ui/fragments/ImageViewerFragment;" to "o2",
    // Tagging a user, which is written down on this device. What carries tags to Sync's own
    // servers is left alone, since those no longer answer.
    "Lt9/s;" to "A4",
)

/**
 * Features behind the subscription alone, each asked about once where it is offered.
 */
private val BEHIND_THE_SUBSCRIPTION = listOf(
    // Following a link past Google's copy of a page to the page itself.
    "Lmb/d;" to "onClick",
    // Reaching a video without the joke in front of it.
    "Ly7/c;" to "v",
    // Opening the app logged out, which is a setting about this device.
    "Lcom/laurencedawson/reddit_sync/ui/activities/HomeActivity;" to "l0",
    // The offer to buy it, shown to anyone without it — which is everyone, and it cannot be
    // bought through the app any more. Answering yes is what takes the offer away.
    "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/AccountPickerFragment;" to "o2",
)

@Suppress("unused")
val unlockUltraPatch = bytecodePatch(
    name = "Unlock Sync Ultra",
    description = "Turns on the Sync Ultra features that work on the device alone, and removes " +
            "the offers to buy it.",
    default = true,
) {
    dependsOn(sharedExtensionPatch, ultraSettingsPatch, interceptHttpRequests)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        val yes = "invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->$YES_METHOD"

        fun asked(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
                  where: String, named: String): Boolean {
            val called = instruction.getReference<MethodReference>() ?: return false
            return called.definingClass == where && called.name == named
        }

        /**
         * @param alsoFromAfar Whether the feature is one of those kept back from everyone, which
         *                     is told by the flag being asked about right after the subscription.
         *                     Where it is not, the subscription is the only question there is.
         */
        fun unlock(where: String, named: String, alsoFromAfar: Boolean): Int {
            var answered = 0

            mutableClassDefBy(where).methods
                .filter { it.name == named && it.implementation != null }
                .forEach { method ->
                    val instructions = method.implementation!!.instructions.toList()

                    instructions.forEachIndexed { at, instruction ->
                        if (!asked(instruction, PAID_FOR, PAID_FOR_METHOD)) return@forEachIndexed

                        val flag = (at + 1 until minOf(at + WITHIN, instructions.size))
                            .firstOrNull { asked(instructions[it], FROM_AFAR, FROM_AFAR_METHOD) }

                        // A feature kept back from everyone is told by all three being asked
                        // together. One question on its own is guarding something else, which
                        // is not for this patch to answer.
                        if (alsoFromAfar != (flag != null)) return@forEachIndexed

                        method.replaceInstruction(at, yes)
                        answered++

                        if (flag == null) return@forEachIndexed
                        method.replaceInstruction(flag, yes)
                        answered++

                        (flag + 1 until minOf(flag + AND_THE_ACCOUNT_WITHIN, instructions.size))
                            .firstOrNull { about ->
                                instructions[about].getReference<MethodReference>()?.name ==
                                        ASKS_ABOUT_THE_ACCOUNT &&
                                        about > 0 &&
                                        instructions[about - 1].getReference<StringReference>()
                                            ?.string == A_DEVELOPER_ACCOUNT
                            }
                            ?.let { about ->
                                method.replaceInstruction(about, yes)
                                answered++
                            }
                    }
                }

            return answered
        }

        KEPT_BACK_FROM_EVERYONE.forEach { (where, named) ->
            if (unlock(where, named, true) == 0) {
                throw PatchException("Nothing is kept back from everyone in $where->$named")
            }
        }

        BEHIND_THE_SUBSCRIPTION.forEach { (where, named) ->
            if (unlock(where, named, false) == 0) {
                throw PatchException("Nothing is behind the subscription in $where->$named")
            }
        }

        // The picture beside a previewed link is asked of Sync's own proxy, which refuses
        // everything. What answers instead reads the page and asks it what picture it names.
        Fingerprint(
            definingClass = PREVIEW_PICTURE_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)


        // Showing a preview of a website asks all three and then asks the setting for it. Only
        // the setting is worth asking, so it is asked on its own.
        mutableClassDefBy(DECIDES_A_PREVIEW).methods
            .single { it.name == "a" && it.parameters.size == 1 && it.returnType == "Z" }
            .addInstructions(
                0,
                """
                invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$WEBSITE_PREVIEW_METHOD
                move-result v0
                return v0
                """
            )
    }
}
