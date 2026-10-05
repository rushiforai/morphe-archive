/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.models

import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.common.valueReachesRegister
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.WeakHashMap

private const val OBJECT_DESCRIPTOR = "Ljava/lang/Object;"
private const val LIST_DESCRIPTOR = "Ljava/util/List;"
private const val BOOLEAN_OBJECT_DESCRIPTOR = "Ljava/lang/Boolean;"
private const val INTEGER_OBJECT_DESCRIPTOR = "Ljava/lang/Integer;"
private const val PARSER_METHOD = "unsafeParseFromJson"

/** Pando keys of the feed response and feed item parsers. */
private const val FEED_ITEMS_KEY = "feed_items"
private const val DISABLE_CLIENT_INSERTIONS_KEY = "disable_client_insertions"
private const val MAX_AD_INSERTIONS_KEY = "max_num_possible_ad_insertions"
private const val MEDIA_OR_AD_KEY = "media_or_ad"
private const val MULTI_AD_PIVOT_KEY = "stand_alone_multi_ad_pivot"

/**
 * The main feed models, all derived from the Pando keys of two JSON parsers. Only references are
 * kept: patches that mutate the parser re-find their instructions in the mutable method.
 */
internal data class ResolvedFeedModels(
    /** Parses the feed response: builds the `feed_items` list and returns the response. */
    val responseParser: MethodReference,
    val responseDescriptor: String,
    /** Response field the parsed `feed_items` list is stored in. */
    val feedItemsField: FieldReference,
    /** `disable_client_insertions`: when true the client does not insert ads from its ad pool. */
    val disableClientInsertionsField: FieldReference,
    /** `max_num_possible_ad_insertions`: the client-side ad insertion budget of the page. */
    val maxAdInsertionsField: FieldReference,
    val feedItemDescriptor: String,
    /** Feed item field holding the `media_or_ad` media: the post, or a sponsored post. */
    val mediaOrAdField: FieldReference,
    /** Feed item field holding the `stand_alone_multi_ad_pivot` media, an ad unit by definition. */
    val multiAdPivotField: FieldReference,
)

private object FeedModelCache {
    private val values = WeakHashMap<BytecodePatchContext, ResolvedFeedModels>()

    @Synchronized
    fun getOrPut(
        context: BytecodePatchContext,
        resolve: () -> ResolvedFeedModels,
    ): ResolvedFeedModels = values.getOrPut(context, resolve)
}

context(context: BytecodePatchContext)
internal fun resolvedFeedModels(): ResolvedFeedModels = FeedModelCache.getOrPut(context) { resolveFeedModels() }

context(context: BytecodePatchContext)
private fun resolveFeedModels(): ResolvedFeedModels {
    // Several parsers mention `feed_items`; only the feed response also reads the ad insertion keys.
    val responseParser =
        requireExactlyOne(
            "feed response parser",
            Fingerprint(
                name = PARSER_METHOD,
                returnType = OBJECT_DESCRIPTOR,
                filters = listOf(string(FEED_ITEMS_KEY)),
            ).matchAll()
                .map { it.originalMethod }
                .filter { method -> method.instructionList().any { it.stringValue() == DISABLE_CLIENT_INSERTIONS_KEY } },
        )
    val responseInstructions = responseParser.instructionList()

    // `feed_items` is parsed into a local list and stored once into the response.
    val feedItemsCase = responseInstructions.caseOf(FEED_ITEMS_KEY, responseParser)
    val feedItemsStore =
        requireExactlyOne(
            "feed_items list store in $responseParser",
            feedItemsCase.filter { index ->
                responseInstructions[index].opcode == Opcode.IPUT_OBJECT &&
                    responseInstructions[index].fieldReference()?.type == LIST_DESCRIPTOR
            },
        )
    val feedItemsField = responseInstructions[feedItemsStore].fieldReference()!!.immutable()
    val responseDescriptor = feedItemsField.definingClass
    val listRegister = (responseInstructions[feedItemsStore] as TwoRegisterInstruction).registerA

    // Each element is the result of the feed item parser call that is added to that list.
    val addCall =
        requireExactlyOne(
            "feed_items add call in $responseParser",
            feedItemsCase.filter { index ->
                val instruction = responseInstructions[index]
                instruction.getReference<MethodReference>()?.name == "add" &&
                    instruction.argumentRegisters().indexOf(listRegister) == 0
            },
        )
    val itemRegister = responseInstructions[addCall].argumentRegisters()[1]
    val itemResult =
        requireExactlyOne(
            "feed item parse result in $responseParser",
            feedItemsCase.filter { index ->
                index < addCall &&
                    responseInstructions[index].opcode == Opcode.MOVE_RESULT_OBJECT &&
                    (responseInstructions[index] as OneRegisterInstruction).registerA == itemRegister
            },
        )
    val feedItemDescriptor =
        responseInstructions[itemResult - 1].getReference<MethodReference>()?.returnType
            ?: throw PatchException("Feed item result in $responseParser does not follow a call")
    if (!feedItemDescriptor.startsWith("L") || feedItemDescriptor.startsWith("Ljava/")) {
        throw PatchException("Feed item parser in $responseParser returns $feedItemDescriptor, not a model")
    }

    val disableClientInsertionsField =
        responseInstructions.responseFieldFor(DISABLE_CLIENT_INSERTIONS_KEY, responseParser, responseDescriptor)
    disableClientInsertionsField.requireType(BOOLEAN_OBJECT_DESCRIPTOR)
    val maxAdInsertionsField =
        responseInstructions.responseFieldFor(MAX_AD_INSERTIONS_KEY, responseParser, responseDescriptor)
    maxAdInsertionsField.requireType(INTEGER_OBJECT_DESCRIPTOR)

    // The feed item parser is the one that reads the multi-ad pivot and fills the feed item.
    val feedItemParser =
        requireExactlyOne(
            "feed item parser",
            Fingerprint(
                name = PARSER_METHOD,
                returnType = OBJECT_DESCRIPTOR,
                filters = listOf(string(MULTI_AD_PIVOT_KEY)),
            ).matchAll()
                .map { it.originalMethod }
                .filter { method ->
                    method.instructionList().any { instruction ->
                        instruction.opcode == Opcode.IPUT_OBJECT &&
                            instruction.fieldReference()?.definingClass == feedItemDescriptor
                    }
                },
        )
    val mediaOrAdField = feedItemParser.feedItemMediaFieldFor(MEDIA_OR_AD_KEY, feedItemDescriptor)
    val multiAdPivotField = feedItemParser.feedItemMediaFieldFor(MULTI_AD_PIVOT_KEY, feedItemDescriptor)
    if (mediaOrAdField == multiAdPivotField) {
        throw PatchException("media_or_ad and stand_alone_multi_ad_pivot resolved to the same field $mediaOrAdField")
    }
    // The extension bridges read both fields directly.
    val feedItemClass = context.classDefBy(feedItemDescriptor)
    val unreadable =
        listOf(mediaOrAdField, multiAdPivotField).filter { field ->
            !AccessFlags.PUBLIC.isSet(feedItemClass.accessFlags) ||
                feedItemClass.fields.none { it.name == field.name && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        }
    if (unreadable.isNotEmpty()) {
        throw PatchException("Feed item fields are not readable from the extension: $unreadable")
    }

    return ResolvedFeedModels(
        responseParser =
            ImmutableMethodReference(
                responseParser.definingClass,
                responseParser.name,
                responseParser.parameterTypes,
                responseParser.returnType,
            ),
        responseDescriptor = responseDescriptor,
        feedItemsField = feedItemsField,
        disableClientInsertionsField = disableClientInsertionsField,
        maxAdInsertionsField = maxAdInsertionsField,
        feedItemDescriptor = feedItemDescriptor,
        mediaOrAdField = mediaOrAdField,
        multiAdPivotField = multiAdPivotField,
    )
}

/** The mutable feed response parser, for the patches that hook it. */
context(context: BytecodePatchContext)
internal fun ResolvedFeedModels.mutableResponseParser(): MutableMethod =
    requireExactlyOne(
        "mutable feed response parser $responseParser",
        context.mutableClassDefBy(responseParser.definingClass).methods.filter { method ->
            method.name == responseParser.name &&
                method.returnType == responseParser.returnType &&
                method.parameterTypes.map { it.toString() } == responseParser.parameterTypes.map { it.toString() }
        },
    )

/** Index of the single instruction that stores the parsed `feed_items` list into the response. */
internal fun ResolvedFeedModels.feedItemsStoreIndex(method: Method): Int {
    val instructions = method.instructionList()
    return requireExactlyOne(
        "feed_items list store in $method",
        instructions.indices.filter { index ->
            instructions[index].opcode == Opcode.IPUT_OBJECT &&
                instructions[index].fieldReference()?.sameFieldAs(feedItemsField) == true
        },
    )
}

/**
 * The instructions of the JSON parser switch case for [key]: from its `const-string` up to the next
 * case's `const-string`. The key must be compared exactly once in the parser.
 */
private fun List<Instruction>.caseOf(
    key: String,
    parser: Method,
): IntRange {
    val keyIndex = requireExactlyOne("\"$key\" case in $parser", indices.filter { this[it].stringValue() == key })
    val nextCase = subList(keyIndex + 1, size).indexOfFirst { it.stringValue() != null }
    return (keyIndex + 1) until if (nextCase < 0) size else keyIndex + 1 + nextCase
}

/** The single response field the [key] case stores its value in. */
private fun List<Instruction>.responseFieldFor(
    key: String,
    parser: Method,
    responseDescriptor: String,
): FieldReference {
    val stores =
        caseOf(key, parser)
            .filter { index -> this[index].opcode in FIELD_STORE_OPCODES }
            .map { index -> this[index].fieldReference() }
            .filter { field -> field?.definingClass == responseDescriptor }
            .map { field -> field!!.immutable() }
            .distinct()
    return requireExactlyOne("\"$key\" response field in $parser", stores)
}

/**
 * The feed item `Media` field filled from [key]. The case parses the media into a local; the
 * parser assigns all locals to the item at the end, so the store is the one that local reaches.
 */
private fun Method.feedItemMediaFieldFor(
    key: String,
    feedItemDescriptor: String,
): FieldReference {
    val instructions = instructionList()
    val valueIndex =
        requireExactlyOne(
            "\"$key\" Media value in $this",
            instructions.caseOf(key, this).filter { index ->
                instructions[index].opcode == Opcode.MOVE_RESULT_OBJECT &&
                    instructions[index - 1].getReference<MethodReference>()?.returnType == MEDIA_DESCRIPTOR
            },
        )
    val valueRegister = (instructions[valueIndex] as OneRegisterInstruction).registerA
    val stores =
        instructions.indices.filter { index ->
            val instruction = instructions[index]
            val field = instruction.fieldReference()
            instruction.opcode == Opcode.IPUT_OBJECT &&
                field?.definingClass == feedItemDescriptor &&
                field.type == MEDIA_DESCRIPTOR &&
                instructions.valueReachesRegister(
                    valueIndex,
                    valueRegister,
                    index,
                    (instruction as TwoRegisterInstruction).registerA,
                )
        }
    val store = requireExactlyOne("feed item field for \"$key\" in $this", stores)
    return instructions[store].fieldReference()!!.immutable()
}

private val FIELD_STORE_OPCODES =
    setOf(
        Opcode.IPUT,
        Opcode.IPUT_OBJECT,
        Opcode.IPUT_BOOLEAN,
        Opcode.IPUT_WIDE,
        Opcode.IPUT_BYTE,
        Opcode.IPUT_CHAR,
        Opcode.IPUT_SHORT,
    )

private fun Method.instructionList(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.stringValue(): String? = getReference<StringReference>()?.string

private fun Instruction.fieldReference(): FieldReference? = getReference<FieldReference>()

private fun FieldReference.immutable(): FieldReference = ImmutableFieldReference(definingClass, name, type)

private fun FieldReference.sameFieldAs(other: FieldReference): Boolean =
    definingClass == other.definingClass && name == other.name && type == other.type

private fun FieldReference.requireType(expected: String) {
    if (type != expected) throw PatchException("Expected $this to be of type $expected")
}

/** Argument registers of an invoke, in operand order. */
private fun Instruction.argumentRegisters(): List<Int> =
    when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }
