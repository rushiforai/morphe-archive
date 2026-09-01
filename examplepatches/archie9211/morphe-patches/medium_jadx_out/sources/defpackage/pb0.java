package defpackage;

import com.medium.android.donkey.audio.AudioService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pb0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ AudioService d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pb0(AudioService audioService, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = audioService;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        AudioService audioService = this.d;
        switch (i) {
            case 0:
                return new pb0(audioService, n92Var, 0);
            default:
                return new pb0(audioService, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((pb0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 0;
        AudioService audioService = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    wua wuaVarA = bo.A(((y23) audioService.b()).o);
                    ob0 ob0Var = new ob0(i2, audioService);
                    this.c = 1;
                    if (wuaVarA.a.b(ob0Var, this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                z72.b();
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    vx6 vx6Var = vx6.CREATED;
                    pb0 pb0Var = new pb0(audioService, n92Var, i2);
                    this.c = 1;
                    if (gq7.Q(audioService, vx6Var, pb0Var, this) == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1e.a;
        }
    }
}
