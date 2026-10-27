package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val COMMUNITY_INBOX = "community_inbox"
internal const val JOINED_COMMUNITY_ROW = "$HOST_SCREENS->isJoinedCommunityRow(Ljava/lang/Object;)Z"
internal const val MAIN_INBOX_SCOPE = "$HOST_SCREENS->isMainInboxScope(Ljava/lang/Object;Ljava/lang/Object;)Z"
internal const val COMMUNITY_LIST_COPY = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"
private const val SUMMARY = "Lcom/facebook/messaging/model/threads/ThreadSummary;"
private const val THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"

internal data class CommunityInboxContract(
    val render: Method,
    val capturedScope: String,
    val rowSummary: String,
    val joined: String,
    val requests: String,
    val identity: String,
    val capturedPrefix: String,
    val folderPath: List<String>,
    val folderGetter: String,
    val inbox: String,
)

private fun Method.communityCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.communityRef() = (this as? ReferenceInstruction)?.reference
private fun Instruction.communityArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun Instruction.communityWrites(register: Int) = opcode.setsRegister() &&
    this is OneRegisterInstruction && (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))
private fun Instruction.communityReads(register: Int): Boolean {
    val name = opcode.toString()
    fun source(value: Int) = value == register || (("WIDE" in name || "LONG" in name || "DOUBLE" in name) && value + 1 == register)
    return when (this) {
        is FiveRegisterInstruction, is RegisterRangeInstruction -> communityArgs().any(::source)
        is ThreeRegisterInstruction -> source(registerB) || source(registerC) || (!opcode.setsRegister() && source(registerA))
        is TwoRegisterInstruction -> source(registerB) || ((!opcode.setsRegister() || "2ADDR" in name) && source(registerA))
        is OneRegisterInstruction -> (!opcode.setsRegister() || opcode == Opcode.CHECK_CAST) && source(registerA)
        else -> false
    }
}
private fun Method.communityString(value: String) = communityCode().any { (it.communityRef() as? StringReference)?.string == value }
private fun ClassDef.communityOriginal() = fields.singleOrNull { it.name == "__redex_internal_original_name" }
    ?.initialValue.let { (it as? StringEncodedValue)?.value }
private class CommunityChanged : RuntimeException()
private fun communityRequire(ok: Boolean) { if (!ok) throw CommunityChanged() }
private fun Instruction.communityRegister() = (this as? OneRegisterInstruction)?.registerA
private fun Instruction.communityLiteral(register: Int, value: Int) = opcode == Opcode.CONST_4 &&
    communityRegister() == register && (this as? NarrowLiteralInstruction)?.narrowLiteral == value
private fun <T> List<T>.communitySingle(): T { communityRequire(size == 1); return single() }
private fun communityEnums(cls: ClassDef): Map<String, FieldReference> {
    val result = linkedMapOf<String, FieldReference>()
    var label: String? = null
    for (i in cls.methods.filter { it.name == "<clinit>" }.communitySingle().communityCode()) {
        (i.communityRef() as? StringReference)?.let { label = it.string }
        if (i.opcode == Opcode.SPUT_OBJECT) (i.communityRef() as? FieldReference)?.let {
            if (it.type == cls.type && label != null) { result[label] = it; label = null }
        }
    }
    return result
}

/** A Main-only closure, the current native folder/filter, and the stock subscribed-channel predicate. */
internal fun findCommunityInbox(classes: Iterable<ClassDef>): CommunityInboxContract? {
    val all = classes.toList()
    val main = all.singleOrNull { it.communityOriginal() == "InboxFragment" } ?: return null
    val byType = all.associateBy { it.type }
    fun publicStatic(field: FieldReference) {
        val cls = byType[field.definingClass] ?: throw CommunityChanged()
        val native = cls.fields.filter { it.name == field.name && it.type == field.type }.communitySingle()
        communityRequire(AccessFlags.PUBLIC.isSet(cls.accessFlags) && AccessFlags.PUBLIC.isSet(native.accessFlags) && AccessFlags.STATIC.isSet(native.accessFlags))
    }
    fun definition(ref: MethodReference): Method = byType[ref.definingClass]?.methods?.filter { it.hookId() == ref.toString() }
        ?.communitySingle() ?: throw CommunityChanged()
    fun calls(m: Method) = m.communityCode().mapNotNull { it.communityRef() as? MethodReference }
    try {
        val immutable = byType[IMMUTABLE_LIST] ?: throw CommunityChanged()
        val copy = immutable.methods.filter { it.hookId() == COMMUNITY_LIST_COPY }.communitySingle()
        communityRequire(AccessFlags.PUBLIC.isSet(immutable.accessFlags) && AccessFlags.PUBLIC.isSet(copy.accessFlags) && AccessFlags.STATIC.isSet(copy.accessFlags))
        val update = main.methods.filter { it.communityString("InboxFragment_updateSectionTree") }.communitySingle()
        val u = update.communityCode()
        communityRequire(update.returnType == "V" && update.parameterTypes.size == 4 && update.parameterTypes.first().toString() == main.type)
        val ctor = definition(calls(update).filter { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString).contains(IMMUTABLE_LIST) }.communitySingle())
        val ctorId = ctor.hookId()
        val closure = byType[ctor.definingClass] ?: throw CommunityChanged()
        val c = ctor.communityCode()
        // The closure takes an $onThreadInViewport Function1 before the trailing flag, which then needs a move/from16 to be stored.
        val params = ctor.parameterTypes.map(CharSequence::toString)
        communityRequire(params.size == 15 && params[11] == IMMUTABLE_LIST && params[13] == "Lkotlin/jvm/functions/Function1;" && params[14] == "Z" &&
            c.size == 19 && ctor.implementation!!.registerCount == 17 && ctor.implementation!!.tryBlocks.isEmpty())
        val captured = c[0].communityRef() as? FieldReference ?: throw CommunityChanged()
        // The session capture comes first, in slot 2, so the scope capture is in slot 5.
        communityRequire(c[2].opcode == Opcode.IPUT_OBJECT && (c[2].communityRef() as? FieldReference)?.let { it.name == "\$fbUserSession" && it.type == FB_USER_SESSION } == true &&
            (c[2] as? TwoRegisterInstruction)?.let { it.registerA == 2 && it.registerB == 1 } == true)
        val scopeAt = 5
        val scope = c[scopeAt].communityRef() as? FieldReference ?: throw CommunityChanged()
        communityRequire(c[0].opcode == Opcode.IPUT_OBJECT && (c[0] as? TwoRegisterInstruction)?.let { it.registerA == 13 && it.registerB == 1 } == true &&
            captured.name == "\$inboxUnitItems" && captured.type == IMMUTABLE_LIST && c[scopeAt].opcode == Opcode.IPUT_OBJECT &&
            (c[scopeAt] as? TwoRegisterInstruction)?.let { it.registerA == 10 && it.registerB == 1 } == true && scope.name == "\$threadTypeFilter")
        val ctorCall = u.indices.filter { u[it].communityRef().toString() == ctorId }.communitySingle()
        val ctorArgs = u[ctorCall].communityArgs()
        communityRequire(ctorArgs.size == params.size + 1)
        fun previousWrite(register: Int) = (ctorCall - 1 downTo 0).firstOrNull { u[it].communityWrites(register) } ?: throw CommunityChanged()
        val listWrite = previousWrite(ctorArgs[12])
        val alias = u[listWrite] as? TwoRegisterInstruction ?: throw CommunityChanged()
        val source = u.getOrNull(listWrite - 1) as? TwoRegisterInstruction ?: throw CommunityChanged()
        val modelRows = u[listWrite - 1].communityRef() as? FieldReference ?: throw CommunityChanged()
        communityRequire(u[listWrite].opcode == Opcode.MOVE_OBJECT_FROM16 && u[listWrite - 1].opcode == Opcode.IGET_OBJECT &&
            source.registerA == alias.registerB && modelRows.definingClass == update.parameterTypes[1].toString() && modelRows.type == IMMUTABLE_LIST)
        val scopeWrite = previousWrite(ctorArgs[9])
        communityRequire(u[scopeWrite].opcode == Opcode.MOVE_RESULT_OBJECT)
        val scopeGetter = definition(u[scopeWrite - 1].communityRef() as? MethodReference ?: throw CommunityChanged())
        communityRequire(scopeGetter.returnType == scope.type && scopeGetter.communityCode().size == 13)
        val configScopeGetter = definition(calls(scopeGetter).filter { it.returnType == scope.type }.communitySingle())
        val config = byType[configScopeGetter.definingClass] ?: throw CommunityChanged()
        val folderGetter = config.methods.filter { it.communityString("folderName") }.communitySingle()
        val folders = communityEnums(byType[folderGetter.returnType] ?: throw CommunityChanged())
        communityRequire(folderGetter.communityCode().any { it.opcode == Opcode.SGET_OBJECT && it.communityRef().toString() == folders["INBOX"].toString() })
        val switch = main.methods.filter { it.communityString("folderName") }.communitySingle()
        val s = switch.communityCode()
        val requests = communityEnums(byType[scope.type] ?: throw CommunityChanged())["MESSAGE_REQUESTS"] ?: throw CommunityChanged()
        // Some 584.1 arm64 builds drop a flag store and move the config's apply into a static helper: 38 instructions, not 42.
        // Either way the switch's own scope parameter and the chosen folder are the two values stored into the new config.
        fun stores(type: String) = s.indices.filter { s[it].opcode == Opcode.IPUT_OBJECT && (s[it].communityRef() as? FieldReference)?.type == type }
            .communitySingle().let { s[it] as TwoRegisterInstruction }
        communityRequire((s.size == 42 || s.size == 38) && s[0].opcode == Opcode.INVOKE_STATIC && s[1].opcode == Opcode.MOVE_RESULT_OBJECT && switch.communityString("InboxLoaderCoordinator.setFolderAndFilter") &&
            switch.parameterTypes.map(CharSequence::toString) == listOf(main.type, scope.type) && s[2].communityRef().toString() == requests.toString() &&
            s[3].opcode == Opcode.IF_NE && s[4].communityRef().toString() == folders["PENDING"].toString() &&
            s[7].communityRef().toString() == folders["PENDING"].toString() && s[s.branchTarget(3)].communityRef().toString() == folders["INBOX"].toString())
        val folderRegister = s[4].communityRegister() ?: throw CommunityChanged()
        val scopeStore = stores(scope.type)
        val folderStore = stores(folderGetter.returnType)
        communityRequire(listOf(4, 7, s.branchTarget(3)).all { s[it].communityRegister() == folderRegister } &&
            scopeStore.registerA == switch.implementation!!.registerCount - 1 && folderStore.registerA == folderRegister &&
            scopeStore.registerB == folderStore.registerB)
        val loaderCtor = calls(main.methods.filter { calls(it).any { call -> call.definingClass == scopeGetter.definingClass && call.name == "<init>" } }
            .communitySingle()).filter { it.definingClass == scopeGetter.definingClass && it.name == "<init>" }.communitySingle()
        val coordinator = definition(calls(definition(loaderCtor)).filter { it.name == "<init>" && byType[it.definingClass]?.communityOriginal() == "InboxLoaderCoordinator" }.communitySingle())
        val configCtor = definition(calls(coordinator).filter { it.name == "<init>" && it.definingClass == config.type }.communitySingle())
        val builder = byType[configCtor.parameterTypes.toList().communitySingle().toString()] ?: throw CommunityChanged()
        val defaultBuilder = builder.methods.filter { it.name == "<init>" && it.parameterTypes.isEmpty() }.communitySingle()
        communityRequire(coordinator.communityString("threadTypeFilter") && !coordinator.communityString("folderName") &&
            defaultBuilder.communityCode().size == 5 && calls(defaultBuilder).any { it.definingClass == "Ljava/util/HashSet;" && it.name == "<init>" && it.parameterTypes.isEmpty() })
        val prefixAt = scopeAt + 4
        val prefix = c[prefixAt].communityRef() as? FieldReference ?: throw CommunityChanged()
        communityRequire(prefix.name == "\$prefixOffsetCallback" && c[prefixAt].opcode == Opcode.IPUT_OBJECT &&
            (c[prefixAt] as TwoRegisterInstruction).registerA == 8)
        val prefixMove = previousWrite(ctorArgs[7])
        communityRequire(u[prefixMove].opcode == Opcode.MOVE_OBJECT_FROM16)
        val prefixRegister = (u[prefixMove] as TwoRegisterInstruction).registerB
        val prefixRead = (prefixMove - 1 downTo 0).firstOrNull { u[it].communityWrites(prefixRegister) } ?: throw CommunityChanged()
        communityRequire(u[prefixRead].opcode == Opcode.IGET_OBJECT)
        val mainPrefix = u[prefixRead].communityRef() as? FieldReference ?: throw CommunityChanged()
        communityRequire(mainPrefix.definingClass == main.type && mainPrefix.type == prefix.type)
        val stores = all.flatMap { cls -> cls.methods.flatMap { m -> m.communityCode().mapIndexedNotNull { at, i ->
            if (i.opcode == Opcode.IPUT_OBJECT && i.communityRef().toString() == mainPrefix.toString()) m to at else null
        } } }.communitySingle()
        val mainCtorCode = stores.first.communityCode()
        communityRequire(stores.first.definingClass == main.type && stores.first.name == "<init>" && stores.second >= 2)
        val callbackCtor = definition(mainCtorCode[stores.second - 1].communityRef() as? MethodReference ?: throw CommunityChanged())
        val cb = callbackCtor.communityCode()
        communityRequire(callbackCtor.parameterTypes.map(CharSequence::toString) == listOf(main.type) && cb.size == 3 && cb[0].opcode == Opcode.IPUT_OBJECT &&
            (cb[0] as TwoRegisterInstruction).let { it.registerA == 1 && it.registerB == 0 })
        val getterCall = scopeWrite - 1
        val receiver = u[getterCall].communityArgs().communitySingle()
        // 584 reads the loader through a lazy field: the field, a null test that skips a checked static getter, then the call.
        communityRequire(getterCall >= 4 && u[getterCall - 1].opcode == Opcode.MOVE_RESULT_OBJECT && u[getterCall - 1].communityRegister() == receiver &&
            u[getterCall - 2].opcode == Opcode.INVOKE_STATIC && u[getterCall - 3].opcode == Opcode.IF_NEZ &&
            u[getterCall - 3].communityRegister() == receiver && u.branchTarget(getterCall - 3) == getterCall &&
            u[getterCall - 4].opcode == Opcode.IGET_OBJECT && u[getterCall - 4].communityRegister() == receiver)
        val mainLoader = u[getterCall - 4].communityRef() as? FieldReference ?: throw CommunityChanged()
        val checkedLoader = definition(u[getterCall - 2].communityRef() as? MethodReference ?: throw CommunityChanged())
        communityRequire(AccessFlags.STATIC.isSet(checkedLoader.accessFlags) && checkedLoader.parameterTypes.map(CharSequence::toString) == listOf(main.type) &&
            checkedLoader.returnType == mainLoader.type && checkedLoader.communityCode().map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.IF_EQZ,
            Opcode.RETURN_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.THROW) &&
            checkedLoader.communityCode()[0].communityRef().toString() == mainLoader.toString())
        val g = scopeGetter.communityCode()
        val folderPath = listOf(cb[0].communityRef(), mainLoader, g[0].communityRef(), g[1].communityRef(), g[8].communityRef())
            .map { it as? FieldReference ?: throw CommunityChanged() }
        var owner = callbackCtor.definingClass
        for (field in folderPath) {
            communityRequire(field.definingClass == owner)
            val cls = byType[owner] ?: throw CommunityChanged()
            val native = cls.fields.filter { it.name == field.name && it.type == field.type }.communitySingle()
            communityRequire(AccessFlags.PUBLIC.isSet(cls.accessFlags) && AccessFlags.PUBLIC.isSet(native.accessFlags) && !AccessFlags.STATIC.isSet(native.accessFlags))
            owner = field.type
        }
        communityRequire(owner == folderGetter.definingClass && AccessFlags.PUBLIC.isSet(config.accessFlags) && AccessFlags.PUBLIC.isSet(folderGetter.accessFlags) && !AccessFlags.STATIC.isSet(folderGetter.accessFlags) &&
            folderGetter.parameterTypes.isEmpty() && folderGetter.communityCode().size == 21 &&
            calls(folderGetter).map { it.toString() } == listOf("Ljava/util/Set;->contains(Ljava/lang/Object;)Z"))
        val f = folderGetter.communityCode()
        communityRequire(folderGetter.implementation!!.registerCount == 3 && f.map { it.opcode } == listOf(
            Opcode.IGET_OBJECT, Opcode.CONST_STRING, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_NEZ, Opcode.MONITOR_ENTER,
            Opcode.SGET_OBJECT, Opcode.IF_NEZ, Opcode.SGET_OBJECT, Opcode.SPUT_OBJECT, Opcode.MONITOR_EXIT,
            Opcode.GOTO, Opcode.MOVE_EXCEPTION, Opcode.MONITOR_EXIT, Opcode.THROW, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT) &&
            f.branchTarget(4) == 7 && f.branchTarget(8) == 19 && f.branchTarget(11) == 14 && f.branchTarget(15) == 19 &&
            (f[0].communityRef() as? FieldReference)?.let { it.definingClass == config.type && it.type == "Ljava/util/Set;" } == true &&
            (f[5].communityRef() as? FieldReference)?.let { it.definingClass == config.type && it.type == folderGetter.returnType } == true &&
            (f[7].communityRef() as? FieldReference)?.let { it.definingClass == config.type && it.type == folderGetter.returnType } == true &&
            listOf(10, 13, 19).all { f[it].communityRef().toString() == f[7].communityRef().toString() } &&
            f[12].communityRef().toString() == folders.getValue("INBOX").toString() &&
            (f[0] as TwoRegisterInstruction).let { it.registerA == 1 && it.registerB == 2 } &&
            (f[5] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 2 } &&
            (f[1].communityRef() as? StringReference)?.string == "folderName" && f[2].communityArgs() == listOf(1, 0) &&
            listOf(1, 3, 4, 6, 7, 8, 10, 11, 12, 13, 16, 18, 19, 20).all { f[it].communityRegister() == 0 } &&
            listOf(9, 14, 17).all { f[it].communityRegister() == 2 })
        publicStatic(requests)
        publicStatic(folders.getValue("INBOX"))
        val updateId = update.hookId()
        val captures = setOf(captured.toString(), scope.toString())
        var callers = 0; var allocations = 0; var writes = 0
        for (cls in all) for (m in cls.methods) for ((at, i) in m.communityCode().withIndex()) {
            val ref = (i.communityRef() ?: continue).toString()
            if (ref == ctorId) { communityRequire(m.hookId() == updateId); callers++ }
            if (i.opcode == Opcode.NEW_INSTANCE && ref == closure.type) { communityRequire(m.hookId() == updateId); allocations++ }
            if (i.opcode.toString().startsWith("IPUT") && ref in captures) {
                communityRequire(m.hookId() == ctorId && at in setOf(0, scopeAt)); writes++
            }
        }
        communityRequire(callers == 1 && allocations == 1 && writes == 2)
        communityRequire(setOf("MessagingTabbedSearchFragment", "SearchListItemFragment", "FoldersFragment").all { name ->
            all.any { it.communityOriginal() == name && it.type != main.type } })
        val render = closure.methods.filter { it.name == "invoke" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") }.communitySingle()
        render.communityReadSite(scope.toString())
        val rowType = u.filter { it.opcode == Opcode.INSTANCE_OF }.mapNotNull { (it.communityRef() as? TypeReference)?.type }
            .distinct().filter { type -> byType[type]?.fields?.any { it.type == SUMMARY && !AccessFlags.STATIC.isSet(it.accessFlags) } == true }.communitySingle()
        val row = byType[rowType] ?: throw CommunityChanged()
        val rowSummary = row.fields.filter { it.type == SUMMARY && !AccessFlags.STATIC.isSet(it.accessFlags) }.communitySingle()
        communityRequire(AccessFlags.PUBLIC.isSet(row.accessFlags) && AccessFlags.PUBLIC.isSet(rowSummary.accessFlags) && AccessFlags.FINAL.isSet(rowSummary.accessFlags))
        val predicate = all.flatMap { it.methods }.filter { m -> m.parameterTypes.map(CharSequence::toString) == listOf(SUMMARY) &&
            m.returnType == "Z" && m.communityCode().size == 9 && m.communityCode()[1].communityRef().let { it is MethodReference && it.definingClass == THREAD_KEY } }.communitySingle()
        val p = predicate.communityCode()
        communityRequire(AccessFlags.PUBLIC.isSet(byType.getValue(predicate.definingClass).accessFlags) && AccessFlags.PUBLIC.isSet(predicate.accessFlags) && AccessFlags.STATIC.isSet(predicate.accessFlags) && p.map { it.opcode } ==
            listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.IF_EQZ, Opcode.IGET_BOOLEAN, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN) &&
            p.branchTarget(4) == 8 && p.branchTarget(6) == 8 && (p[0].communityRef() as? FieldReference)?.type == THREAD_KEY)
        communityRequire(predicate.implementation!!.registerCount == 3 && predicate.implementation!!.tryBlocks.isEmpty() &&
            (p[0] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 2 } && p[1].communityArgs() == listOf(0) &&
            p[2].communityRegister() == 0 && p[3].communityLiteral(1, 0) && p[4].communityRegister() == 0 &&
            (p[5] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 2 } && p[6].communityRegister() == 0 &&
            p[7].communityLiteral(1, 1) && p[8].communityRegister() == 1)
        val subscribed = p[5].communityRef() as? FieldReference ?: throw CommunityChanged()
        communityRequire(all.any { cls -> cls.methods.any { it.communityString("thread.isSubscribed") && it.communityCode().any { i -> i.communityRef().toString() == subscribed.toString() } } })
        val nullable = definition(p[1].communityRef() as MethodReference)
        val any = definition(calls(nullable).filter { it.definingClass == THREAD_KEY && it.parameterTypes.isEmpty() && it.returnType == "Z" }.communitySingle())
        val n = nullable.communityCode(); val a = any.communityCode()
        communityRequire(n.map { it.opcode } == listOf(Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN) && n.branchTarget(0) == 6 && n.branchTarget(3) == 6 &&
            nullable.implementation!!.registerCount == 1 && n[1].communityArgs() == listOf(0) && n[4].communityLiteral(0, 1) && n[6].communityLiteral(0, 0))
        // The community check compares the key type with both channel types inline.
        fun compares(at: Int) = (a[at] as? TwoRegisterInstruction)?.let { it.registerA == 1 && it.registerB == 0 } == true
        communityRequire(a.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.SGET_OBJECT, Opcode.IF_EQ,
                Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN) && any.implementation!!.registerCount == 3 &&
            a.branchTarget(2) == 7 && a.branchTarget(4) == 7 && a[5].communityLiteral(0, 0) && a[7].communityLiteral(0, 1) &&
            (a[0] as TwoRegisterInstruction).let { it.registerA == 1 && it.registerB == 2 } && a[1].communityRegister() == 0 &&
            a[3].communityRegister() == 0 && compares(2) && compares(4))
        val channelType = a[1].communityRef(); val announcementType = a[3].communityRef()
        // The key's own and only instance field of that enum type, as CompatReport checks.
        val keyRef = a[0].communityRef() as? FieldReference ?: throw CommunityChanged()
        val keyFields = (byType[THREAD_KEY] ?: throw CommunityChanged()).instanceFields.filter { it.type == keyRef.type }
        communityRequire(keyRef.definingClass == THREAD_KEY && keyFields.size == 1 && keyFields[0].name == keyRef.name)
        val keyType = keyRef.type
        val keyEnums = communityEnums(byType[keyType] ?: throw CommunityChanged())
        communityRequire(channelType.toString() == keyEnums["COMMUNITY_CHANNEL"].toString() &&
            announcementType.toString() == keyEnums["COMMUNITY_ANNOUNCEMENT_CHANNEL"].toString())
        val identity = (listOf(update.hookId(), ctor.hookId(), scopeGetter.hookId(), switch.hookId(), rowSummary.toString(),
            predicate.hookId(), nullable.hookId(), any.hookId(), requests.toString(), prefix.toString()) +
            folderPath.map { it.toString() } + listOf(folderGetter.hookId(), folders.getValue("INBOX").toString())).joinToString("|")
        return CommunityInboxContract(render, scope.toString(), rowSummary.toString(), predicate.hookId(), requests.toString(), identity,
            prefix.toString(), folderPath.map { it.toString() }, folderGetter.hookId(), folders.getValue("INBOX").toString())
    } catch (_: CommunityChanged) { return null }
}

/** Preserve the first empty/header read and capture, and prove scratch liveness along every successor. */
internal fun Method.communityReadSite(scope: String): Int {
    val c = communityCode()
    val listField = "$definingClass->\$inboxUnitItems:$IMMUTABLE_LIST"
    val reads = c.indices.filter { c[it].opcode == Opcode.IGET_OBJECT && c[it].communityRef().toString() == listField }
    // The second read follows a session-gated block before the search bar, at 63.
    communityRequire(reads.size == 2 && reads.first() == 5 && reads.last() == 63)
    val at = reads.last()
    // The list goes into v1, and the sink takes an $onThreadInViewport after the list, moved into place after the alias.
    val list = (c[at] as? TwoRegisterInstruction)?.takeIf { it.registerA == 1 && it.registerB == 4 }?.registerA ?: throw CommunityChanged()
    val alias = (at + 1 until c.size).firstOrNull { c[it].opcode == Opcode.MOVE_OBJECT_FROM16 && (c[it] as TwoRegisterInstruction).registerA == 17 }
        ?: throw CommunityChanged()
    communityRequire(c.getOrNull(alias + 1)?.opcode == Opcode.MOVE_OBJECT_FROM16)
    val sink = alias + 2
    val sinkTypes = (c.getOrNull(sink)?.communityRef() as? MethodReference)?.parameterTypes?.map(CharSequence::toString) ?: throw CommunityChanged()
    communityRequire(!AccessFlags.STATIC.isSet(accessFlags) && implementation!!.registerCount == 21 && implementation!!.tryBlocks.isEmpty() && c.size == sink + 8 &&
        c[6].opcode == Opcode.INVOKE_VIRTUAL && c[6].communityRef().toString() == "Ljava/util/AbstractCollection;->isEmpty()Z" && c[6].communityArgs() == listOf(0) &&
        communityString("searchBarSection") && c.any { it.opcode == Opcode.IGET_OBJECT && it.communityRef().toString() == scope } &&
        (c[alias] as TwoRegisterInstruction).registerB == list &&
        c[sink].opcode == Opcode.INVOKE_STATIC_RANGE && sinkTypes.size == 13 && sinkTypes[11] == "Ljava/util/List;" &&
        c[sink].communityArgs()[11] == 17 && (at + 1 until alias).none { c[it].communityWrites(list) } &&
        jumpTargets().none { it in at + 1..sink })
    val addresses = IntArray(c.size + 1)
    for (index in c.indices) addresses[index + 1] = addresses[index] + c[index].codeUnits
    val indexAt = c.indices.associateBy { addresses[it] }
    // The hook's two scratch registers are v0 and v3.
    for (register in listOf(0, 3)) {
        val pending = ArrayDeque<Int>()
        val seen = mutableSetOf<Int>()
        pending.add(at + 1)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (!seen.add(index)) continue
            val instruction = c[index]
            communityRequire(!instruction.communityReads(register))
            if (instruction.communityWrites(register)) continue
            if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) {
                val landing = indexAt[addresses[index] + instruction.codeOffset] ?: throw CommunityChanged()
                if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
                    val payload = c[landing] as? SwitchPayload ?: throw CommunityChanged()
                    for (element in payload.switchElements) {
                        pending.add(indexAt[addresses[index] + element.offset] ?: throw CommunityChanged())
                    }
                } else pending.add(landing)
            }
            if (instruction.opcode.canContinue()) {
                communityRequire(index + 1 < c.size)
                pending.add(index + 1)
            }
        }
    }
    return at
}

private fun MutableMethod.validateCommunityStub(id: String) {
    val c = communityCode()
    if (hookId() != id || AccessFlags.PRIVATE.isSet(accessFlags) || !AccessFlags.STATIC.isSet(accessFlags) || c.map { it.opcode } != listOf(Opcode.CONST_4, Opcode.RETURN) ||
        (c[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 || c[0].communityRegister() != c[1].communityRegister() || implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the community extension stub changed")
}

internal fun injectCommunityInbox(contract: CommunityInboxContract, render: MutableMethod, joined: MutableMethod, scope: MutableMethod): List<MutableMethod> {
    if (contract.identity != activeProfile.nativeCommunityInbox || render.hookId() !in activeProfile.hooks.getValue(COMMUNITY_INBOX))
        throw PatchException("Messenger controls: the native community inbox route changed")
    val at = try { render.communityReadSite(contract.capturedScope) } catch (_: CommunityChanged) {
        throw PatchException("Messenger controls: the community inbox list read changed")
    }
    joined.validateCommunityStub(JOINED_COMMUNITY_ROW)
    scope.validateCommunityStub(MAIN_INBOX_SCOPE)
    // Validate every target before editing any body. These helpers only read native typed values.
    fun helper(original: MutableMethod, registers: Int) = MutableMethod(ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
    val joinedHelper = helper(joined, 2)
    joinedHelper.addInstructionsWithLabels(0, """
        instance-of v0, p0, ${contract.rowSummary.substringBefore("->")}
        if-eqz v0, :keep
        check-cast p0, ${contract.rowSummary.substringBefore("->")}
        iget-object v0, p0, ${contract.rowSummary}
        if-eqz v0, :keep
        invoke-static {v0}, ${contract.joined}
        move-result v0
        return v0
        :keep
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    val scopeHelper = helper(scope, 3)
    scopeHelper.addInstructionsWithLabels(0, """
        instance-of v0, p1, ${contract.requests.substringBefore("->")}
        if-eqz v0, :keep
        sget-object v0, ${contract.requests}
        if-eq p1, v0, :keep
        instance-of v0, p0, ${contract.folderPath.first().substringBefore("->")}
        if-eqz v0, :keep
        check-cast p0, ${contract.folderPath.first().substringBefore("->")}
        ${contract.folderPath.mapIndexed { index, field -> "iget-object v0, ${if (index == 0) "p0" else "v0"}, $field\nif-eqz v0, :keep" }.joinToString("\n")}
        invoke-virtual {v0}, ${contract.folderGetter}
        move-result-object v0
        sget-object p0, ${contract.inbox}
        if-ne v0, p0, :keep
        const/4 v0, 0x1
        return v0
        :keep
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    val list = (render.communityCode()[at] as TwoRegisterInstruction).registerA
    val (prefix, scopeValue) = listOf(0, 3)
    render.addInstructionsWithLabels(at + 1, """
        iget-object v$prefix, v4, ${contract.capturedPrefix}
        iget-object v$scopeValue, v4, ${contract.capturedScope}
        invoke-static {v$list, v$prefix, v$scopeValue}, $SETTINGS->filterJoinedCommunityInboxRows(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;
        move-result-object v$list
        iget-object v$prefix, v4, ${render.definingClass}->${'$'}inboxUnitItems:$IMMUTABLE_LIST
        if-eq v$list, v$prefix, :stock_list
        invoke-static {v$list}, $COMMUNITY_LIST_COPY
        move-result-object v$list
        :stock_list
        check-cast v$list, $IMMUTABLE_LIST
    """.trimIndent())
    return listOf(joinedHelper, scopeHelper)
}
