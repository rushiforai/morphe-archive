package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m75 implements Comparable {
    public final int a;
    public final k6f b;
    public final boolean c;

    public m75(int i, k6f k6fVar, boolean z) {
        this.a = i;
        this.b = k6fVar;
        this.c = z;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.a - ((m75) obj).a;
    }
}
