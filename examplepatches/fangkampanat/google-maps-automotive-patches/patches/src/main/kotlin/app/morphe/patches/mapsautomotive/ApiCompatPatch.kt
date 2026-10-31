package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.logging.Logger

// R8 compiled 120003.E for minSdk 30. It dropped the SDK_INT >= 30 checks and moved most API 30
// calls into static "API model outline" methods. Each outline below is matched by the framework
// member it wraps, never by its obfuscated name, and its one call or field read is redirected to
// ApiCompat, which uses the member on API 30+ and an Android 10 fallback below. Members with
// API 30-only types are fixed at their call sites (end of this file), as are android.car's
// Car.createCar calls (DiLink 3 is not Android Automotive OS).

private const val API_COMPAT_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/ApiCompat;"
private const val OUTLINE_CLASS_MARKER = "\$\$ExternalSyntheticApiModelOutline"
private const val EXTENSION_PACKAGE = "Lapp/morphe/extension/"
private val apiCompatLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.ApiCompatPatch")

// member: "Lowner;->name(params)return" or "Lowner;->name:type".
// required: proven by an API 29 crash on the BYD head unit; the patch fails without it.
private class ApiShim(val member: String, val compatName: String, val required: Boolean = false)

// Only members whose parameter and return types exist on API 29. Outlines that take or return
// an API 30-only type (WindowMetrics, MediaRouter2, ApplicationExitInfo, ICU NumberFormatter,
// WindowInsetsAnimation, CloseGuard, InstallSourceInfo, GnssCapabilities) need caller changes.
private val apiShims = listOf(
    // Crashed the GoogleApi constructor during Application.onCreate.
    ApiShim("Landroid/content/Context;->getAttributionTag()Ljava/lang/String;", "getAttributionTag", required = true),
    ApiShim("Landroid/content/Context;->getDisplay()Landroid/view/Display;", "getDisplay"),
    ApiShim(
        "Landroid/content/Context;->bindServiceAsUser(Landroid/content/Intent;Landroid/content/ServiceConnection;" +
            "ILandroid/os/UserHandle;)Z",
        "bindServiceAsUser",
    ),
    ApiShim("Landroid/os/ext/SdkExtensions;->getExtensionVersion(I)I", "getExtensionVersion"),
    ApiShim(
        "Landroid/app/ActivityManager;->getHistoricalProcessExitReasons(Ljava/lang/String;II)Ljava/util/List;",
        "getHistoricalProcessExitReasons",
    ),
    ApiShim("Landroid/app/ActivityManager;->setProcessStateSummary([B)V", "setProcessStateSummary"),
    ApiShim("Landroid/app/ActivityManager;->isLowMemoryKillReportSupported()Z", "isLowMemoryKillReportSupported"),
    ApiShim("Landroid/view/WindowInsets\$Type;->statusBars()I", "statusBars"),
    ApiShim("Landroid/view/WindowInsets\$Type;->navigationBars()I", "navigationBars"),
    ApiShim("Landroid/view/WindowInsets\$Type;->captionBar()I", "captionBar"),
    ApiShim("Landroid/view/WindowInsets\$Type;->ime()I", "ime"),
    ApiShim("Landroid/view/WindowInsets\$Type;->systemGestures()I", "systemGestures"),
    ApiShim("Landroid/view/WindowInsets\$Type;->mandatorySystemGestures()I", "mandatorySystemGestures"),
    ApiShim("Landroid/view/WindowInsets\$Type;->tappableElement()I", "tappableElement"),
    ApiShim("Landroid/view/WindowInsets\$Type;->displayCutout()I", "displayCutout"),
    ApiShim("Landroid/view/WindowInsets\$Type;->systemBars()I", "systemBars"),
    ApiShim("Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;", "getInsets"),
    ApiShim(
        "Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;",
        "getInsetsIgnoringVisibility",
    ),
    ApiShim("Landroid/view/WindowInsets;->isVisible(I)Z", "isVisible"),
    ApiShim("Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;", "getConsumedWindowInsets"),
    ApiShim("Landroid/view/DisplayCutout;->getWaterfallInsets()Landroid/graphics/Insets;", "getWaterfallInsets"),
    ApiShim("Landroid/view/Window;->setDecorFitsSystemWindows(Z)V", "setDecorFitsSystemWindows"),
    ApiShim("Landroid/view/View;->isShowingLayoutBounds()Z", "isShowingLayoutBounds"),
    ApiShim("Landroid/view/View;->setImportantForContentCapture(I)V", "setImportantForContentCapture"),
    ApiShim("Landroid/view/View;->getStateDescription()Ljava/lang/CharSequence;", "getStateDescription"),
    ApiShim("Landroid/view/View;->setStateDescription(Ljava/lang/CharSequence;)V", "setStateDescription"),
    ApiShim(
        "Landroid/view/accessibility/AccessibilityNodeInfo;->getStateDescription()Ljava/lang/CharSequence;",
        "getStateDescription",
    ),
    ApiShim(
        "Landroid/view/accessibility/AccessibilityNodeInfo;->setStateDescription(Ljava/lang/CharSequence;)V",
        "setStateDescription",
    ),
    ApiShim(
        "Landroid/view/accessibility/AccessibilityNodeInfo\$AccessibilityAction;->ACTION_PRESS_AND_HOLD:" +
            "Landroid/view/accessibility/AccessibilityNodeInfo\$AccessibilityAction;",
        "getActionPressAndHold",
    ),
    ApiShim(
        "Landroid/view/accessibility/AccessibilityNodeInfo\$AccessibilityAction;->ACTION_IME_ENTER:" +
            "Landroid/view/accessibility/AccessibilityNodeInfo\$AccessibilityAction;",
        "getActionImeEnter",
    ),
    ApiShim("Landroid/graphics/Canvas;->quickReject(FFFF)Z", "quickReject"),
    ApiShim("Landroid/graphics/Canvas;->quickReject(Landroid/graphics/Path;)Z", "quickReject"),
    ApiShim("Landroid/graphics/Canvas;->quickReject(Landroid/graphics/RectF;)Z", "quickReject"),
    ApiShim("Landroid/graphics/Outline;->setPath(Landroid/graphics/Path;)V", "setPath"),
    ApiShim(
        "Landroid/graphics/drawable/Icon;->createWithAdaptiveBitmapContentUri(Landroid/net/Uri;)" +
            "Landroid/graphics/drawable/Icon;",
        "createWithAdaptiveBitmapContentUri",
    ),
    ApiShim(
        "Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V",
        "pushDynamicShortcut",
    ),
    ApiShim("Landroid/net/NetworkRequest;->getNetworkSpecifier()Landroid/net/NetworkSpecifier;", "getNetworkSpecifier"),
    ApiShim(
        "Landroid/net/NetworkRequest;->canBeSatisfiedBy(Landroid/net/NetworkCapabilities;)Z",
        "canBeSatisfiedBy",
    ),
)

private val invokeOpcodes = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_STATIC,
    Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE_RANGE, Opcode.INVOKE_STATIC_RANGE,
)
private val staticInvokeOpcodes = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val moveResultOpcodes = mapOf(
    Opcode.MOVE_RESULT to Opcode.RETURN,
    Opcode.MOVE_RESULT_WIDE to Opcode.RETURN_WIDE,
    Opcode.MOVE_RESULT_OBJECT to Opcode.RETURN_OBJECT,
)
private val fieldReadOpcodes = mapOf(
    Opcode.SGET to (Opcode.MOVE_RESULT to Opcode.RETURN),
    Opcode.SGET_OBJECT to (Opcode.MOVE_RESULT_OBJECT to Opcode.RETURN_OBJECT),
)

private fun MethodReference.key() =
    definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType

internal fun memberKey(instruction: Instruction): String? =
    when (val reference = (instruction as? ReferenceInstruction)?.reference) {
        is MethodReference -> reference.key()
        is FieldReference -> reference.definingClass + "->" + reference.name + ":" + reference.type
        else -> null
    }

private fun isMapsCode(type: String) = OUTLINE_CLASS_MARKER !in type && !type.startsWith(EXTENSION_PACKAGE)

private fun isMapsOutline(type: String) = OUTLINE_CLASS_MARKER in type && !type.startsWith(EXTENSION_PACKAGE)

internal fun BytecodePatchContext.mutableMethodOf(method: Method) =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType && it.parameterTypes == method.parameterTypes
    }

private fun BytecodePatchContext.requireApiCompatMethods(references: Collection<MethodReference>) {
    val compatClass = classDefByOrNull(API_COMPAT_CLASS)
        ?: throw PatchException("Missing extension class $API_COMPAT_CLASS")
    val missing = references.distinct().filter { reference ->
        compatClass.methods.none {
            it.name == reference.name && it.returnType == reference.returnType &&
                it.parameterTypes.map { type -> type.toString() } == reference.parameterTypes.map { type -> type.toString() } &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }
    }
    if (missing.isNotEmpty()) throw PatchException("ApiCompat lacks ${missing.joinToString()}")
}

// [reference] invoked statically with the registers of [call].
private fun staticCall(call: Instruction, reference: MethodReference): BuilderInstruction = when (call) {
    is FiveRegisterInstruction -> BuilderInstruction35c(
        Opcode.INVOKE_STATIC, call.registerCount, call.registerC, call.registerD,
        call.registerE, call.registerF, call.registerG, reference,
    )
    is RegisterRangeInstruction -> BuilderInstruction3rc(
        Opcode.INVOKE_STATIC_RANGE, call.startRegister, call.registerCount, reference,
    )
    else -> throw PatchException("Unexpected call instruction ${call.opcode}")
}

// Planned rewrite of one outline method, collected before any class is made mutable.
private class OutlineRedirect(val outline: Method, val shim: ApiShim, val compatReference: MethodReference)

internal fun BytecodePatchContext.redirectApiModelOutlines() {
    val shimsByMember = apiShims.associateBy { it.member }
    val redirects = mutableListOf<OutlineRedirect>()

    classDefForEach { classDef ->
        if (!isMapsOutline(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val shim = instructions.firstNotNullOfOrNull { memberKey(it)?.let(shimsByMember::get) }
                ?: return@forEach
            redirects += OutlineRedirect(method, shim, compatReferenceFor(method, instructions, shim))
        }
    }
    requireApiCompatMethods(redirects.map { it.compatReference })

    redirects.forEach { redirect ->
        val method = mutableMethodOf(redirect.outline)
        when (val first = method.implementation!!.instructions.first()) {
            is FiveRegisterInstruction, is RegisterRangeInstruction ->
                method.replaceInstruction(0, staticCall(first, redirect.compatReference))
            // Static field read: call the getter, then move its result into the read's register.
            is OneRegisterInstruction -> {
                val (moveResult, _) = fieldReadOpcodes.getValue(first.opcode)
                method.replaceInstruction(
                    0, BuilderInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, redirect.compatReference),
                )
                method.addInstruction(1, BuilderInstruction11x(moveResult, first.registerA))
            }
            else -> throw PatchException("Unexpected outline instruction in ${redirect.outline}")
        }
    }

    val counts = redirects.groupingBy { it.shim }.eachCount()
    apiShims.forEach { shim ->
        val count = counts[shim] ?: 0
        if (count == 0 && shim.required) {
            throw PatchException("No API outline found for required member ${shim.member}")
        }
        apiCompatLogger.info("API outline ${shim.member}: $count redirected")
    }
    apiCompatLogger.info("Redirected ${redirects.size} API outline methods to ApiCompat")
}

// Accept only R8's outline layouts: the member call followed by its return, or a static field
// read followed by its return. The redirected call reuses the outline's registers, so ApiCompat
// receives exactly the values the framework member would have received.
private fun compatReferenceFor(method: Method, instructions: List<Instruction>, shim: ApiShim): MethodReference {
    fun unexpected(): Nothing = throw PatchException(
        "Unexpected API outline layout for ${shim.member}: $method " +
            instructions.joinToString(prefix = "[", postfix = "]") { it.opcode.name },
    )

    if (!AccessFlags.STATIC.isSet(method.accessFlags) || memberKey(instructions.first()) != shim.member) unexpected()
    val first = instructions.first()
    val rest = instructions.drop(1)

    fun returnsResult(moveResult: Opcode, returnOpcode: Opcode) =
        rest.size == 2 && rest[0].opcode == moveResult && rest[1].opcode == returnOpcode &&
            (rest[0] as OneRegisterInstruction).registerA == (rest[1] as OneRegisterInstruction).registerA

    return when (val reference = (first as ReferenceInstruction).reference) {
        is MethodReference -> {
            if (first.opcode !in invokeOpcodes) unexpected()
            val returnType = reference.returnType
            val returnsCorrectly = if (returnType == "V") {
                rest.size == 1 && rest[0].opcode == Opcode.RETURN_VOID
            } else {
                val moveResult = rest.firstOrNull()?.opcode
                moveResult in moveResultOpcodes && returnsResult(moveResult!!, moveResultOpcodes.getValue(moveResult))
            }
            if (!returnsCorrectly || method.returnType != returnType) unexpected()

            val receiver = if (first.opcode in staticInvokeOpcodes) emptyList() else listOf(reference.definingClass)
            ImmutableMethodReference(
                API_COMPAT_CLASS,
                shim.compatName,
                receiver + reference.parameterTypes.map { it.toString() },
                returnType,
            )
        }

        is FieldReference -> {
            val (_, returnOpcode) = fieldReadOpcodes[first.opcode] ?: unexpected()
            val register = (first as OneRegisterInstruction).registerA
            if (rest.size != 1 || rest[0].opcode != returnOpcode ||
                (rest[0] as OneRegisterInstruction).registerA != register ||
                method.returnType != reference.type || method.parameterTypes.isNotEmpty()
            ) {
                unexpected()
            }
            ImmutableMethodReference(API_COMPAT_CLASS, shim.compatName, emptyList(), reference.type)
        }

        else -> unexpected()
    }
}

// Call sites of members whose types do not exist on API 29. Their outlines cannot be redirected,
// because an ApiCompat method could neither return nor receive such a type.

private const val WINDOW_METRICS_MEMBER =
    "Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;"
private const val WINDOW_BOUNDS_MEMBER = "Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;"
private const val INSTALL_SOURCE_MEMBER = "Landroid/content/pm/PackageManager;->getInstallSourceInfo(" +
    "Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;"
private const val INSTALLING_PACKAGE_MEMBER =
    "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;"
private const val INSETS_ANIMATION_CALLBACK = "Landroid/view/WindowInsetsAnimation\$Callback;"
private const val INSETS_ANIMATION_SETTER_MEMBER =
    "Landroid/view/View;->setWindowInsetsAnimationCallback($INSETS_ANIMATION_CALLBACK)V"
private const val CLOSE_GUARD = "Landroid/util/CloseGuard;"
private const val CLOSE_GUARD_INIT = "Landroid/util/CloseGuard;-><init>()V"
private const val CLOSE_GUARD_OPEN = "Landroid/util/CloseGuard;->open(Ljava/lang/String;)V"
private const val CLOSE_GUARD_WARN = "Landroid/util/CloseGuard;->warnIfOpen()V"
private const val ICU_FORMATTER = "Landroid/icu/number/LocalizedNumberFormatter;"
private const val ICU_WITH_LOCALE =
    "Landroid/icu/number/NumberFormatter;->withLocale(Landroid/icu/util/ULocale;)$ICU_FORMATTER"
private const val ICU_PERCENT = "Landroid/icu/util/MeasureUnit;->PERCENT:Landroid/icu/util/MeasureUnit;"
private const val ICU_UNIT =
    "$ICU_FORMATTER->unit(Landroid/icu/util/MeasureUnit;)Landroid/icu/number/NumberFormatterSettings;"
private const val ICU_FORMAT = "$ICU_FORMATTER->format(D)Landroid/icu/number/FormattedNumber;"
private const val ICU_TO_STRING = "Landroid/icu/number/FormattedNumber;->toString()Ljava/lang/String;"
private const val CAR_CLASS = "Landroid/car/Car;"
private val currentWindowBoundsReference = ImmutableMethodReference(
    API_COMPAT_CLASS, "getCurrentWindowBounds", listOf("Landroid/view/WindowManager;"), "Landroid/graphics/Rect;",
)
private val installingPackageReference = ImmutableMethodReference(
    API_COMPAT_CLASS, "getInstallingPackageName",
    listOf("Landroid/content/pm/PackageManager;", "Ljava/lang/String;"), "Ljava/lang/String;",
)
private val hasInsetsAnimationsReference =
    ImmutableMethodReference(API_COMPAT_CLASS, "hasWindowInsetsAnimations", emptyList(), "Z")
private val openCloseGuardReference =
    ImmutableMethodReference(API_COMPAT_CLASS, "openCloseGuard", listOf("Ljava/lang/String;"), "Ljava/lang/Object;")
private val warnIfOpenReference =
    ImmutableMethodReference(API_COMPAT_CLASS, "warnIfOpen", listOf("Ljava/lang/Object;"), "V")
private val formatPercentReference = ImmutableMethodReference(
    API_COMPAT_CLASS, "formatPercent", listOf("Landroid/icu/util/ULocale;", "D"), "Ljava/lang/String;",
)
private val canCreateCarReference = ImmutableMethodReference(API_COMPAT_CLASS, "canCreateCar", emptyList(), "Z")
private val doubleConversionOpcodes = setOf(Opcode.INT_TO_DOUBLE, Opcode.LONG_TO_DOUBLE, Opcode.FLOAT_TO_DOUBLE)

// Maps outline methods that wrap one of [members], keyed by member. They must have the same
// layout as a redirected outline; anything else around such a member fails the patch.
private fun BytecodePatchContext.outlinesWrapping(vararg members: String): Map<String, Set<String>> {
    val outlines = members.associateWith { mutableSetOf<String>() }
    classDefForEach { classDef ->
        if (!isMapsOutline(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val member = instructions.firstNotNullOfOrNull { memberKey(it)?.takeIf(outlines::containsKey) }
                ?: return@forEach
            compatReferenceFor(method, instructions, ApiShim(member, "layoutCheck"))
            outlines.getValue(member) += method.key()
        }
    }
    return outlines
}

private fun Instruction.calledOutline(outlines: Set<String>) =
    opcode in staticInvokeOpcodes && ((this as ReferenceInstruction).reference as MethodReference).key() in outlines

// R8 also outlines casts to API 30 types: check-cast to the type, then return-object.
private fun BytecodePatchContext.castOutlinesTo(type: String): Set<String> {
    val outlines = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (!isMapsOutline(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val cast = instructions.firstOrNull() ?: return@forEach
            if (cast.opcode != Opcode.CHECK_CAST || (cast as ReferenceInstruction).reference.toString() != type) {
                return@forEach
            }
            if (instructions.size != 2 || instructions[1].opcode != Opcode.RETURN_OBJECT ||
                (instructions[1] as OneRegisterInstruction).registerA != (cast as OneRegisterInstruction).registerA ||
                method.returnType != type || method.parameterTypes.size != 1
            ) {
                throw PatchException("Unexpected cast outline layout for $type: $method")
            }
            outlines += method.key()
        }
    }
    return outlines
}

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val target = (this as OneRegisterInstruction).registerA
    return register == target || opcode.setsWideRegister() && register == target + 1
}

private fun Instruction.reads(register: Int): Boolean {
    val registers = registers()
    if (!opcode.setsRegister()) return register in registers
    return register in registers.drop(1) || opcode.name.endsWith("/2addr") && register == registers.first()
}

private fun Instruction.isBranch() =
    opcode.name.let { it.startsWith("goto") || it.startsWith("if-") || it.endsWith("switch") }

// Whether straight-line code from [from] writes [register] before reading it. A branch or a branch
// target ends the scan as "read" (unknown); a return or throw ends it as "written".
private fun List<BuilderInstruction>.overwrittenBeforeRead(from: Int, register: Int): Boolean {
    for (index in from until size) {
        val instruction = this[index]
        if (instruction.location.labels.isNotEmpty() || instruction.reads(register)) return false
        if (instruction.writes(register)) return true
        if (instruction.opcode.name.startsWith("return") || instruction.opcode == Opcode.THROW) return true
        if (instruction.isBranch()) return false
    }
    return true
}

private fun List<BuilderInstruction>.hasLabelIn(range: IntRange) = range.any { this[it].location.labels.isNotEmpty() }

private fun String.memberName() = substringAfter("->").substringBefore('(')

// first(...) -> x, followed at once by second(x) -> x: the second result overwrites x, so nothing else
// can read the API 30-only object. Each such pair becomes one ApiCompat call with the registers of the
// first call. Other calls of the first member stay and are logged.
private fun BytecodePatchContext.replaceOutlinePairs(
    firstMember: String,
    secondMember: String,
    compatReference: MethodReference,
    required: Boolean,
) {
    val (firstName, secondName) = firstMember.memberName() to secondMember.memberName()
    val outlines = outlinesWrapping(firstMember, secondMember)
    val firstOutlines = outlines.getValue(firstMember)
    val secondOutlines = outlines.getValue(secondMember)
    requireApiCompatMethods(listOf(compatReference))

    val sites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (!isMapsCode(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.calledOutline(firstOutlines)) return@forEachIndexed
                if (isOutlinePair(instructions, index, secondOutlines)) {
                    sites += method to index
                } else {
                    apiCompatLogger.info("Left $firstName without $secondName unchanged: $method at $index")
                }
            }
        }
    }
    if (sites.isEmpty()) {
        if (required) throw PatchException("Failed to find $firstName().$secondName() call sites")
        apiCompatLogger.info("No $firstName().$secondName() call sites")
        return
    }

    sites.groupBy({ it.first }, { it.second }).forEach { (original, indices) ->
        val method = mutableMethodOf(original)
        indices.sortedDescending().forEach { index ->
            val instructions = method.implementation!!.instructions
            if (instructions.hasLabelIn(index + 1..index + 3)) {
                throw PatchException("Branch or try boundary inside the $firstName pair of $original at $index")
            }
            method.replaceInstruction(index, staticCall(instructions[index], compatReference))
            method.removeInstructions(index + 2, 2)
        }
        apiCompatLogger.info("Replaced $firstName().$secondName() in $original at $indices")
    }
}

private fun isOutlinePair(instructions: List<Instruction>, index: Int, secondOutlines: Set<String>): Boolean {
    val firstResult = instructions.getOrNull(index + 1) ?: return false
    val secondCall = instructions.getOrNull(index + 2) ?: return false
    val secondResult = instructions.getOrNull(index + 3) ?: return false
    if (firstResult.opcode != Opcode.MOVE_RESULT_OBJECT || secondResult.opcode != Opcode.MOVE_RESULT_OBJECT) {
        return false
    }
    val intermediate = (firstResult as OneRegisterInstruction).registerA
    return secondCall.opcode == Opcode.INVOKE_STATIC && secondCall.calledOutline(secondOutlines) &&
        (secondCall as FiveRegisterInstruction).registerCount == 1 && secondCall.registerC == intermediate &&
        (secondResult as OneRegisterInstruction).registerA == intermediate
}

// androidx.window reads the current window bounds as getCurrentWindowMetrics() followed at once by
// getBounds() on its result (crashed MapsActivity.onCreate on androidx.window's API 30 path).
internal fun BytecodePatchContext.replaceWindowBoundsCalls() =
    replaceOutlinePairs(WINDOW_METRICS_MEMBER, WINDOW_BOUNDS_MEMBER, currentWindowBoundsReference, required = true)

// Maps reads its own installer through InstallSourceInfo, without an SDK_INT check left.
internal fun BytecodePatchContext.replaceInstallSourceCalls() =
    replaceOutlinePairs(INSTALL_SOURCE_MEMBER, INSTALLING_PACKAGE_MEMBER, installingPackageReference, required = false)

// WindowInsetsAnimationCompat.setCallback: R8 kept only its API 30 path, which instantiates a
// subclass of WindowInsetsAnimation.Callback (an API 30 class, so it cannot load on API 29) and
// passes it to the framework setter. Compose's insets listener calls it when a view attaches.
// Below API 30 the setter returns at once. Optional: skipped with a log if this layout is absent.
internal fun BytecodePatchContext.guardInsetsAnimationCallbackSetter() {
    val setterOutlines = outlinesWrapping(INSETS_ANIMATION_SETTER_MEMBER).getValue(INSETS_ANIMATION_SETTER_MEMBER)
    requireApiCompatMethods(listOf(hasInsetsAnimationsReference))

    val callbackClasses = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (isMapsCode(classDef.type) && classDef.superclass == INSETS_ANIMATION_CALLBACK) callbackClasses += classDef.type
    }
    val candidates = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (!isMapsCode(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions ?: return@forEach
            if (instructions.any { it.calledOutline(setterOutlines) } &&
                instructions.any {
                    it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() in callbackClasses
                }
            ) {
                candidates += method
            }
        }
    }
    if (candidates.isEmpty()) {
        apiCompatLogger.info("Optional WindowInsetsAnimation callback setter not found; skipping this hook")
        return
    }
    val original = candidates.singleOrNull()
        ?: throw PatchException("Ambiguous WindowInsetsAnimation callback setter: ${candidates.joinToString()}")
    val parameterRegisters = original.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2L else 1L }
    if (!AccessFlags.STATIC.isSet(original.accessFlags) || original.returnType != "V" ||
        original.implementation!!.registerCount <= parameterRegisters
    ) {
        throw PatchException("Unexpected WindowInsetsAnimation callback setter: $original")
    }

    // v0 is a local register, unset on entry.
    val method = mutableMethodOf(original)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $API_COMPAT_CLASS->hasWindowInsetsAnimations()Z
            move-result v0
            if-nez v0, :api30
            return-void
        """.trimIndent(),
        ExternalLabel("api30", method.getInstruction(0)),
    )
    apiCompatLogger.info("Resolved WindowInsetsAnimation callback setter: $original (callbacks ${callbackClasses.joinToString()})")
}

private fun BytecodePatchContext.mapsMethodsWhere(predicate: (Instruction) -> Boolean): List<Method> {
    val methods = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (!isMapsCode(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.implementation?.instructions?.any(predicate) == true) methods += method
        }
    }
    return methods
}

// OkHttp's Android 10 platform keeps an android.util.CloseGuard per call to report unclosed response
// bodies: the call start creates and opens one and stores it in an Object field, and the connection
// pool casts a leaked call's object back and calls warnIfOpen. Maps' file downloader (vehicle icon
// models) runs on OkHttp. Both places become ApiCompat calls on that Object. Any other CloseGuard use
// in Maps code fails the patch.
internal fun BytecodePatchContext.replaceCloseGuardCalls() {
    val outlines = outlinesWrapping(CLOSE_GUARD_OPEN, CLOSE_GUARD_WARN)
    val openOutlines = outlines.getValue(CLOSE_GUARD_OPEN)
    val warnOutlines = outlines.getValue(CLOSE_GUARD_WARN)
    val castOutlines = castOutlinesTo(CLOSE_GUARD)
    val closeGuardOutlines = openOutlines + warnOutlines + castOutlines

    fun Instruction.usesCloseGuard() = when (val reference = (this as? ReferenceInstruction)?.reference) {
        is MethodReference -> reference.definingClass == CLOSE_GUARD || reference.key() in closeGuardOutlines
        is FieldReference -> reference.definingClass == CLOSE_GUARD
        null -> false
        else -> reference.toString() == CLOSE_GUARD
    }

    val users = mapsMethodsWhere { it.usesCloseGuard() }
    if (users.isEmpty()) {
        apiCompatLogger.info("No CloseGuard use in Maps code")
        return
    }
    requireApiCompatMethods(listOf(openCloseGuardReference, warnIfOpenReference))

    users.forEach { original ->
        val method = mutableMethodOf(original)
        var opened = 0
        var warned = 0
        while (true) {
            val instructions = method.implementation!!.instructions
            val index = instructions.indexOfFirst { it.usesCloseGuard() }
            if (index < 0) break
            when {
                instructions[index].opcode == Opcode.NEW_INSTANCE -> {
                    method.replaceCloseGuardOpen(index, openOutlines)
                    opened++
                }
                instructions[index].calledOutline(castOutlines) -> {
                    method.replaceCloseGuardWarning(index, warnOutlines)
                    warned++
                }
                else -> throw PatchException("Unexpected CloseGuard use in $original at $index")
            }
        }
        apiCompatLogger.info("Replaced CloseGuard in $original: $opened opened, $warned warned")
    }
}

// new-instance g, CloseGuard; <init>(g); ...; open outline (g, closer); ...; put g into an Object field, then
// g is not read again. Becomes: ...; g = ApiCompat.openCloseGuard(closer); ...; the same put.
private fun MutableMethod.replaceCloseGuardOpen(index: Int, openOutlines: Set<String>) {
    val instructions = implementation!!.instructions
    fun unexpected(): Nothing = throw PatchException("Unexpected CloseGuard creation in $this at $index")

    val guard = (instructions[index] as OneRegisterInstruction).registerA
    val init = instructions.getOrNull(index + 1) ?: unexpected()
    if (init.opcode != Opcode.INVOKE_DIRECT || memberKey(init) != CLOSE_GUARD_INIT || init.registers() != listOf(guard)) {
        unexpected()
    }
    val open = (index + 2 until instructions.size).firstOrNull { guard in instructions[it].registers() } ?: unexpected()
    val openCall = instructions[open] as? FiveRegisterInstruction ?: unexpected()
    if (!openCall.calledOutline(openOutlines) || openCall.registerCount != 2 || openCall.registerC != guard) unexpected()
    val store = (open + 1 until instructions.size).firstOrNull { guard in instructions[it].registers() } ?: unexpected()
    val field = (instructions[store] as? ReferenceInstruction)?.reference as? FieldReference
    if (instructions[store].opcode !in setOf(Opcode.IPUT_OBJECT, Opcode.SPUT_OBJECT) ||
        (instructions[store] as OneRegisterInstruction).registerA != guard || field?.type != "Ljava/lang/Object;" ||
        (index until store).any { instructions[it].isBranch() } || instructions.hasLabelIn(index..store) ||
        !instructions.overwrittenBeforeRead(store + 1, guard)
    ) {
        unexpected()
    }

    replaceInstruction(open, BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, openCall.registerD, 0, 0, 0, 0, openCloseGuardReference))
    addInstruction(open + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, guard))
    removeInstructions(index, 2)
}

// cast outline (o) -> g, then the warnIfOpen outline (g), with g not read again. Becomes ApiCompat.warnIfOpen(o).
private fun MutableMethod.replaceCloseGuardWarning(index: Int, warnOutlines: Set<String>) {
    val instructions = implementation!!.instructions
    fun unexpected(): Nothing = throw PatchException("Unexpected CloseGuard warning in $this at $index")

    val cast = instructions[index] as? FiveRegisterInstruction ?: unexpected()
    val result = instructions.getOrNull(index + 1) ?: unexpected()
    val warning = instructions.getOrNull(index + 2) ?: unexpected()
    if (cast.registerCount != 1 || result.opcode != Opcode.MOVE_RESULT_OBJECT) unexpected()
    val guard = (result as OneRegisterInstruction).registerA
    if (!warning.calledOutline(warnOutlines) || warning.registers() != listOf(guard) ||
        instructions.hasLabelIn(index + 1..index + 2) || !instructions.overwrittenBeforeRead(index + 3, guard)
    ) {
        unexpected()
    }

    replaceInstruction(index, BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, cast.registerC, 0, 0, 0, 0, warnIfOpenReference))
    removeInstructions(index + 1, 2)
}

// Maps' low-battery prompt ("%1$s remaining.") formats the battery percentage with NumberFormatter (API 30):
// withLocale(locale) -> unit(PERCENT) -> cast -> format(double) -> toString(), with the double conversion
// before format(). The chain becomes ApiCompat.formatPercent(locale, double). Any other use of these
// outlines fails the patch.
internal fun BytecodePatchContext.replacePercentFormatChains() {
    val outlines = outlinesWrapping(ICU_WITH_LOCALE, ICU_PERCENT, ICU_UNIT, ICU_FORMAT, ICU_TO_STRING)
    val castOutlines = castOutlinesTo(ICU_FORMATTER)
    val chainOutlines = outlines.values.flatten().toSet() + castOutlines

    val users = mapsMethodsWhere { it.calledOutline(chainOutlines) }
    if (users.isEmpty()) {
        apiCompatLogger.info("No NumberFormatter percent chain in Maps code")
        return
    }
    requireApiCompatMethods(listOf(formatPercentReference))

    users.forEach { original ->
        val method = mutableMethodOf(original)
        var chains = 0
        while (true) {
            val index = method.implementation!!.instructions.indexOfFirst { it.calledOutline(chainOutlines) }
            if (index < 0) break
            method.replacePercentChain(index, outlines, castOutlines)
            chains++
        }
        apiCompatLogger.info("Replaced NumberFormatter percent chain in $original: $chains")
    }
}

private fun MutableMethod.replacePercentChain(start: Int, outlines: Map<String, Set<String>>, castOutlines: Set<String>) {
    val instructions = implementation!!.instructions
    fun unexpected(): Nothing = throw PatchException("Unexpected NumberFormatter chain in $this at $start")
    fun call(index: Int, targets: Set<String>, registers: Int): FiveRegisterInstruction {
        val instruction = instructions.getOrNull(index) as? FiveRegisterInstruction ?: unexpected()
        if (!instruction.calledOutline(targets) || instruction.registerCount != registers) unexpected()
        return instruction
    }
    fun result(index: Int): Int {
        val instruction = instructions.getOrNull(index) ?: unexpected()
        if (instruction.opcode != Opcode.MOVE_RESULT_OBJECT) unexpected()
        return (instruction as OneRegisterInstruction).registerA
    }

    val locale = call(start, outlines.getValue(ICU_WITH_LOCALE), 1).registerC
    val formatter = result(start + 1)
    call(start + 2, outlines.getValue(ICU_PERCENT), 0)
    val unit = result(start + 3)
    val withUnit = call(start + 4, outlines.getValue(ICU_UNIT), 2)
    if (withUnit.registerC != formatter || withUnit.registerD != unit) unexpected()
    val settings = result(start + 5)
    if (call(start + 6, castOutlines, 1).registerC != settings) unexpected()
    val localized = result(start + 7)
    val chainValues = setOf(formatter, unit, settings, localized)

    // At most two conversions of the value to double, which leave the locale and the chain alone.
    var format = start + 8
    while (instructions.getOrNull(format)?.calledOutline(outlines.getValue(ICU_FORMAT)) == false) {
        val conversion = instructions[format]
        if (conversion.opcode !in doubleConversionOpcodes || format >= start + 10 || conversion.writes(locale) ||
            chainValues.any { conversion.reads(it) }
        ) {
            unexpected()
        }
        format++
    }
    val formatCall = call(format, outlines.getValue(ICU_FORMAT), 3)
    if (formatCall.registerC != localized || formatCall.registerE != formatCall.registerD + 1) unexpected()
    val number = result(format + 1)
    if (call(format + 2, outlines.getValue(ICU_TO_STRING), 1).registerC != number) unexpected()
    val text = result(format + 3)
    if (instructions.hasLabelIn(start + 1..format + 3)) unexpected()
    // The removed API 30 objects must not be read after the chain, unless a kept conversion replaced them.
    val converted = (start + 8 until format).flatMap {
        val target = (instructions[it] as OneRegisterInstruction).registerA
        listOf(target, target + 1)
    }
    (chainValues + number - text - converted.toSet()).forEach {
        if (!instructions.overwrittenBeforeRead(format + 4, it)) unexpected()
    }

    removeInstructions(format + 2, 2)
    replaceInstruction(format + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, text))
    replaceInstruction(
        format,
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, locale, formatCall.registerD, formatCall.registerE, 0, 0, formatPercentReference),
    )
    removeInstructions(start, 8)
}

// android.car exists on Android Automotive OS only; DiLink 3 is Android 10 without it. Maps creates its
// Car objects through Car.createCar and checks the automotive feature on most paths, but not all: the car
// account menu builds car-ui's UX restriction helper, which calls Car.createCar directly. Every
// Car.createCar call goes to a generated ApiCompat.createCar with the same parameters, which calls the
// real method when android.car exists and otherwise returns null (no car service) and logs the caller.
internal fun BytecodePatchContext.guardCarCreation() {
    val sites = mutableListOf<Pair<Method, Int>>()
    val overloads = linkedMapOf<String, MethodReference>()
    classDefForEach { classDef ->
        if (!isMapsCode(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
                if (reference.definingClass != CAR_CLASS || reference.name != "createCar") return@forEachIndexed
                if (instruction.opcode !in staticInvokeOpcodes || reference.returnType != CAR_CLASS) {
                    throw PatchException("Unexpected Car.createCar call in $method at $index")
                }
                sites += method to index
                overloads.putIfAbsent(reference.key(), reference)
            }
        }
    }
    if (sites.isEmpty()) {
        apiCompatLogger.info("No Car.createCar calls in Maps code")
        return
    }
    requireApiCompatMethods(listOf(canCreateCarReference))

    val compatClass = mutableClassDefBy(API_COMPAT_CLASS)
    val bridges = overloads.mapValues { (_, car) -> compatClass.addCreateCarBridge(car) }
    sites.groupBy({ it.first }, { it.second }).forEach { (original, indices) ->
        val method = mutableMethodOf(original)
        indices.forEach { index ->
            val call = method.implementation!!.instructions[index]
            val car = ((call as ReferenceInstruction).reference as MethodReference).key()
            method.replaceInstruction(index, staticCall(call, bridges.getValue(car)))
        }
        apiCompatLogger.info("Guarded Car.createCar in $original at $indices")
    }
    apiCompatLogger.info("Guarded ${sites.size} Car.createCar calls (${overloads.size} overloads)")
}

private fun MutableClass.addCreateCarBridge(car: MethodReference): MethodReference {
    val parameters = car.parameterTypes.map { it.toString() }
    val parameterRegisters = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    methods.add(
        ImmutableMethod(
            type,
            "createCar",
            parameters.map { ImmutableMethodParameter(it, null, null) },
            CAR_CLASS,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(parameterRegisters + 1),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $API_COMPAT_CLASS->canCreateCar()Z
                    move-result v0
                    if-eqz v0, :no_car
                    invoke-static/range { p0 .. p${parameterRegisters - 1} }, ${car.key()}
                    move-result-object v0
                    return-object v0
                    :no_car
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
            )
        },
    )
    return ImmutableMethodReference(API_COMPAT_CLASS, "createCar", parameters, CAR_CLASS)
}
