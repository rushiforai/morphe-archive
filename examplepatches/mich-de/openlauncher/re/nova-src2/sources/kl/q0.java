package kl;

import ads_mobile_sdk.au;
import ads_mobile_sdk.c7;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.el;
import ads_mobile_sdk.gu0;
import android.app.Application;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import b.b4;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.internal.consent_sdk.k7;
import com.google.android.gms.internal.consent_sdk.l7;
import com.google.android.gms.internal.consent_sdk.w3;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import o9.n1;
import pl.j1;
import t70.g2;
import t70.l1;
import t70.y0;
import z.c1;

/* loaded from: classes.dex */
public final class q0 implements s0, ni.g, l7, o7.y {

    /* renamed from: a, reason: collision with root package name */
    public Object f71629a;

    /* renamed from: b, reason: collision with root package name */
    public Object f71630b;

    public /* synthetic */ q0(Object obj, Object obj2) {
        this.f71629a = obj;
        this.f71630b = obj2;
    }

    public static q0 c(j1 j1Var) {
        return new q0(j1Var, w0.c(j1Var.A()));
    }

    public fl.u a() throws GeneralSecurityException {
        Integer num = (Integer) this.f71629a;
        if (num == null) {
            throw new GeneralSecurityException("Key size is not set");
        }
        if (((fl.j) this.f71630b) != null) {
            return new fl.u(num.intValue(), (fl.j) this.f71630b);
        }
        throw new GeneralSecurityException("Variant is not set");
    }

    public void b(ContentResolver contentResolver) {
        boolean z11;
        int i5 = ((c1) this.f71629a).f97753c;
        boolean z12 = false;
        for (int i11 = 0; i11 < i5; i11++) {
            uy.o oVar = (uy.o) ((c1) this.f71629a).j(i11);
            synchronized (((uy.d0) this.f71630b)) {
                uy.s sVar = oVar.f91742i;
                z11 = ((uy.d0) this.f71630b).f91702b.c((long) sVar.f91753e) == sVar;
            }
            if (z11) {
                z12 = oVar.c(contentResolver, false) || z12;
            }
        }
        if (z12) {
            ((uy.d0) this.f71630b).v();
            ((uy.d0) this.f71630b).q();
        }
    }

    public uy.o d(uy.s sVar) {
        c1 c1Var = (c1) this.f71629a;
        uy.o oVar = (uy.o) c1Var.get(sVar);
        if (oVar != null) {
            return oVar;
        }
        uy.o oVarB = sVar.b(this);
        c1Var.put(sVar, oVarB);
        return oVarB;
    }

    public String e(String str) {
        String str2 = (String) this.f71630b;
        Resources resources = (Resources) this.f71629a;
        int identifier = resources.getIdentifier(str, "string", str2);
        if (identifier == 0) {
            return null;
        }
        return resources.getString(identifier);
    }

    public boolean f(n1 n1Var, boolean z11) {
        CopyOnWriteArrayList copyOnWriteArrayList = (CopyOnWriteArrayList) this.f71630b;
        Iterator it = copyOnWriteArrayList.iterator();
        boolean z12 = false;
        while (it.hasNext()) {
            x9.b bVar = (x9.b) it.next();
            bVar.c(n1Var, z11);
            copyOnWriteArrayList.remove(bVar);
            z12 = true;
        }
        return z12;
    }

    public void g(fg.a aVar) {
        z7.j jVar = (z7.j) this.f71630b;
        ((h6.m0) this.f71629a).k(aVar);
        if (aVar instanceof o7.x) {
            jVar.j((o7.x) aVar);
        } else if (aVar instanceof o7.v) {
            jVar.k(((o7.v) aVar).f79683c);
        }
    }

    public void h(ComponentKey componentKey) {
        uy.d0 d0Var = (uy.d0) this.f71630b;
        for (int i5 = 0; i5 < d0Var.f91702b.g(); i5++) {
            uy.s sVar = (uy.s) d0Var.f91702b.h(i5);
            if (sVar instanceof uy.l) {
                if (!sVar.f91757i.c(componentKey)) {
                    ((uy.k) d(sVar)).h(componentKey);
                }
            } else if (sVar.f91757i.c(componentKey)) {
                d(sVar).e(componentKey);
            }
        }
        d0Var.v();
    }

    public void i(int i5) throws InvalidAlgorithmParameterException {
        if (i5 != 16 && i5 != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte and 32-byte AES keys are supported", Integer.valueOf(i5)));
        }
        this.f71629a = Integer.valueOf(i5);
    }

    public void j(Context context) {
        g2 g2Var = (g2) this.f71630b;
        Continuation continuation = null;
        if (g2Var != null) {
            g2Var.c(null);
        }
        a80.e eVar = y0.f88884a;
        this.f71630b = t70.m0.t(l1.f88818a, a80.d.f488c, null, new mx.e(this, context, continuation, 0), 2);
    }

    @Override // ni.g
    public void onAdFailedToLoad(ni.v vVar) {
        ((ex.h) this.f71629a).onAdFailedToLoad(vVar);
    }

    @Override // ni.g
    public void onAdLoaded(Object obj) {
        el ad = (el) obj;
        Intrinsics.g(ad, "ad");
        b4.f15783a.getClass();
        t70.m0.t((t70.j0) ((db0) gu0.a()).f2348u.get(), null, null, new androidx.room.q((ex.h) this.f71629a, ad, (mi.b) this.f71630b, (Continuation) null, 14), 3);
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public Object zzb() {
        return new w3((Application) ((vm.c) this.f71629a).f92857b, (com.google.android.gms.internal.consent_sdk.f) ((k7) this.f71630b).zzb());
    }

    public q0(int i5) {
        switch (i5) {
            case 6:
                this.f71629a = new h6.m0();
                this.f71630b = new z7.j();
                g(o7.y.f79685fp);
                break;
            default:
                au auVar = new au(12);
                this.f71629a = auVar;
                this.f71630b = new c7(auVar, 19);
                break;
        }
    }

    public q0(j1 j1Var, tl.a aVar) {
        this.f71630b = j1Var;
        this.f71629a = aVar;
    }

    public q0(uy.d0 d0Var) {
        this.f71630b = d0Var;
        this.f71629a = new c1(0);
        synchronized (d0Var) {
            for (int i5 = 0; i5 < d0Var.f91702b.g(); i5++) {
                try {
                    uy.s sVar = (uy.s) d0Var.f91702b.h(i5);
                    if (sVar instanceof uy.l) {
                        d(sVar);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }
}
