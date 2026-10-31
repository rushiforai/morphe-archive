package io.branch.search.internal;

import android.content.res.Resources;
import android.net.Uri;
import io.branch.search.ui.Image;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Mb implements Lb {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62944a;

    public Mb(@NotNull F4 contextDelegate) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        this.f62944a = contextDelegate;
    }

    @Override // io.branch.search.internal.Lb
    @NotNull
    public final Image.Url a(int i5) {
        Resources resources = this.f62944a.f62438a.getResources();
        Intrinsics.f(resources, "context.resources");
        String string = Uri.parse("android.resource://" + resources.getResourcePackageName(i5) + '/' + resources.getResourceTypeName(i5) + '/' + resources.getResourceEntryName(i5)).toString();
        Intrinsics.f(string, "parse(\n                C…\n            ).toString()");
        H2 resultType = H2.REMOTE_SEARCH;
        Intrinsics.g(resultType, "resultType");
        return new Image.Url(string, resultType, null);
    }
}
