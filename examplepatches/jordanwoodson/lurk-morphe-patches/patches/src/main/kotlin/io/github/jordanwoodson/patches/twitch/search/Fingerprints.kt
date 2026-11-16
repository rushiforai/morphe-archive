package io.github.jordanwoodson.patches.twitch.search

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// The recent searches store reads the saved list: a JSON array of the last ten searches under the
// "recentSearches" key of Twitch's preferences.
internal object RecentSearchesReadFingerprint : Fingerprint(
    returnType = "Ljava/util/ArrayList;", parameters = emptyList(),
    strings = listOf("recentSearches"),
)

// The recent searches list (in memory, loaded from the store when it is made) writing itself back to the
// store as a JSON array. Its class also has the method that puts a search on top of the list.
internal object RecentSearchesWriteFingerprint : Fingerprint(
    returnType = "V", parameters = emptyList(),
    strings = listOf("recentSearches"),
    filters = listOf(methodCall(definingClass = "Lorg/json/JSONArray;", name = "<init>",
        parameters = listOf("Ljava/util/Collection;"))),
)
