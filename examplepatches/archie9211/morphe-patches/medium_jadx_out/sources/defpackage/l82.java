package defpackage;

import android.content.ClipData;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContentInfo;
import android.view.ScrollCaptureTarget;
import java.util.Arrays;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l82 implements m82, o82 {
    public final /* synthetic */ int a;
    public final Object b;

    public l82() {
        this.a = 2;
        this.b = qo7.u(Boolean.FALSE);
    }

    @Override // defpackage.o82
    public ClipData a() {
        return ((ContentInfo) this.b).getClip();
    }

    @Override // defpackage.m82
    public void b(Uri uri) {
        ((ContentInfo.Builder) this.b).setLinkUri(uri);
    }

    @Override // defpackage.m82
    public p82 build() {
        return new p82(new l82(((ContentInfo.Builder) this.b).build()));
    }

    @Override // defpackage.m82
    public void c(int i) {
        ((ContentInfo.Builder) this.b).setFlags(i);
    }

    @Override // defpackage.o82
    public int d() {
        return ((ContentInfo) this.b).getSource();
    }

    @Override // defpackage.o82
    public ContentInfo e() {
        return (ContentInfo) this.b;
    }

    public void f(mn mnVar, cyb cybVar, ib2 ib2Var, Consumer consumer) {
        o78 o78Var = new o78(new mrb[16]);
        aq7.G(cybVar.a(), 0, new zda(1, o78Var, o78.class, "add", "add(Ljava/lang/Object;)Z", 8, 1));
        Arrays.sort(o78Var.a, 0, o78Var.c, new jx1(0, new x45[]{ox8.g, ox8.h}));
        int i = o78Var.c;
        mrb mrbVar = (mrb) (i == 0 ? null : o78Var.a[i - 1]);
        if (mrbVar == null) {
            return;
        }
        o46 o46Var = mrbVar.c;
        l12 l12Var = new l12(mrbVar.a, o46Var, o7f.c(ib2Var), this, mnVar);
        eh8 eh8Var = mrbVar.d;
        zwa zwaVarH = sgg.K(eh8Var).H(eh8Var, true);
        long jC = o46Var.c();
        ScrollCaptureTarget scrollCaptureTarget = new ScrollCaptureTarget(mnVar, kk7.E(g76.c0(zwaVarH)), new Point((int) (jC >> 32), (int) (jC & 4294967295L)), l12Var);
        scrollCaptureTarget.setScrollBounds(kk7.E(o46Var));
        consumer.accept(scrollCaptureTarget);
    }

    @Override // defpackage.o82
    public int getFlags() {
        return ((ContentInfo) this.b).getFlags();
    }

    @Override // defpackage.m82
    public void setExtras(Bundle bundle) {
        ((ContentInfo.Builder) this.b).setExtras(bundle);
    }

    public String toString() {
        switch (this.a) {
            case 1:
                return "ContentInfoCompat{" + ((ContentInfo) this.b) + "}";
            default:
                return super.toString();
        }
    }

    public l82(ContentInfo contentInfo) {
        this.a = 1;
        contentInfo.getClass();
        this.b = contentInfo;
    }

    public l82(ClipData clipData, int i) {
        this.a = 0;
        this.b = go.b(clipData, i);
    }
}
