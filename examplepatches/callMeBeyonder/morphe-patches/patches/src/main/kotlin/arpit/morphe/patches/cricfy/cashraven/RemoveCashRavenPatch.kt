package arpit.morphe.patches.cricfy.cashraven

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import arpit.morphe.patches.cricfy.shared.Constants.COMPATIBILITY_CRICFY_TV
import arpit.morphe.patches.cricfy.shared.repairInvalidArrayPayloads
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x

/**
 * Kills the CashRaven bandwidth-sharing SDK (`io.cashraven.sdk`).
 *
 * The app ships CashRaven 4.1.31 — a passive P2P CDN: the device relays other
 * viewers' traffic (and its own bandwidth) in exchange for "free" streaming. The SDK
 * is also the app's boot-persistence surface (`CrBootReceiver` re-starts the
 * foreground `CashRavenService` on `BOOT_COMPLETED`).
 *
 * Instead of early-returning in `App.a()` (which would leave `App.p` null and crash
 * the drawer menu, which calls `app.b().isOptedIn()`), the SDK's own entry points are
 * stubbed. The object is still constructed, so every caller keeps a valid instance,
 * but sharing can never be switched on and the service can never run:
 * - `CashRaven.optIn()` / `start()` / `resume()` / `setEnabled(Z)` become no-ops,
 * - `CashRavenService.Companion.start(Context)` never starts the service,
 * - `CashRavenService.onStartCommand(...)` returns `START_NOT_STICKY` if the system
 *   ever restarts the (previously running) service,
 * - `CrBootReceiver.onReceive(...)` becomes a no-op, so nothing is re-armed on boot,
 * - the drawer menu entry that opens the sharing/consent flow is hidden.
 *
 * The SDK classes are readable (not R8-renamed) because the library ships with its
 * own keep rules; a build without them (SDK dropped upstream) makes this patch a
 * no-op instead of failing.
 */
@Suppress("unused")
val removeCashRavenPatch = bytecodePatch(
    name = "Remove bandwidth sharing (CashRaven)",
    description = "Disables the CashRaven P2P bandwidth-sharing SDK: no opt-in, no " +
        "background sharing service, no restart on boot, and the sharing menu entry is " +
        "hidden.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    execute {
        // A build that dropped the SDK has nothing to remove.
        if (classDefByOrNull("Lio/cashraven/sdk/CashRaven;") == null) return@execute

        // The R8 build leaves an invalid dead-code `array-data` payload in every method
        // of these classes; dexlib2 refuses to materialize them until they are repaired.
        repairInvalidArrayPayloads(
            *CASHRAVEN_CLASSES.filter { classType -> classDefByOrNull(classType) != null }
                .toTypedArray(),
        )

        var patched = 0

        for (target in NO_OP_TARGETS) {
            val method = mutableMethodOrNull(
                classType = target.classType,
                name = target.name,
                returnType = target.returnType,
                parameters = target.parameters,
            ) ?: continue
            method.addInstructions(0, "return-void")
            patched++
        }

        // `startCommand` must still return an int; START_NOT_STICKY = 2.
        mutableMethodOrNull(
            classType = "Lio/cashraven/sdk/CashRavenService;",
            name = "onStartCommand",
            returnType = "I",
            parameters = listOf("Landroid/content/Intent;", "I", "I"),
        )?.let { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x2
                    return v0
                """,
            )
            patched++
        }

        hideCashRavenMenuEntry()

        check(patched > 0) {
            "No CashRaven entry point was found; the SDK layout changed."
        }
    }
}

/** Classes whose invalid `array-data` payloads must be repaired before patching. */
private val CASHRAVEN_CLASSES = arrayOf(
    "Lio/cashraven/sdk/CashRaven;",
    "Lio/cashraven/sdk/CashRavenService;",
    "Lio/cashraven/sdk/CashRavenService\$Companion;",
    "Lio/cashraven/sdk/CrBootReceiver;",
    // Shares the drawer menu entry patch with the ad patches.
    "Lcom/android/vending/activities/MainActivity;",
)

private class NoOpTarget(
    val classType: String,
    val name: String,
    val returnType: String,
    val parameters: List<String>,
)

/**
 * Everything that can switch sharing on. `optIn` is what `App.a()` and the consent
 * dialog call; `start`/`resume`/`setEnabled` are the other public switches of the SDK.
 */
private val NO_OP_TARGETS = listOf(
    NoOpTarget("Lio/cashraven/sdk/CashRaven;", "optIn", "V", emptyList()),
    NoOpTarget("Lio/cashraven/sdk/CashRaven;", "start", "V", emptyList()),
    NoOpTarget("Lio/cashraven/sdk/CashRaven;", "resume", "V", emptyList()),
    NoOpTarget("Lio/cashraven/sdk/CashRaven;", "setEnabled", "V", listOf("Z")),
    NoOpTarget(
        "Lio/cashraven/sdk/CashRavenService\$Companion;",
        "start",
        "V",
        listOf("Landroid/content/Context;"),
    ),
    NoOpTarget(
        "Lio/cashraven/sdk/CrBootReceiver;",
        "onReceive",
        "V",
        listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    ),
)

/**
 * Hides the drawer menu item that opens the sharing consent flow: the item's
 * visibility is the `getBoolean("cashraven_enabled", true)` result, so the
 * `move-result` is replaced with `const/4 vX, 0x0`.
 */
private fun BytecodePatchContext.hideCashRavenMenuEntry() {
    if (classDefByOrNull("Lcom/android/vending/activities/MainActivity;") == null) return
    val mainActivity = mutableClassDefBy("Lcom/android/vending/activities/MainActivity;")

    val method = mainActivity.methods.firstOrNull { method ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "cashraven_enabled"
        } == true
    } ?: return

    val instructions = method.instructions
    val stringIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_STRING &&
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
            "cashraven_enabled"
    }
    check(stringIndex >= 0) { "The cashraven_enabled read disappeared from MainActivity." }

    val moveResultIndex = (stringIndex until instructions.size).firstOrNull { index ->
        instructions[index].opcode == Opcode.MOVE_RESULT
    } ?: error("No getBoolean result follows the cashraven_enabled read.")

    val register = (instructions[moveResultIndex] as Instruction11x).registerA
    method.replaceInstruction(moveResultIndex, BuilderInstruction11n(Opcode.CONST_4, register, 0))
}

/**
 * Resolves a method of an already-repaired class. Returns null when the class or the
 * method does not exist, so an SDK update can never fail the whole patch.
 */
private fun BytecodePatchContext.mutableMethodOrNull(
    classType: String,
    name: String,
    returnType: String,
    parameters: List<String>,
): MutableMethod? {
    if (classDefByOrNull(classType) == null) return null
    return mutableClassDefBy(classType).methods.firstOrNull { method ->
        method.name == name &&
            method.returnType == returnType &&
            method.parameterTypes.map(CharSequence::toString) == parameters
    }
}
