package dev.custom.gboardpatches.patches.enterkey

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
 * Standalone Morphe bytecode patch that broadcasts an Android Intent event to Tasker
 * whenever the Enter key or bottom-right IME Action key is pressed on Gboard.
 *
 * Hook Location:
 * `GoogleInputMethodService.dD(Event)` receives all softkey events right before routing.
 *
 * Broadcast Details:
 * - Action: `dev.custom.gboard.ENTER_PRESSED`
 * - Flags: `Intent.FLAG_RECEIVER_FOREGROUND` (0x10000000) for zero-latency delivery
 * - Extras:
 *   - `package`: Package name of active foreground app (e.g. `com.whatsapp`)
 *   - `action_type`: `"ENTER"` for newline, or `"SEND"`, `"SEARCH"`, `"GO"`, `"DONE"`, etc.
 *   - `key_code`: Integer keycode (`66`, `160`, `-10018`)
 *   - `text_before`: Up to 100 characters before the cursor at press time
 *   - `timestamp`: System epoch timestamp in milliseconds
 *
 * Reliability & Safety:
 * - Completely guarded by `try { ... } catch (Throwable)` to guarantee zero IME crashes
 * - Integrated toggle switch in Gboard Settings -> Preferences -> Key tap
 */
val enterKeyTaskerEventPatch = bytecodePatch(
    name = "Enter Key Tasker Event",
    description = "Broadcasts an Intent event to Tasker whenever the Enter or IME action key is pressed on Gboard.",
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
    dependsOn(enterKeyTaskerEventSettingsPatch)

    execute {
        val targetMethod = EnterKeyEventFingerprint.method
        val ownerClass = EnterKeyEventFingerprint.classDef

        val eventParamType = targetMethod.parameterTypes[0].toString() // e.g. "Lnur;"

        // Discover KeyData class type from Event class methods (e.g. g() returns Lpnu;)
        val eventClass = classDefByOrNull(eventParamType)
        val getKeyDataMethod = eventClass?.methods?.firstOrNull { it.name == "g" }
        val keyDataParamType = getKeyDataMethod?.returnType?.toString() ?: "Lpnu;"

        // Discover data field on KeyData class (Object field, typically e)
        val keyDataClass = classDefByOrNull(keyDataParamType)
        val dataFieldName = keyDataClass?.fields?.firstOrNull { it.type == "Ljava/lang/Object;" }?.name ?: "e"

        val helperMethodName = "morpheSendEnterTaskerEvent"
        val helperMethodExists = ownerClass.methods.any { it.name == helperMethodName }

        if (!helperMethodExists) {
            val helperBody = """
                if-eqz p1, :cond_return

                # Fast path: check keycode first!
                invoke-virtual {p1}, $eventParamType->a()I
                move-result v0

                # Check 66 (0x42: KEYCODE_ENTER)
                const/16 v1, 0x42
                if-ne v0, v1, :cond_check_numpad
                const-string v1, "ENTER"
                goto :cond_is_enter

                :cond_check_numpad
                # Check 160 (0xa0: KEYCODE_NUMPAD_ENTER)
                const/16 v1, 0xa0
                if-ne v0, v1, :cond_check_ime_action
                const-string v1, "ENTER"
                goto :cond_is_enter

                :cond_check_ime_action
                # Check -10018 (-0x2722: IME_ACTION)
                const/16 v1, -0x2722
                if-ne v0, v1, :cond_return
                const-string v1, "IME_ACTION"

                :cond_is_enter
                :try_start_main
                # 1. SharedPreferences toggle check
                invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
                move-result-object v2
                if-eqz v2, :cond_check_action_string
                const-string v3, "pref_key_send_enter_tasker_event"
                const/4 v4, 0x1
                invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v2
                if-nez v2, :cond_check_action_string
                return-void

                # 2. If IME action, attempt to get specific action name ("SEND", "SEARCH", etc.)
                :cond_check_action_string
                const/16 v2, -0x2722
                if-ne v0, v2, :cond_get_editor_info
                invoke-virtual {p1}, $eventParamType->g()$keyDataParamType
                move-result-object v2
                if-eqz v2, :cond_get_editor_info
                iget-object v2, v2, $keyDataParamType->$dataFieldName:Ljava/lang/Object;
                if-eqz v2, :cond_get_editor_info
                instance-of v3, v2, Ljava/lang/String;
                if-eqz v3, :cond_get_editor_info
                move-object v1, v2
                check-cast v1, Ljava/lang/String;

                # 3. Get EditorInfo for active package name
                :cond_get_editor_info
                const-string v2, ""
                invoke-virtual {p0}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputEditorInfo()Landroid/view/inputmethod/EditorInfo;
                move-result-object v3
                if-eqz v3, :cond_get_text
                iget-object v4, v3, Landroid/view/inputmethod/EditorInfo;->packageName:Ljava/lang/String;
                if-eqz v4, :cond_get_text
                move-object v2, v4

                # 4. Get text before cursor (up to 100 characters)
                :cond_get_text
                const-string v4, ""
                invoke-virtual {p0}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputConnection()Landroid/view/inputmethod/InputConnection;
                move-result-object v5
                if-eqz v5, :cond_create_intent
                const/16 v6, 0x64
                const/4 v7, 0x0
                invoke-interface {v5, v6, v7}, Landroid/view/inputmethod/InputConnection;->getTextBeforeCursor(II)Ljava/lang/CharSequence;
                move-result-object v5
                if-eqz v5, :cond_create_intent
                invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;
                move-result-object v4

                # 5. Build Intent and send broadcast
                :cond_create_intent
                new-instance v5, Landroid/content/Intent;
                const-string v6, "dev.custom.gboard.ENTER_PRESSED"
                invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

                const/high16 v6, 0x10000000
                invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

                const-string v6, "package"
                invoke-virtual {v5, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

                const-string v6, "action_type"
                invoke-virtual {v5, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

                const-string v6, "key_code"
                invoke-virtual {v5, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

                const-string v6, "text_before"
                invoke-virtual {v5, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

                const-string v6, "timestamp"
                invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
                move-result-wide v7
                invoke-virtual {v5, v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

                invoke-virtual {p0, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

                :try_end_main
                .catch Ljava/lang/Throwable; {:try_start_main .. :try_end_main} :catch_all
                :catch_all

                :cond_return
                return-void
            """.trimIndent()

            ownerClass.methods.add(
                ImmutableMethod(
                    ownerClass.type,
                    helperMethodName,
                    listOf(ImmutableMethodParameter(eventParamType, null, null)),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(14)
                ).toMutable().apply {
                    addInstructions(0, helperBody)
                }
            )
        }

        // Prepend invocation at index 0 of GoogleInputMethodService.dD(Event)
        targetMethod.addInstructions(
            0,
            """
            invoke-direct {p0, p1}, ${ownerClass.type}->$helperMethodName($eventParamType)V
            """.trimIndent()
        )
    }
}
