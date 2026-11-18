package patches.tidal

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import patches.shared.androidAutoHostVisibility

private const val BROWSER_REPOSITORY = "Lz72;"
private const val CLIENT = "Lcom/aspiro/wamp/mediabrowser/v2/MediaBrowserClient;"
private const val ROOT = "Landroidx/media/MediaBrowserServiceCompat\$BrowserRoot;"
private const val ROOT_MAP = "$BROWSER_REPOSITORY->c:Ljava/util/Map;"

/**
 * `z72.a(packageName, uid, client)` looks up the caller, checks its signature against TIDAL's
 * known-car list and returns a browser root only for trusted callers. A third-party host has a
 * different signing certificate, so the check rejected it before the car root was built.
 *
 * Keep the caller and root-map construction; only skip the verdict branch that turns the root
 * back into null. `onGetRoot` already passes the auto media client.
 */
@Suppress("unused")
val tidalCustomAndroidAutoHosts = bytecodePatch(
    name = "Allow custom Android Auto hosts",
    description = "Lets TIDAL's car media browser accept a third-party Android Auto host such as " +
        "DriveDeck or Gearslip. Only the host admission check changes; TIDAL's accounts, " +
        "subscription, catalogue and playback services stay active.",
    default = true,
) {
    compatibleWith(tidal)
    dependsOn(originalInput, androidAutoHostVisibility)

    execute {
        val owner = mutableClassDefBy(BROWSER_REPOSITORY)
        val method = owner.methods.singleOrNull { candidate ->
            candidate.name == "a" &&
                candidate.returnType == ROOT &&
                candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "I", CLIENT)
        } ?: throw IllegalStateException("TIDAL car browser admission method changed")

        val implementation = method.implementation
            ?: throw IllegalStateException("TIDAL car browser admission has no code")
        val last = implementation.instructions.size - 1
        val verdict = (0 until last).filter { index ->
            method.getInstruction(index).opcode == Opcode.IF_EQZ &&
                (method.getInstruction(index + 1) as? ReferenceInstruction)
                    ?.reference?.toString() == ROOT_MAP
        }
        check(verdict.size == 1) { "TIDAL car host verdict changed" }

        // Fall through to the existing root lookup instead of replacing the root with null.
        method.replaceInstruction(verdict.single(), "nop")
    }
}
