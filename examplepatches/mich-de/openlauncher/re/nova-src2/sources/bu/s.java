package bu;

import com.stripe.android.paymentelement.embedded.form.FormActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class s extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f18587j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ FormActivity f18588k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s(FormActivity formActivity, int i5) {
        super(0);
        this.f18587j = i5;
        this.f18588k = formActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f18587j) {
            case 0:
                return this.f18588k.getViewModelStore();
            default:
                return this.f18588k.getDefaultViewModelCreationExtras();
        }
    }
}
