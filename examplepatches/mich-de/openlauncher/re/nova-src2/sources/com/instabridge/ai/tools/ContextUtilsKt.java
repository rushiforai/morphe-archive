package com.instabridge.ai.tools;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u000f\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\u0080\u0010¨\u0006\u0003"}, d2 = {"findActivity", "Landroid/app/Activity;", "Landroid/content/Context;", "instabridge-ai-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ContextUtilsKt {
    @Nullable
    public static final Activity findActivity(@NotNull Context context) {
        Intrinsics.g(context, "<this>");
        while (!(context instanceof Activity)) {
            if (!(context instanceof ContextWrapper)) {
                return null;
            }
            context = ((ContextWrapper) context).getBaseContext();
            Intrinsics.f(context, "getBaseContext(...)");
        }
        return (Activity) context;
    }
}
