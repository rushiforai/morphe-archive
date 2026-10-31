package com.teslacoilsw.launcher.preferences.fancyprefs;

import a5.a1;
import aa.p;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.ImageView;
import f10.a;
import fz.h;
import fz.i;
import fz.q;
import h6.c1;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefCornerRadiusSeekBarView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSeekBarView;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefCornerRadiusSeekBarView extends FancyPrefSeekBarView {
    public final int U;
    public q V;

    @JvmOverloads
    public FancyPrefCornerRadiusSeekBarView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.n);
        WeakHashMap weakHashMap = a1.f250a;
        int i5 = typedArrayObtainStyledAttributes.getInt(0, getLayoutDirection() != 1 ? 0 : 1);
        typedArrayObtainStyledAttributes.recycle();
        this.U = i5;
        this.V = q.f56341c;
        float fH = c1.h(context, 3);
        int iB = p.b(context, 16842806);
        fz.p.Companion.getClass();
        this.N.setImageDrawable(new a(fH, iB, i5, fz.p.f56326j));
        ImageView imageView = this.N;
        ViewGroup.LayoutParams layoutParams = imageView.getLayoutParams();
        if (layoutParams == null) {
            throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        marginLayoutParams.bottomMargin = c1.h(context, 14);
        imageView.setLayoutParams(marginLayoutParams);
        O(0);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSeekBarView
    public final void O(int i5) {
        fz.p pVar;
        ImageView imageView = this.N;
        Object drawable = imageView != null ? imageView.getDrawable() : null;
        a aVar = drawable instanceof a ? (a) drawable : null;
        if (aVar == null) {
            return;
        }
        i iVar = new i((i5 * 50) / this.Q, this.V);
        int i11 = this.U;
        if (i11 == 0) {
            h hVar = i.Companion;
            hVar.getClass();
            i iVar2 = i.f56258e;
            hVar.getClass();
            hVar.getClass();
            pVar = new fz.p(iVar, iVar2, iVar2, iVar2);
        } else if (i11 == 1) {
            h hVar2 = i.Companion;
            hVar2.getClass();
            i iVar3 = i.f56258e;
            hVar2.getClass();
            hVar2.getClass();
            pVar = new fz.p(iVar3, iVar, iVar3, iVar3);
        } else if (i11 == 2) {
            h hVar3 = i.Companion;
            hVar3.getClass();
            i iVar4 = i.f56258e;
            hVar3.getClass();
            hVar3.getClass();
            pVar = new fz.p(iVar4, iVar4, iVar, iVar4);
        } else {
            if (i11 != 3) {
                throw new IllegalStateException();
            }
            h hVar4 = i.Companion;
            hVar4.getClass();
            i iVar5 = i.f56258e;
            hVar4.getClass();
            hVar4.getClass();
            pVar = new fz.p(iVar5, iVar5, iVar5, iVar);
        }
        aVar.f54164b = pVar;
        aVar.invalidateSelf();
    }

    public final void Q(q qVar) {
        if (this.V != qVar) {
            this.V = qVar;
            O(K());
        }
    }
}
