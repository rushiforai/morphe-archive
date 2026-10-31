package androidx.activity.result.contract;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.ext.SdkExtensions;
import android.provider.MediaStore;
import androidx.compose.ui.node.LayoutNode;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import k.a;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0016\u0018\u00002\u0019\u0012\u0004\u0012\u00020\u0002\u0012\u000f\u0012\r\u0012\t\u0012\u00070\u0004¢\u0006\u0002\b\u00050\u00030\u0001¨\u0006\u0006"}, d2 = {"androidx/activity/result/contract/ActivityResultContracts$PickMultipleVisualMedia", "Lk/b;", b.f42142b, b.f42142b, "Landroid/net/Uri;", "Lkotlin/jvm/JvmSuppressWildcards;", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes2.dex */
public class ActivityResultContracts$PickMultipleVisualMedia extends k.b {
    public ActivityResultContracts$PickMultipleVisualMedia() {
        int i5 = Build.VERSION.SDK_INT;
        if (((i5 < 33 && (i5 < 30 || SdkExtensions.getExtensionVersion(30) < 2)) ? LayoutNode.NotPlacedPlaceOrder : MediaStore.getPickImagesMaxLimit()) <= 1) {
            throw new IllegalArgumentException("Max items must be higher than 1");
        }
    }

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
        Object arrayList;
        if (i5 != -1) {
            intent = null;
        }
        if (intent != null) {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            Uri data = intent.getData();
            if (data != null) {
                linkedHashSet.add(data);
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
            if (arrayList != null) {
                return arrayList;
            }
        }
        return EmptyList.f71733a;
    }
}
