package androidx.activity.result.contract;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import k.a;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia", "Lk/b;", b.f42142b, "Landroid/net/Uri;", "<init>", "()V", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class ActivityResultContracts$PickVisualMedia extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        if (obj != null) {
            throw new ClassCastException();
        }
        Intrinsics.g(null, "input");
        throw null;
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        if (obj != null) {
            throw new ClassCastException();
        }
        Intrinsics.g(context, "context");
        Intrinsics.g(null, "input");
        return null;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        List arrayList;
        if (i5 != -1) {
            intent = null;
        }
        if (intent == null) {
            return null;
        }
        Uri data = intent.getData();
        if (data != null) {
            return data;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Uri data2 = intent.getData();
        if (data2 != null) {
            linkedHashSet.add(data2);
        }
        ClipData clipData = intent.getClipData();
        if (clipData == null && linkedHashSet.isEmpty()) {
            arrayList = EmptyList.f71733a;
        } else {
            if (clipData != null) {
                int itemCount = clipData.getItemCount();
                for (int i11 = 0; i11 < itemCount; i11++) {
                    Uri uri = clipData.getItemAt(i11).getUri();
                    if (uri != null) {
                        linkedHashSet.add(uri);
                    }
                }
            }
            arrayList = new ArrayList(linkedHashSet);
        }
        return (Uri) g.Y0(arrayList);
    }
}
