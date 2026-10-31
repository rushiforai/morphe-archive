package ga;

import android.content.ComponentName;
import android.os.Process;
import android.text.TextUtils;
import b.c0;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.internal.measurement.k2;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import eb.k;
import fa.p0;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.OptionalInt;
import java.util.stream.IntStream;
import o9.g3;

/* loaded from: classes.dex */
public class c extends a {
    public int F;
    public c00.d G;
    public iz.b H = new iz.b();

    public c() {
        this.f57290b = 2;
        this.o = Process.myUserHandle();
        this.f57300l = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // ga.e
    public void C(ya.b bVar) {
        super.C(bVar);
        bVar.g(this.f57300l);
        bVar.h(Integer.valueOf(this.F), "options");
        if (!L0()) {
            bVar.l(this.f57304r, this.o);
        }
        NovaIconSource novaIconSource = this.f57307u;
        if (novaIconSource != null) {
            bVar.e(novaIconSource);
        } else {
            bVar.m("customIconSource");
        }
    }

    @Override // ga.a
    public final ComponentKey P0() {
        return new ComponentKey(i(), this.o);
    }

    public final void R0(j jVar, int i5, boolean z11) {
        int iC = g3.c(i5, 0, this.H.size());
        this.H.add(iC, jVar);
        z.f fVar = this.H.f68416a;
        for (int i11 = 0; i11 < fVar.f97766c; i11++) {
            ((b) fVar.f97765b[i11]).f(jVar, iC);
        }
        X0(z11);
    }

    public final OptionalInt S0() {
        CharSequence charSequence = this.f57300l;
        Objects.requireNonNull(charSequence, "Expected valid folder label, but found null");
        String string = charSequence.toString();
        c00.d dVar = this.G;
        if (dVar == null || !dVar.s()) {
            return OptionalInt.empty();
        }
        CharSequence[] charSequenceArrP = this.G.p();
        return IntStream.range(0, charSequenceArrP.length).filter(new k(1, charSequenceArrP, string)).sequential().findFirst();
    }

    public int T0() {
        return this.f57289a;
    }

    public final da.f U0() {
        int iF = c0.F(V0());
        return iF != 1 ? iF != 2 ? iF != 3 ? da.f.FROM_STATE_UNSPECIFIED : da.f.FROM_CUSTOM : da.f.FROM_SUGGESTED : da.f.FROM_EMPTY;
    }

    public final int V0() {
        CharSequence charSequence = this.f57300l;
        if (charSequence == null) {
            return 1;
        }
        if (charSequence.length() == 0) {
            return 2;
        }
        return (this.F & 8) != 0 ? 4 : 3;
    }

    public final int W0(j jVar) {
        iz.b bVar = this.H;
        y9.i iVar = new y9.i(0);
        j jVar2 = null;
        int i5 = 0;
        int i11 = 0;
        while (i5 < bVar.size()) {
            j jVar3 = (j) bVar.get(i5);
            if (iVar.a(jVar3, jVar) <= 0) {
                i11 = i5 + 1;
            }
            if (jVar2 != null && iVar.a(jVar2, jVar3) > 0) {
                return bVar.size();
            }
            i5++;
            jVar2 = jVar3;
        }
        return i11;
    }

    public final void X0(boolean z11) {
        z.f fVar = this.H.f68416a;
        for (int i5 = 0; i5 < fVar.f97766c; i5++) {
            ((b) fVar.f97765b[i5]).s(z11);
        }
    }

    public final void Y0(j jVar, boolean z11) {
        Z0(Collections.singletonList(jVar), z11);
    }

    public final void Z0(List list, boolean z11) {
        this.H.removeAll(list);
        z.f fVar = this.H.f68416a;
        for (int i5 = 0; i5 < fVar.f97766c; i5++) {
            ((b) fVar.f97765b[i5]).D(list);
        }
        X0(z11);
    }

    @Override // ga.f, ga.e
    public void a(e eVar) {
        if (eVar instanceof c) {
            c cVar = (c) eVar;
            super.a(cVar);
            this.F = cVar.F;
            this.G = cVar.G;
            this.H = cVar.H;
        }
    }

    @Override // ga.e
    public void a0(CharSequence charSequence, p0 p0Var) {
        if (TextUtils.isEmpty(charSequence) && this.f57300l == null) {
            return;
        }
        if (charSequence == null || !charSequence.equals(this.f57300l)) {
            this.f57300l = charSequence;
            if (c0.b(charSequence == null ? 1 : charSequence.length() == 0 ? 2 : S0().isPresent() ? 3 : 4, 4)) {
                this.F |= 8;
            } else {
                this.F &= -9;
            }
            if (p0Var != null) {
                p0Var.n(this);
            }
        }
    }

    public final void a1(b bVar) {
        this.H.f68416a.remove(bVar);
    }

    @Override // ga.a, ga.e
    public String b() {
        String strB = super.b();
        int iV0 = V0();
        StringBuilder sbK = k2.k(strB, "; labelState=");
        sbK.append(fq.c.x(iV0));
        return sbK.toString();
    }

    public final void b1(boolean z11, p0 p0Var) {
        int i5 = this.F;
        if (z11) {
            this.F = i5 | 4;
        } else {
            this.F = i5 & (-5);
        }
        if (p0Var == null || i5 == this.F) {
            return;
        }
        p0Var.n(this);
    }

    @Override // ga.a, ga.e
    public ComponentName i() {
        return null;
    }

    @Override // ga.e
    public final e p() {
        c cVar = new c();
        cVar.a(this);
        cVar.H = this.H;
        return cVar;
    }
}
