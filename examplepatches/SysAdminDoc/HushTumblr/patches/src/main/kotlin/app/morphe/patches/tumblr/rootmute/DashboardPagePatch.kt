/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.rootmute

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.requireParameterIntact
import app.morphe.patches.tumblr.misc.extension.requireStub
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.extension.writeStub
import app.morphe.patches.tumblr.timeline.POST
import app.morphe.patches.tumblr.ui.isJumpTarget
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Dashboard page"
internal const val HUSH_DASHBOARD_TIMELINE = "$EXTENSION_PACKAGE/rootmute/HushDashboardTimeline;"
internal const val DASHBOARD_PAGE = "$ROOT_MUTES->dashboardPage(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;"
internal const val HUSH_POST_FACTS = "$EXTENSION_PACKAGE/timeline/HushPostFacts;"
internal const val POST_FACTS = "$EXTENSION_PACKAGE/timeline/DashboardPosts;->facts(Ljava/lang/Object;)I"
internal const val WRAPPED_POST_FACTS = "$ROOT_POST_WRAPPER->hushPostFacts:I"
internal const val DASHBOARD_TAB = "Lcom/tumblr/tabbeddashboard/fragments/GraywaterTabFragment;"
internal const val DASHBOARD_HOST = "Lcom/tumblr/tabbeddashboard/fragments/TabbedDashboardHostFragment;"
internal const val FRAGMENT = "Landroidx/fragment/app/Fragment;"
/**
 * The Following tab, and the tab fragment behind every other dashboard tab. Blog pages are neither.
 * Explore and Communities build their tabs from the same tab class, each in its own host's child
 * fragments, so a tab is the dashboard only while the dashboard's host holds it.
 */
internal val ROOT_DASHBOARDS = listOf("Lcom/tumblr/ui/fragment/GraywaterDashboardFragment;", DASHBOARD_TAB)
private const val PAGE_LINKS = "Lcom/tumblr/timeline/model/link/TimelinePaginationLink;"
private const val LIST = "Ljava/util/List;"
private const val MODE = "Luxl;"
private const val TIMELINEABLE = "Lcom/tumblr/rumblr/model/Timelineable;"

internal data class DashboardPagePlan(val delivery: MutableMethod, val wrapperConstructor: MutableMethod, val factsScratch: Int)

/**
 * The filter a dashboard page passes through before Tumblr shows it, shared by Mute posts locally,
 * Hide liked posts, Hide your own reblogs and Hide reblogs of your posts. A dashboard page, a post
 * you open, a review queue and a Blaze list all come from one response, so parsing can't tell them
 * apart. The fragment a page is delivered to can, so the page is filtered there, and each card's
 * wrapper notes what the filter needs from its post as it's built.
 */
internal val dashboardPagePatch = bytecodePatch {
    dependsOn(tumblrExtensionPatch)
    execute { applyDashboardPage(resolveDashboardPage()) }
}

internal fun BytecodePatchContext.resolveDashboardPage(): DashboardPagePlan {
    requireExtensionHook(PATCH, DASHBOARD_PAGE)
    requireExtensionHook(PATCH, POST_FACTS)
    requireStub(ROOT_MENU, "cardPayload")
    val face = classDefByOrNull(HUSH_POST_FACTS)
    requireShape(PATCH, face != null && AccessFlags.INTERFACE.isSet(face.accessFlags) && face.methods.count() == 1
        && face.methods.single().let { it.name == "hushPostFacts" && it.hasShape(emptyList(), "I") && AccessFlags.ABSTRACT.isSet(it.accessFlags) },
        "the post facts interface changed")
    val wrapper = classDefByOrNull(ROOT_POST_WRAPPER)
    requireShape(PATCH, wrapper != null && HUSH_POST_FACTS !in wrapper.interfaces && wrapper.methods.none { it.name == "hushPostFacts" }
        && wrapper.fields.none { it.name == "hushPostFacts" }, "the post facts bridge already exists or the card wrapper is missing")
    val wrapperConstructor = pageMethod(ROOT_POST_WRAPPER, "<init>", listOf(POST), "V")
    val body = wrapperConstructor.instructionList()
    requireShape(PATCH, wrapperConstructor.implementation!!.registerCount == 9 && !wrapperConstructor.isStatic()
        && body.first().opcode == Opcode.INVOKE_DIRECT && body.first().methodRef().toString() == "Ljava/lang/Object;-><init>()V"
        && (body.first() as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == 7 },
        "the wrapped Post constructor no longer has its original receiver and Post parameter")
    wrapperConstructor.requireParameterIntact(PATCH, 0, listOf(1))
    val factsScratch = wrapperConstructor.freeLocalsAt(PATCH, 1, 1, reads = listOf(7, 8)).single()
    requireDashboards()
    val delivery = pageDelivery()
    val data = pageMethod(ROOT_TIMELINE_OBJECT, "getData", emptyList(), TIMELINEABLE)
    requireShape(PATCH, !data.isStatic() && AccessFlags.PUBLIC.isSet(data.accessFlags), "the timeline payload getter changed")
    pageMethod("La2k;", "l", emptyList(), TIMELINEABLE).also {
        requireShape(PATCH, !it.isStatic() && AccessFlags.PUBLIC.isSet(it.accessFlags), "the post card payload getter changed")
    }
    return DashboardPagePlan(delivery, wrapperConstructor, factsScratch)
}

/**
 * The method every timeline screen gets its loaded pages through. Parsing can't tell which screen a
 * page is for, so the dashboard's rules filter here, first thing, where the fragment says whether it's the dashboard.
 */
private fun BytecodePatchContext.pageDelivery(): MutableMethod {
    val delivery = classDefByOrNull(LOCAL_TIMELINE)?.methods?.filter { method ->
        !method.isStatic() && method.returnType == "V" && method.implementation != null &&
            method.parameterTypes.map(CharSequence::toString) == listOf(MODE, LIST, PAGE_LINKS, "Ljava/util/Map;", "Z")
    }.orEmpty().only(PATCH, "the method a timeline fragment gets its loaded page through")
    // Both registers the hook names go into four-bit operands, and nothing may jump past it.
    requireShape(PATCH, delivery.implementation!!.registerCount <= 16 && !delivery.isJumpTarget(0),
        "the page delivery can't take a filter at its head")
    return mutableOf(delivery)
}

/** Each dashboard fragment is a local timeline that doesn't carry the marker yet, and a tab can ask for its host. */
private fun BytecodePatchContext.requireDashboards() {
    val marker = classDefByOrNull(HUSH_DASHBOARD_TIMELINE)
    requireShape(PATCH, marker != null && AccessFlags.INTERFACE.isSet(marker.accessFlags) && marker.interfaces.isEmpty()
        && marker.methods.count() == 1 && marker.methods.single().let { it.name == "hushDashboard" && it.hasShape(emptyList(), "Z")
            && AccessFlags.ABSTRACT.isSet(it.accessFlags) }, "the dashboard marker changed")
    for (type in ROOT_DASHBOARDS) {
        val dashboard = classDefByOrNull(type)
        var parent = dashboard?.superclass
        repeat(8) { if (parent != LOCAL_TIMELINE) parent = parent?.let { classDefByOrNull(it)?.superclass } }
        requireShape(PATCH, dashboard != null && parent == LOCAL_TIMELINE && HUSH_DASHBOARD_TIMELINE !in dashboard.interfaces
            && dashboard.methods.none { it.name == "hushDashboard" },
            "a dashboard fragment is missing, already marked or no longer a local timeline")
    }
    requireShape(PATCH, classDefByOrNull(DASHBOARD_HOST) != null && classDefByOrNull(FRAGMENT)?.methods?.any {
        it.name == "getParentFragment" && it.hasShape(emptyList(), FRAGMENT) && !it.isStatic() && AccessFlags.PUBLIC.isSet(it.accessFlags)
    } == true, "the dashboard's tab host or a fragment's parent changed")
}

internal fun BytecodePatchContext.applyDashboardPage(plan: DashboardPagePlan) {
    // What the page filter asks of a card, noted from the post the card's wrapper is built from.
    val wrapper = mutableClassDefBy(ROOT_POST_WRAPPER)
    wrapper.instanceFields.add(ImmutableField(ROOT_POST_WRAPPER, "hushPostFacts", "I",
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null, null).toMutable())
    wrapper.interfaces.add(HUSH_POST_FACTS)
    wrapper.methods.add(ImmutableMethod(ROOT_POST_WRAPPER, "hushPostFacts", emptyList(), "I", AccessFlags.PUBLIC.value,
        null, null, MutableMethodImplementation(2)).toMutable().apply {
        addInstructions(0, "iget v0, p0, $WRAPPED_POST_FACTS\nreturn v0")
    })
    plan.wrapperConstructor.addInstructions(1, """
        invoke-static { p1 }, $POST_FACTS
        move-result v${plan.factsScratch}
        iput v${plan.factsScratch}, p0, $WRAPPED_POST_FACTS
    """)
    for (dashboard in ROOT_DASHBOARDS) mutableClassDefBy(dashboard).apply {
        interfaces.add(HUSH_DASHBOARD_TIMELINE)
        methods.add(ImmutableMethod(dashboard, "hushDashboard", emptyList(), "Z", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(2)).toMutable().apply {
            addInstructions(0, if (dashboard != DASHBOARD_TAB) "const/4 v0, 0x1\nreturn v0" else """
                invoke-virtual { p0 }, $FRAGMENT->getParentFragment()$FRAGMENT
                move-result-object v0
                instance-of v0, v0, $DASHBOARD_HOST
                return v0
            """)
        })
    }
    plan.delivery.addInstructions(0, "invoke-static { p0, p2 }, $DASHBOARD_PAGE\nmove-result-object p2")
    writeStub(ROOT_MENU, "cardPayload", 2, """
        instance-of v0, p0, Lr4g;
        if-eqz v0, :timeline
        check-cast p0, Lr4g;
        invoke-virtual { p0 }, La2k;->l()$TIMELINEABLE
        move-result-object v0
        return-object v0
        :timeline
        instance-of v0, p0, $ROOT_TIMELINE_OBJECT
        if-eqz v0, :absent
        check-cast p0, $ROOT_TIMELINE_OBJECT
        invoke-virtual { p0 }, $ROOT_TIMELINE_OBJECT->getData()$TIMELINEABLE
        move-result-object v0
        return-object v0
        :absent
        const/4 v0, 0x0
        return-object v0
    """)
}

private fun BytecodePatchContext.pageMethod(type: String, name: String, parameters: List<String>, result: String): MutableMethod =
    classDefByOrNull(type)?.methods?.filter { it.name == name && it.hasShape(parameters, result) && it.implementation != null }
        .orEmpty().only(PATCH, "$type->$name(${parameters.joinToString("")})$result").let { mutableOf(it) }
