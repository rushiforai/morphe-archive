package defpackage;

import android.net.Uri;
import android.widget.ImageView;
import com.medium.android.domain.post.models.Highlight;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ev9 implements z19 {
    public final /* synthetic */ sw9 a;

    public ev9(sw9 sw9Var) {
        this.a = sw9Var;
    }

    @Override // defpackage.z19
    public final void a(Uri uri) {
        uri.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new kd7(uri, sw9Var, null, 25), 3);
    }

    @Override // defpackage.z19
    public final void b(String str) {
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new dv9(sw9Var, str, null, 0), 3);
    }

    @Override // defpackage.z19
    public final void c(Highlight highlight) {
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new n79(highlight, sw9Var, null, 6), 3);
    }

    @Override // defpackage.z19
    public final void d(Highlight highlight) {
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new kd7(sw9Var, highlight, null, 24), 3);
    }

    public final void e(String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var) {
        str.getClass();
        str2.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new y78(sw9Var, str, str2, str3, num, num2, str4, imageView, cx7Var, null, 2), 3);
    }
}
