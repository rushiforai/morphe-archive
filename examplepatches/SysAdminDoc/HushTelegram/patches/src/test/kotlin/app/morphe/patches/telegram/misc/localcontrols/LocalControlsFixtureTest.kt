/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.localcontrols

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.commerce.COMMERCE
import app.morphe.patches.telegram.misc.commerce.hideCommercePatch
import app.morphe.patches.telegram.misc.doubletap.*
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.ids.*
import app.morphe.patches.telegram.misc.paste.*
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import org.junit.Assert.*
import org.junit.AfterClass
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

class LocalControlsFixtureTest {
    @Test fun `normal paste changes only the action operand before the complete stock editor`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val sites = context.resolveNormalPaste()
            val originals = sites.associate { key(it.method) to ImmutableMethod.of(it.method) }
            // The patch also hooks the entities method for Mention by ID; MentionByIdFixtureTest checks that body.
            val mention = context.resolveMentionById().method
            val untouched = hostState(build, context, sites.map { it.method }.toSet() + mention)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { useNormalPastePatch.execute(context) })
            assertTrue("${build.name}: Mention by ID hook", mention.controlBody().any { it.controlRef() == ADD_MENTIONS })
            for (site in sites) {
                val body = site.method.controlBody()
                assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT), body.take(2).map { it.opcode })
                assertEquals("$NORMAL_PASTE->contextMenuAction(Landroid/view/View;I)I", body[0].controlRef())
                assertEquals(listOf(site.method.implementation!!.registerCount - 2, site.method.implementation!!.registerCount - 1), body[0].namedRegisters())
                assertEquals(listOf(site.method.implementation!!.registerCount - 1), body[1].namedRegisters())
                assertStock(build.name, originals.getValue(key(site.method)), site.method, 0, 2)
            }
            assertEquals("${build.name}: clipboard ancestors, image handling and other host methods", untouched,
                hostState(build, context, sites.map { it.method }.toSet() + mention))
            flags(context, PASTE_FLAGS, true)
            flags(context, ID_FLAGS + REACTION_FLAGS, false)
        }
    }

    @Test fun `double tap gates only the two reaction gestures and retains zoom and explicit menus`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val sites = context.resolveDoubleTapReactions()
            assertEquals("no gesture state", 0, context.tgMutableClassDefBy(DOUBLE_TAP_REACTIONS).fields.size)
            val originals = sites.associate { key(it.method) to ImmutableMethod.of(it.method) }
            val untouched = hostState(build, context, sites.map { it.method }.toSet())
            // The emoji pack line's own class is outside this slice (HideReactionsFixtureTest covers that switch),
            // so only its "not built by one class" report is expected, and only while no host loads the line's text.
            val packLineAbsent = hosts(build).none { cls -> cls.methods.any { m -> m.controlBody().any { it.controlString() == EMOJI_PACK_PLURAL } } }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableDoubleTapReactionsPatch.execute(context) }.filterNot { "reaction rows switch" in it || "reaction picker switch" in it || "what TalkBack reads" in it ||
                (packLineAbsent && "the emoji pack line is no longer built by one class" in it) })
            for (site in sites) {
                val body = site.method.controlBody()
                val extra = if (site.method.origReturnType == "V") 4 else 5
                assertEquals("$DOUBLE_TAP_REACTIONS->stopReaction()Z", body[0].controlRef())
                assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ), body.take(3).map { it.opcode })
                assertEquals(setOf(3, extra), ControlFlow.of(site.method).normal[2].toSet())
                if (extra == 4) assertEquals(Opcode.RETURN_VOID, body[3].opcode)
                else assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), body.subList(3, 5).map { it.opcode })
                assertStock(build.name, originals.getValue(key(site.method)), site.method, 0, extra)
            }
            assertEquals("${build.name}: stock scrolling, eligibility, selection, zoom and explicit reaction sinks", untouched,
                hostState(build, context, sites.map { it.method }.toSet()))
            flags(context, REACTION_FLAGS, true)
            flags(context, PASTE_FLAGS + ID_FLAGS, false)
        }
    }

    @Test fun `profile inspection reads only proven local IDs before the stock menu visibility refresh`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveLocalIds()
            // Special contacts' two hooks go in with the IDs; SpecialContactsFixtureTest holds them to the stock code.
            val special = context.resolveSpecialContacts().first!!
            val hooked = setOf(plan.method, special.putUser, special.updates)
            val stock = ImmutableMethod.of(plan.method)
            val untouched = hostState(build, context, hooked)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { showLocalIdsPatch.execute(context) })
            assertStock(build.name, stock, plan.method, plan.index, 5)
            val inserted = plan.method.controlBody().subList(plan.index, plan.index + 5)
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_WIDE, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC_RANGE), inserted.map { it.opcode })
            assertEquals(listOf(plan.user.toString(), plan.chat.toString(), plan.menu.toString()), inserted.subList(1, 4).map { it.controlRef() })
            assertEquals("$LOCAL_IDS->addToProfile(Landroid/view/View;JJ)V", inserted.last().controlRef())
            val add = context.tgMutableClassDefBy(LOCAL_IDS).methods.single { it.origName == "nativeAddRow" }.controlBody()
            // 13.2 inlines R, so the icon id loads as a const; the next line still pins which id.
            val icon = if (add.getOrNull(2)?.opcode == Opcode.CONST) Opcode.CONST else Opcode.SGET
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.CONST, icon, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), add.map { it.opcode })
            assertEquals(LOCAL_ID_ROW.toLong(), (add[1] as WideLiteralInstruction).wideLiteral)
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_copy:I", add[2].controlRef())
            assertEquals(plan.addRow.toString(), add[3].controlRef())
            val dismiss = context.tgMutableClassDefBy(LOCAL_IDS).methods.single { it.origName == "nativeDismiss" }.controlBody()
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID), dismiss.map { it.opcode })
            assertEquals(plan.dismiss.toString(), dismiss[1].controlRef())
            assertFalse((inserted + add + dismiss).any { it.controlRef()?.contains("access_hash") == true || it.call()?.origName == "sendRequest" })
            assertEquals("${build.name}: local row leaves all server, opening and stock menu methods intact", untouched,
                hostState(build, context, hooked))
            assertEquals("$SPECIAL_CONTACTS->user(Ljava/lang/Object;Ljava/lang/Object;I)V", special.putUser.controlBody().first().controlRef())
            assertEquals("$SPECIAL_CONTACTS->updates(Ljava/lang/Object;Ljava/lang/Object;)V", special.updates.controlBody().first().controlRef())
            flags(context, ID_FLAGS + "specialContacts", true)
            flags(context, PASTE_FLAGS + REACTION_FLAGS, false)
        }
    }

    @Test fun `profile IDs go in without Special contacts when its hooks have nowhere to go`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val putUser = context.resolveSpecialContacts().first!!.putUser
            val stock = putUser.controlBody().map { it.operand() }
            context.tgMutableClassDefBy(SC_CONTROLLER).methods.removeAll { it.origName == "processUpdateArray" }
            val warnings = PatchLogCapture.warnings { showLocalIdsPatch.execute(context) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue("${build.name}: $warnings", "processUpdateArray" in warnings.single() && "without Special contacts" in warnings.single())
            assertEquals("${build.name}: putUser keeps its stock code", stock, putUser.controlBody().map { it.operand() })
            flags(context, ID_FLAGS, true)
            flags(context, listOf("specialContacts"), false)
        }
    }

    /** Hide Premium, gifts and Stars asks before the profile's Send Gram, in the same menu builder. */
    @Test fun `profile IDs and the profile Send Gram hook share the menu builder in either order`() {
        for (build in Fixtures.declaredBuilds()) for (commerceFirst in listOf(true, false)) {
            val context = context(build)
            val builder = context.resolveLocalIds().method
            val stock = ImmutableMethod.of(builder).controlBody()
            for (patch in if (commerceFirst) listOf(hideCommercePatch, showLocalIdsPatch) else listOf(showLocalIdsPatch, hideCommercePatch)) {
                val warnings = PatchLogCapture.warnings { patch.execute(context) }
                // Only the profile's classes are loaded, so Hide commerce reports its other places missing.
                if (patch == showLocalIdsPatch) assertEquals(emptyList<String>(), warnings)
                else assertTrue("${build.name}: $warnings", warnings.none { "commerceProfileSendGram" in it })
            }
            val after = builder.controlBody()
            // Hide commerce also asks before each Send a Gift item, which the same builder adds.
            assertEquals("${build.name}: both hooks, the gift item checks and nothing else", stock.size + 11, after.size)
            assertEquals(1, after.count { it.controlRef() == "$COMMERCE->showProfileSendGram(Z)Z" })
            assertEquals(2, after.count { it.controlRef() == "$COMMERCE->profileGiftMenuBlocked(I)Z" })
            assertEquals(1, after.count { it.controlRef() == "$LOCAL_IDS->addToProfile(Landroid/view/View;JJ)V" })
            assertEquals("${build.name}: the stock visibility refresh still ends the builder", stock.takeLast(3).map { it.opcode },
                after.takeLast(3).map { it.opcode })
            flags(context, ID_FLAGS + "specialContacts" + "commerceProfileSendGram", true)
        }
    }

    @Test fun `changed editor and reaction geometry refuse without any normal or exceptional path mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val paste: List<Pair<String, (BytecodePatchContext) -> Unit>> = listOf(
                "missing HTML converter" to { c -> val site = c.resolveNormalPaste().first(); site.method.replaceInstruction(site.method.controlBody().indexOfFirst { it.call()?.origName == "getHtmlText" }, "nop") },
                "paste action moved" to { c -> c.resolveNormalPaste().first().method.replaceInstruction(0, "const v0, 0x1020031") },
                "copy dispatch removed" to { c -> val site = c.resolveNormalPaste().last(); val at = site.method.controlBody().indexOfFirst { (it as? WideLiteralInstruction)?.wideLiteral == 0x1020021L }; site.method.replaceInstruction(at, "nop") },
                "stock superclass fallback removed" to { c -> val site = c.resolveNormalPaste().last(); site.method.replaceInstruction(site.method.controlBody().size - 3, "nop") },
                "private editor action" to { c -> makePrivate(c.resolveNormalPaste().last().method) },
                "duplicate editor" to { c -> duplicateCandidate(c, c.resolveNormalPaste().first().method) },
            )
            for ((name, change) in paste) { val c = context(build); change(c); refused(build, name, c) { useNormalPastePatch.execute(c) } }
            val reactions: List<Pair<String, (BytecodePatchContext) -> Unit>> = listOf(
                "missing reaction choice" to { c -> val site = c.resolveDoubleTapReactions().last(); site.method.replaceInstruction(site.method.controlBody().indexOfFirst { it.controlRef() == DOUBLE_TAP_CHOICE }, "nop") },
                "reaction sink removed" to { c -> val site = c.resolveDoubleTapReactions().first(); site.method.replaceInstruction(site.method.controlBody().indexOfFirst { it.call()?.origParameterTypes?.take(2) == listOf("Landroid/view/View;", "Lorg/telegram/messenger/MessageObject;") }, "nop") },
                "private chat gesture" to { c -> makePrivate(c.resolveDoubleTapReactions().first().method) },
                "duplicate preview gesture" to { c -> duplicateCandidate(c, c.resolveDoubleTapReactions().last().method) },
                "missing eligibility contract" to { c -> val m = c.resolveDoubleTapReactions().first().method; val owner = c.tgMutableClassDefBy(m.definingClass); val iface = c.tgMutableClassDefBy(owner.interfaces.single()); iface.methods.removeAll { it.controlShape(listOf("Landroid/view/View;"), "Z") } },
                "native double-tap dispatch removed" to { c -> val s = c.resolveDoubleTapReactions().first(); val d = s.dispatcher!!; d.replaceInstruction(d.controlBody().indexOfFirst { it.call()?.origName == s.method.origName }, "nop") },
                "native gesture coordinates removed" to { c -> val d = c.resolveDoubleTapReactions().first().dispatcher!!; d.replaceInstruction(d.controlBody().indexOfFirst { it.controlRef() == "Landroid/view/MotionEvent;->getX()F" }, "nop") },
                "shared explicit reaction caller" to { c -> duplicate(c, c.resolveDoubleTapReactions().first().dispatcher!!, "explicitReactionFromMenu") },
            )
            for ((name, change) in reactions) { val c = context(build); change(c); refused(build, name, c) { disableDoubleTapReactionsPatch.execute(c) } }
        }
    }

    @Test fun `changed local ID binding menu access and register lifetime refuse before either bridge`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, LocalIdsPlan) -> Unit>> = listOf(
                "user argument renamed" to { c, _ -> val init = c.tgMutableClassDefBy(PROFILE).methods.single { it.origName == "onFragmentCreate" }; init.replaceInstruction(init.controlBody().indexOfFirst { it.controlString() == "user_id" }, "const-string v1, \"access_hash\"") },
                "local ID read removed" to { c, _ -> val init = c.tgMutableClassDefBy(PROFILE).methods.single { it.origName == "onFragmentCreate" }; init.replaceInstruction(init.controlBody().indexOfFirst { it.call()?.origName == "getLong" }, "nop") },
                "static user ID field" to { c, p -> val f = c.tgMutableClassDefBy(PROFILE).fields.single { it.origName == p.user.origName }; f.accessFlags = f.accessFlags or AccessFlags.STATIC.value },
                "static menu field" to { c, p -> val f = c.tgMutableClassDefBy(PROFILE).fields.single { it.origName == p.menu.origName }; f.accessFlags = f.accessFlags or AccessFlags.STATIC.value },
                // The menu store right after the maker's result (13.2 makes the item through a menu helper).
                "different profile receiver" to { c, p -> val view = c.tgMutableClassDefBy(PROFILE).methods.single { it.origName == "createView" }; val body = view.controlBody(); val at = body.indices.first { body[it].opcode == Opcode.IPUT_OBJECT && body[it].controlField()?.toString() == p.menu.toString() && body[it - 1].opcode == Opcode.MOVE_RESULT_OBJECT }; val store = body[at]; view.replaceInstruction(at, "iput-object v${store.namedRegisters()[0]}, v0, ${store.controlRef()}") },
                "overwritten profile receiver alias" to { c, _ -> val view = c.tgMutableClassDefBy(PROFILE).methods.single { it.origName == "createView" }; view.replaceInstruction(3, "const/4 v1, 0x0") },
                // 13.2 declares the row factory, its row builder and the dismissal on the menu item's base class.
                "private native submenu factory" to { c, p -> makePrivate(c.tgMutableClassDefBy(p.addRow.definingClass).methods.single { it.toString() == p.addRow.toString() }) },
                "native submenu text operand changed" to { c, p -> val factory = c.tgMutableClassDefBy(p.addRow.definingClass).methods.single { it.toString() == p.addRow.toString() }; factory.replaceInstruction(7, "move-object v4, p0") },
                "native row builder requests transport" to { c, p -> val factory = c.tgMutableClassDefBy(p.addRow.definingClass).methods.single { it.toString() == p.addRow.toString() }; val core = factory.controlBody()[8].call()!!; c.tgMutableClassDefBy(core.definingClass).methods.single { it.toString() == core.toString() }.replaceInstruction(0, "invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance(I)Lorg/telegram/tgnet/ConnectionsManager;") },
                "private menu owner" to { c, p -> val cls = c.tgMutableClassDefBy(p.menu.type); cls.accessFlags = cls.accessFlags and AccessFlags.PUBLIC.value.inv() },
                "missing dismiss bridge target" to { c, p -> c.tgMutableClassDefBy(p.dismiss.definingClass).methods.removeAll { it.toString() == p.dismiss.toString() } },
                // The popup read: first in 13.1, after the submenu overlay's early return in 13.2.
                "dismiss receiver changed" to { c, p -> val dismiss = c.tgMutableClassDefBy(p.dismiss.definingClass).methods.single { it.toString() == p.dismiss.toString() }; val at = dismiss.controlBody().indexOfFirst { it.opcode == Opcode.IGET_OBJECT }; dismiss.replaceInstruction(at, "iget-object v0, v0, " + dismiss.controlBody()[at].controlRef()) },
                "duplicate native menu builder" to { c, p -> duplicate(c, p.method) },
                "stock visibility refresh removed" to { _, p -> p.method.replaceInstruction(p.index + 1, "nop") },
                "entry profile receiver overwritten" to { _, p -> val self = p.method.implementation!!.registerCount - 2; p.method.replaceInstruction(0, "const/16 v$self, 0x0") },
                "locals live at insertion" to { _, p -> p.method.replaceInstruction(p.index, "invoke-static/range {v0 .. v15}, Lfixture/LocalIdLifetime;->consume(IIIIIIIIIIIIIIII)V") },
                "new exceptional lifetime at visibility refresh" to { c, p ->
                    val method = p.method
                    val body = method.controlBody()
                    val start = body.take(p.index).sumOf { it.codeUnits }
                    val implementation = ImmutableMethodImplementation(method.implementation!!.registerCount, body,
                        listOf(ImmutableTryBlock(start, body[p.index].codeUnits + body[p.index + 1].codeUnits,
                            listOf(ImmutableExceptionHandler("Ljava/lang/Exception;", 0)))), emptyList())
                    c.tgMutableClassDefBy(PROFILE).methods.remove(method)
                    c.tgMutableClassDefBy(PROFILE).methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters,
                        method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions, implementation).toMutable())
                },
                // 13.2 inlines R, so there the icon is an id the build has to carry; the loop puts it back.
                "inaccessible copy icon" to { c, _ -> val names = TelegramNames.of(c)
                    if (names.isIdentity) { val f = c.tgMutableClassDefBy("Lorg/telegram/messenger/R\$drawable;").fields.single { it.origName == "msg_copy" }; f.accessFlags = f.accessFlags and AccessFlags.PUBLIC.value.inv() }
                    else assertNotNull(names.resourceIds.remove(COPY_ICON)) },
            )
            for ((name, change) in mutations) {
                val c = context(build)
                val names = TelegramNames.of(c)
                val icon = names.resourceId("drawable", "msg_copy")
                try {
                    change(c, c.resolveLocalIds()); refused(build, name, c) { showLocalIdsPatch.execute(c) }
                } finally {
                    if (icon != null) names.resourceIds[COPY_ICON] = icon
                }
            }
        }
    }

    @Test fun `missing flags and inaccessible runtime entry points refuse each family atomically`() {
        val entries = listOf(Triple(NORMAL_PASTE, listOf("contextMenuAction"), PASTE_FLAGS),
            Triple(LOCAL_IDS, listOf("addToProfile", "nativeAddRow", "nativeDismiss"), ID_FLAGS),
            Triple(DOUBLE_TAP_REACTIONS, listOf("stopReaction"), REACTION_FLAGS))
        for (build in Fixtures.declaredBuilds()) for ((runtime, names, flags) in entries) {
            fun execute(c: BytecodePatchContext) = when (runtime) {
                NORMAL_PASTE -> useNormalPastePatch.execute(c)
                LOCAL_IDS -> showLocalIdsPatch.execute(c)
                else -> disableDoubleTapReactionsPatch.execute(c)
            }
            val absent = PatchContexts.of(ExtensionDex.classes().filter { it.origType != runtime } + hosts(build))
            refused(build, "absent $runtime runtime", absent) { execute(absent) }
            for (name in names) for (mutation in 0..7) {
                val c = context(build)
                val cls = c.tgMutableClassDefBy(runtime)
                val method = cls.methods.single { it.origName == name }
                when (mutation) {
                    0 -> cls.methods.remove(method)
                    1 -> makePrivate(method)
                    2 -> method.accessFlags = method.accessFlags and AccessFlags.STATIC.value.inv()
                    3 -> method.accessFlags = method.accessFlags or AccessFlags.NATIVE.value
                    4 -> cls.accessFlags = cls.accessFlags and AccessFlags.PUBLIC.value.inv()
                    6 -> method.accessFlags = method.accessFlags or AccessFlags.ABSTRACT.value
                    5, 7 -> { cls.methods.remove(method); cls.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters,
                        method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                        ImmutableMethodImplementation(if (mutation == 7) 0 else method.implementation!!.registerCount,
                            if (mutation == 5) emptyList() else method.controlBody(), emptyList(), emptyList())).toMutable()) }
                }
                refused(build, "$runtime $name mutation $mutation", c) { execute(c) }
            }
            for (flag in flags) {
                val c = context(build)
                c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == flag }
                refused(build, "missing $flag", c) { execute(c) }
            }
        }
    }

    private fun refused(build: File, case: String, c: BytecodePatchContext, execute: () -> Unit) {
        val before = completeState(build, c)
        assertThrows("${build.name}: $case", PatchException::class.java) { execute() }
        assertEquals("${build.name}: $case preserves methods, operands, registers, normal paths, handlers and build facts", before, completeState(build, c))
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } +
        listOf(NORMAL_PASTE, LOCAL_IDS, DOUBLE_TAP_REACTIONS, SETTINGS_STATUS)).filter { c.tgClassDefByOrNull(it) != null }
        .associateWith { c.tgMutableClassDefBy(it).state() }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<Method>) = hosts(build).flatMap { c.tgMutableClassDefBy(it.type).methods }
        .filter { it !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            check(FixtureDex.inputIdentity(build) == identity) { "${build.name} changed while reading local controls" }
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    private fun loadHosts(build: File): List<ClassDef> {
        val result = FixtureDex.classesWhere(build, { true }) { method ->
            method.origDefiningClass == PROFILE || method.origName == "onTextContextMenuItem" || method.origName == "onDoubleTap" ||
                method.controlBody().any { it.controlRef() == DOUBLE_TAP_CHOICE }
        }.associateByTo(linkedMapOf()) { it.type }
        val profile = result.getValue(PROFILE)
        // The menu is identified by its overflow icon/store, rather than any obfuscated name.
        val create = profile.methods.single { it.origName == "createView" }.controlBody()
        val icon = create.indexOfFirst { it.controlRef() == OVERFLOW_ICON }
        val boundMenu = if (icon >= 0) create[icon + 5].controlField()!!.type else {
            // 13.2 adds the overflow item through a helper of the menu that loads the icon itself.
            val calls = create.indices.filter { at -> create[at].opcode == Opcode.INVOKE_VIRTUAL &&
                create[at].call()?.parameterTypes?.isEmpty() == true && create.getOrNull(at + 2)?.opcode == Opcode.IPUT_OBJECT }
            val owners = FixtureDex.classes(build, calls.map { create[it].call()!!.definingClass }.toSet())
            val made = calls.single { at -> val call = create[at].call()!!
                owners[call.definingClass]?.methods?.any { it.name == call.name && it.parameterTypes.isEmpty() &&
                    it.controlBody().any { load -> load.controlRef() == OVERFLOW_ICON } } == true }
            result[create[made].call()!!.definingClass] = owners.getValue(create[made].call()!!.definingClass)
            create[made + 2].controlField()!!.type
        }
        // Use normal paste also reads the entities method Mention by ID hooks. LocaleController holds the
        // getString(int) wrapper whose forwarded call 13.2 inlined into the profile's Send Gram title.
        result.putAll(FixtureDex.classes(build, setOf(boundMenu, "Lorg/telegram/messenger/R\$drawable;", "Lorg/telegram/messenger/MediaDataController;",
            "Lorg/telegram/messenger/LocaleController;") + PROFILE_DC_TYPES))
        loadAncestors(build, result)
        // 13.2 declares the row factory on the menu item's superclass and takes the title as a CharSequence.
        val menuLine = generateSequence(result.getValue(boundMenu)) { menu -> menu.superclass?.let { result[it] } }.toList()
        val rows = menuLine.flatMap { it.methods }.filter { it.controlShape(listOf("I", "I", "Ljava/lang/String;"), it.returnType) ||
            it.controlShape(listOf("I", "I", "Ljava/lang/CharSequence;"), it.returnType) }
            .map { it.returnType }.filter { it.startsWith("Lorg/telegram/") }.toSet()
        result.putAll(FixtureDex.classes(build, rows))
        loadAncestors(build, result)
        return result.values.map(ImmutableClassDef::of)
    }

    private fun loadAncestors(build: File, result: MutableMap<String, ClassDef>) {
        while (true) {
            val ancestors = result.values.flatMap { listOfNotNull(it.superclass) + it.interfaces }.filter { it.startsWith("Lorg/telegram/") && it !in result }.toSet()
            if (ancestors.isEmpty()) break
            val found = FixtureDex.classes(build, ancestors)
            assertEquals("${build.name}: declared Telegram ancestor classes", ancestors, found.keys)
            result.putAll(found)
        }
    }

    private fun assertStock(case: String, old: Method, changed: Method, at: Int, extra: Int) {
        val before = old.controlBody()
        val after = changed.controlBody()
        assertEquals("$case: register count", old.implementation!!.registerCount, changed.implementation!!.registerCount)
        assertEquals(before.size + extra, after.size)
        val a = ControlFlow.of(old); val b = ControlFlow.of(changed)
        fun moved(index: Int) = if (index < at) index else index + extra
        fun target(index: Int) = if (index == at && at != 0) at else moved(index)
        for (i in before.indices) {
            assertEquals("$case: stock operand $i", before[i].operand(), after[moved(i)].operand())
            assertEquals("$case: stock normal path $i", a.normal[i].map(::target), b.normal[moved(i)])
            assertEquals("$case: stock exceptional path $i", a.exceptional[i].map(::moved), b.exceptional[moved(i)])
        }
    }
    private fun ClassDef.state() = listOf(accessFlags, superclass, interfaces.toList(), fields.map { listOf(it.name, it.type, it.accessFlags, it.initialValue) }, methods.map { key(it) to it.state() })
    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList(), implementation?.tryBlocks?.map { listOf(it.startCodeAddress, it.codeUnitCount, it.exceptionHandlers.map { h -> h.exceptionType to h.handlerCodeAddress }) })
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(),
        (this as? WideLiteralInstruction)?.wideLiteral, (this as? SwitchPayload)?.switchElements?.map { it.key })
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
    private fun duplicate(c: BytecodePatchContext, method: Method, name: String = method.name + "Duplicate") {
        c.tgMutableClassDefBy(method.definingClass).methods.add(ImmutableMethod(method.definingClass, name, method.parameters, method.returnType,
            method.accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
    }
    private fun duplicateCandidate(c: BytecodePatchContext, source: Method) {
        val candidates = mutableListOf<MutableMethod>()
        c.classDefForEach { cls -> cls.methods.filter { it.origName == source.origName && it.controlShape(source.parameterTypes.map { p -> p.toString() }, source.returnType) &&
            it.origDefiningClass != source.origDefiningClass && it.controlBody().none { instruction -> instruction.controlRef() == DOUBLE_TAP_CHOICE || instruction.call()?.origName == "getHtmlText" } }
            .forEach { m -> candidates += c.tgMutableClassDefBy(cls.type).methods.single { it.toString() == m.toString() } } }
        val target = candidates.first()
        val owner = c.tgMutableClassDefBy(target.definingClass)
        owner.methods.remove(target)
        owner.methods.add(ImmutableMethod(target.definingClass, target.name, target.parameters, target.returnType,
            target.accessFlags, target.annotations, target.hiddenApiRestrictions, source.implementation).toMutable())
    }
    private fun makePrivate(m: MutableMethod) { m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value }
    private fun flags(c: BytecodePatchContext, names: List<String>, expected: Boolean) = names.forEach { name ->
        val body = c.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody()
        assertEquals("$name", if (expected) 1L else 0L, (body.first() as WideLiteralInstruction).wideLiteral)
    }
    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        private val PASTE_FLAGS = listOf("normalPaste", "composePlainPaste", "captionPlainPaste")
        private val ID_FLAGS = listOf("showLocalIds", "profileLocalIds")
        private val REACTION_FLAGS = listOf("disableDoubleTapReactions", "chatDoubleTapReaction", "previewDoubleTapReaction")
        private const val OVERFLOW_ICON = "Lorg/telegram/messenger/R\$drawable;->ic_ab_other:I"
        private const val COPY_ICON = "drawable/msg_copy"

        // These large native classes are shared only within this fixture suite. Retaining
        // both APK snapshots after it finishes starves subsequent fixture readers.
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
