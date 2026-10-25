package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_NEARBY_SCAN_SCHEDULER =
    "$FOREGROUND_LOCATION->A04(Landroid/content/Context;$FB_USER_SESSION${FOREGROUND_LOCATION}J)V"
internal const val SYNTHETIC_SCAN_RESULT_READER = "LX/1fX;->A03(Z)Ljava/util/ArrayList;"
internal const val SYNTHETIC_WIFI_NAME_READER = "LX/36j;->AoL()Ljava/lang/String;"
internal const val SYNTHETIC_WIFI_BSSID_READER = "LX/AhN;->A04(Ljava/util/Map;)V"
private const val LOOP = "LX/Yxd;"
private const val WIFI_NAME = "Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;"
private const val WIFI_BSSID = "Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;"
private const val BLUETOOTH_TASK = "LX/Yoi;"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The scheduler as Messenger writes it: under the controller's lock it builds the loop's task, names it and queues it. */
private val SCHEDULER_BODY = """
    monitor-enter p2
    const-string v2, "$NEARBY_SCAN_MARK"
    new-instance v1, $LOOP
    invoke-direct {v1, p0, p1, p2}, $LOOP-><init>(Landroid/content/Context;$FB_USER_SESSION$FOREGROUND_LOCATION)V
    invoke-static {v1, v2}, LX/0zx;->A01(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;
    monitor-exit p2
    return-void
""".trimIndent()

/** The loop's task cut down to its three jobs: a location request, a Wi-Fi scan and the Bluetooth scan operation. */
private val LOOP_BODY = """
    const/4 v0, 0x0
    invoke-virtual {v0}, $WIFI_MANAGER->startScan()Z
    invoke-virtual {v0}, $BLE_OPERATION->A04()V
    return-void
""".trimIndent()

private val BLUETOOTH_BODY = """
    const/4 v0, 0x0
    invoke-virtual {v0, v0, v0, v0}, $BLE_SCANNER->startScan(Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/bluetooth/le/ScanCallback;)V
    return-void
""".trimIndent()

/** The reader as Messenger writes it: null unless Messenger may read the list, otherwise a copy of the system's scan results. */
private val READER_BODY = """
    const/4 v2, 0x0
    if-eqz p1, :denied
    const/4 v0, 0x0
    invoke-virtual {v0}, $WIFI_MANAGER->$SCAN_RESULTS()Ljava/util/List;
    move-result-object v1
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    return-object v4
    :denied
    return-object v2
""".trimIndent()

/** A network description that adds the connected network's name. */
private val WIFI_NAME_BODY = """
    const/4 v0, 0x0
    invoke-virtual {v0}, $WIFI_NAME
    move-result-object v1
    return-object v1
""".trimIndent()

/** The Wi-Fi logger as 583 writes it: the connected access point's address, read twice on two paths. */
private val WIFI_BSSID_BODY = """
    const/4 v0, 0x0
    invoke-virtual {v0}, $WIFI_BSSID
    move-result-object v2
    if-eqz v2, :other
    invoke-virtual {v0}, $WIFI_BSSID
    move-result-object v3
    :other
    return-void
""".trimIndent()

private fun wifiReaderClass(id: String, body: String) = fixtureClass(id.substringBefore("->"), listOf(fixtureMethod(id, body)))

private fun wifiReaders() = listOf(wifiReaderClass(SYNTHETIC_WIFI_NAME_READER, WIFI_NAME_BODY), wifiReaderClass(SYNTHETIC_WIFI_BSSID_READER, WIFI_BSSID_BODY))

private fun scheduler(body: String = SCHEDULER_BODY, id: String = SYNTHETIC_NEARBY_SCAN_SCHEDULER, registers: Int = 9, flags: Int = STATIC) =
    fixtureMethod(id, body, registers, flags)

private fun reader(body: String = READER_BODY, id: String = SYNTHETIC_SCAN_RESULT_READER, registers: Int = 8, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, registers, flags)

private fun readerClass(vararg methods: MutableMethod = arrayOf(reader())) = fixtureClass(methods.first().definingClass, methods.toList())

private fun task(type: String, body: String) = fixtureMethod("$type->run()V", body)

private fun bluetoothTask(type: String = BLUETOOTH_TASK, body: String = BLUETOOTH_BODY, operation: String = BLE_OPERATION) =
    fixtureClass(type, listOf(task(type, body)), interfaces = listOf("Ljava/lang/Runnable;"),
        extraFields = listOf(ImmutableField(type, "A00", operation, AccessFlags.PUBLIC.value, null, null, null)))

/** The controller with its scheduler, the task it queues, the Bluetooth scan operation's own task and the scan-result reader. */
internal fun nearbyScansFixture(
    schedulerMethod: MutableMethod? = scheduler(),
    loopBody: String = LOOP_BODY,
    bluetooth: List<MutableClass> = listOf(bluetoothTask()),
    readers: List<MutableClass> = listOf(readerClass()),
    wifi: List<MutableClass> = wifiReaders(),
): List<MutableClass> = listOf(
    fixtureClass(FOREGROUND_LOCATION, listOfNotNull(schedulerMethod)),
    fixtureClass(LOOP, listOf(task(LOOP, loopBody)), interfaces = listOf("Ljava/lang/Runnable;")),
) + bluetooth + readers + wifi

private fun Method.code() = implementation!!.instructions.toList()

/** An odd-length insertion can add or drop the nop that aligns a switch table further down, so nops don't count. */
private fun List<Instruction>.opcodes() = map { it.opcode }.filter { it != Opcode.NOP }

class NearbyScansTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(NEARBY_SCANS).map { it.hookId() }.toSet()

    @Test fun theSchedulerAndTheReaderAreFoundWhenEveryScanAndReadSitsBehindThem() {
        assertEquals(setOf(SYNTHETIC_NEARBY_SCAN_SCHEDULER, SYNTHETIC_SCAN_RESULT_READER), found(nearbyScansFixture()))
        validateControls(mirroredControls(nearbyScansFixture()), setOf(NEARBY_SCANS))
    }

    @Test fun everyProfileHooksTheSameSchedulerAndItsOwnMappingsReader() {
        for (profile in listOf(SYNTHETIC_PROFILE, BASE_PROFILE)) {
            val hooks = profile.hooks.getValue(NEARBY_SCANS)
            val readerId = hooks.single { it != SYNTHETIC_NEARBY_SCAN_SCHEDULER }
            assertEquals(setOf(SYNTHETIC_NEARBY_SCAN_SCHEDULER, readerId), hooks)
            assertTrue(readerId.endsWith("->A03(Z)Ljava/util/ArrayList;"), readerId)
            activeProfile = profile
            validateControls(mirroredControls(nearbyScansFixture(readers = listOf(readerClass(reader(id = readerId))))), setOf(NEARBY_SCANS))
        }
    }

    // The switch says it stops Messenger's scans and its reads of the Wi-Fi list. A build that scans from anywhere the
    // scheduler doesn't reach, or reads the list anywhere but the reader, would make that untrue, so it gets no hook at all.
    @Test fun aScanOrReadOutsideTheHooksOrAMissingHookLeavesTheControlUnapplied() {
        val strayWifi = fixtureClass("LX/Zzz;", listOf(task("LX/Zzz;", LOOP_BODY.replace("invoke-virtual {v0}, $BLE_OPERATION->A04()V\n", ""))))
        val strayRead = fixtureClass("LX/Zzy;", listOf(task("LX/Zzy;", "const/4 v0, 0x0\ninvoke-virtual {v0}, $WIFI_MANAGER->$SCAN_RESULTS()Ljava/util/List;\nreturn-void")))
        val readLine = "invoke-virtual {v0}, $WIFI_MANAGER->$SCAN_RESULTS()Ljava/util/List;\n"
        val cases = mapOf(
            "no scheduler" to nearbyScansFixture(schedulerMethod = null),
            "a scheduler that doesn't name its task" to nearbyScansFixture(scheduler(SCHEDULER_BODY.replace(NEARBY_SCAN_MARK, "other"))),
            "an instance scheduler" to nearbyScansFixture(scheduler(flags = AccessFlags.PUBLIC.value, registers = 10)),
            "a scheduler that queues another task" to nearbyScansFixture(scheduler(SCHEDULER_BODY.replace(LOOP, "LX/Yxe;"))),
            "two schedulers" to nearbyScansFixture().let { classes ->
                listOf(fixtureClass(FOREGROUND_LOCATION, listOf(scheduler(), scheduler(id = SYNTHETIC_NEARBY_SCAN_SCHEDULER.replace("->A04(", "->A0P(")))) ) + classes.drop(1)
            },
            "a second Wi-Fi scan elsewhere" to nearbyScansFixture() + strayWifi,
            "a second Bluetooth scan elsewhere" to nearbyScansFixture(bluetooth = listOf(bluetoothTask(), bluetoothTask("LX/Yoj;"))),
            "no Wi-Fi scan in the queued task" to nearbyScansFixture(loopBody = LOOP_BODY.replace("invoke-virtual {v0}, $WIFI_MANAGER->startScan()Z\n", "")),
            "no Bluetooth scan" to nearbyScansFixture(bluetooth = emptyList()),
            "a Bluetooth scan the queued task doesn't drive" to nearbyScansFixture(loopBody = LOOP_BODY.replace("invoke-virtual {v0}, $BLE_OPERATION->A04()V\n", "")),
            "a Bluetooth scan outside the scan operation" to nearbyScansFixture(bluetooth = listOf(bluetoothTask(operation = "LX/Other;"))),
            "no scan-result reader" to nearbyScansFixture(readers = emptyList()),
            "a second read of the scan results elsewhere" to nearbyScansFixture() + strayRead,
            "a reader that reads the list twice" to nearbyScansFixture(readers = listOf(readerClass(reader(READER_BODY.replace(readLine, readLine + readLine))))),
            "a static reader" to nearbyScansFixture(readers = listOf(readerClass(reader(READER_BODY.replace("p1", "p0"), flags = STATIC)))),
            "a reader with other parameters" to nearbyScansFixture(readers = listOf(readerClass(reader(id = "LX/1fX;->A03(I)Ljava/util/ArrayList;")))),
            "a reader that hands back another type" to nearbyScansFixture(readers = listOf(readerClass(reader(id = "LX/1fX;->A03(Z)Ljava/util/List;")))),
            // Without a null answer of its own, nothing says the callers can take one.
            "a reader that never answers null" to nearbyScansFixture(readers = listOf(readerClass(reader(READER_BODY.replace("return-object v2", "return-object v4"))))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(NEARBY_SCANS)) }
        }
    }

    @Test fun theSchedulerAsksTheSwitchBeforeItTakesItsLockOrQueuesAnything() {
        val method = scheduler()
        val before = method.code()
        injectControl(NEARBY_SCANS, mapOf(NEARBY_SCANS to listOf(method)))
        val code = method.code()
        assertEquals(Opcode.INVOKE_STATIC, code[0].opcode)
        assertEquals("$SETTINGS->stopNearbyScans()Z", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(4, code.branchTarget(2))
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        // Off, Pause and safe mode fall through to Messenger's own scheduler, lock included, unchanged.
        assertEquals(Opcode.MONITOR_ENTER, code[4].opcode)
        assertEquals(before, code.drop(4))
    }

    @Test fun theReaderAsksTheSwitchBeforeItTouchesTheWifiService() {
        val method = reader()
        val before = method.code()
        injectControl(NEARBY_SCANS, mapOf(NEARBY_SCANS to listOf(method)))
        val code = method.code()
        assertEquals(Opcode.INVOKE_STATIC, code[0].opcode)
        assertEquals("$SETTINGS->stopNearbyScans()Z", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(5, code.branchTarget(2))
        // On, it answers null, the answer it already gives without the location permission.
        assertEquals(Opcode.CONST_4, code[3].opcode)
        assertEquals(0, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN_OBJECT, code[4].opcode)
        assertEquals((code[3] as OneRegisterInstruction).registerA, (code[4] as OneRegisterInstruction).registerA)
        // Off, Pause and safe mode fall through to Messenger's own reader, unchanged.
        assertEquals(before, code.drop(5))
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // Two registers are exactly the reader's parameter words, so v0 would be the reader itself.
            "a reader with no free register" to reader("const/4 p1, 0x0\ninvoke-virtual {p0}, $WIFI_MANAGER->$SCAN_RESULTS()Ljava/util/List;\nreturn-object p1", registers = 2),
            "a reader that jumps back to its start" to reader(READER_BODY.replace("const/4 v2, 0x0\n", ":again\nconst/4 v2, 0x0\n")
                .replace("move-result-object v1\n", "move-result-object v1\nif-eqz v1, :again\n")),
            // Five registers are exactly the parameter words, so v0 would be the context.
            "no free register" to scheduler(SCHEDULER_BODY.replace("v2", "p0").replace("v1", "p1"), registers = 5),
            "a jump back to the start" to scheduler(SCHEDULER_BODY.replace("monitor-enter p2", ":again\nmonitor-enter p2")
                .replace("monitor-exit p2", "if-eqz v1, :again\nmonitor-exit p2")),
            "another method" to fixtureMethod("$FOREGROUND_LOCATION->A03(Landroid/content/Context;$FB_USER_SESSION$FOREGROUND_LOCATION)V",
                "return-void", registers = 5, flags = STATIC),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(NEARBY_SCANS, mapOf(NEARBY_SCANS to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    private fun wifiFound(classes: List<MutableClass>) = mirroredControls(classes).getValue(WIFI_IDENTITY).map { it.hookId() }.toSet()

    @Test fun everyReadOfTheConnectedNetworkOutsideWebRtcIsFound() {
        assertEquals(setOf(SYNTHETIC_WIFI_NAME_READER, SYNTHETIC_WIFI_BSSID_READER), wifiFound(nearbyScansFixture()))
        validateControls(mirroredControls(nearbyScansFixture()), setOf(NEARBY_SCANS, WIFI_IDENTITY))
        // Calls pick their network through WebRTC's own monitor, so its read stays Messenger's.
        val webRtc = wifiReaderClass("Lorg/webrtc/NetworkMonitorAutoDetect\$WifiManagerDelegate;->getWifiSSID()Ljava/lang/String;", WIFI_NAME_BODY)
        assertEquals(setOf(SYNTHETIC_WIFI_NAME_READER, SYNTHETIC_WIFI_BSSID_READER), wifiFound(nearbyScansFixture() + webRtc))
    }

    @Test fun wifiDiscoveryNeverFormatsReferencesAndRequiresTheWholeMethodSignature() {
        val unrelated = listOf(
            WIFI_NAME.replace("WifiInfo;", "OtherInfo;"),
            WIFI_NAME.replace("getSSID", "getSSIDExtra"),
            WIFI_NAME.replace("()", "(I)"),
            WIFI_NAME.replace("Ljava/lang/String;", "Ljava/lang/Object;"),
        ).mapIndexed { index, call -> wifiReaderClass("LX/Unrelated$index;->read()V",
            "const-string v1, \"unrelated\"\nconst/4 v0, 0x0\ninvoke-virtual {v0, v1}, $call\nmove-result-object v2\nreturn-void") }
        val classes = (wifiReaders() + unrelated).map { cls ->
            object : ClassDef by cls {
                override fun getMethods(): Iterable<Method> = cls.methods.map { method ->
                    object : Method by method {
                        override fun getImplementation(): MethodImplementation? = method.implementation?.let { body ->
                            object : MethodImplementation by body {
                                override fun getInstructions(): Iterable<Instruction> = body.instructions.map { instruction ->
                                    if (instruction !is ReferenceInstruction) instruction else {
                                        val ref = instruction.reference
                                        val unformatted = if (ref is MethodReference) object : MethodReference by ref {
                                            override fun toString(): String = error("Discovery formatted a method reference")
                                        } else object : Reference by ref {
                                            override fun toString(): String = error("Discovery formatted an unrelated reference")
                                        }
                                        object : ReferenceInstruction by instruction {
                                            override fun getReference(): Reference = unformatted
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        assertEquals(setOf(SYNTHETIC_WIFI_NAME_READER, SYNTHETIC_WIFI_BSSID_READER),
            findWifiIdentityReads(classes).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_WIFI_NAME_READER, SYNTHETIC_WIFI_BSSID_READER),
            app.hushmessenger.patches.CompatMirror.wifiIdentityReads(classes).map { it.hookId() }.toSet())
    }

    // A read whose answer isn't kept on the spot can't be filtered, so the switch would leave that one as it is while
    // saying it hides the network. Such a build gets no network hook at all, and patching it fails here instead.
    @Test fun aReadWhoseAnswerIsntKeptLeavesTheNetworkHalfUnapplied() {
        val dropped = wifiReaderClass("LX/Zzx;->A00()V", "const/4 v0, 0x0\ninvoke-virtual {v0}, $WIFI_NAME\nreturn-void")
        val cases = mapOf(
            "a dropped answer elsewhere" to nearbyScansFixture() + dropped,
            "no reads" to nearbyScansFixture(wifi = emptyList()),
            "a reader the profile doesn't know" to nearbyScansFixture(wifi = wifiReaders() + wifiReaderClass("LX/Zzw;->A00()Ljava/lang/String;", WIFI_NAME_BODY)),
        )
        for ((case, classes) in cases) {
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(WIFI_IDENTITY)) }
        }
        assertTrue(wifiFound(nearbyScansFixture() + dropped).isEmpty())
        // The scans half doesn't depend on it.
        validateControls(mirroredControls(nearbyScansFixture() + dropped), setOf(NEARBY_SCANS))
    }

    @Test fun eachReadHandsItsAnswerToTheExtensionWhereItsKept() {
        val method = fixtureMethod(SYNTHETIC_WIFI_BSSID_READER, WIFI_BSSID_BODY)
        val before = method.code()
        injectControl(NEARBY_SCANS, mapOf(WIFI_IDENTITY to listOf(method)))
        val code = method.code()
        for ((read, held) in listOf(1 to 2, 6 to 3)) {
            assertEquals(Opcode.INVOKE_VIRTUAL, code[read].opcode)
            assertEquals(WIFI_BSSID, (code[read] as ReferenceInstruction).reference.toString())
            assertEquals(held, (code[read + 1] as OneRegisterInstruction).registerA)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[read + 2].opcode)
            assertEquals("$SETTINGS->wifiBssid(Ljava/lang/String;)Ljava/lang/String;", (code[read + 2] as ReferenceInstruction).reference.toString())
            assertEquals(held, (code[read + 2] as RegisterRangeInstruction).startRegister)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[read + 3].opcode)
            assertEquals(held, (code[read + 3] as OneRegisterInstruction).registerA)
        }
        // The null check still sees the filtered answer, and nothing else moved.
        assertEquals(Opcode.IF_EQZ, code[5].opcode)
        assertEquals(before.opcodes(), code.filterIndexed { i, _ -> i !in setOf(3, 4, 8, 9) }.opcodes())

        val name = fixtureMethod(SYNTHETIC_WIFI_NAME_READER, WIFI_NAME_BODY)
        injectControl(NEARBY_SCANS, mapOf(WIFI_IDENTITY to listOf(name)))
        assertEquals("$SETTINGS->wifiName(Ljava/lang/String;)Ljava/lang/String;", (name.code()[3] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_OBJECT, name.code()[5].opcode)
    }

    @Test fun aMethodWithoutAKeptReadRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "a dropped answer" to fixtureMethod("LX/Zzx;->A00()V", "const/4 v0, 0x0\ninvoke-virtual {v0}, $WIFI_NAME\nreturn-void"),
            "no read" to fixtureMethod("LX/Zzx;->A01()V", "return-void"),
            "WebRTC's read" to fixtureMethod("Lorg/webrtc/NetworkMonitorAutoDetect\$WifiManagerDelegate;->getWifiSSID()Ljava/lang/String;", WIFI_NAME_BODY),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(NEARBY_SCANS, mapOf(WIFI_IDENTITY to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildFiltersEachOfItsConnectedNetworkReads() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findWifiIdentityReads(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(WIFI_IDENTITY), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(WIFI_IDENTITY to hooks), setOf(WIFI_IDENTITY))
            assertEquals(6, hooks.size, code)
            var reads = 0
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                method.injectWifiIdentity()
                val after = method.code()
                val filters = after.indices.filter { (after[it] as? ReferenceInstruction)?.reference?.toString()?.startsWith("$SETTINGS->wifi") == true }
                val sites = before.count { (it as? ReferenceInstruction)?.reference?.toString() in setOf(WIFI_NAME, WIFI_BSSID) }
                assertEquals(sites, filters.size, "${hook.hookId()} on $code")
                for (at in filters) assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at - 1].opcode, code)
                assertEquals(before.opcodes(), after.filterIndexed { i, _ -> i !in filters && i - 1 !in filters }.opcodes(), code)
                reads += sites
            }
            // Four names and five addresses on every 583 build: the diagnostics snapshot and the logger read the address twice.
            assertEquals(9, reads, code)
        }
    }

    @Test fun everySupportedBuildKeepsItsScansAndReadsBehindTheTwoHooks() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findNearbyScans(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(NEARBY_SCANS), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(NEARBY_SCANS to hooks), setOf(NEARBY_SCANS))
            assertEquals(2, hooks.size, code)
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                method.injectNearbyScans()
                assertEquals("$SETTINGS->stopNearbyScans()Z", (method.code()[0] as ReferenceInstruction).reference.toString(), code)
                // The scheduler just returns. The reader loads null first and returns that.
                val added = if (hook.isNearbyScanScheduler()) 4 else 5
                assertEquals(if (added == 4) Opcode.RETURN_VOID else Opcode.RETURN_OBJECT, method.code()[added - 1].opcode, code)
                assertEquals(before.opcodes(), method.code().drop(added).opcodes(), code)
            }
        }
    }
}
