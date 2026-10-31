package fc;

/* loaded from: classes2.dex */
public abstract class h {

    /* renamed from: dj, reason: collision with root package name */
    private int f54598dj;

    /* renamed from: lt, reason: collision with root package name */
    private int f54599lt;
    private Object lud;
    private g sya;
    private final long ycx = System.currentTimeMillis();

    /* renamed from: zb, reason: collision with root package name */
    private final String f54600zb;

    public h(String str, g gVar) {
        this.f54600zb = str;
        this.sya = gVar;
    }

    public abstract byte[] dj();

    public String lt() {
        return this.f54600zb;
    }

    public int lud() {
        return this.f54599lt;
    }

    public Object sya() {
        g gVar;
        if (this.lud == null && (gVar = this.sya) != null) {
            this.lud = gVar.ycx();
        }
        return this.lud;
    }

    public String toString() {
        return super.toString();
    }

    public abstract int ul();

    public long ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f54598dj;
    }

    public void ycx(int i5) {
        this.f54598dj = i5;
    }

    public void zb(int i5) {
        this.f54599lt = i5;
    }

    public h(String str, Object obj) {
        this.f54600zb = str;
        this.lud = obj;
    }
}
