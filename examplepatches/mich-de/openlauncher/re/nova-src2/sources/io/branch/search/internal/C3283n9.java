package io.branch.search.internal;

import android.text.Html;
import android.text.Spanned;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.n9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3283n9 {
    @NotNull
    public static final Spanned a(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        Spanned spannedFromHtml = Html.fromHtml(str, 63);
        Intrinsics.f(spannedFromHtml, "fromHtml(this, HtmlCompat.FROM_HTML_MODE_COMPACT)");
        return spannedFromHtml;
    }
}
