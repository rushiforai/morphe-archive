package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun Instruction.isMoodConstant(register: Int, value: Int): Boolean =
    opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) &&
        this is OneRegisterInstruction && registerA == register &&
        this is NarrowLiteralInstruction && narrowLiteral == value

private fun hasMoodReturn(instructions: List<Instruction>, value: Int): Boolean =
    instructions.size >= 2 && instructions[0].isMoodConstant(0, value) &&
        instructions[1].opcode == Opcode.RETURN &&
        (instructions[1] as? OneRegisterInstruction)?.registerA == 0

private val catalogueNames = setOf("getDefaultMoodListNTV", "getCustomMoodListNTV",
    "getDefaultMoodListProtosNTV", "getCustomMoodListProtosNTV")
private fun catalogueName(ref: MethodReference) = ref.name.removePrefix("morphe_")

/** Keep the caller's registers (including an aliased sorting flag) unchanged. */
internal fun moodCatalogueBridge(native: Method): Method = ImmutableMethod(
    native.definingClass, "morphe_${native.name}",
    listOf(native.definingClass, "Z", "Z").map { ImmutableMethodParameter(it, emptySet(), null) },
    native.returnType, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
    emptySet(), emptySet(), ImmutableMethodImplementation(3, listOf(
        ImmutableInstruction11n(Opcode.CONST_4, 1, 1),
        ImmutableInstruction35c(if (AccessFlags.PRIVATE.isSet(native.accessFlags)) Opcode.INVOKE_DIRECT else Opcode.INVOKE_VIRTUAL,
            3, 0, 1, 2, 0, 0, native),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)
    ), emptyList(), emptyList())
)

private fun validCatalogueBridge(bridge: Method, native: Method): Boolean {
    val expected = moodCatalogueBridge(native)
    val code = bridge.code()
    val call = code.getOrNull(1) as? FiveRegisterInstruction
    return bridge == expected && bridge.accessFlags == expected.accessFlags &&
        bridge.implementation?.registerCount == 3 && code.size == 4 &&
        code.map { it.opcode } == expected.code().map { it.opcode } && code[0].isMoodConstant(1, 1) &&
        call?.arguments() == listOf(0, 1, 2) && (code[1] as? ReferenceInstruction)?.reference == native &&
        (code[2] as? OneRegisterInstruction)?.registerA == 0 && (code[3] as? OneRegisterInstruction)?.registerA == 0 &&
        bridge.implementation!!.tryBlocks.isEmpty()
}

internal fun moodCatalogueCalls(manager: ClassDef, loader: Method): List<Pair<Int, Method>> {
    val code = loader.code()
    val calls = code.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref == null || catalogueName(ref) !in catalogueNames) return@mapIndexedNotNull null
        fun invalid(): Nothing = throw PatchException("Unexpected mood catalogue invocation: $ref")
        if (ref.definingClass != manager.type) invalid()
        val native = manager.methods.singleOrNull { it.name == catalogueName(ref) && it.parameters("Z", "Z") }
            ?: invalid()
        if (!AccessFlags.NATIVE.isSet(native.accessFlags) || AccessFlags.STATIC.isSet(native.accessFlags) ||
            (if (native.name.contains("Protos")) native.returnType != "[B" else
                !native.returnType.startsWith("[L") || !native.returnType.endsWith(";"))) invalid()
        val bridged = ref.name.startsWith("morphe_")
        val expectedOpcode = if (bridged) Opcode.INVOKE_STATIC else if (AccessFlags.PRIVATE.isSet(native.accessFlags))
            Opcode.INVOKE_DIRECT else Opcode.INVOKE_VIRTUAL
        val rangeOpcode = when (expectedOpcode) {
            Opcode.INVOKE_STATIC -> Opcode.INVOKE_STATIC_RANGE
            Opcode.INVOKE_DIRECT -> Opcode.INVOKE_DIRECT_RANGE
            else -> Opcode.INVOKE_VIRTUAL_RANGE
        }
        if (instruction.opcode !in setOf(expectedOpcode, rangeOpcode) || instruction.arguments().size != 3 ||
            instruction.arguments().any { it !in 0 until loader.implementation!!.registerCount } ||
            code.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) invalid()
        if (bridged) {
            val bridge = manager.methods.singleOrNull { it == ref } ?: invalid()
            if (!validCatalogueBridge(bridge, native)) invalid()
        } else if (ref != native) invalid()
        index to native
    }
    if (calls.size != 2 || calls.map { it.second.name }.toSet() !in setOf(
            setOf("getDefaultMoodListNTV", "getCustomMoodListNTV"),
            setOf("getDefaultMoodListProtosNTV", "getCustomMoodListProtosNTV")) ||
        calls.map { it.second.returnType }.distinct().size != 1)
        throw PatchException("Expected one matching pair of mood catalogue filters")
    return calls
}

/** The protobuf loader lives in a superclass; never search unrelated classes. */
internal fun moodCatalogueLoader(manager: ClassDef, classes: Iterable<ClassDef>): Method {
    val types = classes.associateBy { it.type }
    val hierarchy = mutableListOf<ClassDef>()
    var current: ClassDef? = manager
    while (current != null) {
        if (hierarchy.any { it.type == current!!.type }) throw PatchException("Cyclic mood manager hierarchy")
        hierarchy.add(current)
        current = types[current.superclass]
    }
    val loader = hierarchy.flatMap { it.methods.toList() }.filter { method ->
        method.parameters() && method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.calls().any { catalogueName(it) in catalogueNames }
    }.singleOrNull() ?: throw PatchException("Expected Waze mood catalogue loader")
    moodCatalogueCalls(manager, loader)
    return loader
}

internal fun patchMoodCatalogue(manager: MutableClass, refresh: MutableMethod) {
    val calls = moodCatalogueCalls(manager, refresh)
    // Validate collisions before mutating either the loader or the manager.
    val bridges = calls.map { (_, native) ->
        val expected = moodCatalogueBridge(native)
        val existing = manager.methods.filter { it.name == expected.name }
        if (existing.isNotEmpty() && (existing.size != 1 || !validCatalogueBridge(existing.single(), native)))
            throw PatchException("Conflicting mood catalogue bridge: ${expected.name}")
        expected
    }
    calls.zip(bridges).forEach { (call, bridge) ->
        if (manager.methods.none { it == bridge }) manager.methods.add(MutableMethod(bridge))
        val (index, _) = call
        val instruction = refresh.code()[index]
        val args = instruction.arguments()
        val replacement = when (instruction) {
            is FiveRegisterInstruction -> BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, args[0], args[1], args[2], 0, 0, bridge)
            is RegisterRangeInstruction -> BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instruction.startRegister, 3, bridge)
            else -> throw PatchException("Unknown mood invocation encoding")
        }
        refresh.replaceInstruction(index, replacement)
    }
}

internal fun babyMoodGate(eligibility: Method, methods: Iterable<Method>): MethodReference {
    val calls = eligibility.calls().filter {
        it.definingClass == eligibility.definingClass && it.returnType == "Z" && it.parameterTypes.isEmpty()
    }.distinct()
    if (calls.isNotEmpty()) return calls.singleOrNull()
        ?: throw PatchException("Expected one baby-mood eligibility call")

    // Newer optimizers inline the baby getter into eligibility. Require the
    // observed baby-only branch and an exact accessor of the same instance field.
    val original = eligibility.code()
    val code = if (hasMoodReturn(original, 1)) original.drop(2) else original
    fun invalid(): Nothing = throw PatchException("Expected verified inlined baby-mood eligibility gate")
    if (AccessFlags.STATIC.isSet(eligibility.accessFlags) || code.size < 11) invalid()
    val load = code[0] as? TwoRegisterInstruction ?: invalid()
    val field = (code[0] as? ReferenceInstruction)?.reference as? FieldReference ?: invalid()
    val branch = code[1] as? OffsetInstruction ?: invalid()
    if (code[0].opcode != Opcode.IGET_BOOLEAN || field.type != "Z" || field.definingClass != eligibility.definingClass ||
        load.registerB != eligibility.implementation!!.registerCount - 3 || code[1].opcode != Opcode.IF_EQZ ||
        (code[1] as? OneRegisterInstruction)?.registerA != load.registerA) invalid()
    val body = code.subList(2, 10)
    if (body.map { it.opcode } != listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.CONST,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.GOTO) ||
        branch.codeOffset != code.subList(1, 10).sumOf { it.codeUnits }) invalid()
    val references = body.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    if (references.map { it.toString() } != listOf(
            "Landroid/content/Context;->getResources()Landroid/content/res/Resources;",
            "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;",
            "Ljava/lang/String;->equals(Ljava/lang/Object;)Z")) invalid()
    val resources = code[2] as FiveRegisterInstruction
    val text = code[5] as FiveRegisterInstruction
    val equals = code[7] as FiveRegisterInstruction
    val count = eligibility.implementation!!.registerCount
    if (resources.registerCount != 1 || resources.registerC != count - 2 ||
        text.registerCount != 2 || text.registerC != (code[3] as OneRegisterInstruction).registerA ||
        text.registerD != (code[4] as OneRegisterInstruction).registerA || equals.registerCount != 2 ||
        equals.registerC != count - 1 || equals.registerD != (code[6] as OneRegisterInstruction).registerA) invalid()
    val returnOffset = code.take(9).sumOf { it.codeUnits } + (code[9] as OffsetInstruction).codeOffset
    var offset = 0
    val returned = code.firstOrNull { instruction -> (offset == returnOffset).also { offset += instruction.codeUnits } }
    if (returned?.opcode != Opcode.RETURN || (returned as? OneRegisterInstruction)?.registerA !=
        (code[8] as OneRegisterInstruction).registerA) invalid()
    return methods.filter { method ->
        if (method.definingClass != eligibility.definingClass || method.returnType != "Z" ||
            method.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(method.accessFlags)) return@filter false
        val instructions = method.code().let { if (hasMoodReturn(it, 0)) it.drop(2) else it }
        val read = instructions.firstOrNull() as? TwoRegisterInstruction
        instructions.size == 2 && instructions[0].opcode == Opcode.IGET_BOOLEAN &&
            (instructions[0] as? ReferenceInstruction)?.reference == field &&
            read != null && read.registerB == method.implementation!!.registerCount - 1 && instructions[1].opcode == Opcode.RETURN &&
            (instructions[1] as? OneRegisterInstruction)?.registerA == read.registerA
    }.singleOrNull() ?: throw PatchException("Expected one accessor of the inlined baby-mood field")
}

@Suppress("unused")
val driverIconsPatch = bytecodePatch(
    name = "Unlock driver moods",
    description = "Unlock the mood picker, including Robot, 8-bit, Dino and beta moods, and expose special/hidden moods present in the local catalogue. Does not grant editor permissions or download unavailable campaigns.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(refreshWazeSkins)
    execute {
        val canSet = findMethod("mood eligibility") {
            it.returnType == "Z" && it.parameters("Landroid/content/Context;", "Ljava/lang/String;") &&
                it.strings().containsAll(listOf("wazer_dino", "wazer_8bit", "wazer_robot"))
        }
        val manager = mutableClassDefBy(canSet.definingClass)
        val babyRef = babyMoodGate(canSet, manager.methods)
        val baby = manager.methods.singleOrNull { it == babyRef }
            ?: throw PatchException("Expected Waze baby-mood gate")
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val loader = moodCatalogueLoader(manager, classes)
        val refresh = mutableClassDefBy(loader.definingClass).methods.single { it == loader }

        moodScreen()
        val create = moodGate()
        val (betaResult, betaRegister) = booleanConfigResult(create, "CONFIG_VALUE_MOODS_BETA_ENABLED")

        // All fingerprints validated before changing code. Only cosmetic gates are changed.
        if (!hasMoodReturn(canSet.implementation!!.instructions.toList(), 1))
            canSet.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        if (!hasMoodReturn(baby.implementation!!.instructions.toList(), 0))
            baby.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        create.replaceInstruction(betaResult, "const/16 v$betaRegister, 0x1")
        // Native first parameter includes special/hidden entries; preserve the sorting parameter.
        patchMoodCatalogue(manager, refresh)
    }
}
