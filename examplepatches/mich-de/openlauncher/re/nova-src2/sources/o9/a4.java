package o9;

import android.view.View;
import com.android.launcher3.Workspace;
import java.util.function.Consumer;

/* loaded from: classes2.dex */
public final /* synthetic */ class a4 implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79764a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Workspace f79765b;

    public /* synthetic */ a4(Workspace workspace, int i5) {
        this.f79764a = i5;
        this.f79765b = workspace;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        Integer num = (Integer) obj;
        switch (this.f79764a) {
            case 0:
                Workspace workspace = this.f79765b;
                if (!workspace.f21000i0.d(num.intValue())) {
                    workspace.U0(num.intValue(), workspace.getChildCount());
                    break;
                }
                break;
            case 1:
                Workspace workspace2 = this.f79765b;
                if (!workspace2.f21000i0.d(num.intValue())) {
                    workspace2.U0(num.intValue(), workspace2.getChildCount());
                    break;
                }
                break;
            default:
                Workspace workspace3 = this.f79765b;
                ya.s sVar = workspace3.f21000i0;
                workspace3.removeView((View) sVar.get(num.intValue()));
                sVar.remove(num.intValue());
                workspace3.f21001j0.o(num.intValue());
                break;
        }
    }
}
