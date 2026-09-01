package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ov6 implements m45 {
    public final /* synthetic */ int a;

    public /* synthetic */ ov6(int i) {
        this.a = i;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return new kv6(0, 0);
            case 1:
                return new pw6(new int[]{0}, new int[]{0});
            case 2:
                return c1eVar;
            case 3:
                return null;
            case 4:
                return z80.a;
            case 5:
                return j90.a;
            case 6:
                throw new IllegalStateException("CompositionLocal LocalLifecycleOwner not present");
            case 7:
            case 8:
                return null;
            case 9:
                sn3 sn3Var = c67.a;
                return no3.d;
            case 10:
                throw new IllegalStateException("CompositionLocal LocalSavedStateRegistryOwner not present");
            case 11:
                return null;
            case 12:
                int i2 = MainActivity.H;
                return vv2.j(Boolean.TRUE);
            case 13:
                return Boolean.FALSE;
            case 14:
                return h48.a;
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
            default:
                return c1eVar;
        }
    }
}
