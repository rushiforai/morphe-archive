package v2;

import androidx.compose.ui.Modifier$Node;
import b3.l2;
import b3.s2;
import b3.u2;
import java.util.List;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public abstract class h extends Modifier$Node implements u2, l2, b3.m {

    /* renamed from: a, reason: collision with root package name */
    public b3.p f91931a;

    /* renamed from: b, reason: collision with root package name */
    public a f91932b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f91933c;

    public h(a aVar, b3.p pVar) {
        this.f91931a = pVar;
        this.f91932b = aVar;
    }

    public final void B() {
        a aVar;
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        t2.c.R(this, new g(objectRef));
        h hVar = (h) objectRef.f71863a;
        if (hVar == null || (aVar = hVar.f91932b) == null) {
            aVar = this.f91932b;
        }
        D(aVar);
    }

    public abstract void D(q qVar);

    public final void E() {
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        booleanRef.f71859a = true;
        t2.c.S(this, new f(booleanRef));
        if (booleanRef.f71859a) {
            B();
        }
    }

    public abstract boolean F(int i5);

    public final void H() {
        if (this.f91933c) {
            this.f91933c = false;
            if (getIsAttached()) {
                Ref.ObjectRef objectRef = new Ref.ObjectRef();
                t2.c.R(this, new e(objectRef));
                h hVar = (h) objectRef.f71863a;
                if (hVar != null) {
                    hVar.B();
                } else {
                    D(null);
                }
            }
        }
    }

    @Override // b3.l2
    /* renamed from: getTouchBoundsExpansion-RZrCHBk */
    public final long mo24getTouchBoundsExpansionRZrCHBk() {
        b3.p pVar = this.f91931a;
        if (pVar != null) {
            return pVar.a(b3.o.f(this).getDensity());
        }
        int i5 = s2.f17340b;
        return io.sentry.hints.i.d();
    }

    @Override // b3.l2
    public final void onCancelPointerInput() {
        H();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        H();
        super.onDetach();
    }

    @Override // b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public final void mo26onPointerEventH0pRuoY(m mVar, n nVar, long j11) {
        if (nVar == n.f91981b) {
            List list = mVar.f91975a;
            int size = list.size();
            for (int i5 = 0; i5 < size; i5++) {
                if (F(((t) list.get(i5)).j())) {
                    int i11 = mVar.f91979e;
                    if (i11 == 4) {
                        this.f91933c = true;
                        E();
                        return;
                    } else {
                        if (i11 == 5) {
                            H();
                            return;
                        }
                        return;
                    }
                }
            }
        }
    }
}
