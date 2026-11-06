/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2964
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24: the endpoint field read is found in the patch, as this
 * patcher has no MatchBeforeAnywhere, and the search submit of YouTube 20.05 is matched too.
 */

package app.morphe.patches.youtube.interaction.channelsearch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.parametersMatch
import app.morphe.patcher.string
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private val ON_CREATE_VIEW_PARAMETERS = listOf(
    "Landroid/view/LayoutInflater;",
    "Landroid/view/ViewGroup;",
    "Landroid/os/Bundle;"
)

/**
 * Every browse page is shown by this one fragment, and the endpoint it is handed names the page.
 * The browse request cannot be used instead, because a page served from cache makes no request.
 * The endpoint of the page is read before it is checked for browse data.
 */
internal object BrowseFragmentOnCreateViewFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = ON_CREATE_VIEW_PARAMETERS,
    filters = listOf(
        string("Browse Fragment was given a navigation endpoint without browse data.")
    )
)

/**
 * The search feed is its own fragment, so it does not go through the browse fragment when
 * the user returns to it from a channel.
 */
internal object SearchResultsFragmentOnCreateViewFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = ON_CREATE_VIEW_PARAMETERS,
    filters = listOf(
        string("search_cache_key")
    )
)

/**
 * Picks the hint of the search box. The default hint is loaded last, after the hints of
 * Shorts search and playlist search.
 */
internal object SearchBoxHintFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "shorts_search_hint"),
        resourceLiteral(ResourceType.STRING, "playlists_search_hint"),
        resourceLiteral(ResourceType.STRING, "search_hint"),
        opcode(Opcode.MOVE_RESULT_OBJECT)
    ),
    custom = { method, _ ->
        method.parameterTypes.firstOrNull() == "Landroid/content/Context;"
    }
)

private val SEARCH_REQUEST_PARAMETERS = listOf(
    "Ljava/lang/String;",
    "[B",
    "Ljava/lang/String;",
    "I",
    "L",
    "L",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
)

private val SEARCH_SUBMIT_PARAMETERS = listOf(
    "Ljava/lang/String;",
    "I",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
)

/**
 * Every search submit path funnels through this method, including suggestions and filter chips.
 */
internal object SearchSubmitFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        anyInstruction(
            methodCall( // 21.13 and newer.
                parameters = SEARCH_REQUEST_PARAMETERS + listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Z"
                ),
                returnType = "V"
            ),
            methodCall( // Some versions between 20.05 and 21.13.
                parameters = SEARCH_REQUEST_PARAMETERS + listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;"
                ),
                returnType = "V"
            ),
            methodCall( // 20.05.
                parameters = SEARCH_REQUEST_PARAMETERS,
                returnType = "V"
            )
        )
    ),
    custom = { method, _ ->
        parametersMatch( // 21.13 and newer.
            method.parameters,
            SEARCH_SUBMIT_PARAMETERS + listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z")
        ) || parametersMatch( // Some versions between 20.05 and 21.13.
            method.parameters,
            SEARCH_SUBMIT_PARAMETERS + listOf("Ljava/lang/String;", "Ljava/lang/String;")
        ) || parametersMatch( // 20.05.
            method.parameters,
            SEARCH_SUBMIT_PARAMETERS
        )
    }
)
