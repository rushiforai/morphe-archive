package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertSame
import kotlin.test.assertTrue

class NativeBubblesTest {
    @AfterTest fun reset() { activeProfile = BASE_PROFILE }

    @Test fun allFiveMappingsPreserveTheAccountAndSdkGuards() {
        for (profile in controlProfiles.values.toSet()) {
            activeProfile = profile
            val eligibility = bubbleEligibilityMethod()
            val mode = nativeBubbleModeMethod()
            val capability = nativeBubbleRoutesMethod()
            val oldEligibility = eligibility.implementation!!.instructions.toList()
            val oldMode = mode.implementation!!.instructions.toList()
            injectNativeBubbles(eligibility, mode, capability, true)

            val a = eligibility.implementation!!.instructions.toList()
            assertEquals("$SETTINGS->enableBubbles()Z", (a[0] as ReferenceInstruction).reference.toString())
            assertEquals(5, a.branchTarget(2))
            assertEquals(oldEligibility, a.drop(5))
            val c = mode.implementation!!.instructions.toList()
            assertEquals("$SETTINGS->forceChatHeads()Z", (c[0] as ReferenceInstruction).reference.toString())
            assertEquals(5, c.branchTarget(2))
            assertEquals(profile.bubbleCapabilityGetter, (c[16] as ReferenceInstruction).reference.toString())
            assertEquals(BUBBLE_ROLLOUT, (c[24] as WideLiteralInstruction).wideLiteral)
            assertEquals(profile.bubbleRolloutGetter, (c[26] as ReferenceInstruction).reference.toString())
            assertEquals("$SETTINGS->nativeBubbleRollout(Z)Z", (c[28] as ReferenceInstruction).reference.toString())
            assertEquals(listOf(31, 31), listOf(c.branchTarget(9), c.branchTarget(18)))
            assertSame(oldMode[23], c[30])
            assertSame(oldMode[24], c[31])
            assertEquals(2, (c[31] as OneRegisterInstruction).registerA)
            assertEquals(oldMode, c.drop(5).take(23) + c.drop(30))
            assertEquals(1L, (capability.implementation!!.instructions.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun rejected(eligibility: MutableMethod = bubbleEligibilityMethod(), mode: MutableMethod = nativeBubbleModeMethod(),
                         capability: MutableMethod = nativeBubbleRoutesMethod()) {
        val targets = listOf(eligibility, mode, capability)
        val before = targets.map { it.implementation!!.instructions.toList() }
        assertFailsWith<PatchException> { injectNativeBubbles(eligibility, mode, capability, true) }
        assertEquals(before, targets.map { it.implementation!!.instructions.toList() })
    }

    @Test fun changedCapabilitiesRolloutFlagsAndReturnsFailBeforeAnyEdit() {
        for ((at, instruction) in listOf(
            10 to "const/16 v0, 0x1b",
            11 to "invoke-virtual {v1, p1, v0}, LX/1hy;->A04(${BUBBLE_SESSION}I)Z",
            11 to "invoke-virtual {v1, p1, v2}, ${BASE_PROFILE.bubbleCapabilityGetter}",
            19 to "const-wide v0, ${BUBBLE_ROLLOUT + 1}L",
            21 to "invoke-interface {v2, v0, v1}, Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;->Wrong(J)Z",
            23 to "return v2",
            24 to "return v0",
        )) rejected(mode = nativeBubbleModeMethod().apply { replaceInstruction(at, instruction) })
        rejected(eligibility = bubbleEligibilityMethod().apply { replaceInstruction(1, "const/16 v0, 0x1d") })
        rejected(eligibility = bubbleEligibilityMethod().apply { replaceInstruction(14, "return v1") })
    }

    @Test fun aLateCompiledCapabilityFailureCannotLeaveEitherHostTargetEdited() {
        rejected(capability = nativeBubbleRoutesMethod("const/4 v0, 0x1\nreturn v0"))
        rejected(capability = fixtureMethod(NATIVE_BUBBLE_ROUTES, "const/4 v0, 0x0\nreturn v1", 2,
            com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or com.android.tools.smali.dexlib2.AccessFlags.STATIC.value))
    }

    @Test fun discoveryRejectsAChangedFlagAndValidationRejectsAnAmbiguousGate() {
        val mode = nativeBubbleModeMethod()
        fun found(vararg methods: MutableMethod) = findControls(listOf(fixtureClass(mode.definingClass, methods.toList())))
        assertEquals(listOf(mode.hookId()), found(mode).getValue("bubble_mode").map { it.hookId() })
        assertTrue(found(nativeBubbleModeMethod().apply {
            replaceInstruction(19, "const-wide v0, ${BUBBLE_ROLLOUT + 1}L")
        }).getValue("bubble_mode").isEmpty())
        // DEX class definitions deduplicate identical signatures, so ambiguity needs a distinct method.
        val duplicate = MutableMethod(ImmutableMethod(mode.definingClass, "anotherBubbleMode", mode.parameters,
            mode.returnType, mode.accessFlags, null, null, mode.implementation))
        val ambiguous = found(mode, duplicate)
        assertEquals(2, ambiguous.getValue("bubble_mode").size)
        assertFailsWith<PatchException> { validateControls(ambiguous, setOf("bubble_mode")) }
    }

    @Test fun the581RolloutSpecifierIsTheOnlyOtherAcceptedFlagAndIsPatchedTheSameWay() {
        val mode = nativeBubbleModeMethod().apply { replaceInstruction(19, "const-wide v0, ${BUBBLE_ROLLOUT_581}L") }
        assertEquals(listOf(mode.hookId()), findControls(listOf(fixtureClass(mode.definingClass, listOf(mode))))
            .getValue("bubble_mode").map { it.hookId() })
        val before = mode.implementation!!.instructions.toList()
        injectNativeBubbles(bubbleEligibilityMethod(), mode, nativeBubbleRoutesMethod(), true)
        val c = mode.implementation!!.instructions.toList()
        assertEquals(BUBBLE_ROLLOUT_581, (c[24] as WideLiteralInstruction).wideLiteral)
        assertEquals("$SETTINGS->nativeBubbleRollout(Z)Z", (c[28] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(31, 31), listOf(c.branchTarget(9), c.branchTarget(18)))
        assertEquals(before, c.drop(5).take(23) + c.drop(30))
        rejected(mode = nativeBubbleModeMethod().apply { replaceInstruction(19, "const-wide v0, ${BUBBLE_ROLLOUT_581 + 1}L") })
    }

    @Test fun absentNativeRoutesLeaveAllStockGatesAndTheCompiledCapabilityUntouched() {
        val targets = listOf(bubbleEligibilityMethod(), nativeBubbleModeMethod(), nativeBubbleRoutesMethod())
        val before = targets.map { it.implementation!!.instructions.toList() }
        injectNativeBubbles(targets[0], targets[1], targets[2], false)
        assertEquals(before, targets.map { it.implementation!!.instructions.toList() })
    }

    private fun manifest(entry: String = "activity", attributes: String = "", extra: String = ""): Document {
        val xml = """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
            <$entry android:name="$BUBBLE_ACTIVITY" android:exported="false" android:allowEmbedded="true"
                android:resizeableActivity="true" $attributes/>$extra</application></manifest>"""
        return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(ByteArrayInputStream(xml.toByteArray()))
    }

    @Test fun onlyADirectEnabledEmbeddedResizableNativeActivityQualifies() {
        assertTrue(manifest().hasNativeBubbleActivity())
        assertFalse(manifest("activity-alias").hasNativeBubbleActivity())
        for (attributes in listOf("android:enabled=\"false\"", "android:process=\":bubbles\"", "android:permission=\"private\""))
            assertFalse(manifest(attributes = attributes).hasNativeBubbleActivity())
        assertFalse(manifest(extra = "<activity-alias android:name=\"$BUBBLE_ACTIVITY\"/>").hasNativeBubbleActivity())
        for (name in listOf("allowEmbedded", "resizeableActivity")) {
            val doc = manifest()
            (doc.getElementsByTagName("activity").item(0) as org.w3c.dom.Element).setAttribute("android:$name", "false")
            assertFalse(doc.hasNativeBubbleActivity())
        }
    }

    @Test fun theInstallMarkerIsNotAFeatureAndAnExistingMarkerFailsPreflight() {
        val doc = manifest()
        doc.requireNativeBubbleRoutesAbsent()
        doc.addNativeBubbleRoutesMetadata()
        val marker = doc.getElementsByTagName("meta-data").item(0) as org.w3c.dom.Element
        assertEquals(NATIVE_BUBBLE_METADATA, marker.getAttribute("android:name"))
        assertEquals("true", marker.getAttribute("android:value"))
        assertFailsWith<PatchException> { doc.requireNativeBubbleRoutesAbsent() }
        assertFailsWith<PatchException> { doc.addNativeBubbleRoutesMetadata() }
        assertEquals(1, doc.getElementsByTagName("meta-data").length)
    }

    private val shortcutBuilder = "Landroid/content/pm/ShortcutInfo${'$'}Builder;"
    private val notificationBuilder = "Landroid/app/Notification${'$'}Builder;"
    private val metadata = "Landroid/app/Notification${'$'}BubbleMetadata;"
    private val compatMetadata = "Lfixture/Metadata;"
    private val container = "Lfixture/Container;"
    private val thread = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
    private val shortcut = "Landroid/content/pm/ShortcutInfo;"
    private val pending = "Landroid/app/PendingIntent;"
    private val field = "Lfixture/Notification;->bubble:$compatMetadata"
    private val idField = "Lfixture/Notification;->shortcut:Ljava/lang/String;"
    private val create = "Lfixture/Shortcut;->create(Landroid/content/Context;Landroid/graphics/Bitmap;${thread}Ljava/lang/String;)$container"
    private val updated = "Lfixture/Shortcut;->updated(Landroid/content/Context;Landroid/graphics/Bitmap;${thread}Ljava/lang/String;Z)$container"
    private val attach = "Lfixture/Attach;->attach(Landroid/graphics/Bitmap;Lfixture/Notification;${BUBBLE_SESSION}${container}Lfixture/Summary;Lfixture/Trace;Lfixture/Push;Z)V"

    private fun routes(longLived: Int = 1, gate: String = BASE_PROFILE.hooks.getValue("bubble_mode").single(),
                       shortcutIdApi: Boolean = true, alternate: Boolean = false,
                       changed: String? = null, from: String = "", to: String = ""): List<com.android.tools.smali.dexlib2.iface.ClassDef> {
        fun method(id: String, body: String, registers: Int = 8, static: Boolean = false): MutableMethod {
            val code = body.trimIndent()
            if (id == changed) assertTrue(from in code, "The rejection fixture must change an existing instruction")
            return fixtureMethod(id, if (id == changed) code.replace(from, to) else code, registers,
                AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0)
        }
        val shortcutCode = """
            const/4 v1, $longLived
            const-string v0, "thread_shortcut_"
            new-instance v2, $shortcutBuilder
            invoke-direct {v2, p1, p4}, $shortcutBuilder-><init>(Landroid/content/Context;Ljava/lang/String;)V
            invoke-static {}, Lfixture/Shortcut;->person()Landroid/app/Person;
            move-result-object v0
            invoke-virtual {v2, v1}, $shortcutBuilder->setLongLived(Z)$shortcutBuilder
            invoke-virtual {v2, v0}, $shortcutBuilder->setPerson(Landroid/app/Person;)$shortcutBuilder
            invoke-static {}, Lfixture/Shortcut;->intent()Landroid/content/Intent;
            move-result-object v0
            invoke-virtual {v2, v0}, $shortcutBuilder->setIntent(Landroid/content/Intent;)$shortcutBuilder
            invoke-virtual {v2}, $shortcutBuilder->build()$shortcut
            move-result-object v0
            new-instance v2, $container
            invoke-direct {v2, v0, p3}, $container-><init>($shortcut$thread)V
            return-object v2
        """.trimIndent()
        val called = if (alternate) updated else create
        val call = if (alternate) "invoke-virtual/range {v0 .. v5}, $called" else "invoke-virtual {v0, v1, v2, v3, v4}, $called"
        return listOf(
        fixtureClass("L${BUBBLE_ACTIVITY.replace('.', '/')};", listOf(fixtureMethod(
            "L${BUBBLE_ACTIVITY.replace('.', '/')};->onPostResume()V", "invoke-virtual {v0, v1}, $gate\nreturn-void")),
            superclass = "Lcom/facebook/messaging/msys/thread/fragment/MsysThreadViewActivity;"),
        fixtureClass("Lfixture/Shortcut;", listOf(method(create, shortcutCode),
            method(updated, shortcutCode.replace("thread_shortcut_", "updated"), 9),
            method("Lfixture/Shortcut;->person()Landroid/app/Person;", "new-instance v0, Landroid/app/Person;\nreturn-object v0", static = true),
            method("Lfixture/Shortcut;->intent()Landroid/content/Intent;", "new-instance v0, Landroid/content/Intent;\nreturn-object v0", static = true))),
        fixtureClass("Lfixture/Attach;", listOf(method(attach, """
            const-string v0, "shouldAttachBubbleMetadataToNotification"
            const-string v0, "attach_bubble_metadata"
            invoke-virtual {v0, p3}, $gate
            invoke-static {p4}, Lfixture/Factory;->make($container)Lfixture/Pack;
            move-result-object v0
            invoke-virtual {v0}, Lfixture/Pack;->pack()$compatMetadata
            move-result-object v0
            iput-object v0, p2, $field
            return-void
        """, 10), method("Lfixture/Attach;->publish(Lfixture/Notification;)$container", """
            $call
            move-result-object v0
            iget-object v1, v0, $container->info:$shortcut
            invoke-virtual {v1}, $shortcut->getId()Ljava/lang/String;
            move-result-object v1
            iput-object v1, p1, $idField
            return-object v0
        """), method("Lfixture/Attach;->arrive()V", """
            new-instance v2, Lfixture/Notification;
            invoke-virtual {v0, v2}, Lfixture/Attach;->publish(Lfixture/Notification;)$container
            move-result-object v4
            invoke-virtual/range {v0 .. v8}, $attach
            invoke-virtual {v2}, Lfixture/Notification;->build()Landroid/app/Notification;
            move-result-object v0
            return-void
        """, 10))),
        fixtureClass("Lfixture/Conversation;", listOf(method("Lfixture/Conversation;->notify()V", """
            $call
            move-result-object v2
            iget-object v1, v2, $container->info:$shortcut
            invoke-virtual {v0, v1}, Landroid/content/pm/ShortcutManager;->pushDynamicShortcut($shortcut)V
            new-instance v3, Lfixture/Notification;
            new-instance v4, Landroidx/core/app/NotificationCompat${'$'}MessagingStyle;
            invoke-virtual {v3, v4}, Lfixture/Notification;->style(Landroidx/core/app/NotificationCompat${'$'}MessagingStyle;)V
            invoke-static {v2}, Lfixture/Factory;->make($container)Lfixture/Pack;
            move-result-object v0
            invoke-virtual {v0}, Lfixture/Pack;->pack()$compatMetadata
            move-result-object v0
            iput-object v0, v3, $field
            iget-object v1, v2, $container->info:$shortcut
            invoke-virtual {v1}, $shortcut->getId()Ljava/lang/String;
            move-result-object v1
            iput-object v1, v3, $idField
            return-void
        """))),
        fixtureClass("Lfixture/Notification;", listOf(method("Lfixture/Notification;->build()Landroid/app/Notification;", """
            new-instance v0, Lfixture/Bridge;
            invoke-direct {v0, p0}, Lfixture/Bridge;-><init>(Lfixture/Notification;)V
            iget-object v0, v0, Lfixture/Bridge;->builder:$notificationBuilder
            invoke-virtual {v0}, $notificationBuilder->build()Landroid/app/Notification;
            move-result-object v0
            return-object v0
        """))),
        fixtureClass(container, listOf(method("$container-><init>($shortcut$thread)V", """
            iput-object p1, p0, $container->info:$shortcut
            iput-object p2, p0, $container->thread:$thread
            return-void
        """))),
        fixtureClass("Lfixture/Factory;", listOf(method("Lfixture/Factory;->make($container)Lfixture/Pack;", """
            iget-object v1, p0, $container->thread:$thread
            invoke-static {v1}, Lfixture/Factory;->pending($thread)$pending
            move-result-object v1
            new-instance v2, Lfixture/Pack;
            iput-object v1, v2, Lfixture/Pack;->intent:$pending
            return-object v2
        """, 4, static = true), method("Lfixture/Factory;->pending($thread)$pending", "new-instance v0, $pending\nreturn-object v0", static = true))),
        fixtureClass("Lfixture/Pack;", listOf(method("Lfixture/Pack;->pack()$compatMetadata", """
            iget-object v1, p0, Lfixture/Pack;->intent:$pending
            new-instance v0, $compatMetadata
            invoke-direct {v0, v1}, $compatMetadata-><init>($pending)V
            return-object v0
        """))),
        fixtureClass(compatMetadata, listOf(method("$compatMetadata-><init>($pending)V", "iput-object p1, p0, $compatMetadata->intent:$pending\nreturn-void"),
            method("$compatMetadata->convert($compatMetadata)$metadata", """
                iget-object v1, p0, $compatMetadata->intent:$pending
                new-instance v0, ${metadata.dropLast(1)}${'$'}Builder;
                invoke-direct {v0, v1, v2}, ${metadata.dropLast(1)}${'$'}Builder;-><init>(${pending}Landroid/graphics/drawable/Icon;)V
                invoke-virtual {v0}, ${metadata.dropLast(1)}${'$'}Builder;->build()$metadata
                move-result-object v0
                return-object v0
            """, 4, static = true))),
        fixtureClass("Lfixture/Bridge;", listOf(method("Lfixture/Bridge;-><init>(Lfixture/Notification;)V", """
            new-instance v0, $notificationBuilder
            iput-object v0, p0, Lfixture/Bridge;->builder:$notificationBuilder
            iget-object v0, p0, Lfixture/Bridge;->builder:$notificationBuilder
            iget-object v1, p1, $idField
            ${if (shortcutIdApi) "invoke-virtual {v0, v1}, $notificationBuilder->setShortcutId(Ljava/lang/String;)$notificationBuilder" else "nop"}
            iget-object v1, p1, $field
            invoke-static {v1}, $compatMetadata->convert($compatMetadata)$metadata
            move-result-object v1
            invoke-static {v1, v0}, Lfixture/Bridge;->apply($metadata$notificationBuilder)V
            return-void
        """), method("Lfixture/Bridge;->apply($metadata$notificationBuilder)V", """
            invoke-virtual {p1, p0}, $notificationBuilder->setBubbleMetadata($metadata)$notificationBuilder
            return-void
        """, 2, static = true))),
        )
    }

    @Test fun metadataShortcutAndMessagingStyleMustConnectToTheNativeActivity() {
        val gate = BASE_PROFILE.hooks.getValue("bubble_mode").single()
        val valid = routes()
        assertNotNull(findNativeBubbleRoutes(valid, gate))
        for (removed in valid.indices) assertNull(findNativeBubbleRoutes(valid.filterIndexed { at, _ -> at != removed }, gate))
        assertNull(findNativeBubbleRoutes(routes(longLived = 0), gate))
        assertNull(findNativeBubbleRoutes(routes(gate = gate.replace("A01", "A99")), gate))
        assertNull(findNativeBubbleRoutes(routes(shortcutIdApi = false), gate))
        assertNull(findNativeBubbleRoutes(valid + valid[1], gate))
    }

    @Test fun verifiedShortcutOverloadsShareTheReturnedContainerContract() {
        val gate = BASE_PROFILE.hooks.getValue("bubble_mode").single()
        assertNotNull(findNativeBubbleRoutes(routes(alternate = true), gate))
        assertNull(findNativeBubbleRoutes(routes(alternate = true, changed = updated,
            from = "const/4 v1, 1", to = "const/4 v1, 0"), gate))
    }

    @Test fun aStaticGateHelperCountsOnlyWhenItReturnsTheGateForThePassedSession() {
        val gate = BASE_PROFILE.hooks.getValue("bubble_mode").single()
        val helper = "Lfixture/Gate;->read(${BUBBLE_SESSION}Lfixture/Lazy;)Z"
        val body = """
            iget-object v0, p1, Lfixture/Lazy;->A00:Lfixture/Provider;
            invoke-interface {v0}, Lfixture/Provider;->get()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, ${gate.substringBefore("->")}
            invoke-virtual {v0, p0}, $gate
            move-result v0
            return v0
        """.trimIndent()
        fun helperRoutes(code: String) = routes(changed = attach, from = "invoke-virtual {v0, p3}, $gate",
            to = "invoke-static {p3, v0}, $helper") + fixtureClass("Lfixture/Gate;",
            listOf(fixtureMethod(helper, code, 3, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))
        val direct = findNativeBubbleRoutes(routes(), gate)
        assertNotNull(direct)
        assertEquals(direct, findNativeBubbleRoutes(helperRoutes(body), gate))
        for ((from, to) in listOf(
            "invoke-virtual {v0, p0}, $gate" to "invoke-virtual {v0, p0}, ${gate.replace("A01", "A99")}",
            "invoke-virtual {v0, p0}" to "invoke-virtual {v0, v0}",
            "check-cast v0, ${gate.substringBefore("->")}" to "check-cast v0, Lfixture/Other;",
            "Lfixture/Provider;->get()" to "Lfixture/Other;->get()",
            "return v0" to "const/4 v0, 0x1\nreturn v0",
        )) {
            assertTrue(from in body, "The rejection fixture must change an existing instruction")
            assertNull(findNativeBubbleRoutes(helperRoutes(body.replace(from, to)), gate))
        }
    }

    @Test fun aCaughtPackingFailureCannotOmitTheNullValueAtTheJoin() {
        val body = fixtureMethod(attach, """
            const-string v0, "shouldAttachBubbleMetadataToNotification"
            const-string v0, "attach_bubble_metadata"
            invoke-virtual {v0, p3}, ${BASE_PROFILE.hooks.getValue("bubble_mode").single()}
            invoke-static {p4}, Lfixture/Factory;->make($container)Lfixture/Pack;
            move-result-object v0
            const/4 v1, 0
            invoke-virtual {v0}, Lfixture/Pack;->pack()$compatMetadata
            move-result-object v1
            goto :write
            move-exception v0
            goto :write
            :write
            iput-object v1, p2, $field
            return-void
        """.trimIndent(), 10)
        val code = body.implementation!!.instructions.toList()
        val start = code.take(6).sumOf { it.codeUnits }
        val end = code.take(8).sumOf { it.codeUnits }
        val handler = code.take(9).sumOf { it.codeUnits }
        val caught = MutableMethod(ImmutableMethod(body.definingClass, body.name, body.parameters, body.returnType,
            body.accessFlags, null, null, ImmutableMethodImplementation(10, code,
                listOf(ImmutableTryBlock(start, end - start, listOf(ImmutableExceptionHandler("Ljava/lang/Throwable;", handler)))), null)))
        val invalid = routes().map { cls -> if (cls.type != body.definingClass) cls else
            fixtureClass(cls.type, cls.methods.map { if (it.hookId() == attach) caught else it }.toList()) }
        val before = invalid.flatMap { it.methods.toList() }.map { it.implementation!!.instructions.toList() }
        assertNull(findNativeBubbleRoutes(invalid, BASE_PROFILE.hooks.getValue("bubble_mode").single()))
        assertEquals(before, invalid.flatMap { it.methods.toList() }.map { it.implementation!!.instructions.toList() })
    }

    @Test fun nullAndDisconnectedValuesRejectRoutesBeforeAnyMutation() {
        val gate = BASE_PROFILE.hooks.getValue("bubble_mode").single()
        val cases = listOf(
            Triple(create, "invoke-virtual {v2, v0}, $shortcutBuilder->setPerson", "const/4 v0, 0\ninvoke-virtual {v2, v0}, $shortcutBuilder->setPerson"),
            Triple(create, "invoke-virtual {v2, v0}, $shortcutBuilder->setIntent", "const/4 v0, 0\ninvoke-virtual {v2, v0}, $shortcutBuilder->setIntent"),
            Triple(create, "invoke-virtual {v2}, $shortcutBuilder->build", "new-instance v2, $shortcutBuilder\ninvoke-virtual {v2}, $shortcutBuilder->build"),
            Triple(attach, "iput-object v0, p2, $field", "const/4 v0, 0\niput-object v0, p2, $field"),
            Triple(attach, "invoke-static {p4}", "invoke-static {v0}"),
            Triple("Lfixture/Conversation;->notify()V", "iput-object v1, v3, $idField", "const/4 v1, 0\niput-object v1, v3, $idField"),
            Triple("Lfixture/Conversation;->notify()V", "invoke-static {v2}, Lfixture/Factory;", "invoke-static {v3}, Lfixture/Factory;"),
            Triple("Lfixture/Conversation;->notify()V", "new-instance v4, Landroidx/core/app/NotificationCompat${'$'}MessagingStyle;", "const-class v4, Landroidx/core/app/NotificationCompat${'$'}MessagingStyle;"),
            Triple("Lfixture/Attach;->publish(Lfixture/Notification;)$container", "return-object v0", "const/4 v0, 0\nreturn-object v0"),
            Triple("Lfixture/Attach;->arrive()V", "invoke-virtual {v2}, Lfixture/Notification;->build", "invoke-virtual {v3}, Lfixture/Notification;->build"),
            Triple("Lfixture/Factory;->make($container)Lfixture/Pack;", "iput-object v1, v2, Lfixture/Pack;->intent", "const/4 v1, 0\niput-object v1, v2, Lfixture/Pack;->intent"),
            Triple("Lfixture/Pack;->pack()$compatMetadata", "return-object v0", "const/4 v0, 0\nreturn-object v0"),
            Triple("$compatMetadata->convert($compatMetadata)$metadata", "return-object v0", "const/4 v0, 0\nreturn-object v0"),
            Triple("Lfixture/Notification;->build()Landroid/app/Notification;", "return-object v0", "const/4 v0, 0\nreturn-object v0"),
            Triple("Lfixture/Bridge;-><init>(Lfixture/Notification;)V", "iput-object v0, p0, Lfixture/Bridge;->builder", "const/4 v0, 0\niput-object v0, p0, Lfixture/Bridge;->builder"),
            Triple("Lfixture/Bridge;-><init>(Lfixture/Notification;)V", "invoke-virtual {v0, v1}, $notificationBuilder->setShortcutId", "const/4 v1, 0\ninvoke-virtual {v0, v1}, $notificationBuilder->setShortcutId"),
            Triple("Lfixture/Bridge;->apply($metadata$notificationBuilder)V", "invoke-virtual {p1, p0}", "const/4 p0, 0\ninvoke-virtual {p1, p0}"),
        )
        for ((id, from, to) in cases) {
            val invalid = routes(changed = id, from = from, to = to)
            val methods = invalid.flatMap { it.methods.toList() }
            val before = methods.map { it.implementation!!.instructions.toList() }
            assertNull(findNativeBubbleRoutes(invalid, gate), id)
            assertEquals(before, methods.map { it.implementation!!.instructions.toList() })
            val targets = listOf(bubbleEligibilityMethod(), nativeBubbleModeMethod(), nativeBubbleRoutesMethod())
            val stock = targets.map { it.implementation!!.instructions.toList() }
            injectNativeBubbles(targets[0], targets[1], targets[2], false)
            assertEquals(stock, targets.map { it.implementation!!.instructions.toList() })
        }
    }
}
