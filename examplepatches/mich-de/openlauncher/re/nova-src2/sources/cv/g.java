package cv;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionActivity;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionContract;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48006a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CvcRecollectionActivity f48007b;

    public /* synthetic */ g(CvcRecollectionActivity cvcRecollectionActivity, int i5) {
        this.f48006a = i5;
        this.f48007b = cvcRecollectionActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f48006a;
        CvcRecollectionActivity cvcRecollectionActivity = this.f48007b;
        switch (i5) {
            case 0:
                int i11 = CvcRecollectionActivity.f44919q;
                Intent intent = cvcRecollectionActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                Bundle extras = intent.getExtras();
                CvcRecollectionContract.Args args = extras != null ? (CvcRecollectionContract.Args) vm.d.i(extras, "extra_activity_args", CvcRecollectionContract.Args.class) : null;
                if (args != null) {
                    return args;
                }
                throw new IllegalStateException("Cannot start CVC Recollection flow without args");
            case 1:
                int i12 = CvcRecollectionActivity.f44919q;
                return new com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.e((CvcRecollectionContract.Args) cvcRecollectionActivity.o.getValue());
            default:
                ((v) cvcRecollectionActivity.f44920p.getValue()).e(r.f48036a);
                return Unit.f71706a;
        }
    }
}
