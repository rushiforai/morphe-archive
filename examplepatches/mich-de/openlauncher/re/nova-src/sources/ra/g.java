package ra;

import com.teslacoilsw.launcher.medialite.LocalMediaView;
import ua.i;

/* loaded from: classes.dex */
public final /* synthetic */ class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85770a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f85771b;

    public /* synthetic */ g(Object obj, int i5) {
        this.f85770a = i5;
        this.f85771b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f85770a;
        Object obj = this.f85771b;
        switch (i5) {
            case 0:
                ((h) obj).s0();
                break;
            case 1:
                ua.a aVar = (ua.a) obj;
                aVar.f90719i = null;
                aVar.f90720j = true;
                i iVar = aVar.f90712b;
                iVar.h(1);
                iVar.f90770u = 0;
                iVar.o = false;
                break;
            case 2:
                int i11 = LocalMediaView.f45870i;
                ((LocalMediaView) obj).b();
                break;
            default:
                ((o9.a) obj).K(false);
                break;
        }
    }
}
