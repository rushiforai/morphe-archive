package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.fieldBridge
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private object VodModel : Fingerprint(strings=listOf("ChommentModel(id="))

/** A field the bridge returns as String; a changed type must fail here, not as a VerifyError in chat. */
private fun stringField(labels:Map<String,FieldReference>,label:String)=labels[label]?.takeIf { it.type=="Ljava/lang/String;" }
    ?:throw PatchException("VOD chat: $label is missing or no longer a String")

internal val vodChatHook=bytecodePatch {
    extendWith("extensions/twitch.mpe")
    val fields=linkedMapOf<String,FieldReference>()
    execute {
        val model=VodModel.originalClassDef
        val labels=describedFields(model)
        for((name,label) in mapOf("id" to "ChommentModel(id=","channel" to ", channelId=","createdAt" to ", createdAt="))
            fields[name]=stringField(labels,label)
        fields["commenter"]=labels[", commenter="]?:throw PatchException("VOD chat: unresolved commenter")
        val commenter=describedFields(classDefBy(fields.getValue("commenter").type))
        fields["userId"]=stringField(commenter,"ChommentCommenterModel(id=")
        fields["username"]=stringField(commenter,", username=")
        val row=classesMatching { isVodRow(it,model.type) }.uniqueContract("VOD message row")
        fields["model"]=row.instanceFields.filter { it.type==model.type }.uniqueContract("VOD row model field")
        val binder=mutableClassDefBy(row).methods.filter(::isVodBinder).uniqueContract("VOD row text binder")
        fields["textView"]=binder.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? FieldReference
        }.distinct().single { it.type=="Landroid/widget/TextView;" }
        fields.values.forEach { requirePublicField(it,"VOD chat") }
        binder.addInstructions(vodHookIndex(binder),"invoke-static/range {p0 .. p1}, Lio/github/sabopura/morphe/extension/twitch/chat/ChatEnhancements;->bindVod(Ljava/lang/Object;Ljava/lang/Object;)V")
        Logger.getLogger("Sabopura.Chat").info("VOD chat: 1 binder hook, ${fields.size} resolved fields")
    }
    finalize {
        fields.forEach { (name,field)->replaceBridge("Lio/github/sabopura/morphe/extension/twitch/chat/VodRowAccess;",name,fieldBridge(field)) }
    }
}
