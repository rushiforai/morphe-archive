package ads_mobile_sdk;

import ads_mobile_sdk.le;
import ads_mobile_sdk.sh3;
import ads_mobile_sdk.vi3;
import ads_mobile_sdk.yk0;
import ads_mobile_sdk.z73;
import android.util.Base64;
import b.x3;
import cl.d1;
import cl.t;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Callable;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import xk.v0;

/* loaded from: classes2.dex */
public final class z73 {

    /* renamed from: a, reason: collision with root package name */
    public final d1 f12473a;

    /* renamed from: b, reason: collision with root package name */
    public final a f12474b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f12475c;

    /* renamed from: d, reason: collision with root package name */
    public final String f12476d;

    /* renamed from: e, reason: collision with root package name */
    public final x3 f12477e;

    /* renamed from: f, reason: collision with root package name */
    public final rp1 f12478f;

    /* renamed from: g, reason: collision with root package name */
    public final vi3 f12479g;

    public z73(d1 d1Var, a aVar, rp1 rp1Var, sb3 sb3Var, String str, x3 x3Var, r33 r33Var, r33 r33Var2, r33 r33Var3, vi3 vi3Var) {
        this.f12473a = d1Var;
        this.f12474b = aVar;
        this.f12476d = str;
        this.f12478f = rp1Var;
        this.f12477e = x3Var;
        this.f12479g = vi3Var;
        int iOrdinal = sb3Var.ordinal();
        if (iOrdinal == 0) {
            this.f12475c = (Set) r33Var.get();
        } else if (iOrdinal == 1) {
            this.f12475c = (Set) r33Var2.get();
        } else {
            if (iOrdinal != 2) {
                throw new IllegalStateException();
            }
            this.f12475c = (Set) r33Var3.get();
        }
    }

    public final ListenableFuture b() {
        boolean z11;
        boolean z12;
        a aVar = this.f12474b;
        synchronized (aVar) {
            z11 = aVar.f787d;
        }
        if (!z11) {
            return w0.b(Integer.toString(7));
        }
        rp1 rp1Var = this.f12478f;
        synchronized (rp1Var) {
            z12 = rp1Var.f9270j;
        }
        if (!z12) {
            final int i5 = 0;
            return w0.d(new Callable(this) { // from class: b.jd

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ z73 f15907b;

                {
                    this.f15907b = this;
                }

                @Override // java.util.concurrent.Callable
                public final Object call() {
                    String strEncodeToString;
                    switch (i5) {
                        case 0:
                            z73 z73Var = this.f15907b;
                            ads_mobile_sdk.a aVar2 = z73Var.f12474b;
                            String str = z73Var.f12476d;
                            aVar2.getClass();
                            x3 x3VarW = ads_mobile_sdk.pd.w();
                            x3VarW.v(ReaderJsonLexerKt.BATCH_SIZE);
                            return Base64.encodeToString(aVar2.a(str, true, ((ads_mobile_sdk.pd) x3VarW.a()).a()), 11);
                        default:
                            z73 z73Var2 = this.f15907b;
                            vi3 vi3Var = z73Var2.f12479g;
                            try {
                                new sh3(yk0.EVENT_ID_ENCRYPTION, vi3Var.f10793b, vi3Var.f10792a).b();
                                ads_mobile_sdk.a aVar3 = z73Var2.f12474b;
                                ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) z73Var2.f12477e.a();
                                String str2 = z73Var2.f12476d;
                                aVar3.getClass();
                                try {
                                    strEncodeToString = Base64.encodeToString(((le) aVar3.a(str2, pdVar.a()).a()).a(), 11);
                                } catch (IllegalArgumentException unused) {
                                    x3 x3VarW2 = ads_mobile_sdk.pd.w();
                                    x3VarW2.v(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                                    strEncodeToString = Base64.encodeToString(aVar3.a(str2, true, ((ads_mobile_sdk.pd) x3VarW2.a()).a()), 11);
                                }
                                return strEncodeToString;
                            } finally {
                            }
                    }
                }
            }, this.f12473a);
        }
        ArrayList arrayList = new ArrayList(this.f12475c.size());
        Iterator it = this.f12475c.iterator();
        while (it.hasNext()) {
            arrayList.add(((t) this.f12473a).submit((Callable) it.next()));
        }
        v0 v0VarN = v0.n(arrayList);
        final int i11 = 1;
        Callable callable = new Callable(this) { // from class: b.jd

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ z73 f15907b;

            {
                this.f15907b = this;
            }

            @Override // java.util.concurrent.Callable
            public final Object call() {
                String strEncodeToString;
                switch (i11) {
                    case 0:
                        z73 z73Var = this.f15907b;
                        ads_mobile_sdk.a aVar2 = z73Var.f12474b;
                        String str = z73Var.f12476d;
                        aVar2.getClass();
                        x3 x3VarW = ads_mobile_sdk.pd.w();
                        x3VarW.v(ReaderJsonLexerKt.BATCH_SIZE);
                        return Base64.encodeToString(aVar2.a(str, true, ((ads_mobile_sdk.pd) x3VarW.a()).a()), 11);
                    default:
                        z73 z73Var2 = this.f15907b;
                        vi3 vi3Var = z73Var2.f12479g;
                        try {
                            new sh3(yk0.EVENT_ID_ENCRYPTION, vi3Var.f10793b, vi3Var.f10792a).b();
                            ads_mobile_sdk.a aVar3 = z73Var2.f12474b;
                            ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) z73Var2.f12477e.a();
                            String str2 = z73Var2.f12476d;
                            aVar3.getClass();
                            try {
                                strEncodeToString = Base64.encodeToString(((le) aVar3.a(str2, pdVar.a()).a()).a(), 11);
                            } catch (IllegalArgumentException unused) {
                                x3 x3VarW2 = ads_mobile_sdk.pd.w();
                                x3VarW2.v(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                                strEncodeToString = Base64.encodeToString(aVar3.a(str2, true, ((ads_mobile_sdk.pd) x3VarW2.a()).a()), 11);
                            }
                            return strEncodeToString;
                        } finally {
                        }
                }
            }
        };
        cl.j0 j0Var = new cl.j0(v0VarN, false, false);
        j0Var.f20023p = new cl.h0(j0Var, callable);
        j0Var.w();
        return j0Var;
    }
}
