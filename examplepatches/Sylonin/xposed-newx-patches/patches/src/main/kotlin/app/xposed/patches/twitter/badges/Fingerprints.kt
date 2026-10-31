package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.xposed.patches.twitter.util.Abstract
import app.xposed.patches.twitter.util.RegisterFlow
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.isInterface
import app.xposed.patches.twitter.util.methodRef
import com.android.tools.smali.dexlib2.Opcode

internal const val MODIFIER = "Landroidx/compose/ui/Modifier;"
internal const val COMPOSER = "Landroidx/compose/runtime/Composer;"
internal const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
internal const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
internal const val STRING = "Ljava/lang/String;"
internal const val LOG_EVENT = "Lcom/x/thrift/clientapp/gen/LogEvent;"

/** XApplication.onCreate. */
internal object ApplicationOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    custom = { _, classDef -> classDef.superclass == "Landroid/app/Application;" },
)

/** A GraphqlApiImpl method; its instances are the app's authenticated GraphQL clients. */
internal object GraphqlApiFingerprint : Fingerprint(
    strings = listOf("GraphqlApiImpl-unresolved-"),
)

/** The about-profile repository's user mapper; other mappers share the string. */
internal object AboutRepositoryFingerprint : Fingerprint(
    strings = listOf("Missing GraphqlUser.screen_name for "),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.parameterTypes.map { it.toString() } ==
                listOf(STRING, "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
        }
    },
)

internal object UserWithAboutToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UserWithProfileAboutMetadata(user="),
)

internal object AboutMetadataToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ProfileAboutMetadata(basedInCountry="),
)

internal object AffiliateDataToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("AffiliateData(url="),
)

internal object MinimalUserToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("MinimalUser(id="),
)

/** The Affiliate item of a name's badge list. */
internal object AffiliateBadgeToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Affiliate(contentDescription="),
)

internal object AvailablePostToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("AvailablePost(entryId="),
)

/** The client event reporter every LogEvent goes through. */
internal object EventReporterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(LOG_EVENT, "Z"),
    strings = listOf("Skipping event with empty event name"),
)

/** The User interface's default handle(): "@" + screenName(). */
internal object UserHandleFingerprint : Fingerprint(
    returnType = STRING,
    parameters = listOf(),
    strings = listOf("@"),
    custom = { method, classDef ->
        val first = method.instructionList.firstOrNull()
        classDef.isInterface() &&
            first?.opcode == Opcode.INVOKE_INTERFACE &&
            first.methodRef!!.let { it.definingClass == classDef.type && it.parameterTypes.isEmpty() && it.returnType == STRING } &&
            classDef.methods.any { it.name == "getId" && it.parameterTypes.isEmpty() }
    },
)

/** CanvasDrawScope.DrawParams. */
internal object DrawParamsToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("DrawParams(density="),
)

/** Modifier.drawBehind, drawWithContent and drawWithCache. */
internal object DrawModifierFactoryFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/draw/",
    isStatic = true,
    returnType = MODIFIER,
    parameters = listOf(MODIFIER, FUNCTION1),
)

/** Modifier.Companion, the empty modifier. */
internal object EmptyModifierToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = listOf(),
    strings = listOf("Modifier"),
    custom = { _, classDef -> MODIFIER in classDef.interfaces },
)

/**
 * Modifier.size(width, height), which is SizeElement(minWidth = width, minHeight = height,
 * maxWidth = width, maxHeight = height, enforceIncoming = true). requiredSize passes false.
 */
internal object SizeModifierFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/layout/",
    isStatic = true,
    returnType = MODIFIER,
    parameters = listOf(MODIFIER, "F", "F"),
    custom = { method, _ ->
        val flow = RegisterFlow(method)
        val width = setOf(Abstract.Parameter(1))
        val height = setOf(Abstract.Parameter(2))
        val calls = flow.instructions.indices.filter { i ->
            flow.instructions[i].methodRef?.let {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("F", "F", "F", "F", "Z")
            } == true
        }
        calls.size == 1 && flow.argumentsAt(calls[0]) == listOf(width, height, width, height, setOf(Abstract.Literal(1)))
    },
)

/**
 * Modifier.clickable with default arguments: (modifier, enabled, onClickLabel, role,
 * interactionSource, onClick, defaults mask). It builds ClickableElement(interactionSource,
 * indicationNodeFactory, useLocalIndication, enabled, onClickLabel, role, onClick).
 */
internal object ClickableModifierFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/",
    isStatic = true,
    returnType = MODIFIER,
    parameters = listOf(MODIFIER, "Z", STRING, "L", "L", FUNCTION0, "I"),
    custom = { method, _ ->
        method.instructionList.any { instruction ->
            (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) && instruction.methodRef!!.let {
                val types = it.parameterTypes.map(CharSequence::toString)
                it.name == "<init>" && types.size == 7 && types[2] == "Z" && types[3] == "Z" &&
                    types[4] == STRING && types[6] == FUNCTION0
            }
        }
    },
)

/** ParcelableSnapshotMutableIntState. */
internal object MutableIntStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("MutableIntState(value="),
)
