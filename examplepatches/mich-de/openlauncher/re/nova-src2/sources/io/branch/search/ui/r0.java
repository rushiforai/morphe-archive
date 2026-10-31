package io.branch.search.ui;

import android.text.Html;
import android.text.Spanned;
import io.branch.search.ui.BranchEntity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class r0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ BranchEntity.HeroV2 f66510j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r0(BranchEntity.HeroV2 heroV2) {
        super(0);
        this.f66510j = heroV2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        String str = this.f66510j.f66429c;
        if (str == null) {
            return null;
        }
        Spanned spannedFromHtml = Html.fromHtml(str, 63);
        Intrinsics.f(spannedFromHtml, "fromHtml(this, HtmlCompat.FROM_HTML_MODE_COMPACT)");
        return spannedFromHtml;
    }
}
