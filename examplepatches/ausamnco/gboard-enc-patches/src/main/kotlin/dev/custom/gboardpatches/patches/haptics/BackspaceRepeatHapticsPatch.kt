package dev.custom.gboardpatches.patches.haptics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Standalone Morphe bytecode patch that introduces continuous haptic feedback
 * when holding down the backspace key during repeat deletion in Gboard.
 *
 * It hooks into Gboard's repeat key dispatch pipeline (`PointerTracker.q`), checks for
 * `KeyEvent.KEYCODE_DEL` (`0x43` / 67), resolves the pressed `SoftKeyView`, and triggers
 * a tactile pulse via Gboard's native `PressEffectPlayer` module.
 *
 * This guarantees full compliance with:
 * - System vibration toggle (Settings -> Sound & vibration -> Haptic feedback)
 * - Gboard user preference (Settings -> Preferences -> Haptic feedback on keypress)
 * - User-configured vibration duration / strength slider
 * - Safe fallback to `view.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP)`
 */
val backspaceRepeatHapticsPatch = bytecodePatch(
    name = "Backspace Repeat Haptic Feedback",
    description = "Triggers continuous tactile feedback pulses when the backspace key is held down during repeated deletion.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.0.3.954559732-release-arm64-v8a"),
                AppTarget(version = "18.0.3"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )
    dependsOn(backspaceRepeatHapticsSettingsPatch)

    execute {
        val targetMethod = RepeatKeyActionFingerprint.method
        val ownerClass = RepeatKeyActionFingerprint.classDef

        // 1. Dynamically discover SoftKeyView field and PressEffectPlayer bindings
        val softKeyViewField = PressEffectPlayerFinder.findSoftKeyViewFieldName(ownerClass)
        val playerBindings = PressEffectPlayerFinder.findPressEffectPlayer(ownerClass)

        val helperMethodName = "morpheBackspaceRepeatHaptic"
        val helperMethodExists = ownerClass.methods.any { it.name == helperMethodName }

        if (!helperMethodExists) {
            val hapticCallSmali = if (playerBindings != null) {
                """
                invoke-static {}, ${playerBindings.getterClass}->${playerBindings.getterMethod}()${playerBindings.playerInterface}
                move-result-object v1
                if-eqz v1, :cond_fallback
                const/4 v2, 0x0
                invoke-interface {v1, v0, v2}, ${playerBindings.playerInterface}->${playerBindings.playMethod}(Landroid/view/View;I)V
                return-void
                """.trimIndent()
            } else {
                """
                goto :cond_fallback
                """.trimIndent()
            }

            val helperBody = """
                if-eqz p1, :cond_return
                invoke-virtual {p1}, Lcom/google/android/libraries/inputmethod/metadata/ActionDef;->b()Lpnu;
                move-result-object v0
                if-eqz v0, :cond_return
                iget v1, v0, Lpnu;->c:I
                const/16 v2, 0x43
                if-ne v1, v2, :cond_return
                iget-object v0, p0, ${ownerClass.type}->$softKeyViewField:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;
                if-eqz v0, :cond_return

                # --- 1. Preference toggle check ---
                :try_start_pref
                invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v1
                if-eqz v1, :cond_check_delete

                const-string v3, "pref_key_backspace_repeat_haptic"
                const/4 v4, 0x1

                # 1a. Check DE (Device Protected Storage) context first (Gboard's primary preference storage)
                invoke-virtual {v1}, Landroid/content/Context;->isDeviceProtectedStorage()Z
                move-result v2
                if-eqz v2, :cond_get_de_ctx
                move-object v2, v1
                goto :cond_read_de

                :cond_get_de_ctx
                invoke-virtual {v1}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;
                move-result-object v2

                :cond_read_de
                if-eqz v2, :cond_try_ce
                invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
                move-result-object v2
                if-eqz v2, :cond_try_ce
                invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
                move-result v5
                if-eqz v5, :cond_try_ce
                invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v2
                if-nez v2, :cond_check_delete
                return-void

                # 1b. Fallback to default / CE storage
                :cond_try_ce
                invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
                move-result-object v2
                if-eqz v2, :cond_check_delete
                invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v2
                if-nez v2, :cond_check_delete
                return-void
                :try_end_pref
                .catch Ljava/lang/Throwable; {:try_start_pref .. :try_end_pref} :catch_pref
                :catch_pref

                # --- 2. Check if characters or selection are being deleted ---
                :cond_check_delete
                :try_start_ic
                invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v1

                :loop_context
                if-eqz v1, :cond_do_haptic
                instance-of v2, v1, Landroid/inputmethodservice/InputMethodService;
                if-eqz v2, :cond_unwrap_context
                check-cast v1, Landroid/inputmethodservice/InputMethodService;
                invoke-virtual {v1}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputConnection()Landroid/view/inputmethod/InputConnection;
                move-result-object v1
                if-eqz v1, :cond_do_haptic

                const/4 v2, 0x1
                const/4 v3, 0x0
                invoke-interface {v1, v2, v3}, Landroid/view/inputmethod/InputConnection;->getTextBeforeCursor(II)Ljava/lang/CharSequence;
                move-result-object v2
                if-eqz v2, :cond_check_sel
                invoke-interface {v2}, Ljava/lang/CharSequence;->length()I
                move-result v2
                if-lez v2, :cond_check_sel
                goto :cond_do_haptic

                :cond_check_sel
                const/4 v2, 0x0
                invoke-interface {v1, v2}, Landroid/view/inputmethod/InputConnection;->getSelectedText(I)Ljava/lang/CharSequence;
                move-result-object v1
                if-eqz v1, :cond_no_text
                invoke-interface {v1}, Ljava/lang/CharSequence;->length()I
                move-result v1
                if-lez v1, :cond_no_text
                goto :cond_do_haptic

                :cond_no_text
                # No text before cursor and no text selected -> suppress vibration
                return-void

                :cond_unwrap_context
                instance-of v2, v1, Landroid/content/ContextWrapper;
                if-eqz v2, :cond_do_haptic
                check-cast v1, Landroid/content/ContextWrapper;
                invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
                move-result-object v2
                if-eqz v2, :cond_do_haptic
                if-eq v2, v1, :cond_do_haptic
                move-object v1, v2
                goto :loop_context

                :try_end_ic
                .catch Ljava/lang/Throwable; {:try_start_ic .. :try_end_ic} :catch_ic
                :catch_ic

                # --- 3. Trigger haptic pulse ---
                :cond_do_haptic
                :try_start_0
                $hapticCallSmali
                :try_end_0
                .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
                :catch_0
                :cond_fallback
                const/4 v1, 0x3
                invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z
                :cond_return
                return-void
            """.trimIndent()

            ownerClass.methods.add(
                ImmutableMethod(
                    ownerClass.type,
                    helperMethodName,
                    listOf(ImmutableMethodParameter("Lcom/google/android/libraries/inputmethod/metadata/ActionDef;", null, null)),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(12)
                ).toMutable().apply {
                    addInstructions(0, helperBody)
                }
            )
        }

        // 2. Prepend invocation at index 0 of repeat dispatch method q
        targetMethod.addInstructions(
            0,
            """
            invoke-direct {p0, p1}, ${ownerClass.type}->$helperMethodName(Lcom/google/android/libraries/inputmethod/metadata/ActionDef;)V
            """.trimIndent()
        )
    }
}
