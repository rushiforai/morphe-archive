package ads_mobile_sdk;

import android.content.Context;
import android.os.Build;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: classes2.dex */
public final class wi0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f11288a;

    /* renamed from: b, reason: collision with root package name */
    public final ub3 f11289b;

    /* renamed from: c, reason: collision with root package name */
    public final String f11290c;

    /* renamed from: d, reason: collision with root package name */
    public final long f11291d;

    /* renamed from: e, reason: collision with root package name */
    public final long f11292e;

    public wi0(Context context, j7 j7Var, ub3 ub3Var) {
        this.f11288a = context;
        this.f11290c = j7Var.F();
        this.f11291d = j7Var.D();
        this.f11292e = j7Var.H();
        this.f11289b = ub3Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00ba A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(HashMap map) {
        String strP;
        String strP2;
        Long lValueOf;
        ListenableFuture listenableFuture;
        pd pdVar;
        String strMo3a;
        map.put("v", this.f11290c);
        map.put("t", new Throwable());
        long jO = -1;
        try {
            listenableFuture = (ListenableFuture) map.get("gs");
        } catch (ClassCastException | ExecutionException | TimeoutException unused) {
        } catch (InterruptedException unused2) {
            strP = "E";
            strP2 = null;
            lValueOf = null;
        }
        if (listenableFuture == null || ((Build.VERSION.SDK_INT >= 31 && !listenableFuture.isDone()) || (pdVar = (pd) listenableFuture.get(this.f11291d, TimeUnit.MILLISECONDS)) == null)) {
            strP = "E";
            strP2 = null;
            lValueOf = null;
        } else {
            if (pdVar.v()) {
                he heVarR = pdVar.r();
                if (heVarR.r()) {
                    sq sqVarO = heVarR.o();
                    Charset charset = StandardCharsets.ISO_8859_1;
                    strMo3a = sqVarO.size() == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : sqVarO.mo3a();
                } else {
                    strMo3a = null;
                }
                try {
                    lValueOf = heVarR.t() ? Long.valueOf(heVarR.q()) : null;
                } catch (ClassCastException | ExecutionException | TimeoutException unused3) {
                    strP2 = null;
                    lValueOf = null;
                } catch (InterruptedException unused4) {
                    strP2 = null;
                    lValueOf = null;
                }
                try {
                    strP2 = heVarR.s() ? heVarR.p() : null;
                    str = strMo3a;
                } catch (ClassCastException | ExecutionException | TimeoutException unused5) {
                    strP2 = null;
                    str = strMo3a;
                    strP = "E";
                    if (strP.equals("E")) {
                    }
                    map.put("int", strP);
                    if (str != null) {
                    }
                    if (lValueOf != null) {
                    }
                    if (strP2 != null) {
                    }
                    map.put("gv", Long.valueOf(jO));
                } catch (InterruptedException unused6) {
                    strP2 = null;
                    str = strMo3a;
                    strP = "E";
                    Thread.currentThread().interrupt();
                    if (strP.equals("E")) {
                    }
                    map.put("int", strP);
                    if (str != null) {
                    }
                    if (lValueOf != null) {
                    }
                    if (strP2 != null) {
                    }
                    map.put("gv", Long.valueOf(jO));
                }
            } else {
                strP2 = null;
                lValueOf = null;
            }
            try {
                strP = pdVar.p().length() > 1 ? pdVar.p() : "E";
                try {
                    if (pdVar.t()) {
                        jO = pdVar.o();
                    }
                } catch (ClassCastException | ExecutionException | TimeoutException unused7) {
                } catch (InterruptedException unused8) {
                    Thread.currentThread().interrupt();
                }
            } catch (ClassCastException | ExecutionException | TimeoutException unused9) {
                strP = "E";
                if (strP.equals("E")) {
                }
                map.put("int", strP);
                if (str != null) {
                }
                if (lValueOf != null) {
                }
                if (strP2 != null) {
                }
                map.put("gv", Long.valueOf(jO));
            } catch (InterruptedException unused10) {
                strP = "E";
                Thread.currentThread().interrupt();
                if (strP.equals("E")) {
                }
                map.put("int", strP);
                if (str != null) {
                }
                if (lValueOf != null) {
                }
                if (strP2 != null) {
                }
                map.put("gv", Long.valueOf(jO));
            }
        }
        if (strP.equals("E")) {
            try {
                ListenableFuture listenableFuture2 = (ListenableFuture) map.get("ai");
                if (listenableFuture2 != null) {
                    String str = (String) listenableFuture2.get(this.f11292e, TimeUnit.MILLISECONDS);
                    if (!vk.l.a(str)) {
                        strP = str;
                    }
                }
            } catch (ClassCastException | ExecutionException | TimeoutException unused11) {
            } catch (InterruptedException unused12) {
                Thread.currentThread().interrupt();
            }
        }
        map.put("int", strP);
        if (str != null) {
            map.put("att", str);
        }
        if (lValueOf != null) {
            map.put("attts", lValueOf);
        }
        if (strP2 != null) {
            map.put("attkid", strP2);
        }
        map.put("gv", Long.valueOf(jO));
    }
}
