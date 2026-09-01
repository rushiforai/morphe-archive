package defpackage;

import android.net.Uri;
import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e6c extends g6c {
    public final PostShareData a;
    public final Uri b;
    public final String c;

    public e6c(PostShareData postShareData, Uri uri, String str) {
        postShareData.getClass();
        uri.getClass();
        this.a = postShareData;
        this.b = uri;
        this.c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e6c)) {
            return false;
        }
        e6c e6cVar = (e6c) obj;
        return g76.L(this.a, e6cVar.a) && g76.L(this.b, e6cVar.b) && g76.L(this.c, e6cVar.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        String str = this.c;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ShareFile(postShareData=");
        sb.append(this.a);
        sb.append(", imageUri=");
        sb.append(this.b);
        sb.append(", highlightText=");
        return ka1.v(sb, this.c, ")");
    }
}
