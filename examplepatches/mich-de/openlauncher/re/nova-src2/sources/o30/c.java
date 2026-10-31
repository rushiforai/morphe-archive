package o30;

import ai.k4;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.licensing_misc.util.Base64DecoderException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import javax.crypto.NoSuchPaddingException;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: e, reason: collision with root package name */
    public static final Method f79470e = v30.e.h("java.security.Signature", "getInstance", String.class);

    /* renamed from: f, reason: collision with root package name */
    public static final Method f79471f = v30.e.h("java.security.Signature", "initVerify", v30.e.f("java.security.PublicKey"));

    /* renamed from: g, reason: collision with root package name */
    public static final Method f79472g = v30.e.h("java.security.Signature", "update", byte[].class);

    /* renamed from: h, reason: collision with root package name */
    public static final Method f79473h = v30.e.h("java.security.Signature", "verify", byte[].class);

    /* renamed from: a, reason: collision with root package name */
    public final d f79474a;

    /* renamed from: b, reason: collision with root package name */
    public final k4 f79475b;

    /* renamed from: c, reason: collision with root package name */
    public final int f79476c;

    /* renamed from: d, reason: collision with root package name */
    public final String f79477d;

    public c(a aVar, k4 k4Var, int i5, String str) {
        this.f79474a = aVar;
        this.f79475b = k4Var;
        this.f79476c = i5;
        this.f79477d = str;
    }

    public final void a(int i5) throws NoSuchPaddingException, NoSuchAlgorithmException, PackageManager.NameNotFoundException, InvalidKeyException, InvalidAlgorithmParameterException {
        if (i5 == 114) {
            d dVar = this.f79474a;
            if (dVar instanceof a) {
                a aVar = (a) dVar;
                aVar.e("1 " + a.f79461h, a.f79462i);
                mh.c cVar = aVar.f79469g;
                SharedPreferences.Editor editor = (SharedPreferences.Editor) cVar.f76325d;
                if (editor != null) {
                    editor.apply();
                    cVar.f76325d = null;
                }
            }
        }
        this.f79475b.d(i5);
    }

    public final void b(int i5, g gVar, int i11) throws NoSuchPaddingException, NoSuchAlgorithmException, PackageManager.NameNotFoundException, InvalidKeyException, NumberFormatException, UnsupportedEncodingException, InvalidAlgorithmParameterException {
        a aVar = (a) this.f79474a;
        aVar.d(i5, gVar);
        ArrayList arrayListA = aVar.a(true);
        k4 k4Var = this.f79475b;
        if (arrayListA == null) {
            k4Var.d(i11);
        } else {
            k4Var.b();
        }
    }

    public final void c(int i5, Object obj, String str, String str2) throws IllegalAccessException, NoSuchPaddingException, NoSuchAlgorithmException, PackageManager.NameNotFoundException, InvalidKeyException, IllegalArgumentException, UnsupportedEncodingException, InvalidAlgorithmParameterException, InvocationTargetException {
        Object objInvoke;
        k4 k4Var = this.f79475b;
        g gVarA = null;
        if (i5 == 0 || i5 == 1 || i5 == 2) {
            try {
                objInvoke = f79470e.invoke(null, "SHA1withRSA");
                f79471f.invoke(objInvoke, obj);
            } catch (Base64DecoderException unused) {
                a(111);
                return;
            } catch (IllegalAccessException e3) {
                NovaLauncher.x1(e3);
                k4Var.d(104);
            } catch (IllegalArgumentException e11) {
                NovaLauncher.x1(e11);
                k4Var.d(104);
            } catch (InvocationTargetException e12) {
                NovaLauncher.x1(e12);
                k4Var.d(104);
            } catch (Exception e13) {
                NovaLauncher.x1(e13);
                k4Var.d(104);
            }
            if (i5 == 1 && str == null) {
                b(1, null, 113);
                return;
            }
            if (str == null) {
                b(1, null, 113);
                return;
            }
            f79472g.invoke(objInvoke, str.getBytes());
            if (!((Boolean) f79473h.invoke(objInvoke, q30.a.a(str2))).booleanValue()) {
                a(114);
                return;
            }
            try {
                gVarA = g.a(str, str2);
                if (gVarA.f79491a != i5) {
                    a(111);
                    return;
                }
                if (gVarA.f79492b != this.f79476c) {
                    a(111);
                    return;
                } else if (!gVarA.f79493c.equals(this.f79477d)) {
                    a(111);
                    return;
                } else if (TextUtils.isEmpty(gVarA.f79495e)) {
                    a(111);
                    return;
                }
            } catch (Exception unused2) {
                a(111);
                return;
            }
        }
        if (i5 == 1) {
            b(1, gVarA, 0);
            return;
        }
        if (i5 <= 1) {
            b(0, gVarA, 0);
            return;
        }
        if (i5 == 3) {
            b(1, gVarA, 102);
        }
        if (i5 <= 5 || i5 == 257) {
            b(2, gVarA, 112);
        } else {
            k4Var.d(102);
        }
    }
}
