package mx;

import ai.r2;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class a0 extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final PackageManager f76996a;

    /* renamed from: b, reason: collision with root package name */
    public final LayoutInflater f76997b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f76998c;

    public a0(Activity activity) {
        this.f76996a = activity.getPackageManager();
        this.f76997b = (LayoutInflater) activity.getSystemService("layout_inflater");
        ArrayList arrayList = new ArrayList();
        HashMap map = new HashMap();
        for (gz.e eVar : gz.e.values()) {
            Intent intentA = eVar.a();
            if (intentA != null) {
                HashMap map2 = new HashMap();
                Iterator<ResolveInfo> it = this.f76996a.queryIntentActivities(intentA, 0).iterator();
                while (it.hasNext()) {
                    ResolveInfo next = it.next();
                    ActivityInfo activityInfo = next.activityInfo;
                    if (!activityInfo.exported || map.containsKey(activityInfo.packageName)) {
                        it.remove();
                    } else {
                        CharSequence charSequenceLoadLabel = next.loadLabel(this.f76996a);
                        z zVar = new z();
                        zVar.f77279a = next;
                        zVar.f77280b = next.activityInfo.packageName;
                        zVar.f77281c = charSequenceLoadLabel;
                        if (TextUtils.isEmpty(charSequenceLoadLabel)) {
                            zVar.f77281c = next.activityInfo.packageName;
                        }
                        zVar.f77283e = null;
                        zVar.f77284f = eVar;
                        arrayList.add(zVar);
                        map2.put(next.activityInfo.packageName, Boolean.TRUE);
                    }
                }
                map.putAll(map2);
            }
        }
        if (arrayList.size() > 1) {
            Collections.sort(arrayList, new r2(24));
            HashMap map3 = new HashMap();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                z zVar2 = (z) it2.next();
                String string = zVar2.f77281c.toString();
                if (map3.containsKey(string)) {
                    z zVar3 = (z) map3.get(string);
                    if (TextUtils.isEmpty(zVar3.f77283e)) {
                        zVar3.f77283e = zVar3.f77280b;
                    }
                    zVar2.f77283e = zVar2.f77280b;
                } else {
                    map3.put(string, zVar2);
                }
            }
        }
        this.f76998c = arrayList;
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList arrayList = this.f76998c;
        if (arrayList != null) {
            return arrayList.size();
        }
        return 0;
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return this.f76998c.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.f76997b.inflate(2131624340, viewGroup, false);
            view.setPadding(w20.e.k(24), view.getPaddingTop(), w20.e.k(24), view.getPaddingBottom());
        }
        z zVar = (z) this.f76998c.get(i5);
        TextView textView = (TextView) view.findViewById(2131428412);
        TextView textView2 = (TextView) view.findViewById(2131428230);
        ImageView imageView = (ImageView) view.findViewById(2131428202);
        textView.setText(zVar.f77281c);
        if (zVar.f77283e != null) {
            textView2.setVisibility(0);
            textView2.setText(zVar.f77283e);
        } else {
            textView2.setVisibility(8);
        }
        if (zVar.f77282d == null) {
            zVar.f77282d = zVar.f77279a.loadIcon(this.f76996a);
        }
        imageView.setImageDrawable(zVar.f77282d);
        return view;
    }
}
