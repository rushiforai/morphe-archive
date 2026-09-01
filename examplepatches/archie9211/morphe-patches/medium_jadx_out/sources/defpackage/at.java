package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class at extends p4d implements b55 {
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ at(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new at(2, 0, n92Var);
            case 1:
                return new at(2, 1, n92Var);
            case 2:
                return new at(2, 2, n92Var);
            case 3:
                return new at(2, 3, n92Var);
            case 4:
                return new at(2, 4, n92Var);
            case 5:
                return new at(2, 5, n92Var);
            case 6:
                return new at(2, 6, n92Var);
            default:
                return new at(2, 7, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                break;
            case 1:
                ((at) create((bo4) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((at) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 3:
                ((at) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 4:
                ((at) create((xrb) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 5:
                ((at) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 6:
                ((at) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((at) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                br7.v(obj);
                break;
            case 1:
                br7.v(obj);
                break;
            case 2:
                br7.v(obj);
                rg8 rg8Var = new rg8();
                l66 l66VarA = uu2.a(null);
                l66VarA.d(new ha7(l66VarA, rg8Var));
                break;
            case 3:
                br7.v(obj);
                t10.k(DarkMode.FOLLOW_SYSTEM.getValue());
                break;
            case 4:
                br7.v(obj);
                break;
            case 5:
                br7.v(obj);
                break;
            case 6:
                br7.v(obj);
                break;
            default:
                br7.v(obj);
                break;
        }
        return c1eVar;
    }
}
