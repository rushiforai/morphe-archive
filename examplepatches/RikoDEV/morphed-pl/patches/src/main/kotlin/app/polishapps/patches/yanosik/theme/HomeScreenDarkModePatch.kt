package app.polishapps.patches.yanosik.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.shared.Constants.COMPATIBILITY_YANOSIK
import app.polishapps.patches.shared.Constants.YANOSIK_26_10_0
import app.polishapps.patches.shared.Constants.YANOSIK_26_9_0
import app.polishapps.patches.shared.MethodTarget
import app.polishapps.patches.shared.methodFingerprint
import app.polishapps.patches.shared.targetsFor
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DASHBOARD_ACTIVITY =
    "Lpl/neptis/yanosik/mobi/android/dashboard/dashboardpack/activity/DashboardPackActivity;"
private const val EXTENSION_CLASS = "Lapp/polishapps/extension/yanosik/DarkHomePatch;"

private data class DarkModeTargets(
    /** Composables that force light mode for their content. */
    val forcedLightMode: List<MethodTarget>,
    /** Home shortcuts tile adapter: creates (`createTile`) and binds (`bindTile`) each tile. */
    val tileAdapter: String,
    val createTile: String,
    val tileViewHolder: String,
    val bindTile: String,
    /** View binding of a tile, inflated in `createTile`. Field `e` is its root view. */
    val tileBinding: String,
)

private val targetsByVersion = mapOf(
    YANOSIK_26_9_0 to DarkModeTargets(
        forcedLightMode = listOf(
            // Starting screen fragment wrapper, the starting screen itself, and the report bar composable.
            MethodTarget("Ldg4;", "invoke", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;"),
            MethodTarget("Lnhc;", "l", listOf("Lrf4;", "Lu1c;", "Ldw4;", "Ly93;", "I"), "V"),
            MethodTarget("Lhz1;", "f", listOf("Lpgg;", "Llv7;", "Lu1c;", "Ly93;", "I"), "V"),
        ),
        tileAdapter = "Lso8;",
        createTile = "p",
        tileViewHolder = "Ln8g;",
        bindTile = "n",
        tileBinding = "Lpf;",
    ),
    YANOSIK_26_10_0 to DarkModeTargets(
        forcedLightMode = listOf(
            // Starting screen fragment wrapper and the report bar composable. The starting screen itself
            // (`nhc.l` in 26.9.0, now `ptf.i`) no longer overrides the mode.
            MethodTarget("Lrh4;", "invoke", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;"),
            MethodTarget("Lpzc;", "e", listOf("Limg;", "Lix7;", "Lo5c;", "Lpb3;", "I"), "V"),
        ),
        tileAdapter = "Lyr8;",
        createTile = "o",
        tileViewHolder = "Lndg;",
        bindTile = "n",
        tileBinding = "Lpf;",
    ),
)

/**
 * Removes a Compose override that hides dark mode from everything inside it.
 *
 * These composables copy the current configuration and run `uiMode = (uiMode & 0x30) | 0x10`. Night
 * (`0x20`) becomes `0x30`, which never counts as dark, so `Ly8;->c` always picks the light half of each
 * `Ll44` colour pair. Deleting the four instructions leaves an unmodified copy of the configuration, so
 * the code around them keeps working.
 */
private fun MutableMethod.removeForcedLightMode() {
    val snapshot = instructions.toList()
    val store = snapshot.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IPUT &&
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.name == "uiMode"
    }
    if (store < 3 ||
        snapshot[store - 3].opcode != Opcode.IGET ||
        snapshot[store - 2].opcode != Opcode.AND_INT_LIT8 ||
        snapshot[store - 1].opcode !in setOf(Opcode.OR_INT_LIT8, Opcode.OR_INT_2ADDR)
    ) {
        throw PatchException("$definingClass->$name: forced light mode pattern not found")
    }
    removeInstructions(store - 3, 4)
}

/**
 * Makes the home screen follow the system theme.
 *
 * Despite parts of the app using Flutter, the home screen (`DashboardPackActivity`) is Jetpack Compose
 * plus XML layouts. The Flutter module only contains the car marketplace, garage and debug screens, so
 * those stay light. `AppTheme` is already `DayNight` and the night mode default is "follow system",
 * which is why no setting needs changing here. Only the two things that block dark mode are patched.
 *
 * Obfuscated names change per release; see [targetsByVersion].
 */
@Suppress("unused")
val homeScreenDarkModePatch = bytecodePatch(
    name = "Home screen dark mode",
    description = "Makes the home screen follow the system light or dark theme.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANOSIK)

    extendWith("extensions/extension.mpe")

    execute {
        val targets = targetsFor(targetsByVersion)

        targets.forcedLightMode.forEach { target -> target.fingerprint().method.removeForcedLightMode() }

        // XML sections hardcode light colours with no night resource, so recolour them at runtime.
        val onCreate = methodFingerprint(
            DASHBOARD_ACTIVITY,
            "onCreate",
            parameters = listOf("Landroid/os/Bundle;"),
            returnType = "V",
        ).method
        val setContentView = onCreate.instructions.toList().indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setContentView"
        }
        if (setContentView < 0) {
            throw PatchException("DashboardPackActivity.onCreate: setContentView not found")
        }
        // `v1` holds the activity here: it is the receiver of the setContentView call being anchored to.
        onCreate.addInstruction(
            setContentView + 1,
            "invoke-static {v1}, $EXTENSION_CLASS->apply(Landroid/app/Activity;)V",
        )

        // Home shortcuts grid: the card and tiles are created after the hook above, so recolour them
        // where they are created. `p1` is the fragment's root view.
        methodFingerprint(
            "Lpl/neptis/features/servicesgrid/presentation/GridServicesFragment;",
            "onViewCreated",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
            returnType = "V",
        ).method.addInstruction(
            0,
            "invoke-static {p1}, $EXTENSION_CLASS->applyToView(Landroid/view/View;)V",
        )

        // Profile header: same timing as the grid. This covers the menu button and username arrow.
        methodFingerprint(
            "Lpl/neptis/features/dashboard_userprofile/MainFragment;",
            "onViewCreated",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
            returnType = "V",
        ).method.addInstruction(
            0,
            "invoke-static {p1}, $EXTENSION_CLASS->applyToView(Landroid/view/View;)V",
        )

        // Tile creation: `p1` holds the binding after the inflate call and `p2` is overwritten next.
        // The binding's `e` field is the tile's root view, the same field the view holder (`Lro8;` in
        // 26.9.0) passes on as its item view.
        val binding = targets.tileBinding
        val createTile = methodFingerprint(
            targets.tileAdapter,
            targets.createTile,
            parameters = listOf("Landroid/view/ViewGroup;", "I"),
            returnType = targets.tileViewHolder,
        ).method
        val inflate = createTile.instructions.toList().indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == binding
        }
        if (inflate < 0) {
            throw PatchException("${targets.tileAdapter}.${targets.createTile}: tile inflate call not found")
        }
        createTile.addInstructions(
            inflate + 2,
            """
                iget-object p2, p1, $binding->e:Landroid/view/ViewGroup;
                invoke-static {p2}, $EXTENSION_CLASS->applyToView(Landroid/view/View;)V
            """,
        )

        // Tile binding sets each label's colour from the model on every bind.
        val bindTile = methodFingerprint(
            targets.tileAdapter,
            targets.bindTile,
            parameters = listOf(targets.tileViewHolder, "I"),
            returnType = "V",
        ).method
        val labelColours = bindTile.instructions.toList().withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setTextColor"
        }
        if (labelColours.isEmpty()) {
            throw PatchException("${targets.tileAdapter}.${targets.bindTile}: setTextColor not found")
        }
        labelColours.forEach { (index, instruction) ->
            val call = instruction as FiveRegisterInstruction
            bindTile.replaceInstruction(
                index,
                "invoke-static {v${call.registerC}, v${call.registerD}}, " +
                    "$EXTENSION_CLASS->setTextColor(Landroid/widget/TextView;I)V",
            )
        }
    }
}
