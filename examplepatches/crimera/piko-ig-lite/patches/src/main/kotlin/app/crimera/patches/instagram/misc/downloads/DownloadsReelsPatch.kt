/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.Block
import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.utils.Constants.DOWNLOAD_DESCRIPTOR
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.getResourceId
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val REEL_DOWNLOAD_DESCRIPTOR = "$DOWNLOAD_DESCRIPTOR/ReelDownload;"

private const val CONTEXT_DESCRIPTOR = "Landroid/content/Context;"
private const val COLOR_FILTER_DESCRIPTOR = "Landroid/graphics/ColorFilter;"
private const val COLOR_STATE_LIST_DESCRIPTOR = "Landroid/content/res/ColorStateList;"
private const val DRAWABLE_DESCRIPTOR = "Landroid/graphics/drawable/Drawable;"
private const val SCALE_TYPE_DESCRIPTOR = "Landroid/widget/ImageView\$ScaleType;"
private const val CHAR_SEQUENCE_DESCRIPTOR = "Ljava/lang/CharSequence;"
private const val FUNCTION1_DESCRIPTOR = "Lkotlin/jvm/functions/Function1;"
private const val MEDIA_DESCRIPTOR = "Lcom/instagram/feed/media/Media;"

/** Names of the view properties the tap and long press handlers are stored under. */
private const val ON_CLICK_PROPERTY = "ON_CLICK"
internal const val ON_LONG_CLICK_PROPERTY = "ON_LONG_CLICK"

/** The reels save button: its component sets this id and tag on its icon. */
private const val REEL_SAVE_BUTTON_ID = "save_button"

private const val IS_ENABLED = "$REEL_DOWNLOAD_DESCRIPTOR->isEnabled()Z"
private const val REGISTER = "$REEL_DOWNLOAD_DESCRIPTOR->register($OBJECT_DESCRIPTOR)V"
private const val BEGIN = "$REEL_DOWNLOAD_DESCRIPTOR->begin($OBJECT_DESCRIPTOR$OBJECT_DESCRIPTOR)V"
private const val ICON = "$REEL_DOWNLOAD_DESCRIPTOR->icon($DRAWABLE_DESCRIPTOR)$DRAWABLE_DESCRIPTOR"
private const val SELECTED = "$REEL_DOWNLOAD_DESCRIPTOR->selected(Z)Z"
private const val DESCRIPTION =
    "$REEL_DOWNLOAD_DESCRIPTOR->description($CHAR_SEQUENCE_DESCRIPTOR)$CHAR_SEQUENCE_DESCRIPTOR"
private const val VIEW_ID = "$REEL_DOWNLOAD_DESCRIPTOR->viewId(I)I"
private const val CLICK = "$REEL_DOWNLOAD_DESCRIPTOR->click($FUNCTION1_DESCRIPTOR)$FUNCTION1_DESCRIPTOR"
private const val LONG_CLICK = "$REEL_DOWNLOAD_DESCRIPTOR->longClick($FUNCTION1_DESCRIPTOR)$FUNCTION1_DESCRIPTOR"

private val STATIC_INVOKE_OPCODES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

/** The plain form of a `/range` invoke, so a hook can re-issue the call and let the emitter pick the encoding. */
private fun Opcode.withoutRange(): Opcode =
    when (this) {
        Opcode.INVOKE_DIRECT_RANGE -> Opcode.INVOKE_DIRECT
        Opcode.INVOKE_VIRTUAL_RANGE -> Opcode.INVOKE_VIRTUAL
        Opcode.INVOKE_INTERFACE_RANGE -> Opcode.INVOKE_INTERFACE
        Opcode.INVOKE_STATIC_RANGE -> Opcode.INVOKE_STATIC
        else -> this
    }

/**
 * Reels download button. The reels action column is a Litho UFI: like, comment, repost, share and save
 * are separate components, and views added by hand are rejected. The save button component (the
 * `ClipsSaveButtonComponent`) is therefore built a second time, right before the real one, and
 * registered with the extension. The hooks in its render method change only registered copies: the
 * icon, the tap and long press handlers, the selected state and the view id. The other handlers the
 * render method sets (impression logging) are left alone: the impression one fires whenever a reel is
 * shown.
 *
 * Every obfuscated member is resolved by behavior:
 *  - the component is the one render method that sets the `save_button` id and tag,
 *  - the builder is the one method that returns that component by constructing it,
 *  - the `Media` is reached through the one field path from the component to a `Media`
 *    (component state, then the item model), and the context through the one field path from the
 *    render composer to a `Context`.
 */
@Suppress("unused")
val reelDownloadPatch =
    bytecodePatch(
        description = "Adds a download button to the reels action column.",
    ) {
        dependsOn(sharedExtensionPatch, resourceMappingPatch)

        instagramToggle(
            id = "instagram.downloads.reel_button",
            category = Categories.DOWNLOADS,
            strings = settingStrings("piko_ig_reel_download_button"),
            order = 400,
            defaultValue = true,
        )

        execute {
            injectReelDownloadButton(getResourceId(ResourceType.ID, REEL_SAVE_BUTTON_ID))
        }
    }

/** The route from the save component to its `Media`: component field, then model field, then `Media` field. */
private class ReelMediaPath(
    val state: FieldReference,
    val model: FieldReference,
    val media: FieldReference,
)

private class ReelContextPath(
    val holder: FieldReference,
    val context: FieldReference,
)

private fun ClassDef.fieldsOfType(type: String): List<Field> = instanceFields.filter { it.type == type }

context(patchContext: BytecodePatchContext)
private fun injectReelDownloadButton(saveButtonId: Long) {
    val render = reelSaveRender(saveButtonId)
    val componentType = render.definingClass
    val componentClass = patchContext.classDefBy(componentType)
    val composerType = render.parameterTypes.single().toString()

    val userSessionField =
        requireExactlyOne("UserSession field of $componentType", componentClass.fieldsOfType(USER_SESSION_DESCRIPTOR))
    val tintField =
        requireExactlyOne("ColorFilter field of $componentType", componentClass.fieldsOfType(COLOR_FILTER_DESCRIPTOR))
    val mediaPath = reelMediaPath(componentClass)
    val contextPath = reelContextPath(composerType)

    val builder = reelSaveBuilder(componentType)
    val builderCallSites = reelBuilderCallSites(builder, componentType)

    hookSaveRender(render, componentType, composerType, mediaPath.state.type)
    hookBuilderCallSites(builder, builderCallSites, componentType)

    replaceBridgeBody(
        REEL_DOWNLOAD_DESCRIPTOR,
        "media",
        listOf(OBJECT_DESCRIPTOR),
        OBJECT_DESCRIPTOR,
        registers = 3,
    ) {
        val state = 0
        val value = 1
        val component = 2
        checkCast(component, componentType)
        iget(state, component, mediaPath.state)
        ifEqz(state, Target.Local("none"))
        iget(state, state, mediaPath.model)
        ifEqz(state, Target.Local("none"))
        iget(value, state, mediaPath.media)
        returnObject(value)

        label("none")
        constInt(value, 0)
        returnObject(value)
    }

    replaceBridgeBody(
        REEL_DOWNLOAD_DESCRIPTOR,
        "session",
        listOf(OBJECT_DESCRIPTOR),
        USER_SESSION_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val component = 1
        checkCast(component, componentType)
        iget(value, component, userSessionField)
        returnObject(value)
    }

    replaceBridgeBody(
        REEL_DOWNLOAD_DESCRIPTOR,
        "tint",
        listOf(OBJECT_DESCRIPTOR),
        COLOR_FILTER_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val component = 1
        checkCast(component, componentType)
        iget(value, component, tintField)
        returnObject(value)
    }

    replaceBridgeBody(
        REEL_DOWNLOAD_DESCRIPTOR,
        "context",
        listOf(OBJECT_DESCRIPTOR),
        CONTEXT_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val composer = 1
        checkCast(composer, composerType)
        iget(value, composer, contextPath.holder)
        ifEqz(value, Target.Local("none"))
        iget(value, value, contextPath.context)
        returnObject(value)

        label("none")
        constInt(value, 0)
        returnObject(value)
    }
}

/**
 * The save button component's render method: the only one that carries the `save_button` id literal
 * together with the `save_button` tag string.
 */
context(patchContext: BytecodePatchContext)
private fun reelSaveRender(saveButtonId: Long): Method =
    requireExactlyOne(
        "reels save button render method",
        Fingerprint(filters = listOf(literal(saveButtonId)))
            .matchAll()
            .map { it.method }
            .filter { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.size == 1 &&
                    method.implementation?.instructions.orEmpty().any {
                        it.getReference<StringReference>()?.string == REEL_SAVE_BUTTON_ID
                    }
            },
    )

context(patchContext: BytecodePatchContext)
private fun reelMediaPath(componentClass: ClassDef): ReelMediaPath =
    requireExactlyOne(
        "Media field path from ${componentClass.type}",
        componentClass.instanceFields.flatMap { state ->
            val stateClass = patchContext.classDefByOrNull(state.type) ?: return@flatMap emptyList()
            stateClass.instanceFields.flatMap { model ->
                val modelClass = patchContext.classDefByOrNull(model.type) ?: return@flatMap emptyList()
                modelClass.fieldsOfType(MEDIA_DESCRIPTOR).map { media -> ReelMediaPath(state, model, media) }
            }
        },
        describe = { "${it.state}.${it.model}.${it.media}" },
    )

context(patchContext: BytecodePatchContext)
private fun reelContextPath(composerType: String): ReelContextPath =
    requireExactlyOne(
        "Context field path from $composerType",
        patchContext.classDefBy(composerType).instanceFields.flatMap { holder ->
            val holderClass = patchContext.classDefByOrNull(holder.type) ?: return@flatMap emptyList()
            holderClass.fieldsOfType(CONTEXT_DESCRIPTOR).map { context -> ReelContextPath(holder, context) }
        },
        describe = { "${it.holder}.${it.context}" },
    )

/** The method outside the component that returns it by constructing it. */
context(patchContext: BytecodePatchContext)
private fun reelSaveBuilder(componentType: String): Method =
    requireExactlyOne(
        "reels save component builder",
        Fingerprint(returnType = componentType)
            .matchAll()
            .map { it.method }
            .filter { method ->
                method.definingClass != componentType &&
                    method.implementation?.instructions.orEmpty().any {
                        it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == componentType
                    }
            },
    )

private class BuilderCallSite(
    val method: Method,
    val index: Int,
)

/** Every call of [builder] in its own class: the action column builds the save button in each of its layouts. */
context(patchContext: BytecodePatchContext)
private fun reelBuilderCallSites(
    builder: Method,
    componentType: String,
): List<BuilderCallSite> {
    val sites =
        patchContext.classDefBy(builder.definingClass).methods.flatMap { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.indices
                .filter { index -> instructions[index].methodRef()?.sameSignatureAs(builder) == true }
                .map { index -> BuilderCallSite(method, index) }
        }
    if (sites.isEmpty()) throw PatchException("No call of the reels save component builder $builder")
    if (builder.returnType != componentType) throw PatchException("Builder $builder does not return $componentType")
    return sites
}

/**
 * Builds a second save component before every real one and registers it. The call is re-issued with the
 * registers it already uses, and the copy goes into the same list right before the real component.
 */
context(patchContext: BytecodePatchContext)
private fun hookBuilderCallSites(
    builder: Method,
    sites: List<BuilderCallSite>,
    componentType: String,
) {
    val caller = requireExactlyOne("caller of the reels save component builder $builder", sites.map { it.method }.distinct())
    val callerInstructions = caller.implementation?.instructions?.toList().orEmpty()
    val mutableCaller = caller.toMutable("reels action column render method")

    // Highest index first, so the indexes of the remaining sites stay valid.
    sites.sortedByDescending { it.index }.forEach { site ->
        val call = callerInstructions[site.index]
        val callRegisters = call.registers()

        // The original code hands the built component to a collector right after the call: a plain
        // `List.add` on 448, a null-checking wrapper around the list on 449. Whichever it is, the contract
        // is the first call that takes the call's result: an instance method with that result as its only
        // argument. It is asserted to be the only one taken.
        val resultRegister =
            (callerInstructions.getOrNull(site.index + 1) as? OneRegisterInstruction)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                ?.registerA
                ?: throw PatchException("The builder call at ${site.index} in $caller does not keep its result")
        val listAdd =
            callerInstructions
                .drop(site.index + 2)
                .filter { instruction -> instruction.methodRef() != null && resultRegister in instruction.registers() }
                .take(1)
                .filter { instruction ->
                    instruction.registers().size == 2 &&
                        instruction.opcode !in STATIC_INVOKE_OPCODES &&
                        instruction.methodRef()?.let { reference ->
                            reference.parameterTypes.size == 1 && (reference.returnType == "Z" || reference.returnType == "V")
                        } == true
                }
        val add = requireExactlyOne("collector add after the builder call at ${site.index} in $caller", listAdd)
        val listRegister = add.registers().first()

        mutableCaller.insertHook(
            index = site.index,
            excludedRegisters = caller.parameterBlock() + callRegisters + listRegister,
            relocateBranchTargets = true,
        ) {
            // One register serves the enabled flag, then the component: registers are scarce here.
            val component = scratchRegister()

            invokeStatic(methodReference(IS_ENABLED))
            moveResult(component, "Z")
            ifEqz(component, Target.Original)

            invoke(call.opcode.withoutRange(), builder, callRegisters)
            moveResult(component, componentType)
            ifEqz(component, Target.Original)

            invokeStatic(methodReference(REGISTER), component)
            invoke(add.opcode.withoutRange(), add.methodRef()!!, listOf(listRegister, component))
        }
    }
}

/**
 * Replaces the value in [register] with what the extension returns for it. The render method keeps most
 * of its values in high registers and has no free low ones, so the single operand is passed straight
 * from its own register; the extension knows which component is rendering from [BEGIN].
 */
private fun Block.replaceValue(
    reference: String,
    register: Int,
    type: String,
) {
    invokeStatic(methodReference(reference), register)
    moveResult(register, type)
}

/**
 * True when the setter [reference] stores its value under the view property named [propertyName]: the
 * setter reads an enum constant, and that enum's static initializer names the constant.
 */
context(patchContext: BytecodePatchContext)
internal fun setsViewProperty(
    reference: MethodReference,
    propertyName: String,
): Boolean {
    val setter =
        requireExactlyOne(
            "modifier setter $reference",
            patchContext.classDefBy(reference.definingClass).methods.filter { it.sameSignatureAs(reference) },
        )
    return setter.implementation?.instructions?.toList().orEmpty().any { instruction ->
        val field = instruction.getReference<FieldReference>()
        instruction.opcode == Opcode.SGET_OBJECT && field != null && enumConstantName(field) == propertyName
    }
}

/** The name an enum constant is created with, read from the static initializer that stores it. */
context(patchContext: BytecodePatchContext)
private fun enumConstantName(constant: FieldReference): String? {
    val enumClass = patchContext.classDefByOrNull(constant.definingClass) ?: return null
    if (!AccessFlags.ENUM.isSet(enumClass.accessFlags)) return null
    val initializer =
        requireExactlyOne(
            "static initializer of ${enumClass.type}",
            enumClass.methods.filter { it.name == "<clinit>" },
        )
    // The constant's name is the last string loaded before the store that keeps the constant.
    var lastString: String? = null
    initializer.implementation?.instructions?.toList().orEmpty().forEach { instruction ->
        instruction.getReference<StringReference>()?.let { lastString = it.string }
        val stored = instruction.getReference<FieldReference>()
        if (instruction.opcode == Opcode.SPUT_OBJECT && stored != null && stored.name == constant.name) return lastString
    }
    return null
}

/**
 * The hooks in the save component's render method. Each one passes the component being rendered, so the
 * extension changes the registered copy and hands every other component its original value back.
 */
context(patchContext: BytecodePatchContext)
private fun hookSaveRender(
    render: Method,
    componentType: String,
    composerType: String,
    stateType: String,
) {
    val instructions = render.implementation?.instructions?.toList().orEmpty()
    val thisRegister = render.parameterRegisterStart()
    val composerRegister = render.registerOfParameter(composerType)

    fun staticCalls(matches: (MethodReference) -> Boolean): List<Int> =
        instructions.indices.filter { index ->
            val instruction = instructions[index]
            instruction.opcode in STATIC_INVOKE_OPCODES && instruction.methodRef()?.let(matches) == true
        }

    fun parameters(reference: MethodReference) = reference.parameterTypes.map { it.toString() }

    // Modifier setters take the modifier and a value and return the modifier.
    fun modifierSetter(
        reference: MethodReference,
        value: String,
    ) = parameters(reference).size == 2 &&
        parameters(reference)[1] == value &&
        reference.returnType == parameters(reference)[0]

    // Handler setters take a modifier and a Function1 and are told apart by the view property they set.
    val clickSetters =
        staticCalls { reference ->
            modifierSetter(reference, FUNCTION1_DESCRIPTOR) && setsViewProperty(reference, ON_CLICK_PROPERTY)
        }
    // The tap handler is set once on the icon's modifier chain, and once more in the layout that wraps
    // its handlers. The long press handler is set the same way.
    if (clickSetters.size != 2) {
        throw PatchException("Expected two tap handler setters in $render, found ${clickSetters.size}: $clickSetters")
    }
    val longClickSetters =
        staticCalls { reference ->
            modifierSetter(reference, FUNCTION1_DESCRIPTOR) && setsViewProperty(reference, ON_LONG_CLICK_PROPERTY)
        }
    if (longClickSetters.size != 2) {
        throw PatchException("Expected two long press handler setters in $render, found ${longClickSetters.size}: $longClickSetters")
    }
    val idSetters = staticCalls { modifierSetter(it, "I") }
    if (idSetters.size != 2) {
        throw PatchException("Expected two view id setters in $render, found ${idSetters.size}: $idSetters")
    }
    val descriptionSetter = requireExactlyOne("content description setter in $render", staticCalls { modifierSetter(it, CHAR_SEQUENCE_DESCRIPTOR) })

    val iconConstructor =
        requireExactlyOne(
            "icon constructor in $render",
            instructions.indices.filter { index ->
                val reference = instructions[index].methodRef() ?: return@filter false
                reference.name == "<init>" &&
                    parameters(reference).take(3) == listOf(COLOR_STATE_LIST_DESCRIPTOR, DRAWABLE_DESCRIPTOR, SCALE_TYPE_DESCRIPTOR)
            },
        )
    val savedFlagRead =
        requireExactlyOne(
            "saved flag read from $stateType in $render",
            instructions.indices.filter { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.IGET_BOOLEAN &&
                    instruction.getReference<FieldReference>()?.definingClass == stateType
            },
        )

    class Hook(
        val index: Int,
        val block: Block.() -> Unit,
    )

    val hooks = mutableListOf<Hook>()

    // The component and the composer are the render method's two parameters, in consecutive registers.
    hooks +=
        Hook(0) {
            invokeStatic(methodReference(BEGIN), thisRegister, composerRegister)
        }

    // The icon drawable is the second argument of the icon constructor, after the instance itself.
    val drawableRegister = instructions[iconConstructor].registers()[2]
    hooks +=
        Hook(iconConstructor) {
            replaceValue(ICON, drawableRegister, DRAWABLE_DESCRIPTOR)
        }

    clickSetters.forEach { index ->
        val handlerRegister = instructions[index].registers()[1]
        hooks +=
            Hook(index) {
                replaceValue(CLICK, handlerRegister, FUNCTION1_DESCRIPTOR)
            }
    }
    longClickSetters.forEach { index ->
        val handlerRegister = instructions[index].registers()[1]
        hooks +=
            Hook(index) {
                replaceValue(LONG_CLICK, handlerRegister, FUNCTION1_DESCRIPTOR)
            }
    }
    idSetters.forEach { index ->
        val idRegister = instructions[index].registers()[1]
        hooks +=
            Hook(index) {
                replaceValue(VIEW_ID, idRegister, "I")
            }
    }

    val descriptionRegister = instructions[descriptionSetter].registers()[1]
    hooks +=
        Hook(descriptionSetter) {
            replaceValue(DESCRIPTION, descriptionRegister, CHAR_SEQUENCE_DESCRIPTOR)
        }

    // The saved flag is read into a register that feeds the next call, so it is replaced right after the read.
    val savedRegister = instructions[savedFlagRead].registers()[0]
    hooks +=
        Hook(savedFlagRead + 1) {
            replaceValue(SELECTED, savedRegister, "Z")
        }

    val mutableRender = render.toMutable("reels save button render method to patch")
    // Highest index first, so the indexes of the remaining hooks stay valid.
    hooks.sortedByDescending { it.index }.forEach { hook ->
        mutableRender.insertHook(
            index = hook.index,
            excludedRegisters = render.parameterBlock(),
            relocateBranchTargets = true,
            block = hook.block,
        )
    }
}
