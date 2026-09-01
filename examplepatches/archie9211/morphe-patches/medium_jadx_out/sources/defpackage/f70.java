package defpackage;

import android.content.ClipData;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.FacebookException;
import com.google.firebase.encoders.EncodingException;
import com.medium.android.donkey.DonkeyApplication;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.susi.ui.apple.AppleAuthResult;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.util.concurrent.Callable;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class f70 implements i70, p25, km8, m33, dz1, o92, kr8, s72, ha4, yp8, oa6, jg4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ f70(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.yp8
    public z4f W(View view, z4f z4fVar) {
        ImageCarouselActivity imageCarouselActivity = (ImageCarouselActivity) this.b;
        int i = ImageCarouselActivity.x;
        view.getClass();
        b36 b36VarI = z4fVar.a.i(519);
        b36VarI.getClass();
        uz5 uz5Var = imageCarouselActivity.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        View view2 = (View) uz5Var.e;
        ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
        if (layoutParams == null) {
            z72.c("null cannot be cast to non-null type androidx.constraintlayout.widget.ConstraintLayout.LayoutParams");
            return null;
        }
        t52 t52Var = (t52) layoutParams;
        ((ViewGroup.MarginLayoutParams) t52Var).leftMargin = b36VarI.a;
        ((ViewGroup.MarginLayoutParams) t52Var).rightMargin = b36VarI.c;
        ((ViewGroup.MarginLayoutParams) t52Var).topMargin = b36VarI.b;
        view2.setLayoutParams(t52Var);
        return z4f.b;
    }

    @Override // defpackage.p25
    public void a(String str, Bundle bundle) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 2:
                s0 s0Var = (s0) obj;
                Parcelable parcelable = (Parcelable) ht2.r0(bundle, "apple_auth_result", AppleAuthResult.class);
                if (parcelable == null) {
                    ay0.e("Required 'apple_auth_result' is null.");
                } else {
                    s0Var.invoke(parcelable);
                }
                break;
            default:
                EditPostFragment editPostFragment = (EditPostFragment) obj;
                int i2 = EditPostFragment.Q0;
                vx0.c0(o7f.x(editPostFragment), null, null, new r91(editPostFragment, bundle, null, 29), 3);
                break;
        }
    }

    @Override // defpackage.s72
    public void accept(Object obj) {
        k0 k0Var = (k0) this.b;
        int i = DonkeyApplication.m;
        k0Var.invoke(obj);
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00ef  */
    @Override // defpackage.jg4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void b(java.io.File r19) {
        /*
            Method dump skipped, instruction units count: 376
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f70.b(java.io.File):void");
    }

    @Override // defpackage.ha4
    public void c(boolean z) {
        String str = (String) this.b;
        SecureRandom secureRandom = FacebookException.a;
        if (z) {
            try {
                p14 p14Var = new p14(str);
                if ((p14Var.b == null || p14Var.c == null) ? false : true) {
                    xz5.F0(p14Var.a, p14Var.toString());
                }
            } catch (Exception unused) {
            }
        }
    }

    @Override // defpackage.i70
    public int d(int i, ip6 ip6Var) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                return ((yq0) obj).a(0, i, ip6Var);
            default:
                return ((zq0) obj).a(0, i);
        }
    }

    @Override // defpackage.m33
    public void e(h8a h8aVar) {
        pc2 pc2Var = (pc2) this.b;
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", "Crashlytics native component now available.", null);
        }
        pc2Var.b.set((pc2) h8aVar.get());
    }

    /* JADX WARN: Can't wrap try/catch for region: R(36:0|2|(1:4)(1:6)|5|7|(1:9)|(1:11)(1:12)|13|(31:17|33|(1:35)|36|(1:38)|39|(4:42|(3:151|44|154)(1:153)|152|40)|150|45|145|46|47|(1:49)|50|(1:52)|(1:54)(1:55)|56|(4:59|(2:61|156)(1:157)|62|57)|155|63|(2:66|64)|158|67|(1:69)(1:70)|71|(5:76|(1:78)|79|3ce|83)(1:75)|84|(12:94|95|(2:97|(1:99))(2:100|(2:127|128))|102|147|103|143|104|105|106|(3:121|(1:123)|124)(3:114|(1:116)|117)|126)(12:88|(1:90)(2:91|(1:93)(0))|95|(0)(0)|102|147|103|143|104|105|106|(6:108|110|121|(0)|124|126)(0))|134|(2:136|(1:138))|139)(3:18|(3:22|30|(1:32))(4:23|(2:26|24)|149|27)|28)|29|36|(0)|39|(1:40)|150|45|145|46|47|(0)|50|(0)|(0)(0)|56|(1:57)|155|63|(1:64)|158|67|(0)(0)|71|(5:73|76|(0)|79|3ce)(0)|134|(0)|139) */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x05f3, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x05f4, code lost:
    
        r10 = "FirebaseCrashlytics";
        android.util.Log.e(r10, "Error retrieving app package info.", r0);
        r15 = null;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x043b  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0577  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0580  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0607  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x03cf A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x01f8  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0205  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x025e  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x02c7  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x02cf  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x02e6  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0312 A[LOOP:3: B:64:0x030c->B:66:0x0312, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0326  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x032d  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x03ae  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x03b6  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0421  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x042b  */
    /* JADX WARN: Type inference failed for: r4v29 */
    /* JADX WARN: Type inference failed for: r4v30 */
    /* JADX WARN: Type inference failed for: r4v61 */
    /* JADX WARN: Type inference failed for: r4v62 */
    @Override // defpackage.dz1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f(defpackage.iq1 r48) {
        /*
            Method dump skipped, instruction units count: 1563
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f70.f(iq1):java.lang.Object");
    }

    @Override // defpackage.km8
    public Object g() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 4:
                Constructor constructor = (Constructor) obj;
                try {
                    return constructor.newInstance(null);
                } catch (IllegalAccessException e) {
                    to7 to7Var = w1b.a;
                    lg8.p("Unexpected IllegalAccessException occurred (Gson 2.14.0). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e);
                    return null;
                } catch (InstantiationException e2) {
                    throw new RuntimeException("Failed to invoke constructor '" + w1b.b(constructor) + "' with no args", e2);
                } catch (InvocationTargetException e3) {
                    lg8.p("Failed to invoke constructor '" + w1b.b(constructor) + "' with no args", e3.getCause());
                    return null;
                }
            default:
                Class cls = (Class) obj;
                try {
                    return j2e.a.a(cls);
                } catch (Exception e4) {
                    throw new RuntimeException("Unable to create instance of " + cls + ". Registering an InstanceCreator or a TypeAdapter for this type, or adding a no-args constructor may fix this problem.", e4);
                }
        }
    }

    public l70 h(m50 m50Var) throws IOException {
        nj1 nj1Var = (nj1) this.b;
        URL url = (URL) m50Var.b;
        String strZ = n01.Z("CctTransportBackend");
        if (Log.isLoggable(strZ, 4)) {
            Log.i(strZ, String.format("Making request to: %s", url));
        }
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setConnectTimeout(30000);
        httpURLConnection.setReadTimeout(130000);
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setInstanceFollowRedirects(false);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setRequestProperty("User-Agent", "datatransport/3.3.0 android/");
        httpURLConnection.setRequestProperty("Content-Encoding", "gzip");
        httpURLConnection.setRequestProperty("Content-Type", "application/json");
        httpURLConnection.setRequestProperty("Accept-Encoding", "gzip");
        String str = (String) m50Var.d;
        if (str != null) {
            httpURLConnection.setRequestProperty("X-Goog-Api-Key", str);
        }
        try {
            OutputStream outputStream = httpURLConnection.getOutputStream();
            try {
                GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(outputStream);
                try {
                    rz2 rz2Var = nj1Var.a;
                    rh0 rh0Var = (rh0) m50Var.c;
                    BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(gZIPOutputStream));
                    yb6 yb6Var = (yb6) rz2Var.b;
                    xd6 xd6Var = new xd6(bufferedWriter, yb6Var.a, yb6Var.b, yb6Var.c, yb6Var.d);
                    xd6Var.h(rh0Var);
                    xd6Var.j();
                    xd6Var.b.flush();
                    gZIPOutputStream.close();
                    if (outputStream != null) {
                        outputStream.close();
                    }
                    int responseCode = httpURLConnection.getResponseCode();
                    Integer numValueOf = Integer.valueOf(responseCode);
                    String strZ2 = n01.Z("CctTransportBackend");
                    if (Log.isLoggable(strZ2, 4)) {
                        Log.i(strZ2, String.format("Status Code: %d", numValueOf));
                    }
                    n01.T(httpURLConnection.getHeaderField("Content-Type"), "CctTransportBackend", "Content-Type: %s");
                    n01.T(httpURLConnection.getHeaderField("Content-Encoding"), "CctTransportBackend", "Content-Encoding: %s");
                    if (responseCode == 302 || responseCode == 301 || responseCode == 307) {
                        return new l70(responseCode, new URL(httpURLConnection.getHeaderField("Location")), 0L);
                    }
                    if (responseCode != 200) {
                        return new l70(responseCode, null, 0L);
                    }
                    InputStream inputStream = httpURLConnection.getInputStream();
                    try {
                        InputStream gZIPInputStream = "gzip".equals(httpURLConnection.getHeaderField("Content-Encoding")) ? new GZIPInputStream(inputStream) : inputStream;
                        try {
                            l70 l70Var = new l70(responseCode, null, vj0.a(new BufferedReader(new InputStreamReader(gZIPInputStream))).a);
                            if (gZIPInputStream != null) {
                                gZIPInputStream.close();
                            }
                            if (inputStream != null) {
                                inputStream.close();
                            }
                            return l70Var;
                        } finally {
                        }
                    } finally {
                    }
                } finally {
                }
            } finally {
            }
        } catch (EncodingException e) {
            e = e;
            n01.U(e, "CctTransportBackend", "Couldn't encode request, returning with 400");
            return new l70(400, null, 0L);
        } catch (ConnectException e2) {
            e = e2;
            n01.U(e, "CctTransportBackend", "Couldn't open connection, returning with 500");
            return new l70(500, null, 0L);
        } catch (UnknownHostException e3) {
            e = e3;
            n01.U(e, "CctTransportBackend", "Couldn't open connection, returning with 500");
            return new l70(500, null, 0L);
        } catch (IOException e4) {
            e = e4;
            n01.U(e, "CctTransportBackend", "Couldn't encode request, returning with 400");
            return new l70(400, null, 0L);
        }
    }

    @Override // defpackage.kr8
    public void i(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 10:
                ((fh2) obj2).invoke(obj);
                break;
            case 11:
                ((vh2) obj2).invoke(obj);
                break;
            case 12:
                ((zh2) obj2).invoke(obj);
                break;
            case 13:
                ((gi2) obj2).invoke(obj);
                break;
            case 14:
                ((ki2) obj2).invoke(obj);
                break;
            case 15:
                ((hi2) obj2).invoke(obj);
                break;
            case 16:
                ((ji2) obj2).invoke(obj);
                break;
            default:
                ((h95) obj2).invoke(obj);
                break;
        }
    }

    public boolean j(rz2 rz2Var, int i, Bundle bundle) {
        m82 l82Var;
        l20 l20Var = (l20) this.b;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 25 && (i & 1) != 0) {
            try {
                ((q26) rz2Var.b).c();
                Parcelable parcelable = (Parcelable) ((q26) rz2Var.b).k();
                bundle = bundle == null ? new Bundle() : new Bundle(bundle);
                bundle.putParcelable("androidx.core.view.extra.INPUT_CONTENT_INFO", parcelable);
            } catch (Exception e) {
                Log.w("InputConnectionCompat", "Can't insert content from IME; requestPermission() failed", e);
                return false;
            }
        }
        q26 q26Var = (q26) rz2Var.b;
        ClipData clipData = new ClipData(q26Var.getDescription(), new ClipData.Item(q26Var.b()));
        if (i2 >= 31) {
            l82Var = new l82(clipData, 2);
        } else {
            n82 n82Var = new n82();
            n82Var.b = clipData;
            n82Var.c = 2;
            l82Var = n82Var;
        }
        l82Var.b(q26Var.g());
        l82Var.setExtras(bundle);
        return ute.k(l20Var, l82Var.build()) == null;
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 8:
                return (jrg) ((Callable) obj).call();
            default:
                ((Runnable) obj).run();
                return vp7.x(null);
        }
    }

    @Override // defpackage.oa6
    public void run() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 24:
                ((u5e) obj).close();
                break;
            default:
                n0c n0cVar = (n0c) obj;
                na6 na6Var = (na6) n0cVar.e;
                if (na6Var.w.compareAndSet(1, 4)) {
                    mse mseVar = (mse) n0cVar.b;
                    mseVar.d.I(na6Var, na6Var.D);
                }
                break;
        }
    }
}
