package com.instabridge.ai.tools;

import java.util.Iterator;
import kotlin.Metadata;
import kotlin.collections.Grouping;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010(\n\u0002\b\u0004*\u0001\u0000\b\n\u0018\u00002\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0001J\u000e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003H\u0016J\u0015\u0010\u0004\u001a\u00028\u00012\u0006\u0010\u0005\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u0006¨\u0006\u0007¸\u0006\u0000"}, d2 = {"kotlin/collections/CollectionsKt___CollectionsKt$groupingBy$1", "Lkotlin/collections/Grouping;", "sourceIterator", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "keyOf", "element", "(Ljava/lang/Object;)Ljava/lang/Object;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class PhoneNumberNormalizer$getSimCountryByVote$$inlined$groupingBy$1 implements Grouping<String, String> {
    final /* synthetic */ Iterable $this_groupingBy;

    public PhoneNumberNormalizer$getSimCountryByVote$$inlined$groupingBy$1(Iterable iterable) {
        this.$this_groupingBy = iterable;
    }

    @Override // kotlin.collections.Grouping
    public String keyOf(String element) {
        return element;
    }

    @Override // kotlin.collections.Grouping
    public Iterator<String> sourceIterator() {
        return this.$this_groupingBy.iterator();
    }
}
