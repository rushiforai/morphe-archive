package app.blackmagic.patches.gallery

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The Glide `DataFetcher.loadData` of the gallery grid's frame fetcher (obfuscated
 * `r94.d(Priority, DataCallback)`). It implements an obfuscated `DataFetcher`
 * interface, but:
 *   - its first parameter is the non-obfuscated `com.bumptech.glide.Priority`,
 *   - its second is the (obfuscated) Glide `DataCallback`,
 *   - it contains the unique string "Frame extractor returned null".
 *
 * Those anchors identify it without relying on any obfuscated name. The method
 * body reads the model fields (Uri / width / height / position) and the callback
 * methods, all of which [smoothGalleryThumbnailsPatch] rediscovers by type.
 */
internal object FrameFetcherLoadDataFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/bumptech/glide/Priority;", "L"),
    filters = listOf(
        // 3.5.1 rewrote the fetcher: the body-level "Frame extractor returned null"
        // string is gone. loadData now throws FileNotFoundException("URI does not
        // exist: " + uri) when the clip is missing, a string unique to this method.
        string("URI does not exist: "),
    ),
)
