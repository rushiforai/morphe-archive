/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.updates

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Where Facebook's own update prompts come from, on the 577 and 580 builds.
 *
 * Facebook carries no installer of its own: nothing in either build opens a PackageInstaller
 * session, and the old self-update module's strings are gone. Updates are Meta App Manager's
 * (the Oxygen preload on Samsung and other OEM phones) or Google Play's. What the app itself does
 * is prompt, and ask the manager to look, in four places that keep their literals through Redex:
 *
 * - Two QuickPromotion contextual-filter predicates, `PRELOADS_UPDATE_OVER_CELLULAR` and
 *   `PRELOADS_UPDATE_OWNERSHIP`. Each asks a Meta App Manager content provider and answers true
 *   when a promotion may show: a newer version is waiting and mobile-data updates are off, or the
 *   manager wants to own Facebook's updates. A server-sent "update Facebook" promotion is gated
 *   by them, and a re-signed build can't take the update they lead to.
 * - The `APPMANAGER_ACTION` push handler, the one place Facebook has the manager check for an
 *   update on Meta's say-so (`force_sync`).
 * - The chat promotion filter evaluator, a kept JNI-facing method that answers the msys
 *   `app_max_version` filter, which passes only for versions at or below a ceiling: the filter an
 *   "update to keep using this" promotion carries.
 *
 * The predicate and handler classes are renamed every build, and so are their method names
 * (`A06` on 580, `A07` on 577), so each is found by its shape and the literals it holds.
 */
internal const val PATCH = "Stop update prompts"

internal const val CONTEXTUAL_FILTER = "Lcom/facebook/quickpromotion/model/QuickPromotionDefinition\$ContextualFilter;"
internal const val PROMOTION_DEFINITION = "Lcom/facebook/quickpromotion/model/QuickPromotionDefinition;"
internal const val FILTER_DISPATCHER = "Lcom/facebook/messaging/quickpromotion/filter/QPFilterDispatcher;"
internal const val EVALUATE_FILTER = "evaluateQPFilter"
private const val CONTEXT = "Landroid/content/Context;"
private const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val PUSH_PROPERTY = "Lcom/facebook/push/constants/PushProperty;"
private const val PUSH_META_DATA = "Lcom/facebook/pushlite/model/PushInfraMetaData;"
private val EVALUATOR_PARAMETERS = listOf(
    "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/Double;", "Ljava/lang/Boolean;",
    "Ljava/util/Map;",
)

internal const val CELLULAR_PROVIDER = "com.facebook.oxygen.appmanager.updatesovercellular.UpdatesOverCellularProvider"
internal const val LATEST_VERSION_AVAILABLE = "latest_version_available"
internal const val OWNERSHIP_PROVIDER = "com.facebook.oxygen.appmanager.updateownership.UpdateOwnershipProvider"
internal const val OWNERSHIP_NEEDED = "update_ownership_needed"
internal const val FORCE_SYNC_UNSUPPORTED = "AppManager doesn't support forceSync"
internal const val FORCE_SYNC_SUCCESS = "oxygen_preloads_force_sync_success"
internal const val VERSION_CEILING = "app_max_version"

/** What the evaluator answers for a filter it evaluated and failed; 1 is a pass and 0 a filter it doesn't know. */
internal const val FILTER_FAILED = 2

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }

/**
 * A QuickPromotion filter predicate holding every one of [literals]: an instance method with a
 * body that takes the filter and its promotion and answers whether the filter passes.
 */
internal fun isPromotionFilter(method: Method, vararg literals: String): Boolean =
    method.returnType == "Z" && method.implementation != null &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameters() == listOf(CONTEXTUAL_FILTER, PROMOTION_DEFINITION) &&
        literals.all { holdsString(method, it) }

/**
 * The `APPMANAGER_ACTION` push handler: void, six parameters of which the context, the user
 * session, the push property and the push metadata keep their names, holding the two force-sync
 * literals. The other two parameters are renamed interfaces of the push pipeline.
 */
internal fun isForceSyncHandler(method: Method): Boolean {
    val parameters = method.parameters()
    return method.returnType == "V" && method.implementation != null &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        parameters.size == 6 && parameters[0] == CONTEXT && parameters[1] == USER_SESSION &&
        parameters[2] == PUSH_PROPERTY && parameters[5] == PUSH_META_DATA &&
        holdsString(method, FORCE_SYNC_UNSUPPORTED) && holdsString(method, FORCE_SYNC_SUCCESS)
}

/**
 * The chat promotion filter evaluator: the dispatcher's kept static `evaluateQPFilter`, taking the
 * filter's name first, answering an int, and holding the version ceiling filter's name.
 */
internal fun isFilterEvaluator(method: Method): Boolean =
    method.definingClass == FILTER_DISPATCHER && method.name == EVALUATE_FILTER &&
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "I" &&
        method.implementation != null && method.parameters() == EVALUATOR_PARAMETERS &&
        holdsString(method, VERSION_CEILING)
