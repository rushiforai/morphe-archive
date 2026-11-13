package dev.utaa.cutlog.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import dev.utaa.cutlog.patches.shared.Constants

private val localInstallerCheckFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            "Landroid/content/pm/PackageManager;->getInstallSourceInfo(Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;",
        ),
        methodCall("Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;"),
        string("com.android.vending"),
        string("Local install check failed due to wrong installer."),
    ),
)

/** PairIP のローカルインストール元判定だけを通す。Play ライセンス通信は変更しない。 */
@Suppress("unused")
val cutlogPatch = bytecodePatch(
    name = "インストール元チェック",
    description = "Google Play 以外からインストールした setlog が起動時のインストール元チェックで止まらないようにします。Play ライセンスの確認は変更しません。",
) {
    compatibleWith(Constants.SETLOG_COMPATIBILITY)

    execute {
        val matches = localInstallerCheckFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            throw PatchException("Expected one local installer check, found ${matches.size}.")
        }

        val match = matches.single()
        val method = match.method
        // 本体ごと置換し、到達不能な旧判定や例外ハンドラを残さない。
        val replacement = MutableMethod(
            ImmutableMethod(
                method.definingClass,
                method.name,
                method.parameters,
                method.returnType,
                method.accessFlags,
                method.annotations,
                method.hiddenApiRestrictions,
                ImmutableMethodImplementation(
                    2, // v0 = true, v1 = this
                    listOf(
                        ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                        ImmutableInstruction11x(Opcode.RETURN, 0),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        match.classDef.methods.remove(method)
        match.classDef.methods.add(replacement)
    }
}
