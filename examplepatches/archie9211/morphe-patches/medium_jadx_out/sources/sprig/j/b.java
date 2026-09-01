package sprig.j;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.userleap.SprigLoggingLevel;
import defpackage.b09;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.co6;
import defpackage.dw0;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.f25;
import defpackage.fb3;
import defpackage.g25;
import defpackage.iy6;
import defpackage.j15;
import defpackage.ka1;
import defpackage.ky6;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.m15;
import defpackage.muc;
import defpackage.n1b;
import defpackage.s15;
import defpackage.vx6;
import defpackage.x45;
import defpackage.z15;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0096\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000b\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\n\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u0015\u0010\u0010\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u0010\u0010\u000fJ!\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00112\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0019\u0010\u0018J\u0017\u0010\u001a\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u001a\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u001b\u0010\u0018J\u001f\u0010\u001d\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u001c\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u001d\u0010\u0016J\u0017\u0010\u001e\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u001e\u0010\u0018J\u0017\u0010\u001f\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b\u001f\u0010 J\u0019\u0010\"\u001a\u0004\u0018\u00010!2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b\"\u0010#J\u0011\u0010\"\u001a\u0004\u0018\u00010\u0011H\u0002¢\u0006\u0004\b\"\u0010$J\u0011\u0010%\u001a\u0004\u0018\u00010\u0011H\u0002¢\u0006\u0004\b%\u0010$J\u001d\u0010%\u001a\b\u0012\u0004\u0012\u00020'0&2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b%\u0010(J%\u0010,\u001a\u00020\u00062\u0006\u0010)\u001a\u00020'2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020'0*H\u0002¢\u0006\u0004\b,\u0010-J\u000f\u0010,\u001a\u00020\u0006H\u0002¢\u0006\u0004\b,\u0010\u0003J\u0019\u0010.\u001a\u00020\u00062\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0002¢\u0006\u0004\b.\u0010\u0018J\u0017\u0010,\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b,\u0010\u0018J\u0017\u0010/\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b/\u0010\u0018J\u0017\u0010,\u001a\u0002022\u0006\u00101\u001a\u000200H\u0002¢\u0006\u0004\b,\u00103J\u0017\u00104\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b4\u0010\u0018R \u00108\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001106058\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b,\u00107R\u0014\u0010;\u001a\u0002098\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b%\u0010:R\u0016\u0010=\u001a\u00020\t8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\"\u0010<R \u0010@\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f060>8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010?R \u0010E\u001a\u000e\u0012\u0004\u0012\u00020B\u0012\u0004\u0012\u00020C0A8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b.\u0010DR\u0014\u0010F\u001a\u0002098\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b/\u0010:R\u0014\u0010I\u001a\u00020G8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b4\u0010HR\u0013\u0010K\u001a\u0004\u0018\u00010\u00118F¢\u0006\u0006\u001a\u0004\bJ\u0010$R\u0013\u0010N\u001a\u0004\u0018\u00010'8F¢\u0006\u0006\u001a\u0004\bL\u0010MR\u0017\u0010Q\u001a\b\u0012\u0004\u0012\u00020'0&8F¢\u0006\u0006\u001a\u0004\bO\u0010P¨\u0006R"}, d2 = {"Lsprig/j/b;", "Landroid/app/Application$ActivityLifecycleCallbacks;", "<init>", "()V", "Landroid/content/Context;", "context", "Lc1e;", "track", "(Landroid/content/Context;)V", "", "currentActivityIsAvailable", "()Z", "Lsprig/j/a;", "listener", "addActivityChangeListener", "(Lsprig/j/a;)V", "removeActivityChangeListener", "Landroid/app/Activity;", "activity", "Landroid/os/Bundle;", "savedInstanceState", "onActivityCreated", "(Landroid/app/Activity;Landroid/os/Bundle;)V", "onActivityStarted", "(Landroid/app/Activity;)V", "onActivityStopped", "onActivityResumed", "onActivityPaused", "outState", "onActivitySaveInstanceState", "onActivityDestroyed", "d", "(Landroid/app/Activity;)Z", "Lvx6;", "c", "(Landroid/app/Activity;)Lvx6;", "()Landroid/app/Activity;", "b", "", "Landroid/view/View;", "(Landroid/app/Activity;)Ljava/util/List;", "root", "", "results", "a", "(Landroid/view/View;Ljava/util/List;)V", "e", "f", "Lj15;", "fragment", "", "(Lj15;)Ljava/lang/String;", "g", "Ljava/util/LinkedList;", "Ljava/lang/ref/WeakReference;", "Ljava/util/LinkedList;", "startedActivities", "", "Ljava/lang/Object;", "startedActivitiesLock", "Z", "isRegistered", "Ljava/util/concurrent/CopyOnWriteArraySet;", "Ljava/util/concurrent/CopyOnWriteArraySet;", "activityChangeListeners", "Ljava/util/WeakHashMap;", "Lm15;", "Lz15;", "Ljava/util/WeakHashMap;", "fragmentCallbacksMap", "fragmentCallbacksLock", "Lsprig/j/e;", "Lsprig/j/e;", "logger", "getCurrentActivity", "currentActivity", "getCurrentActivityRootView", "()Landroid/view/View;", "currentActivityRootView", "getCurrentModalViews", "()Ljava/util/List;", "currentModalViews", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class b implements Application.ActivityLifecycleCallbacks {

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public static volatile boolean isRegistered;
    public static final b INSTANCE = new b();

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public static final LinkedList startedActivities = new LinkedList();

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public static final Object startedActivitiesLock = new Object();

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public static final CopyOnWriteArraySet activityChangeListeners = new CopyOnWriteArraySet();

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public static final WeakHashMap fragmentCallbacksMap = new WeakHashMap();

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public static final Object fragmentCallbacksLock = new Object();

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public static final e logger = new e();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u00012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"<anonymous>", "", "it", "Ljava/lang/ref/WeakReference;", "Landroid/app/Activity;", "invoke", "(Ljava/lang/ref/WeakReference;)Ljava/lang/Boolean;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class a extends co6 implements x45 {
        final /* synthetic */ Activity $activity;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Activity activity) {
            super(1);
            this.$activity = activity;
        }

        @Override // defpackage.x45
        public final Boolean invoke(WeakReference<Activity> weakReference) {
            weakReference.getClass();
            return Boolean.valueOf(weakReference.get() == null || weakReference.get() == this.$activity);
        }
    }

    /* JADX INFO: renamed from: sprig.j.b$b, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u00012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"<anonymous>", "", "it", "Ljava/lang/ref/WeakReference;", "Landroid/app/Activity;", "invoke", "(Ljava/lang/ref/WeakReference;)Ljava/lang/Boolean;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class C0029b extends co6 implements x45 {
        final /* synthetic */ Activity $activity;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0029b(Activity activity) {
            super(1);
            this.$activity = activity;
        }

        @Override // defpackage.x45
        public final Boolean invoke(WeakReference<Activity> weakReference) {
            weakReference.getClass();
            return Boolean.valueOf(weakReference.get() == null || weakReference.get() == this.$activity);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u00012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"<anonymous>", "", "it", "Ljava/lang/ref/WeakReference;", "Landroid/app/Activity;", "invoke", "(Ljava/lang/ref/WeakReference;)Ljava/lang/Boolean;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class c extends co6 implements x45 {
        final /* synthetic */ Activity $activity;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(Activity activity) {
            super(1);
            this.$activity = activity;
        }

        @Override // defpackage.x45
        public final Boolean invoke(WeakReference<Activity> weakReference) {
            weakReference.getClass();
            return Boolean.valueOf(weakReference.get() == null || weakReference.get() == this.$activity);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"sprig/j/b$d", "Lz15;", "Lf25;", "fm", "Lj15;", "f", "Lc1e;", "onFragmentResumed", "(Lf25;Lj15;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class d extends z15 {
        final /* synthetic */ Activity $activity;

        public d(Activity activity) {
            this.$activity = activity;
        }

        @Override // defpackage.z15
        public void onFragmentResumed(f25 fm, j15 f) {
            View view;
            fm.getClass();
            f.getClass();
            try {
                if (!f.t() || f.A || (view = f.G) == null || !view.isAttachedToWindow()) {
                    return;
                }
                sprig.b.b bVar = sprig.b.b.INSTANCE;
                b bVar2 = b.INSTANCE;
                sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Activity state changed (" + bVar2.a(f) + ") for: " + f, null, 0, 6, null);
                bVar2.e(this.$activity);
            } catch (Exception e) {
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error notifying listener: ", e.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
            }
        }
    }

    private b() {
    }

    public final void a(View root, List results) {
        String lowerCase;
        String string;
        if (root instanceof ViewGroup) {
            try {
                int childCount = ((ViewGroup) root).getChildCount();
                for (int i = 0; i < childCount; i++) {
                    try {
                        View childAt = ((ViewGroup) root).getChildAt(i);
                        if (childAt != null && childAt.isAttachedToWindow()) {
                            Object tag = childAt.getTag();
                            if (tag == null || (string = tag.toString()) == null) {
                                lowerCase = "";
                            } else {
                                Locale locale = Locale.ROOT;
                                locale.getClass();
                                lowerCase = string.toLowerCase(locale);
                                lowerCase.getClass();
                            }
                            if (((muc.Q(lowerCase, "react", false) && muc.Q(lowerCase, "modal", false)) || muc.Q(childAt.getClass().getName(), "ReactModal", true)) && childAt.isAttachedToWindow()) {
                                results.add(childAt);
                            }
                            if (childAt instanceof ViewGroup) {
                                a(childAt, results);
                            }
                        }
                    } catch (Exception unused) {
                    }
                }
            } catch (IndexOutOfBoundsException | Exception unused2) {
            }
        }
    }

    public final void addActivityChangeListener(sprig.j.a listener) {
        listener.getClass();
        a();
        CopyOnWriteArraySet copyOnWriteArraySet = activityChangeListeners;
        copyOnWriteArraySet.add(new WeakReference(listener));
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, n1b.a.b(sprig.j.a.class).j() + " added. Total listeners: " + copyOnWriteArraySet.size(), null, 0, 6, null);
    }

    public final Activity b() {
        boolean z;
        Object obj;
        int i = Build.VERSION.SDK_INT;
        if (i >= 28) {
            sprig.b.b.INSTANCE.sendVerboseLoggingEvent(b09.w(i, "Using reflection fallback on Android "), SprigLoggingLevel.DEBUG, 1);
        }
        try {
            try {
                Class<?> cls = Class.forName("android.app.ActivityThread");
                Object objInvoke = cls.getMethod("currentActivityThread", null).invoke(null, null);
                if (objInvoke == null) {
                    return null;
                }
                Field declaredField = cls.getDeclaredField("mActivities");
                declaredField.setAccessible(true);
                Object obj2 = declaredField.get(objInvoke);
                Map map = obj2 instanceof Map ? (Map) obj2 : null;
                if (map == null) {
                    return null;
                }
                Activity activity = null;
                for (Object obj3 : map.values()) {
                    Class<?> cls2 = obj3.getClass();
                    boolean z2 = false;
                    try {
                        Field declaredField2 = cls2.getDeclaredField("paused");
                        declaredField2.setAccessible(true);
                        z = declaredField2.getBoolean(obj3);
                    } catch (NoSuchFieldException unused) {
                        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "paused field not found on ActivityClientRecord", SprigLoggingLevel.DEBUG, 0, 4, null);
                        z = false;
                    }
                    try {
                        Field declaredField3 = cls2.getDeclaredField("stopped");
                        declaredField3.setAccessible(true);
                        z2 = declaredField3.getBoolean(obj3);
                    } catch (NoSuchFieldException unused2) {
                        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "stopped field not found on ActivityClientRecord", SprigLoggingLevel.DEBUG, 0, 4, null);
                    }
                    try {
                        Field declaredField4 = cls2.getDeclaredField("activity");
                        declaredField4.setAccessible(true);
                        obj = declaredField4.get(obj3);
                    } catch (NoSuchFieldException unused3) {
                        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "activity field not found on ActivityClientRecord", SprigLoggingLevel.DEBUG, 0, 4, null);
                    }
                    Activity activity2 = obj instanceof Activity ? (Activity) obj : null;
                    if (activity2 != null && !activity2.isFinishing() && !activity2.isDestroyed()) {
                        if (!z && !z2) {
                            return activity2;
                        }
                        if (!z2 && activity == null) {
                            activity = activity2;
                        }
                    }
                }
                return activity;
            } catch (NoSuchFieldException e) {
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("mActivities field not found: ", e.getMessage()), SprigLoggingLevel.DEBUG, 0, 4, null);
                return null;
            }
        } catch (ClassNotFoundException e2) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("ActivityThread class not found: ", e2.getMessage()), SprigLoggingLevel.DEBUG, 0, 4, null);
            return null;
        } catch (NoSuchMethodException e3) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("currentActivityThread method not found: ", e3.getMessage()), SprigLoggingLevel.DEBUG, 0, 4, null);
            return null;
        } catch (SecurityException e4) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Security exception accessing ActivityThread: ", e4.getMessage()), SprigLoggingLevel.WARNING, 0, 4, null);
            return null;
        } catch (Exception e5) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Fallback activity detection failed: ", e5.getMessage()), SprigLoggingLevel.DEBUG, 0, 4, null);
            return null;
        }
    }

    public final Activity c() {
        ArrayList<Activity> arrayList;
        synchronized (startedActivitiesLock) {
            arrayList = new ArrayList();
            Iterator itDescendingIterator = startedActivities.descendingIterator();
            while (itDescendingIterator.hasNext()) {
                Activity activity = (Activity) ((WeakReference) itDescendingIterator.next()).get();
                if (activity == null) {
                    itDescendingIterator.remove();
                } else if (activity.isFinishing() || activity.isDestroyed()) {
                    itDescendingIterator.remove();
                } else {
                    arrayList.add(activity);
                }
            }
        }
        Activity activity2 = null;
        if (arrayList.isEmpty()) {
            return null;
        }
        for (Activity activity3 : arrayList) {
            try {
                if (activity3.getWindow() == null) {
                    continue;
                } else {
                    vx6 vx6VarC = c(activity3);
                    if (vx6VarC != null) {
                        if (vx6VarC.isAtLeast(vx6.RESUMED)) {
                            return activity3;
                        }
                        if (vx6VarC.isAtLeast(vx6.STARTED) && activity2 == null) {
                            activity2 = activity3;
                        }
                    } else if (activity2 == null) {
                        activity2 = activity3;
                    }
                }
            } catch (Exception unused) {
            }
        }
        return activity2;
    }

    public final boolean currentActivityIsAvailable() {
        Activity currentActivity = getCurrentActivity();
        if (currentActivity == null) {
            return false;
        }
        return d(currentActivity);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean d(Activity activity) {
        try {
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                if (activity instanceof iy6) {
                    return ((ky6) ((iy6) activity).getLifecycle()).d.isAtLeast(vx6.RESUMED);
                }
                return true;
            }
            return false;
        } catch (Exception e) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("Error checking activity resumed state: ", e.getClass().getSimpleName(), ": ", e.getMessage()), SprigLoggingLevel.DEBUG, 0, 4, null);
            return false;
        }
    }

    public final void f(Activity activity) {
        if (activity instanceof m15) {
            m15 m15Var = (m15) activity;
            if (m15Var.isDestroyed() || m15Var.isFinishing()) {
                return;
            }
            g25 g25VarM = m15Var.m();
            if (g25VarM.I) {
                return;
            }
            synchronized (fragmentCallbacksLock) {
                WeakHashMap weakHashMap = fragmentCallbacksMap;
                if (weakHashMap.containsKey(activity)) {
                    return;
                }
                if (g25VarM.N()) {
                    return;
                }
                d dVar = new d(activity);
                try {
                    ((CopyOnWriteArrayList) g25VarM.n.b).add(new s15(dVar));
                    weakHashMap.put(activity, dVar);
                } catch (IllegalStateException e) {
                    sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Could not register fragment callbacks: " + e.getMessage(), SprigLoggingLevel.WARNING, 0, 4, null);
                }
            }
        }
    }

    public final void g(Activity activity) {
        if (activity instanceof m15) {
            synchronized (fragmentCallbacksLock) {
                z15 z15Var = (z15) fragmentCallbacksMap.remove(activity);
                if (z15Var != null) {
                    try {
                        if (!((m15) activity).m().I) {
                            ((m15) activity).m().h0(z15Var);
                        }
                    } catch (Exception e) {
                        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Error unregistering activity callbacks: " + e.getMessage(), SprigLoggingLevel.ERROR, 0, 4, null);
                    }
                }
            }
        }
    }

    public final Activity getCurrentActivity() {
        try {
            Activity activityC = c();
            return activityC != null ? activityC : b();
        } catch (Exception e) {
            e eVar = logger;
            String message = e.getMessage();
            if (message == null) {
                message = "";
            }
            e.logError$default(eVar, "Error determining current activity", null, message, kyd.h0(e), null, null, 50, null);
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ev6.x("Error determining current activity: ", e.getMessage(), "."), SprigLoggingLevel.ERROR, 0, 4, null);
            return null;
        }
    }

    public final View getCurrentActivityRootView() {
        Window window;
        View decorView;
        View rootView;
        try {
            Activity currentActivity = getCurrentActivity();
            if (currentActivity != null && currentActivity.isDestroyed()) {
                return null;
            }
            if ((currentActivity != null && currentActivity.isFinishing()) || currentActivity == null || (window = currentActivity.getWindow()) == null || (decorView = window.getDecorView()) == null || (rootView = decorView.getRootView()) == null) {
                return null;
            }
            if (rootView.isAttachedToWindow()) {
                return rootView;
            }
            return null;
        } catch (Exception unused) {
            return null;
        }
    }

    public final List<View> getCurrentModalViews() {
        Activity currentActivity = getCurrentActivity();
        return currentActivity == null ? ey3.a : b(currentActivity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        activity.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "onActivityCreated: " + activity, null, 0, 6, null);
        f(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
        activity.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "onActivityDestroyed: " + activity, null, 0, 6, null);
        synchronized (startedActivitiesLock) {
            bu1.S0(startedActivities, new C0029b(activity));
        }
        g(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        activity.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "onActivityPaused: " + activity, null, 0, 6, null);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        activity.getClass();
        try {
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            sprig.b.b.sendLoggingEvent$default(bVar, "onActivityResumed: " + activity, null, 0, 6, null);
            sprig.b.b.sendLoggingEvent$default(bVar, "Activity is now ready: " + activity, null, 0, 6, null);
            e(activity);
        } catch (Exception e) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("EXCEPTION in onActivityResumed: ", e.getClass().getSimpleName(), ": ", e.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        activity.getClass();
        outState.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "onActivitySaveInstanceState: " + activity, null, 0, 6, null);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        activity.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "onActivityStarted: " + activity, null, 0, 6, null);
        a(activity);
        f(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        ArrayList arrayList;
        activity.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "onActivityStopped: " + activity, SprigLoggingLevel.WARNING, 0, 4, null);
        synchronized (startedActivitiesLock) {
            try {
                LinkedList linkedList = startedActivities;
                bu1.S0(linkedList, new c(activity));
                arrayList = new ArrayList();
                Iterator it2 = linkedList.iterator();
                while (it2.hasNext()) {
                    Activity activity2 = (Activity) ((WeakReference) it2.next()).get();
                    String string = activity2 != null ? activity2.toString() : null;
                    if (string != null) {
                        arrayList.add(string);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        Activity currentActivity = getCurrentActivity();
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        SprigLoggingLevel sprigLoggingLevel = SprigLoggingLevel.DEBUG;
        sprig.b.b.sendVerboseLoggingEvent$default(bVar, "After removing " + activity + ", currentActivity is: " + currentActivity, sprigLoggingLevel, 0, 4, null);
        sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Activities in stack: " + arrayList, sprigLoggingLevel, 0, 4, null);
        g(activity);
        e(currentActivity);
    }

    public final void removeActivityChangeListener(sprig.j.a listener) {
        listener.getClass();
        CopyOnWriteArraySet copyOnWriteArraySet = activityChangeListeners;
        int size = copyOnWriteArraySet.size();
        Iterator it2 = copyOnWriteArraySet.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            WeakReference weakReference = (WeakReference) it2.next();
            sprig.j.a aVar = (sprig.j.a) weakReference.get();
            if (aVar == null || aVar == listener) {
                activityChangeListeners.remove(weakReference);
            }
        }
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, n1b.a.b(sprig.j.a.class).j() + " removed. Listeners: " + size + " -> " + activityChangeListeners.size(), null, 0, 6, null);
    }

    public final void track(Context context) {
        Activity activity;
        context.getClass();
        try {
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            sprig.b.b.sendLoggingEvent$default(bVar, "ActivityTracker.track() called with context: " + context, null, 0, 6, null);
            sprig.b.b.sendLoggingEvent$default(bVar, "Is activity: " + (context instanceof Activity), null, 1, 2, null);
            sprig.b.b.sendLoggingEvent$default(bVar, "Is lifecycle owner: " + (context instanceof iy6), null, 1, 2, null);
            Context applicationContext = context.getApplicationContext();
            c1e c1eVar = null;
            Application application = applicationContext instanceof Application ? (Application) applicationContext : null;
            if (application == null) {
                sprig.b.b.sendLoggingEvent$default(bVar, "Could not get Application from context, cannot register lifecycle callbacks", SprigLoggingLevel.ERROR, 0, 4, null);
                return;
            }
            if (isRegistered) {
                sprig.b.b.sendLoggingEvent$default(bVar, "Already registered for lifecycle callbacks", null, 0, 6, null);
                if ((context instanceof iy6) && (context instanceof Activity) && d((Activity) context)) {
                    sprig.b.b.sendLoggingEvent$default(bVar, "Adding already-resumed activity to tracking: " + context, null, 0, 6, null);
                    a((Activity) context);
                    activity = (Activity) context;
                } else {
                    activity = null;
                }
            } else {
                sprig.b.b.sendLoggingEvent$default(bVar, "Registering activity lifecycle callbacks...", null, 0, 6, null);
                application.registerActivityLifecycleCallbacks(this);
                isRegistered = true;
                sprig.b.b.sendLoggingEvent$default(bVar, "Activity lifecycle callbacks registered successfully", null, 0, 6, null);
                if ((context instanceof iy6) && (context instanceof Activity) && d((Activity) context)) {
                    sprig.b.b.sendLoggingEvent$default(bVar, "Activity (" + context + ") is already started and ready.", null, 0, 6, null);
                    a((Activity) context);
                    activity = (Activity) context;
                } else {
                    if (context instanceof Activity) {
                        sprig.b.b.sendLoggingEvent$default(bVar, "Activity provided but not yet resumed: " + context + ", lifecycleState=" + c((Activity) context), null, 0, 6, null);
                    } else {
                        sprig.b.b.sendLoggingEvent$default(bVar, "Non-activity context provided, will wait for activity lifecycle callbacks", null, 0, 6, null);
                    }
                    activity = null;
                }
            }
            if (activity != null) {
                sprig.b.b.sendLoggingEvent$default(bVar, "Notifying listeners of already-resumed activity: " + activity, null, 0, 6, null);
                INSTANCE.e(activity);
                c1eVar = c1e.a;
            }
            if (c1eVar == null) {
                sprig.b.b.sendLoggingEvent$default(bVar, "No activity to notify immediately, waiting for lifecycle callbacks", null, 0, 6, null);
            }
            sprig.b.b.sendLoggingEvent$default(bVar, "ActivityTracker.track() completed successfully", null, 0, 6, null);
        } catch (Exception e) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("EXCEPTION in ActivityTracker.track(): ", e.getClass().getSimpleName(), ": ", e.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    public final void e(Activity activity) {
        try {
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            sprig.b.b.sendLoggingEvent$default(bVar, "notifyActivityChanged called with activity: " + activity, null, 0, 6, null);
            CopyOnWriteArraySet<WeakReference> copyOnWriteArraySet = activityChangeListeners;
            sprig.b.b.sendLoggingEvent$default(bVar, "Notifying " + copyOnWriteArraySet.size() + " activity listeners", null, 1, 2, null);
            int i = 0;
            int i2 = 0;
            for (WeakReference weakReference : copyOnWriteArraySet) {
                sprig.j.a aVar = (sprig.j.a) weakReference.get();
                if (aVar != null) {
                    try {
                        aVar.onActivityChanged(activity);
                        i++;
                    } catch (Exception e) {
                        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, PqkdNGCEoxOKZk.uRqiiEmSbhj + e.getClass().getSimpleName() + ": " + e.getMessage(), SprigLoggingLevel.ERROR, 0, 4, null);
                    }
                } else {
                    i2++;
                    activityChangeListeners.remove(weakReference);
                }
            }
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Notified " + i + " activity listeners, removed " + i2 + " null refs", null, 0, 6, null);
        } catch (Exception e2) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("EXCEPTION in notifyActivityChanged: ", e2.getClass().getSimpleName(), ": ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    public final void a() {
        Iterator it2 = activityChangeListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            WeakReference weakReference = (WeakReference) it2.next();
            if (weakReference.get() == null) {
                activityChangeListeners.remove(weakReference);
            }
        }
    }

    public final void a(Activity activity) {
        synchronized (startedActivitiesLock) {
            LinkedList linkedList = startedActivities;
            bu1.S0(linkedList, new a(activity));
            linkedList.add(new WeakReference(activity));
        }
    }

    public final String a(j15 fragment) {
        return String.valueOf(fragment.O.d);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final vx6 c(Activity activity) {
        try {
            if (activity instanceof iy6) {
                return ((ky6) ((iy6) activity).getLifecycle()).d;
            }
            return null;
        } catch (Exception unused) {
            return null;
        }
    }

    public final List b(Activity activity) {
        Dialog dialog;
        Window window;
        View decorView;
        ArrayList arrayList = new ArrayList();
        if (activity instanceof m15) {
            m15 m15Var = (m15) activity;
            if (!m15Var.isDestroyed() && !m15Var.isFinishing()) {
                try {
                    g25 g25VarM = ((m15) activity).m();
                    if (!g25VarM.I && !g25VarM.N()) {
                        List<j15> listM = g25VarM.c.M();
                        listM.getClass();
                        for (j15 j15Var : listM) {
                            try {
                                if (j15Var.t() && !j15Var.A && !j15Var.l) {
                                    View view = null;
                                    if (j15Var instanceof dw0) {
                                        dialog = ((dw0) j15Var).x0;
                                    } else {
                                        dialog = j15Var instanceof fb3 ? ((fb3) j15Var).x0 : null;
                                    }
                                    if (dialog != null && dialog.isShowing() && dialog.getWindow() != null && (window = dialog.getWindow()) != null && (decorView = window.getDecorView()) != null) {
                                        if (decorView.isAttachedToWindow() && !decorView.isInLayout()) {
                                            view = decorView;
                                        }
                                        if (view != null) {
                                            arrayList.add(view);
                                        }
                                    }
                                }
                            } catch (Exception unused) {
                            }
                        }
                        try {
                            View currentActivityRootView = getCurrentActivityRootView();
                            if (currentActivityRootView != null && currentActivityRootView.isAttachedToWindow() && !currentActivityRootView.isInLayout()) {
                                INSTANCE.a(currentActivityRootView, arrayList);
                            }
                        } catch (Exception e) {
                            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Error traversing overlays: " + e.getMessage(), SprigLoggingLevel.ERROR, 0, 4, null);
                        }
                    }
                } catch (IllegalStateException unused2) {
                }
                return ey3.a;
            }
        }
        return arrayList;
    }
}
