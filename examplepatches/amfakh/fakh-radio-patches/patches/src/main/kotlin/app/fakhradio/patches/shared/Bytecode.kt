package app.fakhradio.patches.shared

import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Whether this method references anything whose descriptor starts with [prefix]. */
fun Method.references(prefix: String): Boolean =
    implementation?.instructions?.any {
        (it as? ReferenceInstruction)?.reference?.toString()?.startsWith(prefix) == true
    } == true
