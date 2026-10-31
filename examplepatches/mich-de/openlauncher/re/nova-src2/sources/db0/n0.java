package db0;

import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import androidx.compose.ui.node.LayoutNode;
import e1.f1;
import e10.y2;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import t0.a2;
import t0.c1;
import t0.n1;

/* loaded from: classes.dex */
public final /* synthetic */ class n0 extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f49175d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n0(int i5, Object obj, Class cls, String str, String str2, int i11, int i12) {
        super(i5, i11, cls, obj, str, str2);
        this.f49175d = i12;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x001b  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) throws Throwable {
        Integer numValueOf;
        r3.a aVar;
        switch (this.f49175d) {
            case 0:
                ((q0) this.receiver).c((c0) obj);
                return Unit.f71706a;
            case 1:
                ((q0) this.receiver).c((c0) obj);
                return Unit.f71706a;
            case 2:
                ((q0) this.receiver).c((c0) obj);
                return Unit.f71706a;
            case 3:
                ((y2) this.receiver).getClass();
                return Boolean.TRUE;
            case 4:
                ((y2) this.receiver).getClass();
                return Boolean.TRUE;
            case 5:
                ((y2) this.receiver).getClass();
                return Boolean.TRUE;
            case 6:
                ((y2) this.receiver).getClass();
                return Boolean.TRUE;
            case 7:
                ((y2) this.receiver).getClass();
                return Boolean.TRUE;
            case 8:
                ((y2) this.receiver).getClass();
                return Boolean.TRUE;
            case 9:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 10:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 11:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 12:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 13:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 14:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 15:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 16:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 17:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 18:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            case 19:
                return Boolean.valueOf(y2.a((y2) this.receiver));
            default:
                KeyEvent keyEventB = ((t2.b) obj).b();
                n1 n1Var = (n1) this.receiver;
                f1 f1Var = n1Var.f88112f;
                boolean z11 = n1Var.f88110d;
                boolean z12 = true;
                if (ps.c.p(keyEventB)) {
                    t0.h0 h0Var = n1Var.f88115i;
                    h0Var.getClass();
                    int iY = t2.c.y(keyEventB);
                    if ((Integer.MIN_VALUE & iY) != 0) {
                        h0Var.f88013a = Integer.valueOf(iY & LayoutNode.NotPlacedPlaceOrder);
                        numValueOf = null;
                    } else {
                        Integer num = h0Var.f88013a;
                        if (num != null) {
                            h0Var.f88013a = null;
                            int deadChar = KeyCharacterMap.getDeadChar(num.intValue(), iY);
                            Integer numValueOf2 = Integer.valueOf(deadChar);
                            if (deadChar == 0) {
                                numValueOf2 = null;
                            }
                            if (numValueOf2 != null) {
                                iY = numValueOf2.intValue();
                            }
                            numValueOf = Integer.valueOf(iY);
                        } else {
                            numValueOf = Integer.valueOf(iY);
                        }
                    }
                    if (numValueOf != null) {
                        aVar = new r3.a(ph.a.j(numValueOf.intValue(), new StringBuilder()).toString(), 1);
                    }
                } else {
                    aVar = null;
                }
                if (aVar != null) {
                    if (z11) {
                        n1Var.a(ul.b.P(aVar));
                        f1Var.f51296a = null;
                    } else {
                        z12 = false;
                    }
                } else if (p3.i.t(t2.c.x(keyEventB), 2)) {
                    n1Var.f88116j.getClass();
                    t0.o0 o0VarW = null;
                    if (t2.c.F(keyEventB) && t2.c.A(keyEventB)) {
                        long jV = t2.c.v(keyEventB);
                        if (t2.a.a(jV, c1.b())) {
                            o0VarW = t0.o0.Q;
                        } else if (t2.a.a(jV, c1.c())) {
                            o0VarW = t0.o0.R;
                        } else if (t2.a.a(jV, c1.d())) {
                            o0VarW = t0.o0.I;
                        } else if (t2.a.a(jV, c1.a())) {
                            o0VarW = t0.o0.J;
                        }
                    } else if (t2.c.A(keyEventB)) {
                        long jV2 = t2.c.v(keyEventB);
                        if (t2.a.a(jV2, c1.b())) {
                            o0VarW = t0.o0.f88139j;
                        } else if (t2.a.a(jV2, c1.c())) {
                            o0VarW = t0.o0.f88140k;
                        } else if (t2.a.a(jV2, c1.d())) {
                            o0VarW = t0.o0.f88144q;
                        } else if (t2.a.a(jV2, c1.a())) {
                            o0VarW = t0.o0.f88145r;
                        }
                    }
                    if (o0VarW == null) {
                        o0VarW = t0.r0.a().w(keyEventB);
                    }
                    if (o0VarW != null && (!o0VarW.a() || z11)) {
                        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
                        booleanRef.f71859a = true;
                        n00.u uVar = new n00.u(7, o0VarW, n1Var, booleanRef);
                        r3.z zVar = n1Var.f88109c;
                        e1.o0 o0Var = new e1.o0(zVar, n1Var.f88113g, n1Var.f88107a.d(), f1Var);
                        uVar.invoke(o0Var);
                        if (!m3.o0.b(o0Var.h(), zVar.f85472b) || !Intrinsics.b(o0Var.b(), zVar.f85471a)) {
                            n1Var.f88117k.invoke(o0Var.i());
                        }
                        a2 a2Var = n1Var.f88114h;
                        if (a2Var != null) {
                            a2Var.f87905e = true;
                        }
                        z12 = booleanRef.f71859a;
                    }
                }
                return Boolean.valueOf(z12);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n0(y2 y2Var, int i5) {
        super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
        this.f49175d = i5;
        switch (i5) {
            case 10:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 11:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 12:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 13:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 14:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 15:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 16:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 17:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 18:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            case 19:
                super(1, 0, y2.class, y2Var, "hasPrime", "hasPrime(Ljava/lang/Object;)Z");
                break;
            default:
                break;
        }
    }
}
