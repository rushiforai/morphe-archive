package mx;

import android.content.DialogInterface;
import com.teslacoilsw.launcher.NovaShortcutHandler;

/* loaded from: classes4.dex */
public final class i1 implements DialogInterface.OnDismissListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77121a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f77122b;

    public /* synthetic */ i1(Object obj, int i5) {
        this.f77121a = i5;
        this.f77122b = obj;
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        switch (this.f77121a) {
            case 0:
                ((NovaShortcutHandler) this.f77122b).finish();
                break;
            default:
                ((x20.f) this.f77122b).f95000d = null;
                break;
        }
    }
}
