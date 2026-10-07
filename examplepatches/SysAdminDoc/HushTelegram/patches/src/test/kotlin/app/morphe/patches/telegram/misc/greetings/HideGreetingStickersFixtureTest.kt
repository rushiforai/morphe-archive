/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.greetings

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/** The greeting view, every class that asks for the greeting sticker or reads the view's fields, and the runtime. */
class HideGreetingStickersFixtureTest {
    @Test fun `one hook in the greeting's measure pass and every stock path stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveGreetingStickers()
            val measure = key(site.method)
            val old = ImmutableMethod.of(site.method)
            val untouched = hostState(build, context, setOf(measure))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideGreetingStickersPatch.execute(context) })

            val before = old.controlBody()
            val after = site.method.controlBody()
            assertEquals("$name: register count", old.implementation!!.registerCount, site.method.implementation!!.registerCount)
            assertEquals("$name: three instructions", before.size + 3, after.size)
            assertEquals(Opcode.IGET_OBJECT, after[2].opcode)
            assertEquals(site.stickers.toString(), after[2].controlRef())
            assertEquals("Landroid/widget/FrameLayout;", site.stickers.type)
            assertEquals(Opcode.IGET_BOOLEAN, after[3].opcode)
            assertEquals(site.introduction.toString(), after[3].controlRef())
            val frame = after[2].namedRegisters().first()
            val flag = after[3].namedRegisters().first()
            assertEquals("$name: both reads come from the greeting itself", listOf(site.self, site.self),
                listOf(after[2].namedRegisters()[1], after[3].namedRegisters()[1]))
            assertEquals(Opcode.INVOKE_STATIC, after[4].opcode)
            assertEquals("$GREETING_STICKERS->measure(Landroid/view/View;Z)V", after[4].controlRef())
            assertEquals(listOf(frame, flag), after[4].namedRegisters())
            assertTrue("$name: the hook borrows dead locals", frame != flag && frame < site.self && flag < site.self)
            assertEquals("$name: layout requests are quieted before the hook", Opcode.IPUT_BOOLEAN, after[1].opcode)

            fun moved(index: Int) = if (index >= 2) index + 3 else index
            val a = ControlFlow.of(old)
            val b = ControlFlow.of(site.method)
            for (i in before.indices) {
                assertEquals("$name: stock operand $i", before[i].operand(), after[moved(i)].operand())
                val next = if (i == 1) listOf(2) else a.normal[i].map(::moved)
                assertEquals("$name: stock normal path $i", next, b.normal[moved(i)])
                assertEquals("$name: stock exceptional path $i", a.exceptional[i].map(::moved), b.exceptional[moved(i)])
            }
            assertEquals("$name: the constructor, layout, intro setter and every other host method", untouched,
                hostState(build, context, setOf(measure)))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideGreetingStickers" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `the frame is the plain greeting's sticker and the flag is the business intro's`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val site = context.resolveGreetingStickers()
            val owner = context.mutableClassDefBy(site.method.definingClass)
            val layout = owner.methods.single { m -> m.controlBody().any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == site.stickers.toString() } }
            val body = layout.controlBody()
            val read = body.indexOfFirst { it.controlRef() == site.stickers.toString() }
            assertEquals("${build.name}: the frame goes straight into the greeting", "Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup\$LayoutParams;)V",
                body[read + 1].controlRef())
            val setter = owner.methods.single { m -> m.controlBody().any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == site.introduction.toString() } }
            assertEquals("${build.name}: only the intro setter raises the flag", listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;"),
                setter.parameterTypes.map { it.toString() })
            assertTrue("${build.name}: the intro setter raises it to true", setter.controlBody().take(2).map { it.opcode } == listOf(Opcode.CONST_4, Opcode.IPUT_BOOLEAN))

            // The frame holds the tappable sticker view and its stand-in, both read from the greeting's own fields.
            val init = constructorOf(context, site).controlBody()
            val frame = init.first { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == site.stickers.toString() }.namedRegisters().first()
            val adds = init.indices.filter { init[it].controlRef() == ADD_VIEW && init[it].namedRegisters().first() == frame }
            val children = adds.map { at -> val child = init[at].namedRegisters()[1]
                init.subList(0, at).last { it.opcode.setsRegister() && it.namedRegisters().first() == child }.controlField()!! }
            assertEquals("${build.name}: two sticker views", 2, children.map { it.name }.distinct().size)
            val sticker = setSticker(context, site).controlBody()
            val click = sticker.indexOfFirst { it.controlRef() == SET_ON_CLICK }
            val target = sticker[click].namedRegisters().first()
            val tapped = sticker.subList(0, click).last { it.opcode.setsRegister() && it.namedRegisters().first() == target }.controlField()!!
            assertTrue("${build.name}: tapping a frame child sends the sticker", children.any { it.name == tapped.name })
            assertTrue("${build.name}: every frame child is a sticker view", children.all { it.type == tapped.type })
            val subclasses = hosts(build).filter { it.superclass == owner.type }
            assertTrue("${build.name}: ChatActivity and the business intro preview subclass the greeting", subclasses.size >= 3)
            assertTrue("${build.name}: a subclass that measures runs the greeting's pass first", subclasses.flatMap { it.methods }
                .filter { it.name == "onMeasure" }.all { m -> m.controlBody().first().opcode == Opcode.INVOKE_SUPER })
        }
    }

    @Test fun `changed greeting geometry refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, GreetingStickerSite) -> Unit>> = listOf(
                "measure no longer quiets layout" to { _, s -> s.method.replaceInstruction(1, "nop") },
                "requestLayout no longer checks" to { c, s -> requestLayout(c, s).replaceInstruction(0, "nop") },
                "frame no longer added" to { c, s -> val layout = layout(c, s); val body = layout.controlBody()
                    layout.replaceInstruction(body.indexOfFirst { it.controlRef() == s.stickers.toString() } + 1, "nop") },
                "intro flag never raised" to { c, s -> val setter = setter(c, s)
                    setter.replaceInstruction(setter.controlBody().indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == s.introduction.toString() }, "nop") },
                "second frame reader" to { c, s -> copy(c, layout(c, s)) },
                "constructor does more with the frame" to { c, s -> val init = constructorOf(c, s); val body = init.controlBody(); val frame = frameRegister(c, s)
                    init.replaceInstruction(body.indexOfLast { it.controlRef() == ADD_VIEW && it.namedRegisters().first() == frame },
                        "invoke-virtual {v$frame}, Landroid/view/View;->requestLayout()V") },
                "frame holds a text view" to { c, s -> val init = constructorOf(c, s); val body = init.controlBody(); val frame = frameRegister(c, s)
                    val add = body.indexOfFirst { it.controlRef() == ADD_VIEW && it.namedRegisters().first() == frame }
                    readText(c, s, init, add, body[add].namedRegisters()[1]) },
                "tap target outside the frame" to { c, s -> val m = setSticker(c, s); val body = m.controlBody()
                    val click = body.indexOfFirst { it.controlRef() == SET_ON_CLICK }
                    readText(c, s, m, click, body[click].namedRegisters().first()) },
                "sticker no longer loaded on first draw" to { c, s -> val draw = owner(c, s).methods.single { it.name == "dispatchDraw" }
                    draw.replaceInstruction(draw.controlBody().indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef()?.endsWith(DOCUMENT_SETTER) == true }, "nop") },
                "second intro flag writer" to { c, s -> copy(c, setter(c, s)) },
                "intro flag lowered" to { c, s -> val setter = setter(c, s); val body = setter.controlBody()
                    val raise = body.indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == s.introduction.toString() }
                    setter.replaceInstruction(raise - 1, "const/4 v${body[raise].namedRegisters().first()}, 0x0") },
                "subclass measures alone" to { c, s -> val sub = c.mutableClassDefBy(hosts(build).first { it.superclass == s.method.definingClass &&
                        it.methods.any { m -> m.name == "onMeasure" } }.type).methods.single { it.name == "onMeasure" }
                    sub.replaceInstruction(sub.controlBody().indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }, "nop") },
                "intro flag read outside measure" to { c, s -> copy(c, s.method) },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "hideGreetingStickers" } },
                "private measure hook" to { c, _ -> val h = c.mutableClassDefBy(GREETING_STICKERS).methods.single { it.name == "measure" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "empty measure hook" to { c, _ -> val owner = c.mutableClassDefBy(GREETING_STICKERS); val h = owner.methods.single { it.name == "measure" }
                    owner.methods.remove(h)
                    owner.methods.add(ImmutableMethod(h.definingClass, h.name, h.parameters, h.returnType, h.accessFlags, h.annotations,
                        h.hiddenApiRestrictions, ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())).toMutable()) },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveGreetingStickers())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { hideGreetingStickersPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun owner(c: BytecodePatchContext, s: GreetingStickerSite) = c.mutableClassDefBy(s.method.definingClass)
    private fun layout(c: BytecodePatchContext, s: GreetingStickerSite) =
        owner(c, s).methods.single { m -> m.controlBody().any { it.controlRef() == s.stickers.toString() && it.opcode == Opcode.IGET_OBJECT } }
    private fun setter(c: BytecodePatchContext, s: GreetingStickerSite) =
        owner(c, s).methods.single { m -> m.controlBody().any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == s.introduction.toString() } }
    private fun requestLayout(c: BytecodePatchContext, s: GreetingStickerSite) =
        owner(c, s).methods.single { it.name == "requestLayout" && it.parameterTypes.isEmpty() }
    private fun constructorOf(c: BytecodePatchContext, s: GreetingStickerSite) = owner(c, s).methods.single { it.name == "<init>" }
    private fun frameRegister(c: BytecodePatchContext, s: GreetingStickerSite) = constructorOf(c, s).controlBody()
        .first { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == s.stickers.toString() }.namedRegisters().first()
    private fun setSticker(c: BytecodePatchContext, s: GreetingStickerSite) = owner(c, s).methods
        .single { it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("Lorg/telegram/tgnet/TLRPC\$Document;") }
    /** Makes [register], as used at [at], come from one of the greeting's text views instead. */
    private fun readText(c: BytecodePatchContext, s: GreetingStickerSite, m: MutableMethod, at: Int, register: Int) {
        val body = m.controlBody()
        val source = (at - 1 downTo 0).first { body[it].opcode.setsRegister() && body[it].namedRegisters().first() == register }
        val text = owner(c, s).fields.first { it.type == "Landroid/widget/TextView;" }
        m.replaceInstruction(source, "iget-object v$register, v${body[source].namedRegisters()[1]}, ${text.definingClass}->${text.name}:${text.type}")
    }
    private fun copy(c: BytecodePatchContext, m: MutableMethod) {
        c.mutableClassDefBy(m.definingClass).methods.add(ImmutableMethod(m.definingClass, m.name + "Copy", m.parameters, m.returnType,
            m.accessFlags, m.annotations, m.hiddenApiRestrictions, m.implementation).toMutable())
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(GREETING_STICKERS, SETTINGS_STATUS))
        .filter { c.classDefByOrNull(it) != null }.associateWith { type -> c.mutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.mutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** Every class that asks for the greeting sticker, then every class reading a field of the greeting view or extending it. */
    private fun loadHosts(build: File): List<ClassDef> {
        val askers = FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.controlRef() == GREETINGS_STICKER } }
        val owners = askers.filter { cls -> cls.superclass == "Landroid/widget/LinearLayout;" &&
            cls.methods.any { m -> m.name == "onAttachedToWindow" && m.controlBody().any { it.controlRef() == GREETINGS_STICKER } } }.map { it.type }.toSet()
        val readers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlField()?.definingClass in owners } }
        // R8 inlines trivial subclass constructors, so look for subclasses by their declared parent.
        val subclasses = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex -> dex.classes.filter { it.superclass in owners }.mapTo(subclasses, ImmutableClassDef::of) }
        return (askers + readers + subclasses).associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private const val ADD_VIEW = "Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup\$LayoutParams;)V"
        private const val SET_ON_CLICK = "Landroid/view/View;->setOnClickListener(Landroid/view/View\$OnClickListener;)V"
        private const val DOCUMENT_SETTER = "(Lorg/telegram/tgnet/TLRPC\$Document;)V"
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
