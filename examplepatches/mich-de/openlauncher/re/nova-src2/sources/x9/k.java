package x9;

import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final /* synthetic */ class k implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95657a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u f95658b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Path f95659c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ga.e f95660d;

    public /* synthetic */ k(u uVar, Path path, ga.e eVar, int i5) {
        this.f95657a = i5;
        this.f95658b = uVar;
        this.f95659c = path;
        this.f95660d = eVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f95657a) {
            case 0:
                u uVar = this.f95658b;
                uVar.f95681m.h(new k(uVar, this.f95659c, this.f95660d, 1));
                break;
            default:
                u uVar2 = this.f95658b;
                uVar2.A = this.f95659c;
                uVar2.removeAllViewsInLayout();
                if (this.f95660d.m()) {
                    aa.n nVar = new aa.n(Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888), 0, false);
                    nVar.j(true);
                    Drawable drawable = uVar2.f95689w;
                    Paint paint = nVar.f626a;
                    drawable.setColorFilter(paint.getColorFilter());
                    uVar2.f95690x.setColorFilter(paint.getColorFilter());
                    uVar2.B.setColorFilter(paint.getColorFilter());
                }
                uVar2.invalidate();
                break;
        }
    }
}
