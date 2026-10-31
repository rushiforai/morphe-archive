package androidx.activity.result.contract;

import android.content.Context;
import android.content.Intent;
import b70.g;
import b70.h;
import b70.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import k.a;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0010$\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002%\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\u0002\u0012\u0015\u0012\u0013\u0012\u0004\u0012\u00020\u0003\u0012\t\u0012\u00070\u0005¢\u0006\u0002\b\u00060\u00040\u0001B\u0007¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$RequestMultiplePermissions", "Lk/b;", b.f42142b, b.f42142b, b.f42142b, b.f42142b, "Lkotlin/jvm/JvmSuppressWildcards;", "<init>", "()V", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ActivityResultContracts$RequestMultiplePermissions extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        String[] input = (String[]) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent("androidx.activity.result.contract.action.REQUEST_PERMISSIONS").putExtra("androidx.activity.result.contract.extra.PERMISSIONS", input);
        Intrinsics.f(intentPutExtra, "Intent(ACTION_REQUEST_PE…EXTRA_PERMISSIONS, input)");
        return intentPutExtra;
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        String[] input = (String[]) obj;
        Intrinsics.g(context, "context");
        Intrinsics.g(input, "input");
        if (input.length == 0) {
            return new a(h.f17594a);
        }
        for (String str : input) {
            if (o4.a.a(context, str) != 0) {
                return null;
            }
        }
        int iD0 = k.d0(input.length);
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (String str2 : input) {
            linkedHashMap.put(str2, Boolean.TRUE);
        }
        return new a(linkedHashMap);
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        if (i5 == -1 && intent != null) {
            String[] stringArrayExtra = intent.getStringArrayExtra("androidx.activity.result.contract.extra.PERMISSIONS");
            int[] intArrayExtra = intent.getIntArrayExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS");
            if (intArrayExtra != null && stringArrayExtra != null) {
                ArrayList arrayList = new ArrayList(intArrayExtra.length);
                for (int i11 : intArrayExtra) {
                    arrayList.add(Boolean.valueOf(i11 == 0));
                }
                return MapsKt.r0(g.P1(c.v0(stringArrayExtra), arrayList));
            }
        }
        return h.f17594a;
    }
}
