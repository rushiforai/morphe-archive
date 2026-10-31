package com.instabridge.mobilesdk.internal.ui.screens;

import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class TravelPlansScreenKt$RegionCoverageSheet$1$invoke$lambda$4$lambda$3$lambda$2$$inlined$itemsIndexed$default$1 implements Function1<Integer, Object> {
    final /* synthetic */ List $items;
    final /* synthetic */ Function2 $key;

    public TravelPlansScreenKt$RegionCoverageSheet$1$invoke$lambda$4$lambda$3$lambda$2$$inlined$itemsIndexed$default$1(Function2 function2, List list) {
        this.$key = function2;
        this.$items = list;
    }

    @Override // kotlin.jvm.functions.Function1
    public /* bridge */ /* synthetic */ Object invoke(Object obj) {
        return invoke(((Number) obj).intValue());
    }

    public final Object invoke(int i5) {
        return this.$key.invoke(Integer.valueOf(i5), this.$items.get(i5));
    }
}
