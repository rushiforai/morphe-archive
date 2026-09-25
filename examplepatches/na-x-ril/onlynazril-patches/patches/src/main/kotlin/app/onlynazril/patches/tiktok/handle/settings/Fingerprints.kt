package app.onlynazril.patches.tiktok.handle.settings

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object AdPersonalizationActivityOnCreateFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.endsWith("/AdPersonalizationActivity;") && method.name == "onCreate" },
)
internal object AdPersonalizationActivityOnBackPressedFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.endsWith("/AdPersonalizationActivity;") && method.name == "onBackPressed" && method.parameterTypes.isEmpty() && method.returnType == "V"
    },
)
internal object SettingsComposeRowsFingerprint : Fingerprint(custom = ::isSettingsComposeRowsMethod)
internal object SupportGroupDefaultStateFingerprint : Fingerprint(custom = { m, c -> c.type.endsWith("/SupportGroupVM;") && m.name == "defaultState" })
internal object OpenDebugCellVmDefaultStateFingerprint : Fingerprint(custom = { m, c -> c.type.endsWith("/OpenDebugCellVM;") && m.name == "defaultState" })

internal fun isSettingsComposeRowsMethod(method: Method, classDef: ClassDef): Boolean =
    classDef.type.endsWith("/SettingsComposeRvmpFragment;") && method.returnType == "V" &&
        method.implementation?.instructions?.any { ins ->
            if (ins.opcode != Opcode.INVOKE_STATIC) return@any false
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
            ref.isSettingsRowsSort()
        } == true

internal fun MethodReference.isSettingsRowsSort(): Boolean =
    parameterTypes == listOf("Ljava/util/Comparator;", "Ljava/lang/Iterable;") && returnType == "Ljava/util/List;"
