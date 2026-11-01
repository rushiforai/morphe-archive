/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.misc.extension.PatchLogCapture
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The long press on the Threads logo, on each declared build: the main feed header's one call to
 * Compose's clickable that's handed the logo's tap goes to the extension's stand-in, whose body calls
 * Compose's combined clickable with Threads' arguments, the extension's long press and Threads' tap.
 */
class ThreadsLogoFixtureTest {
    @Test
    fun `the extension's stand-in and long press have the shapes the patch writes against`() {
        val logo = ExtensionDex.classDef(THREADS_LOGO)
        val stub = logo.methods.single { it.name == "clickable" }
        assertTrue(AccessFlags.STATIC.isSet(stub.accessFlags) && AccessFlags.PUBLIC.isSet(stub.accessFlags))
        assertEquals(LOGO_CLICKABLE, stub.signature())
        val field = logo.fields.single { it.name == "LONG_PRESS" }
        assertTrue(AccessFlags.STATIC.isSet(field.accessFlags) && AccessFlags.FINAL.isSet(field.accessFlags))
        assertEquals(LOGO_LONG_PRESS_FIELD, "${field.definingClass}->${field.name}:${field.type}")
        val press = ExtensionDex.classDef(THREADS_LOGO_LONG_PRESS)
        assertTrue(press.interfaces.isEmpty())
        val invoke = press.methods.single { it.name == "invoke" }
        assertTrue(AccessFlags.PUBLIC.isSet(invoke.accessFlags) && !AccessFlags.STATIC.isSet(invoke.accessFlags))
        assertEquals("Ljava/lang/Object;", invoke.returnType)
        assertTrue(invoke.parameterTypes.isEmpty())

        val describeStub = logo.methods.single { it.name == "describe" }
        assertTrue(AccessFlags.STATIC.isSet(describeStub.accessFlags) && AccessFlags.PUBLIC.isSet(describeStub.accessFlags))
        assertEquals(LOGO_DESCRIBE, describeStub.signature())
        val describeField = logo.fields.single { it.name == "DESCRIBE" }
        assertTrue(AccessFlags.STATIC.isSet(describeField.accessFlags) && AccessFlags.FINAL.isSet(describeField.accessFlags))
        assertEquals(LOGO_DESCRIBE_FIELD, "${describeField.definingClass}->${describeField.name}:${describeField.type}")
        val describe = ExtensionDex.classDef(THREADS_LOGO_DESCRIBE)
        assertTrue(describe.interfaces.isEmpty())
        val describeInvoke = describe.methods.single { it.name == "invoke" }
        assertTrue(AccessFlags.PUBLIC.isSet(describeInvoke.accessFlags) && !AccessFlags.STATIC.isSet(describeInvoke.accessFlags))
        assertEquals("Ljava/lang/Object;", describeInvoke.returnType)
        assertEquals(listOf("Ljava/lang/Object;"), describeInvoke.parameterTypes.map { it.toString() })
    }

    /**
     * Read apart from the patch, from Compose's semantics(modifier, mergeDescendants, properties):
     * its element takes a flag and the properties and builds the semantics node, and the one other
     * element that builds that node from the properties alone is clearAndSetSemantics'. The
     * contentDescription setter is the one static method that reads the key stored after
     * "ContentDescription" and wraps a String in a singleton list.
     */
    @Test
    fun `each declared build has one contentDescription setter and one clearAndSetSemantics, and the patch finds them`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val fixture = fixture(build)
            val found = context(fixture).logoSemantics(fixture.clickableReturn)
            assertEquals("$where: the setter", fixture.semantics.setter, found.setter.signature())
            assertEquals("$where: the receiver", fixture.semantics.receiver, found.receiver)
            assertEquals("$where: clearAndSetSemantics", fixture.semantics.clearAndSet, found.clearAndSet.signature())
        }
    }

    /**
     * A build where the semantics calls don't read as they did on 451 still gets the long press,
     * with a warning, and the stand-in leaves the logo's semantics as Threads made them.
     */
    @Test
    fun `a build whose semantics calls differ keeps the long press and warns`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val cases = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
                "\"$CONTENT_DESCRIPTION\" semantics key" to { context ->
                    val holder = context.mutableClassDefBy(fixture.semantics.key.substringBefore("->"))
                    val init = holder.methods.single { it.name == "<clinit>" }
                    val at = init.body().indexOfFirst { it.string() == CONTENT_DESCRIPTION }
                    val register = (init.body()[at] as OneRegisterInstruction).registerA
                    init.replaceInstruction(at, "const-string v$register, \"ContentDescriptions\"")
                },
                "clearAndSetSemantics" to { context ->
                    // The clearing element's node gets its clearing flag off, like the merging element's.
                    val element = context.mutableClassDefBy(fixture.semantics.clearing)
                    val create = element.methods.single { method ->
                        method.body().any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == fixture.semantics.node }
                    }
                    val at = create.body().indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == 1 && it.opcode == Opcode.CONST_4 }
                    val register = (create.body()[at] as OneRegisterInstruction).registerA
                    // The literal flipped has to be the one a node flag gets, or the case proves nothing.
                    val use = create.body().drop(at + 1).firstOrNull { (it as? OneRegisterInstruction)?.registerA == register }
                    assertTrue("${build.name}: v$register's 1 is stored into a flag of ${fixture.semantics.node}, not $use",
                        use?.opcode == Opcode.IPUT_BOOLEAN && use.getReference<FieldReference>()?.definingClass == fixture.semantics.node)
                    create.replaceInstruction(at, "const/4 v$register, 0x0")
                },
            )
            for ((expected, mutate) in cases) {
                val context = context(fixture)
                mutate(context)
                val warnings = PatchLogCapture.warnings { context.addLogoLongPress() }
                assertEquals("${build.name}: $warnings", 1, warnings.size)
                assertTrue("${build.name}: ${warnings.single()}", warnings.single().contains(expected) &&
                    warnings.single().contains("TalkBack keeps stopping on its refresh spinner"))
                val stub = context.mutableClassDefBy(THREADS_LOGO).methods.single { it.name == "clickable" }.body()
                assertTrue("${build.name}: the long press still goes in",
                    stub.any { it.method()?.toString() == fixture.combined })
                assertTrue("${build.name}: no description", stub.none {
                    it.method()?.toString() == fixture.semantics.clearAndSet || it.getReference<FieldReference>()?.toString() == LOGO_DESCRIBE_FIELD
                })
                assertTrue(context.mutableClassDefBy(THREADS_LOGO_DESCRIBE).interfaces.isEmpty())
            }
        }
    }

    /**
     * Read apart from the patch: the lambda that sends the LogoTap refresh reason is built in one
     * method of the whole build, which holds the main feed's Compose note, and the first static call
     * after it is built is the clickable the patch picks. Compose's combined clickable sits beside it
     * and hands its node the tap from its last Function0 and the long press from its first.
     */
    @Test
    fun `each declared build builds the logo's tap once, in the main feed header, and the patch finds its clickable`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val fixture = fixture(build)
            val site = context(fixture).logoSite()
            assertEquals("$where: the feed header", fixture.header.signature(), site.method.signature())
            assertEquals("$where: the clickable call", fixture.call, site.call)
            assertEquals("$where: the logo's tap", fixture.tap, site.tap)
            assertEquals("$where: the clickable", fixture.clickable, site.clickable.signature())
            assertEquals("$where: the combined clickable sits beside it", site.clickable.definingClass, site.combined.definingClass)
            val clickableTypes = site.clickable.parameterTypes.map { it.toString() }
            assertEquals(
                "$where: the combined clickable's parameters",
                clickableTypes.take(4) + listOf(STRING, STRING, FUNCTION0, FUNCTION0, FUNCTION0, "Z"),
                site.combined.parameterTypes.map { it.toString() },
            )
            assertEquals("$where: tap, long press and double tap", listOf(8, 6, 7), handlerOrder(site.combined))
        }
    }

    @Test
    fun `each declared build sends the logo's clickable to the stand-in, which adds the long press`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val fixture = fixture(build)
            val stock = fixture.header.body()
            val stockCall = stock[fixture.call] as RegisterRangeInstruction
            val result = (stock[fixture.call + 1] as OneRegisterInstruction).registerA

            val context = context(fixture)
            val combined = context.logoSite().combined
            context.addLogoLongPress()

            val header = context.header(fixture)
            val patched = header.body()
            assertEquals("$where: one instruction added", stock.code().size + 1, patched.code().size)
            assertEquals("$where: no new registers", fixture.header.implementation!!.registerCount,
                header.implementation!!.registerCount)
            val call = patched[fixture.call] as RegisterRangeInstruction
            assertEquals("$where: the stand-in", Opcode.INVOKE_STATIC_RANGE, patched[fixture.call].opcode)
            assertEquals(LOGO_CLICKABLE, patched[fixture.call].method().toString())
            assertEquals("$where: Threads' own registers", stockCall.startRegister to stockCall.registerCount,
                call.startRegister to call.registerCount)
            assertEquals("$where: the answer is taken as before", Opcode.MOVE_RESULT_OBJECT, patched[fixture.call + 1].opcode)
            assertEquals(result, (patched[fixture.call + 1] as OneRegisterInstruction).registerA)
            val cast = patched[fixture.call + 2]
            assertEquals("$where: then cast back to the modifier", Opcode.CHECK_CAST, cast.opcode)
            assertEquals(result, (cast as OneRegisterInstruction).registerA)
            assertEquals(fixture.clickableReturn, cast.getReference<TypeReference>()!!.type)
            assertEquals("$where: the rest is the stock header",
                stock.filterIndexed { index, _ -> index != fixture.call }.code().map { it.opcode },
                patched.filterIndexed { index, _ -> index != fixture.call && index != fixture.call + 2 }.code().map { it.opcode })
            assertEquals("$where: no clickable left for the logo", 0, patched.count { it.method()?.toString() == fixture.clickable })

            // The stand-in: Threads' arguments cast back, its translated label, the extension's long
            // press, no double tap, Threads' tap and its enabled flag, into the combined clickable.
            val stubMethod = context.mutableClassDefBy(THREADS_LOGO).methods.single { it.name == "clickable" }
            val stub = stubMethod.body()
            val parameter = { index: Int -> stubMethod.implementation!!.registerCount - 7 + index }
            val at = stub.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC_RANGE }
            val into = stub[at] as RegisterRangeInstruction
            assertEquals("$where: the combined clickable", combined.signature(), stub[at].method().toString())
            assertEquals(10, into.registerCount)
            fun writer(argument: Int) = stub.subList(0, at).last { (it as? OneRegisterInstruction)?.registerA == into.startRegister + argument }
            fun copiedFrom(argument: Int): Int {
                val write = stub.subList(0, at).indexOfLast { (it as? OneRegisterInstruction)?.registerA == into.startRegister + argument &&
                    it.opcode != Opcode.CHECK_CAST }
                return (stub[write] as TwoRegisterInstruction).registerB
            }
            for (argument in 0..3) {
                assertEquals("$where: argument $argument", combined.parameterTypes[argument].toString(),
                    writer(argument).takeIf { it.opcode == Opcode.CHECK_CAST }?.getReference<TypeReference>()?.type)
                assertEquals("$where: argument $argument comes from Threads", parameter(argument), copiedFrom(argument))
            }
            assertEquals("$where: Threads' label", parameter(4), copiedFrom(4))
            val label = writer(5)
            assertEquals("$where: the accessibility label", Opcode.MOVE_RESULT_OBJECT, label.opcode)
            assertEquals("$THREADS_LOGO->longClickLabel()Ljava/lang/String;",
                stub[stub.indexOf(label) - 1].method().toString())
            assertEquals("$where: no double tap", 0, (writer(7) as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$where: the long press", LOGO_LONG_PRESS_FIELD,
                writer(6).takeIf { it.opcode == Opcode.SGET_OBJECT }?.getReference<FieldReference>().toString())
            assertEquals("$where: Threads' tap", FUNCTION0,
                writer(8).takeIf { it.opcode == Opcode.CHECK_CAST }?.getReference<TypeReference>()?.type)
            assertEquals("$where: Threads' tap comes from Threads", parameter(5), copiedFrom(8))
            assertEquals("$where: Threads' enabled flag", parameter(6), copiedFrom(9))
            assertEquals(Opcode.MOVE_RESULT_OBJECT, stub[at + 1].opcode)
            assertEquals(Opcode.RETURN_OBJECT, stub.last().opcode)

            // Then clearAndSetSemantics with the extension's description, innermost, and its answer returned.
            val clickableResult = (stub[at + 1] as OneRegisterInstruction).registerA
            val description = stub[at + 2]
            assertEquals("$where: the description", Opcode.SGET_OBJECT, description.opcode)
            assertEquals(LOGO_DESCRIBE_FIELD, description.getReference<FieldReference>().toString())
            val clear = stub[at + 3]
            assertEquals("$where: clearAndSetSemantics", Opcode.INVOKE_STATIC, clear.opcode)
            assertEquals(fixture.semantics.clearAndSet, clear.method().toString())
            assertEquals("$where: on the clickable's modifier", listOf(clickableResult, (description as OneRegisterInstruction).registerA),
                clear.registers())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, stub[at + 4].opcode)
            assertEquals("$where: its answer is returned", (stub[at + 4] as OneRegisterInstruction).registerA,
                (stub[at + 5] as OneRegisterInstruction).registerA)
            assertEquals(at + 6, stub.size)

            val press = context.mutableClassDefBy(THREADS_LOGO_LONG_PRESS)
            assertEquals("$where: the long press is a Function0", listOf(FUNCTION0), press.interfaces.toList())
            val describe = context.mutableClassDefBy(THREADS_LOGO_DESCRIBE)
            assertEquals("$where: the description is a Function1", listOf(FUNCTION1), describe.interfaces.toList())
            val describeStub = context.mutableClassDefBy(THREADS_LOGO).methods.single { it.name == "describe" }
            val describeBody = describeStub.body()
            val receiver = describeStub.implementation!!.registerCount - 2
            assertEquals("$where: the receiver cast to Compose's", fixture.semantics.receiver,
                describeBody[0].takeIf { it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == receiver }
                    ?.getReference<TypeReference>()?.type)
            assertEquals("$where: the setter", fixture.semantics.setter, describeBody[1].method().toString())
            assertEquals(listOf(receiver, receiver + 1), describeBody[1].registers())
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID), describeBody.map { it.opcode })
        }
    }

    /**
     * Each way the build could stop matching what was read refuses it before anything is written: a
     * second header that builds the logo's tap, no LogoTap reason, no answer taken right after the
     * clickable, and a combined clickable that would hand the long press to the node as the tap.
     */
    @Test
    fun `a feed header or a clickable that differs from the one read is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val cases = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
                "found 2" to { context ->
                    val method = fixture.header
                    context.mutableClassDefBy(method.definingClass).methods.add(MutableMethod(ImmutableMethod(
                        method.definingClass, "copyOf${method.name}", method.parameters, method.returnType,
                        method.accessFlags, null, null, ImmutableMethodImplementation.of(method.implementation),
                    )))
                },
                "\"$LOGO_TAP\", an enum constant" to { context ->
                    val enum = context.mutableClassDefBy(fixture.reasons).methods.single { it.name == "<clinit>" }
                    val at = enum.body().indexOfFirst { it.getReference<StringReference>()?.string == LOGO_TAP }
                    val register = (enum.body()[at] as OneRegisterInstruction).registerA
                    enum.replaceInstruction(at, "const-string v$register, \"LogoPress\"")
                },
                "right after its clickable" to { context ->
                    context.header(fixture).addInstruction(fixture.call + 1, "nop")
                },
                "the long press could land on the tap" to { context ->
                    val owner = context.mutableClassDefBy(fixture.clickable.substringBefore("->"))
                    val combined = owner.methods.single { it.signature() == fixture.combined }
                    val first = combined.implementation!!.registerCount - 10
                    val at = combined.body().indexOfFirst {
                        it.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
                            (it as TwoRegisterInstruction).registerB == first + 6
                    }
                    val register = (combined.body()[at] as OneRegisterInstruction).registerA
                    combined.replaceInstruction(at, "move-object/from16 v$register, v${first + 7}")
                },
            )
            for ((expected, mutate) in cases) {
                val context = context(fixture)
                mutate(context)
                val error = assertThrows("${build.name}: $expected", PatchException::class.java) { context.logoSite() }
                    .message.orEmpty()
                assertTrue("${build.name}: $error", error.contains(expected))
            }
        }
    }

    /**
     * Every patch depends on the settings patch, so a build the long press doesn't fit gets the rest
     * of it: the row in Threads' settings still goes in, and the patch log names why the long press
     * was left out.
     */
    @Test
    fun `a build the long press doesn't fit gets the rest of the settings patch and a warning`() {
        val context = PatchContexts.of(SettingsPatchHosts.all())
        val warnings = PatchLogCapture.warnings { settingsPatch.execute(context) }

        assertEquals(warnings.toString(), 1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("\"$LOGO_TAP\"") &&
            warnings.single().contains("long press on the Threads logo is left out"))
        val list = context.mutableClassDefBy("Lfixture/SettingsScreen;").methods.single { it.name == "list" }.body()
        assertTrue("the row still goes in", list.any { it.method()?.toString() == ADD_SETTINGS_ROW })
    }

    private data class Fixture(
        val classes: Collection<ClassDef>,
        val header: Method,
        val call: Int,
        val tap: String,
        val clickable: String,
        val clickableReturn: String,
        val combined: String,
        val reasons: String,
        val semantics: Semantics,
    )

    /**
     * Compose's semantics calls as read from the build: the content description [key], its
     * [setter] and the [receiver] it takes, [clearAndSet], the [clearing] element it builds and the
     * [node] that element creates, and every class the patch's search could weigh against them.
     */
    private data class Semantics(
        val classes: Collection<ClassDef>,
        val key: String,
        val setter: String,
        val receiver: String,
        val clearAndSet: String,
        val clearing: String,
        val node: String,
    )

    private fun semantics(build: File, modifier: String): Semantics {
        val where = build.name
        val static = { method: Method -> AccessFlags.STATIC.isSet(method.accessFlags) }
        fun Method.types() = parameterTypes.map { it.toString() }
        fun Method.made() = body().filter { it.opcode == Opcode.NEW_INSTANCE }.map { it.getReference<TypeReference>()!!.type }
        fun FieldReference.name() = "$definingClass->$name:$type"

        val holders = FixtureDex.classesWhere(build, { true }) { method ->
            method.name == "<clinit>" && method.body().any { it.string() == CONTENT_DESCRIPTION }
        }
        val keys = holders.flatMap { it.methods }.filter { it.name == "<clinit>" }.mapNotNull { init ->
            val body = init.body()
            val at = body.indexOfFirst { it.string() == CONTENT_DESCRIPTION }
            if (at < 0) null else body.drop(at + 1).firstOrNull { it.opcode == Opcode.SPUT_OBJECT }?.getReference<FieldReference>()?.name()
        }.distinct()
        assertEquals("$where: one field is stored after \"$CONTENT_DESCRIPTION\": $keys", 1, keys.size)
        val key = keys.single()

        // Every static (anything, String) void that wraps something in a singleton list.
        val setterClasses = FixtureDex.classesWhere(build, { true }) { method ->
            static(method) && method.returnType == "V" && method.types().size == 2 && method.types()[1] == STRING &&
                method.body().any { it.method()?.toString() == SINGLETON_LIST }
        }
        val setters = setterClasses.flatMap { it.methods }.filter { method ->
            static(method) && method.returnType == "V" && method.types().size == 2 && method.types()[1] == STRING &&
                method.body().any { it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.name() == key } &&
                method.body().any { it.method()?.toString() == SINGLETON_LIST }
        }
        assertEquals("$where: one setter reads $key", 1, setters.size)
        val setter = setters.single()

        // Every static (modifier, properties) modifier and the elements they append. R8 inlined
        // semantics(modifier, mergeDescendants, properties), so its element is found by the node it
        // shares with clearAndSetSemantics' element instead of by a call.
        val appenderClasses = FixtureDex.classesWhere(build, { true }) { method ->
            static(method) && method.returnType == modifier && method.types() == listOf(modifier, FUNCTION1)
        }
        val appenders = appenderClasses.flatMap { it.methods }.filter { method ->
            static(method) && method.returnType == modifier && method.types() == listOf(modifier, FUNCTION1)
        }
        val elements = FixtureDex.classes(build, appenders.flatMap { it.made() }.toSet())
        val fromProperties = elements.values.filter { element ->
            element.methods.any { it.name == "<init>" && it.types() == listOf(FUNCTION1) }
        }
        val nodes = FixtureDex.classes(build, fromProperties.flatMap { element -> element.methods.flatMap { it.made() } }.toSet())
            .filterValues { node -> node.instanceFields.any { it.type == FUNCTION1 } }
        // AppendedSemanticsElement: built from a flag and the properties, and builds one of those nodes.
        val builders = FixtureDex.classesWhere(build, { true }) { method -> method.made().any { it in nodes } }
        val merging = builders.filter { element ->
            element.methods.any { it.name == "<init>" && it.types() == listOf("Z", FUNCTION1) }
        }
        assertEquals("$where: one element takes a flag and the properties and builds ${nodes.keys}: ${merging.map { it.type }}",
            1, merging.size)
        val node = merging.single().methods.flatMap { it.made() }.filter { it in nodes }.distinct()
        assertEquals("$where: the merging element builds one node holding the properties: $node", 1, node.size)
        val clearing = fromProperties.filter { element -> element.methods.any { node.single() in it.made() } }.map { it.type }
        assertEquals("$where: one appended element builds ${node.single()} from the properties alone: $clearing", 1, clearing.size)
        val clearAndSet = appenders.filter { clearing.single() in it.made() }
        assertEquals("$where: one function appends ${clearing.single()}", 1, clearAndSet.size)

        val classes = holders + setterClasses + appenderClasses + elements.values + nodes.values + merging +
            FixtureDex.classes(build, setOf(FUNCTION1)).values
        return Semantics(
            classes, key, setter.signature(), setter.types()[0], clearAndSet.single().signature(), clearing.single(), node.single(),
        )
    }

    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val where = build.name
        val noted = FixtureDex.classesWhere(build, { true }) { method ->
            method.holdsString(MAIN_FEED_SCREEN_NOTE) || method.name == "<clinit>" && method.body().any { it.string() == LOGO_TAP }
        }
        // The reason is the field the enum's static initializer stores after it builds LogoTap.
        val initializer = noted.flatMap { it.methods }.single { it.name == "<clinit>" && it.body().any { i -> i.string() == LOGO_TAP } }
        val enumBody = initializer.body()
        val reason = enumBody.drop(enumBody.indexOfFirst { it.string() == LOGO_TAP })
            .first { it.opcode == Opcode.SPUT_OBJECT }.getReference<FieldReference>()!!
        val reasonName = "${reason.definingClass}->${reason.name}:${reason.type}"

        val taps = FixtureDex.methodsWhere(build, { true }) { method ->
            method.name == "invoke" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/Object;" &&
                method.body().any { it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.let { f ->
                    "${f.definingClass}->${f.name}:${f.type}" } == reasonName }
        }.map { it.definingClass }.toSet()
        assertEquals("$where: one lambda sends $reasonName", 1, taps.size)
        val tap = taps.single()
        val header = FixtureDex.methodsWhere(build, { true }) { method ->
            method.body().any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == tap }
        }.single()
        assertTrue("$where: ${header.signature()} holds the main feed's note",
            header.body().any { it.string()?.let { s -> s.startsWith(MAIN_FEED_SCREEN_NOTE) && "(MainFeedScreen.kt:" in s } == true })
        val body = header.body()
        val built = body.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == tap }
        val call = (built + 1 until body.size).first {
            body[it].opcode == Opcode.INVOKE_STATIC || body[it].opcode == Opcode.INVOKE_STATIC_RANGE
        }
        val clickable = body[call].method()!!
        val owner = FixtureDex.classes(build, setOf(clickable.definingClass)).getValue(clickable.definingClass)
        val combined = owner.methods.single { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 10 &&
                method.parameterTypes.map { it.toString() }.count { it == FUNCTION0 } == 3 && method.returnType == clickable.returnType
        }
        val read = FixtureDex.classes(build, setOf(tap, header.definingClass, FUNCTION0))
        val semantics = semantics(build, clickable.returnType)
        Fixture(
            (noted + owner + read.values + semantics.classes).distinctBy { it.type }, header, call, tap, clickable.signature(),
            clickable.returnType, combined.signature(), reason.definingClass, semantics,
        )
    }

    private fun context(fixture: Fixture) =
        PatchContexts.of((ExtensionDex.classes() + fixture.classes).distinctBy { it.type })

    private fun BytecodePatchContext.header(fixture: Fixture) =
        mutableClassDefBy(fixture.header.definingClass).methods.single { it.signature() == fixture.header.signature() }

    private fun Method.holdsString(prefix: String) = body().any { it.string()?.startsWith(prefix) == true }

    private fun Instruction.string(): String? = getReference<StringReference>()?.string

    private fun Instruction.method(): MethodReference? = getReference<MethodReference>()

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private companion object {
        const val STRING = "Ljava/lang/String;"
        const val SINGLETON_LIST = "Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;"
        val fixtures = PerBuild<Fixture>()
    }
}
