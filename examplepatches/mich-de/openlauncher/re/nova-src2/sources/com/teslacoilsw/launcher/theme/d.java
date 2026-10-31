package com.teslacoilsw.launcher.theme;

import aa.n;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import bh.g;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import com.teslacoilsw.launcher.widget.FixedSizeImageView;
import java.util.ArrayList;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import mx.p1;
import u20.t;
import u20.u;

/* loaded from: classes4.dex */
public final class d extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f46351a;

    /* renamed from: b, reason: collision with root package name */
    public final Drawable f46352b;

    /* renamed from: c, reason: collision with root package name */
    public final int f46353c;

    /* renamed from: d, reason: collision with root package name */
    public long f46354d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ThemeListFragment f46355e;

    public d(ThemeListFragment themeListFragment, ArrayList arrayList, Drawable drawable) {
        this.f46355e = themeListFragment;
        this.f46351a = arrayList;
        this.f46352b = drawable;
        int i5 = themeListFragment.f46333f;
        this.f46353c = i5;
        if (i5 == 0) {
            this.f46353c = w20.e.k(64);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f46351a.size() + 2;
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemViewType(int i5) {
        ArrayList arrayList = this.f46351a;
        if (i5 == arrayList.size()) {
            return 3;
        }
        return (i5 >= arrayList.size() || !(arrayList.get(i5) instanceof t)) ? 0 : 1;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        c cVar = (c) s2Var;
        ArrayList arrayList = this.f46351a;
        if (i5 < arrayList.size()) {
            Object obj = arrayList.get(i5);
            if (obj instanceof ThemeListFragment.ThemePackageInfo) {
                TextView textView = cVar.f46348c;
                if (textView != null) {
                    textView.setText(((ThemeListFragment.ThemePackageInfo) obj).f46341b);
                }
                ImageView imageView = cVar.f46349d;
                if (imageView != null) {
                    imageView.setImageDrawable(((ThemeListFragment.ThemePackageInfo) obj).f46342c);
                }
            } else {
                Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.theme.ThemeListFragment.DefaultChoices");
                Intrinsics.e(cVar, "null cannot be cast to non-null type com.teslacoilsw.launcher.theme.ThemeListFragment.ThemePackageInfoAdapter.DefaultChoiceViewHolder");
                ViewGroup viewGroup = (ViewGroup) ((u) cVar).f46347b.findViewById(2131428209);
                viewGroup.removeAllViews();
                for (Pair pair : ((t) obj).f90514a) {
                    FixedSizeImageView fixedSizeImageView = new FixedSizeImageView(viewGroup.getContext(), null);
                    fixedSizeImageView.setTag(pair);
                    fixedSizeImageView.setOnClickListener(cVar);
                    fixedSizeImageView.setImageDrawable(new n((Bitmap) pair.f71684b, 0, false));
                    int iM = g.M(viewGroup.getContext(), 64);
                    ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(iM, iM);
                    marginLayoutParams.setMarginEnd(w20.e.k(16));
                    viewGroup.addView(fixedSizeImageView, marginLayoutParams);
                }
            }
        } else if (i5 > arrayList.size()) {
            TextView textView2 = cVar.f46348c;
            if (textView2 != null) {
                textView2.setText(2132017951);
            }
            ImageView imageView2 = cVar.f46349d;
            if (imageView2 != null) {
                imageView2.setImageDrawable(this.f46352b);
            }
        } else {
            arrayList.size();
        }
        if (this.f46355e.f46336i) {
            View view = cVar.f46347b;
            view.setTranslationY(w20.e.k(64) * 3.0f);
            view.setAlpha(0.0f);
            long jUptimeMillis = SystemClock.uptimeMillis();
            long j11 = this.f46354d;
            long jMax = j11 != 0 ? Math.max(0L, 60 - (jUptimeMillis - j11)) : 0L;
            this.f46354d = jUptimeMillis + jMax;
            view.animate().translationY(0.0f).alpha(1.0f).setDuration(400L).setStartDelay(jMax).setInterpolator(zx.d.f98805a).setListener(p1.f77227d).withLayer().start();
        }
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        return i5 != 0 ? i5 != 1 ? new c(this, LayoutInflater.from(viewGroup.getContext()).inflate(2131624066, viewGroup, false)) : new u(this, LayoutInflater.from(viewGroup.getContext()).inflate(2131624441, viewGroup, false)) : new c(this, LayoutInflater.from(viewGroup.getContext()).inflate(2131624065, viewGroup, false));
    }
}
