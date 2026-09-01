package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ytd implements ztd {
    public final wtd a;
    public final float b;
    public final int c;
    public final boolean d;
    public final float e;
    public final boolean f;
    public final boolean g;

    public ytd(wtd wtdVar, float f, int i, boolean z, float f2, boolean z2, boolean z3) {
        wtdVar.getClass();
        this.a = wtdVar;
        this.b = f;
        this.c = i;
        this.d = z;
        this.e = f2;
        this.f = z2;
        this.g = z3;
    }

    public static ytd a(ytd ytdVar, float f, boolean z, float f2, int i) {
        wtd wtdVar = ytdVar.a;
        if ((i & 2) != 0) {
            f = ytdVar.b;
        }
        float f3 = f;
        int i2 = ytdVar.c;
        if ((i & 8) != 0) {
            z = ytdVar.d;
        }
        boolean z2 = z;
        if ((i & 16) != 0) {
            f2 = ytdVar.e;
        }
        boolean z3 = ytdVar.f;
        boolean z4 = ytdVar.g;
        wtdVar.getClass();
        return new ytd(wtdVar, f3, i2, z2, f2, z3, z4);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ytd)) {
            return false;
        }
        ytd ytdVar = (ytd) obj;
        return g76.L(this.a, ytdVar.a) && Float.compare(this.b, ytdVar.b) == 0 && this.c == ytdVar.c && this.d == ytdVar.d && Float.compare(this.e, ytdVar.e) == 0 && this.f == ytdVar.f && this.g == ytdVar.g;
    }

    public final int hashCode() {
        return ((km4.p(this.e, (((km4.p(this.b, this.a.hashCode() * 31, 31) + this.c) * 31) + (this.d ? 1231 : 1237)) * 31, 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Reading(content=");
        sb.append(this.a);
        sb.append(", progress=");
        sb.append(this.b);
        sb.append(", numberOfItem=");
        sb.append(this.c);
        sb.append(", isPlaying=");
        sb.append(this.d);
        sb.append(", speechRate=");
        sb.append(this.e);
        sb.append(", hasVoices=");
        sb.append(this.f);
        sb.append(", isBackgroundRestricted=");
        return lv8.t(sb, this.g, ")");
    }
}
