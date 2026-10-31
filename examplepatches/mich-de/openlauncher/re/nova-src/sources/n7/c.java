package n7;

import android.os.Build;
import java.util.HashSet;

/* loaded from: classes.dex */
public abstract class c implements e {

    /* renamed from: c, reason: collision with root package name */
    public static final HashSet f77908c = new HashSet();

    /* renamed from: a, reason: collision with root package name */
    public final String f77909a;

    /* renamed from: b, reason: collision with root package name */
    public final String f77910b;

    public c(String str, String str2) {
        this.f77909a = str;
        this.f77910b = str2;
        f77908c.add(this);
    }

    public abstract boolean a();

    public boolean b() {
        HashSet hashSet = a.f77905a;
        String str = this.f77910b;
        if (hashSet.contains(str)) {
            return true;
        }
        String str2 = Build.TYPE;
        if (!"eng".equals(str2) && !"userdebug".equals(str2)) {
            return false;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(":dev");
        return hashSet.contains(sb2.toString());
    }
}
