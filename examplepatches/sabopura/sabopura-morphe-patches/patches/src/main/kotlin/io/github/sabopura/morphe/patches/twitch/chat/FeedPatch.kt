package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.fieldBridge
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private object FollowingHeader : Fingerprint(strings=listOf("FollowingPageHeaderItem(title="))
internal val feedHook=bytecodePatch {
    extendWith("extensions/twitch.mpe")
    var section:FieldReference?=null
    execute {
        val header=FollowingHeader.originalClassDef
        val submit=Fingerprint(returnType="V",parameters=listOf("Ljava/util/List;"),custom={m,_->
            val instructions=m.implementation?.instructions?.toList().orEmpty()
            instructions.any { it.opcode==Opcode.INVOKE_SUPER || it.opcode==Opcode.INVOKE_SUPER_RANGE } && instructions.any {
                ((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass==header.type
            }
        })
        section=describedFields(header)[", section="]?:throw PatchException("Following: section field missing")
        requirePublicField(section!!,"Following")
        val legacySubmit = submit.matchOrNull()?.method
        if (legacySubmit != null) {
            legacySubmit.addInstructions(0,"""
                invoke-static/range {p1 .. p1}, Lio/github/sabopura/morphe/extension/twitch/chat/FeedFilters;->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """)
        } else {
            // R8 inlines submission into a coroutine in 31.5.2. Filter the completed list
            // before the header-index loop, so both the map and async diff see identical rows.
            val field = section!!
            val owner = classesMatching { c -> c.methods.any { followingIndexLoop(it, field) != null } }
                .uniqueContract("Following inlined section index owner")
            val method = mutableClassDefBy(owner).methods.filter { followingIndexLoop(it, field) != null }
                .uniqueContract("Following inlined section index loop")
            val hook = followingIndexLoop(method, field)!!
            method.addInstructions(hook.index, """
                invoke-static/range {v${hook.listRegister} .. v${hook.listRegister}}, Lio/github/sabopura/morphe/extension/twitch/chat/FeedFilters;->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object v${hook.listRegister}
                check-cast v${hook.listRegister}, Ljava/util/ArrayList;
            """)
        }
        val builderClass=classesMatching { it.methods.any(::isFollowingCardsBuilder) }.uniqueContract("Following cards builder class")
        val builder=mutableClassDefBy(builderClass).methods.filter(::isFollowingCardsBuilder).uniqueContract("Following cards builder")
        builder.addInstructions(0,"""
            invoke-static/range {p2 .. p2}, Lio/github/sabopura/morphe/extension/twitch/chat/FeedFilters;->fullCards(Z)Z
            move-result p2
        """)
    }
    finalize {
        val field=section?:throw PatchException("Following: access bridge unresolved")
        val feed="Lio/github/sabopura/morphe/extension/twitch/chat/FeedAccess;"
        replaceBridge(feed,"isHeader","instance-of p0, p0, ${field.definingClass}\nreturn p0")
        replaceBridge(feed,"section",fieldBridge(field))
    }
}
