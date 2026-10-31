package sr;

import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class o extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f87732j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ FinancialConnectionsSheetLiteActivity f87733k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o(FinancialConnectionsSheetLiteActivity financialConnectionsSheetLiteActivity, int i5) {
        super(0);
        this.f87732j = i5;
        this.f87733k = financialConnectionsSheetLiteActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f87732j) {
            case 0:
                return this.f87733k.getViewModelStore();
            default:
                return this.f87733k.getDefaultViewModelCreationExtras();
        }
    }
}
