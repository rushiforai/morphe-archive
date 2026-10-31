package sg;

/* loaded from: classes.dex */
public class h0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87441a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87442b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f87443c;

    public /* synthetic */ h0(int i5, String str, boolean z11) {
        this.f87441a = i5;
        this.f87442b = str;
        this.f87443c = z11;
    }

    public StringBuilder a(StringBuilder sb2) {
        sb2.append(this.f87442b);
        sb2.append(", defaultValue=");
        sb2.append(this.f87443c);
        return sb2;
    }

    public boolean b() {
        return this.f87443c;
    }

    public String toString() {
        switch (this.f87441a) {
            case 1:
                return a(new StringBuilder()).toString();
            default:
                return super.toString();
        }
    }
}
