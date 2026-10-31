package io.branch.engage.sesame_lite.api_integration;

import android.app.Activity;
import android.os.Bundle;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import n4.b;
import o4.a;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/engage/sesame_lite/api_integration/AskPermissionActivity;", "Landroid/app/Activity;", "<init>", "()V", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class AskPermissionActivity extends Activity {
    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        String[] stringArrayExtra = getIntent().getStringArrayExtra("extra_permissions");
        if (stringArrayExtra == null || stringArrayExtra.length == 0) {
            setResult(0);
            finish();
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (String it : stringArrayExtra) {
            Intrinsics.f(it, "it");
            if (!(a.a(this, it) == 0)) {
                arrayList.add(it);
            }
        }
        if (arrayList.isEmpty()) {
            setResult(-1);
            finish();
        } else {
            Object[] array = arrayList.toArray(new String[0]);
            Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
            b.g(this, (String[]) array, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0032  */
    @Override // android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onRequestPermissionsResult(int i5, String[] permissions, int[] grantResults) {
        Integer numValueOf;
        Intrinsics.g(permissions, "permissions");
        Intrinsics.g(grantResults, "grantResults");
        super.onRequestPermissionsResult(i5, permissions, grantResults);
        if (i5 == 123) {
            if (!(grantResults.length == 0)) {
                int length = grantResults.length;
                int i11 = 0;
                while (true) {
                    if (i11 >= length) {
                        numValueOf = null;
                        break;
                    }
                    int i12 = grantResults[i11];
                    if (i12 == 0) {
                        numValueOf = Integer.valueOf(i12);
                        break;
                    }
                    i11++;
                }
                if (numValueOf != null) {
                    setResult(-1);
                } else {
                    setResult(0);
                }
            }
            finish();
        }
    }
}
