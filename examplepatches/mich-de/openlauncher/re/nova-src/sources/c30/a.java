package c30;

import android.graphics.Color;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f19517a;

    /* renamed from: b, reason: collision with root package name */
    public int f19518b;

    /* renamed from: c, reason: collision with root package name */
    public int f19519c;

    /* renamed from: d, reason: collision with root package name */
    public int f19520d;

    /* renamed from: e, reason: collision with root package name */
    public int f19521e;

    /* renamed from: f, reason: collision with root package name */
    public int f19522f;

    /* renamed from: g, reason: collision with root package name */
    public int f19523g;

    /* renamed from: h, reason: collision with root package name */
    public int f19524h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ b f19525i;

    public a(b bVar, int i5, int i11) {
        this.f19525i = bVar;
        this.f19517a = i5;
        this.f19518b = i11;
        a();
    }

    public final void a() {
        this.f19523g = 255;
        this.f19521e = 255;
        this.f19519c = 255;
        this.f19524h = 0;
        this.f19522f = 0;
        this.f19520d = 0;
        for (int i5 = this.f19517a; i5 <= this.f19518b; i5++) {
            int i11 = this.f19525i.f19528b[i5];
            int iRed = Color.red(i11);
            int iGreen = Color.green(i11);
            int iBlue = Color.blue(i11);
            if (iRed > this.f19520d) {
                this.f19520d = iRed;
            }
            if (iRed < this.f19519c) {
                this.f19519c = iRed;
            }
            if (iGreen > this.f19522f) {
                this.f19522f = iGreen;
            }
            if (iGreen < this.f19521e) {
                this.f19521e = iGreen;
            }
            if (iBlue > this.f19524h) {
                this.f19524h = iBlue;
            }
            if (iBlue < this.f19523g) {
                this.f19523g = iBlue;
            }
        }
    }

    public final int b() {
        return ((this.f19524h - this.f19523g) + 1) * ((this.f19522f - this.f19521e) + 1) * ((this.f19520d - this.f19519c) + 1);
    }
}
