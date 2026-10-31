package b4;

import androidx.compose.ui.platform.AndroidComposeView;
import com.vungle.ads.internal.util.y;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17448a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f17449b;

    public /* synthetic */ b(Function0 function0, int i5) {
        this.f17448a = i5;
        this.f17449b = function0;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f17448a) {
            case 0:
                this.f17449b.invoke();
                break;
            case 1:
                AndroidComposeView.schedule$lambda$38(this.f17449b);
                break;
            case 2:
                this.f17449b.invoke();
                break;
            case 3:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.t.a(this.f17449b);
                break;
            case 4:
                y.b(this.f17449b);
                break;
            case 5:
                this.f17449b.invoke();
                break;
            case 6:
                this.f17449b.invoke();
                break;
            default:
                this.f17449b.invoke();
                break;
        }
    }
}
