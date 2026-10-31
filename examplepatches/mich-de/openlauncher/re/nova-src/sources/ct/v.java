package ct;

import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import java.text.Collator;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import z.c1;

/* loaded from: classes4.dex */
public final class v implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47895a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f47896b;

    /* renamed from: c, reason: collision with root package name */
    public Object f47897c;

    public /* synthetic */ v(Comparator comparator, Object obj, int i5) {
        this.f47895a = i5;
        this.f47896b = comparator;
        this.f47897c = obj;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        Integer num;
        Integer num2;
        CharSequence charSequence;
        CharSequence charSequence2;
        switch (this.f47895a) {
            case 0:
                com.google.firebase.crashlytics.internal.persistence.c cVar = (com.google.firebase.crashlytics.internal.persistence.c) this.f47896b;
                LinkedHashMap linkedHashMap = (LinkedHashMap) this.f47897c;
                return cVar.compare((Integer) linkedHashMap.get((w) obj), (Integer) linkedHashMap.get((w) obj2));
            case 1:
                ga.a aVar = (ga.a) obj;
                ga.a aVar2 = (ga.a) obj2;
                String string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                String string2 = (aVar == null || (charSequence2 = aVar.f57300l) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : charSequence2.toString();
                if (aVar2 != null && (charSequence = aVar2.f57300l) != null) {
                    string = charSequence.toString();
                }
                c1 c1Var = (c1) this.f47897c;
                int iIntValue = 0;
                int iIntValue2 = (c1Var == null || (num2 = (Integer) c1Var.get(aVar)) == null) ? 0 : num2.intValue();
                c1 c1Var2 = (c1) this.f47897c;
                if (c1Var2 != null && (num = (Integer) c1Var2.get(aVar2)) != null) {
                    iIntValue = num.intValue();
                }
                if (iIntValue2 > iIntValue) {
                    return -1;
                }
                if (iIntValue > iIntValue2) {
                    return 1;
                }
                return ((Collator) this.f47896b).compare(string2, string);
            case 2:
                int iCompare = ((Comparator) this.f47896b).compare(obj, obj2);
                return iCompare != 0 ? iCompare : ((Comparator) this.f47897c).compare(((j3.q) obj).f68822c, ((j3.q) obj2).f68822c);
            case 3:
                Collator collator = (Collator) this.f47896b;
                PackageManager packageManager = (PackageManager) this.f47897c;
                return collator.compare(((ResolveInfo) obj).loadLabel(packageManager), ((ResolveInfo) obj2).loadLabel(packageManager));
            default:
                ResolveInfo resolveInfo = (ResolveInfo) obj;
                ResolveInfo resolveInfo2 = (ResolveInfo) obj2;
                u20.j jVar = (u20.j) this.f47897c;
                HashMap map = (HashMap) this.f47896b;
                String string3 = (String) map.get(resolveInfo);
                if (string3 == null) {
                    string3 = resolveInfo.loadLabel(jVar.f90471b).toString();
                    map.put(resolveInfo, string3);
                }
                String string4 = (String) map.get(resolveInfo2);
                if (string4 == null) {
                    string4 = resolveInfo2.loadLabel(jVar.f90471b).toString();
                    map.put(resolveInfo2, string4);
                }
                return string3.compareTo(string4);
        }
    }

    public v() {
        this.f47895a = 1;
        this.f47896b = Collator.getInstance();
    }

    public v(u20.j jVar, HashMap map) {
        this.f47895a = 4;
        this.f47897c = jVar;
        this.f47896b = map;
    }

    public v(PackageManager packageManager) {
        this.f47895a = 3;
        this.f47897c = packageManager;
        this.f47896b = Collator.getInstance();
    }
}
