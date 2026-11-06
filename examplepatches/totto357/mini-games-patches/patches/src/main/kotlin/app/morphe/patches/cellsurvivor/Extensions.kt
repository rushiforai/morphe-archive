package app.morphe.patches.cellsurvivor

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation

internal fun MutableMethod.ensureLocals(requiredLocals: Int) {
    val impl = implementation ?: return
    val receiverWidth = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val paramWidth = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val totalParams = receiverWidth + paramWidth
    val currentLocals = impl.registerCount - totalParams
    if (currentLocals < requiredLocals) {
        val newRegisterCount = requiredLocals + totalParams
        val field = MutableMethodImplementation::class.java.getDeclaredField("registerCount")
        field.isAccessible = true
        field.setInt(impl, newRegisterCount)
    }
}
