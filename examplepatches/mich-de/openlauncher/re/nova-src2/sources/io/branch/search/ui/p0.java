package io.branch.search.ui;

import android.text.Html;
import android.text.Spanned;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class p0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ BranchEntity.HeroAd f66508j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p0(BranchEntity.HeroAd heroAd) {
        super(0);
        this.f66508j = heroAd;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        String str = this.f66508j.f66420c;
        if (str == null) {
            return null;
        }
        Spanned spannedFromHtml = Html.fromHtml(str, 63);
        Intrinsics.f(spannedFromHtml, "fromHtml(this, HtmlCompat.FROM_HTML_MODE_COMPACT)");
        return spannedFromHtml;
    }
}
