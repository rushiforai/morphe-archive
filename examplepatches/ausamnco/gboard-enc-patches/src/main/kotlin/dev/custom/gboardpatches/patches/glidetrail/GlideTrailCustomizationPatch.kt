package dev.custom.gboardpatches.patches.glidetrail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableLongEncodedValue

/**
 * Standalone Morphe bytecode patch that enables deep customization of Gboard's glide typing trail.
 *
 * It allows adjusting:
 * - Color: Rainbow dynamic RGB cycling, or solid vivid colors via an interactive HSV Color Wheel.
 * - Speed / Fade Duration: Continuous slider (200ms to 4000ms).
 * - Width / Thickness: Continuous slider (2dp to 40dp).
 * - Length / Tail Decay: Continuous slider (5 to 100 points).
 *
 * Hook Points:
 * 1. `GestureOverlayView` (com.google.android.apps.inputmethod.libs.gestureui.GestureOverlayView):
 *    - Injects fields for fade duration, rainbow state, and stock parameter backups.
 *    - Injects `morpheApplyCustomTrailSettings()` and `morpheOnDrawHook()`.
 *    - Hooks `c(Context, AttributeSet)` right before return to capture stock values and apply prefs.
 *    - Hooks `onDraw(Canvas)` at index 0 to update real-time Rainbow RGB hue and refresh settings.
 * 2. `mvs.g` (Gesture path processor):
 *    - Replaces the hardcoded `const-wide/16 v13, 1000` instruction with:
 *      `sget-wide v13, Lcom/google/android/apps/inputmethod/libs/gestureui/GestureOverlayView;->morpheFadeDuration:J`
 *      which scales the alpha and stroke decay dynamically based on the configured duration.
 * 3. `GesturePreferenceSettingsFragment`:
 *    - Intercepts clicks on the color wheel preference to open the interactive ColorWheelDialog.
 *    - Updates the preference summary with current hex code onResume.
 * 4. `SeekBarPreference`:
 *    - Enables showSeekBarValue and updatesContinuously for glide trail sliders.
 */
val glideTrailCustomizationPatch = bytecodePatch(
    name = "Glide Trail Customization",
    description = "Allows customizing glide typing trail color (including dynamic Rainbow RGB and Color Wheel), fade speed, thickness, and length.",
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
    dependsOn(glideTrailSettingsPatch)
    extendWith("colorwheel.dex")

    execute {
        val overlayClass = mutableClassDefBy("Lcom/google/android/apps/inputmethod/libs/gestureui/GestureOverlayView;")

        // 1. Add fields to GestureOverlayView
        fun addFieldIfMissing(
            name: String,
            type: String,
            accessFlags: Int
        ) {
            if (overlayClass.fields.none { it.name == name }) {
                overlayClass.fields.add(
                    ImmutableField(
                        overlayClass.type,
                        name,
                        type,
                        accessFlags,
                        null,
                        null,
                        null
                    ).toMutable()
                )
            }
        }

        // Field morpheFadeDuration with default 1000L initialValue encoded in DEX
        val fadeField = overlayClass.fields.firstOrNull { it.name == "morpheFadeDuration" }
        if (fadeField == null) {
            overlayClass.fields.add(
                ImmutableField(
                    overlayClass.type,
                    "morpheFadeDuration",
                    "J",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    ImmutableLongEncodedValue(1000L),
                    null,
                    null
                ).toMutable()
            )
        }

        addFieldIfMissing("morpheStockColor", "I", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheStockWidth", "I", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheStockRetention", "I", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheStockAlphaDecay", "F", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheStockWidthDecay", "F", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheLastPrefCheck", "J", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheIsRainbow", "Z", AccessFlags.PUBLIC.value)
        addFieldIfMissing("morpheCustomApplied", "Z", AccessFlags.PUBLIC.value)

        // 2. Initialize morpheFadeDuration in GestureOverlayView.<clinit>
        val clinitMethod = overlayClass.methods.firstOrNull { it.name == "<clinit>" }
        if (clinitMethod != null) {
            overlayClass.methods.remove(clinitMethod)
        }
        val newClinit = ImmutableMethod(
            overlayClass.type,
            "<clinit>",
            emptyList(),
            "V",
            AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
            null,
            null,
            MutableMethodImplementation(2)
        ).toMutable()
        newClinit.addInstructions(
            0,
            """
            const-wide/16 v0, 0x3e8
            sput-wide v0, ${overlayClass.type}->morpheFadeDuration:J
            return-void
            """.trimIndent()
        )
        overlayClass.methods.add(newClinit)

        // 3. Add morpheOnDrawHook to GestureOverlayView
        val onDrawHookName = "morpheOnDrawHook"
        if (overlayClass.methods.none { it.name == onDrawHookName }) {
            val onDrawHookSmali = """
                :try_start_draw
                # 1. If morpheIsRainbow is true, update hue on every animation frame
                iget-boolean v0, p0, ${overlayClass.type}->morpheIsRainbow:Z
                if-eqz v0, :cond_check_time
                invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
                move-result-wide v0
                const-wide/16 v2, 0x6
                div-long/2addr v0, v2
                const-wide/16 v2, 0x168
                rem-long/2addr v0, v2
                long-to-float v0, v0

                const/4 v1, 0x3
                new-array v1, v1, [F
                const/4 v2, 0x0
                aput v0, v1, v2
                const/4 v0, 0x1
                const/high16 v2, 0x3f800000 # 1.0f
                aput v2, v1, v0
                const/4 v0, 0x2
                aput v2, v1, v0

                invoke-static {v1}, Landroid/graphics/Color;->HSVToColor([F)I
                move-result v0
                invoke-virtual {p0, v0}, ${overlayClass.type}->b(I)V

                :cond_check_time
                # 2. Check SharedPreferences at most once every 500ms
                invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
                move-result-wide v0
                iget-wide v2, p0, ${overlayClass.type}->morpheLastPrefCheck:J
                sub-long v2, v0, v2
                const-wide/16 v4, 0x1f4 # 500ms
                cmp-long v2, v2, v4
                if-ltz v2, :cond_return
                iput-wide v0, p0, ${overlayClass.type}->morpheLastPrefCheck:J
                invoke-direct {p0}, ${overlayClass.type}->morpheApplyCustomTrailSettings()V

                :cond_return
                :try_end_draw
                .catch Ljava/lang/Throwable; {:try_start_draw .. :try_end_draw} :catch_draw
                :catch_draw
                return-void
            """.trimIndent()

            overlayClass.methods.add(
                ImmutableMethod(
                    overlayClass.type,
                    onDrawHookName,
                    emptyList(),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(10)
                ).toMutable().apply {
                    addInstructions(0, onDrawHookSmali)
                }
            )
        }

        // 4. Add morpheApplyCustomTrailSettings to GestureOverlayView
        val applySettingsMethodName = "morpheApplyCustomTrailSettings"
        if (overlayClass.methods.none { it.name == applySettingsMethodName }) {
            val applySettingsSmali = """
                :try_start_apply
                invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v0
                if-nez v0, :cond_ctx_ok
                return-void

                :cond_ctx_ok
                invoke-virtual {v0}, Landroid/content/Context;->isDeviceProtectedStorage()Z
                move-result v1
                if-eqz v1, :cond_try_de
                move-object v1, v0
                goto :cond_read_de

                :cond_try_de
                invoke-virtual {v0}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;
                move-result-object v1

                :cond_read_de
                if-eqz v1, :cond_fallback_ce
                invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
                move-result-object v1
                if-eqz v1, :cond_fallback_ce
                goto :cond_prefs_ok

                :cond_fallback_ce
                invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
                move-result-object v1
                if-nez v1, :cond_prefs_ok
                return-void

                :cond_prefs_ok
                # 1. Master Customization Toggle (default true)
                const-string v2, "pref_key_glide_trail_custom_enabled"
                const/4 v3, 0x1
                invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v2
                if-nez v2, :cond_custom_enabled

                # Master toggle is OFF. Check if customizations were previously applied.
                iget-boolean v2, p0, ${overlayClass.type}->morpheCustomApplied:Z
                if-nez v2, :cond_revert_stock
                # Never customized, pure stock state. Ensure fade duration is stock 1000L and exit immediately.
                const-wide/16 v2, 0x3e8
                sput-wide v2, ${overlayClass.type}->morpheFadeDuration:J
                return-void

                :cond_revert_stock
                const/4 v2, 0x0
                iput-boolean v2, p0, ${overlayClass.type}->morpheCustomApplied:Z
                iput-boolean v2, p0, ${overlayClass.type}->morpheIsRainbow:Z
                const-wide/16 v2, 0x3e8
                sput-wide v2, ${overlayClass.type}->morpheFadeDuration:J

                iget v2, p0, ${overlayClass.type}->morpheStockWidth:I
                if-lez v2, :cond_skip_w
                iput v2, p0, ${overlayClass.type}->b:I
                :cond_skip_w

                iget v2, p0, ${overlayClass.type}->morpheStockRetention:I
                if-lez v2, :cond_skip_ret
                iput v2, p0, ${overlayClass.type}->d:I
                :cond_skip_ret

                iget v2, p0, ${overlayClass.type}->morpheStockAlphaDecay:F
                const/4 v3, 0x0
                cmpl-float v3, v2, v3
                if-lez v3, :cond_skip_ad
                iput v2, p0, ${overlayClass.type}->e:F
                :cond_skip_ad

                iget v2, p0, ${overlayClass.type}->morpheStockWidthDecay:F
                const/4 v3, 0x0
                cmpl-float v3, v2, v3
                if-lez v3, :cond_skip_wd
                iput v2, p0, ${overlayClass.type}->f:F
                :cond_skip_wd

                iget v2, p0, ${overlayClass.type}->morpheStockColor:I
                if-eqz v2, :cond_skip_color
                invoke-virtual {p0, v2}, ${overlayClass.type}->b(I)V
                :cond_skip_color

                return-void

                :cond_custom_enabled
                const/4 v2, 0x1
                iput-boolean v2, p0, ${overlayClass.type}->morpheCustomApplied:Z

                # 2. Color & Rainbow Check
                const-string v2, "pref_key_glide_trail_rainbow"
                const/4 v3, 0x0
                invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v2
                iput-boolean v2, p0, ${overlayClass.type}->morpheIsRainbow:Z
                if-eqz v2, :cond_check_custom_color
                goto :cond_speed_check

                :cond_check_custom_color
                const-string v2, "pref_key_glide_trail_custom_color"
                const/4 v3, 0x0
                invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
                move-result v2
                if-eqz v2, :cond_check_stock_color
                invoke-virtual {p0, v2}, ${overlayClass.type}->b(I)V
                goto :cond_speed_check

                :cond_check_stock_color
                iget v2, p0, ${overlayClass.type}->morpheStockColor:I
                if-eqz v2, :cond_speed_check
                invoke-virtual {p0, v2}, ${overlayClass.type}->b(I)V

                # 3. Speed / Fade Duration Slider (ms)
                :cond_speed_check
                const-string v2, "pref_key_glide_trail_speed_ms"
                const/16 v3, 0x3e8 # 1000ms default
                invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
                move-result v2
                const/16 v3, 0xc8 # 200ms min
                if-ge v2, v3, :cond_speed_clamped
                const/16 v2, 0xc8
                :cond_speed_clamped
                int-to-long v2, v2
                sput-wide v2, ${overlayClass.type}->morpheFadeDuration:J

                # 4. Width / Thickness Slider (dp)
                :cond_width_check
                invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
                move-result-object v2
                if-nez v2, :cond_res_ok
                goto :cond_length_check

                :cond_res_ok
                invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
                move-result-object v2
                if-nez v2, :cond_dm_ok
                goto :cond_length_check

                :cond_dm_ok
                iget v2, v2, Landroid/util/DisplayMetrics;->density:F

                const-string v3, "pref_key_glide_trail_width_dp"
                const/16 v4, 0xd # 13dp default
                invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
                move-result v3
                const/4 v4, 0x2 # 2dp min
                if-ge v3, v4, :cond_width_clamped
                const/4 v3, 0x2
                :cond_width_clamped
                int-to-float v3, v3
                mul-float/2addr v3, v2
                float-to-int v2, v3
                iput v2, p0, ${overlayClass.type}->b:I

                # 5. Length / Retention Points Slider
                :cond_length_check
                const-string v2, "pref_key_glide_trail_length_pts"
                const/16 v3, 0x14 # 20 pts default
                invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
                move-result v2
                const/4 v3, 0x5 # 5 pts min
                if-ge v2, v3, :cond_length_clamped
                const/4 v2, 0x5
                :cond_length_clamped
                iput v2, p0, ${overlayClass.type}->d:I

                # Dynamic decay rates:
                # alphaDecay = 2.0f / length (e:F)
                # widthDecay = 1.0f / length (f:F)
                int-to-float v3, v2
                const/high16 v4, 0x40000000 # 2.0f
                div-float/2addr v4, v3
                iput v4, p0, ${overlayClass.type}->e:F

                const/high16 v4, 0x3f800000 # 1.0f
                div-float/2addr v4, v3
                iput v4, p0, ${overlayClass.type}->f:F

                :cond_finish
                :try_end_apply
                .catch Ljava/lang/Throwable; {:try_start_apply .. :try_end_apply} :catch_apply
                :catch_apply
                return-void
            """.trimIndent()

            overlayClass.methods.add(
                ImmutableMethod(
                    overlayClass.type,
                    applySettingsMethodName,
                    emptyList(),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(15)
                ).toMutable().apply {
                    addInstructions(0, applySettingsSmali)
                }
            )
        }

        // 5. Hook GestureOverlayView.c(Context, AttributeSet)
        val initMethod = overlayClass.methods.firstOrNull { m ->
            m.name == "c" && m.parameterTypes.size == 2 &&
            m.parameterTypes[0] == "Landroid/content/Context;" &&
            m.parameterTypes[1] == "Landroid/util/AttributeSet;"
        } ?: error("Method c(Context, AttributeSet) not found in GestureOverlayView")

        val initImpl = initMethod.implementation ?: error("No implementation in GestureOverlayView.c")

        // 5a. Save stock color before b(I)V call
        val bCallIndex = initImpl.instructions.indexOfLast { ins ->
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
            (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("->b(I)V") == true
        }
        if (bCallIndex >= 0) {
            initMethod.addInstructions(
                bCallIndex,
                """
                iput v0, p0, ${overlayClass.type}->morpheStockColor:I
                """.trimIndent()
            )
        }

        // 5b. Save stock width, retention, and decay rates right before return-void
        val returnVoidIndex = initImpl.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (returnVoidIndex >= 0) {
            val backupSmali = """
                iget v0, p0, ${overlayClass.type}->b:I
                iput v0, p0, ${overlayClass.type}->morpheStockWidth:I
                iget v0, p0, ${overlayClass.type}->d:I
                iput v0, p0, ${overlayClass.type}->morpheStockRetention:I
                iget v0, p0, ${overlayClass.type}->e:F
                iput v0, p0, ${overlayClass.type}->morpheStockAlphaDecay:F
                iget v0, p0, ${overlayClass.type}->f:F
                iput v0, p0, ${overlayClass.type}->morpheStockWidthDecay:F
                invoke-direct {p0}, ${overlayClass.type}->morpheApplyCustomTrailSettings()V
            """.trimIndent()
            initMethod.addInstructions(returnVoidIndex, backupSmali)
        }

        // 6. Hook GestureOverlayView.onDraw(Canvas) at index 0
        val onDrawMethod = overlayClass.methods.firstOrNull { m ->
            m.name == "onDraw" && m.parameterTypes.size == 1 &&
            m.parameterTypes[0] == "Landroid/graphics/Canvas;"
        } ?: error("Method onDraw(Canvas) not found in GestureOverlayView")

        onDrawMethod.addInstructions(
            0,
            """
            invoke-direct {p0}, ${overlayClass.type}->morpheOnDrawHook()V
            """.trimIndent()
        )

        // 6b. Hook GestureOverlayView.onSizeChanged to apply custom settings on view resize / display
        val onSizeChangedMethod = overlayClass.methods.firstOrNull { m ->
            m.name == "onSizeChanged" && m.parameterTypes.size == 4
        }
        if (onSizeChangedMethod != null) {
            val sizeImpl = onSizeChangedMethod.implementation
            val returnVoidIndex = sizeImpl?.instructions?.indexOfLast { it.opcode == Opcode.RETURN_VOID } ?: -1
            if (returnVoidIndex >= 0) {
                onSizeChangedMethod.addInstructions(
                    returnVoidIndex,
                    """
                    invoke-direct {p0}, ${overlayClass.type}->morpheApplyCustomTrailSettings()V
                    """.trimIndent()
                )
            }
        }

        // 7. Hook mvs.g (Gesture path processor) to use dynamic fade duration
        val mvsField = overlayClass.fields.firstOrNull { field ->
            val cls = classDefByOrNull(field.type)
            cls != null && cls.methods.any { m ->
                m.name == "g" && m.returnType == "Z" && m.parameterTypes.size == 3 &&
                m.parameterTypes[0] == "Ljava/util/List;" && m.parameterTypes[2] == "J"
            }
        }
        val mvsType = mvsField?.type ?: "Lmvs;"
        val mvsClass = mutableClassDefBy(mvsType)
        val gMethod = mvsClass.methods.firstOrNull { m ->
            m.name == "g" && m.returnType == "Z" && m.parameterTypes.size == 3 &&
            m.parameterTypes[0] == "Ljava/util/List;" && m.parameterTypes[2] == "J"
        } ?: error("Method g not found in processor class $mvsType")

        val gImpl = gMethod.implementation ?: error("No implementation in $mvsType.g")
        val gInstructions = gImpl.instructions.toList()
        val const1000Index = gInstructions.indexOfFirst { ins ->
            ins.opcode == Opcode.CONST_WIDE_16 && (ins as? WideLiteralInstruction)?.wideLiteral == 1000L
        }
        if (const1000Index >= 0) {
            val ins = gInstructions[const1000Index] as OneRegisterInstruction
            val targetReg = ins.registerA
            gMethod.replaceInstruction(
                const1000Index,
                "sget-wide v$targetReg, ${overlayClass.type}->morpheFadeDuration:J"
            )
        }

        // 8. Hook PreferenceFragmentCompat (cdr.aA) to handle custom preference clicks safely
        val cdrClass = mutableClassDefByOrNull("Lcdr;")
        if (cdrClass != null) {
            val aAMethod = cdrClass.methods.firstOrNull {
                it.name == "aA" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Landroidx/preference/Preference;"
            }
            if (aAMethod != null) {
                val cdrClickSmali = """
                    :try_start_click
                    invoke-static {p1}, Ldev/custom/gboardpatches/ui/GlideTrailPreferences;->onPreferenceClick(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :cond_click_orig
                    const/4 v0, 0x1
                    return v0
                    :cond_click_orig
                    :try_end_click
                    .catch Ljava/lang/Throwable; {:try_start_click .. :try_end_click} :catch_click
                    :catch_click
                """.trimIndent()
                aAMethod.addInstructions(0, cdrClickSmali)
            }
        }

        // 9. Hook CommonPreferenceFragment base (doe.aB) to initialize active preference summaries
        val doeClass = mutableClassDefByOrNull("Ldoe;")
        if (doeClass != null) {
            val aBMethod = doeClass.methods.firstOrNull {
                it.name == "aB" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Landroidx/preference/PreferenceGroup;"
            }
            if (aBMethod != null) {
                val doeSummarySmali = """
                    :try_start_summaries
                    invoke-static {p1}, Ldev/custom/gboardpatches/ui/GlideTrailPreferences;->initSummaries(Ljava/lang/Object;)V
                    :try_end_summaries
                    .catch Ljava/lang/Throwable; {:try_start_summaries .. :try_end_summaries} :catch_summaries
                    :catch_summaries
                """.trimIndent()
                aBMethod.addInstructions(0, doeSummarySmali)
            }
        }
    }
}
