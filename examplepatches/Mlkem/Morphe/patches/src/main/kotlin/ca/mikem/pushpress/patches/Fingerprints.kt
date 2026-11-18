package ca.mikem.pushpress.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * PushPress 3.42.0 declares no lifecycle methods in MainActivity; its constructor is the
 * stable app-owned entry point. The extension defers installation until the Activity window
 * and FlutterView are attached.
 */
internal object MainActivityConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/pushpress/memberportal/MainActivity;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(opcode(Opcode.RETURN_VOID))
)
