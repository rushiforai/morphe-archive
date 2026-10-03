/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.profile.friendship

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class FollowingListHookTest {
    @Test
    fun theHookAndStubsAreInTheExtension() {
        val declared = ExtensionDex.classDef(FOLLOWING_LIST).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        val wanted = listOf(
            FOLLOWING_ROW.substringAfter("->"),
            "listKind(Ljava/lang/Object;)Ljava/lang/Object;",
            "listOwnerId(Ljava/lang/Object;)Ljava/lang/String;",
            "viewerId(Ljava/lang/Object;)Ljava/lang/String;",
            "subtitle(Ljava/lang/Object;)Landroid/widget/TextView;",
        )
        for (method in wanted) assertTrue("$method is not in the extension: $declared", method in declared)
    }

    @Test
    fun theHookGoesRightAfterTheRowIsFilledIn() {
        val context = PatchContexts.of(standIns())

        val found = context.findFollowRow()
        assertEquals(HOLDER, found.holder)
        assertEquals("$HOLDER->name:$TEXT_VIEW", found.subtitle.toString())
        assertEquals("$BINDER->config:$CONFIG", found.config.toString())
        assertEquals("$CONFIG->data:$FOLLOW_LIST_DATA", found.data.toString())
        assertEquals("$FOLLOW_LIST_DATA->kind:$KIND", found.kind.toString())
        assertEquals("$FOLLOW_LIST_DATA->owner:$STRING", found.owner.toString())
        assertEquals("$BINDER->session:$USER_SESSION", found.session.toString())
        context.markFollowRow(found)

        assertHooked("stand-in", context.mutableClassDefBy(BINDER).methods.single { it.name == "bindView" })
    }

    @Test
    fun theStubsReachTheListTheAccountAndTheNameLine() {
        val context = PatchContexts.of(standIns())
        val found = context.findFollowRow()
        context.followingStubs().fill(found)

        val extension = context.mutableClassDefBy(FOLLOWING_LIST).methods
        fun reads(stub: String) = extension.single { it.name == stub }.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(reads("listKind").containsAll(listOf("$BINDER->config:$CONFIG", "$CONFIG->data:$FOLLOW_LIST_DATA", "$FOLLOW_LIST_DATA->kind:$KIND")))
        assertTrue(reads("listOwnerId").containsAll(listOf("$BINDER->config:$CONFIG", "$CONFIG->data:$FOLLOW_LIST_DATA", "$FOLLOW_LIST_DATA->owner:$STRING")))
        assertTrue(reads("viewerId").containsAll(listOf("$BINDER->session:$USER_SESSION", "$USER_SESSION->getUserId()$STRING")))
        assertTrue("$HOLDER->name:$TEXT_VIEW" in reads("subtitle"))
    }

    /** A filled stub answering something narrower than Object returns on each way out by itself (see FriendshipStatusHookTest). */
    @Test
    fun noNarrowStubJoinsTwoWaysAtOneReturn() {
        val context = PatchContexts.of(standIns())
        context.followingStubs().fill(context.findFollowRow())

        val narrow = context.mutableClassDefBy(FOLLOWING_LIST).methods.filter { it.name in setOf("listOwnerId", "viewerId", "subtitle") }
        assertEquals(3, narrow.size)
        for (stub in narrow) {
            val code = stub.implementation!!.instructions.toList()
            val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
            val targets = code.withIndex().filter { it.value is OffsetInstruction }
                .map { addresses[it.index] + (it.value as OffsetInstruction).codeOffset }.toSet()
            code.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.forEach { (at, _) ->
                assertTrue("${stub.name}: a branch lands on the return at $at", addresses[at] !in targets)
            }
        }
    }

    @Test
    fun noBinderFailsThePatch() = assertRefused(standIns(rowState = "null cannot be cast to non-null type Something"), "expected one method loading")

    @Test
    fun twoBindersFailThePatch() = assertRefused(standIns() + copyOf(standIns().single { it.type == BINDER }, "Lfixture/SecondBinder;"), "found 2")

    /** A binder whose second parameter isn't a View isn't the row binder this patch knows. */
    @Test
    fun aBinderOfAnotherShapeFailsThePatch() = assertRefused(standIns(parameters = listOf("I", OBJECT, OBJECT, OBJECT)), "isn't an instance method")

    /** Code put where a branch lands is skipped by the branch, so the hook would miss some rows. */
    @Test
    fun aBranchLandingAfterTheCallFailsThePatch() = assertRefused(standIns(branchAfter = true), "only that call leads to")

    /** A fill call answering something has its move-result right after it, where the hook would go. */
    @Test
    fun aFillCallAnsweringSomethingFailsThePatch() = assertRefused(standIns(fillAnswers = OBJECT), "answering $OBJECT, not void")

    @Test
    fun anItemNotCastToAUserFailsThePatch() = assertRefused(standIns(castsUser = false), "to cast one value to $USER")

    @Test
    fun aRowFilledWithoutTheNameFailsThePatch() = assertRefused(standIns(nameKey = "username"), "TextView a user's name")

    /** Without Instagram's own check of whose list it is, there's no telling the owner's ID apart. */
    @Test
    fun aListNeverCheckedAgainstTheAccountFailsThePatch() = assertRefused(standIns(checksOwner = false), "against $SESSION_USER_ID")

    @Test
    fun aListKindWithoutFollowingFailsThePatch() = assertRefused(standIns(kinds = listOf("FOLLOWERS", "MUTUAL")), "list kind naming $FOLLOWING_KIND")

    /** The hook hands on the row's view in its own register; written over first, it'd hand on something else. */
    @Test
    fun aViewWrittenOverBeforeTheHookFailsThePatch() = assertRefused(standIns(overwrite = "move-object p2, v0"), "writes over parameter 1")

    @Test
    fun aHolderTheExtensionCantReachFailsThePatch() = assertRefused(standIns(holderPublic = false), "$HOLDER isn't public")

    /**
     * On each declared build the hook lands right after the row binder's call, the stubs fill, and
     * the same classes with the binder copied, or without the list's data class, are refused untouched.
     */
    @Test
    fun eachDeclaredBuildMarksTheFollowingList() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = fixtureClasses(bundle)
                val context = PatchContexts.of(classes)

                val found = context.findFollowRow()
                assertEquals("${bundle.name}: the name line", TEXT_VIEW, found.subtitle.type)
                assertEquals("${bundle.name}: the owner", FOLLOW_LIST_DATA, found.owner.definingClass)
                assertEquals("${bundle.name}: the account signed in", USER_SESSION, found.session.type)
                val kind = classes.single { it.type == found.kind.type }
                assertTrue("${bundle.name}: the list kind is an enum", AccessFlags.ENUM.isSet(kind.accessFlags))
                context.markFollowRow(found)
                context.followingStubs().fill(found)
                val method = context.mutableClassDefBy(found.type).methods.single {
                    it.name == found.name && it.parameterTypes.map(CharSequence::toString) == found.parameters
                }
                assertHooked("${bundle.name} ${found.type}->${found.name}", method)

                val binder = classes.single { it.type == found.type }
                assertRefused(classes + copyOf(binder, "Lfixture/SecondBinder;"), "found 2")
                assertRefused(classes.filter { it.type != FOLLOW_LIST_DATA }, "$FOLLOW_LIST_DATA isn't in this build")
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    /** The binder, and everything it reads to get to the list, the row and the account, in three passes over the bundle. */
    private fun fixtureClasses(bundle: java.io.File): List<ClassDef> {
        val binders = FixtureDex.classesHolding(bundle, FOLLOW_ROW_STATE)
        val wanted = mutableSetOf(USER, USER_SESSION, FOLLOW_LIST_DATA)
        for (classDef in binders) {
            classDef.fields.forEach { wanted += it.type }
            classDef.methods.filter { it.loads(FOLLOW_ROW_STATE) }.forEach { wanted += it.referencedTypes() }
        }
        val first = FixtureDex.classes(bundle, wanted)
        // The list's data holds the list kind, and the config's methods call Instagram's check of whose list it is.
        val more = first.values.filter { classDef -> classDef.type == FOLLOW_LIST_DATA || classDef.fields.any { it.type == FOLLOW_LIST_DATA } }
            .flatMap { classDef -> classDef.fields.map { it.type } + classDef.methods.flatMap { it.referencedTypes() } }
            .toSet() - wanted
        val second = FixtureDex.classes(bundle, more)
        return (binders + first.values + second.values + ExtensionDex.classDef(FOLLOWING_LIST))
            .map { ImmutableClassDef.of(it) }.distinctBy { it.type }
    }

    private fun Method.referencedTypes(): Set<String> = implementation?.instructions?.toList().orEmpty().flatMap { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is MethodReference -> listOf(reference.definingClass) + reference.parameterTypes.map(CharSequence::toString)
            is FieldReference -> listOf(reference.definingClass, reference.type)
            is TypeReference -> listOf(reference.type)
            else -> emptyList()
        }
    }.filter { it.startsWith("L") }.toSet()

    private fun Method.loads(value: String) = implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    } == true

    /** The patch refuses [classes] saying [why], and nothing in them calls the hook or has a filled stub. */
    private fun assertRefused(classes: List<ClassDef>, why: String) {
        val context = PatchContexts.of(classes)
        val refusal = assertThrows(PatchException::class.java) { context.findFollowRow() }
        assertTrue(refusal.message, refusal.message!!.startsWith("$PATCH: ") && why in refusal.message!!)
        assertUntouched(context)
    }

    private fun assertUntouched(context: BytecodePatchContext) {
        context.classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val calls = method.implementation?.instructions?.toList().orEmpty()
                    .count { (it as? ReferenceInstruction)?.reference?.toString() == FOLLOWING_ROW }
                assertEquals("${classDef.type}->${method.name} calls the hook", 0, calls)
            }
        }
        fun Method.key() = "$name(${parameterTypes.joinToString("")})$returnType"
        val stock = ExtensionDex.classDef(FOLLOWING_LIST).methods.associate { it.key() to it.implementation?.instructions?.count() }
        context.classDefByOrNull(FOLLOWING_LIST)!!.methods.forEach {
            assertEquals("${it.key()} was filled", stock[it.key()], it.implementation?.instructions?.count())
        }
    }

    /**
     * The hook once: a range call on `this` and the next three registers, the binder's own `this`,
     * position, view and item, right after the static call that fills the row in with a user. No
     * branch lands on it, so every row the binder fills in runs it.
     */
    private fun assertHooked(what: String, method: Method) {
        val code = method.implementation!!.instructions.toList()
        val locals = method.implementation!!.registerCount - method.parameterTypes.size - 1
        val calls = code.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == FOLLOWING_ROW }
        assertEquals("$what: calls of the hook", 1, calls.size)
        val (at, call) = calls.single()
        val range = call as RegisterRangeInstruction
        assertEquals("$what: the hook takes this and three parameters", 4, range.registerCount)
        assertEquals("$what: starting at this", locals, range.startRegister)

        val filled = (code[at - 1] as ReferenceInstruction).reference as MethodReference
        assertTrue("$what: a static call fills the row in right before", code[at - 1].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE))
        assertTrue("$what: with a user", USER in filled.parameterTypes.map(CharSequence::toString))

        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        for ((index, instruction) in code.withIndex()) {
            if (instruction !is OffsetInstruction) continue
            val target = addresses[index] + instruction.codeOffset
            assertTrue("$what: the branch at $index lands on the hook", target != addresses[at])
        }
    }

    internal companion object {
        const val BINDER = "Lfixture/RowBinder;"
        const val FILLER = "Lfixture/RowFiller;"
        const val HOLDER = "Lfixture/RowHolder;"
        const val ROW_STATE = "Lfixture/RowState;"
        const val CONFIG = "Lfixture/ListConfig;"
        const val KIND = "Lfixture/ListKind;"
        const val IDS = "Lfixture/Ids;"
        const val CHECKS = "Lfixture/Checks;"

        /**
         * The classes the patch reads, shaped as on 449: an instance `bindView(int, View, Object,
         * Object)` that loads [rowState], casts the item to a user and the row's tag to the holder,
         * and hands both to a static call that gives the holder's name line the user's name.
         */
        fun standIns(
            rowState: String = FOLLOW_ROW_STATE,
            parameters: List<String> = listOf("I", VIEW, OBJECT, OBJECT),
            branchAfter: Boolean = false,
            castsUser: Boolean = true,
            nameKey: String = "full_name",
            checksOwner: Boolean = true,
            kinds: List<String> = listOf("FOLLOWERS", FOLLOWING_KIND, "MUTUAL"),
            overwrite: String = "",
            holderPublic: Boolean = true,
            fillAnswers: String = "V",
        ): List<ClassDef> {
            val bind = method(
                BINDER, "bindView", parameters, "V", 10,
                """
                    move-object v0, p3
                    move-object v1, p2
                    ${if (castsUser) "check-cast v0, $USER" else ""}
                    const-string v2, "$rowState"
                    move-object v3, p4
                    invoke-static { v3, v2 }, $CHECKS->notNull($OBJECT$STRING)V
                    check-cast v3, $ROW_STATE
                    invoke-virtual { v1 }, $VIEW->getTag()$OBJECT
                    move-result-object v4
                    if-eqz v4, :missing
                    check-cast v4, $HOLDER
                    ${if (branchAfter) "if-eqz v3, :after" else ""}
                    $overwrite
                    invoke-static { v0, v3, v4 }, $FILLER->fill($USER$ROW_STATE$HOLDER)$fillAnswers
                    ${if (fillAnswers == "V") "" else "move-result-object v5"}
                    :after
                    return-void
                    :missing
                    return-void
                """,
                static = false,
            )
            val fill = method(
                FILLER, "fill", listOf(USER, ROW_STATE, HOLDER), "V", 5,
                """
                    invoke-virtual { p0 }, $USER->handle()$STRING
                    move-result-object v0
                    iget-object v1, p2, $HOLDER->username:$TEXT_VIEW
                    invoke-virtual { v1, v0 }, $TEXT_VIEW->setText(Ljava/lang/CharSequence;)V
                    invoke-virtual { p0 }, $USER->fullName()$STRING
                    move-result-object v0
                    iget-object v1, p2, $HOLDER->name:$TEXT_VIEW
                    invoke-virtual { v1, v0 }, $TEXT_VIEW->setText(Ljava/lang/CharSequence;)V
                    return-void
                """,
            )
            val handle = getter(USER, "handle", "username")
            val fullName = getter(USER, "fullName", nameKey)
            val own = method(
                CONFIG, "own", emptyList(), "Z", 3,
                """
                    iget-object v0, p0, $CONFIG->session:$USER_SESSION
                    iget-object v1, p0, $CONFIG->data:$FOLLOW_LIST_DATA
                    iget-object v1, v1, $FOLLOW_LIST_DATA->owner:$STRING
                    invoke-static { v0, v1 }, $IDS->isSelf($USER_SESSION$STRING)Z
                    move-result v0
                    return v0
                """,
                static = false,
            )
            val isSelf = method(
                IDS, "isSelf", listOf(USER_SESSION, STRING), "Z", 3,
                """
                    ${if (checksOwner) "iget-object v0, p0, $SESSION_USER_ID" else "const/4 v0, 0x0"}
                    const/4 v0, 0x0
                    return v0
                """,
            )
            val notNull = method(CHECKS, "notNull", listOf(OBJECT, STRING), "V", 2, "return-void")
            val names = method(KIND, "<clinit>", emptyList(), "V", 1, kinds.joinToString("\n") { "const-string v0, \"$it\"" } + "\nreturn-void")
            val getUserId = method(
                USER_SESSION, "getUserId", emptyList(), STRING, 1,
                """
                    iget-object v0, p0, $SESSION_USER_ID
                    return-object v0
                """,
                static = false,
            )
            return listOf(
                classOf(BINDER, listOf(field(BINDER, "config", CONFIG), field(BINDER, "session", USER_SESSION), field(BINDER, "position", "I")), listOf(bind)),
                classOf(FILLER, emptyList(), listOf(fill)),
                classOf(HOLDER, listOf(field(HOLDER, "username", TEXT_VIEW), field(HOLDER, "name", TEXT_VIEW)), emptyList(), public = holderPublic),
                classOf(ROW_STATE, emptyList(), emptyList()),
                classOf(CONFIG, listOf(field(CONFIG, "data", FOLLOW_LIST_DATA), field(CONFIG, "session", USER_SESSION)), listOf(own)),
                classOf(
                    FOLLOW_LIST_DATA,
                    listOf(field(FOLLOW_LIST_DATA, "kind", KIND), field(FOLLOW_LIST_DATA, "owner", STRING), field(FOLLOW_LIST_DATA, "group", STRING)),
                    emptyList(),
                ),
                ImmutableClassDef(
                    KIND, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.ENUM.value, "Ljava/lang/Enum;",
                    null, null, null, null, listOf(names),
                ),
                classOf(IDS, emptyList(), listOf(isSelf)),
                classOf(CHECKS, emptyList(), listOf(notNull)),
                classOf(USER, emptyList(), listOf(handle, fullName)),
                classOf(USER_SESSION, listOf(field(USER_SESSION, "userId", STRING)), listOf(getUserId)),
                ExtensionDex.classDef(FOLLOWING_LIST),
            )
        }

        /** [classDef] under another name, its members moved with it. */
        fun copyOf(classDef: ClassDef, type: String): ClassDef = ImmutableClassDef(
            type, classDef.accessFlags, classDef.superclass, classDef.interfaces, null, null,
            classDef.fields.map { ImmutableField(type, it.name, it.type, it.accessFlags, null, null, null) },
            classDef.methods.map {
                ImmutableMethod(type, it.name, it.parameters, it.returnType, it.accessFlags, null, null, it.implementation)
            },
        )

        private fun getter(type: String, name: String, key: String) = method(
            type, name, emptyList(), STRING, 2,
            """
                const-string v0, "$key"
                const/4 v0, 0x0
                return-object v0
            """,
            static = false,
        )

        private fun method(
            type: String, name: String, parameters: List<String>, returns: String, registers: Int, body: String,
            static: Boolean = true,
        ): Method {
            val flags = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else AccessFlags.FINAL.value)
            return ImmutableMethod.of(
                MutableMethod(
                    ImmutableMethod(
                        type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                        ImmutableMethodImplementation(registers, emptyList(), null, null),
                    ),
                ).apply { addInstructionsWithLabels(0, body.trimIndent()) },
            )
        }

        private fun field(type: String, name: String, of: String) =
            ImmutableField(type, name, of, AccessFlags.PUBLIC.value, null, null, null)

        private fun classOf(type: String, fields: List<ImmutableField>, methods: List<Method>, public: Boolean = true): ClassDef = ImmutableClassDef(
            type, (if (public) AccessFlags.PUBLIC.value else 0) or AccessFlags.FINAL.value, "Ljava/lang/Object;",
            null, null, null, fields, methods,
        )
    }
}
