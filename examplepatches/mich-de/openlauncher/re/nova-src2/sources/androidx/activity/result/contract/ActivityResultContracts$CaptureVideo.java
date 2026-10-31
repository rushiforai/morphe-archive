package androidx.activity.result.contract;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import k.a;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0016\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$CaptureVideo", "Lk/b;", "Landroid/net/Uri;", b.f42142b, "<init>", "()V", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes2.dex */
public class ActivityResultContracts$CaptureVideo extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Uri input = (Uri) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent("android.media.action.VIDEO_CAPTURE").putExtra("output", input);
        Intrinsics.f(intentPutExtra, "Intent(MediaStore.ACTION…tore.EXTRA_OUTPUT, input)");
        return intentPutExtra;
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        Uri input = (Uri) obj;
        Intrinsics.g(context, "context");
        Intrinsics.g(input, "input");
        return null;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        return Boolean.valueOf(i5 == -1);
    }
}
