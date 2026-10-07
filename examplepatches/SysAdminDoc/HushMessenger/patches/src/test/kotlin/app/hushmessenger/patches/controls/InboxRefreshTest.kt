package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import java.security.MessageDigest
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class InboxRefreshTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    private fun resolve(classes: List<ClassDef>, items: Method = classes.single { it.type == INBOX_SUPPLIER }.methods
        .single { it.name == "A0B" }): InboxRefreshRoute = resolveInboxRefresh(items) { type -> classes.singleOrNull { it.type == type } }

    private fun string(method: Method, index: Int = 0) =
        ((method.implementation!!.instructions.toList()[index] as ReferenceInstruction).reference as StringReference).string

    @Test fun theRouteIsTheSubscribeCallAndTheCountItsObserverSets() {
        val route = resolve(inboxRefreshClasses())
        assertEquals(INBOX_ROUTE, route)
        assertEquals("$INBOX_SUPPLIER->A04($INBOX_SUPPLIER)V|$INBOX_SUPPLIER->A00:I", route.toString())
        // The supplier's other static calls and the observer's other methods don't get in the way.
        val other = fixtureMethod("$INBOX_SUPPLIER->A05($INBOX_SUPPLIER)V", "return-void", 1,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        assertEquals(INBOX_ROUTE, resolve(listOf(inboxSupplierClass(subscribe = listOf(inboxSubscribeMethod(), other)), inboxObserverClass())))
    }

    @Test fun anyChangeToTheRouteFailsClosed() {
        val changed = mapOf(
            "supplier missing" to listOf(inboxObserverClass()),
            "supplier not final" to listOf(inboxSupplierClass(flags = AccessFlags.PUBLIC.value), inboxObserverClass()),
            "no subscribe call" to listOf(inboxSupplierClass(subscribe = emptyList()), inboxObserverClass()),
            "warning changed" to listOf(inboxSupplierClass(subscribe = listOf(inboxSubscribeMethod(warning = "folder read"))), inboxObserverClass()),
            "two subscribe calls" to listOf(inboxSupplierClass(subscribe = listOf(inboxSubscribeMethod(), inboxSubscribeMethod(name = "A05"))),
                inboxObserverClass()),
            "observer constructor changed" to listOf(inboxSupplierClass(subscribe = listOf(
                inboxSubscribeMethod(init = "<init>(Ljava/lang/Object;Ljava/lang/Object;)V"))), inboxObserverClass()),
            "observer created elsewhere" to listOf(inboxSupplierClass(subscribe = listOf(inboxSubscribeMethod(between = "const/4 v3, 0x0"))),
                inboxObserverClass()),
            "observer missing" to listOf(inboxSupplierClass()),
            "two list callbacks" to listOf(inboxSupplierClass(), inboxObserverClass(callbacks = 2)),
            "no list callback" to listOf(inboxSupplierClass(), inboxObserverClass(callbacks = 0)),
            "loaded value changed" to listOf(inboxSupplierClass(), inboxObserverClass(high = 4)),
            "empty value changed" to listOf(inboxSupplierClass(), inboxObserverClass(low = 0)),
            "comparison changed" to listOf(inboxSupplierClass(), inboxObserverClass(branch = "if-ge")),
            "second count write" to listOf(inboxSupplierClass(), inboxObserverClass(secondWrite = true)),
            "count not declared" to listOf(inboxSupplierClass(), inboxObserverClass(field = "A09")),
            "count not read by the list" to listOf(inboxSupplierClass(), inboxObserverClass(field = "A01")),
        )
        for ((change, classes) in changed) {
            assertFailsWith<PatchException>(change) { resolve(classes, inboxItemsMethod()) }
        }
    }

    @Test fun theItemsReadMustStartWithItsTraceOutsideAnyBranch() {
        for ((change, items) in mapOf(
            "trace changed" to inboxItemsMethod(trace = "ThreadListItemSupplierImplementation.getItems"),
            "start is a branch target" to inboxItemsMethod(jumpToStart = true),
            "static" to inboxItemsMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "another class" to inboxItemsMethod(id = "LX/34A;->A0B()$IMMUTABLE_LIST"),
            "takes an argument" to inboxItemsMethod(id = "$INBOX_SUPPLIER->A0B(I)$IMMUTABLE_LIST"),
        )) {
            assertFailsWith<PatchException>(change) { items.validateInboxItems() }
            assertFailsWith<PatchException>(change) { resolve(inboxRefreshClasses(), items) }
            assertFailsWith<PatchException>(change) { MutableMethod(items).injectInboxItems() }
        }
    }

    @Test fun discoveryFindsOnlyTheSuppliersTracedItemsRead() {
        assertEquals(listOf(INBOX_ITEMS_HOOK), findControls(inboxRefreshClasses()).getValue(INBOX_REFRESH_HOOK).map { it.hookId() })
        validateControls(findControls(inboxRefreshClasses()), setOf(INBOX_REFRESH_HOOK))
        for (items in listOf(
            inboxItemsMethod(trace = "ThreadListItemSupplierImplementation.getItems"),
            inboxItemsMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            inboxItemsMethod(id = "LX/34A;->A0B()$IMMUTABLE_LIST"),
        )) {
            val found = findControls(listOf(fixtureClass(items.definingClass, listOf(items))))
            assertTrue(found.getValue(INBOX_REFRESH_HOOK).isEmpty(), items.hookId())
            assertFailsWith<PatchException> { validateControls(found, setOf(INBOX_REFRESH_HOOK)) }
        }
    }

    @Test fun theHookHandsTheSupplierOverBeforeTheStockRead() {
        val items = inboxItemsMethod()
        val before = items.implementation!!.instructions.toList()
        items.injectInboxItems()
        val after = items.implementation!!.instructions.toList()
        assertEquals(before, after.drop(1))
        val call = after.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(INBOX_ITEMS_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(1, (call as RegisterRangeInstruction).registerCount)
        assertEquals(items.implementation!!.registerCount - 1, call.startRegister)
    }

    @Test fun theRouteIsWrittenOnlyIntoTheExtensionsEmptyStub() {
        val stub = inboxRefreshRouteMethod()
        stub.validateInboxRefreshStub()
        stub.writeInboxRefreshRoute(INBOX_ROUTE)
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT), stub.implementation!!.instructions.map { it.opcode })
        assertEquals(INBOX_ROUTE.toString(), string(stub))
        // A second write would mean two runs share one stub.
        assertFailsWith<PatchException> { stub.writeInboxRefreshRoute(INBOX_ROUTE) }
        for (changed in listOf(
            inboxRefreshRouteMethod("const-string v0, \"x\"\nreturn-object v0"),
            inboxRefreshRouteMethod("const/4 v0, 0x0\nreturn-object v0"),
            inboxRefreshRouteMethod("const-string v0, \"\"\nconst-string v0, \"\"\nreturn-object v0"),
            inboxRefreshRouteMethod(flags = AccessFlags.PUBLIC.value),
            fixtureMethod(INBOX_REFRESH_ROUTE.replace("inboxRefreshRoute", "other"), "const-string v0, \"\"\nreturn-object v0", 1,
                AccessFlags.STATIC.value),
        )) {
            assertFailsWith<PatchException> { changed.writeInboxRefreshRoute(INBOX_ROUTE) }
        }
    }

    @Test fun exactStockInputsResolveTheSameRouteAndKeepTheItemsRead() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val expectedHash = Files.readAllLines(Path.of("../scripts/profiles/$code.txt")).single { it.startsWith("sha256 ") }.substringAfter(' ')
            val digest = MessageDigest.getInstance("SHA-256")
            Files.newInputStream(apk).use { input -> val buffer = ByteArray(1024 * 1024); while (true) { val n = input.read(buffer); if (n < 0) break; digest.update(buffer, 0, n) } }
            assertEquals(expectedHash, digest.digest().joinToString("") { "%02x".format(it) })
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val byType = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
            // Discovery of this hook reads only the supplier's own class. The route resolves against the whole app.
            val discovered = findControls(listOf(byType.getValue(INBOX_SUPPLIER)))
            validateControls(discovered, setOf(INBOX_REFRESH_HOOK))
            val native = discovered.getValue(INBOX_REFRESH_HOOK).single()
            assertEquals(INBOX_ROUTE, resolveInboxRefresh(native) { byType[it] }, code)
            val items = MutableMethod(native)
            val before = items.implementation!!.instructions.toList()
            val tries = items.implementation!!.tryBlocks.map { it.startCodeAddress to it.codeUnitCount }
            items.injectInboxItems()
            val after = items.implementation!!.instructions.toList()
            assertEquals(before, after.drop(1), code)
            assertEquals(tries.map { (start, count) -> start + after.first().codeUnits to count },
                items.implementation!!.tryBlocks.map { it.startCodeAddress to it.codeUnitCount }, code)
        }
    }
}
