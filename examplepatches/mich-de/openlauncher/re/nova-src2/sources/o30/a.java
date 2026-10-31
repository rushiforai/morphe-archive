package o30;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.ArrayMap;
import cl.l0;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import javax.crypto.NoSuchPaddingException;

/* loaded from: classes4.dex */
public final class a implements d {

    /* renamed from: h, reason: collision with root package name */
    public static String f79461h;

    /* renamed from: i, reason: collision with root package name */
    public static String f79462i;

    /* renamed from: a, reason: collision with root package name */
    public long f79463a;

    /* renamed from: b, reason: collision with root package name */
    public long f79464b;

    /* renamed from: c, reason: collision with root package name */
    public long f79465c;

    /* renamed from: d, reason: collision with root package name */
    public long f79466d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f79467e;

    /* renamed from: f, reason: collision with root package name */
    public int f79468f;

    /* renamed from: g, reason: collision with root package name */
    public final mh.c f79469g;

    static {
    }

    public a(Context context, p30.a aVar) throws NumberFormatException {
        mh.c cVar = new mh.c(context.getSharedPreferences("0", 0), aVar);
        this.f79469g = cVar;
        try {
            this.f79468f = Integer.valueOf(cVar.D("2", "2")).intValue();
            this.f79467e = Integer.valueOf(cVar.D("1", "2")).intValue();
        } catch (Exception unused) {
            this.f79468f = 1;
            this.f79467e = 0;
        }
        this.f79463a = Long.parseLong(this.f79469g.D("3", "0"));
        this.f79464b = Long.parseLong(this.f79469g.D("4", "0"));
        Long.parseLong(this.f79469g.D("5", "0"));
        this.f79465c = Long.parseLong(this.f79469g.D("6", "0"));
        f79461h = this.f79469g.D("7", "scale");
        f79462i = this.f79469g.D("8", "scale");
    }

    public static final void b(Context context) {
        context.getSharedPreferences("0", 0).edit().clear().apply();
    }

    public final ArrayList a(boolean z11) throws UnsupportedEncodingException {
        long jCurrentTimeMillis = System.currentTimeMillis();
        ArrayList arrayListA = t40.a.a(f79461h);
        int i5 = this.f79467e;
        if (i5 == 0) {
            if (z11 && jCurrentTimeMillis > this.f79463a) {
                return new ArrayList();
            }
        } else {
            if (i5 != 2 || jCurrentTimeMillis >= this.f79466d + 60000 || this.f79468f == 1) {
                if (i5 != 2 || this.f79468f == 1) {
                    return null;
                }
                return new ArrayList();
            }
            if (jCurrentTimeMillis > this.f79464b) {
                return new ArrayList();
            }
        }
        return arrayListA;
    }

    public final String c() {
        return f79461h;
    }

    public final void d(int i5, g gVar) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, NumberFormatException, InvalidAlgorithmParameterException {
        mh.c cVar = this.f79469g;
        if (i5 != 2) {
            this.f79465c = 0L;
            cVar.K("6", Long.toString(0L));
        } else {
            long j11 = this.f79465c + 1;
            this.f79465c = j11;
            cVar.K("6", Long.toString(j11));
        }
        String str = "0";
        if (i5 == 0) {
            String str2 = gVar.f79497g;
            ArrayMap arrayMap = new ArrayMap();
            try {
                l0.d(new URI("?" + str2), arrayMap);
            } catch (Exception unused) {
            }
            this.f79467e = i5;
            g((String) arrayMap.get("VT"));
            f((String) arrayMap.get("GT"));
            String str3 = (String) arrayMap.get("GR");
            try {
                Long.parseLong(str3);
                str = str3;
            } catch (NumberFormatException unused2) {
            }
            cVar.K("5", str);
            e(gVar.f79498h, gVar.f79499i);
        } else if (i5 == 1) {
            g("0");
            f("0");
            try {
                Long.parseLong("0");
            } catch (NumberFormatException unused3) {
            }
            cVar.K("5", "0");
            if (gVar != null) {
                e(gVar.f79498h, gVar.f79499i);
            }
        }
        this.f79466d = System.currentTimeMillis();
        this.f79467e = i5;
        cVar.K("1", Integer.valueOf(i5).toString());
        if (i5 != 2) {
            this.f79468f = this.f79467e;
            cVar.K("2", Integer.valueOf(i5).toString());
        }
        SharedPreferences.Editor editor = (SharedPreferences.Editor) cVar.f76325d;
        if (editor != null) {
            editor.apply();
            cVar.f76325d = null;
        }
    }

    public final void e(String str, String str2) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        f79461h = str;
        f79462i = str2;
        mh.c cVar = this.f79469g;
        cVar.K("7", str);
        cVar.K("8", str2);
    }

    public final void f(String str) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(Long.parseLong(str));
        } catch (NumberFormatException unused) {
            lValueOf = 0L;
            str = "0";
        }
        this.f79464b = lValueOf.longValue();
        this.f79469g.K("4", str);
    }

    public final void g(String str) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(Long.parseLong(str));
        } catch (NumberFormatException unused) {
            long jCurrentTimeMillis = System.currentTimeMillis() + 60000;
            Long lValueOf2 = Long.valueOf(jCurrentTimeMillis);
            String string = Long.toString(jCurrentTimeMillis);
            lValueOf = lValueOf2;
            str = string;
        }
        this.f79463a = lValueOf.longValue();
        this.f79469g.K("3", str);
    }
}
