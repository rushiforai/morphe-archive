/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.search

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.extension.requireLocals
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/**
 * The one hook first in the constructor every page of search results is built with, shared by the
 * two patches that filter a page's modules: Hide Meta AI in search and Hide sponsored search
 * results. Each finds the constructor its own way and asks for the hook, and the hook goes in once.
 * The extension's SearchResultsPage runs each patch's filter in turn behind its own switch, so the
 * two never take turns rewriting the list, and a build with only one of them gets only its filter.
 * Two hooks here would each copy the list the other had already filtered back into the page.
 */
internal const val SEARCH_RESULTS_PAGE = "$EXTENSION_PACKAGE/search/SearchResultsPage;"
internal const val KEPT_MODULES = "$SEARCH_RESULTS_PAGE->keptModules(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;"

/**
 * The page's own constructor among [methods], the page class's methods: the one constructor of the
 * shape the hook reads ([isPageConstructor]). On 585 the page class (arm64 LX/0D1n) also has a short
 * `(ImmutableList, ImmutableList, String, String, String, Z)` constructor that fills in an empty
 * list and a null header and hands everything to the full one; the Meta AI answer builder and one
 * other caller build their pages through it. So every other constructor has to call the full one
 * and never [superclass]'s own, or a page could be built past the hook, and [patch] names the patch
 * asking in the refusal.
 */
internal fun <T : Method> pageConstructorOf(methods: Iterable<T>, superclass: String?, patch: String): T {
    val constructors = methods.filter { it.name == "<init>" }
    val shaped = constructors.filter {
        isPageConstructor(ImmutableMethodReference(it.definingClass, it.name, it.parameterTypes, it.returnType))
    }
    val page = shaped.singleOrNull() ?: throw PatchException(
        "$patch: expected one search results page constructor taking a header, the modules, two more lists, " +
            "four strings and two flags, found ${shaped.size} among ${constructors.size}",
    )
    val parameters = page.parameterTypes.map { it.toString() }
    // 585 adds a shorter constructor that hands everything to the full one: hold every other to that.
    constructors.filter { it !== page }.forEach { other ->
        val calls = other.directConstructorCalls()
        val delegates = calls.any { it.definingClass == page.definingClass && it.parameterTypes.map(CharSequence::toString) == parameters }
        if (!delegates || calls.any { it.definingClass == superclass }) {
            throw PatchException(
                "$patch: ${other.definingClass}-><init>(${other.parameterTypes.joinToString("")}) doesn't hand its page " +
                    "to the full constructor, so the page hook would miss the pages it builds",
            )
        }
    }
    return page
}

/** The constructors [this] calls with invoke-direct, its own class's and its superclass's included. */
private fun Method.directConstructorCalls(): List<MethodReference> =
    implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE }
        .mapNotNull { ((it as ReferenceInstruction).reference as? MethodReference)?.takeIf { call -> call.name == "<init>" } }

/** Whether the page hook is already the first thing in [method]: the other patch put it there. */
internal fun Method.hasPageModulesHook(): Boolean {
    val first = implementation?.instructions?.firstOrNull() ?: return false
    if (first.opcode != Opcode.INVOKE_STATIC) return false
    val call = (first as ReferenceInstruction).reference as? MethodReference ?: return false
    return "${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}" == KEPT_MODULES
}

/**
 * First thing in a results page's constructor: hand the extension the page's modules, its second
 * argument, and its name, its sixth. When it answers a list, copy it into an ImmutableList and put
 * that where the modules were, so the constructor keeps it. When it answers null, the constructor
 * runs as Facebook wrote it. Nothing has run yet, so v0 is free, and `this` isn't touched before its
 * own constructor call. A constructor that already starts with the hook is left as it is, and
 * [patch] names the patch asking in any refusal.
 */
internal fun MutableMethod.filterPageModulesFirst(patch: String) {
    if (hasPageModulesHook()) return
    requireLocals(patch, 1)
    val modules = parameterRegister(PAGE_MODULES)
    val name = parameterRegister(PAGE_NAME)
    // invoke-static names its registers in four bits each.
    listOf(PAGE_MODULES, PAGE_NAME).map(::parameterRegisterNumber).filter { it > 15 }.firstOrNull()?.let {
        throw PatchException("$patch: $definingClass-><init> keeps its modules or its name in v$it, past v15")
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { $modules, $name }, $KEPT_MODULES
            move-result-object v0
            if-eqz v0, :facebook
            invoke-static { v0 }, $COPY_OF
            move-result-object $modules
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
