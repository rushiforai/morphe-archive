package app.bin0culars.patches.reddit.layout.contenttypefilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.instanceOf
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object FeedPageBuildFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
    filters = listOf(
        anyInstruction(
            checkCast("Lcom/reddit/feeds/data/paging/FeedPagingDataSource\$load\$1;"),
            instanceOf("Lcom/reddit/feeds/data/paging/FeedPagingDataSource\$load\$1;"),
            fieldAccess(definingClass = "Lcom/reddit/feeds/data/paging/FeedPagingDataSource\$load\$1;"),
        ),
        methodCall(name = "getData", returnType = "Ljava/util/List;"),
    ),
)

object PostElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("PostElement(linkId=")),
)

object CrosspostElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("CrosspostElement(linkId=")),
)

object VideoElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("VideoElement(linkId=")),
)

object YouTubeElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("YouTubeElement(linkId=")),
)

object PostSelfImageElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("PostSelfImageElement(linkId=")),
)

object GalleryElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("GalleryElement(linkId=")),
)

object GalleryWithLinkFooterElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("GalleryWithLinkFooterElement(linkId=")),
)

object PostMediaWebsiteElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("PostMediaWebsiteElement(linkId=")),
)

object TitleWithLinkedPreviewElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("TitleWithLinkedPreviewElement(linkId=")),
)

object ClassicPostElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("ClassicPostElement(linkId=")),
)

object TitleWithThumbnailElementFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("TitleWithThumbnailElement(linkId=")),
)
