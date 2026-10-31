package aa;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.icons.ThemedIconDrawable$ThemedBitmapInfo;

/* loaded from: classes2.dex */
public final class o0 extends AdaptiveIconDrawable implements e {

    /* renamed from: a, reason: collision with root package name */
    public final n0 f639a;

    public o0(AdaptiveIconDrawable adaptiveIconDrawable, n0 n0Var) {
        super(adaptiveIconDrawable.getBackground(), adaptiveIconDrawable.getForeground());
        this.f639a = n0Var;
    }

    @Override // aa.e
    public final BitmapInfo a(Bitmap bitmap, int i5, c cVar, float f11, UserHandle userHandle) {
        Bitmap bitmap2 = null;
        if (!Process.myUserHandle().equals(userHandle)) {
            int i11 = cVar.f551h;
            if (cVar.f553j == null) {
                Bitmap.Config config = Bitmap.Config.ARGB_8888;
                Drawable userBadgedIcon = cVar.f547d.getUserBadgedIcon(new b(null, Bitmap.createBitmap(i11, i11, config)), userHandle);
                if (userBadgedIcon instanceof BitmapDrawable) {
                    cVar.f553j = ((BitmapDrawable) userBadgedIcon).getBitmap();
                } else {
                    userBadgedIcon.setBounds(0, 0, i11, i11);
                    Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i11, i11, config);
                    userBadgedIcon.draw(new Canvas(bitmapCreateBitmap));
                    cVar.f553j = bitmapCreateBitmap;
                }
            }
            bitmap2 = cVar.f553j;
        }
        return new ThemedIconDrawable$ThemedBitmapInfo(bitmap, i5, this.f639a, f11, bitmap2);
    }

    @Override // aa.e
    public final void b(Canvas canvas) {
        draw(canvas);
    }

    @Override // aa.e
    public final Drawable e(Context context) {
        int[] iArrL = q0.l(context);
        ColorDrawable colorDrawable = new ColorDrawable(iArrL[0]);
        float extraInsetFraction = AdaptiveIconDrawable.getExtraInsetFraction() / ((AdaptiveIconDrawable.getExtraInsetFraction() * 2.0f) + 1.0f);
        int i5 = iArrL[1];
        n0 n0Var = this.f639a;
        Drawable drawableMutate = n0Var.f636a.getDrawable(n0Var.f637b).mutate();
        drawableMutate.setTint(i5);
        return new AdaptiveIconDrawable(colorDrawable, new InsetDrawable(new InsetDrawable(drawableMutate, 0.2f), extraInsetFraction));
    }
}
