package com.google.android.gms.internal.measurement;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.spotify.sdk.android.auth.AuthorizationResponse;
import com.spotify.sdk.android.auth.LoginActivity;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class le {

    /* renamed from: a, reason: collision with root package name */
    public boolean f32792a = false;

    /* renamed from: b, reason: collision with root package name */
    public Object f32793b;

    /* renamed from: c, reason: collision with root package name */
    public Object f32794c;

    /* renamed from: d, reason: collision with root package name */
    public Object f32795d;

    /* renamed from: e, reason: collision with root package name */
    public Object f32796e;

    /* JADX WARN: Removed duplicated region for block: B:109:0x026b  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x026e  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00f4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public le(pc pcVar, ke keVar) {
        xk.w2 w2VarC;
        char c11;
        long j11;
        long j12;
        mc mcVar = pcVar.f32961a;
        jc jcVar = pcVar.f32962b;
        if (mcVar.f32820a.isEmpty()) {
            jc.E().equals(jcVar);
        }
        this.f32793b = jcVar.x();
        this.f32794c = jcVar.y();
        jcVar.getClass();
        jcVar.getClass();
        Map mapC = jcVar.B() == 0 ? null : jcVar.C();
        if (mapC != null) {
            xk.d1.n(mapC.keySet());
        } else {
            Object[] objArr = xk.z2.f96073i;
        }
        mc mcVar2 = pcVar.f32961a;
        char c12 = 3;
        int i5 = 0;
        if (jcVar.B() > 0) {
            Collection<fc> collectionValues = jcVar.C().values();
            if (collectionValues == null) {
                w2VarC = xk.w2.f96042g;
            } else {
                c30.c cVarA = xk.x0.a();
                for (fc fcVar : collectionValues) {
                    int iL = fcVar.L();
                    int i11 = iL - 1;
                    if (iL == 0) {
                        throw null;
                    }
                    if (i11 == 0) {
                        cVarA.p(fcVar.x(), Long.valueOf(fcVar.y()));
                    } else if (i11 == 1) {
                        cVarA.p(fcVar.x(), Boolean.valueOf(fcVar.z()));
                    } else if (i11 == 2) {
                        cVarA.p(fcVar.x(), Double.valueOf(fcVar.A()));
                    } else if (i11 == 3) {
                        cVarA.p(fcVar.x(), fcVar.B());
                    } else {
                        if (i11 != 4) {
                            throw new IllegalStateException("Could not serialize Flag for override: ".concat(String.valueOf(fcVar.x())));
                        }
                        cVarA.p(fcVar.x(), fcVar.C().n());
                    }
                }
                w2VarC = cVarA.c(false);
            }
            if (!w2VarC.isEmpty()) {
                HashMap map = new HashMap(w2VarC);
                xk.k1 k1Var = mcVar2.f32820a;
                xk.j1 j1Var = new xk.j1();
                lh.h it = k1Var.iterator();
                while (true) {
                    xk.a aVar = (xk.a) it;
                    if (aVar.hasNext()) {
                        lc lcVar = (lc) aVar.next();
                        Object obj = lcVar.f32786b;
                        long j13 = lcVar.f32785a;
                        Object objRemove = map.remove(obj == null ? Long.toString(j13) : obj);
                        if (objRemove == null) {
                            j1Var.a(lcVar);
                        } else if (objRemove instanceof String) {
                            j1Var.a(new lc(lcVar.f32785a, lcVar.f32786b, 4, 0L, objRemove));
                        } else if (objRemove instanceof byte[]) {
                            j1Var.a(new lc(lcVar.f32785a, lcVar.f32786b, 5, 0L, objRemove));
                        } else if (objRemove instanceof Boolean) {
                            j1Var.a(new lc(lcVar.f32785a, lcVar.f32786b, ((Boolean) objRemove).booleanValue() ? 1 : 0, 0L, null));
                        } else if (objRemove instanceof Long) {
                            j1Var.a(new lc(lcVar.f32785a, lcVar.f32786b, 2, ((Long) objRemove).longValue(), null));
                        } else {
                            if (!(objRemove instanceof Double)) {
                                String string = lcVar.f32786b;
                                string = string == null ? Long.toString(j13) : string;
                                String string2 = objRemove.toString();
                                throw new IllegalStateException(b.c0.s(new StringBuilder(String.valueOf(string).length() + 46 + string2.length()), "Cannot serialize override for existing flag ", string, ": ", string2));
                            }
                            j1Var.a(new lc(lcVar.f32785a, lcVar.f32786b, 3, Double.doubleToRawLongBits(((Double) objRemove).doubleValue()), null));
                        }
                    } else {
                        for (String str : map.keySet()) {
                            Object obj2 = map.get(str);
                            int length = str.length();
                            if (length <= 19) {
                                if (length == 0) {
                                    c11 = c12;
                                } else {
                                    c11 = c12;
                                    long jCharAt = str.charAt(i5) - '0';
                                    if (jCharAt >= 1) {
                                        if (jCharAt <= 9) {
                                            int i12 = 1;
                                            while (true) {
                                                if (i12 < length) {
                                                    j11 = 0;
                                                    int iCharAt = str.charAt(i12) - '0';
                                                    if (((iCharAt > 9 ? 1 : 0) | (iCharAt < 0 ? 1 : i5)) != 0) {
                                                        break;
                                                    }
                                                    jCharAt = (jCharAt * 10) + iCharAt;
                                                    i12++;
                                                    i5 = 0;
                                                } else {
                                                    j11 = 0;
                                                    if (jCharAt < 0 || jCharAt > 2305843009213693951L) {
                                                        break;
                                                    } else {
                                                        j12 = jCharAt;
                                                    }
                                                }
                                            }
                                        }
                                        String str2 = j12 != j11 ? str : null;
                                        if (!(obj2 instanceof String)) {
                                            j1Var.a(new lc(j12, str2, 4, 0L, obj2));
                                        } else if (obj2 instanceof byte[]) {
                                            j1Var.a(new lc(j12, str2, 5, 0L, obj2));
                                        } else if (obj2 instanceof Boolean) {
                                            j1Var.a(new lc(j12, str2, ((Boolean) obj2).booleanValue() ? 1 : 0, 0L, null));
                                        } else if (obj2 instanceof Long) {
                                            j1Var.a(new lc(j12, str2, 2, ((Long) obj2).longValue(), null));
                                        } else {
                                            if (!(obj2 instanceof Double)) {
                                                String strValueOf = String.valueOf(obj2);
                                                throw new IllegalStateException(b.c0.s(new StringBuilder(str.length() + 28 + strValueOf.length()), "Cannot serialize override ", str, ": ", strValueOf));
                                            }
                                            j1Var.a(new lc(j12, str2, 3, Double.doubleToRawLongBits(((Double) obj2).doubleValue()), null));
                                        }
                                        c12 = c11;
                                        i5 = 0;
                                    }
                                    j12 = j11;
                                    if (j12 != j11) {
                                    }
                                    if (!(obj2 instanceof String)) {
                                    }
                                    c12 = c11;
                                    i5 = 0;
                                }
                                j11 = 0;
                                j12 = 0;
                                if (j12 != j11) {
                                }
                                if (!(obj2 instanceof String)) {
                                }
                                c12 = c11;
                                i5 = 0;
                            } else {
                                c11 = c12;
                            }
                            j11 = 0;
                            j12 = j11;
                            if (j12 != j11) {
                            }
                            if (!(obj2 instanceof String)) {
                            }
                            c12 = c11;
                            i5 = 0;
                        }
                        xk.a3 a3VarS = xk.k1.s(j1Var.f95942d, j1Var.f85892a, j1Var.f85894c);
                        j1Var.f85892a = a3VarS.f95860g.size();
                        j1Var.f85893b = true;
                        mcVar2 = new mc(a3VarS);
                    }
                }
            }
        }
        c30.c cVarB = xk.x0.b(((xk.a3) mcVar2.f32820a).f95860g.size() + 3);
        lh.h it2 = mcVar2.f32820a.iterator();
        while (true) {
            xk.a aVar2 = (xk.a) it2;
            if (!aVar2.hasNext()) {
                cVarB.p("__phenotype_server_token", jcVar.z());
                cVarB.p("__phenotype_snapshot_token", jcVar.x());
                cVarB.p("__phenotype_configuration_version", Long.valueOf(jcVar.A()));
                this.f32795d = cVarB.c(false);
                this.f32796e = keVar;
                return;
            }
            lc lcVar2 = (lc) aVar2.next();
            String string3 = lcVar2.f32786b;
            if (string3 == null) {
                string3 = Long.toString(lcVar2.f32785a);
            }
            cVarB.p(string3, lcVar2.a());
        }
    }

    public static Intent c(Activity activity, AuthorizationRequest authorizationRequest) {
        int i5 = LoginActivity.f42419b;
        Bundle bundle = new Bundle();
        bundle.putParcelable("request", authorizationRequest);
        Intent intent = new Intent(activity, (Class<?>) LoginActivity.class);
        intent.putExtra("EXTRA_AUTH_REQUEST", bundle);
        intent.addFlags(67108864);
        return intent;
    }

    public static AuthorizationResponse d(int i5, Intent intent) {
        Bundle bundleExtra;
        Bundle bundleExtra2;
        if (i5 == -1) {
            int i11 = LoginActivity.f42419b;
            if (((intent == null || (bundleExtra = intent.getBundleExtra("EXTRA_AUTH_RESPONSE")) == null) ? null : (AuthorizationResponse) bundleExtra.getParcelable("response")) != null) {
                if (intent == null || (bundleExtra2 = intent.getBundleExtra("EXTRA_AUTH_RESPONSE")) == null) {
                    return null;
                }
                return (AuthorizationResponse) bundleExtra2.getParcelable("response");
            }
        }
        return new AuthorizationResponse(null, 4, null, null, 0, null);
    }

    public void a() throws IOException {
        synchronized (((x80.f) this.f32796e)) {
            if (this.f32792a) {
                return;
            }
            this.f32792a = true;
            y80.c.c((m90.h0) this.f32794c);
            try {
                ((ai.y0) this.f32793b).d();
            } catch (IOException unused) {
            }
        }
    }

    public x80.e b() {
        return (x80.e) this.f32795d;
    }

    public void e(xp.a aVar, AuthorizationResponse authorizationResponse) {
        this.f32792a = false;
        if (aVar != null) {
            aVar.b(null);
            aVar.stop();
        }
        LoginActivity loginActivity = (LoginActivity) this.f32796e;
        if (loginActivity == null) {
            Log.w("Spotify Auth Client", "Can't deliver the Spotify Auth response. The listener is null");
            return;
        }
        Intent intent = new Intent();
        Log.i("com.spotify.sdk.android.auth.LoginActivity", "Spotify auth completing. The response is in EXTRA with key 'response'");
        Bundle bundle = new Bundle();
        bundle.putParcelable("response", authorizationResponse);
        intent.putExtra("EXTRA_AUTH_RESPONSE", bundle);
        loginActivity.setResult(-1, intent);
        loginActivity.finish();
        this.f32796e = null;
    }

    public le(ne neVar, ke keVar) {
        ne.E().equals(neVar);
        this.f32793b = neVar.x();
        this.f32794c = neVar.y();
        int i5 = xk.d1.f95891c;
        Object[] objArr = xk.z2.f96073i;
        c30.c cVarB = xk.x0.b(neVar.C() + 3);
        for (pe peVar : neVar.B()) {
            int iK = peVar.K();
            int i11 = iK - 1;
            if (iK == 0) {
                throw null;
            }
            if (i11 == 0) {
                cVarB.p(peVar.x(), Long.valueOf(peVar.y()));
            } else if (i11 == 1) {
                cVarB.p(peVar.x(), Boolean.valueOf(peVar.z()));
            } else if (i11 == 2) {
                cVarB.p(peVar.x(), Double.valueOf(peVar.A()));
            } else if (i11 == 3) {
                cVarB.p(peVar.x(), peVar.B());
            } else if (i11 == 4) {
                cVarB.p(peVar.x(), peVar.C().n());
            }
        }
        cVarB.p("__phenotype_server_token", neVar.z());
        cVarB.p("__phenotype_snapshot_token", neVar.x());
        cVarB.p("__phenotype_configuration_version", Long.valueOf(neVar.A()));
        this.f32795d = cVarB.c(false);
        this.f32796e = keVar;
    }
}
