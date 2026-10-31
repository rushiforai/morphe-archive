package androidx.activity.result.contract;

import android.content.Context;
import android.content.Intent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import k.a;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010\u000b\n\u0002\b\u0003\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$RequestPermission", "Lk/b;", b.f42142b, b.f42142b, "<init>", "()V", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ActivityResultContracts$RequestPermission extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        String input = (String) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent("androidx.activity.result.contract.action.REQUEST_PERMISSIONS").putExtra("androidx.activity.result.contract.extra.PERMISSIONS", new String[]{input});
        Intrinsics.f(intentPutExtra, "Intent(ACTION_REQUEST_PE…EXTRA_PERMISSIONS, input)");
        return intentPutExtra;
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        String input = (String) obj;
        Intrinsics.g(context, "context");
        Intrinsics.g(input, "input");
        if (o4.a.a(context, input) == 0) {
            return new a(Boolean.TRUE);
        }
        return null;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        if (intent == null || i5 != -1) {
            return Boolean.FALSE;
        }
        int[] intArrayExtra = intent.getIntArrayExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS");
        boolean z11 = false;
        if (intArrayExtra != null) {
            int length = intArrayExtra.length;
            int i11 = 0;
            while (true) {
                if (i11 >= length) {
                    break;
                }
                if (intArrayExtra[i11] == 0) {
                    z11 = true;
                    break;
                }
                i11++;
            }
        }
        return Boolean.valueOf(z11);
    }
}
