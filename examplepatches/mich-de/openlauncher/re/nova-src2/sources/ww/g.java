package ww;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.ImageView;
import android.widget.TextView;
import com.stripe.android.core.model.Country;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g extends ArrayAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94774a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final List f94775b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f94776c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f94777d;

    /* renamed from: e, reason: collision with root package name */
    public Object f94778e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(Context context, List unfilteredCountries, int i5, pu.f0 f0Var) {
        super(context, i5);
        Intrinsics.g(unfilteredCountries, "unfilteredCountries");
        this.f94775b = unfilteredCountries;
        this.f94776c = f0Var;
        this.f94777d = new w(unfilteredCountries, this, context instanceof Activity ? (Activity) context : null);
        this.f94778e = unfilteredCountries;
    }

    public Country a(int i5) {
        return (Country) ((List) this.f94778e).get(i5);
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean areAllItemsEnabled() {
        switch (this.f94774a) {
            case 0:
                return false;
            default:
                return super.areAllItemsEnabled();
        }
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final int getCount() {
        switch (this.f94774a) {
            case 0:
                List list = this.f94775b;
                if (list.isEmpty()) {
                    return 0;
                }
                return list.size() + 1;
            default:
                return ((List) this.f94778e).size();
        }
    }

    @Override // android.widget.ArrayAdapter, android.widget.Filterable
    public Filter getFilter() {
        switch (this.f94774a) {
            case 1:
                return (w) this.f94777d;
            default:
                return super.getFilter();
        }
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final Object getItem(int i5) {
        switch (this.f94774a) {
            case 0:
                if (i5 == 0) {
                    return null;
                }
                return (ft.b) super.getItem(i5 - 1);
            default:
                return a(i5);
        }
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public long getItemId(int i5) {
        switch (this.f94774a) {
            case 1:
                return a(i5).hashCode();
            default:
                return super.getItemId(i5);
        }
    }

    @Override // android.widget.ArrayAdapter
    public int getPosition(Object obj) {
        switch (this.f94774a) {
            case 1:
                return b70.g.b1((List) this.f94778e, (Country) obj);
            default:
                return super.getPosition(obj);
        }
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup parent) {
        switch (this.f94774a) {
            case 0:
                LayoutInflater layoutInflater = (LayoutInflater) this.f94777d;
                Intrinsics.g(parent, "parent");
                View viewInflate = i5 == 0 ? layoutInflater.inflate(2131624426, parent, false) : layoutInflater.inflate(2131624397, parent, false);
                if (i5 > 0) {
                    Intrinsics.d(viewInflate);
                    s0 s0Var = (s0) this.f94778e;
                    ft.b bVar = (ft.b) b70.g.Z0(i5 - 1, this.f94775b);
                    if (bVar != null) {
                        boolean z11 = bVar == ((ft.b) this.f94776c);
                        ImageView imageView = (ImageView) viewInflate.findViewById(2131427587);
                        if (imageView != null) {
                            imageView.setImageResource(bVar.f55899c);
                        }
                        ImageView imageView2 = (ImageView) viewInflate.findViewById(2131427586);
                        if (z11) {
                            imageView2.setVisibility(0);
                            imageView2.setColorFilter(s0Var.f94842f);
                        } else {
                            imageView2.setVisibility(8);
                        }
                        TextView textView = (TextView) viewInflate.findViewById(2131427589);
                        if (textView != null) {
                            textView.setText(bVar.f55898b);
                            if (z11) {
                                textView.setTextColor(s0Var.f94842f);
                                textView.setTypeface(Typeface.DEFAULT_BOLD);
                            } else {
                                textView.setTypeface(Typeface.DEFAULT);
                            }
                        }
                    }
                }
                Intrinsics.d(viewInflate);
                return viewInflate;
            default:
                Intrinsics.g(parent, "viewGroup");
                TextView textView2 = view instanceof TextView ? (TextView) view : (TextView) ((pu.f0) this.f94776c).invoke(parent);
                textView2.setText(a(i5).f42573b);
                return textView2;
        }
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int i5) {
        switch (this.f94774a) {
            case 0:
                return i5 != 0;
            default:
                return super.isEnabled(i5);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(Context context, List brands, ft.b bVar) {
        super(context, 0, brands);
        Intrinsics.g(brands, "brands");
        this.f94775b = brands;
        this.f94776c = bVar;
        this.f94777d = LayoutInflater.from(context);
        this.f94778e = new s0(context);
    }
}
