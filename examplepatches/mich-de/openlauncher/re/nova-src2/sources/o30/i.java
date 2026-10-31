package o30;

import ai.k4;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.provider.Settings;
import android.text.TextUtils;
import com.teslacoilsw.licensing_misc.util.Base64DecoderException;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Random;
import mx.g0;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes4.dex */
public final class i implements b {

    /* renamed from: i, reason: collision with root package name */
    public static final Random f79505i = new Random();

    /* renamed from: a, reason: collision with root package name */
    public final h f79506a;

    /* renamed from: c, reason: collision with root package name */
    public final Context f79508c;

    /* renamed from: d, reason: collision with root package name */
    public final a f79509d;

    /* renamed from: e, reason: collision with root package name */
    public final lh.i f79510e;

    /* renamed from: g, reason: collision with root package name */
    public final HashSet f79512g = new HashSet();

    /* renamed from: h, reason: collision with root package name */
    public final LinkedList f79513h = new LinkedList();

    /* renamed from: b, reason: collision with root package name */
    public final PublicKey f79507b = a();

    /* renamed from: f, reason: collision with root package name */
    public final String f79511f = "com.teslacoilsw.launcher";

    public i(Context context, a aVar) throws NoSuchAlgorithmException {
        this.f79508c = context;
        this.f79509d = aVar;
        String strB = b(context);
        this.f79510e = g0.f77095h;
        SharedPreferences sharedPreferences = context.getSharedPreferences("com.teslacoilsw.licensing.info", 0);
        this.f79506a = new h(sharedPreferences.getString(ActionCategory.EMAIL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), sharedPreferences.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), strB);
    }

    public static PublicKey a() {
        try {
            return KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(q30.a.a("MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrdIBfcqrv6EpO676lGJmJXAj+SyktPhd6/302p8shV7nDamJ6Oe808ievYdqzp2hI2l3CX6iAoF3ok6lVVr93aQgnBAlGYSU7fb+rnhdO138cQgR2NKrJXs8i014gicJgIWSQti0AVJehNdbGBESfeYUw8s45k8pOHDcOfMklvwIDAQAB")));
        } catch (Base64DecoderException e3) {
            throw new IllegalArgumentException(e3);
        } catch (NoSuchAlgorithmException e11) {
            throw new RuntimeException(e11);
        } catch (InvalidKeySpecException e12) {
            throw new IllegalArgumentException(e12);
        }
    }

    public static String b(Context context) throws NoSuchAlgorithmException {
        String string = TextUtils.isEmpty(null) ? Settings.Secure.getString(context.getContentResolver(), "android_id") : null;
        if (TextUtils.isEmpty(string) || "000000000000000".equals(string)) {
            String str = Build.BOARD;
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                messageDigest.update((str + str + Build.BRAND + Build.CPU_ABI + Build.DEVICE + Build.DISPLAY + Build.HOST + Build.ID + Build.MANUFACTURER + Build.MODEL + Build.PRODUCT + Build.TAGS + Build.TYPE + Build.USER).getBytes());
                return new BigInteger(1, messageDigest.digest()).toString(16);
            } catch (NoSuchAlgorithmException unused) {
            }
        }
        return string;
    }

    public static boolean d(Context context) {
        try {
            SharedPreferences sharedPreferences = context.getSharedPreferences("com.teslacoilsw.licensing.info", 0);
            if (!TextUtils.isEmpty(sharedPreferences.getString(ActionCategory.EMAIL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))) {
                if (!TextUtils.isEmpty(sharedPreferences.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))) {
                    return true;
                }
            }
        } catch (InternalError unused) {
        }
        return false;
    }

    public final synchronized void c(c cVar) {
        try {
            this.f79509d.d(2, null);
            if (this.f79509d.a(false) != null) {
                cVar.f79475b.b();
            } else {
                cVar.f79475b.d(112);
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void e() {
        while (true) {
            c cVar = (c) this.f79513h.poll();
            if (cVar == null) {
                return;
            }
            try {
                this.f79506a.a(cVar.f79476c, cVar.f79477d, new e(this, cVar));
                this.f79512g.add(cVar);
            } catch (Exception e3) {
                mc0.d.f76206a.p(e3, "RemoteException in checkLicense call.", new Object[0]);
                c(cVar);
            }
        }
    }

    @Override // o30.b
    public final d l() {
        return this.f79509d;
    }

    @Override // o30.b
    public final synchronized void m(k4 k4Var) {
        try {
            if (this.f79509d.a(true) == null || this.f79509d.f79467e == 2) {
                this.f79513h.offer(new c(this.f79509d, k4Var, f79505i.nextInt(), this.f79511f));
                e();
            } else {
                k4Var.b();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // o30.b
    public final synchronized void onDestroy() {
        this.f79506a.f79504d = true;
    }
}
