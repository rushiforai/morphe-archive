package app.kyurem39.patches.mpvex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import sun.misc.Unsafe

private const val MORPHE_HOOK = "Lapp/kyurem39/extension/MorpheHook;"

private const val MAIN_ACTIVITY = "Lapp/marlboroadvance/mpvex/MainActivity;"
private const val CRASH_HANDLER =
    "Lapp/marlboroadvance/mpvex/presentation/crash/GlobalExceptionHandler;"

/**
 * Registers the PatchSettingsActivity in AndroidManifest.xml.
 */
internal val patchSettingsResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", "app.kyurem39.extension.PatchSettingsActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "kyurem39's patches")
            activity.setAttribute(
                "android:configChanges",
                "orientation|screenSize|screenLayout|keyboardHidden",
            )
            application.appendChild(activity)
        }
    }
}

/**
 * The code every patch shares: the injected extension, the settings panel entry and the crash
 * logger.
 *
 * <p>Unnamed, so it is only applied as a dependency and never shows up as a patch of its own.
 */
internal val patchSettingsPatch = bytecodePatch {
    dependsOn(patchSettingsResourcesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The sheet is shown on the activity this tracks. Its lifecycle callbacks then follow
        // every other activity, so one call is enough for the whole process.
        val mainOnCreate = mutableClassDefBy(MAIN_ACTIVITY).methods.firstOrNull { method ->
            method.name == "onCreate" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0].toString() == "Landroid/os/Bundle;" &&
                method.returnType == "V"
        } ?: throw PatchException("$MAIN_ACTIVITY has no onCreate(Bundle).")

        mainOnCreate.addInstructions(
            0,
            """
                invoke-static {p0}, $MORPHE_HOOK->track(Landroid/app/Activity;)V
            """,
        )

        // Inject Text-Nvy7gAk calls into MorpheHook.renderTitle and renderSummary.
        fun ensureRegisters(impl: MutableMethodImplementation, count: Int) {
            if (impl.registerCount >= count) return
            val uf = Unsafe::class.java.getDeclaredField("theUnsafe").apply { isAccessible = true }
            val unsafe = uf.get(null) as Unsafe
            val rf = MutableMethodImplementation::class.java.getDeclaredField("registerCount")
            val offset = unsafe.objectFieldOffset(rf)
            unsafe.putInt(impl, offset, count)
        }

        val morpheHook = mutableClassDefBy(MORPHE_HOOK)
        val renderTitleMethod = morpheHook.methods.firstOrNull { it.name == "renderTitle" }
            ?: throw PatchException("$MORPHE_HOOK has no renderTitle.")
        renderTitleMethod.implementation!!.let { impl ->
            ensureRegisters(impl, 26)
            renderTitleMethod.removeInstructions(0, impl.instructions.size)
        }
        renderTitleMethod.addInstructions(
            0,
            """
                invoke-static {}, $MORPHE_HOOK->getTitleText()Ljava/lang/String;
                move-result-object v0
                const/4 v1, 0x0
                const-wide/16 v2, 0x0
                const-wide/16 v4, 0x0
                const/4 v6, 0x0
                const/4 v7, 0x0
                const/4 v8, 0x0
                const-wide/16 v9, 0x0
                const/4 v11, 0x0
                const/4 v12, 0x0
                const-wide/16 v13, 0x0
                const/4 v15, 0x0
                const/16 v16, 0x0
                const/16 v17, 0x0
                const/16 v18, 0x0
                const/16 v19, 0x0
                move-object/from16 v20, p0
                check-cast v20, Landroidx/compose/runtime/GapComposer;
                const/16 v21, 0x0
                const/16 v22, 0x0
                const v23, 0x3fffe
                invoke-static/range {v0 .. v23}, Landroidx/compose/material3/TextKt;->Text-Nvy7gAk(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILandroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/GapComposer;III)V
                return-void
            """,
        )

        val renderSummaryMethod = morpheHook.methods.firstOrNull { it.name == "renderSummary" }
            ?: throw PatchException("$MORPHE_HOOK has no renderSummary.")
        renderSummaryMethod.implementation!!.let { impl ->
            ensureRegisters(impl, 26)
            renderSummaryMethod.removeInstructions(0, impl.instructions.size)
        }
        renderSummaryMethod.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                check-cast v0, Landroidx/compose/runtime/GapComposer;
                invoke-static {v0}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/GapComposer;)Landroidx/compose/material3/ColorScheme;
                move-result-object v0
                iget-wide v2, v0, Landroidx/compose/material3/ColorScheme;->outline:J
                invoke-static {}, $MORPHE_HOOK->getSummaryText()Ljava/lang/String;
                move-result-object v0
                const/4 v1, 0x0
                const-wide/16 v4, 0x0
                const/4 v6, 0x0
                const/4 v7, 0x0
                const/4 v8, 0x0
                const-wide/16 v9, 0x0
                const/4 v11, 0x0
                const/4 v12, 0x0
                const-wide/16 v13, 0x0
                const/4 v15, 0x0
                const/16 v16, 0x0
                const/16 v17, 0x0
                const/16 v18, 0x0
                const/16 v19, 0x0
                move-object/from16 v20, p0
                check-cast v20, Landroidx/compose/runtime/GapComposer;
                const/16 v21, 0x0
                const/16 v22, 0x0
                const v23, 0x3fffa
                invoke-static/range {v0 .. v23}, Landroidx/compose/material3/TextKt;->Text-Nvy7gAk(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILandroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/GapComposer;III)V
                return-void
            """,
        )

        val renderIconMethod = morpheHook.methods.firstOrNull { it.name == "renderIcon" }
            ?: throw PatchException("$MORPHE_HOOK has no renderIcon.")
        renderIconMethod.implementation!!.let { impl ->
            ensureRegisters(impl, 26)
            renderIconMethod.removeInstructions(0, impl.instructions.size)
        }
        renderIconMethod.addInstructions(
            0,
            """
                invoke-static {}, Lkotlin/math/MathKt;->getSettings()Landroidx/compose/ui/graphics/vector/ImageVector;
                move-result-object v1
                move-object/from16 v6, p0
                check-cast v6, Landroidx/compose/runtime/GapComposer;
                invoke-static {v6}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/GapComposer;)Landroidx/compose/material3/ColorScheme;
                move-result-object v0
                iget-wide v4, v0, Landroidx/compose/material3/ColorScheme;->primary:J
                const/16 v7, 0x30
                const/4 v8, 0x4
                const/4 v2, 0x0
                const/4 v3, 0x0
                invoke-static/range {v1 .. v8}, Landroidx/compose/material3/IconKt;->Icon-ww6aTOc(Landroidx/compose/ui/graphics/vector/ImageVector;Ljava/lang/String;Landroidx/compose/ui/Modifier;JLandroidx/compose/runtime/GapComposer;II)V
                return-void
            """,
        )

        // Append kyurem39's patches preference row after About in PreferencesScreen.
        val prefLambda = mutableClassDefBy(
            "Lapp/marlboroadvance/mpvex/ui/preferences/PreferencesScreen\$\$ExternalSyntheticLambda2;",
        )
        val prefInvoke = prefLambda.methods.firstOrNull { method ->
            method.name == "invoke" && method.parameterTypes.size == 3
        } ?: throw PatchException("PreferencesScreen\$\$ExternalSyntheticLambda2 has no invoke(3).")

        val instructions = prefInvoke.implementation!!.instructions
        val aboutTitleIdx = instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ref?.name == "lambda$1033982798"
        }
        if (aboutTitleIdx < 0) {
            throw PatchException("Could not find lambda$1033982798 in PreferencesScreen lambda.")
        }

        val iconsPrefOffset = instructions.drop(aboutTitleIdx).indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "Preference" && ref.definingClass == "Lme/zhanghai/compose/preference/Icons;"
        }
        if (iconsPrefOffset < 0) {
            throw PatchException("Could not find Icons.Preference after lambda$1033982798.")
        }
        val iconsPrefIdx = aboutTitleIdx + iconsPrefOffset

        prefInvoke.addInstructions(
            iconsPrefIdx + 1,
            """
                invoke-static {v6, v1, v9}, Lapp/marlboroadvance/mpvex/ui/preferences/CardPreferencesKt;->PreferenceDivider(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/GapComposer;I)V
                sget-object v11, $MORPHE_HOOK->TITLE_LAMBDA:Ljava/lang/Object;
                check-cast v11, Lkotlin/jvm/functions/Function2;
                const/4 v12, 0x0
                const/4 v13, 0x0
                sget-object v14, $MORPHE_HOOK->ICON_LAMBDA:Ljava/lang/Object;
                check-cast v14, Lkotlin/jvm/functions/Function2;
                sget-object v15, $MORPHE_HOOK->SUMMARY_LAMBDA:Ljava/lang/Object;
                check-cast v15, Lkotlin/jvm/functions/Function2;
                const/16 v16, 0x0
                sget-object v17, $MORPHE_HOOK->CLICK_LAMBDA:Ljava/lang/Object;
                check-cast v17, Lkotlin/jvm/functions/Function0;
                move-object/from16 v18, v1
                const/16 v19, 0x6c06
                const/16 v20, 0x26
                invoke-static/range {v11 .. v20}, Lme/zhanghai/compose/preference/Icons;->Preference(Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/GapComposer;II)V
            """,
        )

        // The app shows crashes on its own screen and exits, so log the cause first: otherwise a
        // crash in patched code is invisible in logcat.
        val uncaught = mutableClassDefBy(CRASH_HANDLER).methods.firstOrNull { method ->
            method.name == "uncaughtException" &&
                method.parameterTypes.size == 2 &&
                method.parameterTypes[0].toString() == "Ljava/lang/Thread;" &&
                method.parameterTypes[1].toString() == "Ljava/lang/Throwable;"
        } ?: throw PatchException("$CRASH_HANDLER has no uncaughtException(Thread, Throwable).")

        uncaught.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $MORPHE_HOOK->logCrash(Ljava/lang/Thread;Ljava/lang/Throwable;)V
            """,
        )
    }
}
