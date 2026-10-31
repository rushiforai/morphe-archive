package com.amplitude.android.internal.locators;

import com.amplitude.android.utilities.ComposeUtils;
import com.amplitude.common.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R-\u0010\u0003\u001a\u0014\u0012\u0004\u0012\u00020\u0005\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u00060\u00048FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\n\u0010\u000b\u001a\u0004\b\b\u0010\t¨\u0006\f"}, d2 = {"Lcom/amplitude/android/internal/locators/ViewTargetLocators;", b.f42142b, "()V", "ALL", "Lkotlin/Function1;", "Lcom/amplitude/common/Logger;", b.f42142b, "Lcom/amplitude/android/internal/locators/ViewTargetLocator;", "getALL", "()Lkotlin/jvm/functions/Function1;", "ALL$delegate", "Lkotlin/Lazy;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ViewTargetLocators {

    @NotNull
    public static final ViewTargetLocators INSTANCE = new ViewTargetLocators();

    /* renamed from: ALL$delegate, reason: from kotlin metadata */
    @NotNull
    private static final Lazy ALL = LazyKt.a(new Function0<Function1<? super Logger, ? extends List<ViewTargetLocator>>>() { // from class: com.amplitude.android.internal.locators.ViewTargetLocators$ALL$2
        @Override // kotlin.jvm.functions.Function0
        @NotNull
        public final Function1<Logger, List<ViewTargetLocator>> invoke() {
            return new Function1<Logger, List<ViewTargetLocator>>() { // from class: com.amplitude.android.internal.locators.ViewTargetLocators$ALL$2.1
                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final List<ViewTargetLocator> invoke(@NotNull Logger logger) {
                    Intrinsics.g(logger, "logger");
                    ArrayList arrayList = new ArrayList();
                    if (ComposeUtils.isComposeAvailable$default(ComposeUtils.INSTANCE, null, 1, null)) {
                        arrayList.add(new ComposeViewTargetLocator(logger));
                    }
                    arrayList.add(new AndroidViewTargetLocator());
                    return arrayList;
                }
            };
        }
    });

    private ViewTargetLocators() {
    }

    @NotNull
    public final Function1<Logger, List<ViewTargetLocator>> getALL() {
        return (Function1) ALL.getValue();
    }
}
