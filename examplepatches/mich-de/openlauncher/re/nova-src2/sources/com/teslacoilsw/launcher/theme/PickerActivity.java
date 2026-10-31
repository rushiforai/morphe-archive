package com.teslacoilsw.launcher.theme;

import aa.i0;
import android.animation.AnimatorSet;
import android.app.FragmentManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.widget.TextView;
import com.amplitude.core.events.Plan;
import com.google.android.gms.internal.consent_sdk.e0;
import com.teslacoilsw.launcher.widget.FitWindowableFrameLayout;
import com.teslacoilsw.launcher.widget.FontFamilyTextView;
import dy.g;
import dy.k;
import m.m;
import mx.k0;

/* loaded from: classes4.dex */
public class PickerActivity extends m {
    public boolean o = true;

    /* renamed from: p, reason: collision with root package name */
    public int f46309p;

    /* renamed from: q, reason: collision with root package name */
    public FitWindowableFrameLayout f46310q;

    /* renamed from: r, reason: collision with root package name */
    public AnimatorSet f46311r;

    /* renamed from: s, reason: collision with root package name */
    public View f46312s;

    /* renamed from: t, reason: collision with root package name */
    public View f46313t;

    /* renamed from: u, reason: collision with root package name */
    public TextView f46314u;

    public final void Z(int i5, Resources resources, String str) {
        Bitmap bitmapB;
        int iH;
        Intent intent = new Intent();
        intent.putExtra(Plan.AMP_PLAN_SOURCE, str);
        if (this.o) {
            try {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inPreferredConfig = Bitmap.Config.ARGB_8888;
                options.inSampleSize = 1;
                int i11 = this.f46309p;
                if (i11 != 0) {
                    ComponentName componentName = k0.f77184z;
                    iH = ul.b.H(i11);
                } else {
                    iH = getResources().getDisplayMetrics().densityDpi;
                }
                int i12 = iH;
                int i13 = this.f46309p * 2;
                bitmapB = g.b(resources, i5, i12, i13, i13, options, true);
            } catch (Exception unused) {
                bitmapB = null;
            }
            if (bitmapB != null) {
                intent.putExtra("icon", bitmapB);
                setResult(-1, intent);
            } else {
                setResult(0, intent);
            }
        } else {
            intent.setData(Uri.parse("android.resource://" + resources.getResourcePackageName(i5) + "/" + i5));
            setResult(-1, intent);
        }
        finish();
    }

    @Override // g.o, android.app.Activity
    public final void onBackPressed() {
        AnimatorSet animatorSet = this.f46311r;
        if (animatorSet != null && animatorSet.isRunning()) {
            this.f46311r.cancel();
        }
        if (getFragmentManager().getBackStackEntryCount() <= 0) {
            super.onBackPressed();
            return;
        }
        FragmentManager fragmentManager = getFragmentManager();
        View childAt = this.f46310q.getChildCount() > 0 ? this.f46310q.getChildAt(0) : null;
        View childAt2 = this.f46310q.getChildCount() > 1 ? this.f46310q.getChildAt(1) : null;
        if (childAt == null || childAt2 == null) {
            fragmentManager.popBackStackImmediate();
            for (int i5 = 0; i5 < this.f46310q.getChildCount(); i5++) {
                this.f46310q.getChildAt(i5).setVisibility(0);
            }
            return;
        }
        FitWindowableFrameLayout fitWindowableFrameLayout = this.f46310q;
        for (int i11 = 0; i11 < fitWindowableFrameLayout.getChildCount(); i11++) {
            fitWindowableFrameLayout.getChildAt(i11).setVisibility(0);
        }
        childAt2.animate().translationY(this.f46310q.getMeasuredHeight() / 4).alpha(0.0f).withLayer().setDuration(300L).setInterpolator(new DecelerateInterpolator(0.75f)).setListener(new i0(fragmentManager, 19));
        childAt.setAlpha(0.0f);
        childAt.animate().alpha(1.0f).setInterpolator(new AccelerateInterpolator()).withLayer().setDuration(200L);
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        Bundle bundle2;
        super.onCreate(bundle);
        k kVar = fz.e.f56218a;
        fz.e.i(getApplicationContext());
        e0.d0(getWindow(), false, false);
        setContentView(2131623970);
        this.f46310q = (FitWindowableFrameLayout) findViewById(2131428092);
        Intent intent = getIntent();
        if (intent != null) {
            bundle2 = new Bundle();
            bundle2.putInt("themeType", intent.getIntExtra("themeType", 0));
            boolean booleanExtra = intent.getBooleanExtra("return-data", true);
            this.o = booleanExtra;
            bundle2.putBoolean("return-data", booleanExtra);
            bundle2.putInt("desiredWidth", intent.getIntExtra("desiredWidth", -1));
            bundle2.putInt("desiredHeight", intent.getIntExtra("desiredHeight", -1));
            int intExtra = intent.getIntExtra("iconSize", 0);
            this.f46309p = intExtra;
            bundle2.putInt("iconSize", intExtra);
            bundle2.putInt("color", intent.getIntExtra("color", -1));
        } else {
            this.f46309p = 0;
            bundle2 = null;
        }
        if (bundle == null) {
            ThemeListFragment themeListFragment = new ThemeListFragment();
            themeListFragment.setArguments(bundle2);
            getFragmentManager().beginTransaction().add(2131428092, themeListFragment).commit();
            setResult(0);
        }
    }

    @Override // androidx.fragment.app.m0, android.app.Activity, android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        return "TextView".equals(str) ? new FontFamilyTextView(context, attributeSet) : super.onCreateView(view, str, context, attributeSet);
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onPause() {
        super.onPause();
        if (isFinishing()) {
            overridePendingTransition(2130772011, 2130772012);
        }
    }
}
