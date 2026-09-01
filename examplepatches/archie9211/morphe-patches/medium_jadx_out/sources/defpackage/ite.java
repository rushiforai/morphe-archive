package defpackage;

import android.text.TextUtils;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ite extends ch7 {
    public final /* synthetic */ int e;

    public ite(int i, Class cls, int i2, int i3, int i4) {
        this.e = i4;
        this.a = i;
        this.d = cls;
        this.c = i2;
        this.b = i3;
    }

    @Override // defpackage.ch7
    public final Object c(View view) {
        switch (this.e) {
            case 0:
                return Boolean.valueOf(pte.c(view));
            case 1:
                return pte.a(view);
            default:
                return Boolean.valueOf(pte.b(view));
        }
    }

    @Override // defpackage.ch7
    public final void d(View view, Object obj) {
        switch (this.e) {
            case 0:
                pte.f(view, ((Boolean) obj).booleanValue());
                break;
            case 1:
                pte.e(view, (CharSequence) obj);
                break;
            default:
                pte.d(view, ((Boolean) obj).booleanValue());
                break;
        }
    }

    @Override // defpackage.ch7
    public final boolean j(Object obj, Object obj2) {
        switch (this.e) {
            case 0:
                Boolean bool = (Boolean) obj;
                Boolean bool2 = (Boolean) obj2;
                return !((bool != null && bool.booleanValue()) == (bool2 != null && bool2.booleanValue()));
            case 1:
                return !TextUtils.equals((CharSequence) obj, (CharSequence) obj2);
            default:
                Boolean bool3 = (Boolean) obj;
                Boolean bool4 = (Boolean) obj2;
                return !((bool3 != null && bool3.booleanValue()) == (bool4 != null && bool4.booleanValue()));
        }
    }
}
