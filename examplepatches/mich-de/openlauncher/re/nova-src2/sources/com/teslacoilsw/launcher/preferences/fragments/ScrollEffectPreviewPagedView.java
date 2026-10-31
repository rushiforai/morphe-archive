package com.teslacoilsw.launcher.preferences.fragments;

import android.content.Context;
import android.util.AttributeSet;
import bh.g;
import com.teslacoilsw.launcher.widget.PagedViewSimple;
import com.vungle.ads.internal.protos.Sdk;
import e10.h3;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fragments/ScrollEffectPreviewPagedView;", "Lcom/teslacoilsw/launcher/widget/PagedViewSimple;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ScrollEffectPreviewPagedView extends PagedViewSimple {
    public h3 T;

    public ScrollEffectPreviewPagedView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        g.M(context, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE);
        this.T = h3.f51572d;
    }

    @Override // o9.s2
    public final void b0(int i5) {
        super.b0(i5);
        this.T.d(this, i5);
    }

    public final void t0() {
        if (G() == 0) {
            n0(G() + 1, false);
        } else {
            n0(G() - 1, false);
        }
    }

    public final void u0(h3 h3Var) {
        setCameraDistance(3250.0f);
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            this.T.f51574a.b(this, getChildAt(i5), 0, 0.0f);
        }
        this.T = h3Var;
    }
}
