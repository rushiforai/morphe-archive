package du;

import com.stripe.android.payments.StripeBrowserLauncherActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class s extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f49582j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ StripeBrowserLauncherActivity f49583k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s(StripeBrowserLauncherActivity stripeBrowserLauncherActivity, int i5) {
        super(0);
        this.f49582j = i5;
        this.f49583k = stripeBrowserLauncherActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f49582j) {
            case 0:
                return this.f49583k.getViewModelStore();
            default:
                return this.f49583k.getDefaultViewModelCreationExtras();
        }
    }
}
