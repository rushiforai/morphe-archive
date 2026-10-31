package c3;

import android.os.SystemClock;
import android.view.MotionEvent;
import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class z extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19487j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ AndroidComposeView f19488k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z(AndroidComposeView androidComposeView, int i5) {
        super(0);
        this.f19487j = i5;
        this.f19488k = androidComposeView;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int actionMasked;
        switch (this.f19487j) {
            case 0:
                AndroidComposeView androidComposeView = this.f19488k;
                MotionEvent motionEvent = androidComposeView.previousMotionEvent;
                if (motionEvent != null && ((actionMasked = motionEvent.getActionMasked()) == 7 || actionMasked == 9)) {
                    androidComposeView.relayoutTime = SystemClock.uptimeMillis();
                    androidComposeView.post(androidComposeView.resendMotionEventRunnable);
                }
                return Unit.f71706a;
            default:
                return this.f19488k.get_viewTreeOwners();
        }
    }
}
