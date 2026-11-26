package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val POST_EXTENSION_CLASS = "Lapp/pomee4/extension/commentswipe/PostSwipe;"

/**
 * toString starts of the post child sections that have their own horizontal swipes.
 */
private val OWN_SWIPE_SECTIONS = listOf(
    "GallerySection(", "PostCarouselSection(", "VideoCarouselSection(", "AmaCarouselSection(",
)

private val FIELD_STORES = setOf(
    Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN,
    Opcode.IPUT_BYTE, Opcode.IPUT_CHAR, Opcode.IPUT_SHORT,
)

/**
 * Parameters of the feed post section constructor, in order. The section is a Kotlin data class, so
 * its constructor takes its properties in this order and stores each in its field.
 */
private const val SECTION_LINK_ID = 0
private const val SECTION_CHILDREN = 1
private const val SECTION_UNIQUE_ID = 2
private const val SECTION_IDENTIFIER = 3
private const val SECTION_PROMOTED = 4
private const val SECTION_RECOMMENDED = 5
private const val SECTION_SUBREDDIT_MEMBER = 6

/**
 * Swipe actions on posts. Every Reddit post list (feeds, subreddits, profiles, saved posts, history)
 * draws its posts with the same feed post section, so these hooks cover all of them.
 */
internal val postSwipePatch = bytecodePatch {
    // Adds the extension.
    dependsOn(settingsRowPatch)

    execute {
        val section = FeedPostSectionToStringFingerprint.originalClassDef
        val sectionFields = constructorFields(section)

        // The composable of the section takes the feed context, which takes the feed events.
        val sectionComposable = section.methods.firstOrNull { method ->
            method.returnType == "V" && method.parameterTypes.size == 3 &&
                method.parameterTypes[2].toString() == "I"
        } ?: throw PatchException("No composable in ${section.type}")
        val contextType = sectionComposable.parameterTypes[0].toString()
        val context = classDefBy(contextType)

        // The card content lambda, created by the composable with the section and the context.
        val cardLambda = classDefBy { classDef ->
            classDef.methods.any { method ->
                method.name == "<init>" && method.parameterTypes.size >= 2 &&
                    method.parameterTypes[0].toString() == section.type &&
                    method.parameterTypes[1].toString() == contextType
            }
        }
        val cardInvoke = cardLambda.methods.firstOrNull { it.name == "invoke" && it.parameterTypes.size == 2 }
            ?: throw PatchException("No invoke in ${cardLambda.type}")

        // The card puts its bounds in the window into a state, with an onGloballyPositioned lambda:
        // new-instance <lambda>, invoke-direct <lambda>-><init>(<state type>, I).
        val cardFieldTypes = cardLambda.fields.associateBy { it.type }
        val positionedLambdaInit = cardInvoke.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT) return@firstNotNullOfOrNull null
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            val parameters = reference.parameterTypes.map { it.toString() }
            reference.takeIf {
                it.name == "<init>" && parameters.size == 2 && parameters[1] == "I" &&
                    parameters[0] in cardFieldTypes
            }
        } ?: throw PatchException("No bounds lambda in ${cardLambda.type}")
        val boundsType = positionedLambdaInit.parameterTypes[0].toString()

        val cardSectionField = cardLambda.fields.single { it.type == section.type }
        val cardContextField = cardLambda.fields.single { it.type == contextType }
        val cardBoundsField = cardLambda.fields.single { it.type == boundsType }

        // Register the card when its content is composed.
        mutableClassDefBy(cardLambda.type).methods.single {
            it.name == cardInvoke.name && it.parameterTypes == cardInvoke.parameterTypes
        }.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v1, v0, $cardSectionField
                iget-object v2, v0, $cardContextField
                iget-object v0, v0, $cardBoundsField
                invoke-static { v1, v2, v0 }, $POST_EXTENSION_CLASS->onPostCard(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            """
        )

        // Keep the layout coordinates the card gets when it is positioned. They are live, so they give
        // the card's position at the time of a swipe, also while the list scrolls.
        val positionedLambda = mutableClassDefBy(positionedLambdaInit.definingClass)
        val positionedBoundsField = positionedLambda.fields.single { it.type == boundsType }
        val positionedInvoke = positionedLambda.methods.single {
            it.name == "invoke" && it.parameterTypes.size == 1
        }

        // The card's bounds are made with localToWindow(Offset.Zero) and size of the coordinates.
        val coordinateCalls = positionedInvoke.implementation!!.instructions
            .filter { it.opcode == Opcode.INVOKE_INTERFACE }
            .map { (it as ReferenceInstruction).reference as MethodReference }
        val localToWindow = coordinateCalls.firstOrNull { call ->
            call.returnType == "J" && call.parameterTypes.map { it.toString() } == listOf("J") &&
                coordinateCalls.any { it.definingClass == call.definingClass && it.returnType == "J" && it.parameterTypes.isEmpty() }
        } ?: throw PatchException("No localToWindow call in ${positionedLambda.type}")
        val coordinatesType = localToWindow.definingClass
        val size = coordinateCalls.first {
            it.definingClass == coordinatesType && it.returnType == "J" && it.parameterTypes.isEmpty()
        }
        val isAttached = classDefBy(coordinatesType).methods.filter {
            it.returnType == "Z" && it.parameterTypes.isEmpty()
        }.singleOrNull() ?: throw PatchException("No isAttached in $coordinatesType")

        positionedInvoke.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, $positionedBoundsField
                move-object/from16 v1, p1
                invoke-static { v0, v1 }, $POST_EXTENSION_CLASS->onBoundsChanged(Ljava/lang/Object;Ljava/lang/Object;)V
            """
        )

        implementStub(
            "isCoordinates", "Z",
            """
                instance-of p1, p0, $coordinatesType
                return p1
            """
        )
        implementStub(
            "coordinatesAttached", "Z",
            """
                check-cast p0, $coordinatesType
                invoke-interface { p0 }, $coordinatesType->${isAttached.name}()Z
                move-result p1
                return p1
            """
        )
        implementStub(
            "coordinatesWindowOffset", "J",
            """
                check-cast p0, $coordinatesType
                const-wide/16 v0, 0x0
                invoke-interface { p0, v0, v1 }, $coordinatesType->${localToWindow.name}(J)J
                move-result-wide v0
                return-wide v0
            """,
            localRegisters = 2
        )
        implementStub(
            "coordinatesSize", "J",
            """
                check-cast p0, $coordinatesType
                invoke-interface { p0 }, $coordinatesType->${size.name}()J
                move-result-wide v0
                return-wide v0
            """,
            localRegisters = 2
        )

        // boundsInWindow(coordinates, clipBounds = true): the part of the layout its parents show, as the
        // same lambda uses it for another of its cases.
        val visibleBounds = coordinateCallsStatic(positionedInvoke).firstOrNull { call ->
            call.parameterTypes.map { it.toString() } == listOf(coordinatesType, "Z") &&
                call.returnType.startsWith("L")
        } ?: throw PatchException("No boundsInWindow call in ${positionedLambda.type}")
        implementStub(
            "coordinatesVisibleBounds", "Ljava/lang/Object;",
            """
                check-cast p0, $coordinatesType
                const/4 p1, 0x1
                invoke-static { p0, p1 }, $visibleBounds
                move-result-object p0
                return-object p0
            """
        )

        // Posts, for their saved state, vote, author and subreddit.
        LinkConstructorFingerprint.method.apply {
            instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static/range { p0 .. p0 }, $POST_EXTENSION_CLASS->onLinkCreated(Ljava/lang/Object;)V"
                    )
                }
        }

        // Accessors of the section and the context.
        fun sectionField(parameter: Int, expectedType: String? = null): FieldReference =
            sectionFields[parameter]?.also {
                if (expectedType != null && it.type != expectedType) {
                    throw PatchException("Unexpected section field $it, expected type $expectedType")
                }
            } ?: throw PatchException("No field for section parameter $parameter in ${section.type}: $sectionFields")

        fun getter(name: String, returnType: String, field: FieldReference) {
            val (get, ret) = when (returnType) {
                "Z" -> "iget-boolean" to "return"
                else -> "iget-object" to "return-object"
            }
            implementStub(
                name, returnType,
                """
                    check-cast p0, ${field.definingClass}
                    $get p1, p0, $field
                    $ret p1
                """
            )
        }

        getter("sectionLinkKindWithId", "Ljava/lang/String;", sectionField(SECTION_LINK_ID, "Ljava/lang/String;"))
        getter("sectionUniqueId", "Ljava/lang/String;", sectionField(SECTION_UNIQUE_ID, "Ljava/lang/String;"))
        getter("sectionIdentifier", "Ljava/lang/Object;", sectionField(SECTION_IDENTIFIER))
        getter("sectionPromoted", "Z", sectionField(SECTION_PROMOTED, "Z"))
        getter("sectionRecommended", "Z", sectionField(SECTION_RECOMMENDED, "Z"))
        getter("sectionSubredditMember", "Z", sectionField(SECTION_SUBREDDIT_MEMBER, "Z"))
        getter("sectionChildren", "Ljava/lang/Object;", sectionField(SECTION_CHILDREN))

        val positionModifier = positionModifier(cardInvoke)
        conversationPosts(positionModifier, contextType)
        previewPosts(positionModifier, contextType)

        // Child sections with their own horizontal swipes, where a post swipe is not started.
        val ownSwipeSections = OWN_SWIPE_SECTIONS.flatMap { prefix ->
            classDefByStrings(prefix, StringComparisonType.STARTS_WITH)
                .filter { classDef -> classDef.methods.any { it.name == "toString" } }
                .map { it.type }
        }.distinct()
        if (ownSwipeSections.isEmpty()) throw PatchException("No gallery or carousel sections found")
        implementStub(
            "isOwnSwipeSection", "Z",
            ownSwipeSections.joinToString("\n") { type ->
                "instance-of p1, p0, $type\nif-nez p1, :own"
            } + """
                const/4 p1, 0x0
                return p1
                :own
                const/4 p1, 0x1
                return p1
            """
        )
        ownSwipeAreas(ownSwipeSections, positionModifier, sectionComposable)
        barHook(positionModifier)

        val sinkField = context.fields.firstOrNull { it.type == "Lkotlin/jvm/functions/Function1;" }
            ?: throw PatchException("No event sink in $contextType")
        getter("contextEventSink", "Ljava/lang/Object;", sinkField)

        // The transition parameters of Open comments, made from the context like the comment button does.
        val transitionType = OpenCommentsEventFingerprint.originalClassDef.methods
            .first { it.name == "<init>" && it.parameterTypes.size == 6 }
            .parameterTypes[4].toString()
        val transitionHelper = classDefBy { classDef ->
            classDef.methods.any { it.isTransitionHelper(contextType, transitionType) }
        }.methods.first { it.isTransitionHelper(contextType, transitionType) }
        implementStub(
            "contextTransitionParams", "Ljava/lang/Object;",
            """
                check-cast p0, $contextType
                invoke-static { p0 }, ${transitionHelper.definingClass}->${transitionHelper.name}($contextType)$transitionType
                move-result-object p1
                return-object p1
            """
        )
    }
}

private fun Method.isTransitionHelper(contextType: String, transitionType: String) =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == transitionType &&
        parameterTypes.map { it.toString() } == listOf(contextType)

/**
 * @return The fields the constructor of a data class stores its parameters in, by parameter position.
 */
internal fun constructorFields(classDef: ClassDef): Map<Int, FieldReference> {
    val constructor = classDef.methods
        .filter { it.name == "<init>" }
        .maxByOrNull { it.parameterTypes.size }
        ?: throw PatchException("No constructor in ${classDef.type}")
    val implementation = constructor.implementation
        ?: throw PatchException("No code in ${classDef.type} constructor $constructor")
    val parameterRegisterCount = constructor.parameterTypes.sumOf { type ->
        if (type.toString() == "J" || type.toString() == "D") 2.toInt() else 1.toInt()
    }
    val thisRegister = implementation.registerCount - parameterRegisterCount - 1

    // The register of each parameter. Long and double parameters take two registers.
    val parameterRegisters = mutableMapOf<Int, Int>()
    var register = thisRegister + 1
    constructor.parameterTypes.forEachIndexed { index, type ->
        parameterRegisters[register] = index
        register += if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }

    val fields = mutableMapOf<Int, FieldReference>()
    implementation.instructions.forEach { instruction ->
        if (instruction.opcode in FIELD_STORES && instruction is TwoRegisterInstruction &&
            instruction.registerB == thisRegister
        ) {
            val index = parameterRegisters[instruction.registerA] ?: return@forEach
            val field = (instruction as ReferenceInstruction).reference as FieldReference
            if (field.definingClass == classDef.type) fields.putIfAbsent(index, field)
        }
    }
    if (fields.isEmpty()) {
        throw PatchException(
            "No constructor fields in ${classDef.type}: registers ${implementation.registerCount}, this v$thisRegister, " +
                implementation.instructions.take(6).joinToString { "${it.opcode} ${it.javaClass.simpleName}" }
        )
    }
    return fields
}

/**
 * Replaces a stub of the extension, which has an object parameter and an unused scratch parameter, with
 * the given body, which uses the parameter registers and the given number of local registers.
 */
internal fun BytecodePatchContext.implementStub(
    name: String,
    returnType: String,
    smali: String,
    localRegisters: Int = 0,
) {
    mutableClassDefBy(POST_EXTENSION_CLASS).apply {
        val stub = methods.single { it.name == name }
        methods.remove(stub)
        ImmutableMethod(
            type,
            name,
            listOf(
                ImmutableMethodParameter("Ljava/lang/Object;", null, null),
                ImmutableMethodParameter("Ljava/lang/Object;", null, null),
            ),
            returnType,
            stub.accessFlags,
            null,
            null,
            MutableMethodImplementation(2 + localRegisters),
        ).toMutable().apply {
            addInstructionsWithLabels(0, smali)
        }.let(methods::add)
    }
}

private fun coordinateCallsStatic(method: Method) = method.implementation!!.instructions
    .filter { it.opcode == Opcode.INVOKE_STATIC }
    .map { (it as ReferenceInstruction).reference as MethodReference }
