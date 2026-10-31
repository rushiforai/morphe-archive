package kotlin.io.path;

import ab.e0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.nio.file.FileVisitOption;
import java.nio.file.LinkOption;
import kotlin.Metadata;
import kotlin.collections.EmptySet;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/io/path/LinkFollowing;", b.f42142b, "<init>", "()V", "kotlin-stdlib-jdk7"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LinkFollowing {
    static {
        new LinkFollowing();
        LinkOption linkOption = LinkOption.NOFOLLOW_LINKS;
        EmptySet emptySet = EmptySet.f71734a;
        e0.U(FileVisitOption.FOLLOW_LINKS);
    }

    private LinkFollowing() {
    }
}
