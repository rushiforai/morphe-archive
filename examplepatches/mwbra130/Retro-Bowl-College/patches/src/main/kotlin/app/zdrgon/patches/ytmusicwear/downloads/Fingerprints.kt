package app.zdrgon.patches.ytmusicwear.downloads

import app.morphe.patcher.Fingerprint

// ── Downloads (offline save) machinery — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// Located by a seven-round androguard scan of the Wear dex on 2026-11-14
// (full evidence: workspace/ytmusic-watch/analysis/REPORT5-downloads-wear-fingerprints.md).
// The Wear build contains the phone app's offline engine: the same
// endpoint executors, the same offlineability proto, the same save flow.
//
// The offlineability value the save path consults is Labyn; — verified
// as the Wear OfflineabilityRenderer by layout comparison against the
// phone build's official type (bool offlineable, not-offlineable dialog
// message, repeated formats list, int — role-for-role identical).
//
// Ljdr; is the OfflinePlaylistCommandResolver (its own source-file
// string proves it) and Ljds; is the OfflineVideoCommandResolver
// (same proof). Their endpoint methods extract the offlineability from
// the incoming command; the save flows consume it as follows:
// - Playlist: Ljdr;->a -> b -> g, and g passes the Labyn; into the save
//   task Ljlj;-><init> as its third argument.
// - Video: Ljds;->a obtains the Labyn; (via Ljsl;->a() on one branch,
//   a second extraction on the other) and passes it into the save task
//   Ljlu;-><init> as its second argument.

/**
 * Playlist save: Ljdr;->g builds the offline save task for a playlist.
 * Its third parameter is the offlineability (Labyn;), and that
 * parameter is what the save task is constructed from — rewriting the
 * parameter at method entry covers the whole flow.
 */
object PlaylistSaveFingerprint : Fingerprint(
    definingClass = "Ljdr;",
    name = "g",
    returnType = "V",
    parameters = listOf("Labwl;", "Ljava/util/Map;", "Labyn;")
)

/**
 * Video save task constructor: Ljlu;-><init> receives the offlineability
 * (Labyn;) as its second parameter. It is constructed at exactly one
 * call site (Ljds;->a, the OfflineVideoCommandResolver's endpoint
 * method). Hooking the constructor entry covers both branches that can
 * produce the offlineability inside Ljds;->a, with no insertion into
 * that method's branch structure.
 */
object VideoSaveTaskFingerprint : Fingerprint(
    definingClass = "Ljlu;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljlx;", "Labyn;", "Ljava/lang/String;", "Lrzd;", "Labua;")
)
