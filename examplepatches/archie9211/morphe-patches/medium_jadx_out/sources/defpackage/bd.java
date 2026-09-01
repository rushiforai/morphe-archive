package defpackage;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.appcompat.app.AlertController$RecycleListView;
import androidx.core.widget.NestedScrollView;
import com.medium.reader.R;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bd extends h20 implements DialogInterface {
    public final zc g;

    public bd(ContextThemeWrapper contextThemeWrapper, int i) {
        super(contextThemeWrapper, f(contextThemeWrapper, i));
        this.g = new zc(getContext(), this, getWindow());
    }

    public static int f(Context context, int i) {
        if (((i >>> 24) & 255) >= 1) {
            return i;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(R.attr.alertDialogTheme, typedValue, true);
        return typedValue.resourceId;
    }

    @Override // defpackage.h20, defpackage.bz1, android.app.Dialog
    public final void onCreate(Bundle bundle) {
        int i;
        ListAdapter listAdapter;
        View viewFindViewById;
        super.onCreate(bundle);
        zc zcVar = this.g;
        zcVar.b.setContentView(zcVar.x);
        Context context = zcVar.a;
        Window window = zcVar.c;
        View viewFindViewById2 = window.findViewById(R.id.parentPanel);
        View viewFindViewById3 = viewFindViewById2.findViewById(R.id.topPanel);
        View viewFindViewById4 = viewFindViewById2.findViewById(R.id.contentPanel);
        View viewFindViewById5 = viewFindViewById2.findViewById(R.id.buttonPanel);
        ViewGroup viewGroup = (ViewGroup) viewFindViewById2.findViewById(R.id.customPanel);
        window.setFlags(131072, 131072);
        viewGroup.setVisibility(8);
        View viewFindViewById6 = viewGroup.findViewById(R.id.topPanel);
        View viewFindViewById7 = viewGroup.findViewById(R.id.contentPanel);
        View viewFindViewById8 = viewGroup.findViewById(R.id.buttonPanel);
        ViewGroup viewGroupA = zc.a(viewFindViewById6, viewFindViewById3);
        ViewGroup viewGroupA2 = zc.a(viewFindViewById7, viewFindViewById4);
        ViewGroup viewGroupA3 = zc.a(viewFindViewById8, viewFindViewById5);
        NestedScrollView nestedScrollView = (NestedScrollView) window.findViewById(R.id.scrollView);
        zcVar.p = nestedScrollView;
        nestedScrollView.setFocusable(false);
        zcVar.p.setNestedScrollingEnabled(false);
        TextView textView = (TextView) viewGroupA2.findViewById(android.R.id.message);
        zcVar.t = textView;
        if (textView != null) {
            CharSequence charSequence = zcVar.e;
            if (charSequence != null) {
                textView.setText(charSequence);
            } else {
                textView.setVisibility(8);
                zcVar.p.removeView(zcVar.t);
                if (zcVar.f != null) {
                    ViewGroup viewGroup2 = (ViewGroup) zcVar.p.getParent();
                    int iIndexOfChild = viewGroup2.indexOfChild(zcVar.p);
                    viewGroup2.removeViewAt(iIndexOfChild);
                    viewGroup2.addView(zcVar.f, iIndexOfChild, new ViewGroup.LayoutParams(-1, -1));
                } else {
                    viewGroupA2.setVisibility(8);
                }
            }
        }
        Button button = (Button) viewGroupA3.findViewById(android.R.id.button1);
        zcVar.g = button;
        u5 u5Var = zcVar.D;
        button.setOnClickListener(u5Var);
        boolean zIsEmpty = TextUtils.isEmpty(zcVar.h);
        Button button2 = zcVar.g;
        if (zIsEmpty) {
            button2.setVisibility(8);
            i = 0;
        } else {
            button2.setText(zcVar.h);
            zcVar.g.setVisibility(0);
            i = 1;
        }
        Button button3 = (Button) viewGroupA3.findViewById(android.R.id.button2);
        zcVar.j = button3;
        button3.setOnClickListener(u5Var);
        boolean zIsEmpty2 = TextUtils.isEmpty(zcVar.k);
        Button button4 = zcVar.j;
        if (zIsEmpty2) {
            button4.setVisibility(8);
        } else {
            button4.setText(zcVar.k);
            zcVar.j.setVisibility(0);
            i |= 2;
        }
        Button button5 = (Button) viewGroupA3.findViewById(android.R.id.button3);
        zcVar.m = button5;
        button5.setOnClickListener(u5Var);
        boolean zIsEmpty3 = TextUtils.isEmpty(zcVar.n);
        Button button6 = zcVar.m;
        if (zIsEmpty3) {
            button6.setVisibility(8);
        } else {
            button6.setText(zcVar.n);
            zcVar.m.setVisibility(0);
            i |= 4;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(R.attr.alertDialogCenterButtons, typedValue, true);
        if (typedValue.data != 0) {
            if (i == 1) {
                Button button7 = zcVar.g;
                LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) button7.getLayoutParams();
                layoutParams.gravity = 1;
                layoutParams.weight = 0.5f;
                button7.setLayoutParams(layoutParams);
            } else if (i == 2) {
                Button button8 = zcVar.j;
                LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) button8.getLayoutParams();
                layoutParams2.gravity = 1;
                layoutParams2.weight = 0.5f;
                button8.setLayoutParams(layoutParams2);
            } else if (i == 4) {
                Button button9 = zcVar.m;
                LinearLayout.LayoutParams layoutParams3 = (LinearLayout.LayoutParams) button9.getLayoutParams();
                layoutParams3.gravity = 1;
                layoutParams3.weight = 0.5f;
                button9.setLayoutParams(layoutParams3);
            }
        }
        if (i == 0) {
            viewGroupA3.setVisibility(8);
        }
        if (zcVar.u != null) {
            viewGroupA.addView(zcVar.u, 0, new ViewGroup.LayoutParams(-1, -2));
            window.findViewById(R.id.title_template).setVisibility(8);
        } else {
            zcVar.r = (ImageView) window.findViewById(android.R.id.icon);
            if (TextUtils.isEmpty(zcVar.d) || !zcVar.B) {
                window.findViewById(R.id.title_template).setVisibility(8);
                zcVar.r.setVisibility(8);
                viewGroupA.setVisibility(8);
            } else {
                TextView textView2 = (TextView) window.findViewById(R.id.alertTitle);
                zcVar.s = textView2;
                textView2.setText(zcVar.d);
                Drawable drawable = zcVar.q;
                if (drawable != null) {
                    zcVar.r.setImageDrawable(drawable);
                } else {
                    zcVar.s.setPadding(zcVar.r.getPaddingLeft(), zcVar.r.getPaddingTop(), zcVar.r.getPaddingRight(), zcVar.r.getPaddingBottom());
                    zcVar.r.setVisibility(8);
                }
            }
        }
        boolean z = viewGroup.getVisibility() != 8;
        int i2 = (viewGroupA == null || viewGroupA.getVisibility() == 8) ? 0 : 1;
        boolean z2 = viewGroupA3.getVisibility() != 8;
        if (!z2 && (viewFindViewById = viewGroupA2.findViewById(R.id.textSpacerNoButtons)) != null) {
            viewFindViewById.setVisibility(0);
        }
        if (i2 != 0) {
            NestedScrollView nestedScrollView2 = zcVar.p;
            if (nestedScrollView2 != null) {
                nestedScrollView2.setClipToPadding(true);
            }
            View viewFindViewById9 = (zcVar.e == null && zcVar.f == null) ? null : viewGroupA.findViewById(R.id.titleDividerNoCustom);
            if (viewFindViewById9 != null) {
                viewFindViewById9.setVisibility(0);
            }
        } else {
            View viewFindViewById10 = viewGroupA2.findViewById(R.id.textSpacerNoTitle);
            if (viewFindViewById10 != null) {
                viewFindViewById10.setVisibility(0);
            }
        }
        AlertController$RecycleListView alertController$RecycleListView = zcVar.f;
        if (alertController$RecycleListView != null) {
            alertController$RecycleListView.getClass();
            if (!z2 || i2 == 0) {
                alertController$RecycleListView.setPadding(alertController$RecycleListView.getPaddingLeft(), i2 != 0 ? alertController$RecycleListView.getPaddingTop() : alertController$RecycleListView.a, alertController$RecycleListView.getPaddingRight(), z2 ? alertController$RecycleListView.getPaddingBottom() : alertController$RecycleListView.b);
            }
        }
        if (!z) {
            View view = zcVar.f;
            if (view == null) {
                view = zcVar.p;
            }
            if (view != null) {
                int i3 = z2 ? 2 : 0;
                View viewFindViewById11 = window.findViewById(R.id.scrollIndicatorUp);
                View viewFindViewById12 = window.findViewById(R.id.scrollIndicatorDown);
                WeakHashMap weakHashMap = ute.a;
                view.setScrollIndicators(i2 | i3, 3);
                if (viewFindViewById11 != null) {
                    viewGroupA2.removeView(viewFindViewById11);
                }
                if (viewFindViewById12 != null) {
                    viewGroupA2.removeView(viewFindViewById12);
                }
            }
        }
        AlertController$RecycleListView alertController$RecycleListView2 = zcVar.f;
        if (alertController$RecycleListView2 == null || (listAdapter = zcVar.v) == null) {
            return;
        }
        alertController$RecycleListView2.setAdapter(listAdapter);
        int i4 = zcVar.w;
        if (i4 > -1) {
            alertController$RecycleListView2.setItemChecked(i4, true);
            alertController$RecycleListView2.setSelection(i4);
        }
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i, KeyEvent keyEvent) {
        NestedScrollView nestedScrollView = this.g.p;
        if (nestedScrollView == null || !nestedScrollView.executeKeyEvent(keyEvent)) {
            return super.onKeyDown(i, keyEvent);
        }
        return true;
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i, KeyEvent keyEvent) {
        NestedScrollView nestedScrollView = this.g.p;
        if (nestedScrollView == null || !nestedScrollView.executeKeyEvent(keyEvent)) {
            return super.onKeyUp(i, keyEvent);
        }
        return true;
    }

    @Override // defpackage.h20, android.app.Dialog
    public final void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        zc zcVar = this.g;
        zcVar.d = charSequence;
        TextView textView = zcVar.s;
        if (textView != null) {
            textView.setText(charSequence);
        }
    }
}
