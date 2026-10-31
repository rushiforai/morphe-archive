package androidx.activity.result.contract;

import android.content.Context;
import android.content.Intent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import k.a;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$GetContent", "Lk/b;", b.f42142b, "Landroid/net/Uri;", "<init>", "()V", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class ActivityResultContracts$GetContent extends k.b {
    @Override // k.b
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public Intent createIntent(Context context, String input) {
        Intrinsics.g(input, "input");
        Intent type = new Intent("android.intent.action.GET_CONTENT").addCategory("android.intent.category.OPENABLE").setType(input);
        Intrinsics.f(type, "Intent(Intent.ACTION_GET…          .setType(input)");
        return type;
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        String input = (String) obj;
        Intrinsics.g(context, "context");
        Intrinsics.g(input, "input");
        return null;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        if (i5 != -1) {
            intent = null;
        }
        if (intent != null) {
            return intent.getData();
        }
        return null;
    }
}
