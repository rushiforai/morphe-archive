package h10;

import android.view.MotionEvent;
import android.view.View;
import com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet;

/* loaded from: classes4.dex */
public final /* synthetic */ class h implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58885a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f58886b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f58887c;

    public /* synthetic */ h(int i5, Object obj, Object obj2) {
        this.f58885a = i5;
        this.f58886b = obj;
        this.f58887c = obj2;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        int i5 = this.f58885a;
        Object obj = this.f58887c;
        Object obj2 = this.f58886b;
        switch (i5) {
            case 0:
                j jVar = (j) obj2;
                k kVar = (k) obj;
                if (motionEvent.getActionMasked() == 0) {
                    jVar.f58904e.n(kVar);
                    break;
                }
                break;
            case 1:
                DesktopLockBottomSheet desktopLockBottomSheet = (DesktopLockBottomSheet) obj2;
                o9.a0 a0Var = (o9.a0) obj;
                int i11 = DesktopLockBottomSheet.f45718z;
                if (motionEvent.getAction() == 0) {
                    desktopLockBottomSheet.removeCallbacks(desktopLockBottomSheet.f45721x);
                }
                a0Var.b(motionEvent);
                break;
            default:
                uy.y yVar = (uy.y) obj2;
                uy.a0 a0Var2 = (uy.a0) obj;
                if (motionEvent.getActionMasked() == 0) {
                    yVar.f91774c.n(a0Var2);
                    break;
                }
                break;
        }
        return true;
    }
}
