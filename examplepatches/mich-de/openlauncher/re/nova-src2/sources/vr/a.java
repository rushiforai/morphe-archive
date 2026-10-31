package vr;

import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92921a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FinancialConnectionsSheetConfiguration f92922b;

    public /* synthetic */ a(FinancialConnectionsSheetConfiguration financialConnectionsSheetConfiguration, int i5) {
        this.f92921a = i5;
        this.f92922b = financialConnectionsSheetConfiguration;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f92921a) {
            case 0:
                return this.f92922b.f42659b;
            default:
                return this.f92922b.f42660c;
        }
    }
}
