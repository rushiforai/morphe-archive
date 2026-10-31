package androidx.fragment.app;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class ListFragment extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f14479a = new Handler();

    /* renamed from: b, reason: collision with root package name */
    public final r f14480b = new r(this, 2);

    /* renamed from: c, reason: collision with root package name */
    public final z1 f14481c = new z1(this);

    /* renamed from: d, reason: collision with root package name */
    public ListView f14482d;

    /* renamed from: e, reason: collision with root package name */
    public View f14483e;

    /* renamed from: f, reason: collision with root package name */
    public View f14484f;

    /* renamed from: g, reason: collision with root package name */
    public View f14485g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f14486h;

    public final void n() {
        if (this.f14482d != null) {
            return;
        }
        View view = getView();
        if (view == null) {
            throw new IllegalStateException("Content view not yet created");
        }
        if (view instanceof ListView) {
            this.f14482d = (ListView) view;
        } else {
            TextView textView = (TextView) view.findViewById(16711681);
            if (textView == null) {
                this.f14483e = view.findViewById(16908292);
            } else {
                textView.setVisibility(8);
            }
            this.f14484f = view.findViewById(16711682);
            this.f14485g = view.findViewById(16711683);
            View viewFindViewById = view.findViewById(16908298);
            if (!(viewFindViewById instanceof ListView)) {
                if (viewFindViewById != null) {
                    throw new RuntimeException("Content has view with id attribute 'android.R.id.list' that is not a ListView class");
                }
                throw new RuntimeException("Your content must have a ListView whose id attribute is 'android.R.id.list'");
            }
            ListView listView = (ListView) viewFindViewById;
            this.f14482d = listView;
            View view2 = this.f14483e;
            if (view2 != null) {
                listView.setEmptyView(view2);
            }
        }
        this.f14486h = true;
        this.f14482d.setOnItemClickListener(this.f14481c);
        if (this.f14484f != null) {
            n();
            View view3 = this.f14484f;
            if (view3 == null) {
                throw new IllegalStateException("Can't be used with a custom content view");
            }
            if (this.f14486h) {
                this.f14486h = false;
                view3.clearAnimation();
                this.f14485g.clearAnimation();
                this.f14484f.setVisibility(0);
                this.f14485g.setVisibility(8);
            }
        }
        this.f14479a.post(this.f14480b);
    }

    @Override // androidx.fragment.app.h0
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Context contextRequireContext = requireContext();
        FrameLayout frameLayout = new FrameLayout(contextRequireContext);
        LinearLayout linearLayout = new LinearLayout(contextRequireContext);
        linearLayout.setId(16711682);
        linearLayout.setOrientation(1);
        linearLayout.setVisibility(8);
        linearLayout.setGravity(17);
        linearLayout.addView(new ProgressBar(contextRequireContext, null, 16842874), new FrameLayout.LayoutParams(-2, -2));
        frameLayout.addView(linearLayout, new FrameLayout.LayoutParams(-1, -1));
        FrameLayout frameLayout2 = new FrameLayout(contextRequireContext);
        frameLayout2.setId(16711683);
        TextView textView = new TextView(contextRequireContext);
        textView.setId(16711681);
        textView.setGravity(17);
        frameLayout2.addView(textView, new FrameLayout.LayoutParams(-1, -1));
        ListView listView = new ListView(contextRequireContext);
        listView.setId(16908298);
        listView.setDrawSelectorOnTop(false);
        frameLayout2.addView(listView, new FrameLayout.LayoutParams(-1, -1));
        frameLayout.addView(frameLayout2, new FrameLayout.LayoutParams(-1, -1));
        frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        return frameLayout;
    }

    @Override // androidx.fragment.app.h0
    public final void onDestroyView() {
        this.f14479a.removeCallbacks(this.f14480b);
        this.f14482d = null;
        this.f14486h = false;
        this.f14485g = null;
        this.f14484f = null;
        this.f14483e = null;
        super.onDestroyView();
    }

    @Override // androidx.fragment.app.h0
    public final void onViewCreated(View view, Bundle bundle) {
        n();
    }
}
