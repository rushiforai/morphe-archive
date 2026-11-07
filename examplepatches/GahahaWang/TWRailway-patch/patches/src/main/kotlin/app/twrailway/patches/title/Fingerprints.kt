package app.twrailway.patches.title

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * `PlatformPlugin.setSystemChromeApplicationSwitcherDescription(AppSwitcherDescription)`
 * of the Flutter embedding. It is called for `SystemChrome.setApplicationSwitcherDescription`
 * (the `Title` widget of `MaterialApp`) and passes the label to `Activity.setTaskDescription`.
 * The class names are obfuscated, but the package and the framework call are not.
 */
internal object SetApplicationSwitcherDescriptionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.type.startsWith("Lio/flutter/plugin/platform/") &&
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/app/Activity;" &&
                    reference.name == "setTaskDescription"
            } == true
    },
)
