package m;

import a5.a1;
import a5.t0;
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
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.appcompat.app.AlertController$RecycleListView;
import androidx.core.widget.NestedScrollView;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.WeakHashMap;
import r.j1;

/* loaded from: classes2.dex */
public final class k extends h0 implements DialogInterface {

    /* renamed from: f, reason: collision with root package name */
    public final i f75307f;

    public k(ContextThemeWrapper contextThemeWrapper, int i5) {
        super(contextThemeWrapper, f(contextThemeWrapper, i5));
        this.f75307f = new i(getContext(), this, getWindow());
    }

    public static int f(Context context, int i5) {
        if (((i5 >>> 24) & 255) >= 1) {
            return i5;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(2130968653, typedValue, true);
        return typedValue.resourceId;
    }

    @Override // m.h0, g.q, android.app.Dialog
    public final void onCreate(Bundle bundle) {
        int i5;
        ListAdapter listAdapter;
        View viewFindViewById;
        super.onCreate(bundle);
        i iVar = this.f75307f;
        iVar.f75270b.setContentView(iVar.f75292z);
        Context context = iVar.f75269a;
        Window window = iVar.f75271c;
        View viewFindViewById2 = window.findViewById(2131428522);
        View viewFindViewById3 = viewFindViewById2.findViewById(2131429066);
        View viewFindViewById4 = viewFindViewById2.findViewById(2131427752);
        View viewFindViewById5 = viewFindViewById2.findViewById(2131427613);
        ViewGroup viewGroup = (ViewGroup) viewFindViewById2.findViewById(2131427801);
        View view = iVar.f75275g;
        if (view == null) {
            view = null;
        }
        boolean z11 = view != null;
        if (!z11 || !i.a(view)) {
            window.setFlags(SQLiteDatabase.OPEN_SHAREDCACHE, SQLiteDatabase.OPEN_SHAREDCACHE);
        }
        if (z11) {
            FrameLayout frameLayout = (FrameLayout) window.findViewById(2131427798);
            frameLayout.addView(view, new ViewGroup.LayoutParams(-1, -1));
            if (iVar.f75276h) {
                frameLayout.setPadding(0, 0, 0, 0);
            }
            if (iVar.f75274f != null) {
                ((LinearLayout.LayoutParams) ((j1) viewGroup.getLayoutParams())).weight = 0.0f;
            }
        } else {
            viewGroup.setVisibility(8);
        }
        View viewFindViewById6 = viewGroup.findViewById(2131429066);
        View viewFindViewById7 = viewGroup.findViewById(2131427752);
        View viewFindViewById8 = viewGroup.findViewById(2131427613);
        ViewGroup viewGroupB = i.b(viewFindViewById6, viewFindViewById3);
        ViewGroup viewGroupB2 = i.b(viewFindViewById7, viewFindViewById4);
        ViewGroup viewGroupB3 = i.b(viewFindViewById8, viewFindViewById5);
        NestedScrollView nestedScrollView = (NestedScrollView) window.findViewById(2131428739);
        iVar.f75284r = nestedScrollView;
        nestedScrollView.setFocusable(false);
        iVar.f75284r.setNestedScrollingEnabled(false);
        TextView textView = (TextView) viewGroupB2.findViewById(16908299);
        iVar.f75288v = textView;
        if (textView != null) {
            CharSequence charSequence = iVar.f75273e;
            if (charSequence != null) {
                textView.setText(charSequence);
            } else {
                textView.setVisibility(8);
                iVar.f75284r.removeView(iVar.f75288v);
                if (iVar.f75274f != null) {
                    ViewGroup viewGroup2 = (ViewGroup) iVar.f75284r.getParent();
                    int iIndexOfChild = viewGroup2.indexOfChild(iVar.f75284r);
                    viewGroup2.removeViewAt(iIndexOfChild);
                    viewGroup2.addView(iVar.f75274f, iIndexOfChild, new ViewGroup.LayoutParams(-1, -1));
                } else {
                    viewGroupB2.setVisibility(8);
                }
            }
        }
        Button button = (Button) viewGroupB3.findViewById(16908313);
        iVar.f75277i = button;
        com.google.android.material.datepicker.n nVar = iVar.G;
        button.setOnClickListener(nVar);
        if (TextUtils.isEmpty(iVar.f75278j)) {
            iVar.f75277i.setVisibility(8);
            i5 = 0;
        } else {
            iVar.f75277i.setText(iVar.f75278j);
            iVar.f75277i.setVisibility(0);
            i5 = 1;
        }
        Button button2 = (Button) viewGroupB3.findViewById(16908314);
        iVar.f75280l = button2;
        button2.setOnClickListener(nVar);
        if (TextUtils.isEmpty(iVar.f75281m)) {
            iVar.f75280l.setVisibility(8);
        } else {
            iVar.f75280l.setText(iVar.f75281m);
            iVar.f75280l.setVisibility(0);
            i5 |= 2;
        }
        Button button3 = (Button) viewGroupB3.findViewById(16908315);
        iVar.o = button3;
        button3.setOnClickListener(nVar);
        if (TextUtils.isEmpty(iVar.f75282p)) {
            iVar.o.setVisibility(8);
        } else {
            iVar.o.setText(iVar.f75282p);
            iVar.o.setVisibility(0);
            i5 |= 4;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(2130968651, typedValue, true);
        if (typedValue.data != 0) {
            if (i5 == 1) {
                Button button4 = iVar.f75277i;
                LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) button4.getLayoutParams();
                layoutParams.gravity = 1;
                layoutParams.weight = 0.5f;
                button4.setLayoutParams(layoutParams);
            } else if (i5 == 2) {
                Button button5 = iVar.f75280l;
                LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) button5.getLayoutParams();
                layoutParams2.gravity = 1;
                layoutParams2.weight = 0.5f;
                button5.setLayoutParams(layoutParams2);
            } else if (i5 == 4) {
                Button button6 = iVar.o;
                LinearLayout.LayoutParams layoutParams3 = (LinearLayout.LayoutParams) button6.getLayoutParams();
                layoutParams3.gravity = 1;
                layoutParams3.weight = 0.5f;
                button6.setLayoutParams(layoutParams3);
            }
        }
        if (i5 == 0) {
            viewGroupB3.setVisibility(8);
        }
        if (iVar.f75289w != null) {
            viewGroupB.addView(iVar.f75289w, 0, new ViewGroup.LayoutParams(-1, -2));
            window.findViewById(2131429036).setVisibility(8);
        } else {
            iVar.f75286t = (ImageView) window.findViewById(16908294);
            if (TextUtils.isEmpty(iVar.f75272d) || !iVar.E) {
                window.findViewById(2131429036).setVisibility(8);
                iVar.f75286t.setVisibility(8);
                viewGroupB.setVisibility(8);
            } else {
                TextView textView2 = (TextView) window.findViewById(2131427470);
                iVar.f75287u = textView2;
                textView2.setText(iVar.f75272d);
                Drawable drawable = iVar.f75285s;
                if (drawable != null) {
                    iVar.f75286t.setImageDrawable(drawable);
                } else {
                    iVar.f75287u.setPadding(iVar.f75286t.getPaddingLeft(), iVar.f75286t.getPaddingTop(), iVar.f75286t.getPaddingRight(), iVar.f75286t.getPaddingBottom());
                    iVar.f75286t.setVisibility(8);
                }
            }
        }
        boolean z12 = viewGroup.getVisibility() != 8;
        int i11 = (viewGroupB == null || viewGroupB.getVisibility() == 8) ? 0 : 1;
        boolean z13 = viewGroupB3.getVisibility() != 8;
        if (!z13 && (viewFindViewById = viewGroupB2.findViewById(2131429002)) != null) {
            viewFindViewById.setVisibility(0);
        }
        if (i11 != 0) {
            NestedScrollView nestedScrollView2 = iVar.f75284r;
            if (nestedScrollView2 != null) {
                nestedScrollView2.setClipToPadding(true);
            }
            View viewFindViewById9 = (iVar.f75273e == null && iVar.f75274f == null) ? null : viewGroupB.findViewById(2131429032);
            if (viewFindViewById9 != null) {
                viewFindViewById9.setVisibility(0);
            }
        } else {
            View viewFindViewById10 = viewGroupB2.findViewById(2131429003);
            if (viewFindViewById10 != null) {
                viewFindViewById10.setVisibility(0);
            }
        }
        AlertController$RecycleListView alertController$RecycleListView = iVar.f75274f;
        if (alertController$RecycleListView != null && (!z13 || i11 == 0)) {
            alertController$RecycleListView.setPadding(alertController$RecycleListView.getPaddingLeft(), i11 != 0 ? alertController$RecycleListView.getPaddingTop() : alertController$RecycleListView.f13603a, alertController$RecycleListView.getPaddingRight(), z13 ? alertController$RecycleListView.getPaddingBottom() : alertController$RecycleListView.f13604b);
        }
        if (!z12) {
            View view2 = iVar.f75274f;
            if (view2 == null) {
                view2 = iVar.f75284r;
            }
            if (view2 != null) {
                int i12 = z13 ? 2 : 0;
                View viewFindViewById11 = window.findViewById(2131428738);
                View viewFindViewById12 = window.findViewById(2131428737);
                WeakHashMap weakHashMap = a1.f250a;
                t0.b(view2, i11 | i12, 3);
                if (viewFindViewById11 != null) {
                    viewGroupB2.removeView(viewFindViewById11);
                }
                if (viewFindViewById12 != null) {
                    viewGroupB2.removeView(viewFindViewById12);
                }
            }
        }
        AlertController$RecycleListView alertController$RecycleListView2 = iVar.f75274f;
        if (alertController$RecycleListView2 == null || (listAdapter = iVar.f75290x) == null) {
            return;
        }
        alertController$RecycleListView2.setAdapter(listAdapter);
        int i13 = iVar.f75291y;
        if (i13 > -1) {
            alertController$RecycleListView2.setItemChecked(i13, true);
            alertController$RecycleListView2.setSelection(i13);
        }
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i5, KeyEvent keyEvent) {
        NestedScrollView nestedScrollView = this.f75307f.f75284r;
        if (nestedScrollView == null || !nestedScrollView.j(keyEvent)) {
            return super.onKeyDown(i5, keyEvent);
        }
        return true;
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i5, KeyEvent keyEvent) {
        NestedScrollView nestedScrollView = this.f75307f.f75284r;
        if (nestedScrollView == null || !nestedScrollView.j(keyEvent)) {
            return super.onKeyUp(i5, keyEvent);
        }
        return true;
    }

    @Override // m.h0, android.app.Dialog
    public final void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        i iVar = this.f75307f;
        iVar.f75272d = charSequence;
        TextView textView = iVar.f75287u;
        if (textView != null) {
            textView.setText(charSequence);
        }
    }
}
