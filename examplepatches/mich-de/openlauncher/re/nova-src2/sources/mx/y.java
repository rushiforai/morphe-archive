package mx;

import android.content.Context;
import com.teslacoilsw.launcher.Hotseat;

/* loaded from: classes.dex */
public final /* synthetic */ class y implements ya.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77274a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f77275b;

    public /* synthetic */ y(Object obj, int i5) {
        this.f77274a = i5;
        this.f77275b = obj;
    }

    @Override // ya.d
    public final void I(Context context, ya.e eVar, int i5) {
        int i11 = this.f77274a;
        Object obj = this.f77275b;
        switch (i11) {
            case 0:
                int i12 = Hotseat.f45623n0;
                ((Hotseat) obj).z0(eVar);
                break;
            default:
                l0 l0Var = (l0) obj;
                if ((i5 & 24) != 0) {
                    l0Var.h(context);
                    break;
                }
                break;
        }
    }
}
