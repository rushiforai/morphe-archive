package app.template.patches.upnote.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * The app's subscription record: one Long (expiry, epoch ms) and two Booleans ("valid" and
 * "cancelled" from the account API), parsed from the account response. Its no-arg Boolean getter
 * answers "valid and not cancelled, or now before the expiry", and the settings singleton copies
 * that answer into the premium flag once at startup.
 *
 * The class and the getter are R8-renamed (9.22.8: mo3.h()), so the anchor is the field shape.
 */
internal object UpNoteSubscriptionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    custom = { method, classDef ->
        val fields = classDef.fields.toList()
        fields.count { it.type == "Ljava/lang/Long;" } == 1 &&
            fields.count { it.type == "Ljava/lang/Boolean;" } == 2 &&
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                reference?.definingClass == classDef.type
            } == true
    },
)
