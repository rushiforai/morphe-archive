/*
 * Adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * ads/sponsoredsearch and search/SearchResultsPageHook.kt. Copyright 2026 Hushfacebook contributors.
 * Modified for facebook-morphe-patches, 2026: always on, simplified anchors.
 */
package app.fbpatches.patches.facebook.ads.search

import app.fbpatches.patches.facebook.shared.EXTENSION_CLASSES
import app.fbpatches.patches.facebook.shared.EXTENSION_PACKAGE
import app.fbpatches.patches.facebook.shared.body
import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.facebook.shared.holdsString
import app.fbpatches.patches.facebook.shared.literal
import app.fbpatches.patches.facebook.shared.methodReference
import app.fbpatches.patches.facebook.shared.parameterRegister
import app.fbpatches.patches.facebook.shared.patchLog
import app.fbpatches.patches.facebook.shared.requireLocals
import app.fbpatches.patches.facebook.shared.treeFieldKey
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * A search results page is a list of modules (people, posts, pages, videos, ads). Each module reads
 * its edge's `result_role` into a field of the server's GraphQLGraphSearchResultRole enum, whose
 * constant names survive obfuscation. Every page is built through one constructor:
 * (header, modules, tabs, filters, 4 strings with the page name 6th, 2 flags). The hook goes first in
 * that constructor and replaces the module list with one without the ad roles.
 */
private const val PATCH = "Hide sponsored search results"

private const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val GRAPHQL_RESULT = "Lcom/facebook/graphql/executor/GraphQLResult;"
private const val SEARCH_CONTEXT = "Lcom/facebook/search/results/model/SearchResultsMutableContext;"
private const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
private const val STRING = "Ljava/lang/String;"
private const val COPY_OF = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"

private const val SEARCH_ADS = "$EXTENSION_PACKAGE/ads/SearchAds;"
private const val KEPT = "$SEARCH_ADS->kept(Ljava/lang/Object;)Ljava/lang/Object;"

/** Roles that are ads, as the extension's SearchAds.AD_ROLES names them. */
private val AD_ROLES = listOf(
    "SEARCH_ADS",
    "DEPENDENT_SEARCH_ADS",
    "LATE_DEPENDENT_SEARCH_ADS",
    "TOP_POSITION_SEARCH_ADS",
    "TOP_POSITION_SHOPPABLE_ADS",
    "MARKETPLACE_SEARCH_ADS",
    "MARKETPLACE_BOOSTED_LISTING_SEARCH_ADS",
    "SEARCH_ADS_DISCOVERY_HEADER",
    "SEARCH_ADS_FLOATING_SEE_MORE",
)

/**
 * What the top-position ad module logs for its first ad slot. Only its render method holds it.
 *
 * The top-position ads, the ads Facebook can put above a search's results, come through a query
 * of their own (SearchTopPositionAdsQuery, sent from SearchResultsFragment) instead of among the
 * page's modules, so the page filter never sees them. The answer goes into one loaded state,
 * (ads, final), that the module's render tells apart with instance-of and reads its ads from. A
 * final state with no ads is how the render reads an answer that has none, and it draws nothing.
 */
private const val TOP_POSITION_FIRST_AD = "STREAM_TOP_POSITION_AD_MODULE_FIRST_AD"

private const val PAGE_MODULES = 1
private val PAGE_TAIL = listOf(IMMUTABLE_LIST, IMMUTABLE_LIST, IMMUTABLE_LIST, STRING, STRING, STRING, STRING, "Z", "Z")

private fun Method.parameters() = parameterTypes.map { it.toString() }

private fun isPageConstructor(method: Method) = method.name == "<init>" && method.parameters().let {
    it.size == 1 + PAGE_TAIL.size && it[0].startsWith("L") && it.drop(1) == PAGE_TAIL
}

private fun isPageBuilder(method: Method): Boolean {
    val parameters = method.parameters()
    return method.implementation != null && parameters.size >= 3 &&
        parameters.subList(0, 3) == listOf(USER_SESSION, GRAPHQL_RESULT, SEARCH_CONTEXT) &&
        method.returnType.startsWith("L") && !method.returnType.startsWith("Ljava/")
}

private fun enumStrings(enumClass: ClassDef): Set<String> =
    enumClass.methods.filter { it.name == "<clinit>" }.flatMap { method ->
        method.body().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    }.toSet()

private fun readsResultRole(method: Method): Boolean {
    if (method.name != "<init>") return false
    val body = method.body()
    return body.any { it.literal() == treeFieldKey("result_role") } &&
        body.any { it.methodReference()?.name == "getCachedEnum" }
}

@Suppress("unused")
val hideSponsoredSearchResultsPatch = bytecodePatch(
    name = "Hide sponsored search results",
    description = "Removes the ads from Facebook's search results.",
    default = true,
) {
    dependsOn(extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        val roles = classDefByStrings("MARKETPLACE_BOOSTED_LISTING_SEARCH_ADS", StringComparisonType.EQUALS)
            .filter { it.superclass == "Ljava/lang/Enum;" && enumStrings(it).containsAll(AD_ROLES) }
        val role = roles.singleOrNull()
            ?: throw PatchException("$PATCH: expected one search result role enum, found ${roles.size}")

        val pages = mutableSetOf<String>()
        val modules = mutableListOf<Pair<ClassDef, String>>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
            classDef.methods.forEach { if (isPageBuilder(it)) pages += it.returnType }
            val roleFields = classDef.fields.filter { it.type == role.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
            if (roleFields.size == 1 && classDef.methods.any(::readsResultRole)) {
                modules += classDef to roleFields.single().name
            }
        }
        val (module, roleField) = modules.singleOrNull()
            ?: throw PatchException("$PATCH: expected one search module class reading result_role, found ${modules.size}")
        val pageType = pages.singleOrNull()
            ?: throw PatchException("$PATCH: expected the search page builders to answer one class, found $pages")

        // The extension's stubs read these, so they must be reachable from another package.
        val field = module.fields.single { it.name == roleField && it.type == role.type }
        if (!AccessFlags.PUBLIC.isSet(module.accessFlags) || !AccessFlags.PUBLIC.isSet(field.accessFlags)) {
            throw PatchException("$PATCH: ${module.type} or its role field isn't public")
        }

        // Fill the extension's stubs: is this a module, and the module's role.
        val searchAds = mutableClassDefBy(SEARCH_ADS)
        fun stub(name: String, returnType: String) = searchAds.methods.single {
            it.name == name && it.returnType == returnType && it.parameters() == listOf("Ljava/lang/Object;")
        }
        stub("isModule", "Z").addInstructions(
            0,
            """
                instance-of p0, p0, ${module.type}
                return p0
            """,
        )
        stub("role", "Ljava/lang/Object;").addInstructions(
            0,
            """
                check-cast p0, ${module.type}
                iget-object p0, p0, ${module.type}->$roleField:${role.type}
                return-object p0
            """,
        )

        val page = mutableClassDefBy(pageType)
        val constructors = page.methods.filter { it.name == "<init>" }
        val constructor = constructors.singleOrNull(::isPageConstructor)
            ?: throw PatchException("$PATCH: $pageType has no single page-shaped constructor")
        // 585 adds a short constructor that hands its page to the full one. Others must delegate.
        constructors.filter { it !== constructor }.forEach { other ->
            val delegates = other.body().any { instruction ->
                val call = instruction.methodReference()
                (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                    call != null && call.definingClass == pageType && call.name == "<init>" &&
                    call.parameterTypes.map { it.toString() } == constructor.parameters()
            }
            if (!delegates) patchLog.warning("$PATCH: a $pageType constructor doesn't hand its page to the full one")
        }

        constructor.requireLocals(PATCH, 1)
        val modulesRegister = constructor.parameterRegister(PAGE_MODULES)
        constructor.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { $modulesRegister .. $modulesRegister }, $KEPT
                move-result-object v0
                if-eqz v0, :facebook
                check-cast v0, Ljava/util/Collection;
                invoke-static { v0 }, $COPY_OF
                move-result-object v0
                move-object/from16 $modulesRegister, v0
            """,
            ExternalLabel("facebook", constructor.getInstruction(0)),
        )

        // The ads above the results come apart from the page: see TOP_POSITION_FIRST_AD.
        emptyTopPositionAds()?.let { patchLog.warning("$PATCH: $it. Ads above the search results may still show.") }
    }
}

/**
 * Makes every loaded state of the top-position ad module start with no ads and as final, whatever
 * the query answered. Null when done, or why not.
 */
private fun BytecodePatchContext.emptyTopPositionAds(): String? {
    val renders = classDefByStrings(TOP_POSITION_FIRST_AD, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { owner -> owner.methods.filter { holdsString(it, TOP_POSITION_FIRST_AD) } }
    val render = renders.singleOrNull()
        ?: return "found ${renders.size} methods holding \"$TOP_POSITION_FIRST_AD\", expected 1"

    // The loaded state: a type the render checks with instance-of, built only from (ads, final).
    val states = render.body()
        .filter { it.opcode == Opcode.INSTANCE_OF }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        .distinct()
        .mapNotNull { classDefByOrNull(it) }
        .filter { state ->
            val constructors = state.methods.filter { it.name == "<init>" }
            constructors.size == 1 && constructors.single().parameters() == listOf(IMMUTABLE_LIST, "Z")
        }
    val state = states.singleOrNull()
        ?: return "the top-position ad render checks ${states.size} (ads, final) states, expected 1"

    val constructor = mutableClassDefBy(state.type).methods.single { it.name == "<init>" }
    constructor.addInstructions(
        0,
        """
            invoke-static {}, $IMMUTABLE_LIST->of()$IMMUTABLE_LIST
            move-result-object p1
            const/16 p2, 0x1
        """,
    )
    return null
}
