package ie;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61555a;

    /* renamed from: b, reason: collision with root package name */
    public int f61556b;

    public static String c(int i5) {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + ((char) ((i5 >> 24) & 255)) + ((char) ((i5 >> 16) & 255)) + ((char) ((i5 >> 8) & 255)) + ((char) (i5 & 255));
    }

    public static int o(int i5) {
        return (i5 >> 24) & 255;
    }

    public void b(int i5) {
        this.f61556b = i5 | this.f61556b;
    }

    public boolean d(int i5) {
        return (this.f61556b & i5) == i5;
    }

    public int g() {
        return this.f61556b;
    }

    public abstract int i();

    public abstract int j();

    public abstract int k();

    public abstract int l();

    public abstract int m();

    public abstract int n();

    public String toString() {
        switch (this.f61555a) {
            case 2:
                return c(this.f61556b);
            default:
                return super.toString();
        }
    }

    public /* synthetic */ a(int i5, int i11) {
        this.f61555a = i11;
        this.f61556b = i5;
    }
}
