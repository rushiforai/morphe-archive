package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation

private const val TV360_HUAWEI16_EDGE_ACTIVITY =
    "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
private const val TV360_HUAWEI16_EDGE_HELPER =
    "$TV360_HUAWEI16_EDGE_ACTIVITY->morpheHuawei16Android16Bars(Landroid/app/Activity;)V"
private const val TV360_HUAWEI16_TOP_EDGE_HELPER =
    "$TV360_HUAWEI16_EDGE_ACTIVITY->morpheHuawei16TopEdgeKeepNavigation(Landroid/app/Activity;)V"
private const val TV360_HUAWEI16_KEEP_TOP_HELPER =
    "$TV360_HUAWEI16_EDGE_ACTIVITY->morpheHuawei16KeepTopLayout(Landroid/view/View;I)V"
private const val TV360_HUAWEI16_EDGE_RESET_HELPER =
    "$TV360_HUAWEI16_EDGE_ACTIVITY->morpheHuawei16KeepTopLayoutAndBars(Landroid/view/View;I)V"

/**
 * Optional Android 16 (API 36+) window adjustment for the Redmi/HyperOS case.
 *
 * Original TV360 1.6 targets SDK 33; the tablet's Android 15 status-bar
 * solution is already working and MUST remain unchanged by this addition.
 *
 * On API 36+ only:
 *  - Ask the window to include the display-cutout area (punch-hole).
 *  - Keep the three Android navigation buttons visible on opaque #000000.
 *  - Disable the navigation contrast scrim and request light nav icons.
 *
 * Does not call setDecorFitsSystemWindows(false): the audited home layout has
 * bottom tabs anchored to its root, which could then overlap system buttons
 * without a separate, verified bottom-inset handler.
 *
 * The cutout request does not guarantee removal of any APP-OWNED top padding.
 * Both lifecycle hooks already exist in the untouched Huawei 1.6 APK.
 *
 * Playback stays in HomeBoxActivity on the audited Redmi: two nested UI
 * reset callsites already wrapped by Expand Behind Status Bar are updated
 * here to reapply Android 16 bars after those reset operations.
 * The content root draws behind the hidden top status inset while keeping
 * navigation-bar insets as content padding (including side navigation in landscape).
 * Guard the reapply against a stale C1 activity or a different decor view.
 */
@Suppress("unused")
val tv360Huawei16Android16HyperosEdgePatch = bytecodePatch(
    name = "TV360 Bitel 1.6 - Android 16 HyperOS Black Bars",
    description = "Android 16 phones show an AMOLED-black status bar with white icons; tablets retain their immersive behavior.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))
    dependsOn(tv360Huawei16ExpandStatusBarSpacePatch)

    execute {
        val onCreate = Fingerprint(
            definingClass = TV360_HUAWEI16_EDGE_ACTIVITY,
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method
        val onResume = Fingerprint(
            definingClass = TV360_HUAWEI16_EDGE_ACTIVITY,
            name = "onResume",
            returnType = "V",
            parameters = emptyList(),
        ).method

        // Fail closed if the installed Huawei DEX no longer matches the
        // audited lifecycle structure. These are normal-return hooks only.
        val sites = listOf(
            "onCreate" to onCreate,
            "onResume" to onResume,
        ).map { (name, method) ->
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("TV360 Android 16 bars: $name has no implementation")
            val returns = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            if (returns.isEmpty() || returns.size > 16) {
                throw PatchException(
                    "TV360 Android 16 bars: unexpected $name returns ${returns.size}"
                )
            }
            method to returns
        }

        val home = mutableClassDefBy(TV360_HUAWEI16_EDGE_ACTIVITY)
        if (home.methods.any { it.name == "morpheHuawei16Android16Bars" }) {
            throw PatchException("TV360 Android 16 bars: helper already exists")
        }

        // Three local registers (v0-v2) and one Activity argument (p0).
        // The OS-version branch means none of these operations run on the
        // user's known-good Android 15 Lenovo.
        val helper = ImmutableMethod(
            TV360_HUAWEI16_EDGE_ACTIVITY,
            "morpheHuawei16Android16Bars",
            listOf(ImmutableMethodParameter("Landroid/app/Activity;", null, null)),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable()
        helper.addInstructionsWithLabels(
            0,
            """
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x24
            if-lt v0, v1, :morphe_huawei16_edge_done

            invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
            move-result-object v0
            invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
            move-result-object v0
            iget v0, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I
            const/16 v1, 0x258
            if-ge v0, v1, :morphe_huawei16_edge_tablet

            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0
            const/16 v1, 0x400
            invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
            const v1, -0x80000000
            invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V
            const v1, -0x1000000
            invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V
            invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarContrastEnforced(Z)V
            invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V
            const/4 v1, 0x1
            invoke-virtual {v0, v1}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V
            invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
            move-result-object v1
            invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I
            move-result v2
            const v0, -0x505
            and-int/2addr v2, v0
            invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V
            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0
            invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;
            move-result-object v0
            if-eqz v0, :morphe_huawei16_edge_done
            const/4 v1, 0x0
            const/16 v2, 0x18
            invoke-interface {v0, v1, v2}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V
            invoke-static {}, Landroid/view/WindowInsets${'$'}Type;->statusBars()I
            move-result v1
            invoke-interface {v0, v1}, Landroid/view/WindowInsetsController;->show(I)V
            goto :morphe_huawei16_edge_done

            :morphe_huawei16_edge_tablet
            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0

            invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager${'$'}LayoutParams;
            move-result-object v1
            const/4 v2, 0x3
            iput v2, v1, Landroid/view/WindowManager${'$'}LayoutParams;->layoutInDisplayCutoutMode:I
            invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager${'$'}LayoutParams;)V

            const v1, -0x80000000
            invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V
            const v1, 0x8000000
            invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

            const v1, -0x1000000
            invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

            invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;
            move-result-object v0
            if-eqz v0, :morphe_huawei16_edge_done
            const/4 v1, 0x0
            const/16 v2, 0x10
            invoke-interface {v0, v1, v2}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

            # Playback can clear the legacy fullscreen UI bits without a
            # lifecycle callback; hide only the TOP status bar again.
            invoke-static {}, Landroid/view/WindowInsets${'$'}Type;->statusBars()I
            move-result v1
            invoke-interface {v0, v1}, Landroid/view/WindowInsetsController;->hide(I)V

            invoke-static {p0}, $TV360_HUAWEI16_TOP_EDGE_HELPER

            :morphe_huawei16_edge_done
            return-void
            """.trimIndent(),
        )
        home.methods.add(helper)

        // The Redmi dumpsys shows a 111px TOP status inset even when the
        // status bar is hidden. The 136px BOTTOM inset must remain reserved
        // because this app anchors bottom tabs to its content root.
        // On Android 16 only: disable decor-managed fitting and explicitly
        // pad android.R.id.content with the current navigation-bar insets.
        // Root insets may be unavailable during onCreate; in that case do
        // not change fitting yet, and retry onResume / verified UI resets.
        // This is a separate opt-in layout experiment; never hide navBars.
        if (home.methods.any { it.name == "morpheHuawei16TopEdgeKeepNavigation" }) {
            throw PatchException("TV360 Android 16 bars: top-edge helper already exists")
        }
        val topEdge = ImmutableMethod(
            TV360_HUAWEI16_EDGE_ACTIVITY,
            "morpheHuawei16TopEdgeKeepNavigation",
            listOf(ImmutableMethodParameter("Landroid/app/Activity;", null, null)),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(8),
        ).toMutable()
        topEdge.addInstructionsWithLabels(
            0,
            """
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x24
            if-lt v0, v1, :morphe_huawei16_top_edge_done

            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0
            invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
            move-result-object v1
            invoke-virtual {v1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;
            move-result-object v1
            if-eqz v1, :morphe_huawei16_top_edge_done

            invoke-static {}, Landroid/view/WindowInsets${'$'}Type;->navigationBars()I
            move-result v2
            invoke-virtual {v1, v2}, Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;
            move-result-object v1
            const v2, 0x1020002
            invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
            move-result-object v2
            if-eqz v2, :morphe_huawei16_top_edge_done

            iget v3, v1, Landroid/graphics/Insets;->left:I
            iget v4, v1, Landroid/graphics/Insets;->top:I
            iget v5, v1, Landroid/graphics/Insets;->right:I
            iget v6, v1, Landroid/graphics/Insets;->bottom:I
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V
            invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/View;->setPadding(IIII)V

            :morphe_huawei16_top_edge_done
            return-void
            """.trimIndent(),
        )
        home.methods.add(topEdge)

        if (home.methods.any { it.name == "morpheHuawei16KeepTopLayoutAndBars" }) {
            throw PatchException("TV360 Android 16 bars: reset helper already exists")
        }
        // Expand Behind Status Bar has already routed exactly two legacy
        // setSystemUiVisibility calls through KeepTopLayout(View,int).
        // Preserve that working setter, then update only the current TV360
        // Activity. C1 is assigned by the audited HomeBoxActivity onCreate.
        val resetHelper = ImmutableMethod(
            TV360_HUAWEI16_EDGE_ACTIVITY,
            "morpheHuawei16KeepTopLayoutAndBars",
            listOf(
                ImmutableMethodParameter("Landroid/view/View;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable()
        resetHelper.addInstructionsWithLabels(
            0,
            """
            invoke-static {p0, p1}, $TV360_HUAWEI16_KEEP_TOP_HELPER
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x24
            if-lt v0, v1, :morphe_huawei16_reset_done

            sget-object v0, Lcom/viettel/tv360/ui/home/HomeBoxActivity;->C1:Lcom/viettel/tv360/ui/home/HomeBoxActivity;
            if-eqz v0, :morphe_huawei16_reset_done
            invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v1
            invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
            move-result-object v1
            if-ne v1, p0, :morphe_huawei16_reset_done
            invoke-static {v0}, $TV360_HUAWEI16_EDGE_HELPER

            :morphe_huawei16_reset_done
            return-void
            """.trimIndent(),
        )
        home.methods.add(resetHelper)

        // The two concrete callsites were verified in the user's Huawei
        // classes4.dex. Fail closed if their dependency no longer provides
        // precisely one original KeepTopLayout invocation in each method.
        for ((owner, methodName, parameters) in listOf(
            Triple(
                "Lcom/viettel/tv360/ui/home/HomeBoxActivity${'$'}d0;",
                "onSystemUiVisibilityChange",
                listOf("I"),
            ),
            Triple(
                "Lcom/viettel/tv360/ui/home/HomeBoxActivity${'$'}h0${'$'}a;",
                "run",
                emptyList<String>(),
            ),
        )) {
            val method = Fingerprint(
                definingClass = owner,
                name = methodName,
                returnType = "V",
                parameters = parameters,
            ).method
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("TV360 Android 16 bars: $owner->$methodName lacks code")
            val invocations = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                        TV360_HUAWEI16_KEEP_TOP_HELPER
            }
            if (invocations.size != 1) {
                throw PatchException(
                    "TV360 Android 16 bars: expected one top-layout reset in $owner->$methodName, found ${invocations.size}"
                )
            }
            val (index, instruction) = invocations.single()
            val replacement = when (instruction.opcode) {
                Opcode.INVOKE_STATIC -> {
                    val args = instruction as? FiveRegisterInstruction
                        ?: throw PatchException("TV360 Android 16 bars: invalid 35c in $owner")
                    if (args.registerCount != 2) {
                        throw PatchException("TV360 Android 16 bars: expected View+int in $owner")
                    }
                    "invoke-static {v${args.registerC}, v${args.registerD}}, $TV360_HUAWEI16_EDGE_RESET_HELPER"
                }
                Opcode.INVOKE_STATIC_RANGE -> {
                    val args = instruction as? RegisterRangeInstruction
                        ?: throw PatchException("TV360 Android 16 bars: invalid 3rc in $owner")
                    if (args.registerCount != 2) {
                        throw PatchException("TV360 Android 16 bars: expected two words in $owner")
                    }
                    "invoke-static/range {v${args.startRegister} .. v${args.startRegister + 1}}, $TV360_HUAWEI16_EDGE_RESET_HELPER"
                }
                else -> throw PatchException("TV360 Android 16 bars: unsupported invocation in $owner")
            }
            method.replaceInstruction(index, replacement)
        }

        // Dependencies apply the known-working status-bar and top layout
        // updates first. This opt-in hook then adjusts only Android 16
        // window/cutout + three-button navigation presentation.
        for ((method, returns) in sites) {
            for (index in returns.sortedDescending()) {
                method.addInstructions(
                    index,
                    "invoke-static {p0}, $TV360_HUAWEI16_EDGE_HELPER",
                )
            }
        }
    }
}
