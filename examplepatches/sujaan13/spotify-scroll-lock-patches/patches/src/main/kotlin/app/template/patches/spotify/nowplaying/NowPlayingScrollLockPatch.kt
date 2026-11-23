package app.template.patches.spotify.nowplaying

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/template/extension/spotify/NowPlayingScrollLockPatch;"

private const val VIEW = "Landroid/view/View;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"

/** Framework view groups a now playing scroll container can ultimately extend. */
private val FRAMEWORK_VIEW_GROUPS = setOf(
    "Landroid/view/ViewGroup;",
    "Landroid/widget/FrameLayout;",
    "Landroid/widget/LinearLayout;",
    "Landroid/widget/RelativeLayout;",
    "Landroid/widget/ScrollView;",
)

private val logger = Logger.getLogger("NowPlayingScrollLock")

@Suppress("unused")
val nowPlayingScrollLockPatch = patch(
    name = "Now Playing scroll lock",
    description = "Adds a lock button to the Now Playing screen that stops it from scrolling " +
        "up to the song info cards. Swiping left and right to change songs still works.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith("extensions/extension.mpe")

    val scrollViewClassOption by stringOption(
        key = "scrollViewClass",
        default = "com.spotify.nowplaying.scroll.view.PeekScrollView",
        title = "Now Playing scroll view class",
        description = "Full class name of the view that scrolls the Now Playing screen, " +
            "for example com.spotify.foo.NowPlayingScrollView. Leave empty to auto-detect.",
    )

    execute {
        val targetType = resolveTargetType(scrollViewClassOption)
        logger.info("Scroll lock target: $targetType")

        val target = mutableClassDefBy(targetType)

        // 1. Tell the extension which class is the Now Playing scroll view,
        //    and notify it whenever one is attached to a window (to show the button).
        setExtensionTargetClass(targetType)
        hookOnAttachedToWindow(target)

        // 2. Gate the gestures that start a vertical scroll.
        hookBooleanMethod(
            target,
            name = "onInterceptTouchEvent",
            parameters = listOf(MOTION_EVENT),
            prologue = """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->filterMotionEvent($VIEW$MOTION_EVENT)$MOTION_EVENT
                move-result-object p1
            """,
        )
        hookBooleanMethod(
            target,
            name = "onTouchEvent",
            parameters = listOf(MOTION_EVENT),
            prologue = """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->filterMotionEvent($VIEW$MOTION_EVENT)$MOTION_EVENT
                move-result-object p1
            """,
        )

        // 3. Refuse nested scrolls started by children (framework ViewParent method).
        hookBooleanMethod(
            target,
            name = "onStartNestedScroll",
            parameters = listOf(VIEW, VIEW, "I"),
            prologue = """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->beginCall($VIEW)V
            """,
        )
    }
}

// region Target discovery

private fun String.toTypeDescriptor(): String {
    val trimmed = trim()
    if (trimmed.startsWith("L") && trimmed.endsWith(";")) return trimmed
    return "L" + trimmed.replace('.', '/') + ";"
}

private fun resolveTargetType(option: String?): String {
    if (!option.isNullOrBlank()) {
        val type = option.toTypeDescriptor()
        if (classDefByOrNull(type) == null) {
            throw PatchException("Class $type was not found in this Spotify version.")
        }
        return type
    }

    // Auto-detect: view groups in a now playing package with "Scroll" in the class name.
    val nameMatches = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val type = classDef.type
        val simpleName = type.substringAfterLast('/')
        if (type.contains("nowplaying", ignoreCase = true) &&
            simpleName.contains("Scroll") &&
            !AccessFlags.ABSTRACT.isSet(classDef.accessFlags) &&
            !AccessFlags.INTERFACE.isSet(classDef.accessFlags)
        ) {
            nameMatches += classDef
        }
    }
    val candidates = nameMatches.filter { isViewGroup(it) }.map { it.type }

    return when (candidates.size) {
        1 -> candidates.single()
        0 -> throw PatchException(
            "Could not auto-detect the Now Playing scroll view. Find its class name with " +
                "'adb shell dumpsys activity top' while Now Playing is open, then set the " +
                "'scrollViewClass' patch option."
        )
        else -> throw PatchException(
            "Several possible Now Playing scroll views were found. Set the 'scrollViewClass' " +
                "patch option to one of:\n" + candidates.joinToString("\n")
        )
    }
}

private fun isViewGroup(classDef: ClassDef): Boolean {
    var superType = classDef.superclass
    while (superType != null) {
        val superDef = classDefByOrNull(superType) ?: return superType in FRAMEWORK_VIEW_GROUPS
        superType = superDef.superclass
    }
    return false
}

// endregion

// region Bytecode helpers

private val String.registerWidth get() = if (this == "J" || this == "D") 2 else 1

/** Makes the extension's targetClassName() return the Java name of [targetType]. */
private fun setExtensionTargetClass(targetType: String) {
    val javaName = targetType.removePrefix("L").removeSuffix(";").replace('/', '.')
    mutableClassDefBy(EXTENSION_CLASS).methods.first { it.name == "targetClassName" }
        .addInstructions(
            0,
            """
                const-string v0, "$javaName"
                return-object v0
            """,
        )
}

/**
 * Calls the extension from onAttachedToWindow(). At the start of a non-constructor method
 * p0 is always "this", so no register juggling is needed. Patched in the first class that
 * declares it (the extension filters by class name), or added as an override.
 */
private fun hookOnAttachedToWindow(target: MutableClass) {
    val name = "onAttachedToWindow"
    val call = "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onScrollViewAttached($VIEW)V"

    fun ClassDef.declares() = methods.any { method ->
        method.name == name && method.returnType == "V" &&
            method.parameterTypes.isEmpty() && method.implementation != null
    }

    var type: String? = target.type
    while (type != null) {
        val classDef = classDefByOrNull(type) ?: break
        if (classDef.declares()) {
            mutableClassDefBy(classDef).methods
                .first { it.name == name && it.returnType == "V" && it.parameterTypes.isEmpty() }
                .addInstructions(0, call)
            return
        }
        type = classDef.superclass
    }

    val superclass = target.superclass ?: throw PatchException("${target.type} has no superclass")
    val method = ImmutableMethod(
        target.type,
        name,
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(1),
    ).toMutable()
    method.addInstructions(
        0,
        """
            invoke-super { p0 }, $superclass->$name()V
            $call
            return-void
        """,
    )
    target.methods.add(method)
}

/**
 * Hooks a boolean view method:
 * - [prologue] runs first (and may replace p1),
 * - every return value is passed through the extension's filterResult(Z)Z.
 *
 * The method is patched in the first class that declares it, walking up from [target].
 * If only the Android framework declares it, an override is added to [target] instead.
 * The extension only blocks calls on registered Now Playing instances, so patching a shared
 * superclass (such as an obfuscated androidx scroll view) does not affect other screens.
 */
private fun hookBooleanMethod(
    target: MutableClass,
    name: String,
    parameters: List<String>,
    prologue: String,
) {
    fun ClassDef.declares() = methods.any { method ->
        method.name == name &&
            method.returnType == "Z" &&
            method.parameterTypes.map { it.toString() } == parameters &&
            method.implementation != null
    }

    var declaringType: String? = target.type
    while (declaringType != null) {
        val classDef = classDefByOrNull(declaringType) ?: break
        if (classDef.declares()) break
        declaringType = classDef.superclass
    }

    val declaringClass = declaringType?.let { classDefByOrNull(it) }
    if (declaringClass != null && declaringClass.declares()) {
        val method = mutableClassDefBy(declaringClass).methods.first { method ->
            method.name == name && method.returnType == "Z" &&
                method.parameterTypes.map { it.toString() } == parameters
        }
        patchExistingMethod(method, prologue)
    } else {
        addOverride(target, name, parameters, prologue)
    }
}

private fun patchExistingMethod(method: MutableMethod, prologue: String) {
    // Filter returns first, from last to first, so indices stay valid.
    method.implementation!!.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
        .map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }
        .reversed()
        .forEach { (index, register) ->
            method.addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->filterResult(Z)Z
                    move-result v$register
                """,
            )
        }

    method.addInstructions(0, prologue)
}

private fun addOverride(
    target: MutableClass,
    name: String,
    parameters: List<String>,
    prologue: String,
) {
    val superclass = target.superclass
        ?: throw PatchException("${target.type} has no superclass")
    val parameterRegisters = 1 + parameters.sumOf { it.registerWidth }
    val lastParameter = parameterRegisters - 1
    val signature = parameters.joinToString("")

    val method = ImmutableMethod(
        target.type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "Z",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(1 + parameterRegisters),
    ).toMutable()

    method.addInstructions(
        0,
        """
            $prologue
            invoke-super/range { p0 .. p$lastParameter }, $superclass->$name($signature)Z
            move-result v0
            invoke-static { v0 }, $EXTENSION_CLASS->filterResult(Z)Z
            move-result v0
            return v0
        """,
    )

    target.methods.add(method)
}

// endregion
