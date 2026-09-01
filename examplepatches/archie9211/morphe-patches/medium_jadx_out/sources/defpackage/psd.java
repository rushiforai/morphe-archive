package defpackage;

import android.content.Context;
import com.drew.imaging.riff.pvS.uuLAxLN;
import j$.util.DesugarCollections;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class psd {
    public static volatile at2 e;
    public final dp1 a;
    public final dp1 b;
    public final s13 c;
    public final sj0 d;

    public psd(dp1 dp1Var, dp1 dp1Var2, s13 s13Var, sj0 sj0Var, o2b o2bVar) {
        this.a = dp1Var;
        this.b = dp1Var2;
        this.c = s13Var;
        this.d = sj0Var;
        ((Executor) o2bVar.b).execute(new b2a(12, o2bVar));
    }

    public static psd a() {
        at2 at2Var = e;
        if (at2Var != null) {
            return (psd) at2Var.f.get();
        }
        ygf.f("Not initialized!");
        return null;
    }

    public static void b(Context context) {
        if (e == null) {
            synchronized (psd.class) {
                try {
                    if (e == null) {
                        zm7 zm7Var = new zm7(9);
                        context.getClass();
                        zm7Var.b = context;
                        e = zm7Var.o();
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
    }

    public final osd c(j21 j21Var) {
        byte[] bytes;
        Set setUnmodifiableSet = j21Var instanceof j21 ? DesugarCollections.unmodifiableSet(j21.d) : Collections.singleton(new wy3(uuLAxLN.sRHl));
        m50 m50VarA = kk0.a();
        j21Var.getClass();
        m50VarA.b = "cct";
        String str = j21Var.a;
        String str2 = j21Var.b;
        if (str2 == null && str == null) {
            bytes = null;
        } else {
            if (str2 == null) {
                str2 = "";
            }
            bytes = lv8.r("1$", str, "\\", str2).getBytes(Charset.forName("UTF-8"));
        }
        m50VarA.c = bytes;
        return new osd(setUnmodifiableSet, m50VarA.k(), this);
    }
}
