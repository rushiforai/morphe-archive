/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.order

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.writersReaching
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * How Facebook picks the next reel in the Reels tab, on the 584 build.
 *
 * The Reels tab is ranked on the phone. Facebook keeps a pool of loaded reels, and whenever it
 * places the next one it reranks the rest of the pool and takes the head of the list. The ranker
 * that does it logs as FbShortsUDDCSRRanker. Its rerank, EmL(context, list, position), sorts the
 * list in place with one static List.sort(Comparator) call and then reorders parts of it; the four
 * callers then read the head as the next reel. So the list as EmL returns is what decides.
 *
 * The list holds ranking signals, one per reel, which Facebook makes from each pool item with
 * createSignalForModel(model). The signal carries a key and scores but no posting time. The model
 * does: its edge (the interface's one no-argument Object getter) is the reel's GraphQL edge, whose
 * node is the reel's story, with creation_time in seconds. The model's FeedType field names the
 * feed, fb_shorts_tab for the Reels tab. The signal's equals and hashCode follow its key, so a
 * signal made again for the same reel finds the same entry.
 *
 * So the patch hands each signal to the extension as it's made, with its model's FeedType and edge,
 * and hands the rerank's list to the extension as EmL returns. 584's createSignalForModel is on
 * two classes, the base the Reels pool uses and a subclass Home's feed uses; both get the hook,
 * and the extension keeps only signals from the Reels feeds.
 */
internal const val PATCH = "Newest reels first"

/** The tag the Reels ranker logs under, loaded by its rerank. */
internal const val RANKER_TAG = "FbShortsUDDCSRRanker"

/** The kept name of the method that makes a pool item's ranking signal. */
internal const val SIGNAL_MAKER = "createSignalForModel"

internal const val FEED_TYPE = "Lcom/facebook/api/feedtype/FeedType;"
internal const val LIST = "Ljava/util/List;"
private const val COMPARATOR = "Ljava/util/Comparator;"
private const val OBJECT = "Ljava/lang/Object;"

private const val NEWEST_REELS = "$EXTENSION_PACKAGE/reels/NewestReels;"

/** Whether the signal hook should go on, given the model's FeedType. */
internal const val RECORDS = "$NEWEST_REELS->records($OBJECT)Z"

/** Keeps a signal's posting time: the FeedType, the edge, then the signal. */
internal const val POSTED = "$NEWEST_REELS->posted($OBJECT$OBJECT$OBJECT)V"

/** Reorders the rerank's list. */
internal const val SORT = "$NEWEST_REELS->sort($LIST)V"

internal fun refuse(message: String): Nothing = throw PatchException("$PATCH: $message")

/** The registers a call reads, in order, whether it's written as a range or not. */
internal fun Instruction.callRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/** Whether this is a static `(List, Comparator)V` call: the rerank's in-place sort. */
internal fun Instruction.isListSort(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.returnType == "V" && call.parameterTypes.map(CharSequence::toString) == listOf(LIST, COMPARATOR)
}

/**
 * The register the rerank keeps its list in, or null when [method] isn't the rerank: a void instance
 * method taking (object, List, int) that loads [RANKER_TAG] and makes one static `(List,
 * Comparator)V` call, whose list register holds the List parameter at every return. That last part
 * is what lets the hook read the list there: the one write that reaches each return is a
 * move-object from the parameter.
 */
internal fun rerankList(method: Method): Int? {
    if (method.returnType != "V" || AccessFlags.STATIC.isSet(method.accessFlags)) return null
    val parameters = method.parameterTypes.map(CharSequence::toString)
    if (parameters.size != 3 || !parameters[0].startsWith("L") || parameters[1] != LIST || parameters[2] != "I") return null
    if (!holdsString(method, RANKER_TAG)) return null
    val code = method.implementation?.instructions?.toList() ?: return null
    val sort = code.singleOrNull { it.isListSort() } ?: return null
    val list = sort.callRegisters().first()
    // this, the context, then the list.
    val listParameter = method.localRegisterCount() + 2
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
    if (returns.isEmpty()) return null
    for (index in returns) {
        val writer = method.writersReaching(index, list).singleOrNull() ?: return null
        if (writer < 0) return null
        val move = code[writer]
        if (move.opcode != Opcode.MOVE_OBJECT && move.opcode != Opcode.MOVE_OBJECT_FROM16 && move.opcode != Opcode.MOVE_OBJECT_16) return null
        if ((move as TwoRegisterInstruction).registerB != listParameter) return null
        // And the parameter still holds the caller's list where it's copied.
        if (method.writersReaching(writer, listParameter) != listOf(-1)) return null
    }
    return list
}

/** Hands the rerank's list to the extension at each of [method]'s returns, branches into them included. */
internal fun MutableMethod.sortAtReturns(list: Int) {
    val code = implementation!!.instructions.toList()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
    for (index in returns.asReversed()) {
        addInstructionsAtControlFlowLabel(index, "invoke-static/range { v$list .. v$list }, $SORT")
    }
}

/** What the signal hook reads from a model, found on its class and the parameter's interface. */
internal class SignalReads(
    /** The model's class, which the method casts its parameter to. */
    val model: String,
    /** The model's FeedType field, as a field reference. */
    val feedType: String,
    /** The interface's no-argument Object getter that hands back the model's edge. */
    val edge: String,
)

/**
 * The model class [method] casts its parameter to: the type of the one check-cast of the parameter
 * itself or of a move-object copy of it made right before. Null when there isn't exactly one.
 */
internal fun castModel(method: Method): String? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val parameter = method.localRegisterCount() + 1
    val casts = code.indices.mapNotNull { index ->
        val cast = code[index]
        if (cast.opcode != Opcode.CHECK_CAST) return@mapNotNull null
        val register = (cast as OneRegisterInstruction).registerA
        val copy = code.getOrNull(index - 1)
        val ofParameter = register == parameter || (copy != null &&
            (copy.opcode == Opcode.MOVE_OBJECT || copy.opcode == Opcode.MOVE_OBJECT_FROM16 || copy.opcode == Opcode.MOVE_OBJECT_16) &&
            (copy as TwoRegisterInstruction).registerA == register && copy.registerB == parameter)
        if (ofParameter) ((cast as ReferenceInstruction).reference as TypeReference).type else null
    }
    return casts.distinct().singleOrNull()
}

/**
 * Whether [method] has the shape of a signal maker: an instance [SIGNAL_MAKER] with a body that
 * takes one object and returns one.
 */
internal fun isSignalMaker(method: Method): Boolean =
    method.name == SIGNAL_MAKER && !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
        method.parameterTypes.size == 1 && method.parameterTypes[0].startsWith("L") && method.returnType.startsWith("L")

/**
 * What the hook reads in [method], with [classOf] looking a class up by type: the model class it
 * casts to, that class's one FeedType instance field, and its parameter interface's one abstract
 * no-argument Object getter, which the model implements. Null when any of them isn't exactly one,
 * when the field can't be read from [method]'s class, or when the parameter's register is written
 * on any way to a return, since the hook reads it there and a cast of something else would throw
 * out of Facebook's own method.
 */
internal fun signalReads(method: Method, classOf: (String) -> ClassDef?): SignalReads? {
    if (!isSignalMaker(method)) return null
    val code = method.implementation!!.instructions.toList()
    val parameter = method.localRegisterCount() + 1
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty() || returns.any { method.writersReaching(it, parameter) != listOf(-1) }) return null
    val model = castModel(method) ?: return null
    val modelClass = classOf(model) ?: return null
    val face = method.parameterTypes[0].toString()
    if (modelClass.interfaces.none { it.toString() == face }) return null
    val feedType = modelClass.fields.singleOrNull {
        it.type == FEED_TYPE && !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: return null
    if (!readableFrom(feedType.accessFlags, model, method.definingClass)) return null
    val faceClass = classOf(face) ?: return null
    if (!AccessFlags.INTERFACE.isSet(faceClass.accessFlags)) return null
    val edge = faceClass.methods.singleOrNull {
        AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == OBJECT
    } ?: return null
    return SignalReads(model, "$model->${feedType.name}:$FEED_TYPE", "$face->${edge.name}()$OBJECT")
}

/** Whether a member of [owner] with [flags] can be read from [reader]: public, or not private and in its package. */
internal fun readableFrom(flags: Int, owner: String, reader: String): Boolean {
    if (AccessFlags.PUBLIC.isSet(flags)) return true
    if (AccessFlags.PRIVATE.isSet(flags)) return false
    return owner.substringBeforeLast('/') == reader.substringBeforeLast('/')
}

/**
 * Hands each signal [this] returns to the extension, with its model's FeedType and edge, when
 * the extension says the feed is one it keeps. Three locals below the parameters do the work;
 * nothing reads them after a return, and the returned register is left alone.
 */
internal fun MutableMethod.recordAtReturns(reads: SignalReads) {
    val code = implementation!!.instructions.toList()
    val parameter = localRegisterCount() + 1
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) refuse("$definingClass->$name never returns")
    for (index in returns.asReversed()) {
        val answer = (code[index] as OneRegisterInstruction).registerA
        val scratch = (0 until localRegisterCount()).filter { it != answer }.take(3)
        if (scratch.size < 3 || scratch.last() > 15) {
            refuse("$definingClass->$name has no three locals under v16 beside its answer v$answer")
        }
        val (model, feed, value) = scratch
        addInstructionsAtControlFlowLabel(
            index,
            """
                move-object/from16 v$model, v$parameter
                check-cast v$model, ${reads.model}
                iget-object v$feed, v$model, ${reads.feedType}
                invoke-static { v$feed }, $RECORDS
                move-result v$value
                if-eqz v$value, :facebook
                invoke-interface { v$model }, ${reads.edge}
                move-result-object v$value
                move-object/from16 v$model, v$answer
                invoke-static { v$feed, v$value, v$model }, $POSTED
                :facebook
                nop
            """,
        )
    }
}
