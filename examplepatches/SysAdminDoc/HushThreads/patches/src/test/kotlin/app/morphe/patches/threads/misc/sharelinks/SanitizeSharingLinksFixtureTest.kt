/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.sharelinks

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.ads.MEDIA
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.RegisterLiveness
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.assertThrows
import org.junit.Test
import java.io.File

/**
 * Sanitize sharing links on each declared build: one parser of the permalink answer in the whole
 * build, and the patch sends the link it parses through the extension right before the response
 * object keeps it.
 */
class SanitizeSharingLinksFixtureTest {
    private companion object {
        /** Send and WhatsApp status or Instagram story: each fetches the link and is resumed without its post. */
        val RESUMED = listOf(
            "Lcom/instagram/barcelona/share/viewmodel/usecases/SendUseCase;",
            "Lcom/instagram/barcelona/share/usecase/CreateWAStatusOrIGStoryUseCase;",
        )
    }

    private val sanitize ="$EXTENSION_PACKAGE/misc/LinkCleaner;->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;"

    @Test
    fun `the extension's link cleaner takes and answers a string`() {
        val cleaner = ExtensionDex.classDef("$EXTENSION_PACKAGE/misc/LinkCleaner;")
        val method = cleaner.methods.single { it.name == "sanitizeShared" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(listOf("Ljava/lang/String;"), method.parameterTypes.map { it.toString() })
        assertEquals("Ljava/lang/String;", method.returnType)
    }

    @Test
    fun `the extension's post link takes the link, an author and a code`() {
        val cleaner = ExtensionDex.classDef("$EXTENSION_PACKAGE/misc/LinkCleaner;")
        val method = cleaner.methods.single { it.name == "postLink" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(POST_LINK, "${method.definingClass}->postLink(${method.parameterTypes.joinToString("")})${method.returnType}")
    }

    @Test
    fun `each declared build hands the post's author and code to the extension after both link reads`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val where = build.name
            val classes = parserClasses(build)
            val fetch = fetchOf(classes)
            val stock = fetch.body
            assertEquals("$where: the fetch reads the link twice", 2, fetch.reads.size)

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            sanitizeSharingLinksPatch.execute(context)

            val mutable = context.mutableClassDefBy(PERMALINK_REPOSITORY).methods.single { it.isPostLinkFetch() }
            val patched = mutable.instructions()
            assertEquals("$where: twelve instructions after each read", stock.size + 24, patched.size)
            assertEquals("$where: no new registers", fetch.method.implementation!!.registerCount, mutable.implementation!!.registerCount)
            for ((n, read) in fetch.reads.withIndex()) {
                val at = read + 2 + 12 * n
                val link = fetch.link(read)
                val block = patched.subList(at, at + 12)
                assertEquals(
                    "$where: hook shape after read $read",
                    listOf(Opcode.CONST_4, Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL,
                        Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT),
                    block.map { it.opcode },
                )
                val code = (block[0] as OneRegisterInstruction).registerA
                val name = (block[1] as OneRegisterInstruction).registerA
                assertTrue("$where: two scratch registers apart from the link and the post",
                    setOf(code, name, link, fetch.post).size == 4)
                val live = RegisterLiveness.of(fetch.method).liveInto(read + 2)
                assertTrue("$where: nothing reads v$code or v$name after read $read", code !in live && name !in live)

                fun call(index: Int) = block[index] as FiveRegisterInstruction
                assertEquals("$where: a post without a value skips to the call", at + 10, patched.target(at + 2))
                assertEquals(fetch.post, (block[2] as OneRegisterInstruction).registerA)
                assertEquals(fetch.post, call(3).registerC)
                assertTrue("$where: the code getter", block[3].method()!!.let { it.returnType == "Ljava/lang/String;" && classes.reads(MEDIA, it.name, 0x2eaded) })
                assertEquals(code, (block[4] as OneRegisterInstruction).registerA)
                assertEquals(fetch.post, call(5).registerC)
                assertTrue("$where: the author getter", block[5].method()!!.let { it.returnType == USER && classes.reads(MEDIA, it.name, 0x36ebcb) })
                assertEquals(name, (block[6] as OneRegisterInstruction).registerA)
                assertEquals("$where: no author skips to the call", at + 10, patched.target(at + 7))
                assertEquals(name, (block[7] as OneRegisterInstruction).registerA)
                assertEquals(name, call(8).registerC)
                assertTrue("$where: the username getter", block[8].method()!!.let { it.returnType == "Ljava/lang/String;" && classes.reads(USER, it.name, 0xf02988d6.toInt()) })
                assertEquals(name, (block[9] as OneRegisterInstruction).registerA)
                assertEquals(POST_LINK, block[10].method().toString())
                assertEquals(listOf(link, name, code), call(10).let { listOf(it.registerC, it.registerD, it.registerE) })
                assertEquals("$where: the post's own link replaces the read one", link, (block[11] as OneRegisterInstruction).registerA)
                assertEquals("$where: then the fetch goes on as it did", stock[read + 2].opcode, patched[at + 12].opcode)
            }
            assertEquals("$where: one parser call, two fetch calls", 2, patched.count { it.method()?.toString() == POST_LINK })
        }
    }

    @Test
    fun `each declared build hands the post out of its holder where Copy link and the other rows read the link`() {
        val share = "Lcom/instagram/barcelona/share/"
        val copy = "${share}usecase/CopyToClipboardUseCase\$copyLink\$result\$1;"
        val shareToApp = "${share}usecase/ShareToAppUseCase\$shareToApp\$result\$1;"
        val instagram = "${share}usecase/ShareToInstagramFeedUseCase\$shareToInstagramFeed\$result\$1\$1;"
        val kept = RESUMED
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val where = build.name
            val classes = parserClasses(build)
            val fetch = fetchOf(classes)
            val getter = fetch.body[fetch.reads.first()].method()!!
            fun Method.reads() = instructions().indices.filter { index ->
                instructions()[index].method()?.let { it.name == getter.name && it.definingClass == getter.definingClass } == true
            }
            val holders = classes.filter { holder ->
                holder.type != PERMALINK_REPOSITORY && holder.instanceFields.count { it.type == MEDIA } == 1 &&
                    holder.methods.any { !AccessFlags.STATIC.isSet(it.accessFlags) && it.reads().isNotEmpty() }
            }.associateBy { it.type }
            assertTrue("$where: Copy link, Share to another app and Share to Instagram hold their post: ${holders.keys}",
                holders.keys.containsAll(listOf(copy, shareToApp, instagram)))
            for (type in kept) assertTrue("$where: $type keeps no post the hook could read", type !in holders)

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            sanitizeSharingLinksPatch.execute(context)

            for ((type, holder) in holders) {
                val post = holder.instanceFields.single { it.type == MEDIA }
                for (stock in holder.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.reads().isNotEmpty() }) {
                    val mutable = context.mutableClassDefBy(type).methods.single { it.name == stock.name && it.parameterTypes == stock.parameterTypes }
                    val patched = mutable.instructions()
                    val self = stock.implementation!!.registerCount - 1 -
                        stock.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
                    val reads = stock.reads()
                    assertEquals("$where $type: fourteen instructions after each read", stock.instructions().size + 14 * reads.size, patched.size)
                    for ((n, read) in reads.withIndex()) {
                        val at = read + 2 + 14 * n
                        val link = (stock.instructions()[read + 1] as OneRegisterInstruction).registerA
                        val block = patched.subList(at, at + 14)
                        assertEquals("$where $type: hook shape after read $read",
                            listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.CONST_4, Opcode.IF_EQZ,
                                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                                Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT),
                            block.map { it.opcode })
                        val media = (block[0] as TwoRegisterInstruction).registerA
                        assertEquals("$where $type: the post comes from this", self, (block[0] as TwoRegisterInstruction).registerB)
                        val load = block[1] as TwoRegisterInstruction
                        assertEquals("$where $type: out of the holder's one post field", listOf(media, media, "$type->${post.name}:$MEDIA"),
                            listOf(load.registerA, load.registerB, block[1].field().toString()))
                        val code = (block[2] as OneRegisterInstruction).registerA
                        val name = (block[3] as OneRegisterInstruction).registerA
                        assertTrue("$where $type: three scratch registers apart from the link", setOf(media, code, name, link).size == 4)
                        val live = RegisterLiveness.of(stock).liveInto(read + 2)
                        assertTrue("$where $type: nothing reads the scratch registers after read $read", listOf(media, code, name).none { it in live })
                        assertEquals("$where $type: a missing post skips to the call", at + 12, patched.target(at + 4))
                        assertEquals(media, (block[5] as FiveRegisterInstruction).registerC)
                        assertEquals(media, (block[7] as FiveRegisterInstruction).registerC)
                        assertEquals("$where $type: no author skips to the call", at + 12, patched.target(at + 9))
                        assertEquals(POST_LINK, block[12].method().toString())
                        assertEquals(listOf(link, name, code), (block[12] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE) })
                        assertEquals("$where $type: the post's own link replaces the read one", link, (block[13] as OneRegisterInstruction).registerA)
                    }
                    assertEquals("$where $type: one call per read", reads.size, patched.count { it.method()?.toString() == POST_LINK })
                }
            }
        }
    }

    @Test
    fun `each declared build keeps the post against its continuation where Send and the story share fetch the link`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val where = build.name
            val classes = parserClasses(build)
            val reads = linkReader(classes)
            val stocks = RESUMED.map { type -> classes.single { it.type == type }.methods.single { reads(it).isNotEmpty() } }

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            sanitizeSharingLinksPatch.execute(context)

            for (stock in stocks) {
                val name = "$where ${stock.definingClass}"
                val body = stock.instructions()
                val call = body.indices.single { body[it].isPlainFetchCall() }
                val arguments = (body[call] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG) }
                val coroutine = arguments[4]
                val last = stock.implementation!!.registerCount - 1
                assertTrue("$name: v$coroutine holds the continuation the method was called with",
                    body.any { it.opcode == Opcode.MOVE_OBJECT && (it as TwoRegisterInstruction).registerA == coroutine && it.registerB == last })
                assertTrue("$name: and the post is a parameter it gets back null on resume", arguments[2] > last - stock.parameterTypes.size)

                val patched = context.mutableClassDefBy(stock.definingClass).methods
                    .single { it.name == stock.name && it.parameterTypes == stock.parameterTypes }.instructions()
                val stockReads = reads(stock)
                assertEquals("$name: one call before the fetch, fifteen after each read", body.counted() + 1 + 15 * stockReads.size, patched.counted())
                assertEquals("$name: the post goes in just before the fetch", REMEMBER_POST, patched[call].method().toString())
                assertEquals(listOf(coroutine, arguments[2]), (patched[call] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
                assertEquals("$name: then the fetch as it was", body[call].method().toString(), patched[call + 1].method().toString())
                for ((n, read) in stockReads.withIndex()) {
                    val at = read + 2 + (if (read > call) 1 else 0) + 15 * n
                    assertRecall("$name read $read", stock, read, patched, at, coroutine)
                }
            }
        }
    }

    @Test
    fun `each declared build with quick sends keeps the post against their coroutine before it empties its post field`() {
        var seen = 0
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val where = build.name
            val classes = parserClasses(build)
            // A build can resolve no link for WhatsApp quick sends, as 448 did.
            val stock = quickSends(classes) ?: continue
            seen++
            val body = stock.instructions()
            val self = stock.implementation!!.registerCount - 2
            val stockReads = linkReader(classes)(stock)
            val cast = (0 until stockReads.first()).last { body[it].opcode == Opcode.CHECK_CAST && body[it].type() == MEDIA }
            val load = body[cast - 1] as TwoRegisterInstruction
            val post = (body[cast] as OneRegisterInstruction).registerA
            assertEquals("$where: the post comes out of the coroutine's own field", listOf(Opcode.IGET_OBJECT, post, self),
                listOf(body[cast - 1].opcode, load.registerA, load.registerB))
            assertTrue("$where: which it empties before it waits",
                body.any { it.opcode == Opcode.IPUT_OBJECT && it.field() == body[cast - 1].field() })

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            sanitizeSharingLinksPatch.execute(context)

            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.name == stock.name }.instructions()
            assertEquals("$where: one call after the cast, fifteen after each read", body.counted() + 1 + 15 * stockReads.size, patched.counted())
            assertEquals("$where: the post goes in right after its cast", REMEMBER_POST, patched[cast + 1].method().toString())
            assertEquals(listOf(self, post), (patched[cast + 1] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
            for ((n, read) in stockReads.withIndex()) {
                assertRecall("$where read $read", stock, read, patched, read + 3 + 15 * n, self)
            }
        }
        assertTrue("a declared build has quick sends", seen > 0)
    }

    @Test
    fun `a coroutine whose key or post the hook can't trust is refused`() {
        val send = RESUMED.first()
        for (build in Fixtures.declaredBuilds()) {
            val classes = parserClasses(build)
            val reads = linkReader(classes)
            val sendStock = classes.single { it.type == send }.methods.single { reads(it).isNotEmpty() }
            val sendBody = sendStock.instructions()
            val call = sendBody.indices.single { sendBody[it].isPlainFetchCall() }
            val coroutine = (sendBody[call] as FiveRegisterInstruction).registerG
            val copy = sendBody.indexOfFirst { it.opcode == Opcode.MOVE_OBJECT && (it as TwoRegisterInstruction).registerA == coroutine }
            val quick = quickSends(classes)
            val cases = mutableListOf(
                Triple("key overwritten", send, "writes something other than its continuation"),
                Triple("key copied from the post", send, "copies something other than its continuation"),
            )
            if (quick != null) {
                cases += Triple("no cast", quick.definingClass, "without one cast of its own post field")
                cases += Triple("this overwritten", quick.definingClass, "writes over this")
            }
            for ((label, type, expected) in cases) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(type).methods.single { reads(it).isNotEmpty() }
                when (label) {
                    "key overwritten" -> mutable.addInstructions(reads(sendStock).first(), "const/4 v$coroutine, 0x0")
                    "key copied from the post" ->
                        mutable.replaceInstruction(copy, "move-object v$coroutine, v${(sendBody[call] as FiveRegisterInstruction).registerE}")
                    "no cast" -> {
                        val body = quick!!.instructions()
                        mutable.replaceInstruction((0 until reads(quick).first()).last { body[it].opcode == Opcode.CHECK_CAST && body[it].type() == MEDIA }, "nop")
                    }
                    else -> mutable.addInstructions(0, "const/16 v${quick!!.implementation!!.registerCount - 2}, 0x0")
                }
                val error = assertThrows(label, PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }.message.orEmpty()
                assertTrue("$label: $error", error.contains(expected))
            }
            clearMatches()
            val error = assertThrows(PatchException::class.java) {
                sanitizeSharingLinksPatch.execute(PatchContexts.of(ExtensionDex.classes() + classes.filter { it.type !in RESUMED }))
            }.message.orEmpty()
            assertTrue(error, error.contains("so Send would keep short links"))
            if (quick == null) continue
            // Without quick sends the rest still goes in.
            clearMatches()
            val context = PatchContexts.of(ExtensionDex.classes() + classes.filter { it.type != quick.definingClass })
            sanitizeSharingLinksPatch.execute(context)
            assertTrue(context.mutableClassDefBy(send).methods.any { m -> m.instructions().any { it.method()?.toString() == REMEMBER_POST } })
        }
    }

    /**
     * The fifteen instructions after [read] at [at] in [patched]: the post kept against [key] comes
     * back, cast to a post, then the fetch's hook runs with it, in registers [stock] doesn't read there.
     */
    private fun assertRecall(where: String, stock: Method, read: Int, patched: List<Instruction>, at: Int, key: Int) {
        val link = (stock.instructions()[read + 1] as OneRegisterInstruction).registerA
        val block = patched.subList(at, at + 15)
        assertEquals("$where: hook shape",
            listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.CONST_4, Opcode.CONST_4, Opcode.IF_EQZ,
                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ,
                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT),
            block.map { it.opcode })
        assertEquals("$where: the kept post comes back", REMEMBERED_POST, block[0].method().toString())
        assertEquals("$where: for the coroutine", listOf(key), (block[0] as FiveRegisterInstruction).let { listOf(it.registerC).take(it.registerCount) })
        val post = (block[1] as OneRegisterInstruction).registerA
        assertEquals("$where: cast to a post", listOf(post, MEDIA), listOf((block[2] as OneRegisterInstruction).registerA, block[2].type()))
        val code = (block[3] as OneRegisterInstruction).registerA
        val name = (block[4] as OneRegisterInstruction).registerA
        assertTrue("$where: three scratch registers apart from the link and the key", setOf(post, code, name, link, key).size == 5)
        val live = RegisterLiveness.of(stock).liveInto(read + 2)
        assertTrue("$where: nothing reads the scratch registers after the read", listOf(post, code, name).none { it in live })
        assertEquals("$where: a missing post skips to the call", at + 13, patched.target(at + 5))
        assertEquals(post, (block[5] as OneRegisterInstruction).registerA)
        assertEquals(post, (block[6] as FiveRegisterInstruction).registerC)
        assertEquals(post, (block[8] as FiveRegisterInstruction).registerC)
        assertEquals("$where: no author skips to the call", at + 13, patched.target(at + 10))
        assertEquals(POST_LINK, block[13].method().toString())
        assertEquals(listOf(link, name, code), (block[13] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE) })
        assertEquals("$where: the post's own link replaces the read one", link, (block[14] as OneRegisterInstruction).registerA)
        assertEquals("$where: then the method goes on as it did", stock.instructions()[read + 2].opcode, patched[at + 15].opcode)
    }

    /** The reads of the answer's link getter in a method, by the getter the share sheet's fetch reads. */
    private fun linkReader(classes: List<ClassDef>): (Method) -> List<Int> {
        val getter = fetchOf(classes).let { it.body[it.reads.first()].method()!! }
        return { method ->
            method.instructions().indices.filter { index ->
                method.instructions()[index].method()?.let { it.name == getter.name && it.definingClass == getter.definingClass } == true
            }
        }
    }

    /** WhatsApp quick sends' coroutine body, the one that names its share source and reads the link. */
    private fun quickSends(classes: List<ClassDef>): Method? {
        val reads = linkReader(classes)
        return classes.flatMap { it.methods }.singleOrNull { method ->
            method.name == "invokeSuspend" && reads(method).isNotEmpty() && method.instructions().any { it.string() == "quick_sends" }
        }
    }

    private fun Instruction.isPlainFetchCall(): Boolean = method()?.let {
        it.definingClass == PERMALINK_REPOSITORY && it.parameterTypes.size == 4 && it.parameterTypes[1].toString() == MEDIA
    } == true

    /** Instructions apart from nops: a stock body carries the nop that aligns a switch's data, a patched one adds it back when written. */
    private fun List<Instruction>.counted(): Int = count { it.opcode != Opcode.NOP }

    private fun Instruction.type(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    @Test
    fun `a holder that writes over this before its read is refused`() {
        val copy = "Lcom/instagram/barcelona/share/usecase/CopyToClipboardUseCase\$copyLink\$result\$1;"
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val classes = parserClasses(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val fetch = fetchOf(classes)
            val getter = fetch.body[fetch.reads.first()].method()!!
            val method = context.mutableClassDefBy(copy).methods.single { m -> m.instructions().any { it.method()?.name == getter.name } }
            val self = method.implementation!!.registerCount - 1 - method.parameterTypes.size
            method.addInstructions(0, "const/4 v$self, 0x0")
            val error = assertThrows(PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }.message.orEmpty()
            assertTrue(error, error.contains("writes over this"))
        }
    }

    @Test
    fun `a holder with two post fields keeps the post it fetched instead, since either field could be the post`() {
        val copy = "Lcom/instagram/barcelona/share/usecase/CopyToClipboardUseCase\$copyLink\$result\$1;"
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val classes = parserClasses(build)
            val reads = linkReader(classes)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            context.mutableClassDefBy(copy).instanceFields.add(
                MutableField(ImmutableField(copy, "secondPost", MEDIA, AccessFlags.PUBLIC.value, null, null, null)),
            )
            val stock = classes.single { it.type == copy }.methods.single { reads(it).isNotEmpty() }
            sanitizeSharingLinksPatch.execute(context)
            val patched = context.mutableClassDefBy(copy).methods.single { it.name == stock.name && it.parameterTypes == stock.parameterTypes }.instructions()
            fun count(call: String) = patched.count { it.method()?.toString() == call }
            assertEquals("${build.name}: no post field read", 0,
                patched.counted() - stock.instructions().counted() - 1 - 15 * reads(stock).size)
            assertEquals("${build.name}: the fetched post kept once", 1, count(REMEMBER_POST))
            assertEquals("${build.name}: and recalled at each read", listOf(reads(stock).size, reads(stock).size),
                listOf(count(REMEMBERED_POST), count(POST_LINK)))
        }
    }

    @Test
    fun `a build where nothing holding a post reads the link is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val all = parserClasses(build)
            val getter = fetchOf(all).let { it.body[it.reads.first()].method()!! }
            val classes = all.filter { holder ->
                holder.type in setOf(PERMALINK_REPOSITORY, MEDIA, USER) || holder.instanceFields.count { it.type == MEDIA } != 1 ||
                    holder.methods.none { m -> m.instructions().any { it.method()?.name == getter.name && it.method()?.definingClass == getter.definingClass } }
            }
            val error = assertThrows(PatchException::class.java) {
                sanitizeSharingLinksPatch.execute(PatchContexts.of(ExtensionDex.classes() + classes))
            }.message.orEmpty()
            assertTrue(error, error.contains("nothing that holds a post reads its link"))
        }
    }

    @Test
    fun `the post link hook skips other getters and refuses a fetch it can't follow`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = parserClasses(build)
            val fetch = fetchOf(classes)
            val first = fetch.reads.first()
            val response = (fetch.body[first] as FiveRegisterInstruction).registerC
            val getter = fetch.body[first].method()!!
            val owner = fetch.body[fetch.store] as TwoRegisterInstruction
            val cases = listOf(
                Triple("decoy", fetch.reads.last() + 2, "invoke-interface { v$response }, Lfixture/Decoy;->${getter.name}()Ljava/lang/String;\nmove-result-object v${fetch.link(first)}"),
                Triple("no read", -1, ""),
                Triple("other getter", fetch.reads.last() + 2, ""),
                Triple("overwritten post", fetch.store, "const/4 v${fetch.post}, 0x0"),
                Triple("branch", fetch.store, "if-eqz v${fetch.post}, :store\nnop\n:store\nnop"),
                Triple("two posts", fetch.store, "iput-object v${fetch.post}, v${owner.registerB}, ${fetch.body[fetch.store].field()}"),
            )
            for ((label, index, code) in cases) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(PERMALINK_REPOSITORY).methods.single { it.isPostLinkFetch() }
                if (label == "no read") {
                    for (read in fetch.reads) mutable.replaceInstruction(read, "invoke-interface { v$response }, Lfixture/Decoy;->${getter.name}()Ljava/lang/String;")
                } else if (label == "other getter") {
                    // A String getter on the answer itself that doesn't read the link isn't a link read.
                    val answer = classes.single { answer ->
                        getter.definingClass in answer.interfaces && answer.methods.any { m ->
                            m.name == getter.name && m.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.field()?.type == "Ljava/lang/String;" }
                        }
                    }.type
                    context.mutableClassDefBy(answer).methods.add(ImmutableMethod(
                        answer, "decoyLink", emptyList(), "Ljava/lang/String;", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2),
                    ).toMutable().apply { addInstructions(0, "const-string v0, \"decoy\"\nreturn-object v0") })
                    mutable.addInstructions(index, "invoke-interface { v$response }, ${getter.definingClass}->decoyLink()Ljava/lang/String;\n" +
                        "move-result-object v${fetch.link(first)}")
                } else {
                    mutable.addInstructions(index, code)
                }
                if (label == "decoy" || label == "other getter") {
                    sanitizeSharingLinksPatch.execute(context)
                    assertEquals("$label: only the answer's own getter", 2, mutable.instructions().count { it.method()?.toString() == POST_LINK })
                    continue
                }
                val error = assertThrows("$label: refused", PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }.message.orEmpty()
                val expected = when (label) {
                    "no read" -> "never reads"
                    "overwritten post" -> "writes v${fetch.post}"
                    "branch" -> "branches between"
                    else -> "expected exactly one match, found 2"
                }
                assertTrue("$label: $error", error.contains(expected))
            }
        }
    }

    @Test
    fun `an unrelated String store before the response field is not sanitized`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val classes = parserClasses(build)
            val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val store = (created until stock.size).first { stock[it].opcode == Opcode.IPUT_OBJECT && stock[it].field()?.type == "Ljava/lang/String;" }
            val original = stock[store] as TwoRegisterInstruction
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val mutable = context.mutableClassDefBy(parser.definingClass).methods.single { it.name == parser.name }
            mutable.addInstructions(
                store,
                "iput-object v${original.registerA}, v${original.registerB}, Lfixture/Unrelated;->label:Ljava/lang/String;",
            )

            sanitizeSharingLinksPatch.execute(context)

            val after = mutable.instructions()
            val call = after.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == sanitize }
            assertEquals("the sanitizer immediately precedes the owned response field", stock[store].field(), after[call + 2].field())
        }
    }

    @Test
    fun `response selection tolerates decoys and aliases but rejects duplicate or overwritten receivers`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = parserClasses(build)
            val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val owner = ((stock[created] as ReferenceInstruction).reference as TypeReference).type
            val store = (created until stock.size).first { stock[it].opcode == Opcode.IPUT_OBJECT && stock[it].field()?.type == "Ljava/lang/String;" }
            val original = stock[store] as TwoRegisterInstruction
            val field = stock[store].field()!!
            val cases = listOf(
                Triple("unrelated allocation", created, "new-instance v2, Lfixture/Decoy;\ninvoke-direct { v2 }, Lfixture/Decoy;-><init>()V"),
                Triple("wrong receiver", store, "iput-object v${original.registerA}, v2, $field"),
                Triple("aliases", store, "move-object v2, v${original.registerB}\nconst/4 v${original.registerB}, 0x0\nmove-object v${original.registerB}, v2\ncheck-cast v${original.registerB}, $owner"),
                Triple("duplicate stores", store, "iput-object v${original.registerA}, v${original.registerB}, $field"),
                Triple("overwritten receiver", store, "const/4 v${original.registerB}, 0x0"),
            )
            for ((label, index, code) in cases) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(parser.definingClass).methods.single { it.name == parser.name }
                mutable.addInstructions(index, code)
                if (label == "duplicate stores" || label == "overwritten receiver") {
                    val error = assertThrows(PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }
                    assertTrue("$label: diagnostic identifies candidates", error.message.orEmpty().contains("candidates"))
                } else {
                    sanitizeSharingLinksPatch.execute(context)
                    val after = mutable.instructions()
                    val call = after.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == sanitize }
                    assertTrue("$label: sanitizer installed", call >= 0)
                    assertEquals("$label: owned field", field, after[call + 2].field())
                    assertEquals("$label: original receiver", original.registerB, (after[call + 2] as TwoRegisterInstruction).registerB)
                }
            }
        }
    }

    @Test
    fun `each declared build parses the permalink once, and the link is cleaned before it's kept`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val where = build.name
            val classes = parserClasses(build)
            val parsers = classes.flatMap { it.methods }.filter { it.isPermalinkParser() }
            assertEquals("$where: permalink parsers", 1, parsers.size)
            val parser = parsers.single()

            // Read apart from the patch: the object created after the type name, and its String field.
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val response = ((stock[created] as ReferenceInstruction).reference as TypeReference).type
            val store = (created until stock.size).first {
                stock[it].opcode == Opcode.IPUT_OBJECT && (stock[it].field()?.type == "Ljava/lang/String;")
            }
            assertEquals("$where: the String goes into the response it created", response, stock[store].field()!!.definingClass)
            val link = (stock[store] as TwoRegisterInstruction).registerA

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            sanitizeSharingLinksPatch.execute(context)

            val patched = context.mutableClassDefBy(parser.definingClass).methods
                .single { it.name == parser.name && it.parameterTypes.map(CharSequence::toString) == parser.parameterTypes.map(CharSequence::toString) }
                .instructions()
            assertEquals("$where: two instructions added", stock.size + 2, patched.size)
            val call = patched[store]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals(sanitize, (call as ReferenceInstruction).reference.toString())
            assertEquals("$where: the call reads the link", link, (call as RegisterRangeInstruction).startRegister)
            assertEquals(1, call.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, patched[store + 1].opcode)
            assertEquals("$where: the clean link replaces it", link, (patched[store + 1] as OneRegisterInstruction).registerA)
            assertEquals("$where: then the response keeps it", stock[store].field(), patched[store + 2].field())
            assertEquals("$where: one call in the parser", 1, patched.count { (it as? ReferenceInstruction)?.reference?.toString() == sanitize })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.name == "sanitizeSharingLinks" }.instructions()
            assertEquals("$where: SettingsStatus.sanitizeSharingLinks() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    @Test
    fun constructorOwnershipAndWideTypeNameWrites() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = parserClasses(build)
            val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val constructor = (created + 1 until stock.size).first { stock[it].opcode == Opcode.INVOKE_DIRECT }
            val call = (stock[constructor] as ReferenceInstruction).reference as MethodReference
            val receiver = (stock[constructor] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerC
            val store = (constructor + 1 until stock.size).first { stock[it].opcode == Opcode.IPUT_OBJECT }
            val owner = ((stock[created] as ReferenceInstruction).reference as TypeReference).type
            for (variant in listOf("wide before allocation", "wide before constructor", "unrelated constructor", "cast alias")) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(parser.definingClass).methods.single { it.name == parser.name }
                when (variant) {
                    "wide before allocation", "wide before constructor" -> {
                        mutable.replaceInstruction(typeName, "const-string v3, \"XDTPermalinkResponse\"")
                        mutable.replaceInstruction(constructor, "invoke-direct { v$receiver, v3 }, $call")
                        mutable.addInstructions(if (variant == "wide before allocation") created else constructor, "const-wide/16 v2, 0x0")
                    }
                    "unrelated constructor" -> mutable.replaceInstruction(constructor,
                        "invoke-direct { v$receiver, v${(stock[typeName] as OneRegisterInstruction).registerA} }, Lfixture/Unrelated;-><init>(Ljava/lang/String;)V")
                    else -> mutable.addInstructions(store, "check-cast v$receiver, Ljava/lang/Object;\ncheck-cast v$receiver, $owner")
                }
                if (variant == "cast alias") {
                    sanitizeSharingLinksPatch.execute(context)
                    assertEquals(1, mutable.instructions().count { (it as? ReferenceInstruction)?.reference?.toString() == sanitize })
                } else {
                    val error = assertThrows(PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }
                    assertTrue("$variant: identifies candidate refusal", error.message.orEmpty().contains("candidates"))
                }
            }
        }
    }

    private fun parserClasses(build: File): List<ClassDef> {
        val parsers = FixtureDex.classesWhere(build, { dex -> "XDTPermalinkResponse" in dex.stringSection }) {
            it.isPermalinkParser()
        }
        val allocated = parsers.flatMap { it.methods }.filter { it.isPermalinkParser() }.flatMap { it.instructions() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }.map { ((it as ReferenceInstruction).reference as TypeReference).type }.toMutableSet()
        val hierarchy = mutableMapOf<String, String?>()
        FixtureDex.forEach(build) { dex -> dex.classes.forEach { hierarchy[it.type] = it.superclass } }
        // Only the build's own classes. With StringBuilder or java.lang.Object in the set, every toString()
        // call in the APK read as a link read, and the scan below held thousands of classes.
        allocated.retainAll(hierarchy.keys)
        for (type in allocated.toList()) {
            var parent = hierarchy[type]
            while (parent != null && parent in hierarchy && allocated.add(parent)) parent = hierarchy[parent]
        }
        // The share sheet's fetch, and the post and user classes whose getters the hook calls.
        val loaded = parsers + FixtureDex.classes(build, allocated + setOf(PERMALINK_REPOSITORY, MEDIA, USER)).values
        // Copy link and the other rows that read the answer's link themselves.
        val types = allocated + loaded.filter { it.type in allocated }.flatMap { it.interfaces }
        val getters = loaded.filter { it.type in allocated }.flatMap { it.methods }.filter { method ->
            method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
                method.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.field()?.type == "Ljava/lang/String;" }
        }.map { it.name }.toSet()
        val readers = FixtureDex.classesWhere(build, { true }) { method -> method.linkReads(types, getters).isNotEmpty() }
        return (loaded + readers).distinctBy { it.type }
    }

    private fun Method.linkReads(types: Set<String>, getters: Set<String>): List<Int> {
        val body = instructions()
        return body.indices.filter { index ->
            val call = body[index].method()
            (body[index].opcode == Opcode.INVOKE_INTERFACE || body[index].opcode == Opcode.INVOKE_VIRTUAL) && call != null &&
                call.definingClass in types && call.name in getters && call.parameterTypes.isEmpty() &&
                call.returnType == "Ljava/lang/String;" && body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        }
    }

    private fun clearMatches() {
        for (fingerprint in listOf(PermalinkResponseParserFingerprint, PostLinkFetchFingerprint, PostCodeFingerprint,
            PostAuthorFingerprint, UsernameFingerprint)) fingerprint.clearMatch()
    }

    private fun Method.isPostLinkFetch(): Boolean = definingClass == PERMALINK_REPOSITORY &&
        returnType == "Ljava/lang/Object;" && parameterTypes.size == 4 && parameterTypes[1].toString() == MEDIA &&
        instructions().any { it.string() == "itas-android" }

    /** The stock shape the hook reads, found apart from the patch. */
    private class Fetch(val method: Method, val body: List<Instruction>, val reads: List<Int>, val store: Int) {
        val post get() = (body[store] as TwoRegisterInstruction).registerA
        fun link(read: Int) = (body[read + 1] as OneRegisterInstruction).registerA
    }

    private fun fetchOf(classes: List<ClassDef>): Fetch {
        val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }.instructions()
        val typeName = parser.indexOfFirst { it.string() == "XDTPermalinkResponse" }
        val created = (typeName until parser.size).first { parser[it].opcode == Opcode.NEW_INSTANCE }
        val response = ((parser[created] as ReferenceInstruction).reference as TypeReference).type
        val field = parser[(created until parser.size).first { parser[it].opcode == Opcode.IPUT_OBJECT && parser[it].field()?.type == "Ljava/lang/String;" }].field()
        val getter = classes.single { it.type == response }.methods.single { method ->
            method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
                method.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.field() == field }
        }
        val fetch = classes.flatMap { it.methods }.single { it.isPostLinkFetch() }
        val body = fetch.instructions()
        val reads = body.indices.filter {
            body[it].opcode == Opcode.INVOKE_INTERFACE && (body[it].method()?.name == getter.name) && body[it].method()?.returnType == "Ljava/lang/String;"
        }
        val store = body.indexOfLast { it.opcode == Opcode.IPUT_OBJECT && it.field()?.type == MEDIA }
        return Fetch(fetch, body, reads, store)
    }

    private fun Instruction.method(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    /** The index [index]'s branch lands on. */
    private fun List<Instruction>.target(index: Int): Int {
        var address = 0
        val at = IntArray(size) { i -> address.also { address += this[i].codeUnits } }
        return at.indexOfFirst { it == at[index] + (this[index] as OffsetInstruction).codeOffset }
    }

    /** Whether [owner]'s method [name] reads the Pando field whose name hashes to [hash]. */
    private fun List<ClassDef>.reads(owner: String, name: String, hash: Int): Boolean =
        single { it.type == owner }.methods.single { it.name == name && it.parameterTypes.isEmpty() }.instructions()
            .any { (it as? NarrowLiteralInstruction)?.narrowLiteral == hash }

    private fun Method.isPermalinkParser(): Boolean {
        if (name != "unsafeParseFromJson" || returnType != "Ljava/lang/Object;") return false
        val strings = instructions().mapNotNull { it.string() }.toSet()
        return "permalink" in strings && "XDTPermalinkResponse" in strings
    }

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}
