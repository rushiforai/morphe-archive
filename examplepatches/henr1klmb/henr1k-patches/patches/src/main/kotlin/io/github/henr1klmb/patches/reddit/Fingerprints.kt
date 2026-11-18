package io.github.henr1klmb.patches.reddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal val REDDIT_COMPATIBILITY = Compatibility(
    packageName = "com.reddit.frontpage",
    name = "Reddit",
    targets = listOf(AppTarget("2026.46.0")),
)

internal object RedditDomainCommentConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/Comment;",
    name = "<init>",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { inst ->
            if (inst.opcode != Opcode.IPUT_BOOLEAN) return@any false
            val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference ?: return@any false
            ref.name == "collapsed"
        } == true
    },
)

internal object RedditV1CommentConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/data/model/v1/Comment;",
    name = "<init>",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any { inst ->
            if (inst.opcode != Opcode.IPUT_BOOLEAN) return@any false
            val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference ?: return@any false
            ref.name == "collapsed"
        } == true
    },
)
