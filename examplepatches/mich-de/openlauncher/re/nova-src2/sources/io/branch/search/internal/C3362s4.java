package io.branch.search.internal;

import android.text.Html;
import android.text.Spanned;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.s4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3362s4 extends Lambda implements Function0<Spanned> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3345r4<BranchEntity> f65724a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3362s4(C3345r4<BranchEntity> c3345r4) {
        super(0);
        this.f65724a = c3345r4;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        String str = this.f65724a.f65609a;
        if (str == null) {
            return null;
        }
        Spanned spannedFromHtml = Html.fromHtml(str, 63);
        Intrinsics.f(spannedFromHtml, "fromHtml(this, HtmlCompat.FROM_HTML_MODE_COMPACT)");
        return spannedFromHtml;
    }
}
