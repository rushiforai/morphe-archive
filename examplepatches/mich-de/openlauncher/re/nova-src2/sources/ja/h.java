package ja;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Parcel;
import android.os.Process;
import android.os.UserHandle;
import android.os.UserManager;
import android.util.ArrayMap;
import android.util.LongSparseArray;
import androidx.room.o;
import gl.l;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import w20.m;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: h, reason: collision with root package name */
    public static final x7.c f69294h = new x7.c(new l(25));

    /* renamed from: a, reason: collision with root package name */
    public final Context f69295a;

    /* renamed from: b, reason: collision with root package name */
    public final UserManager f69296b;

    /* renamed from: e, reason: collision with root package name */
    public LongSparseArray f69299e;

    /* renamed from: f, reason: collision with root package name */
    public ArrayMap f69300f;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f69297c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final n10.a f69298d = new n10.a(new fa.f(this, 5));

    /* renamed from: g, reason: collision with root package name */
    public ArrayMap f69301g = new ArrayMap();

    public h(Context context) {
        this.f69295a = context;
        this.f69296b = (UserManager) context.getSystemService(UserManager.class);
    }

    public final g a(Runnable runnable) {
        g gVar;
        synchronized (this) {
            try {
                if (this.f69297c.isEmpty()) {
                    n10.a aVar = this.f69298d;
                    Context context = this.f69295a;
                    String[] strArr = {"android.intent.action.MANAGED_PROFILE_ADDED", "android.intent.action.MANAGED_PROFILE_REMOVED"};
                    aVar.getClass();
                    IntentFilter intentFilter = new IntentFilter();
                    for (int i5 = 0; i5 < 2; i5++) {
                        intentFilter.addAction(strArr[i5]);
                    }
                    context.registerReceiver(aVar, intentFilter);
                    b();
                }
                this.f69297c.add(runnable);
                gVar = new g(this, runnable);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return gVar;
    }

    public final void b() {
        synchronized (this) {
            try {
                this.f69299e = new LongSparseArray();
                this.f69300f = new ArrayMap();
                this.f69301g = new ArrayMap();
                List<UserHandle> userProfiles = this.f69296b.getUserProfiles();
                if (userProfiles != null) {
                    boolean z11 = false;
                    for (UserHandle userHandle : userProfiles) {
                        long serialNumberForUser = this.f69296b.getSerialNumberForUser(userHandle);
                        this.f69299e.put(serialNumberForUser, userHandle);
                        this.f69300f.put(userHandle, Long.valueOf(serialNumberForUser));
                        boolean zI = i(userHandle);
                        this.f69301g.put(userHandle, Boolean.valueOf(zI));
                        if (zI) {
                            z11 = true;
                        }
                    }
                    if (m.f93699i && !z11) {
                        try {
                            Parcel parcelObtain = Parcel.obtain();
                            parcelObtain.writeInt(o.MAX_BIND_PARAMETER_CNT);
                            parcelObtain.setDataPosition(0);
                            UserHandle fromParcel = UserHandle.readFromParcel(parcelObtain);
                            parcelObtain.recycle();
                            long serialNumberForUser2 = this.f69296b.getSerialNumberForUser(fromParcel);
                            if (serialNumberForUser2 != -1) {
                                this.f69299e.put(serialNumberForUser2, fromParcel);
                                this.f69300f.put(fromParcel, Long.valueOf(serialNumberForUser2));
                                this.f69301g.put(fromParcel, Boolean.valueOf(i(fromParcel)));
                            }
                        } catch (Exception e3) {
                            e3.printStackTrace();
                        }
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final long c(UserHandle userHandle) {
        synchronized (this) {
            try {
                ArrayMap arrayMap = this.f69300f;
                if (arrayMap == null) {
                    return this.f69296b.getSerialNumberForUser(userHandle);
                }
                Long l9 = (Long) arrayMap.get(userHandle);
                return l9 == null ? 0L : l9.longValue();
            } finally {
            }
        }
    }

    public final long d(UserHandle userHandle) {
        if (Process.myUserHandle().equals(userHandle)) {
            return -1L;
        }
        synchronized (this) {
            try {
                ArrayMap arrayMap = this.f69300f;
                if (arrayMap == null) {
                    return this.f69296b.getSerialNumberForUser(userHandle);
                }
                Long l9 = (Long) arrayMap.get(userHandle);
                return l9 == null ? 0L : l9.longValue();
            } finally {
            }
        }
    }

    public final UserHandle e(long j11) {
        if (j11 == -1) {
            return Process.myUserHandle();
        }
        synchronized (this) {
            try {
                LongSparseArray longSparseArray = this.f69299e;
                if (longSparseArray == null) {
                    return this.f69296b.getUserForSerialNumber(j11);
                }
                return (UserHandle) longSparseArray.get(j11);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final List f() {
        synchronized (this) {
            try {
                if (this.f69299e != null) {
                    return new ArrayList(this.f69300f.keySet());
                }
                List<UserHandle> userProfiles = this.f69296b.getUserProfiles();
                return userProfiles == null ? Collections.EMPTY_LIST : userProfiles;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean g() {
        List<UserHandle> listF = f();
        if (listF.size() <= 1) {
            return false;
        }
        for (UserHandle userHandle : listF) {
            if (userHandle != Process.myUserHandle() && !h(userHandle)) {
                return true;
            }
        }
        return false;
    }

    public final boolean h(UserHandle userHandle) {
        synchronized (this) {
            try {
                if (this.f69299e == null) {
                    return i(userHandle);
                }
                Boolean bool = (Boolean) this.f69301g.get(userHandle);
                return bool != null && bool.booleanValue();
            } finally {
            }
        }
    }

    public final boolean i(UserHandle userHandle) {
        if (userHandle == Process.myUserHandle()) {
            return false;
        }
        long jHashCode = userHandle.hashCode();
        if (jHashCode == 95 && m.f93693c) {
            return true;
        }
        if (jHashCode == 2357 && "asus".equalsIgnoreCase(Build.MANUFACTURER)) {
            return true;
        }
        if ((jHashCode == 128 && ("huawei".equalsIgnoreCase(Build.MANUFACTURER) || m.f93691a)) || jHashCode == 999) {
            return true;
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(this.f69295a.getApplicationContext().getPackageManager().getUserBadgedLabel(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, userHandle).toString());
    }
}
