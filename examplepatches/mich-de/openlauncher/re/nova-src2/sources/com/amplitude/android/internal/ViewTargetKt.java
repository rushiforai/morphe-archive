package com.amplitude.android.internal;

import b70.g;
import com.amplitude.core.Constants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a$\u0010\u0000\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00012\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0002¨\u0006\u0007"}, d2 = {"buildElementInteractedProperties", b.f42142b, b.f42142b, b.f42142b, "target", "Lcom/amplitude/android/internal/ViewTarget;", "activityName", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ViewTargetKt {
    @NotNull
    public static final Map<String, Object> buildElementInteractedProperties(@NotNull ViewTarget target, @NotNull String activityName) {
        Intrinsics.g(target, "target");
        Intrinsics.g(activityName, "activityName");
        return MapsKt.j0(new Pair("[Amplitude] Action", "touch"), new Pair("[Amplitude] Target Class", target.getClassName()), new Pair("[Amplitude] Target Resource", target.getResourceName()), new Pair("[Amplitude] Target Tag", target.getTag()), new Pair("[Amplitude] Target Text", target.getText()), new Pair(Constants.EventProperties.TARGET_ACCESSIBILITY_LABEL, target.getAccessibilityLabel()), new Pair("[Amplitude] Target Source", g.f1(k.i1(j.F0(target.getSource(), "_", " ", false), new String[]{" "}, 6), " ", null, null, 0, new Function1<String, CharSequence>() { // from class: com.amplitude.android.internal.ViewTargetKt.buildElementInteractedProperties.1
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final CharSequence invoke(@NotNull String it) {
                Intrinsics.g(it, "it");
                if (it.length() <= 0) {
                    return it;
                }
                StringBuilder sb2 = new StringBuilder();
                String strValueOf = String.valueOf(it.charAt(0));
                Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
                String upperCase = strValueOf.toUpperCase(Locale.ROOT);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                sb2.append((Object) upperCase);
                String strSubstring = it.substring(1);
                Intrinsics.f(strSubstring, "substring(...)");
                sb2.append(strSubstring);
                return sb2.toString();
            }
        }, 30)), new Pair("[Amplitude] Hierarchy", target.getHierarchy()), new Pair("[Amplitude] Screen Name", activityName));
    }
}
