package ww;

import android.app.Activity;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Filter;
import com.stripe.android.core.model.Country;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w extends Filter {

    /* renamed from: a, reason: collision with root package name */
    public final List f94856a;

    /* renamed from: b, reason: collision with root package name */
    public final g f94857b;

    /* renamed from: c, reason: collision with root package name */
    public final WeakReference f94858c;

    public w(List unfilteredCountries, g gVar, Activity activity) {
        Intrinsics.g(unfilteredCountries, "unfilteredCountries");
        this.f94856a = unfilteredCountries;
        this.f94857b = gVar;
        this.f94858c = new WeakReference(activity);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0064  */
    @Override // android.widget.Filter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Filter.FilterResults performFiltering(CharSequence charSequence) {
        Filter.FilterResults filterResults = new Filter.FilterResults();
        List list = this.f94856a;
        if (charSequence != null) {
            ArrayList arrayList = new ArrayList();
            for (Object obj : list) {
                String str = ((Country) obj).f42573b;
                Locale locale = Locale.ROOT;
                String lowerCase = str.toLowerCase(locale);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                String lowerCase2 = String.valueOf(charSequence).toLowerCase(locale);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
                if (r70.j.I0(lowerCase, lowerCase2, false)) {
                    arrayList.add(obj);
                }
            }
            if (!arrayList.isEmpty()) {
                int size = arrayList.size();
                List list2 = arrayList;
                if (size == 1) {
                    boolean zB = Intrinsics.b(((Country) arrayList.get(0)).f42573b, String.valueOf(charSequence));
                    list2 = arrayList;
                    if (zB) {
                        list2 = list;
                    }
                }
                if (list2 != null) {
                    list = list2;
                }
            }
        }
        filterResults.values = list;
        return filterResults;
    }

    @Override // android.widget.Filter
    public final void publishResults(CharSequence charSequence, Filter.FilterResults filterResults) {
        Object obj = filterResults != null ? filterResults.values : null;
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<com.stripe.android.core.model.Country>");
        List list = (List) obj;
        Activity activity = (Activity) this.f94858c.get();
        if (activity != null) {
            List list2 = list;
            if (!(list2 instanceof Collection) || !list2.isEmpty()) {
                Iterator it = list2.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    if (Intrinsics.b(((Country) it.next()).f42573b, charSequence)) {
                        Object systemService = activity.getSystemService("input_method");
                        InputMethodManager inputMethodManager = systemService instanceof InputMethodManager ? (InputMethodManager) systemService : null;
                        if (inputMethodManager != null && inputMethodManager.isAcceptingText()) {
                            View currentFocus = activity.getCurrentFocus();
                            inputMethodManager.hideSoftInputFromWindow(currentFocus != null ? currentFocus.getWindowToken() : null, 0);
                        }
                    }
                }
            }
        }
        g gVar = this.f94857b;
        gVar.f94778e = list;
        gVar.notifyDataSetChanged();
    }
}
