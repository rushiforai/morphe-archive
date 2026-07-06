package app.morphe.patches.piko.misc.shim.methods.broadcast.appcompat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val APP_COMPAT_DELEGATE_CLASS_PREFIX =
    "Landroidx/appcompat/app/AppCompatDelegateImpl"

internal object AppCompatDelegateImplFingerprint : Fingerprint(
    definingClass = APP_COMPAT_DELEGATE_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/content/IntentFilter;->countActions()I",
        ),
        newInstance(APP_COMPAT_DELEGATE_CLASS_PREFIX)
    )
)
