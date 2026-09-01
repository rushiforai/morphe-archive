package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n75 implements Comparable {
    public final int a;
    public final j6f b;
    public final boolean c;

    public n75(int i, j6f j6fVar, boolean z, boolean z2) {
        this.a = i;
        this.b = j6fVar;
        this.c = z;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.a - ((n75) obj).a;
    }
}
