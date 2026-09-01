package defpackage;

import android.os.Bundle;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.android.unsplash.ui.UnsplashPickerFragment;

/* JADX INFO: loaded from: classes4.dex */
public final class dwd implements m45 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public /* synthetic */ dwd(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                sj0 sj0Var = (sj0) ((jz1) obj2).b;
                return ((i93) sj0Var.a).e.i((s6a) obj, (p98) sj0Var.b);
            default:
                b3e b3eVar = (b3e) obj2;
                UnsplashPhoto unsplashPhoto = (UnsplashPhoto) obj;
                b3eVar.getClass();
                unsplashPhoto.getClass();
                k3e k3eVar = b3eVar.b;
                vx0.c0(f76.F(k3eVar), null, null, new cfd(k3eVar, unsplashPhoto, null, 6), 3);
                qlb qlbVar = b3eVar.a;
                Bundle bundle = new Bundle();
                bundle.putParcelable("EXTRA_PHOTO", unsplashPhoto);
                UnsplashPickerFragment unsplashPickerFragment = (UnsplashPickerFragment) qlbVar.a;
                unsplashPickerFragment.m().Z("EXTRA_PHOTO", bundle);
                k40.X(unsplashPickerFragment).f();
                return c1e.a;
        }
    }
}
