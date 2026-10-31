package io.branch.search.ui;

import io.branch.search.ui.BranchEntity;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class s extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final s f66511j = new s(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        BranchEntity.Shortcut it = (BranchEntity.Shortcut) obj;
        Intrinsics.g(it, "it");
        return it.toString();
    }
}
