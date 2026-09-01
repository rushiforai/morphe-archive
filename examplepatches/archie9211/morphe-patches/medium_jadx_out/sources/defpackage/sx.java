package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum sx {
    NO_ARGUMENTS(3),
    UNLESS_EMPTY(2),
    ALWAYS_PARENTHESIZED(true, true);

    public final boolean a;
    public final boolean b;

    /* synthetic */ sx(int i) {
        this((i & 1) == 0, false);
    }

    public final boolean getIncludeAnnotationArguments() {
        return this.a;
    }

    public final boolean getIncludeEmptyAnnotationArguments() {
        return this.b;
    }

    sx(boolean z, boolean z2) {
        this.a = z;
        this.b = z2;
    }
}
