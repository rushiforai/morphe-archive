package aa;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.EditShortcutFloatingView;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f533a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BitmapInfo f534b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ mx.k0 f535c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Bitmap f536d;

    public /* synthetic */ a(BitmapInfo bitmapInfo, mx.k0 k0Var, Bitmap bitmap) {
        this.f534b = bitmapInfo;
        this.f535c = k0Var;
        this.f536d = bitmap;
    }

    @Override // aa.f
    public final void b(Canvas canvas) {
        int i5 = this.f533a;
        Bitmap bitmap = this.f536d;
        mx.k0 k0Var = this.f535c;
        BitmapInfo bitmapInfo = this.f534b;
        switch (i5) {
            case 0:
                k0Var.p().l(bitmap, canvas);
                if (bitmapInfo != null) {
                    b bVar = new b(null, bitmapInfo.f21151a);
                    int i11 = k0Var.f551h;
                    int i12 = i11 - ((int) (i11 * 0.444f));
                    bVar.setBounds(i12, i12, i11, i11);
                    bVar.draw(canvas);
                    break;
                }
                break;
            default:
                int i13 = EditShortcutFloatingView.f45599v;
                canvas.drawBitmap(bitmapInfo.f21151a, 0.0f, 0.0f, new Paint(3));
                n nVar = new n(bitmap, 0, false);
                int i14 = k0Var.f551h;
                int i15 = i14 - ((int) (i14 * 0.444f));
                nVar.setBounds(i15, i15, i14, i14);
                nVar.draw(canvas);
                break;
        }
    }

    public /* synthetic */ a(mx.k0 k0Var, Bitmap bitmap, BitmapInfo bitmapInfo) {
        this.f535c = k0Var;
        this.f536d = bitmap;
        this.f534b = bitmapInfo;
    }
}
