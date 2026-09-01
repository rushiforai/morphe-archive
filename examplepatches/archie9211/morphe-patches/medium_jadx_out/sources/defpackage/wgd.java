package defpackage;

import android.content.ContentProviderClient;
import android.content.res.TypedArray;
import android.drm.DrmManagerClient;
import android.media.MediaDrm;
import android.media.MediaMetadataRetriever;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.android.billingclient.api.BillingResult;
import com.google.android.recaptcha.internal.zzfx;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import kotlinx.coroutines.TimeoutCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class wgd {
    public static int A(int i, int i2, int i3, int i4) {
        return c4g.p(i) + i2 + i3 + i4;
    }

    public static /* synthetic */ void B(AutoCloseable autoCloseable) throws Exception {
        if (autoCloseable instanceof AutoCloseable) {
            autoCloseable.close();
            return;
        }
        if (autoCloseable instanceof ExecutorService) {
            cm0.i((ExecutorService) autoCloseable);
            return;
        }
        if (autoCloseable instanceof TypedArray) {
            ((TypedArray) autoCloseable).recycle();
            return;
        }
        if (autoCloseable instanceof MediaMetadataRetriever) {
            ((MediaMetadataRetriever) autoCloseable).release();
            return;
        }
        if (autoCloseable instanceof MediaDrm) {
            ((MediaDrm) autoCloseable).release();
            return;
        }
        if (autoCloseable instanceof DrmManagerClient) {
            ((DrmManagerClient) autoCloseable).release();
        } else if (autoCloseable instanceof ContentProviderClient) {
            ((ContentProviderClient) autoCloseable).release();
        } else {
            lg8.r();
        }
    }

    public static int C(int i, int i2, int i3) {
        return c4g.p(i) + i2 + i3;
    }

    public static que a(uue uueVar, wg6 wg6Var, g68 g68Var) {
        wg6Var.getClass();
        return uueVar.b(vx0.T(wg6Var), g68Var);
    }

    public static wid b(wid widVar, wid widVar2) {
        boolean z = widVar2 instanceof gz0;
        if (!z || !(widVar instanceof gz0)) {
            return (!z || (widVar instanceof gz0)) ? (z || !(widVar instanceof gz0)) ? widVar2.d(new doc(13, widVar)) : widVar : widVar2;
        }
        gz0 gz0Var = (gz0) widVar2;
        g3c g3cVar = gz0Var.a;
        float f = gz0Var.b;
        if (Float.isNaN(f)) {
            f = ((gz0) widVar).b;
        }
        return new gz0(g3cVar, f);
    }

    public static void c(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x0111  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object d(defpackage.z2g r8, java.lang.Object[] r9) {
        /*
            Method dump skipped, instruction units count: 326
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wgd.d(z2g, java.lang.Object[]):java.lang.Object");
    }

    public static b1g e(m1g m1gVar, Exception exc) {
        int i = 27;
        if (!(exc instanceof TimeoutCancellationException) && (!(exc instanceof zzfx) || !g76.L(((zzfx) exc).b, d87.f))) {
            i = 2;
        }
        int iZza = m1gVar.zza();
        btf btfVarV = ctf.v();
        btfVarV.c();
        ((ctf) btfVarV.b).w(iZza);
        btfVarV.c();
        ((ctf) btfVarV.b).x(13);
        btfVarV.c();
        ((ctf) btfVarV.b).y(i);
        return en7.b0(m1gVar, (ctf) btfVarV.e());
    }

    public static wcg f(m1g m1gVar, orf orfVar) {
        return new wcg(36, new j5d(m1gVar, orfVar, (n92) null, 29), new Integer(m1gVar.zza()));
    }

    public static ycg g(m1g m1gVar, String str, arf arfVar) {
        return new ycg(new i1g(m1gVar, str, arfVar, null, 1));
    }

    public static ycg h() {
        return new ycg(new at(2, 7, null));
    }

    public static xe3 i(int i, int i2, int i3) {
        if (i == -2) {
            return ve3.a;
        }
        int i4 = i - i3;
        if (i4 > 0) {
            ue3.a(i4);
            return new ue3(i4);
        }
        int i5 = i2 - i3;
        if (i5 <= 0) {
            return null;
        }
        ue3.a(i5);
        return new ue3(i5);
    }

    public static cfc j(vva vvaVar) {
        ImageView imageView = vvaVar.b;
        ViewGroup.LayoutParams layoutParams = imageView.getLayoutParams();
        xe3 xe3VarI = i(layoutParams != null ? layoutParams.width : -1, imageView.getWidth(), imageView.getPaddingRight() + imageView.getPaddingLeft());
        if (xe3VarI == null) {
            return null;
        }
        ViewGroup.LayoutParams layoutParams2 = imageView.getLayoutParams();
        xe3 xe3VarI2 = i(layoutParams2 != null ? layoutParams2.height : -1, imageView.getHeight(), imageView.getPaddingBottom() + imageView.getPaddingTop());
        if (xe3VarI2 == null) {
            return null;
        }
        return new cfc(xe3VarI, xe3VarI2);
    }

    public static void k(q52 q52Var, w52 w52Var, float f, int i) {
        if ((i & 2) != 0) {
            f = 0.0f;
        }
        q52Var.b(w52Var, f, 0.0f);
    }

    public static int l(int i, int i2, int i3) {
        return h30.c0(i) + i2 + i3;
    }

    public static int m(int i, int i2, int i3, int i4) {
        return h30.c0(i) + i2 + i3 + i4;
    }

    public static int n(int i, int i2, int i3, int i4, int i5) {
        return Math.max(((i * i2) / i3) + i4, i5);
    }

    public static int o(int i, int i2, String str) {
        return (str.hashCode() + i) * i2;
    }

    public static int p(int i, int i2, List list) {
        return (list.hashCode() + i) * i2;
    }

    public static /* synthetic */ int q(long j) {
        int i = (int) j;
        if (j == i) {
            return i;
        }
        throw new ArithmeticException();
    }

    public static int r(p65 p65Var, boolean z, boolean z2, int i, int i2) {
        p65Var.p(z);
        p65Var.p(z2);
        return i + i2;
    }

    public static BillingResult s(int i, String str) {
        BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
        builderNewBuilder.setResponseCode(i);
        builderNewBuilder.setDebugMessage(str);
        return builderNewBuilder.build();
    }

    public static String t(char c, String str, String str2) {
        return str + str2 + c;
    }

    public static String u(Object obj, String str, String str2) {
        br7.v(obj);
        return str + str2;
    }

    public static ArrayList v() {
        new ArrayList();
        return new ArrayList();
    }

    public static void w(int i, int i2, p65 p65Var, boolean z) {
        p65Var.Y(i);
        p65Var.Y(i2);
        p65Var.p(z);
    }

    public static /* synthetic */ void x(AutoCloseable autoCloseable) throws Exception {
        if (autoCloseable instanceof AutoCloseable) {
            autoCloseable.close();
            return;
        }
        if (autoCloseable instanceof ExecutorService) {
            cm0.i((ExecutorService) autoCloseable);
            return;
        }
        if (autoCloseable instanceof TypedArray) {
            ((TypedArray) autoCloseable).recycle();
            return;
        }
        if (autoCloseable instanceof MediaMetadataRetriever) {
            ((MediaMetadataRetriever) autoCloseable).release();
            return;
        }
        if (autoCloseable instanceof MediaDrm) {
            ((MediaDrm) autoCloseable).release();
            return;
        }
        if (autoCloseable instanceof DrmManagerClient) {
            ((DrmManagerClient) autoCloseable).release();
        } else if (autoCloseable instanceof ContentProviderClient) {
            ((ContentProviderClient) autoCloseable).release();
        } else {
            lg8.r();
        }
    }

    public static void y(StringBuilder sb, String str, long j, String str2) {
        sb.append(str);
        sb.append(j);
        sb.append(str2);
    }

    public static int z(int i, int i2, int i3) {
        return htf.v(i) + i2 + i3;
    }
}
