package local.projectivy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val APP = "Lcom/spocky/projengmenu/PTApplication;"
private const val SERVICE = "Lcom/spocky/projengmenu/services/ProjectivyAccessibilityService;"
private fun Method.calls(owner: String, result: String, params: List<String>, methodName: String? = null) =
    implementation?.instructions?.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && ref.definingClass == owner && ref.returnType == result &&
            ref.parameterTypes.map { it.toString() } == params && (methodName == null || ref.name == methodName)
    } == true
private fun <T> List<T>.exactlyOne(label: String): T = singleOrNull()
    ?: throw PatchException("Projectivy structure changed: expected one $label, found $size. Use an original APK and report its version.")

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium (structural)",
    description = "Enables Projectivy premium and suppresses trial prompts. No version-number restriction; requires verified code structure.",
) {
    compatibleWith(Compatibility(
        name = "Projectivy Launcher", packageName = "com.spocky.projengmenu",
        apkFileType = ApkFileType.APK, appIconColor = 0xF08029,
        targets = listOf(AppTarget(version = null)),
    ))
    execute {
        val app = mutableClassDefBy(APP)
        if (app.methods.none { m -> m.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "ptutils"
        } == true }) throw PatchException("Projectivy native-library anchor is missing.")
        val nativeCheck = app.methods.filter {
            AccessFlags.NATIVE.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.returnType == "Z" && it.parameterTypes.map { p -> p.toString() } == listOf("Z")
        }.exactlyOne("native boolean check")
        val premium = app.methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() && it.returnType == "Z" &&
                it.calls(APP, "Z", listOf("Z"), nativeCheck.name)
        }.exactlyOne("premium wrapper")
        val trial = app.methods.filter {
            it.returnType == "V" &&
                it.parameterTypes.map { p -> p.toString() } ==
                    (if (AccessFlags.STATIC.isSet(it.accessFlags)) listOf(APP, "Z") else listOf("Z")) &&
                it.calls("Ljava/lang/System;", "J", emptyList(), "currentTimeMillis") &&
                it.calls("Ljava/lang/Boolean;", "Ljava/lang/Boolean;", listOf("Z"), "valueOf")
        }.exactlyOne("trial-state setter")
        val service = mutableClassDefBy(SERVICE)
        val byteFields = service.staticFields.filter { it.type == "B" }
        val byteWrite = if (byteFields.isNotEmpty()) {
            val field = byteFields.toList().exactlyOne("accessibility byte state")
            val init = service.methods.filter { it.name == "<clinit>" }.exactlyOne("accessibility initializer")
            val writes = init.implementation!!.instructions.withIndex().filter {
                val ref = (it.value as? ReferenceInstruction)?.reference as? FieldReference
                it.value.opcode == Opcode.SPUT_BYTE && ref?.definingClass == SERVICE && ref.name == field.name
            }.toList()
            val write = writes.exactlyOne("accessibility state initialization")
            val register = (write.value as OneRegisterInstruction).registerA
            Triple(init, write.index, register)
        } else null
        if (premium.implementation!!.registerCount < 1) throw PatchException("Premium wrapper has no working register.")
        // All structural checks finish before any method is changed.
        premium.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        trial.addInstructions(0, "const/16 p1, 0x0")
        byteWrite?.let { (method, index, register) ->
            method.addInstructions(index, "const/16 v$register, 0x0")
        }
    }
}

