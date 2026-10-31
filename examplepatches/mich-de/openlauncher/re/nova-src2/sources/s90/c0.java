package s90;

/* loaded from: classes5.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f86893a;

    /* renamed from: b, reason: collision with root package name */
    public final int f86894b;

    /* renamed from: c, reason: collision with root package name */
    public final int f86895c;

    /* renamed from: d, reason: collision with root package name */
    public final int f86896d;

    public c0(String str) {
        String[] strArrSplit = str.split("\\.");
        this.f86893a = Integer.parseInt(strArrSplit[0]);
        this.f86894b = Integer.parseInt(strArrSplit[1]);
        this.f86895c = Integer.parseInt(strArrSplit[2]);
        this.f86896d = Integer.parseInt(strArrSplit[3]);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f86893a);
        sb2.append(".");
        sb2.append(this.f86894b);
        sb2.append(".");
        sb2.append(this.f86895c);
        return b.c0.p(sb2, ".", this.f86896d);
    }
}
