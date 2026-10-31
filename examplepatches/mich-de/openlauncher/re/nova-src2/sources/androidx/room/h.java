package androidx.room;

import android.content.Context;
import android.content.pm.LauncherApps;
import android.os.UserHandle;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import n0.b0;
import n0.c1;
import z2.v1;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public boolean f15218a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f15219b;

    /* renamed from: c, reason: collision with root package name */
    public Object f15220c;

    /* renamed from: d, reason: collision with root package name */
    public Object f15221d;

    public h() {
        this.f15219b = new Object();
        this.f15220c = new ArrayList();
        this.f15221d = new ArrayList();
        this.f15218a = true;
    }

    public void a(String str, List list) {
        LauncherApps.ShortcutQuery shortcutQuery = (LauncherApps.ShortcutQuery) this.f15219b;
        if (str != null) {
            shortcutQuery.setPackage(str);
            shortcutQuery.setShortcutIds(list);
        }
    }

    public int[] b() {
        synchronized (this) {
            try {
                if (!this.f15218a) {
                    return null;
                }
                long[] jArr = (long[]) this.f15219b;
                int length = jArr.length;
                int i5 = 0;
                int i11 = 0;
                while (i5 < length) {
                    int i12 = i11 + 1;
                    int i13 = 1;
                    boolean z11 = jArr[i5] > 0;
                    boolean[] zArr = (boolean[]) this.f15220c;
                    if (z11 != zArr[i11]) {
                        int[] iArr = (int[]) this.f15221d;
                        if (!z11) {
                            i13 = 2;
                        }
                        iArr[i11] = i13;
                    } else {
                        ((int[]) this.f15221d)[i11] = 0;
                    }
                    zArr[i11] = z11;
                    i5++;
                    i11 = i12;
                }
                this.f15218a = false;
                return (int[]) ((int[]) this.f15221d).clone();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public qa.b c(int i5) {
        Context context = (Context) this.f15220c;
        LauncherApps.ShortcutQuery shortcutQuery = (LauncherApps.ShortcutQuery) this.f15219b;
        if (this.f15218a) {
            return qa.b.f83908b;
        }
        shortcutQuery.setQueryFlags(i5);
        if (!((LauncherApps) context.getSystemService(LauncherApps.class)).hasShortcutHostPermission()) {
            Log.e("ShortcutRequest", "Nova does not have ShortcutHost permission, is it the default launcher?");
            return qa.b.f83908b;
        }
        try {
            return new qa.b(((LauncherApps) context.getSystemService(LauncherApps.class)).getShortcuts(shortcutQuery, (UserHandle) this.f15221d));
        } catch (IllegalStateException | SecurityException e3) {
            Log.e("ShortcutRequest", "Failed to query for shortcuts", e3);
            return qa.b.f83908b;
        }
    }

    public h(Context context, UserHandle userHandle) {
        this.f15219b = new LauncherApps.ShortcutQuery();
        this.f15218a = false;
        this.f15220c = context;
        this.f15221d = userHandle;
    }

    public h(b0 b0Var, v1 v1Var, c1 c1Var) {
        this.f15219b = b0Var;
        this.f15220c = v1Var;
        this.f15221d = c1Var;
        this.f15218a = true;
    }

    public h(int i5) {
        this.f15219b = new long[i5];
        this.f15220c = new boolean[i5];
        this.f15221d = new int[i5];
    }
}
