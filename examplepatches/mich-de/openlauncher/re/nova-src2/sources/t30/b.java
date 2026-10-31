package t30;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes4.dex */
public final class b extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final PackageManager f88519a;

    /* renamed from: b, reason: collision with root package name */
    public final Intent f88520b;

    /* renamed from: c, reason: collision with root package name */
    public final LayoutInflater f88521c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f88522d;

    public b(ContextThemeWrapper contextThemeWrapper, Intent intent, br.a aVar) {
        int size;
        PackageManager packageManager = contextThemeWrapper.getPackageManager();
        this.f88519a = packageManager;
        Intent intent2 = new Intent(intent);
        this.f88520b = intent2;
        intent2.setComponent(null);
        this.f88521c = (LayoutInflater) contextThemeWrapper.getSystemService("layout_inflater");
        List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, 0);
        if (listQueryIntentActivities != null) {
            Iterator<ResolveInfo> it = listQueryIntentActivities.iterator();
            while (it.hasNext()) {
                ActivityInfo activityInfo = it.next().activityInfo;
                if (!activityInfo.exported || "com.teslacoilsw.launcher".equals(activityInfo.packageName)) {
                    it.remove();
                }
            }
        }
        if (listQueryIntentActivities == null || (size = listQueryIntentActivities.size()) <= 0) {
            return;
        }
        ResolveInfo resolveInfo = listQueryIntentActivities.get(0);
        for (int i5 = 1; i5 < size; i5++) {
            ResolveInfo resolveInfo2 = listQueryIntentActivities.get(i5);
            if (resolveInfo.priority != resolveInfo2.priority || resolveInfo.isDefault != resolveInfo2.isDefault) {
                while (i5 < size) {
                    listQueryIntentActivities.remove(i5);
                    size--;
                }
            }
        }
        if (size > 1) {
            Collections.sort(listQueryIntentActivities, new ResolveInfo.DisplayNameComparator(this.f88519a));
        }
        this.f88522d = new ArrayList();
        ResolveInfo resolveInfo3 = listQueryIntentActivities.get(0);
        int i11 = 0;
        ResolveInfo resolveInfo4 = resolveInfo3;
        CharSequence charSequenceLoadLabel = resolveInfo3.loadLabel(this.f88519a);
        for (int i12 = 1; i12 < size; i12++) {
            charSequenceLoadLabel = charSequenceLoadLabel == null ? resolveInfo4.activityInfo.packageName : charSequenceLoadLabel;
            ResolveInfo resolveInfo5 = listQueryIntentActivities.get(i12);
            CharSequence charSequenceLoadLabel2 = resolveInfo5.loadLabel(this.f88519a);
            CharSequence charSequence = charSequenceLoadLabel2 == null ? resolveInfo5.activityInfo.packageName : charSequenceLoadLabel2;
            if (!charSequence.equals(charSequenceLoadLabel)) {
                b(listQueryIntentActivities, i11, i12 - 1, resolveInfo4, charSequenceLoadLabel);
                i11 = i12;
                resolveInfo4 = resolveInfo5;
                charSequenceLoadLabel = charSequence;
            }
        }
        b(listQueryIntentActivities, i11, size - 1, resolveInfo4, charSequenceLoadLabel);
    }

    public final Intent a(int i5) {
        ArrayList arrayList = this.f88522d;
        if (arrayList == null) {
            return null;
        }
        a aVar = (a) arrayList.get(i5);
        Intent intent = aVar.f88518e;
        if (intent == null) {
            intent = this.f88520b;
        }
        Intent intent2 = new Intent(intent);
        ActivityInfo activityInfo = aVar.f88514a.activityInfo;
        intent2.setComponent(new ComponentName(activityInfo.applicationInfo.packageName, activityInfo.name));
        return intent2;
    }

    public final void b(List list, int i5, int i11, ResolveInfo resolveInfo, CharSequence charSequence) {
        boolean z11 = true;
        int i12 = (i11 - i5) + 1;
        ArrayList arrayList = this.f88522d;
        if (i12 == 1) {
            arrayList.add(new a(resolveInfo, charSequence, null, null));
            return;
        }
        ApplicationInfo applicationInfo = resolveInfo.activityInfo.applicationInfo;
        PackageManager packageManager = this.f88519a;
        CharSequence charSequenceLoadLabel = applicationInfo.loadLabel(packageManager);
        boolean z12 = charSequenceLoadLabel == null;
        if (!z12) {
            HashSet hashSet = new HashSet();
            hashSet.add(charSequenceLoadLabel);
            int i13 = i5 + 1;
            while (true) {
                if (i13 > i11) {
                    z11 = z12;
                    break;
                }
                CharSequence charSequenceLoadLabel2 = ((ResolveInfo) list.get(i13)).activityInfo.applicationInfo.loadLabel(packageManager);
                if (charSequenceLoadLabel2 == null || hashSet.contains(charSequenceLoadLabel2)) {
                    break;
                }
                hashSet.add(charSequenceLoadLabel2);
                i13++;
            }
            hashSet.clear();
            z12 = z11;
        }
        while (i5 <= i11) {
            ResolveInfo resolveInfo2 = (ResolveInfo) list.get(i5);
            if (z12) {
                arrayList.add(new a(resolveInfo2, charSequence, resolveInfo2.activityInfo.packageName, null));
            } else {
                arrayList.add(new a(resolveInfo2, charSequence, resolveInfo2.activityInfo.applicationInfo.loadLabel(packageManager), null));
            }
            i5++;
        }
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList arrayList = this.f88522d;
        if (arrayList != null) {
            return arrayList.size();
        }
        return 0;
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return this.f88522d.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.f88521c.inflate(2131624340, viewGroup, false);
        }
        a aVar = (a) this.f88522d.get(i5);
        TextView textView = (TextView) view.findViewById(2131428412);
        TextView textView2 = (TextView) view.findViewById(2131428230);
        ImageView imageView = (ImageView) view.findViewById(2131428202);
        textView.setText(aVar.f88515b);
        CharSequence charSequence = aVar.f88517d;
        if (charSequence != null) {
            textView2.setVisibility(0);
            textView2.setText(charSequence);
        } else {
            textView2.setVisibility(8);
        }
        if (aVar.f88516c == null) {
            aVar.f88516c = aVar.f88514a.loadIcon(this.f88519a);
        }
        imageView.setImageDrawable(aVar.f88516c);
        return view;
    }
}
