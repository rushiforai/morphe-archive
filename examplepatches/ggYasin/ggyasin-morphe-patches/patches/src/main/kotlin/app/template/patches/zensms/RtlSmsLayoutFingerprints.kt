package app.template.patches.zensms

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Appearance section which owns ZenSMS' built-in display settings. */
object RtlAppearanceSettingsFingerprint : Fingerprint(
    definingClass = "Lcom/zensms/app/ui/settings/SettingsScreenKt\$SettingsScreen\$24\$1\$4;",
    name = "invoke",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = List(3) { "Ljava/lang/Object;" },
    strings = listOf("\$this\$SettingsSection", "24-hour time format", "Haptic feedback", "Text Size"),
)

/** Exact independently audited 141/153 prototypes, not an arbitrary Compose row. */
object RtlConversationItemFingerprint : Fingerprint(
    definingClass = "Lcom/zensms/app/ui/conversations/b;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    custom = { method, _ ->
        val old = listOf(
            "Z", "Lcom/zensms/app/data/db/ConversationEntity;", "Lcom/zensms/app/data/contacts/a;",
            "Z", "Z", "Z", "Z", "Lcom/zensms/app/data/sim/SimInfo;", "Z", "Z",
            "Lz/fk;", "Lz/fk;", "Landroidx/compose/runtime/Composer;", "I", "I",
        )
        val latest = old.toMutableList().apply {
            add(2, "Lz/de;")
            replaceAll { if (it == "Lz/fk;") "Lz/an;" else it }
        }
        method.parameterTypes.map { it.toString() } in listOf(old, latest) &&
            method.implementation?.instructions?.any {
                val value = ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                value in setOf(
                    "com.zensms.app.ui.conversations.ConversationItem (ConversationsScreen.kt:1809)",
                    "com.zensms.app.ui.conversations.ConversationItem (ConversationsScreen.kt:1827)",
                )
            } == true
    },
)
