package ue;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final ke.v f90924a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f90925b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f90926c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f90927d;

    /* renamed from: e, reason: collision with root package name */
    public int f90928e;

    /* renamed from: f, reason: collision with root package name */
    public int f90929f;

    /* renamed from: g, reason: collision with root package name */
    public long f90930g;

    /* renamed from: h, reason: collision with root package name */
    public long f90931h;

    public l(ke.v vVar) {
        this.f90924a = vVar;
    }

    public final void a(int i5, int i11, byte[] bArr) {
        if (this.f90926c) {
            int i12 = this.f90929f;
            int i13 = (i5 + 1) - i12;
            if (i13 >= i11) {
                this.f90929f = (i11 - i5) + i12;
            } else {
                this.f90927d = ((bArr[i13] & 192) >> 6) == 0;
                this.f90926c = false;
            }
        }
    }
}
