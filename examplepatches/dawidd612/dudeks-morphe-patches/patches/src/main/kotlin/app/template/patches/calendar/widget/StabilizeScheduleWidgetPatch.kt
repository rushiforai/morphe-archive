package app.template.patches.calendar.widget

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun checkShape(value: Boolean, message: String) {
    if (!value) throw PatchException("Stabilize schedule widget: $message")
}

internal val scheduleWidgetResources = resourcePatch {
    execute {
        val file = get("res/layout/dudeks_calendar_widget_row.xml")
        checkShape(!file.exists(), "input already contains the row wrapper; use a clean APK")
        document("AndroidManifest.xml").use { document ->
            ScheduleInstallManifest.prepare(document.documentElement)
            AccountAccessManifest.install(document.documentElement)
        }
        ScheduleTileShapes.install { get(it) }
        file.parentFile.mkdirs()
        file.writeText("""
            <?xml version="1.0" encoding="utf-8"?>
            <FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:id="@android:id/content"
                android:layout_width="match_parent"
                android:layout_height="wrap_content" />
        """.trimIndent())
    }
}

@Suppress("unused")
val stabilizeScheduleWidgetPatch = bytecodePatch(
    name = "Stabilize schedule widget",
    description = "Rebuilds schedule widget row contents on Android 16+ to work around missing tiles, deformed tile backgrounds and recycled layout corruption. Intended for Realme UI 7. Does not reset the widget.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Google Calendar",
        packageName = "com.google.android.calendar",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        targets = listOf(AppTarget(version = "2026.37.0-984865732-release", isExperimental = false)),
    ))
    dependsOn(scheduleWidgetResources)
    extendWith("extensions/calendar.mpe")

    execute {
        val method = ScheduleRowFingerprint.method
        val owner = ScheduleRowFingerprint.classDef.type
        val code = method.instructions.toList()

        // Anchor the obfuscated factory to the named schedule service, not to the
        // empty factory or another widget. Do not modify framework/launcher classes.
        checkShape(classDefBy(SERVICE).methods.any { candidate ->
            candidate.implementation?.instructions?.any {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == owner && ref.name == "<init>" &&
                    ref.parameterTypes == listOf(CONTEXT, "Landroid/content/Intent;")
            } == true
        }, "factory is no longer constructed by the schedule widget service")
        checkShape(code.none {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == HOOK
        }, "input already patched; use a clean APK")

        val contextLoads = code.withIndex().filter {
            it.value.opcode == Opcode.IGET_OBJECT &&
                ((it.value as? ReferenceInstruction)?.reference as? FieldReference)?.let { ref ->
                    ref.definingClass == owner && ref.type == CONTEXT
                } == true
        }
        checkShape(contextLoads.size == 1, "expected one factory context load")
        val contextLoad = contextLoads.single()
        // No return, jump or exception region may bypass initialization. The
        // original prefix in this APK is sget-object + Optional.isPresent().
        checkShape(contextLoad.index == 2 && code[0].opcode == Opcode.SGET_OBJECT &&
            code[1].opcode == Opcode.INVOKE_VIRTUAL &&
            method.implementation!!.tryBlocks.isEmpty(), "unexpected factory entry flow")
        val contextRegister = (contextLoad.value as TwoRegisterInstruction).registerA
        val returns = code.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        checkShape(returns.size == 7, "expected seven complete/loading row returns")

        // Only the result register is changed. R8 reuses p0 inside this method,
        // so reading the factory/context at a return would be unsafe.
        returns.reversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            // Replace the original location so branches to a shared return also
            // enter the hook. Inserting before it would leave those labels behind.
            method.replaceInstruction(index,
                "invoke-static/range {v$register .. v$register}, $HOOK->wrap($REMOTE_VIEWS)$REMOTE_VIEWS")
            method.addInstructions(index + 1, """
                move-result-object v$register
                return-object v$register
            """.trimIndent())
        }
        method.addInstructions(contextLoad.index + 1,
            "invoke-static/range {v$contextRegister .. v$contextRegister}, $HOOK->initialize($CONTEXT)V")
    }
}
