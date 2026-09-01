package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m90 implements k90 {
    public final /* synthetic */ Resources a;
    public final /* synthetic */ Context b;

    public m90(Resources resources, Context context) {
        this.a = resources;
        this.b = context;
    }

    @Override // defpackage.k90
    public final Object a(gx5 gx5Var, rx5 rx5Var, n92 n92Var) {
        yr0 yr0Var;
        if (rx5Var.b.equals(ql8.a)) {
            Drawable drawableE = guc.E(this.b, R.drawable.avatar_fallback);
            if (drawableE == null) {
                ay0.e("Required value was null.");
                return null;
            }
            yr0Var = new yr0(w2g.N(drawableE));
        } else {
            Drawable drawable = this.a.getDrawable(R.drawable.avatar_sample, null);
            drawable.getClass();
            yr0Var = new yr0(u36.g(new wp(((BitmapDrawable) drawable).getBitmap())));
        }
        return new e90(sgg.z(yr0Var, rx5Var.a, 1), new w0d(yr0Var, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
    }
}
