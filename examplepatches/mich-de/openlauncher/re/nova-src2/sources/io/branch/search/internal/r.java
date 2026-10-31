package io.branch.search.internal;

import java.util.Map;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class r extends AbstractC3393u1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Map<String, String> f65582a;

    public r(Map<String, String> map) {
        this.f65582a = map;
    }

    @Override // io.branch.search.internal.AbstractC3393u1
    @Nullable
    public final String a(@Nullable String str) {
        return this.f65582a.get(str);
    }
}
