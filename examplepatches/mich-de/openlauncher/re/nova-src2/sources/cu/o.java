package cu;

import com.stripe.android.paymentelement.embedded.manage.ManageActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class o extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f47960j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ManageActivity f47961k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o(ManageActivity manageActivity, int i5) {
        super(0);
        this.f47960j = i5;
        this.f47961k = manageActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f47960j) {
            case 0:
                return this.f47961k.getViewModelStore();
            default:
                return this.f47961k.getDefaultViewModelCreationExtras();
        }
    }
}
