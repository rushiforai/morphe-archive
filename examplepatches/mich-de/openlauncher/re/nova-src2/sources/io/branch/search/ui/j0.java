package io.branch.search.ui;

import io.branch.search.ui.Image;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class j0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Image.AppIcon f66504j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0(Image.AppIcon appIcon) {
        super(0);
        this.f66504j = appIcon;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        String packageName = this.f66504j.f66477a.getPackageName();
        Intrinsics.f(packageName, "componentName.packageName");
        return packageName;
    }
}
