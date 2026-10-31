package androidx.activity.result.contract;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import k.a;
import k.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$TakePicturePreview", "Lk/b;", "Ljava/lang/Void;", "Landroid/graphics/Bitmap;", "<init>", "()V", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class ActivityResultContracts$TakePicturePreview extends b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        return new Intent("android.media.action.IMAGE_CAPTURE");
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        Intrinsics.g(context, "context");
        return null;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        if (i5 != -1) {
            intent = null;
        }
        if (intent != null) {
            return (Bitmap) intent.getParcelableExtra("data");
        }
        return null;
    }
}
