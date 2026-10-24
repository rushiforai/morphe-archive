package app.morphe.patches.maps

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val WAYPOINT_LIST = "Lcom/google/common/collect/ImmutableList;"
private const val WAYPOINT_TEXT = "Landroid/text/Spanned;"
private fun Instruction.destinationCall() = getReference<MethodReference>()
private fun Instruction.destinationField() = getReference<FieldReference>()
private fun Method.destinationCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing native ETA destination implementation: $this")
private fun destinationGuard(ok: Boolean, reason: String, subject: Any) {
    if (!ok) throw PatchException("Unrecognized native ETA destination: $reason in $subject")
}
private fun List<Instruction>.destinationTarget(index: Int): Int {
    val address = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var cursor = 0
    return indices.singleOrNull { val found = cursor == address; cursor += get(it).codeUnits; found }
        ?: throw PatchException("Invalid native ETA destination branch target")
}
private fun Instruction.destinationRegisters(): List<Int>? = when (this) {
    is FiveRegisterInstruction, is RegisterRangeInstruction -> invokeRegisters()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> null
}
private fun Instruction.destinationWrites(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || (opcode.setsWideRegister() && target + 1 == register))
}
private fun List<Instruction>.destinationShape(start: Int, vararg opcodes: Opcode) =
    start >= 0 && size >= start + opcodes.size && subList(start, start + opcodes.size).map { it.opcode } == opcodes.toList()

/** Read-only proof that the existing mobile ETA refers to waypoint1 / canonical leg0. */
internal fun BytecodePatchContext.verifyNativeGuidanceDestination(shared: Method, snapshotType: String): Int {
    fun member(ref: MethodReference): Method = classDefBy(ref.definingClass).methods.singleOrNull {
        it.name == ref.name && it.parameterTypes == ref.parameterTypes && it.returnType == ref.returnType
    } ?: throw PatchException("Missing unique native ETA destination member: $ref")
    fun only(methods: List<Method>, purpose: String) = methods.singleOrNull()
        ?: throw PatchException("Expected unique native ETA destination $purpose, found ${methods.size}")
    fun sameField(first: Instruction, second: Instruction) = first.destinationField()?.toString() ==
        second.destinationField()?.toString() && first.destinationField() != null
    fun regs(code: List<Instruction>, index: Int, vararg values: Int) =
        code[index].destinationRegisters() == values.toList()
    fun literal(code: List<Instruction>, index: Int, register: Int, value: Int) =
        code[index].opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) &&
            regs(code, index, register) && (code[index] as NarrowLiteralInstruction).narrowLiteral == value

    val sc = shared.destinationCode()
    destinationGuard(shared.implementation!!.registerCount == 20 &&
        sc[2].getReference<StringReference>()?.string == "SharedGuidedNavViewModelImpl.onNavigationUiStateChanged" &&
        sc[5].opcode == Opcode.IGET_OBJECT && regs(sc, 5, 3, 1) &&
        sc[24].opcode == Opcode.INVOKE_VIRTUAL && regs(sc, 24, 7, 3, 4),
        "inspected shared current-state row producer", shared)
    val navigationType = sc[5].destinationField()!!.type
    val producer = member(sc[24].destinationCall()!!)
    destinationGuard(producer.parameterTypes == listOf(navigationType, "Z") && producer.returnType == "V" &&
        sc[23].destinationField()?.type == producer.definingClass && regs(sc, 23, 7, 6),
        "shared row producer receives its original current navigation", producer)

    // The loop's only exit to this block follows const v14,1. No other incoming
    // edge or write can replace that index before either original list.get.
    val rowStart = sc.indices.singleOrNull { at -> sc.destinationShape(at,
        Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.IF_LT,
        Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST,
        Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.GOTO, Opcode.MOVE_OBJECT,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_LT, Opcode.IGET_OBJECT,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE,
        Opcode.MOVE_RESULT_OBJECT, Opcode.GOTO, Opcode.MOVE_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT) &&
        sc[at + 7].destinationCall()?.toString() == "$WAYPOINT_LIST->get(I)Ljava/lang/Object;" &&
        sc[at + 22].destinationCall()?.toString() == "$WAYPOINT_LIST->get(I)Ljava/lang/Object;" }
        ?: throw PatchException("Missing unique native duration/distance waypoint row selection")
    val rowEntry = sc.destinationTarget(75)
    val row = sc.drop(rowStart)
    destinationGuard(literal(sc, 74, 14, 1) && sc[75].opcode == Opcode.IF_EQZ &&
        rowEntry < rowStart && rowStart - rowEntry == 2 &&
        sc.indices.filter { sc[it] is OffsetInstruction && sc.destinationTarget(it) == rowEntry } == listOf(75) &&
        sc[rowEntry - 1].opcode == Opcode.GOTO && sc.destinationTarget(rowEntry - 1) == 72 &&
        sc.subList(rowEntry, rowStart + 31).none { it.destinationWrites(14) } &&
        row.destinationShape(0, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.IF_LT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
            Opcode.GOTO, Opcode.MOVE_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
            Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
            Opcode.IF_LT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.GOTO,
            Opcode.MOVE_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT) &&
        listOf(1, 6, 17, 21).all { sameField(row[1], row[it]) &&
            (row[it] as TwoRegisterInstruction).registerB == 7 } &&
        regs(row, 7, 5, 14) && regs(row, 22, 8, 14) &&
        row[10].destinationCall()?.returnType == WAYPOINT_TEXT && regs(row, 10, 5) &&
        row[25].destinationCall()?.returnType == WAYPOINT_TEXT && regs(row, 25, 8) &&
        sc.destinationTarget(rowStart + 5) == rowStart + 13 && sc.destinationTarget(rowStart + 12) == rowStart + 14 &&
        sc.destinationTarget(rowStart + 20) == rowStart + 28 && sc.destinationTarget(rowStart + 27) == rowStart + 29 &&
        sc.indices.filter { sc[it] is OffsetInstruction && sc.destinationTarget(it) in rowStart until rowStart + 31 } ==
            listOf(5, 12, 20, 27).map { rowStart + it },
        "duration and distance both select the native waypoint-one row", shared)
    val rowList = row[1].destinationField()!!
    val durationGetter = row[10].destinationCall()!!
    val distanceGetter = row[25].destinationCall()!!
    destinationGuard(rowList.definingClass == producer.definingClass && rowList.type == WAYPOINT_LIST &&
        durationGetter.definingClass == distanceGetter.definingClass &&
        durationGetter.parameterTypes.isEmpty() && distanceGetter.parameterTypes.isEmpty(),
        "same typed row API supplies duration and distance", producer)

    val pc = producer.destinationCode()
    destinationGuard(producer.implementation!!.registerCount == 27 &&
        producer.implementation!!.tryBlocks.isEmpty() && pc.none { it is PayloadInstruction } &&
        pc[1].destinationCall()?.toString() == sc[41].destinationCall()?.toString() &&
        pc[1].invokeRegisters() == listOf(25) && regs(pc, 2, 7) &&
        sameField(pc[97], sc[43]) && regs(pc, 97, 4, 7) &&
        pc[126].destinationField()?.type == snapshotType &&
        pc[126].destinationField()?.definingClass == sc[43].destinationField()?.type &&
        regs(pc, 126, 14, 2), "same selected holder, route and canonical snapshot", producer)
    val routeType = sc[43].destinationField()!!.type
    val canonical = pc[126].destinationField()!!
    val waypointGetter = pc[10].destinationCall()!!
    destinationGuard(waypointGetter.definingClass == routeType && waypointGetter.parameterTypes.isEmpty() &&
        waypointGetter.returnType == WAYPOINT_LIST && regs(pc, 10, 2) &&
        pc[58].destinationCall()?.toString() == waypointGetter.toString() && regs(pc, 58, 2) &&
        pc[5].destinationCall()?.returnType == routeType && regs(pc, 5, 1) && regs(pc, 6, 2),
        "ordered native row list uses the selected route's waypoints", producer)
    val wc = member(waypointGetter).destinationCode()
    destinationGuard(wc.size == 5 && wc.destinationShape(0, Opcode.IGET_OBJECT, Opcode.IF_NEZ,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        wc[0].destinationField()?.definingClass == routeType &&
        wc[0].destinationField()?.type == WAYPOINT_LIST && regs(wc, 0, 0, 0) &&
        wc.destinationTarget(1) == 4 &&
        wc[2].destinationCall()?.toString() == "$WAYPOINT_LIST->of()$WAYPOINT_LIST" && regs(wc, 4, 0),
        "waypoint getter returns only its existing ordered list", waypointGetter)
    val waypointField = wc[0].destinationField()!!

    // A row at waypoint i takes cumulative duration i-1. At i=1 the direct
    // first entry is used; the later-row subtraction branch cannot execute.
    destinationGuard(pc.destinationShape(54, Opcode.MOVE, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
        Opcode.IF_GE, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.NEW_INSTANCE, Opcode.CONST_STRING,
        Opcode.INVOKE_DIRECT, Opcode.CONST_4, Opcode.IF_LEZ, Opcode.ADD_INT_LIT8, Opcode.ARRAY_LENGTH,
        Opcode.IF_GE, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.IF_LE, Opcode.AGET, Opcode.ADD_INT_LIT8,
        Opcode.AGET, Opcode.SUB_INT_2ADDR, Opcode.GOTO, Opcode.AGET, Opcode.IGET_OBJECT,
        Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_OBJECT_FROM16,
        Opcode.MOVE_OBJECT_FROM16, Opcode.INT_TO_LONG, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
        Opcode.CONST_WIDE_16, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT) &&
        literal(pc, 14, 10, 0) && regs(pc, 54, 1, 10) && regs(pc, 60, 3, 1) &&
        pc[60].destinationCall()?.toString() == "$WAYPOINT_LIST->get(I)Ljava/lang/Object;" &&
        regs(pc, 68, 6, 1) && (pc[68] as NarrowLiteralInstruction).narrowLiteral == -1 &&
        literal(pc, 72, 5, 1) && regs(pc, 73, 1, 5) && pc.destinationTarget(73) == 79 &&
        regs(pc, 79, 14, 12, 6) && pc.destinationTarget(78) == 80 &&
        regs(pc, 86, 3, 14) && pc[87].destinationCall()?.toString() ==
            "Lj$/time/Duration;->ofSeconds(J)Lj$/time/Duration;" &&
        pc[95].destinationCall()?.parameterTypes == listOf("Landroid/content/res/Resources;",
            "Lj$/time/Duration;", "I", pc[81].destinationField()!!.type) &&
        pc[95].destinationCall()?.returnType == WAYPOINT_TEXT && regs(pc, 95, 5, 3, 4, 10) &&
        regs(pc, 98, 4, 6) && pc[98].destinationCall()?.definingClass == routeType &&
        regs(pc, 115, 19, 5) && regs(pc, 169, 5, 18) && regs(pc, 170, 4, 19) &&
        regs(pc, 197, 1, 1) && (pc[197] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        literal(pc, 198, 10, 0) && pc.destinationTarget(199) == 55 && pc.destinationTarget(57) == 200,
        "native waypoint-one ETA consumes the first ordered leg duration", producer)
    destinationGuard(pc[30].destinationCall()?.definingClass == routeType &&
        pc[30].destinationCall()?.parameterTypes == listOf("D") &&
        pc[30].destinationCall()?.returnType == "Ljava/util/List;" && regs(pc, 30, 2, 3, 4) &&
        pc[39].destinationCall()?.toString() == "Lj$/util/stream/IntStream;->toArray()[I" &&
        regs(pc, 40, 12) && regs(pc, 106, 14, 5, 3) && regs(pc, 109, 14, 5) &&
        pc[109].destinationCall()?.returnType == "Landroid/text/SpannableStringBuilder;" &&
        regs(pc, 110, 5), "first cumulative duration reaches original styled text", producer)

    val rowFactory = member(pc[182].destinationCall()!!)
    destinationGuard(rowFactory.definingClass == producer.definingClass &&
        rowFactory.parameterTypes.size == 6 && rowFactory.parameterTypes[0] == "I" &&
        rowFactory.parameterTypes[1] == routeType && rowFactory.parameterTypes[3] == WAYPOINT_TEXT &&
        rowFactory.parameterTypes[4] == "I" && rowFactory.parameterTypes[5] == WAYPOINT_TEXT &&
        rowFactory.returnType == durationGetter.definingClass && pc[182].invokeRegisters() == (0..6).toList() &&
        regs(pc, 180, 3, 16) && regs(pc, 181, 2, 20) &&
        pc[188].destinationCall()?.toString() == "$WAYPOINT_LIST->get(I)Ljava/lang/Object;" &&
        regs(pc, 188, 3, 1) && pc[187].destinationField()?.toString() == rowList.toString() &&
        pc[191].destinationCall()?.definingClass == durationGetter.definingClass &&
        pc[191].destinationCall()?.parameterTypes == listOf(WAYPOINT_TEXT) && regs(pc, 191, 3, 4),
        "created and updated rows receive the same original duration and index", rowFactory)
    val fc = rowFactory.destinationCode()
    val rowInit = fc.indices.singleOrNull { fc[it].destinationCall()?.let { call ->
        call.name == "<init>" && call.parameterTypes == listOf(WAYPOINT_TEXT, WAYPOINT_TEXT)
    } == true } ?: throw PatchException("Missing unique compact native duration/distance row constructor")
    val factoryReceiver = rowFactory.implementation!!.registerCount - rowFactory.parameterTypes.size - 1
    destinationGuard(factoryReceiver == 0 && fc[rowInit].opcode == Opcode.INVOKE_DIRECT &&
        fc[rowInit].invokeRegisters() == listOf(0, 4, 6) &&
        fc.take(rowInit).none { it.destinationWrites(4) || it.destinationWrites(6) } &&
        fc.last().opcode == Opcode.RETURN_OBJECT && regs(fc, fc.lastIndex, 0) &&
        rowInit == fc.lastIndex - 1,
        "original row factory preserves duration argument into its constructor", rowFactory)
    val rowConstructor = member(fc[rowInit].destinationCall()!!)
    val rc = rowConstructor.destinationCode()
    destinationGuard(rowConstructor.parameterTypes == listOf(WAYPOINT_TEXT, WAYPOINT_TEXT) &&
        rc.map { it.opcode } == listOf(Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID) &&
        rowConstructor.implementation!!.registerCount == 3 &&
        regs(rc, 1, 1, 0) && regs(rc, 2, 2, 0),
        "original row constructor keeps native duration and distance fields", rowConstructor)
    val rowType = rowConstructor.definingClass
    fun rowGetter(ref: MethodReference, stored: Instruction): Method {
        val getter = only(classDefBy(rowType).methods.filter { it.name == ref.name &&
            it.parameterTypes.isEmpty() && it.returnType == WAYPOINT_TEXT }, "row getter $ref")
        val code = getter.destinationCode()
        destinationGuard(code.destinationShape(0, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT) && code.size == 2 &&
            sameField(code[0], stored) && regs(code, 0, 0, 0) && regs(code, 1, 0), "pure original row getter", getter)
        return getter
    }
    rowGetter(durationGetter, rc[1]); rowGetter(distanceGetter, rc[2])
    val setterRef = pc[191].destinationCall()!!
    val setter = only(classDefBy(rowType).methods.filter { it.name == setterRef.name &&
        it.parameterTypes == listOf(WAYPOINT_TEXT) && it.returnType == "V" }, "row duration setter")
    val setterCode = setter.destinationCode()
    destinationGuard(setterCode.destinationShape(0, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID) && setterCode.size == 2 &&
        sameField(setterCode[0], rc[1]) && regs(setterCode, 0, 1, 0), "existing row updates the duration field", setter)

    // The selected route constructor ties waypoint order to the exact same
    // canonical CPUJ used by the untouched Google battery converter.
    val routeConstructor = only(classDefBy(routeType).methods.filter { it.name == "<init>" &&
        it.parameterTypes.size == 1 && it.destinationCode().any { ins -> ins.destinationField()?.toString() == canonical.toString() } },
        "selected route constructor")
    val cc = routeConstructor.destinationCode()
    val waypointStore = cc.indices.singleOrNull { cc[it].opcode == Opcode.IPUT_OBJECT &&
        cc[it].destinationField()?.toString() == waypointField.toString() }
        ?: throw PatchException("Missing unique ordered waypoint-list store")
    val countAt = cc.indices.singleOrNull { at -> cc.destinationShape(at, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
        Opcode.ADD_INT_LIT8, Opcode.IF_NE, Opcode.CONST_4, Opcode.GOTO, Opcode.MOVE,
        Opcode.INVOKE_STATIC, Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.ARRAY_LENGTH, Opcode.MOVE) &&
        cc[at].destinationCall()?.definingClass == snapshotType &&
        cc[at + 3].destinationCall()?.toString() == "$WAYPOINT_LIST->size()I" }
        ?: throw PatchException("Missing unique canonical-leg/waypoint cardinality proof")
    val count = cc.drop(countAt)
    destinationGuard(routeConstructor.implementation!!.registerCount == 20 &&
        routeConstructor.implementation!!.tryBlocks.isEmpty() &&
        cc[18].destinationField()?.type == snapshotType && regs(cc, 18, 3, 6) &&
        cc[19].destinationField()?.toString() == canonical.toString() && regs(cc, 19, 3, 0) &&
        cc[waypointStore - 2].destinationField()?.type == WAYPOINT_LIST && regs(cc, waypointStore - 2, 4, 6) &&
        regs(cc, waypointStore, 4, 0) &&
        count.destinationShape(0, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IGET_OBJECT,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.ADD_INT_LIT8, Opcode.IF_NE,
            Opcode.CONST_4, Opcode.GOTO, Opcode.MOVE, Opcode.INVOKE_STATIC, Opcode.IGET_OBJECT,
            Opcode.CHECK_CAST, Opcode.ARRAY_LENGTH, Opcode.MOVE) &&
        count[0].destinationCall()?.parameterTypes?.isEmpty() == true && count[0].destinationCall()?.returnType == "I" &&
        regs(count, 0, 3) && regs(count, 1, 5) && count[2].destinationField()?.toString() == waypointField.toString() && regs(count, 2, 10, 0) &&
        regs(count, 3, 10) && regs(count, 4, 10) && regs(count, 5, 10, 10) && (count[5] as NarrowLiteralInstruction).narrowLiteral == -1 &&
        regs(count, 6, 5, 10) && cc.destinationTarget(countAt + 6) == countAt + 9 && literal(count, 7, 5, 1) &&
        cc.destinationTarget(countAt + 8) == countAt + 10 && regs(count, 9, 5, 7) && regs(count, 10, 5) &&
        count[10].destinationCall()?.parameterTypes == listOf("Z") && count[10].destinationCall()?.returnType == "V" &&
        count[11].destinationField()?.definingClass == snapshotType && regs(count, 11, 3, 3) &&
        count[12].getReference<TypeReference>()?.type?.startsWith("[L") == true &&
        regs(count, 13, 5, 3) && regs(count, 14, 10, 7) && regs(count, 16, 11, 3, 10) &&
        regs(count, 33, 10, 10) && (count[33] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        cc.destinationTarget(countAt + 34) == countAt + 15,
        "canonical legs and native waypoint order have exactly a one-element offset", routeConstructor)
    val canonicalCount = member(count[0].destinationCall()!!).destinationCode()
    destinationGuard(canonicalCount.destinationShape(0, Opcode.IGET_OBJECT, Opcode.CHECK_CAST,
        Opcode.ARRAY_LENGTH, Opcode.RETURN) && canonicalCount.size == 4 &&
        sameField(canonicalCount[0], count[11]) && regs(canonicalCount, 0, 0, 0) &&
        regs(canonicalCount, 2, 0, 0) && regs(canonicalCount, 3, 0), "canonical leg count is the same ordered array", snapshotType)
    return 0
}
