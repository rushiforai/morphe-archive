package o9;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public abstract class v1 {

    /* renamed from: a, reason: collision with root package name */
    public static final List f80192a;

    /* renamed from: b, reason: collision with root package name */
    public static final List f80193b;

    /* renamed from: c, reason: collision with root package name */
    public static final List f80194c;

    static {
        List listUnmodifiableList = Collections.unmodifiableList(Arrays.asList("nova.db", "launcher_6_by_5.db", "launcher_4_by_5.db", "launcher_4_by_4.db", "launcher_3_by_3.db", "launcher_2_by_2.db"));
        f80192a = listUnmodifiableList;
        List listUnmodifiableList2 = Collections.unmodifiableList(Arrays.asList("backup.db", "com.android.launcher3.prefs.xml", "widgetpreviews.db", "com.android.launcher3.managedusers.prefs.xml", "com.android.launcher3.device.prefs.xml", "app_icons.db"));
        f80193b = listUnmodifiableList2;
        u1 u1Var = new u1();
        u1Var.addAll(listUnmodifiableList);
        u1Var.addAll(listUnmodifiableList2);
        f80194c = Collections.unmodifiableList(u1Var);
    }
}
