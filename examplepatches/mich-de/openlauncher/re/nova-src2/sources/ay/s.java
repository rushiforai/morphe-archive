package ay;

import android.content.Context;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class s extends BaseAdapter {

    /* renamed from: h, reason: collision with root package name */
    public static final o f15767h = new o(0);

    /* renamed from: i, reason: collision with root package name */
    public static final o f15768i = new o(1);

    /* renamed from: a, reason: collision with root package name */
    public final Context f15769a;

    /* renamed from: b, reason: collision with root package name */
    public final w20.l f15770b;

    /* renamed from: c, reason: collision with root package name */
    public final LayoutInflater f15771c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f15772d;

    /* renamed from: e, reason: collision with root package name */
    public ArrayList f15773e;

    /* renamed from: f, reason: collision with root package name */
    public final wa0.b f15774f = new wa0.b();

    /* renamed from: g, reason: collision with root package name */
    public int f15775g = -1;

    public s(Context context, w20.l lVar) {
        this.f15769a = context;
        this.f15770b = lVar;
        this.f15771c = LayoutInflater.from(context);
        a();
    }

    public final void a() {
        Context context = this.f15769a;
        this.f15772d = i.b(context, false);
        this.f15773e = new ArrayList(this.f15772d.size() * 10);
        Iterator it = this.f15772d.iterator();
        while (it.hasNext()) {
            a aVar = (a) it.next();
            this.f15773e.add(aVar);
            if (!aVar.b(this.f15773e)) {
                if (!(aVar instanceof h) || this.f15770b.a(context)) {
                    this.f15773e.add(f15767h);
                } else {
                    this.f15773e.add(f15768i);
                }
            }
        }
        notifyDataSetChanged();
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public final boolean areAllItemsEnabled() {
        return false;
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return this.f15773e.size();
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return (p) this.f15773e.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final int getItemViewType(int i5) {
        p pVar = (p) this.f15773e.get(i5);
        if (pVar instanceof a) {
            return 0;
        }
        return pVar == f15768i ? 1 : 2;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        Context context = viewGroup.getContext();
        p pVar = (p) this.f15773e.get(i5);
        boolean z11 = pVar instanceof a;
        LayoutInflater layoutInflater = this.f15771c;
        if (z11) {
            if (view == null) {
                view = layoutInflater.inflate(2131624194, viewGroup, false);
                int iK = w20.e.k(24);
                view.setPadding(iK, 0, iK, 0);
                view.findViewById(2131428817).setVisibility(4);
                view.setTag(view.findViewById(2131428412));
                ((TextView) view.getTag()).setTextColor(view.getContext().getResources().getColor(2131099813));
            }
            if (((l30.h) viewGroup).f74640a) {
                if (this.f15775g == -1) {
                    TypedValue typedValue = new TypedValue();
                    if (!context.getTheme().resolveAttribute(16842829, typedValue, true)) {
                        throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
                    }
                    this.f15775g = x7.f.O(typedValue.getDimension(context.getResources().getDisplayMetrics()));
                }
                view.setMinimumHeight(this.f15775g);
            } else {
                view.setMinimumHeight(0);
            }
            TextView textView = (TextView) view.getTag();
            int iK2 = w20.e.k(8);
            textView.setCompoundDrawablePadding(w20.e.k(16));
            textView.setPadding(0, iK2, 0, iK2);
            a aVar = (a) pVar;
            textView.setText(aVar.f15736b);
            textView.setCompoundDrawablesRelativeWithIntrinsicBounds(aVar.f15735a, 0, 0, 0);
            return view;
        }
        if (view == null) {
            view = layoutInflater.inflate(2131624057, viewGroup, false);
        }
        FancyPrefView fancyPrefView = (FancyPrefView) view.findViewById(2131428042);
        View viewFindViewById = view.findViewById(2131428347);
        String strC = null;
        if (pVar == f15768i) {
            fancyPrefView.D(fancyPrefView.getContext().getString(2132019102));
            fancyPrefView.setOnClickListener(new k(this, 0));
            viewFindViewById.setOnClickListener(null);
            viewFindViewById.setVisibility(8);
            return view;
        }
        if (pVar == f15767h) {
            fancyPrefView.D(fancyPrefView.getContext().getString(2132018728));
            viewFindViewById.setOnClickListener(null);
            viewFindViewById.setVisibility(8);
            return view;
        }
        fancyPrefView.D(pVar.a(context));
        boolean z12 = pVar instanceof r;
        if (z12) {
            long jD = ((r) pVar).d();
            if (jD != 0) {
                strC = this.f15774f.c(new Date(jD));
            }
        }
        fancyPrefView.C(strC);
        if (z12) {
            r rVar = (r) pVar;
            if (rVar instanceof q) {
                viewFindViewById.setVisibility(0);
                viewFindViewById.setOnClickListener(new n(this, context, rVar));
                return view;
            }
        }
        viewFindViewById.setVisibility(8);
        return view;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final int getViewTypeCount() {
        return 3;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public final boolean isEnabled(int i5) {
        return !(((p) this.f15773e.get(i5)) instanceof a);
    }
}
