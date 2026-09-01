package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iyb {
    public final String a;
    public final b55 b;
    public final boolean c;

    public iyb(String str, b55 b55Var) {
        this.a = str;
        this.b = b55Var;
    }

    public final String toString() {
        return "AccessibilityKey: " + this.a;
    }

    public /* synthetic */ iyb(String str) {
        this(str, dyb.i);
    }

    public iyb(String str, int i) {
        this(str);
        this.c = true;
    }

    public iyb(String str, boolean z, b55 b55Var) {
        this(str, b55Var);
        this.c = z;
    }
}
