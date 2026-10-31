package n4;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import androidx.core.graphics.drawable.IconCompat;
import java.util.ArrayList;
import java.util.Iterator;
import l1.a2;

/* loaded from: classes2.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final Context f77854a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f77855b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f77856c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f77857d;

    /* renamed from: e, reason: collision with root package name */
    public CharSequence f77858e;

    /* renamed from: f, reason: collision with root package name */
    public CharSequence f77859f;

    /* renamed from: g, reason: collision with root package name */
    public PendingIntent f77860g;

    /* renamed from: h, reason: collision with root package name */
    public IconCompat f77861h;

    /* renamed from: i, reason: collision with root package name */
    public int f77862i;

    /* renamed from: j, reason: collision with root package name */
    public int f77863j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f77864k;

    /* renamed from: l, reason: collision with root package name */
    public g0 f77865l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f77866m;
    public Bundle n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f77867p;

    /* renamed from: q, reason: collision with root package name */
    public String f77868q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f77869r;

    /* renamed from: s, reason: collision with root package name */
    public final Notification f77870s;

    /* renamed from: t, reason: collision with root package name */
    public final ArrayList f77871t;

    public r(Context context, String str) {
        this.f77855b = new ArrayList();
        this.f77856c = new ArrayList();
        this.f77857d = new ArrayList();
        this.f77864k = true;
        this.f77866m = false;
        this.o = 0;
        this.f77867p = 0;
        Notification notification = new Notification();
        this.f77870s = notification;
        this.f77854a = context;
        this.f77868q = str;
        notification.when = System.currentTimeMillis();
        notification.audioStreamType = -1;
        this.f77863j = 0;
        this.f77871t = new ArrayList();
        this.f77869r = true;
    }

    public static CharSequence c(CharSequence charSequence) {
        return (charSequence != null && charSequence.length() > 5120) ? charSequence.subSequence(0, 5120) : charSequence;
    }

    public final void a(String str, PendingIntent pendingIntent) {
        this.f77855b.add(new l(IconCompat.c(2131231225, null, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), str, pendingIntent, new Bundle(), null, null));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r17v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r3v11, types: [android.app.Notification$Builder] */
    /* JADX WARN: Type inference failed for: r3v13, types: [android.app.Notification$Builder] */
    /* JADX WARN: Type inference failed for: r3v7, types: [android.app.Notification$Builder] */
    /* JADX WARN: Type inference failed for: r4v30, types: [java.lang.CharSequence, java.lang.CharSequence[], java.lang.String] */
    public final Notification b() {
        Object obj;
        Bundle bundle;
        Bundle[] bundleArr;
        ArrayList arrayList;
        l lVarE;
        a2 a2Var = new a2();
        new ArrayList();
        a2Var.f73010d = new Bundle();
        a2Var.f73009c = this;
        Context context = this.f77854a;
        a2Var.f73007a = context;
        Notification.Builder builder = new Notification.Builder(context, this.f77868q);
        a2Var.f73008b = builder;
        Notification notification = this.f77870s;
        Object obj2 = null;
        int i5 = 2;
        builder.setWhen(notification.when).setSmallIcon(notification.icon, notification.iconLevel).setContent(notification.contentView).setTicker(notification.tickerText, null).setVibrate(notification.vibrate).setLights(notification.ledARGB, notification.ledOnMS, notification.ledOffMS).setOngoing((notification.flags & 2) != 0).setOnlyAlertOnce((notification.flags & 8) != 0).setAutoCancel((notification.flags & 16) != 0).setDefaults(notification.defaults).setContentTitle(this.f77858e).setContentText(this.f77859f).setContentInfo(null).setContentIntent(this.f77860g).setDeleteIntent(notification.deleteIntent).setFullScreenIntent(null, (notification.flags & 128) != 0).setNumber(this.f77862i).setProgress(0, 0, false);
        IconCompat iconCompat = this.f77861h;
        builder.setLargeIcon(iconCompat == null ? null : iconCompat.f(context));
        builder.setSubText(null).setUsesChronometer(false).setPriority(this.f77863j);
        g0 g0Var = this.f77865l;
        if (g0Var instanceof w) {
            w wVar = (w) g0Var;
            PendingIntent pendingIntent = wVar.f77878h;
            l lVarE2 = pendingIntent == null ? wVar.e(2131231516, 2132017597, wVar.f77882l, 2131099842, wVar.f77879i) : wVar.e(2131231516, 2132017596, wVar.f77882l, 2131099842, pendingIntent);
            PendingIntent pendingIntent2 = wVar.f77877g;
            if (pendingIntent2 == null) {
                lVarE = null;
            } else {
                boolean z11 = wVar.f77880j;
                lVarE = wVar.e(z11 ? 2131231514 : 2131231512, z11 ? 2132017595 : 2132017594, wVar.f77881k, 2131099841, pendingIntent2);
            }
            ArrayList arrayList2 = new ArrayList(3);
            arrayList2.add(lVarE2);
            ArrayList arrayList3 = wVar.f77807a.f77855b;
            if (arrayList3 != null) {
                Iterator it = arrayList3.iterator();
                while (it.hasNext()) {
                    l lVar = (l) it.next();
                    lVar.getClass();
                    if (!lVar.f77818a.getBoolean("key_action_priority") && i5 > 1) {
                        arrayList2.add(lVar);
                        i5--;
                    }
                    if (lVarE != null && i5 == 1) {
                        arrayList2.add(lVarE);
                        i5--;
                    }
                }
            }
            if (lVarE != null && i5 >= 1) {
                arrayList2.add(lVarE);
            }
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                a2Var.d((l) it2.next());
            }
        } else {
            Iterator it3 = this.f77855b.iterator();
            while (it3.hasNext()) {
                a2Var.d((l) it3.next());
            }
        }
        Bundle bundle2 = this.n;
        if (bundle2 != null) {
            ((Bundle) a2Var.f73010d).putAll(bundle2);
        }
        int i11 = Build.VERSION.SDK_INT;
        ((Notification.Builder) a2Var.f73008b).setShowWhen(this.f77864k);
        ((Notification.Builder) a2Var.f73008b).setLocalOnly(this.f77866m);
        ((Notification.Builder) a2Var.f73008b).setGroup(null);
        ((Notification.Builder) a2Var.f73008b).setSortKey(null);
        ((Notification.Builder) a2Var.f73008b).setGroupSummary(false);
        ((Notification.Builder) a2Var.f73008b).setCategory(null);
        ((Notification.Builder) a2Var.f73008b).setColor(this.o);
        ((Notification.Builder) a2Var.f73008b).setVisibility(this.f77867p);
        ((Notification.Builder) a2Var.f73008b).setPublicVersion(null);
        ((Notification.Builder) a2Var.f73008b).setSound(notification.sound, notification.audioAttributes);
        ArrayList arrayList4 = this.f77871t;
        ArrayList arrayList5 = this.f77856c;
        if (i11 < 28) {
            if (arrayList5 == null) {
                arrayList = null;
            } else {
                arrayList = new ArrayList(arrayList5.size());
                Iterator it4 = arrayList5.iterator();
                while (it4.hasNext()) {
                    q0 q0Var = (q0) it4.next();
                    CharSequence charSequence = q0Var.f77848a;
                    String str = q0Var.f77850c;
                    if (str == null) {
                        if (charSequence != null) {
                            str = "name:" + ((Object) charSequence);
                        } else {
                            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                    }
                    arrayList.add(str);
                }
            }
            if (arrayList != null) {
                if (arrayList4 == null) {
                    arrayList4 = arrayList;
                } else {
                    z.f fVar = new z.f(arrayList4.size() + arrayList.size());
                    fVar.addAll(arrayList);
                    fVar.addAll(arrayList4);
                    arrayList4 = new ArrayList(fVar);
                }
            }
        }
        if (arrayList4 != null && !arrayList4.isEmpty()) {
            Iterator it5 = arrayList4.iterator();
            while (it5.hasNext()) {
                ((Notification.Builder) a2Var.f73008b).addPerson((String) it5.next());
            }
        }
        ArrayList arrayList6 = this.f77857d;
        if (arrayList6.size() > 0) {
            if (this.n == null) {
                this.n = new Bundle();
            }
            Bundle bundle3 = this.n.getBundle("android.car.EXTENSIONS");
            if (bundle3 == null) {
                bundle3 = new Bundle();
            }
            Bundle bundle4 = new Bundle(bundle3);
            Bundle bundle5 = new Bundle();
            int i12 = 0;
            while (i12 < arrayList6.size()) {
                String string = Integer.toString(i12);
                l lVar2 = (l) arrayList6.get(i12);
                Bundle bundle6 = new Bundle();
                IconCompat iconCompatA = lVar2.a();
                Bundle bundle7 = lVar2.f77818a;
                ?? r17 = obj2;
                bundle6.putInt("icon", iconCompatA != null ? iconCompatA.d() : 0);
                bundle6.putCharSequence("title", lVar2.f77824g);
                bundle6.putParcelable("actionIntent", lVar2.f77825h);
                Bundle bundle8 = bundle7 != null ? new Bundle(bundle7) : new Bundle();
                bundle8.putBoolean("android.support.allowGeneratedReplies", lVar2.f77821d);
                bundle6.putBundle("extras", bundle8);
                s0[] s0VarArr = lVar2.f77820c;
                if (s0VarArr == null) {
                    bundleArr = r17;
                } else {
                    bundleArr = new Bundle[s0VarArr.length];
                    if (s0VarArr.length > 0) {
                        s0 s0Var = s0VarArr[0];
                        new Bundle();
                        throw r17;
                    }
                }
                bundle6.putParcelableArray("remoteInputs", bundleArr);
                bundle6.putBoolean("showsUserInterface", lVar2.f77822e);
                bundle6.putInt("semanticAction", 0);
                bundle5.putBundle(string, bundle6);
                i12++;
                obj2 = r17;
            }
            obj = obj2;
            bundle3.putBundle("invisible_actions", bundle5);
            bundle4.putBundle("invisible_actions", bundle5);
            if (this.n == null) {
                this.n = new Bundle();
            }
            this.n.putBundle("android.car.EXTENSIONS", bundle3);
            ((Bundle) a2Var.f73010d).putBundle("android.car.EXTENSIONS", bundle4);
        } else {
            obj = null;
        }
        int i13 = Build.VERSION.SDK_INT;
        ((Notification.Builder) a2Var.f73008b).setExtras(this.n);
        ?? r42 = obj;
        ((Notification.Builder) a2Var.f73008b).setRemoteInputHistory(r42);
        ((Notification.Builder) a2Var.f73008b).setBadgeIconType(0);
        ((Notification.Builder) a2Var.f73008b).setSettingsText(r42);
        ((Notification.Builder) a2Var.f73008b).setShortcutId(r42);
        ((Notification.Builder) a2Var.f73008b).setTimeoutAfter(0L);
        ((Notification.Builder) a2Var.f73008b).setGroupAlertBehavior(0);
        if (!TextUtils.isEmpty(this.f77868q)) {
            ((Notification.Builder) a2Var.f73008b).setSound(null).setDefaults(0).setLights(0, 0, 0).setVibrate(null);
        }
        if (i13 >= 28) {
            Iterator it6 = arrayList5.iterator();
            while (it6.hasNext()) {
                q0 q0Var2 = (q0) it6.next();
                Notification.Builder builder2 = (Notification.Builder) a2Var.f73008b;
                q0Var2.getClass();
                h0.a(builder2, h0.d(q0Var2));
            }
        }
        if (Build.VERSION.SDK_INT >= 29) {
            g.b((Notification.Builder) a2Var.f73008b, this.f77869r);
            g.c((Notification.Builder) a2Var.f73008b);
        }
        r rVar = (r) a2Var.f73009c;
        g0 g0Var2 = rVar.f77865l;
        if (g0Var2 != null) {
            g0Var2.b(a2Var);
        }
        Notification notificationBuild = ((Notification.Builder) a2Var.f73008b).build();
        if (g0Var2 != null) {
            rVar.f77865l.getClass();
        }
        if (g0Var2 != null && (bundle = notificationBuild.extras) != null) {
            g0Var2.a(bundle);
        }
        return notificationBuild;
    }

    public final void d(boolean z11) {
        Notification notification = this.f77870s;
        if (z11) {
            notification.flags |= 16;
        } else {
            notification.flags &= -17;
        }
    }

    public final void e() {
        this.f77868q = "com.google.android.gms.availability";
    }

    public final void f(PendingIntent pendingIntent) {
        this.f77860g = pendingIntent;
    }

    public final void g(String str) {
        this.f77859f = c(str);
    }

    public final void h(String str) {
        this.f77858e = c(str);
    }

    public final void i(Bitmap bitmap) {
        IconCompat iconCompat;
        if (bitmap == null) {
            iconCompat = null;
        } else {
            if (Build.VERSION.SDK_INT < 27) {
                Resources resources = this.f77854a.getResources();
                int dimensionPixelSize = resources.getDimensionPixelSize(2131165353);
                int dimensionPixelSize2 = resources.getDimensionPixelSize(2131165352);
                if (bitmap.getWidth() > dimensionPixelSize || bitmap.getHeight() > dimensionPixelSize2) {
                    double dMin = Math.min(dimensionPixelSize / Math.max(1, bitmap.getWidth()), dimensionPixelSize2 / Math.max(1, bitmap.getHeight()));
                    bitmap = Bitmap.createScaledBitmap(bitmap, (int) Math.ceil(bitmap.getWidth() * dMin), (int) Math.ceil(bitmap.getHeight() * dMin), true);
                }
            }
            PorterDuff.Mode mode = IconCompat.f14224k;
            bitmap.getClass();
            IconCompat iconCompat2 = new IconCompat(1);
            iconCompat2.f14226b = bitmap;
            iconCompat = iconCompat2;
        }
        this.f77861h = iconCompat;
    }

    public final void j() {
        this.f77866m = true;
    }

    public final void k(int i5) {
        this.f77863j = i5;
    }

    public final void l(int i5) {
        this.f77870s.icon = i5;
    }

    public final void m(g0 g0Var) {
        if (this.f77865l != g0Var) {
            this.f77865l = g0Var;
            if (g0Var == null || g0Var.f77807a == this) {
                return;
            }
            g0Var.f77807a = this;
            m(g0Var);
        }
    }

    public final void n(String str) {
        this.f77870s.tickerText = c(str);
    }

    public final void o(long j11) {
        this.f77870s.when = j11;
    }

    public r(Context context) {
        this(context, null);
    }
}
