package io.branch.search.ui;

import android.content.ComponentName;
import android.os.UserHandle;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {
    public static /* synthetic */ BranchEntity.App a(InterfaceC3331q6.b bVar, String title, Image primaryImage, String packageName, ComponentName componentName, UserHandle userHandle, int i5) {
        Intrinsics.g(title, "title");
        Intrinsics.g(primaryImage, "primaryImage");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(userHandle, "userHandle");
        return new BranchEntity.App(bVar, title, primaryImage, packageName, componentName, userHandle, i5);
    }
}
