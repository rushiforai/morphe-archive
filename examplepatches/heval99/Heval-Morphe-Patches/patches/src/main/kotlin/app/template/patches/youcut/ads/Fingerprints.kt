package app.template.patches.youcut.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// com.camerasideas.mobileads.a is the app's ad-support switch, and its only boolean(String)
// method answers "does this placement show ads": it returns false for Pro users, then looks the
// placement up in the remote AdDeploy list. Every ad load/show path consults it, so forceable
// false is the app's own "no ads" experience (what a Pro user already gets). The class name is
// readable; the member name rotates, so the body's call to the Pro gate is the anchor.
internal object AdSupportedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/camerasideas/mobileads/a;" &&
            method.implementation != null &&
            method.implementation!!.instructions.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lcom/camerasideas/instashot/store/billing/d;" &&
                    ref.name == "d" &&
                    ref.returnType == "Z" &&
                    ref.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/content/Context;")
            }
    },
)
