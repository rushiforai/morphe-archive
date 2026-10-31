package as;

import com.stripe.android.googlepaylauncher.GooglePayLauncherActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class r extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f15630j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ GooglePayLauncherActivity f15631k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r(GooglePayLauncherActivity googlePayLauncherActivity, int i5) {
        super(0);
        this.f15630j = i5;
        this.f15631k = googlePayLauncherActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f15630j) {
            case 0:
                return this.f15631k.getViewModelStore();
            default:
                return this.f15631k.getDefaultViewModelCreationExtras();
        }
    }
}
