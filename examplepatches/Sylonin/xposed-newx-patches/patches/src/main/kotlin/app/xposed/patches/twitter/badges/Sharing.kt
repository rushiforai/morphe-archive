package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.Constants.MODEL_BRIDGE_CLASS
import app.xposed.patches.twitter.util.Abstract
import app.xposed.patches.twitter.util.RegisterFlow
import app.xposed.patches.twitter.util.argumentRegisters
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.fieldRef
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.isWide
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.requireLocals
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.stringRef
import app.xposed.patches.twitter.util.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val INSTANT = "Lkotlin/time/Instant;"

private val Method.types get() = parameterTypes.map { it.toString() }
private val Method.isStatic get() = AccessFlags.STATIC.isSet(accessFlags)

/**
 * Reports each badge list X builds to the extension: the user at the start of the builder, the
 * one function that makes a user's list, and the list at its end, which the extension may swap
 * for an empty list of its own. Returns the descriptors of the builder and of its
 * default-argument wrappers.
 */
internal fun BytecodePatchContext.hookBadgeBuilder(userType: String, rowClass: ClassDef, listType: String, toImmutableList: MethodReference): Set<String> {
    val makers = rowClass.methods.filter { it.isStatic && it.returnType == listType && it.types.firstOrNull() == userType }
    val builder = makers.filter { method -> method.instructionList.any { it.methodRef?.descriptor == toImmutableList.descriptor } }
        .single("badge list builder in ${rowClass.type}")
    val wrappers = makers.filter { method -> method !== builder && method.instructionList.any { it.methodRef?.descriptor == builder.descriptor } }

    val instructions = builder.instructionList
    val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
    val end = returns.singleOrNull() ?: throw PatchException("The badge list builder returns in ${returns.size} places")
    val register = (instructions[end] as OneRegisterInstruction).registerA
    val result = instructions.getOrNull(end - 1)
    if (end < 2 || result?.opcode != Opcode.MOVE_RESULT_OBJECT || (result as OneRegisterInstruction).registerA != register ||
        instructions[end - 2].methodRef?.descriptor != toImmutableList.descriptor
    ) {
        throw PatchException("The badge list builder doesn't return toImmutableList's result")
    }
    mutableMethodOf(builder).apply {
        addInstructions(
            end,
            """
            invoke-static/range { v$register .. v$register }, $HOOKS_CLASS->onBadgeList($OBJECT)$OBJECT
            move-result-object v$register
            check-cast v$register, $listType
            """,
        )
        addInstructions(0, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->beginBadgeList($OBJECT)V")
    }
    return (wrappers + builder).map { it.descriptor }.toSet()
}

/**
 * Post headers: the name rows that take the author and the post's time. Just before one builds
 * the author's badge list, it reports the time, by which the extension finds the post.
 */
internal fun BytecodePatchContext.hookPostHeaders(userType: String, rowClass: ClassDef, builders: Set<String>) {
    var sites = 0
    rowClass.methods.filter { method ->
        method.isStatic && method.types.firstOrNull() == userType && INSTANT in method.types &&
            method.instructionList.any { it.methodRef?.descriptor in builders }
    }.forEach { header ->
        val time = Abstract.Parameter(header.types.indexOf(INSTANT))
        val flow = RegisterFlow(header)
        val registerCount = header.implementation!!.registerCount
        val inserts = flow.instructions.indices.mapNotNull { i ->
            if (flow.instructions[i].methodRef?.descriptor !in builders) return@mapNotNull null
            // The list must be the header's own author's.
            if (flow.argumentsAt(i).firstOrNull() != setOf(Abstract.Parameter(0))) return@mapNotNull null
            (0 until registerCount).firstOrNull { flow.valuesAt(i, it) == setOf(time) }?.let { i to it }
        }
        val mutable = mutableMethodOf(header)
        inserts.sortedByDescending { it.first }.forEach { (i, register) ->
            mutable.addInstructions(i, "invoke-static/range { v$register .. v$register }, $HOOKS_CLASS->onPostTime($OBJECT)V")
        }
        sites += inserts.size
    }
    if (sites == 0) throw PatchException("No post header builds its author's badge list with the post's time at hand")
}

/**
 * Places that build the badge list of an AvailablePost's author right after reading it from the
 * post, such as the opened post's name row. They report the post just before reading it.
 */
internal fun BytecodePatchContext.hookPostAuthorBadges(author: FieldReference, builders: Set<String>) {
    var sites = 0
    Fingerprint(
        custom = { method, _ ->
            method.implementation != null && method.instructionList.any { it.fieldRef?.descriptor == author.descriptor } &&
                method.instructionList.any { it.methodRef?.descriptor in builders }
        },
    ).matchAll().forEach { match ->
        // The current code, in case another hook already changed the method.
        val instructions = match.method.instructionList
        val inserts = instructions.indices.mapNotNull { i ->
            val call = instructions[i]
            if (call.methodRef?.descriptor !in builders) return@mapNotNull null
            val user = call.argumentRegisters().first()
            // Straight back to the read of the author, past nothing that branches or calls.
            for (j in i - 1 downTo 0) {
                val instruction = instructions[j]
                if (instruction.methodRef != null || instruction is OffsetInstruction) return@mapNotNull null
                if (instruction.opcode == Opcode.IGET_OBJECT && instruction.fieldRef?.descriptor == author.descriptor &&
                    (instruction as TwoRegisterInstruction).registerA == user
                ) {
                    return@mapNotNull j to instruction.registerB
                }
                if (instruction is OneRegisterInstruction && instruction.registerA == user && instruction.opcode.setsRegister()) {
                    return@mapNotNull null
                }
            }
            null
        }
        inserts.sortedByDescending { it.first }.forEach { (j, post) ->
            match.method.addInstructions(j, "invoke-static/range { v$post .. v$post }, $HOOKS_CLASS->onPostBadges($OBJECT)V")
        }
        sites += inserts.size
    }
    if (sites == 0) throw PatchException("No badge list is built from a post's author")
}

/**
 * The composer's handling of share intents asks the extension first, which answers a share sheet
 * intent in Quote mode with X's quote arguments.
 */
internal fun BytecodePatchContext.hookQuoteComposer() {
    val replyReaders = ReplyExtraFingerprint.matchAll().map { it.originalMethod.descriptor }.toSet()
    val intentFields = { classDef: ClassDef ->
        classDef.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Landroid/content/Intent;" }
    }
    // The handler holds the intent and reads the reply extra, itself or through a helper.
    val match = ComposerShareIntentFingerprint.matchAll().filter { candidate ->
        intentFields(candidate.originalClassDef).size == 1 && candidate.originalMethod.instructionList.any {
            it.stringRef == "replied_tweet_id" || it.methodRef?.descriptor in replyReaders
        }
    }.single("composer share intent handler")
    val intent = intentFields(match.originalClassDef).single()
    match.method.apply {
        requireLocals(2)
        addInstructionsWithLabels(
            0,
            """
            move-object/16 v0, p0
            iget-object v0, v0, ${intent.descriptor}
            move-object/16 v1, p1
            invoke-static { v0, v1 }, $HOOKS_CLASS->composerArgs(Landroid/content/Intent;$OBJECT)Ljava/util/List;
            move-result-object v0
            if-eqz v0, :xposed_original
            return-object v0
            """,
            ExternalLabel("xposed_original", getInstruction(0)),
        )
    }
}

/**
 * ModelBridge.quoteArgs: X's QuoteAPost with the quoted post, text and media, made with the
 * constructor kotlinx.serialization generates. Its first parameter marks which of the following
 * ones (in declaration order, bit 1 << i for the i-th) were given; the others get their defaults.
 */
internal fun BytecodePatchContext.writeQuoteArgs(postIdType: String) {
    val quote = QuoteAPostToStringFingerprint.matchSingle()
    val quoteClass = quote.originalClassDef
    val fields = toStringFields(quote.originalMethod)
    val quoted = fields.field("QuoteAPost", "quotedPostId", postIdType)
    val text = fields.field("QuoteAPost", "initialText", STRING)
    val media = fields.field("QuoteAPost", "initialMediaUris", "Ljava/util/List;")
    val constructor = quoteClass.methods.filter { it.name == "<init>" && it.types.firstOrNull() == "I" && it.types.size > 4 }
        .single("QuoteAPost's deserializing constructor")
    if (constructor.types.any { it.isWide() }) throw PatchException("QuoteAPost's constructor takes a wide value")
    val postIdConstructor = classDefBy(postIdType).methods.firstOrNull { it.name == "<init>" && it.types == listOf("J") }
        ?: throw PatchException("$postIdType has no (long) constructor")

    // Which parameter each field is stored from, checked in the constructor's code.
    val flow = RegisterFlow(constructor)
    fun parameterOf(field: FieldReference): Int = flow.instructions.indices
        .filter { flow.instructions[it].opcode == Opcode.IPUT_OBJECT && flow.instructions[it].fieldRef?.descriptor == field.descriptor }
        .mapNotNull { i -> flow.valuesAt(i, (flow.instructions[i] as TwoRegisterInstruction).registerA).singleOrNull() as? Abstract.Parameter }
        .map { it.index }.distinct().singleOrNull()
        ?: throw PatchException("QuoteAPost doesn't store ${field.name} from one parameter")
    val quotedIndex = parameterOf(quoted)
    val textIndex = parameterOf(text)
    val mediaIndex = parameterOf(media)
    listOf(quotedIndex, textIndex, mediaIndex).forEach { if (it < 1) throw PatchException("QuoteAPost's mask is not its first parameter") }
    val mask = "0x" + ((1 shl (quotedIndex - 1)) or (1 shl (textIndex - 1)) or (1 shl (mediaIndex - 1))).toString(16)

    // The parameters live above v15, out of reach of non-range invokes, so they are moved down:
    // v0-v1 scratch, v1 the media list, v2 the post id, v3 the new QuoteAPost, then its arguments.
    val first = 4
    val last = first + constructor.types.size - 1
    val arguments = constructor.types.indices.map { i ->
        val register = "v${first + i}"
        when (i) {
            0 -> "const/16 $register, $mask"
            quotedIndex -> "move-object/from16 $register, v2"
            textIndex -> "move-object/from16 $register, p2"
            mediaIndex -> "move-object/from16 $register, v1"
            else -> "const/16 $register, 0x0"
        }
    }
    replaceStub(
        MODEL_BRIDGE_CLASS, "quoteArgs", last + 1,
        """
        move-wide/from16 v0, p0
        new-instance v2, $postIdType
        invoke-direct { v2, v0, v1 }, $postIdType-><init>(J)V
        move-object/from16 v0, p3
        if-eqz v0, :no_media
        invoke-static { v0 }, Ljava/util/Collections;->singletonList($OBJECT)Ljava/util/List;
        move-result-object v1
        goto :build
        :no_media
        invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v1
        :build
        new-instance v3, ${quoteClass.type}
        ${arguments.joinToString("\n")}
        invoke-direct/range { v3 .. v$last }, ${constructor.descriptor}
        return-object v3
        """,
    )
    requirePublic(quoteClass.type, constructor, postIdType, postIdConstructor)
}
