package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class oze implements qze {
    public final String a;
    public final String b;

    public oze(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oze)) {
            return false;
        }
        oze ozeVar = (oze) obj;
        return g76.L(this.a, ozeVar.a) && this.b.equals(ozeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("ToggleReplies(responseId=", this.a, ezwlgQm.eXxzSUpjcTvA, this.b, ")");
    }
}
