package io.github.sabopura.morphe.patches.reddit.autotranslate

import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.reddit.Constants.REDDIT
import java.util.logging.Logger

private const val EXTENSION = "Lio/github/sabopura/morphe/extension/reddit/AutoTranslate;"
private const val FUNCTION_1 = "Lkotlin/jvm/functions/Function1;"
private const val STRING = "Ljava/lang/String;"
private const val COMMENT_TRANSLATE_EVENT_TO_STRING = "OnClickTranslateEvent("
private const val POST_DETAIL_ID_TO_STRING = "linkIdWithKind="
private val languageTagPattern = Regex("^[A-Za-z]{2,3}(?:-[A-Za-z0-9]{2,8})*\$")
private val logger = Logger.getLogger("Morphe.Reddit.AutoTranslate")

private fun FieldReference.toSmali() = "$definingClass->$name:$type"

@Suppress("unused")
val autoTranslatePatch = bytecodePatch(
    name = "Auto-translate Reddit content",
    description = "Automatically invokes Reddit's existing post and comment translation path.",
    default = true,
) {
    compatibleWith(REDDIT)

    val autoTranslateOption = booleanOption(
        key = "auto_translate",
        default = true,
        title = "Auto-translate",
        description = "Translate visible posts and comments without tapping the translate indicator.",
    )

    val targetLanguageOption = stringOption(
        key = "target_language",
        default = "ja",
        title = "Target language",
        description = "BCP-47 language tag sent through Reddit's translation request header.",
        required = true,
    ) { value -> value != null && languageTagPattern.matches(value) }

    extendWith("extensions/reddit.mpe")

    execute {
        if (autoTranslateOption.value != true) return@execute

        val languageTag = targetLanguageOption.value
            ?: throw IllegalStateException("target_language is required")
        val translationHeader = "enabled, seo, $languageTag"

        fun instructions(match: Match): List<Instruction> =
            match.originalMethod.implementation?.instructions?.toList()
                ?: throw PatchException("Matched Reddit callback has no implementation")

        fun selectorIn(callbackInstructions: List<Instruction>, owner: String, anchorIndex: Int): Int {
            val addresses = IntArray(callbackInstructions.size)
            var address = 0
            callbackInstructions.forEachIndexed { index, instruction ->
                addresses[index] = address
                address += instruction.codeUnits
            }

            val switchIndex = callbackInstructions.indexOfFirst {
                it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH
            }
            if (switchIndex < 0) {
                throw PatchException(
                    "Cannot derive the selector for $owner: no switch",
                )
            }

            val switchInstruction = callbackInstructions[switchIndex] as OffsetInstruction
            val switchAddress = addresses[switchIndex]
            val payloadAddress = switchAddress + switchInstruction.codeOffset
            val payloadIndex = addresses.indexOf(payloadAddress)
            val payload = callbackInstructions.getOrNull(payloadIndex) as? SwitchPayload
                ?: throw PatchException(
                    "Cannot derive the selector for $owner: no payload",
                )

            val anchorAddress = addresses[anchorIndex]
            val explicitKeys = payload.switchElements.map { it.key }
            val defaultSelector = (explicitKeys.maxOrNull() ?: -1) + 1
            val branchTargets = payload.switchElements
                .map { element -> element.key to switchAddress + element.offset } +
                (defaultSelector to (switchAddress + switchInstruction.codeUnits))
            val containingBranch = branchTargets
                .filter { (_, targetAddress) -> targetAddress <= anchorAddress }
                .maxByOrNull { (_, targetAddress) -> targetAddress }

            // R8 emits the final synthetic-lambda branch as switch fall-through. Its selector is
            // one greater than the largest dense key (for example Compact changed from default=4
            // in 2026.28.0 to an explicit case=0 in 2026.30.0).
            return containingBranch?.first
                ?: throw PatchException(
                    "Cannot map the translation branch for $owner",
                )
        }

        fun selectorAt(match: Match, anchorIndex: Int): Int =
            selectorIn(instructions(match), match.originalClassDef.type, anchorIndex)

        fun fieldReference(instruction: Instruction): FieldReference? =
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)

        fun postAnchors(match: Match): Triple<FieldReference, FieldReference?, FieldReference> {
            val stateMatch = match.instructionMatches.first()
            val stateReference = fieldReference(stateMatch.instruction)
                ?: throw PatchException("Post state anchor is not a field reference")
            val callbackInstructions = instructions(match)
            val window = callbackInstructions.subList(
                maxOf(0, stateMatch.index - 8),
                stateMatch.index,
            )
            val priorFields = window.mapNotNull(::fieldReference)
            val idReference = priorFields.firstOrNull {
                it.definingClass == stateReference.definingClass && it.type == STRING
            } ?: throw PatchException(
                "Cannot derive the post id field for ${match.originalClassDef.type}",
            )
            val containerReference = priorFields.firstOrNull {
                it.type == stateReference.definingClass &&
                    it.definingClass != match.originalClassDef.type
            }
            return Triple(idReference, containerReference, stateReference)
        }

        var patchedPostConstructors = 0
        fun hookPostConstructors(
            methods: Iterable<MutableMethod>,
            owner: String,
            capturedType: String,
            idReference: FieldReference,
            containerReference: FieldReference?,
            stateReference: FieldReference,
            selector: Int,
        ) {
            val constructors = methods.filter { constructor ->
                val parameterTypes = constructor.parameterTypes.map(CharSequence::toString)
                constructor.name == "<init>" &&
                    parameterTypes.size == 3 &&
                    parameterTypes.last() == "I" &&
                    capturedType in parameterTypes
            }
            if (constructors.isEmpty()) {
                throw PatchException("Cannot find a post callback constructor for $owner")
            }

            constructors.forEach { constructor ->
                val parameterTypes = constructor.parameterTypes.map(CharSequence::toString)
                val capturedIndex = parameterTypes.indexOf(capturedType)
                val scratchIndex = parameterTypes.indices.first {
                    it != capturedIndex && parameterTypes[it] != "I"
                }
                val capturedRegister = "p${capturedIndex + 1}"
                val scratchRegister = "p${scratchIndex + 1}"
                val selectorRegister = "p${parameterTypes.lastIndex + 1}"
                val fieldLoads = if (containerReference == null) {
                    """
                        iget-object $scratchRegister, $capturedRegister, ${idReference.toSmali()}
                        iget-object $capturedRegister, $capturedRegister, ${stateReference.toSmali()}
                    """.trimIndent()
                } else {
                    """
                        iget-object $scratchRegister, $capturedRegister, ${containerReference.toSmali()}
                        iget-object $capturedRegister, $scratchRegister, ${idReference.toSmali()}
                        iget-object $scratchRegister, $scratchRegister, ${stateReference.toSmali()}
                    """.trimIndent()
                }
                val callbackArguments = if (containerReference == null) {
                    "$scratchRegister, $capturedRegister"
                } else {
                    "$capturedRegister, $scratchRegister"
                }

                constructor.addInstructionsWithLabels(
                    constructor.implementation!!.instructions.lastIndex,
                    """
                        const/16 $scratchRegister, $selector
                        if-ne $selectorRegister, $scratchRegister, :auto_translate_skip
                        $fieldLoads
                        invoke-static {p0, $callbackArguments}, $EXTENSION->onPost(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
                        :auto_translate_skip
                        nop
                    """,
                )
                patchedPostConstructors++
            }
            logger.info("Matched post callback $owner with selector $selector")
        }

        val postMatches = PostTranslateCallbackFingerprint.matchAllOrNull().orEmpty()
        postMatches.forEach { match ->
            val (idReference, containerReference, stateReference) = postAnchors(match)
            hookPostConstructors(
                match.classDef.methods,
                match.originalClassDef.type,
                containerReference?.definingClass ?: stateReference.definingClass,
                idReference,
                containerReference,
                stateReference,
                selectorAt(match, match.instructionMatches.first().index),
            )
        }

        // 2026.40.0: the post component builds the event in its own method, and the callbacks
        // capture the component and call that method. The component holds the post element
        // (id and indicator state), so hook the callbacks' constructors the same way.
        val postFactoryMatches = PostTranslateEventFactoryFingerprint.matchAllOrNull().orEmpty()
        var postFactoryCallbacks = 0
        postFactoryMatches.forEach { match ->
            val factory = match.originalMethod
            val owner = match.originalClassDef.type
            val stateMatch = match.instructionMatches.first()
            val stateReference = fieldReference(stateMatch.instruction)
                ?: throw PatchException("Post state anchor is not a field reference")
            val priorFields = instructions(match)
                .subList(maxOf(0, stateMatch.index - 8), stateMatch.index)
                .mapNotNull(::fieldReference)
            val containerReference = priorFields.firstOrNull {
                it.type == stateReference.definingClass && it.definingClass == owner
            } ?: throw PatchException("Cannot derive the post element field of $owner")
            val idReference = priorFields.firstOrNull {
                it.definingClass == stateReference.definingClass && it.type == STRING
            } ?: throw PatchException("Cannot derive the post id field for $owner")

            val callers = mutableListOf<Pair<ClassDef, Int>>()
            classDefForEach { classDef ->
                if (classDef.fields.none { it.type == owner }) return@classDefForEach
                val invoke = classDef.methods.firstOrNull {
                    it.name == "invoke" && it.parameterTypes.isEmpty() &&
                        it.returnType == "Ljava/lang/Object;"
                } ?: return@classDefForEach
                val callbackInstructions = invoke.implementation?.instructions?.toList()
                    ?: return@classDefForEach
                val callIndex = callbackInstructions.indexOfFirst { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference != null && reference.definingClass == owner &&
                        reference.name == factory.name && reference.parameterTypes.isEmpty() &&
                        reference.returnType == POST_EVENT
                }
                if (callIndex < 0) return@classDefForEach
                callers += classDef to selectorIn(callbackInstructions, classDef.type, callIndex)
            }
            if (callers.isEmpty()) {
                throw PatchException("No post callback calls the translation event method of $owner")
            }
            callers.forEach { (classDef, selector) ->
                hookPostConstructors(
                    mutableClassDefBy(classDef).methods,
                    classDef.type,
                    owner,
                    idReference,
                    containerReference,
                    stateReference,
                    selector,
                )
                postFactoryCallbacks++
            }
        }

        val commentMatches = CommentTranslateCallbackFingerprint.matchAllOrNull().orEmpty()
        var patchedCommentConstructors = 0
        commentMatches.forEach { match ->
            val stateMatch = match.instructionMatches.first()
            val stateReference = fieldReference(stateMatch.instruction)
                ?: throw PatchException("Comment state anchor is not a field reference")
            val priorFields = instructions(match)
                .subList(maxOf(0, stateMatch.index - 8), stateMatch.index)
                .mapNotNull(::fieldReference)
            val containerReference = priorFields.firstOrNull {
                it.type == stateReference.definingClass &&
                    it.definingClass != match.originalClassDef.type
            } ?: throw PatchException(
                "Cannot derive the comment state container for ${match.originalClassDef.type}",
            )
            val capturedType = containerReference.definingClass
            val idReference = priorFields.firstOrNull {
                it.definingClass == capturedType && it.type == STRING
            } ?: throw PatchException(
                "Cannot derive the comment id field for ${match.originalClassDef.type}",
            )
            val selector = selectorAt(match, stateMatch.index)
            val constructors = match.classDef.methods.filter { constructor ->
                val parameterTypes = constructor.parameterTypes.map(CharSequence::toString)
                constructor.name == "<init>" &&
                    capturedType in parameterTypes &&
                    FUNCTION_1 in parameterTypes &&
                    (parameterTypes.size == 2 ||
                        (parameterTypes.size == 3 && parameterTypes.last() == "I"))
            }
            if (constructors.isEmpty()) {
                throw PatchException(
                    "Cannot find a comment callback constructor for ${match.originalClassDef.type}",
                )
            }

            constructors.forEach { constructor ->
                val parameterTypes = constructor.parameterTypes.map(CharSequence::toString)
                val capturedIndex = parameterTypes.indexOf(capturedType)
                val scratchIndex = parameterTypes.indexOf(FUNCTION_1)
                val capturedRegister = "p${capturedIndex + 1}"
                val scratchRegister = "p${scratchIndex + 1}"
                val selectorGuard = if (parameterTypes.lastOrNull() == "I") {
                    """
                        const/16 $scratchRegister, $selector
                        if-ne p${parameterTypes.size}, $scratchRegister, :auto_translate_skip
                    """.trimIndent()
                } else {
                    ""
                }

                constructor.addInstructionsWithLabels(
                    constructor.implementation!!.instructions.lastIndex,
                    """
                        $selectorGuard
                        iget-object $scratchRegister, $capturedRegister, ${idReference.toSmali()}
                        iget-object $capturedRegister, $capturedRegister, ${containerReference.toSmali()}
                        iget-object $capturedRegister, $capturedRegister, ${stateReference.toSmali()}
                        invoke-static {p0, $scratchRegister, $capturedRegister}, $EXTENSION->onComment(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
                        :auto_translate_skip
                        nop
                    """,
                )
                patchedCommentConstructors++
            }
            logger.info(
                "Matched comment callback ${match.originalClassDef.type} with selector $selector",
            )
        }

        // The accessibility callback class also holds the "show original" action next to the
        // translate action. Only the translate branch may be invoked automatically, otherwise a
        // freshly translated comment is reverted again.
        val translateEventClasses = mutableMapOf<String, Boolean>()
        fun isTranslateEvent(type: String) = translateEventClasses.getOrPut(type) {
            classDefByOrNull(type)?.methods
                ?.firstOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
                ?.implementation?.instructions
                ?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string?.startsWith(COMMENT_TRANSLATE_EVENT_TO_STRING) == true
                } == true
        }

        val accessibilityMatches =
            AccessibilityCommentTranslateCallbackFingerprint.matchAllOrNull().orEmpty()
        var patchedAccessibilityConstructors = 0
        accessibilityMatches.forEach { match ->
            val callbackInstructions = instructions(match)
            val indicatorIndexes = callbackInstructions.mapIndexedNotNull { index, instruction ->
                val reference = fieldReference(instruction)
                index.takeIf {
                    reference?.definingClass == COMMENT_EVENT_SOURCE &&
                        reference.name == "INDICATOR" &&
                        reference.type == COMMENT_EVENT_SOURCE
                }
            }.filter { indicatorIndex ->
                val eventConstructor = callbackInstructions
                    .drop(indicatorIndex + 1)
                    .firstNotNullOfOrNull { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                            ?.takeIf {
                                instruction.opcode == Opcode.INVOKE_DIRECT &&
                                    it.name == "<init>" &&
                                    it.parameterTypes.map(CharSequence::toString)
                                        .containsAll(listOf(STRING, COMMENT_EVENT_SOURCE))
                            }
                    }
                eventConstructor != null && isTranslateEvent(eventConstructor.definingClass)
            }
            val selectors = indicatorIndexes.map { selectorAt(match, it) }.distinct().sorted()
            if (selectors.isEmpty()) {
                logger.warning(
                    "Skipped accessibility callback ${match.originalClassDef.type}: " +
                        "no translate-only selector",
                )
                return@forEach
            }
            val constructors = match.classDef.methods.filter { constructor ->
                constructor.name == "<init>" &&
                    constructor.parameterTypes.map(CharSequence::toString) ==
                    listOf(FUNCTION_1, STRING, "I")
            }
            if (constructors.isEmpty()) {
                throw PatchException(
                    "Cannot find an accessibility callback constructor for " +
                        match.originalClassDef.type,
                )
            }

            val selectorChecks = buildString {
                selectors.forEachIndexed { index, selector ->
                    appendLine("const/16 p1, $selector")
                    if (index < selectors.lastIndex) {
                        appendLine("if-eq p3, p1, :auto_translate_run")
                    } else {
                        appendLine("if-ne p3, p1, :auto_translate_skip")
                    }
                }
            }
            constructors.forEach { constructor ->
                constructor.addInstructionsWithLabels(
                    constructor.implementation!!.instructions.lastIndex,
                    """
                        $selectorChecks
                        :auto_translate_run
                        invoke-static {p0, p2}, $EXTENSION->onAccessibilityComment(Ljava/lang/Object;Ljava/lang/String;)V
                        :auto_translate_skip
                        nop
                    """,
                )
                patchedAccessibilityConstructors++
            }
            logger.info(
                "Matched accessibility callback ${match.originalClassDef.type} with selectors $selectors",
            )
        }

        fun invokeArgumentRegisters(instruction: Instruction): List<Int> = when (instruction) {
            is RegisterRangeInstruction ->
                List(instruction.registerCount) { instruction.startRegister + it }
            is FiveRegisterInstruction -> listOf(
                instruction.registerC,
                instruction.registerD,
                instruction.registerE,
                instruction.registerF,
                instruction.registerG,
            ).take(instruction.registerCount)
            else -> emptyList()
        }

        // The post-detail screen uses its own indicator lambda, which captures neither the post
        // nor its id. Hook the composable instead: note the metadata model when its indicator
        // state is read, then hand the composed click lambda and state to the extension.
        val postDetailMatches =
            PostDetailTranslationIndicatorFingerprint.matchAllOrNull().orEmpty() +
                PostDetailTranslationIndicatorWithFlagFingerprint.matchAllOrNull().orEmpty()
        var patchedPostDetailMethods = 0
        postDetailMatches.forEach { match ->
            val stateMatch = match.instructionMatches.first()
            val indicatorMatch = match.instructionMatches.last()
            val metadataType = fieldReference(stateMatch.instruction)?.definingClass
            val hasPostIdAnchor = metadataType?.let(::classDefByOrNull)?.methods
                ?.firstOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
                ?.implementation?.instructions
                ?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string?.contains(POST_DETAIL_ID_TO_STRING) == true
                } == true
            val metadataRegister = (stateMatch.instruction as? TwoRegisterInstruction)
                ?.takeIf { it.registerA != it.registerB }
                ?.registerB
            val arguments = invokeArgumentRegisters(indicatorMatch.instruction)
            // Every parameter of the indicator call is one register wide, so the arguments line
            // up with the parameter types (2026.44.0 added a boolean before the click lambda).
            val indicatorParameters =
                ((indicatorMatch.instruction as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.parameterTypes?.map(CharSequence::toString).orEmpty()
            val stateRegister = arguments.getOrNull(indicatorParameters.indexOf(COMMENT_INDICATOR_STATE))
            val callbackRegister = arguments.getOrNull(indicatorParameters.indexOf(FUNCTION_0))
            if (!hasPostIdAnchor || metadataRegister == null || stateRegister == null ||
                callbackRegister == null || stateRegister > 15 || callbackRegister > 15
            ) {
                logger.warning(
                    "Skipped post-detail indicator in ${match.originalClassDef.type}: " +
                        "unexpected metadata or registers",
                )
                return@forEach
            }

            // Insert the later hook first so the earlier index stays valid.
            match.method.addInstructions(
                indicatorMatch.index + 1,
                "invoke-static {v$callbackRegister, v$stateRegister}, " +
                    "$EXTENSION->onPostDetail(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
            match.method.addInstructions(
                stateMatch.index + 1,
                "invoke-static {v$metadataRegister}, " +
                    "$EXTENSION->notePostDetail(Ljava/lang/Object;)V",
            )
            patchedPostDetailMethods++
            logger.info("Matched post-detail indicator ${match.originalClassDef.type}")
        }

        // Each path must be hooked somewhere; a release that moves one of them must fail here
        // instead of shipping a patch that silently translates only part of the app.
        val unpatched = listOfNotNull(
            "post".takeIf { patchedPostConstructors == 0 },
            "comment".takeIf { patchedCommentConstructors == 0 },
            "post detail".takeIf { patchedPostDetailMethods == 0 },
        )
        if (unpatched.isNotEmpty()) {
            throw PatchException(
                "No Reddit auto-translation anchor matched for: ${unpatched.joinToString()}",
            )
        }

        val headerMatch = TranslationHeaderFingerprint.matchOrNull()
        if (headerMatch == null) {
            logger.warning(
                "Translation header anchor was not found; callbacks were patched but target_language " +
                    "could not be overridden",
            )
        } else {
            headerMatch.instructionMatches.take(2).forEach { instructionMatch ->
                val register =
                    (instructionMatch.instruction as OneRegisterInstruction).registerA
                headerMatch.method.replaceInstruction(
                    instructionMatch.index,
                    "const-string v$register, \"$translationHeader\"",
                )
            }
        }

        logger.info(
            "Patched Reddit auto-translation anchors: " +
                "post=${postMatches.size}+factory=${postFactoryMatches.size}/" +
                "callbacks=$postFactoryCallbacks/constructors=$patchedPostConstructors, " +
                "comment=${commentMatches.size}/constructors=$patchedCommentConstructors, " +
                "accessibility=${accessibilityMatches.size}/" +
                "constructors=$patchedAccessibilityConstructors, " +
                "postDetail=${postDetailMatches.size}/methods=$patchedPostDetailMethods, " +
                "header=${headerMatch != null}",
        )
    }
}
