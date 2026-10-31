/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.reels

import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.shared.FEED_UNIT_EDGE
import app.morphe.patches.facebook.shared.outlinedFunnelBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The GraphQL type the feed's showcase rows answer `getTypeName()` with. One Redex-renamed class
 * answers it, and the same class answers other feed units' type names too (StoriesTrayFeedUnit
 * among them), so the rule goes by the name and never by the class.
 */
internal const val SHOWCASE_FEED_UNIT = "ShowcaseFeedUnit"

/**
 * The field a showcase unit keeps its story type under, an enum the renderer draws the row by.
 * Read from 577 and 580 (2026-09-25): the unit class has one public accessor with no arguments that
 * loads this field's key (0x300bc816) and asks `BaseModelWithTree.getCachedEnum` for it, then casts
 * the answer to the story type enum (`A01()` on both builds, of `LX/3zj;` in 580 and `LX/3zZ;` in
 * 577). Its sibling `A02()` reads another enum under another key.
 */
internal const val SHOWCASE_STORY_TYPE_FIELD = "showcase_story_type"

/**
 * The story types that are rows of reels, as the extension's `ShowcaseType.REELS_TYPES` names
 * them. FeedReelsShowcaseTest holds the two lists together. The enum's static initializer builds
 * the same 16 constants on 577 and 580.
 */
internal val REELS_SHOWCASE_TYPES = listOf(
    "SHOWCASE_SHORT_VIDEO",
    "SHOWCASE_FB_SHORTS_CFU",
    "SHOWCASE_FB_SHORTS_DYNAMIC_MIDCARD",
    "SHOWCASE_FB_SHORTS_MIDCARD",
    "SHOWCASE_FB_SHORTS_PROMO",
    "SHOWCASE_FB_SEARCH_REELS",
)

/**
 * Kept literal. The showcase renderer's complaint about a story type it has no layout for. The
 * method holding it (`LX/7Nu;->A1F` in 580, `LX/76K;->A1N` in 577) reads the story type through the
 * accessor above, which is what ties the accessor to the rows on screen. On 585 (`LX/08Md;->A00`
 * on arm64, `LX/08Mi;->A00` on armeabi-v7a) the one caller of that renderer reads the type through
 * the accessor and passes the enum in as the renderer's first parameter, which the renderer
 * switches on by ordinal.
 */
internal const val SHOWCASE_NOT_HANDLED = "ShowcaseFeedUnit with %s has not been handled NT or Native properly!"

/**
 * Kept literal. The name Facebook's own validator for hidden FB Shorts in-feed units reports
 * (`getName()` of `LX/43m;` in 580 and `LX/4W8;` in 577): the feed's reels rows are a thing this
 * build still files and hides by its own rules.
 */
internal const val FB_SHORTS_IFU_VALIDATOR = "FbShortsIFUHiddenValidator"

/**
 * Kept names. The pre-EOF injector builds a "Reels" ShowcaseFeedUnit of its own (story type
 * SHOWCASE_SHORT_VIDEO, is_empty_tray true) shortly before the feed you follow ends, and adds it at
 * the tail of the feed collection. Read from 577 and 580 (2026-09-25): the method keeps its name,
 * `injectPreEofIfuEdge$fbandroid_java_com_facebook_feedplugins_showcase_fbshorts_preeof_preeof()V`,
 * on `LX/3r2;` in 580 and `LX/3GC;` in 577, and holds the adapter's name as a literal. Its first
 * instruction writes v0 before anything reads it, and it has 11 registers.
 */
internal const val PRE_EOF_INJECTOR_PREFIX = "injectPreEofIfuEdge$"
internal const val PRE_EOF_ADAPTER = "PreEofIfuSectionAdapter"

/**
 * Kept literal. The trace name of the feed collection's tail adder (`LX/1nb;->A0I` in 580,
 * `LX/1k1;->A0J` in 577), which takes a GraphQLFeedUnitEdge and answers whether it went in. On both
 * builds exactly two methods call it: `addNewEdgeToCollection`, behind the one feed guard, and the
 * pre-EOF injector. On 583 the funnel's body moved into a static method of its class, which the
 * feed guard goes on, and that method is the caller. 585 keeps that split with a private instance
 * method (`LX/020h;->A0D`), which the batch add calls as well, and the funnel only wraps it. A third
 * caller would be a way into the feed that neither hook sees.
 */
internal const val ADD_ELEMENT_AT_TAIL = "FeedUnitCollection.addElementAtTail"

/** The feed collection method that runs the one feed guard. */
internal const val ADD_NEW_EDGE_TO_COLLECTION = "addNewEdgeToCollection"

private fun Method.body() = implementation?.instructions?.toList().orEmpty()

private fun MethodReference.parameterList() = parameterTypes.map { it.toString() }

/** Whether [method] is a public `getTypeName()` that answers [typeName] as a literal. */
internal fun isTypeNameOf(method: Method, typeName: String): Boolean =
    method.name == "getTypeName" && method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
        AccessFlags.PUBLIC.isSet(method.accessFlags) && holdsString(method, typeName)

/** The classes among [candidates] whose `getTypeName()` answers [typeName]. A patch wants one. */
internal fun unitClassesNamed(candidates: Iterable<ClassDef>, typeName: String): List<ClassDef> =
    candidates.filter { classDef -> classDef.methods.any { isTypeNameOf(it, typeName) } }

/**
 * Whether [method] is a showcase unit's story type accessor: public, not static, no arguments, an
 * object back, and a body that loads the key of [SHOWCASE_STORY_TYPE_FIELD] and asks
 * `BaseModelWithTree.getCachedEnum` for it.
 */
internal fun isShowcaseStoryTypeAccessor(method: Method): Boolean {
    if (method.parameterTypes.isNotEmpty() || !method.returnType.startsWith("L")) return false
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val body = method.body()
    return body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == treeFieldKey(SHOWCASE_STORY_TYPE_FIELD) } &&
        body.any {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            call != null && call.definingClass == BASE_MODEL_WITH_TREE && call.name == "getCachedEnum" &&
                call.parameterList() == listOf("I", "Ljava/lang/Class;", "Ljava/lang/Enum;")
        }
}

/** Every story type accessor [unit] declares. A patch wants exactly one. */
internal fun showcaseStoryTypeAccessors(unit: ClassDef): List<Method> = unit.methods.filter(::isShowcaseStoryTypeAccessor)

/** Whether [call] names [target]: its class, its name and its prototype. */
internal fun isCallTo(call: MethodReference, target: Method): Boolean =
    call.definingClass == target.definingClass && call.name == target.name && call.returnType == target.returnType &&
        call.parameterList() == target.parameterTypes.map { it.toString() }

/** Whether [method] invokes [target] anywhere in its body (an invoke is the one instruction that names a method). */
internal fun callsMethod(method: Method, target: Method): Boolean = method.body().any { instruction ->
    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { isCallTo(it, target) } == true
}

/**
 * Whether [renderer] draws the row by the story type [accessor] reads. On 577 through 584 the
 * renderer calls the accessor itself. 585 reads the type once in the renderer's caller and hands the
 * enum over as the renderer's first parameter, so the renderer qualifies when it takes the type
 * [accessor] answers and one of [callers] (the methods that call this renderer) reads it through
 * [accessor].
 */
internal fun rendersByStoryType(renderer: Method, accessor: Method, callers: List<Method>): Boolean =
    callsMethod(renderer, accessor) ||
        (renderer.parameterTypes.any { it.toString() == accessor.returnType } && callers.any { callsMethod(it, accessor) })

/** Whether [method] has the pre-EOF injector's shape: its kept name, no arguments, void, a body. */
internal fun isPreEofInjector(method: Method): Boolean =
    method.name.startsWith(PRE_EOF_INJECTOR_PREFIX) && method.returnType == "V" && method.parameterTypes.isEmpty() &&
        method.implementation != null

/** The methods of [classDef] that hold the tail adder's trace name and take an edge for a boolean. */
internal fun tailAdders(classDef: ClassDef): List<Method> = classDef.methods.filter {
    it.returnType == "Z" && it.parameterTypes.map { type -> type.toString() } == listOf(FEED_UNIT_EDGE) &&
        holdsString(it, ADD_ELEMENT_AT_TAIL)
}

/** A method's class, name and prototype, as a call to it names them. */
internal fun signatureOf(method: Method): String =
    "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"

/**
 * The method of [owner], [funnel]'s own class, that [funnel] only wraps. 583 made that a static
 * method; 585 a private instance one, which the feed's batch add calls as well, so the tail adder's
 * caller there is this body and never the funnel by name. Empty when [funnel] does the work itself.
 * It's [outlinedFunnelBody], the finder the feed guard goes by, so a looser match can't vouch for a
 * method the guard isn't on.
 */
internal fun funnelHandOffs(funnel: Method, owner: ClassDef): List<Method> {
    val body = outlinedFunnelBody(funnel)?.takeUnless { isCallTo(it, funnel) } ?: return emptyList()
    return owner.methods.filter { isCallTo(body, it) }
}

/**
 * Why the callers of the tail adder aren't exactly the feed funnel and [injector], or null when
 * they are. The feed's edges go through `addNewEdgeToCollection`, or through the body [isFunnelBody]
 * says it only wraps (funnelHandOffs), and the pre-EOF hook covers the injector; any other caller
 * adds rows neither sees, and the switch would promise more than it does.
 */
internal fun tailCallerProblem(
    callers: List<Method>,
    injector: Method,
    isFunnelBody: (Method) -> Boolean = { false },
): String? {
    val names = callers.map { "${it.definingClass}->${it.name}" }
    val funnel = callers.count { it.name == ADD_NEW_EDGE_TO_COLLECTION || isFunnelBody(it) }
    val injectors = callers.count { it.definingClass == injector.definingClass && it.name == injector.name }
    return if (callers.size == 2 && funnel == 1 && injectors == 1) {
        null
    } else {
        "The feed's tail adder has ${callers.size} callers, and expected exactly $ADD_NEW_EDGE_TO_COLLECTION " +
            "and the pre-EOF injector: ${names.joinToString()}"
    }
}
