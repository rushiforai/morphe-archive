package mz;

import aa.a0;
import android.app.Notification;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import android.widget.RemoteViews;
import androidx.core.graphics.drawable.IconCompat;
import e10.a3;
import e10.y2;
import e10.z2;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import mx.g0;
import n4.e0;
import n4.f0;
import n4.q0;
import o9.g3;
import w20.t;
import w20.u;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f77340h = {"com.google.android.googlequicksearchbox", "com.android.deskclock", "com.google.android.deskclock", "com.twitter.android", "com.digibites.accubattery", "com.samruston.weather", "com.google.android.dialer", "com.htc.contacts", "com.android.chrome", "com.chrome.beta", "com.chrome.dev", "com.chrome.canary"};

    /* renamed from: a, reason: collision with root package name */
    public final String f77341a;

    /* renamed from: b, reason: collision with root package name */
    public final String f77342b;

    /* renamed from: c, reason: collision with root package name */
    public final String[] f77343c;

    /* renamed from: d, reason: collision with root package name */
    public int f77344d;

    /* renamed from: e, reason: collision with root package name */
    public final String f77345e;

    /* renamed from: f, reason: collision with root package name */
    public final Bitmap f77346f;

    /* renamed from: g, reason: collision with root package name */
    public final Bitmap f77347g;

    public h(String str, String str2, int i5, String[] strArr, String str3, Bitmap bitmap, Bitmap bitmap2) {
        this.f77341a = str;
        this.f77342b = str2;
        this.f77344d = Math.max(1, i5);
        this.f77343c = strArr;
        this.f77345e = str3;
        this.f77346f = bitmap;
        this.f77347g = bitmap2;
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x01b9  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x01fc  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x01ff  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0202 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:152:0x00f9 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:153:0x011c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:158:0x00c2 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:159:0x00c2 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x015f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static h a(StatusBarNotification statusBarNotification) throws IllegalAccessException, IllegalArgumentException {
        String[] strArr;
        Object obj;
        q.c cVar;
        Iterator it;
        Bitmap bitmap;
        q.c cVarL;
        String str;
        Bitmap bitmap2;
        Field field;
        Field field2;
        Field field3;
        Bitmap bitmap3;
        Drawable drawableE;
        Object objA;
        f0 f0Var;
        IconCompat iconCompat;
        Notification notification = statusBarNotification.getNotification();
        int i5 = Build.VERSION.SDK_INT;
        String shortcutId = notification.getShortcutId();
        if (i5 >= 28) {
            ArrayList parcelableArrayList = notification.extras.getParcelableArrayList("android.people.list");
            strArr = (parcelableArrayList == null || parcelableArrayList.isEmpty()) ? g3.f79849d : (String[]) parcelableArrayList.stream().filter(new ha.d()).map(new ga.i(1)).sorted().toArray(new a0(2));
        } else {
            strArr = new String[0];
        }
        String[] strArr2 = strArr;
        Bundle bundle = statusBarNotification.getNotification().extras;
        Intrinsics.d(bundle);
        int i11 = 13;
        Bitmap bitmapB = null;
        if (statusBarNotification.getNotification().getLargeIcon() != null) {
            cVarL = new q.c(statusBarNotification.getNotification().getLargeIcon(), i11);
        } else if (statusBarNotification.getNotification().largeIcon != null) {
            cVarL = q.c.l(statusBarNotification.getNotification().largeIcon);
        } else {
            if (!bundle.containsKey("android.picture")) {
                RemoteViews remoteViews = statusBarNotification.getNotification().bigContentView;
                if (remoteViews == null || (field3 = u.f93723a) == null) {
                    obj = null;
                    if (obj != null && (obj instanceof ArrayList)) {
                        it = ((ArrayList) obj).iterator();
                        bitmap = null;
                        while (it.hasNext()) {
                            Object next = it.next();
                            Class cls = t.f93720a;
                            if (cls == null ? false : cls.isInstance(next)) {
                                if (cls == null || (field2 = t.f93721b) == null || !cls.isInstance(next)) {
                                    str = null;
                                    if ("setImageBitmap".equals(str)) {
                                        Class cls2 = t.f93720a;
                                        if (cls2 == null || (field = t.f93722c) == null || !cls2.isInstance(next)) {
                                            bitmap2 = null;
                                            if (bitmap2 != null) {
                                                if (bitmap != null) {
                                                    if (bitmap.getHeight() * bitmap.getWidth() < bitmap2.getHeight() * bitmap2.getWidth()) {
                                                    }
                                                }
                                                bitmap = bitmap2;
                                            }
                                        } else {
                                            try {
                                                Object obj2 = field.get(next);
                                                if (obj2 != null && (obj2 instanceof Bitmap)) {
                                                    bitmap2 = (Bitmap) obj2;
                                                }
                                            } catch (Exception e3) {
                                                e3.printStackTrace();
                                            }
                                            if (bitmap2 != null) {
                                            }
                                        }
                                    }
                                } else {
                                    try {
                                        str = (String) field2.get(next);
                                    } catch (Exception e11) {
                                        e11.printStackTrace();
                                    }
                                    if ("setImageBitmap".equals(str)) {
                                    }
                                }
                            }
                        }
                        if (bitmap != null) {
                            cVarL = q.c.l(bitmap);
                        }
                    }
                    cVar = null;
                } else {
                    try {
                        obj = field3.get(remoteViews);
                    } catch (Exception e12) {
                        e12.printStackTrace();
                    }
                    if (obj != null) {
                        it = ((ArrayList) obj).iterator();
                        bitmap = null;
                        while (it.hasNext()) {
                        }
                        if (bitmap != null) {
                        }
                    }
                    cVar = null;
                }
                if (cVar == null && Build.VERSION.SDK_INT >= 28) {
                    try {
                        int i12 = Result.f71687b;
                        objA = f0.e(statusBarNotification.getNotification());
                    } catch (Throwable th2) {
                        int i13 = Result.f71687b;
                        objA = ResultKt.a(th2);
                    }
                    if (objA instanceof Result.Failure) {
                        objA = null;
                    }
                    f0Var = (f0) objA;
                    if (f0Var != null) {
                        Iterator it2 = f0Var.f77802e.iterator();
                        IconCompat iconCompat2 = null;
                        while (it2.hasNext()) {
                            q0 q0Var = ((e0) it2.next()).f77797c;
                            if (q0Var != null && (iconCompat = q0Var.f77849b) != null) {
                                iconCompat2 = iconCompat;
                            }
                        }
                        if (iconCompat2 != null) {
                            Context context = g0.f77088a;
                            cVar = new q.c(iconCompat2.f(g0.e()), i11);
                        }
                    }
                }
                y2 y2Var = y2.f51877a;
                Context context2 = g0.f77088a;
                int iD0 = y2Var.D0(g0.e().getResources());
                a3.f51435a.n.getClass();
                int iB = MathKt.b(iD0 * 0.228f);
                if (kotlin.collections.c.o0(statusBarNotification.getPackageName(), f77340h)) {
                    bitmap3 = null;
                } else {
                    r30.b cVar2 = statusBarNotification.getNotification().getSmallIcon() != null ? new q.c(statusBarNotification.getNotification().getSmallIcon(), i11) : statusBarNotification.getNotification().icon != 0 ? new r30.c(statusBarNotification.getPackageName(), statusBarNotification.getNotification().icon) : null;
                    if (cVar2 != null) {
                        try {
                            drawableE = cVar2.e(g0.e());
                        } catch (Throwable unused) {
                        }
                        Bitmap bitmapB2 = drawableE != null ? z2.B(drawableE, iB, iB) : null;
                        bitmap3 = bitmapB2;
                    }
                }
                if (cVar != null) {
                    try {
                        Context context3 = g0.f77088a;
                        Drawable drawableE2 = cVar.e(g0.e());
                        if (drawableE2 != null) {
                            bitmapB = z2.B(drawableE2, iB, iB);
                        }
                    } catch (Throwable unused2) {
                    }
                }
                return new h(statusBarNotification.getKey(), shortcutId, notification.number, strArr2, statusBarNotification.getPackageName(), bitmapB, bitmap3);
            }
            Bitmap bitmap4 = (Bitmap) bundle.getParcelable("android.picture");
            cVarL = bitmap4 != null ? q.c.l(bitmap4) : null;
        }
        cVar = cVarL;
        if (cVar == null) {
            int i122 = Result.f71687b;
            objA = f0.e(statusBarNotification.getNotification());
            if (objA instanceof Result.Failure) {
            }
            f0Var = (f0) objA;
            if (f0Var != null) {
            }
        }
        y2 y2Var2 = y2.f51877a;
        Context context22 = g0.f77088a;
        int iD02 = y2Var2.D0(g0.e().getResources());
        a3.f51435a.n.getClass();
        int iB2 = MathKt.b(iD02 * 0.228f);
        if (kotlin.collections.c.o0(statusBarNotification.getPackageName(), f77340h)) {
        }
        if (cVar != null) {
        }
        return new h(statusBarNotification.getKey(), shortcutId, notification.number, strArr2, statusBarNotification.getPackageName(), bitmapB, bitmap3);
    }

    public final Bitmap b() {
        return this.f77346f;
    }

    public final String c() {
        return this.f77345e;
    }

    public final Bitmap d() {
        return this.f77347g;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof h) {
            return ((h) obj).f77341a.equals(this.f77341a);
        }
        return false;
    }
}
