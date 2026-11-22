package app.rimixyz.patches.shared.installer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy

private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val INSTALL_SOURCE_INFO = "Landroid/content/pm/InstallSourceInfo;"
private const val SESSION_INFO = "Landroid/content/pm/PackageInstaller\$SessionInfo;"

private const val EXTENSION_CLASS = "Lapp/rimixyz/extension/InstallSourceHelper;"
private const val PACKAGE_SOURCE_STORE = 2

private val INVOKE_VIRTUAL_OPCODES = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

private val INSTALL_SOURCE_INFO_GETTERS = setOf(
    "getInitiatingPackageName",
    "getInstallingPackageName",
    "getOriginatingPackageName",
    "getUpdateOwnerPackageName",
)

private val SESSION_INFO_GETTERS = setOf(
    "getInstallerPackageName",
    "getInstallInitiatingPackageName",
    "getInstallOriginatingPackageName",
)

private fun Instruction.methodReferenceOrNull(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MethodReference.isInstallerGetter() =
    (definingClass == PACKAGE_MANAGER &&
        name == "getInstallerPackageName" &&
        parameterTypes.size == 1 &&
        parameterTypes[0].toString() == "Ljava/lang/String;" &&
        returnType == "Ljava/lang/String;") ||
        (definingClass == INSTALL_SOURCE_INFO &&
            name in INSTALL_SOURCE_INFO_GETTERS &&
            parameterTypes.isEmpty() &&
            returnType == "Ljava/lang/String;") ||
        (definingClass == SESSION_INFO &&
            name in SESSION_INFO_GETTERS &&
            parameterTypes.isEmpty() &&
            returnType == "Ljava/lang/String;")

private fun MethodReference.isPackageSourceGetter() =
    definingClass == INSTALL_SOURCE_INFO &&
        name == "getPackageSource" &&
        parameterTypes.isEmpty() &&
        returnType == "I"

private fun Instruction.isInstallSourceTarget(): Boolean {
    if (opcode !in INVOKE_VIRTUAL_OPCODES) return false
    val ref = methodReferenceOrNull() ?: return false
    return ref.isInstallerGetter() || ref.isPackageSourceGetter()
}

private fun Method.hasInstallSourceTarget() =
    instructionsOrNull?.any { it.isInstallSourceTarget() } == true

private val ApplicationOnCreateFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        method.name == "onCreate" &&
            classDef.superclass == "Landroid/app/Application;"
    },
)

/**
 * Universal install-source spoofer, ported from rushiranpise/morphe-patches.
 *
 * Layer 1 rewrites every DEX call site of the install-source getters.
 * Layer 2 injects InstallSourceHelper into Application.onCreate() to proxy the
 * binder-level IPackageManager so native/indirect queries also see the spoofed value.
 */
@Suppress("unused")
val spoofInstallSourcePatch = patch(
    name = "Spoof install source",
    description = "Makes the app think it was installed from Google Play. Useful when an app blocks features because it detects a sideloaded install.",
    default = false,
) {
    val installerPackageName by stringOption(
        key = "installerPackageName",
        default = "com.android.vending",
        values = mapOf(
            "Google Play Store" to "com.android.vending",
            "Samsung Galaxy Store" to "com.sec.android.app.samsungapps",
            "Huawei AppGallery" to "com.huawei.appmarket",
            "Amazon Appstore" to "com.amazon.venezia",
            "Xiaomi GetApps" to "com.xiaomi.mipicks",
            "F-Droid" to "org.fdroid.fdroid",
        ),
        title = "Store to impersonate",
        description = "Most apps only check for Google Play, so the default is usually correct.",
        required = true,
    ) { it == null || it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+\$")) }

    extendWith("extensions/extension.mpe")

    execute {
        val targetInstaller = installerPackageName ?: "com.android.vending"
        var patchedCount = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { it.hasInstallSourceTarget() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasInstallSourceTarget()) return@forEach

                val list = method.instructionsOrNull?.toList() ?: return@forEach

                list.forEachIndexed { index, instruction ->
                    if (!instruction.isInstallSourceTarget()) return@forEachIndexed

                    val moveResult = list.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    val isIntReturn = instruction.methodReferenceOrNull()?.isPackageSourceGetter() == true
                    val expectedOpcode = if (isIntReturn) Opcode.MOVE_RESULT else Opcode.MOVE_RESULT_OBJECT
                    if (moveResult.opcode != expectedOpcode) return@forEachIndexed

                    val reg = moveResult.registerA
                    val replacement = if (isIntReturn)
                        "const/4 v$reg, 0x$PACKAGE_SOURCE_STORE"
                    else
                        "const-string v$reg, \"$targetInstaller\""

                    method.replaceInstruction(index + 1, replacement)
                    patchedCount++
                }
            }
        }

        ApplicationOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            "const-string v0, \"$targetInstaller\"\ninvoke-static {v0}, $EXTENSION_CLASS->init(Ljava/lang/String;)V",
        )

        println("Spoof install source: $patchedCount DEX call site(s) patched -> \"$targetInstaller\".")
    }
}
