package defpackage;

import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nh8 implements k90 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ Resources b;

    public nh8(boolean z, Resources resources) {
        this.a = z;
        this.b = resources;
    }

    @Override // defpackage.k90
    public final Object a(gx5 gx5Var, rx5 rx5Var, n92 n92Var) {
        yr0 yr0Var;
        boolean z = this.a;
        Resources resources = this.b;
        if (z) {
            Drawable drawable = resources.getDrawable(2131231240, null);
            drawable.getClass();
            yr0Var = new yr0(u36.g(new wp(((BitmapDrawable) drawable).getBitmap())));
        } else {
            Drawable drawable2 = resources.getDrawable(2131231241, null);
            drawable2.getClass();
            yr0Var = new yr0(u36.g(new wp(((BitmapDrawable) drawable2).getBitmap())));
        }
        return new e90(sgg.z(yr0Var, rx5Var.a, 1), new w0d(yr0Var, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
    }
}
