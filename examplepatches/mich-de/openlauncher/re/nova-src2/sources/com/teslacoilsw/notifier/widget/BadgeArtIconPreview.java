package com.teslacoilsw.notifier.widget;

import ab.e0;
import android.content.Context;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import bh.g;
import com.android.launcher3.BubbleTextView;
import e10.a3;
import e10.g2;
import e10.p4;
import e10.y2;
import fz.r;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.UInt;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import mz.c;
import mz.d;
import mz.e;
import mz.k;
import mz.l;
import mz.o;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r30.a;
import tz.v;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/notifier/widget/BadgeArtIconPreview;", "Lcom/android/launcher3/BubbleTextView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class BadgeArtIconPreview extends BubbleTextView {
    public final k B;

    @JvmOverloads
    public BadgeArtIconPreview(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4);
    }

    @Override // com.android.launcher3.BubbleTextView
    public final boolean J() {
        return true;
    }

    public final void V(p4 p4Var, o oVar, l lVar, v vVar) {
        g gVar;
        e eVar = this.f20879r;
        eVar.f77309c = 1.0f;
        int iOrdinal = p4Var.ordinal();
        if (iOrdinal == 0) {
            gVar = this.B;
        } else if (iOrdinal == 1) {
            gVar = d.f77306c;
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            gVar = c.f77305c;
        }
        eVar.f77313g = gVar;
        int i5 = this.f20875l;
        if (r.f56353c == null) {
            Path path = new Path();
            r.f56351a.a(path, 0.0f, 0.0f, 50.0f);
            r.f56353c = path;
        }
        this.f20878q = new mz.g(i5, r.f56353c, p4Var, oVar, lVar, 64);
        eVar.f77314h = vVar;
        invalidate();
    }

    public BadgeArtIconPreview(Context context, AttributeSet attributeSet, int i5) {
        super(context, (i5 & 2) != 0 ? null : attributeSet, 0);
        e eVar = this.f20879r;
        eVar.f77313g = d.f77306c;
        eVar.f77307a = -5650439;
        eVar.f77310d = -1;
        eVar.f77311e = -1;
        eVar.f77312f = 3;
        int iK = w20.e.k(80);
        this.f20875l = iK;
        int iA = a.a(iK, 16);
        Drawable drawable = context.getDrawable(2131231529);
        Intrinsics.d(drawable);
        this.B = new k(e0.Y(drawable, iA, iA, 4));
        g2 g2Var = a3.f51435a;
        p4 p4Var = g2Var.f51557m;
        o oVar = g2Var.n;
        l lVar = (l) y2.f51877a.z1().l();
        UInt.Companion companion = UInt.f71696b;
        V(p4Var, oVar, lVar, new v(-1, -16777216, -1, -1, -1));
        this.f20879r.f77309c = 0.0f;
        setTextSize(0.0f);
        setCompoundDrawablePadding(0);
    }
}
