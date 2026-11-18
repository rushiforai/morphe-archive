package app.template.patches.calendar.widget

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.template.patches.shared.replaceBody
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val calendarMicroGResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { CalendarMicroGManifest.install(it.documentElement) }
    }
}

/** Use the existing IAuthManagerService protocol, response parsing and recovery UI. */
@Suppress("unused")
val calendarMicroGSupportPatch = bytecodePatch(
    name = "Google Calendar authentication via MicroG-RE",
    description = "Routes Calendar token requests and invalidation through MicroG-RE 7.1.1+. Requires Google Play services and the same account in Android and MicroG-RE.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Google Calendar",
        packageName = CalendarMicroGManifest.PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        targets = listOf(AppTarget(version = "2026.37.0-984865732-release", versionCode = 2018314914,
            isExperimental = false)),
    ))
    dependsOn(stabilizeScheduleWidgetPatch, calendarMicroGResources)
    execute {
        val owner = "Lcal/aamw;"
        fun check(ok: Boolean, message: String) {
            if (!ok) throw PatchException("Calendar MicroG authentication: $message")
        }
        val clazz = mutableClassDefBy(owner)
        val init = clazz.methods.singleOrNull { it.name == "<clinit>" }
            ?: throw PatchException("Calendar MicroG authentication: auth initializer missing")
        val code = init.implementation!!.instructions.toList()
        fun stringAt(index: Int) = ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string
        val transport = code.indices.filter { stringAt(it) == "com.google.android.gms" }
        check(transport.size == 1, "expected one auth service package")
        val index = transport.single()
        val ctor = (code.getOrNull(index + 2) as? ReferenceInstruction)?.reference as? MethodReference
        val field = (code.getOrNull(index + 3) as? ReferenceInstruction)?.reference as? FieldReference
        check(stringAt(index + 1) == "com.google.android.gms.auth.GetToken" &&
            ctor?.definingClass == "Landroid/content/ComponentName;" && ctor.name == "<init>" &&
            ctor.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;") &&
            field?.definingClass == owner && field.name == "d" && field.type == "Landroid/content/ComponentName;",
            "auth service component changed")
        check(code[index].opcode == Opcode.CONST_STRING && init.implementation!!.tryBlocks.isEmpty(),
            "auth initializer flow changed")
        // Both token fetch and invalidation must consume this component. Keep the
        // actual Binder protocol, token lifetime, network errors and consent Intents.
        listOf("i", "f").forEach { name ->
            val method = clazz.methods.singleOrNull { it.name == name }
            check(method?.implementation?.instructions?.any {
                val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
                ref?.definingClass == owner && ref.name == "d"
            } == true, "$name no longer uses the shared auth service")
        }
        val register = (code[index] as OneRegisterInstruction).registerA
        // MicroG-RE retains the Google Java service class name in its manifest.
        // Only the owning package changes. Android com.google accounts and both
        // Calendar sync-adapter account types remain unchanged.
        val signIn = mutableClassDefBy("Lcal/agpm;").methods.singleOrNull {
            it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;") && it.returnType == "V"
        } ?: throw PatchException("Calendar MicroG authentication: sign-in listener changed")
        check(signIn.implementation!!.instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/accounts/AccountManager;" && ref.name == "addAccount"
        } && signIn.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google"
        }, "native Google add-account flow changed")
        signIn.replaceBody("""
            invoke-static/range {p1 .. p1}, Lpl/dudek/extension/calendar/CalendarMicroGAccessActivity;->signIn(Landroid/view/View;)V
            return-void
        """.trimIndent())
        init.replaceInstruction(index, "const-string v$register, \"${CalendarMicroGManifest.MICROG}\"")
    }
}
