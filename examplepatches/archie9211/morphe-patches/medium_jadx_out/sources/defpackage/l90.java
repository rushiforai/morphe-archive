package defpackage;

import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l90 implements k90 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Resources b;

    public /* synthetic */ l90(Resources resources, int i) {
        this.a = i;
        this.b = resources;
    }

    @Override // defpackage.k90
    public final Object a(gx5 gx5Var, rx5 rx5Var, n92 n92Var) {
        ew5 yu1Var;
        ew5 yu1Var2;
        ew5 yu1Var3;
        ew5 yu1Var4;
        int i = this.a;
        ql8 ql8Var = ql8.a;
        Resources resources = this.b;
        switch (i) {
            case 0:
                Drawable drawable = resources.getDrawable(R.drawable.post_image_sample, null);
                drawable.getClass();
                yr0 yr0Var = new yr0(u36.g(new wp(((BitmapDrawable) drawable).getBitmap())));
                return new e90(sgg.z(yr0Var, rx5Var.a, 1), new w0d(yr0Var, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
            case 1:
                if (rx5Var.b.equals(ql8Var)) {
                    yu1Var = new yu1(op8.n0(uu1.g));
                } else {
                    Drawable drawable2 = resources.getDrawable(R.drawable.publication_avatar_sample, null);
                    drawable2.getClass();
                    yu1Var = new yr0(u36.g(new wp(((BitmapDrawable) drawable2).getBitmap())));
                }
                return new e90(sgg.z(yu1Var, rx5Var.a, 1), new w0d(yu1Var, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
            case 2:
                if (rx5Var.b.equals(ql8Var)) {
                    yu1Var2 = new yu1(op8.n0(uu1.c));
                } else {
                    Drawable drawable3 = resources.getDrawable(R.drawable.avatar_sample, null);
                    drawable3.getClass();
                    yu1Var2 = new yr0(u36.g(new wp(((BitmapDrawable) drawable3).getBitmap())));
                }
                return new e90(sgg.z(yu1Var2, rx5Var.a, 1), new w0d(yu1Var2, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
            case 3:
                if (rx5Var.b.equals(ql8Var)) {
                    yu1Var3 = new yu1(op8.n0(uu1.g));
                } else {
                    Drawable drawable4 = resources.getDrawable(R.drawable.avatar_sample, null);
                    drawable4.getClass();
                    yu1Var3 = new yr0(u36.g(new wp(((BitmapDrawable) drawable4).getBitmap())));
                }
                return new e90(sgg.z(yu1Var3, rx5Var.a, 1), new w0d(yu1Var3, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
            default:
                if (rx5Var.b.equals(ql8Var)) {
                    yu1Var4 = new yu1(op8.n0(uu1.g));
                } else {
                    Drawable drawable5 = resources.getDrawable(R.drawable.post_image_sample, null);
                    drawable5.getClass();
                    yu1Var4 = new yr0(u36.g(new wp(((BitmapDrawable) drawable5).getBitmap())));
                }
                return new e90(sgg.z(yu1Var4, rx5Var.a, 1), new w0d(yu1Var4, rx5Var, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH));
        }
    }
}
