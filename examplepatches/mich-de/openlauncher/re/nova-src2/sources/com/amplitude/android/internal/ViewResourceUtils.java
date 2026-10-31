package com.amplitude.android.internal;

import android.content.res.Resources;
import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.a;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0018\u0010\u0003\u001a\u00020\u0004*\u00020\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0006R\u0015\u0010\u0007\u001a\u00020\b*\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\t\u0010\nR\u0017\u0010\u000b\u001a\u0004\u0018\u00010\b*\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\f\u0010\n¨\u0006\r"}, d2 = {"Lcom/amplitude/android/internal/ViewResourceUtils;", b.f42142b, "()V", "isIdGenerated", b.f42142b, "Landroid/view/View;", "(Landroid/view/View;)Z", "resourceId", b.f42142b, "getResourceId", "(Landroid/view/View;)Ljava/lang/String;", "resourceIdWithFallback", "getResourceIdWithFallback", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class ViewResourceUtils {

    @NotNull
    public static final ViewResourceUtils INSTANCE = new ViewResourceUtils();

    private ViewResourceUtils() {
    }

    private final boolean isIdGenerated(View view) {
        return (view.getId() & (-16777216)) == 0 && (view.getId() & 16777215) != 0;
    }

    @NotNull
    public final String getResourceId(@NotNull View view) throws Resources.NotFoundException {
        Intrinsics.g(view, "<this>");
        if (view.getId() == -1 || isIdGenerated(view)) {
            throw new Resources.NotFoundException();
        }
        Resources resources = view.getContext().getResources();
        String resourceEntryName = resources != null ? resources.getResourceEntryName(view.getId()) : null;
        return resourceEntryName == null ? b.f42142b : resourceEntryName;
    }

    @Nullable
    public final String getResourceIdWithFallback(@NotNull View view) {
        Object objA;
        String strConcat;
        Intrinsics.g(view, "<this>");
        try {
            int i5 = Result.f71687b;
            objA = INSTANCE.getResourceId(view);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (Result.a(objA) != null) {
            if (view.getId() == -1) {
                strConcat = null;
            } else {
                int id2 = view.getId();
                a.a(16);
                String string = Integer.toString(id2, 16);
                Intrinsics.f(string, "toString(...)");
                strConcat = "0x".concat(string);
            }
            objA = strConcat;
        }
        return (String) objA;
    }
}
