package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"Lw5e;", "", "", "a", "Ljava/lang/String;", "getUrl", "()Ljava/lang/String;", "url", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class w5e {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("url")
    private final String url;

    public w5e(String str) {
        str.getClass();
        this.url = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w5e) && g76.L(this.url, ((w5e) obj).url);
    }

    public final int hashCode() {
        return this.url.hashCode();
    }

    public final String toString() {
        return ev6.x("UploadImageFormUrlRequest(url=", this.url, ")");
    }
}
