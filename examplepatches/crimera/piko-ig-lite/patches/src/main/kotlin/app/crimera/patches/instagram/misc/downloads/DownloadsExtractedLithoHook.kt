/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.RegisterLimit
import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.isAssignableTo
import app.crimera.patches.common.requireExactlyOne
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** The extracted save helper returns a wrapper; its caller owns the component factory and icon list. */
context(context: BytecodePatchContext)
internal fun injectExtractedLithoDownloadButton(
    helper: MutableMethod,
    wrapperConstructor: MethodReference,
    idSetter: MethodReference,
    descriptionSetter: MethodReference,
    onClickSetter: MethodReference,
    longClickSetter: MethodReference,
    stateType: String,
    drawable: Long,
) {
    val owner = context.mutableClassDefBy(helper.definingClass)
    val (parent, helperIndex) = requireExactlyOne(
        "caller of extracted save icon helper $helper",
        owner.methods.flatMap { method ->
            method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
                val reference = instruction.methodRef()
                if (reference?.definingClass == helper.definingClass && reference.sameSignatureAs(helper)) method to index else null
            }.orEmpty()
        },
    )
    val instructions = parent.implementation!!.instructions.toList()
    val result = instructions.getOrNull(helperIndex + 1)
    if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("No wrapper result after $helper in $parent")
    val originalWrapper = (result as OneRegisterInstruction).registerA
    val helperCall = instructions[helperIndex].registers()
    val stateParameter = requireExactlyOne("state parameter of $helper", helper.parameterTypes.indices.filter { helper.parameterTypes[it] == stateType })
    val stateRegister = helperCall[stateParameter + 1]
    fun writes(index: Int, register: Int) =
        instructions[index].opcode.setsRegister() && (instructions[index] as? OneRegisterInstruction)?.registerA == register
    val wrapperEnd = (helperIndex + 2 until instructions.size).firstOrNull { writes(it, originalWrapper) } ?: instructions.size
    val factoryIndex = requireExactlyOne(
        "component factory consuming extracted save wrapper in $parent",
        (helperIndex + 2 until wrapperEnd).filter { index ->
            val reference = instructions[index].methodRef() ?: return@filter false
            val registers = instructions[index].registers()
            instructions[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                reference.parameterTypes.size >= 2 && registers.getOrNull(1) == originalWrapper &&
                context.isAssignableTo(helper.returnType, reference.parameterTypes[1].toString()) &&
                context.isAssignableTo(helper.returnType, reference.returnType)
        },
    )
    if ((helperIndex + 2 until factoryIndex).any { writes(it, stateRegister) }) throw PatchException("Extracted save state is overwritten in $parent")
    val factory = instructions[factoryIndex].methodRef()!!
    val factoryCall = instructions[factoryIndex].registers()
    val sessionRegister = factoryCall[requireExactlyOne("UserSession argument of $factory", factory.parameterTypes.indices.filter { factory.parameterTypes[it] == USER_SESSION_DESCRIPTOR })]
    val listAddIndex = requireExactlyOne(
        "list insertion immediately consuming $factory in $parent",
        (factoryIndex + 1 until (factoryIndex + 5).coerceAtMost(instructions.size)).filter { index ->
            val reference = instructions[index].methodRef()
            reference?.name == "add" && reference.returnType == "Z" && reference.parameterTypes.map { it.toString() } == listOf(OBJECT_DESCRIPTOR)
        },
    )
    val listAdd = instructions[listAddIndex]
    val listRegister = listAdd.registers()[0]
    val factoryResult = instructions[factoryIndex + 1]
    if (factoryResult.opcode != Opcode.MOVE_RESULT_OBJECT || listAdd.registers().getOrNull(1) != (factoryResult as OneRegisterInstruction).registerA) {
        throw PatchException("Factory result does not feed the save icon list in $parent")
    }

    val nodeType = idSetter.returnType
    val seed = requireExactlyOne("empty icon node singleton on $nodeType", context.classDefBy(nodeType).fields.filter {
        AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) && context.isAssignableTo(it.type, nodeType)
    })
    val contextFields = factory.parameterTypes.indices.flatMap { argument ->
        context.classDefByOrNull(factory.parameterTypes[argument].toString())?.fields?.filter {
            it.type == "Landroid/content/Context;" && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }?.map { argument to it }.orEmpty()
    }
    val (contextArgument, androidContextField) = requireExactlyOne("Android context in $factory arguments", contextFields)

    // Constructor assignments establish each wrapper value's meaning, including the two int fields.
    val constructor = requireExactlyOne("wrapper constructor $wrapperConstructor", context.classDefBy(helper.returnType).methods.filter {
        it.name == "<init>" && it.parameterTypes.map { type -> type.toString() } == wrapperConstructor.parameterTypes.map { type -> type.toString() }
    })
    val parameterStart = constructor.implementation!!.registerCount - constructor.parameterTypes.size
    val fields = constructor.parameterTypes.indices.map { parameter ->
        val field = requireExactlyOne("wrapper field for constructor argument $parameter", constructor.implementation!!.instructions.mapNotNull { instruction ->
            if (instruction.opcode !in setOf(Opcode.IPUT, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN)) return@mapNotNull null
            val assignment = instruction as TwoRegisterInstruction
            if (assignment.registerA != parameterStart + parameter || assignment.registerB != parameterStart - 1) return@mapNotNull null
            instruction.getReference<FieldReference>()
        })
        if (field.definingClass != helper.returnType || field.type != constructor.parameterTypes[parameter].toString() ||
            context.classDefBy(helper.returnType).fields.none { it.name == field.name && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        ) throw PatchException("Wrapper field is not a readable constructor value: $field")
        field
    }
    val emittedName = "pikoDownloadIcon"
    if (owner.methods.any { it.name == emittedName }) throw PatchException("Download icon helper already exists on ${owner.type}")
    val emittedTypes = listOf(helper.returnType, factory.parameterTypes[contextArgument].toString(), USER_SESSION_DESCRIPTOR, stateType)
    val body = MethodImplementationBuilder(192)
    body.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 188))
    val emitted = MutableMethod(ImmutableMethod(
        owner.type, emittedName, emittedTypes.map { ImmutableMethodParameter(it, emptySet(), null) }, helper.returnType,
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(), body.methodImplementation,
    ))
    // A separate typed helper owns its registers instead of borrowing live caller arguments.
    emitted.insertHook(0, excludedRegisters = listOf(188, 189, 190, 191), relocateBranchTargets = false) {
        val wrapper = scratchRegister()
        val temporary = scratchRegister()
        val flag = scratchRegister(RegisterLimit.BYTE)
        val node = scratchRegister(RegisterLimit.BYTE)
        val handler = scratchRegister(RegisterLimit.BYTE)
        val androidContext = scratchRegister(RegisterLimit.BYTE)
        val completed = scratchRegister(RegisterLimit.BYTE)
        move(wrapper, 188, helper.returnType)
        move(temporary, 189, factory.parameterTypes[contextArgument].toString())
        iget(temporary, temporary, androidContextField)
        move(androidContext, temporary, "Landroid/content/Context;")
        val handlerType = "Lapp/morphe/extension/instagram/patches/download/FeedDownloadClickFunction;"
        newInstance(handler, handlerType)
        invokeDirect(methodReference("$handlerType-><init>(Landroid/content/Context;$USER_SESSION_DESCRIPTOR$OBJECT_DESCRIPTOR)V"), handler, androidContext, 190, 191)
        sget(node, seed)
        constInt(flag, -1)
        invokeStatic(idSetter, node, flag)
        moveResult(node, nodeType)
        constString(flag, "Download")
        invokeStatic(descriptionSetter, node, flag)
        moveResult(node, nodeType)
        invokeStatic(onClickSetter, node, handler)
        moveResult(node, nodeType)
        invokeStatic(methodReference("$handlerType->longClick(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;"), handler)
        moveResult(flag, "Lkotlin/jvm/functions/Function1;")
        invokeStatic(longClickSetter, node, flag)
        moveResult(node, nodeType)
        val arguments = fields.mapIndexed { parameter, field ->
            val value = scratchRegister(RegisterLimit.BYTE)
            when (parameter) {
                1 -> move(value, node, nodeType)
                3 -> constInt(value, drawable.toInt())
                else -> {
                    iget(temporary, wrapper, field)
                    move(value, temporary, field.type)
                }
            }
            value
        }
        newInstance(completed, helper.returnType)
        invoke(Opcode.INVOKE_DIRECT, wrapperConstructor, listOf(completed) + arguments)
        returnObject(completed)
    }
    owner.methods.add(emitted)
    parent.insertHook(factoryIndex, excludedRegisters = factoryCall + helperCall + listRegister, relocateBranchTargets = false) {
        val flag = scratchRegister(RegisterLimit.BYTE)
        val wrapper = scratchRegister(RegisterLimit.BYTE)
        val completed = scratchRegister(RegisterLimit.BYTE)
        invokeStatic(methodReference("$DOWNLOAD_UTILS_DESCRIPTOR->isFeedDownloadButtonEnabled()Z"))
        moveResult(flag, "Z")
        ifEqz(flag, Target.Original)
        move(wrapper, originalWrapper, helper.returnType)
        invokeStatic(emitted, originalWrapper, factoryCall[contextArgument], sessionRegister, stateRegister)
        moveResult(completed, helper.returnType)
        move(originalWrapper, completed, helper.returnType)
        invokeStatic(factory, *factoryCall.toIntArray())
        moveResult(completed, factory.returnType)
        // Restore the save wrapper on both paths before returning to the untouched factory call.
        move(originalWrapper, wrapper, helper.returnType)
        ifEqz(completed, Target.Original)
        invoke(if (listAdd.opcode == Opcode.INVOKE_VIRTUAL_RANGE) Opcode.INVOKE_VIRTUAL else listAdd.opcode, listAdd.methodRef()!!, listOf(listRegister, completed))
    }
}
