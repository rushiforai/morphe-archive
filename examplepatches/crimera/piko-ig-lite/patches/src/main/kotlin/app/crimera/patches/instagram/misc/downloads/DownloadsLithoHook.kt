/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.RegisterLimit
import app.crimera.bytecode.Target
import app.crimera.bytecode.fieldReference
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Kotlin event handler type the UFI `ON_CLICK` setter takes. */
private const val FUNCTION1_DESCRIPTOR = "Lkotlin/jvm/functions/Function1;"
private const val CONTEXT_DESCRIPTOR = "Landroid/content/Context;"
private const val SCALE_TYPE_DESCRIPTOR = "Landroid/widget/ImageView\$ScaleType;"

private const val BUTTON_VIEW_CLASS = "android.widget.Button"

private const val DOWNLOAD_CONTENT_DESCRIPTION = "Download"
private const val CENTER_SCALE_TYPE = "$SCALE_TYPE_DESCRIPTOR->CENTER:$SCALE_TYPE_DESCRIPTOR"
private const val INTEGER_VALUE_OF = "$INTEGER_DESCRIPTOR->valueOf(I)$INTEGER_DESCRIPTOR"

private const val CLICK_HANDLER_DESCRIPTOR =
    "Lapp/morphe/extension/instagram/patches/download/FeedDownloadClickFunction;"
private const val CLICK_HANDLER_CONSTRUCTOR =
    "$CLICK_HANDLER_DESCRIPTOR-><init>($CONTEXT_DESCRIPTOR$USER_SESSION_DESCRIPTOR$OBJECT_DESCRIPTOR)V"
private const val LONG_CLICK_FACTORY =
    "$CLICK_HANDLER_DESCRIPTOR->longClick($FUNCTION1_DESCRIPTOR)$FUNCTION1_DESCRIPTOR"
private const val FEED_DOWNLOAD_ENABLED = "$DOWNLOAD_UTILS_DESCRIPTOR->isFeedDownloadButtonEnabled()Z"

private val MOVE_OPCODES =
    setOf(
        Opcode.MOVE,
        Opcode.MOVE_FROM16,
        Opcode.MOVE_16,
        Opcode.MOVE_OBJECT,
        Opcode.MOVE_OBJECT_FROM16,
        Opcode.MOVE_OBJECT_16,
    )
private val STATIC_INVOKES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val INVOKE_BASE_OPCODES =
    mapOf(
        Opcode.INVOKE_VIRTUAL_RANGE to Opcode.INVOKE_VIRTUAL,
        Opcode.INVOKE_INTERFACE_RANGE to Opcode.INVOKE_INTERFACE,
        Opcode.INVOKE_DIRECT_RANGE to Opcode.INVOKE_DIRECT,
        Opcode.INVOKE_STATIC_RANGE to Opcode.INVOKE_STATIC,
        Opcode.INVOKE_SUPER_RANGE to Opcode.INVOKE_SUPER,
    )


/** The leading icon wrapper parameters after the scale type and the node; trailing ones are flags. */
private val ICON_WRAPPER_VALUE_PARAMETERS = listOf(INTEGER_DESCRIPTOR, "I", "I")

/**
 * Litho UFI surfaces (e.g. the contextual profile feed) reject views added by hand, so the download
 * icon is built into the component tree as a second icon node ahead of the save icon. Every
 * obfuscated type and member is resolved from the instructions that build the save icon: its id
 * setter names the node type, the builder's return type names the component, and the icon wrapper
 * and component factory calls, rebuilt right after the injection point, stage every invoke.
 */
context(patchContext: BytecodePatchContext)
internal fun injectLithoDownloadButton(
    saveButtonId: Long,
    downloadDrawableId: Long,
    stateType: String,
) {
    // The builder is the save-literal method that wraps an icon in an `ImageView.ScaleType` wrapper
    // and marks it as a button; the view holder constructor matches the literal too.
    val builder =
        requireExactlyOne(
            "UFI litho component builder",
            Fingerprint(filters = listOf(literal(saveButtonId)))
                .matchAll()
                .map { it.method }
                .filter { method ->
                    val instructions = method.implementation?.instructions.orEmpty()
                    instructions.any { it.getReference<StringReference>()?.string == BUTTON_VIEW_CLASS } &&
                        instructions.any { instruction ->
                            val reference = instruction.methodRef() ?: return@any false
                            reference.name == "<init>" && reference.parameterTypes.firstOrNull()?.toString() == SCALE_TYPE_DESCRIPTOR
                        }
                },
        )
    val instructions =
        builder.implementation?.instructions?.toList()
            ?: throw PatchException("Litho UFI builder $builder has no implementation")
    val componentType = builder.returnType

    // resolver-lint: allow instruction-order raw-first because the builder sets up the save icon once, from its id literal on
    val saveIndex = instructions.indexOfFirst { it is Instruction31i && it.wideLiteral == saveButtonId }
    if (saveIndex < 0) throw PatchException("No save-button literal in $builder")

    fun indexAfter(
        what: String,
        after: Int,
        matches: (MethodReference) -> Boolean,
    ): Int =
        (after + 1 until instructions.size).firstOrNull { index -> instructions[index].methodRef()?.let(matches) == true }
            ?: throw PatchException("No $what after index $after in $builder")

    fun staticCallAt(
        index: Int,
        what: String,
    ): MethodReference {
        val instruction = instructions[index]
        if (instruction.opcode !in STATIC_INVOKES) throw PatchException("Expected a static $what at index $index in $builder")
        return instruction.methodRef()!!
    }

    /** The register each of [destinations] is loaded from by a move shortly before [index]. */
    fun sourceMoves(
        index: Int,
        destinations: List<Int>,
    ): List<Int> =
        destinations.map { destination ->
            (index - 1 downTo (index - destinations.size - 3).coerceAtLeast(0))
                .firstNotNullOfOrNull { candidate ->
                    val instruction = instructions[candidate]
                    (instruction as? TwoRegisterInstruction)
                        ?.takeIf { instruction.opcode in MOVE_OPCODES && it.registerA == destination }
                        ?.registerB
                } ?: throw PatchException("No source move for v$destination before index $index in $builder")
        }

    // The save literal feeds the id setter, which names the node type of the icon chain.
    val idSetter =
        staticCallAt(
            indexAfter("save icon id setter", saveIndex) { reference ->
                reference.parameterTypes.map { it.toString() } == listOf(reference.returnType, "I")
            },
            "save icon id setter",
        )
    val nodeType = idSetter.returnType

    val onClickIndex =
        indexAfter("ON_CLICK setter", saveIndex) { reference ->
            reference.returnType == nodeType &&
                reference.parameterTypes.map { it.toString() } == listOf(nodeType, FUNCTION1_DESCRIPTOR)
        }
    val onClickSetter = staticCallAt(onClickIndex, "ON_CLICK setter")

    // The long press setter sits beside the tap setter: same owner and signature, told apart by the
    // view property it sets. The builder never sets one on the save icon, so it is not called there.
    val longClickSetter =
        requireExactlyOne(
            "ON_LONG_CLICK setter beside $onClickSetter",
            patchContext.classDefBy(onClickSetter.definingClass).methods.filter { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == onClickSetter.returnType &&
                    method.parameterTypes.map { it.toString() } == onClickSetter.parameterTypes.map { it.toString() } &&
                    setsViewProperty(method, ON_LONG_CLICK_PROPERTY)
            },
        )

    // The content description is set two instructions before the button view class is loaded. The
    // node passed to ON_CLICK has no click props yet, so the download node does not inherit them.
    val viewClassIndex =
        (saveIndex - 1 downTo 0).firstOrNull { instructions[it].getReference<StringReference>()?.string == BUTTON_VIEW_CLASS }
            ?: throw PatchException("No \"$BUTTON_VIEW_CLASS\" before the save literal in $builder")
    if (viewClassIndex < 2) throw PatchException("No content description setter before index $viewClassIndex in $builder")
    val descriptionSetter = staticCallAt(viewClassIndex - 2, "content description setter")
    val nodeRegister =
        instructions[onClickIndex].registers().firstOrNull()
            ?: throw PatchException("ON_CLICK call at $onClickIndex has no node in $builder")

    // Icon wrapper: (ScaleType, node, Integer tint, int drawable, int size, trailing flags...).
    val wrapperIndex =
        indexAfter("icon wrapper construction", onClickIndex) { reference ->
            val parameters = reference.parameterTypes.map { it.toString() }
            reference.name == "<init>" &&
                parameters.take(2) == listOf(SCALE_TYPE_DESCRIPTOR, nodeType) &&
                parameters.drop(2).take(3) == ICON_WRAPPER_VALUE_PARAMETERS &&
                parameters.drop(5).all { it == "Z" }
        }
    val wrapperConstructor = instructions[wrapperIndex].methodRef()!!
    val wrapperCall = instructions[wrapperIndex].registers()
    if (wrapperCall.size != wrapperConstructor.parameterTypes.size + 1) {
        throw PatchException("Unexpected icon wrapper call shape in $builder: $wrapperConstructor with ${wrapperCall.size} registers")
    }
    val wrapperFlagSources = sourceMoves(wrapperIndex, wrapperCall.drop(6))

    // The component factory takes the wrapper as its second argument and returns the component the
    // builder adds to the icon list.
    val factoryIndex = indexAfter("component factory call", wrapperIndex) { it.returnType == componentType }
    val factory = staticCallAt(factoryIndex, "component factory")
    val call = instructions[factoryIndex].registers()
    val factoryTypes = factory.parameterTypes.map { it.toString() }
    if (call.size != factoryTypes.size || call.size < 3 || call[1] != wrapperCall[0]) {
        throw PatchException("Unexpected component factory call shape in $builder: $factory with registers $call")
    }
    // The first argument is loaded before the ON_CLICK setter and must survive to the factory call.
    if (instructions.subList(onClickIndex, factoryIndex).any {
            it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == call[0]
        }
    ) {
        throw PatchException("Component factory argument v${call[0]} is rewritten after the ON_CLICK setter in $builder")
    }
    val sources = sourceMoves(factoryIndex, call.drop(2))
    val userSessionRegister =
        sources[
            requireExactlyOne(
                "UserSession argument of $factory",
                factoryTypes.indices.filter { factoryTypes[it] == USER_SESSION_DESCRIPTOR && it >= 2 },
            ) - 2,
        ]

    val listAddIndex =
        indexAfter("icon list add", factoryIndex) {
            it.name == "add" && it.returnType == "Z" && it.parameterTypes.map { type -> type.toString() } == listOf(OBJECT_DESCRIPTOR)
        }
    val listAdd = instructions[listAddIndex]
    val listAddOpcode = INVOKE_BASE_OPCODES[listAdd.opcode] ?: listAdd.opcode
    val listRegister =
        listAdd.registers().firstOrNull()
            ?: throw PatchException("Icon list add at $listAddIndex has no receiver in $builder")

    val stateRegister =
        requireExactlyOne(
            "check-cast to $stateType in $builder",
            instructions
                .filter { it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == stateType }
                .map { (it as OneRegisterInstruction).registerA }
                .distinct(),
        )

    // The save icon's size and tint come from two theme attribute lookups; reuse them.
    val themeCalls =
        (saveIndex until factoryIndex).mapNotNull { index ->
            val reference = instructions[index].methodRef() ?: return@mapNotNull null
            val parameters = reference.parameterTypes.map { it.toString() }
            if (instructions[index].opcode in STATIC_INVOKES &&
                reference.returnType == "I" &&
                parameters.size == 2 &&
                parameters[1] == "I"
            ) {
                index to reference
            } else {
                null
            }
        }
    if (themeCalls.size != 2) {
        throw PatchException("Expected two theme attribute lookups in $builder, found ${themeCalls.size}")
    }
    val (dimensionCall, tintCall) = themeCalls
    if (!dimensionCall.second.sameSignatureAs(tintCall.second)) {
        throw PatchException("Theme attribute lookups in $builder differ: ${dimensionCall.second}, ${tintCall.second}")
    }
    val themeAccessor = dimensionCall.second

    fun attributeLiteral(callIndex: Int): Int =
        (callIndex - 1 downTo (callIndex - 4).coerceAtLeast(0))
            .firstNotNullOfOrNull { (instructions[it] as? Instruction31i)?.wideLiteral?.toInt() }
            ?: throw PatchException("No theme attribute constant before index $callIndex in $builder")

    val dimensionAttribute = attributeLiteral(dimensionCall.first)
    val tintAttribute = attributeLiteral(tintCall.first)

    if (builder.parameterTypes.size != 1) throw PatchException("Expected one parameter on $builder")
    val componentContext = builder.registerOfParameter(builder.parameterTypes[0].toString())
    val componentContextType = themeAccessor.parameterTypes[0].toString()
    val componentContextClass = patchContext.classDefBy(componentContextType)
    val contextGetter =
        requireExactlyOne(
            "component context accessor on $componentContextType",
            componentContextClass.methods.filter { method ->
                method.parameterTypes.isEmpty() && method.returnType == CONTEXT_DESCRIPTOR
            },
        )
    val contextGetterOpcode =
        if (AccessFlags.INTERFACE.isSet(componentContextClass.accessFlags)) Opcode.INVOKE_INTERFACE else Opcode.INVOKE_VIRTUAL

    val excluded =
        (
            builder.parameterBlock() + nodeRegister + stateRegister + listRegister + call + sources +
                wrapperCall + wrapperFlagSources
        ).distinct()

    builder.insertHook(
        index = onClickIndex,
        excludedRegisters = excluded,
        relocateBranchTargets = false,
    ) {
        val flag = scratchRegister(RegisterLimit.BYTE) // also the constant staging register
        val handler = scratchRegister(RegisterLimit.BYTE)
        val context = scratchRegister(RegisterLimit.BYTE)
        val node = scratchRegister(RegisterLimit.BYTE) // the download icon node, then the finished component
        val scaleType = scratchRegister(RegisterLimit.BYTE)
        val dimension = scratchRegister(RegisterLimit.BYTE)
        val tint = scratchRegister(RegisterLimit.BYTE)

        invokeStatic(methodReference(FEED_DOWNLOAD_ENABLED))
        moveResult(flag, "Z")
        ifEqz(flag, Target.Original)

        // Both call runs are dead here: the original code reloads them right before its own calls.
        val (first, second, third, fourth) = wrapperCall

        newInstance(handler, CLICK_HANDLER_DESCRIPTOR)
        invoke(contextGetterOpcode, contextGetter, listOf(componentContext))
        moveResult(context, CONTEXT_DESCRIPTOR)
        move(first, handler, CLICK_HANDLER_DESCRIPTOR)
        move(second, context, CONTEXT_DESCRIPTOR)
        move(third, userSessionRegister, USER_SESSION_DESCRIPTOR)
        move(fourth, stateRegister, stateType)
        invokeDirect(methodReference(CLICK_HANDLER_CONSTRUCTOR), first, second, third, fourth)

        constInt(flag, -1)
        move(first, nodeRegister, nodeType)
        move(second, flag, "I")
        invokeStatic(idSetter, first, second)
        moveResult(node, nodeType)

        constString(flag, DOWNLOAD_CONTENT_DESCRIPTION)
        move(first, node, nodeType)
        move(second, flag, OBJECT_DESCRIPTOR)
        invokeStatic(descriptionSetter, first, second)
        moveResult(node, nodeType)

        move(first, node, nodeType)
        move(second, handler, FUNCTION1_DESCRIPTOR)
        invokeStatic(onClickSetter, first, second)
        moveResult(node, nodeType)

        // Holding the button offers the chooser; the handler is derived from the tap handler.
        move(first, handler, FUNCTION1_DESCRIPTOR)
        invokeStatic(methodReference(LONG_CLICK_FACTORY), first)
        moveResult(flag, FUNCTION1_DESCRIPTOR)
        move(first, node, nodeType)
        move(second, flag, FUNCTION1_DESCRIPTOR)
        invokeStatic(longClickSetter, first, second)
        moveResult(node, nodeType)

        sget(scaleType, fieldReference(CENTER_SCALE_TYPE))

        constInt(flag, dimensionAttribute)
        move(first, componentContext, componentContextType)
        move(second, flag, "I")
        invokeStatic(themeAccessor, first, second)
        moveResult(dimension, "I")

        constInt(flag, tintAttribute)
        move(first, componentContext, componentContextType)
        move(second, flag, "I")
        invokeStatic(themeAccessor, first, second)
        moveResult(tint, "I")
        invokeStatic(methodReference(INTEGER_VALUE_OF), tint)
        moveResult(tint, INTEGER_DESCRIPTOR)

        // The wrapper lands in `wrapperCall[0]`, which is the factory's second argument.
        constInt(flag, downloadDrawableId.toInt())
        newInstance(wrapperCall[0], wrapperConstructor.definingClass)
        move(wrapperCall[1], scaleType, SCALE_TYPE_DESCRIPTOR)
        move(wrapperCall[2], node, nodeType)
        move(wrapperCall[3], tint, INTEGER_DESCRIPTOR)
        move(wrapperCall[4], flag, "I")
        move(wrapperCall[5], dimension, "I")
        wrapperFlagSources.forEachIndexed { offset, source -> move(wrapperCall[6 + offset], source, "Z") }
        invoke(Opcode.INVOKE_DIRECT, wrapperConstructor, wrapperCall)

        for (argument in 2 until call.size) move(call[argument], sources[argument - 2], factoryTypes[argument])
        invokeStatic(factory, *call.toIntArray())
        moveResult(node, componentType)
        // The builder null-checks the save component before adding it; do the same.
        ifEqz(node, Target.Original)

        move(first, listRegister, OBJECT_DESCRIPTOR)
        move(second, node, componentType)
        invoke(listAddOpcode, listAdd.methodRef()!!, listOf(first, second))
    }
}
