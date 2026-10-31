package g;

import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import androidx.activity.result.IntentSenderRequest;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m extends j.i {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ o f56423h;

    public m(o oVar) {
        this.f56423h = oVar;
    }

    @Override // j.i
    public final void b(int i5, k.b contract, Object obj, n4.c cVar) {
        Bundle bundleA;
        int i11;
        Intrinsics.g(contract, "contract");
        o oVar = this.f56423h;
        k.a synchronousResult = contract.getSynchronousResult(oVar, obj);
        if (synchronousResult != null) {
            new Handler(Looper.getMainLooper()).post(new com.instabridge.ai.chat.ui.c0(this, i5, synchronousResult, 2));
            return;
        }
        Intent intentCreateIntent = contract.createIntent(oVar, obj);
        if (intentCreateIntent.getExtras() != null) {
            Bundle extras = intentCreateIntent.getExtras();
            Intrinsics.d(extras);
            if (extras.getClassLoader() == null) {
                intentCreateIntent.setExtrasClassLoader(oVar.getClassLoader());
            }
        }
        if (intentCreateIntent.hasExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE")) {
            bundleA = intentCreateIntent.getBundleExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
            intentCreateIntent.removeExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
        } else {
            bundleA = cVar != null ? cVar.a() : null;
        }
        Bundle bundle = bundleA;
        if ("androidx.activity.result.contract.action.REQUEST_PERMISSIONS".equals(intentCreateIntent.getAction())) {
            String[] stringArrayExtra = intentCreateIntent.getStringArrayExtra("androidx.activity.result.contract.extra.PERMISSIONS");
            if (stringArrayExtra == null) {
                stringArrayExtra = new String[0];
            }
            n4.b.g(oVar, stringArrayExtra, i5);
            return;
        }
        if (!"androidx.activity.result.contract.action.INTENT_SENDER_REQUEST".equals(intentCreateIntent.getAction())) {
            n4.b.k(oVar, intentCreateIntent, i5, bundle);
            return;
        }
        IntentSenderRequest intentSenderRequest = (IntentSenderRequest) intentCreateIntent.getParcelableExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST");
        try {
            Intrinsics.d(intentSenderRequest);
            i11 = i5;
        } catch (IntentSender.SendIntentException e3) {
            e = e3;
            i11 = i5;
        }
        try {
            n4.b.l(oVar, intentSenderRequest.getF13599a(), i11, intentSenderRequest.getF13600b(), intentSenderRequest.getF13601c(), intentSenderRequest.getF13602d(), 0, bundle);
        } catch (IntentSender.SendIntentException e11) {
            e = e11;
            new Handler(Looper.getMainLooper()).post(new com.instabridge.ai.chat.ui.c0(this, i11, e, 3));
        }
    }
}
