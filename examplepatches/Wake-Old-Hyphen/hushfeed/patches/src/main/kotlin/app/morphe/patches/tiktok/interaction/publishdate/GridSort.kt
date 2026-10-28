/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.publishdate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.theme.declaredVersions
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Always show publish date"
private const val GRID_SORT = "Lapp/morphe/extension/tiktok/feed/GridSort;"

/** The string only the profile and Liked grid's adapter logs under. */
private const val ADAPTER_TAG = "Profile_AwemeAdapter"

/** The grid adapter's cell builder, the one method in the app that logs under [ADAPTER_TAG]. */
internal object GridAdapterTagFingerprint : Fingerprint(
    strings = listOf(ADAPTER_TAG),
)

/**
 * The profile grid adapter's `setData(List)` (#180), which gives the adapter the list it keeps
 * and draws its cells from. The class is renamed on every build, so it is found by the log tag
 * its cell builder uses, and the method by TikTok's own unobfuscated name.
 */
internal object GridAdapterSetDataFingerprint : Fingerprint(
    classFingerprint = GridAdapterTagFingerprint,
    name = "setData",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/** Its `setDataAfterLoadMore(List)`, which a new page of the grid goes through. */
internal object GridAdapterPageFingerprint : Fingerprint(
    classFingerprint = GridAdapterTagFingerprint,
    name = "setDataAfterLoadMore",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/**
 * The grid adapter's constructor (#180), the one taking TikTok's number for the tab the grid is
 * for (0 posts, 1 Liked, 4 and 25 Favorites, 14 private) as its only int. Both of TikTok's profile
 * tab fragments build the adapter through it.
 */
internal object GridAdapterInitFingerprint : Fingerprint(
    classFingerprint = GridAdapterTagFingerprint,
    name = "<init>",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.count { it.toString() == "I" } == 1 },
)

/**
 * The profile tab fragment's log name for its tab, which names tab 1 the favorite tab: TikTok's
 * Liked tab, still called favorites inside the app. The anchors test reads the tab numbers here.
 */
internal object GridTabNameFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("personal_favorite_tab", "others_favorite_tab"),
)

private fun registerSize(type: CharSequence) = if (type.toString() == "J" || type.toString() == "D") 2 else 1

private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

/**
 * The int field [GridAdapterInitFingerprint]'s constructor keeps the tab number in: the one field
 * of its class its int parameter is stored to, straight from the parameter's register or from the
 * register it was moved to just before (47.5.3 does `move/from16 v0, p5` and stores v0). Null
 * where that isn't one field, or where the constructor has no two spare registers to read it back
 * with.
 */
internal fun gridTabField(init: Method): FieldReference? {
    val implementation = init.implementation ?: return null
    val types = init.parameterTypes
    val at = types.indexOfFirst { it.toString() == "I" }
    if (at < 0) return null
    val ins = 1 + types.sumOf(::registerSize)
    if (implementation.registerCount - ins < 2) return null
    val register = implementation.registerCount - ins + 1 + types.take(at).sumOf(::registerSize)
    val code = implementation.instructions.toList()
    return code.indices
        .filter { index ->
            val put = code[index]
            if (put.opcode != Opcode.IPUT) return@filter false
            val source = (put as TwoRegisterInstruction).registerA
            if (source == register) return@filter true
            val move = code.getOrNull(index - 1) ?: return@filter false
            move.opcode in MOVES && (move as TwoRegisterInstruction).registerA == source && move.registerB == register
        }
        .mapNotNull { code[it].getReference<FieldReference>() }
        .filter { it.definingClass == init.definingClass && it.type == "I" }
        .map { "${it.definingClass}->${it.name}:${it.type}" to it }
        .distinctBy { it.first }
        .singleOrNull()?.second
}

/**
 * Hands each new grid adapter to the extension with its tab number (#180), so the Liked tab can
 * follow its own order. Read back from the adapter's field before each return, once the adapter
 * is built and in the two registers nothing reads after. Required on a declared build. On any
 * other the Liked grid follows the profile grids' order as it did before.
 */
internal fun BytecodePatchContext.hookGridTab(versionName: String): Boolean {
    val declared = versionName in declaredVersions()
    val init = if (declared) GridAdapterInitFingerprint.method else GridAdapterInitFingerprint.methodOrNull
    val field = init?.let(::gridTabField)
    if (init == null || field == null) {
        if (declared) throw PatchException("$PATCH: the grid adapter on $versionName keeps no tab number.")
        println("[$PATCH] The Liked grid on $versionName follows the profile grids' order: no tab number found on the grid adapter.")
        return false
    }
    init.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .reversed()
        .forEach { index ->
            init.addInstructionsAtControlFlowLabel(
                index,
                """
                    move-object/from16 v0, p0
                    iget v1, v0, ${field.definingClass}->${field.name}:${field.type}
                    invoke-static { v0, v1 }, $GRID_SORT->tab(Ljava/lang/Object;I)V
                """,
            )
        }
    return true
}

/**
 * The profile grid fragment's cell click (#180), which opens the video page on the fragment's
 * own list. It is the one method of the grid fragment taking a post, the cell and a string that
 * routes to the video page with the profile source.
 */
internal object GridCellOpenFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/profile/business/profile/tab/AwemeListFragmentImpl;",
    returnType = "V",
    parameters = listOf(
        "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
        "Landroid/view/View;",
        "Ljava/lang/String;",
    ),
    strings = listOf("aweme://aweme/detail/", "from_profile_other"),
)

/**
 * The profile grid fragment's method that asks for the next page once a fresh list is in, the
 * one method in the app that logs both of these (#180). It calls TikTok's page loader with the
 * load-more message, which [gridPageLoaderIn] reads from it.
 */
internal object GridLoadAfterRefreshFingerprint : Fingerprint(
    strings = listOf("load_more_after_refresh", "collection_tab_first_frame"),
)

/** TikTok's page loader, `(message, count, source)`, and the message that means the next page. */
internal data class GridPageLoader(val method: MethodReference, val message: Int) {
    val smali get() = "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
}

/**
 * The page loader [GridLoadAfterRefreshFingerprint]'s method calls: the virtual call taking two
 * ints and a string whose first int is a literal loaded just before it. The other such call there
 * (the own profile's) gets its message from a register set much earlier, so it isn't taken.
 */
internal fun gridPageLoaderIn(method: Method): GridPageLoader? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val found = code.indices.mapNotNull { index ->
        if (index == 0 || code[index].opcode != Opcode.INVOKE_VIRTUAL) return@mapNotNull null
        val ref = code[index].getReference<MethodReference>() ?: return@mapNotNull null
        if (ref.returnType != "V" || ref.parameterTypes.map { it.toString() } != listOf("I", "I", "Ljava/lang/String;")) {
            return@mapNotNull null
        }
        val literal = code[index - 1]
        val call = code[index] as FiveRegisterInstruction
        if (literal.opcode != Opcode.CONST || (literal as OneRegisterInstruction).registerA != call.registerD) {
            return@mapNotNull null
        }
        GridPageLoader(ref, (literal as NarrowLiteralInstruction).narrowLiteral)
    }
    return found.singleOrNull()
}

/**
 * Fills the extension's `loadPage` with a call to TikTok's page loader, so a sorted grid can ask
 * for its next page directly. The footer's own listener runs a reach-bottom check first and only
 * loads within eight rows of the end, which stopped a sorted grid after its third page. Without
 * the loader `loadPage` stays false and the grid keeps using that listener.
 */
internal fun BytecodePatchContext.fillGridPageLoader(versionName: String): Boolean {
    val loader = GridLoadAfterRefreshFingerprint.methodOrNull?.let(::gridPageLoaderIn)
    if (loader == null) {
        println("[$PATCH] The sorted grid on $versionName loads pages through its footer only: no page loader found.")
        return false
    }
    val stub = mutableClassDefBy(GRID_SORT).methods.singleOrNull {
        it.name == "loadPage" && it.returnType == "Z" &&
            it.parameterTypes == listOf("Ljava/lang/Object;", "I", "I", "Ljava/lang/String;")
    } ?: throw PatchException("$PATCH: the extension has no loadPage to fill in.")
    // The stub's message parameter takes TikTok's literal. What the stub did before is left
    // behind as unreachable code.
    stub.addInstructionsWithLabels(
        0,
        """
            instance-of p1, p0, ${loader.method.definingClass}
            if-eqz p1, :not_grid
            check-cast p0, ${loader.method.definingClass}
            const p1, ${loader.message}
            invoke-virtual { p0, p1, p2, p3 }, ${loader.smali}
            const/4 p0, 0x1
            return p0
            :not_grid
            const/4 p0, 0x0
            return p0
        """,
    )
    return true
}

/**
 * Sorts the grid's loaded videos while its switch is on (#180), and says whether the hooks went
 * in. Required on a declared build, where the anchors test holds it, and left out with a note on
 * any other, so a reworked adapter there doesn't take the publish date down with it. The
 * settings row shows only when the hooks went in. Takes the version so a test can stand in for a
 * build that isn't declared.
 */
internal fun BytecodePatchContext.hookGridSortOn(versionName: String): Boolean {
    if (!hookGridSort(versionName)) return false
    fillGridPageLoader(versionName)
    hookGridOpen(versionName)
    if (hookGridTab(versionName)) {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableLikedGridSort()V",
        )
    }
    SettingsStatusLoadFingerprint.method.addInstruction(
        0,
        "invoke-static {}, " +
            "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableGridSort()V",
    )
    return true
}

/**
 * Hands the grid's fragment to the extension as a cell opens its video, so the video page swipes
 * on in the grid's order (#180). The fragment is `p0` at the click's first instruction, and the
 * range form takes it from any register. Required on a declared build. On any other, a click it
 * can't find leaves the grid sorted and the video page in TikTok's order.
 */
internal fun BytecodePatchContext.hookGridOpen(versionName: String): Boolean {
    val declared = versionName in declaredVersions()
    val open = if (declared) GridCellOpenFingerprint.method else GridCellOpenFingerprint.methodOrNull
    if (open == null) {
        println("[$PATCH] The sorted grid on $versionName opens videos in TikTok's order: no grid cell click found.")
        return false
    }
    open.addInstruction(0, "invoke-static/range { p0 .. p0 }, $GRID_SORT->beforeOpen(Ljava/lang/Object;)V")
    return true
}

/**
 * The two hooks alone, without the settings flag that shows the row, so a probe patch can run
 * them. Each puts the list through the extension at the method's first instruction, where nothing
 * jumps and `p1` is the list. The page hook also hands over the adapter, which the extension
 * refreshes once TikTok's call is done, since TikTok announces a page as cells added at the end.
 */
internal fun BytecodePatchContext.hookGridSort(versionName: String): Boolean {
    val declared = versionName in declaredVersions()
    val setData = if (declared) GridAdapterSetDataFingerprint.method else GridAdapterSetDataFingerprint.methodOrNull
    val page = if (declared) GridAdapterPageFingerprint.method else GridAdapterPageFingerprint.methodOrNull
    if (setData == null || page == null) {
        println("[$PATCH] Left out the grid sort on $versionName: no profile grid adapter found.")
        return false
    }
    if (setData.definingClass != page.definingClass) {
        println("[$PATCH] Left out the grid sort on $versionName: the two grid adapter methods are in different classes.")
        return false
    }
    setData.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $GRID_SORT->data(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """,
    )
    page.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $GRID_SORT->page(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """,
    )
    return true
}
