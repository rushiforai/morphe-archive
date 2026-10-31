package b5;

import a5.k0;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: e, reason: collision with root package name */
    public static final d f17535e;

    /* renamed from: f, reason: collision with root package name */
    public static final d f17536f;

    /* renamed from: g, reason: collision with root package name */
    public static final d f17537g;

    /* renamed from: h, reason: collision with root package name */
    public static final d f17538h;

    /* renamed from: i, reason: collision with root package name */
    public static final d f17539i;

    /* renamed from: j, reason: collision with root package name */
    public static final d f17540j;

    /* renamed from: k, reason: collision with root package name */
    public static final d f17541k;

    /* renamed from: l, reason: collision with root package name */
    public static final d f17542l;

    /* renamed from: m, reason: collision with root package name */
    public static final d f17543m;
    public static final d n;
    public static final d o;

    /* renamed from: p, reason: collision with root package name */
    public static final d f17544p;

    /* renamed from: a, reason: collision with root package name */
    public final Object f17545a;

    /* renamed from: b, reason: collision with root package name */
    public final int f17546b;

    /* renamed from: c, reason: collision with root package name */
    public final Class f17547c;

    /* renamed from: d, reason: collision with root package name */
    public final q f17548d;

    static {
        new d(1, (String) null);
        new d(2, (String) null);
        new d(4, (String) null);
        new d(8, (String) null);
        f17535e = new d(16, (String) null);
        new d(32, (String) null);
        f17536f = new d(64, (String) null);
        f17537g = new d(128, (String) null);
        new d(j.class, 256);
        new d(j.class, EventBridgeChannel.QUEUE_CAPACITY);
        new d(k.class, 1024);
        new d(k.class, 2048);
        f17538h = new d(u1.FLAG_APPEARED_IN_PRE_LAYOUT, (String) null);
        f17539i = new d(UserMetadata.MAX_INTERNAL_KEY_SIZE, (String) null);
        new d(ReaderJsonLexerKt.BATCH_SIZE, (String) null);
        new d(SQLiteDatabase.OPEN_NOMUTEX, (String) null);
        new d(SQLiteDatabase.OPEN_FULLMUTEX, (String) null);
        new d(o.class, SQLiteDatabase.OPEN_SHAREDCACHE);
        f17540j = new d(SQLiteDatabase.OPEN_PRIVATECACHE, (String) null);
        f17541k = new d(524288, (String) null);
        f17542l = new d(1048576, (String) null);
        new d(p.class, 2097152);
        int i5 = Build.VERSION.SDK_INT;
        new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_ON_SCREEN, 16908342, null, null, null);
        new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_TO_POSITION, 16908343, null, null, m.class);
        f17543m = new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_UP, 16908344, null, null, null);
        n = new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_LEFT, 16908345, null, null, null);
        o = new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_DOWN, 16908346, null, null, null);
        f17544p = new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_RIGHT, 16908347, null, null, null);
        new d(i5 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_UP : null, 16908358, null, null, null);
        new d(i5 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_DOWN : null, 16908359, null, null, null);
        new d(i5 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_LEFT : null, 16908360, null, null, null);
        new d(i5 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_RIGHT : null, 16908361, null, null, null);
        new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_CONTEXT_CLICK, 16908348, null, null, null);
        new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS, 16908349, null, null, n.class);
        new d(AccessibilityNodeInfo.AccessibilityAction.ACTION_MOVE_WINDOW, 16908354, null, null, l.class);
        new d(i5 >= 28 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_TOOLTIP : null, 16908356, null, null, null);
        new d(i5 >= 28 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_HIDE_TOOLTIP : null, 16908357, null, null, null);
        new d(i5 >= 30 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PRESS_AND_HOLD : null, 16908362, null, null, null);
        new d(i5 >= 30 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_IME_ENTER : null, 16908372, null, null, null);
        new d(i5 >= 32 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_START : null, 16908373, null, null, null);
        new d(i5 >= 32 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_DROP : null, 16908374, null, null, null);
        new d(i5 >= 32 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_CANCEL : null, 16908375, null, null, null);
        new d(i5 >= 33 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_TEXT_SUGGESTIONS : null, 16908376, null, null, null);
        new d(i5 >= 34 ? k0.c() : null, 16908382, null, null, null);
    }

    public d(int i5, String str) {
        this(null, i5, str, null, null);
    }

    public final d a(q qVar) {
        return new d(null, this.f17546b, null, qVar, this.f17547c);
    }

    public final int b() {
        return ((AccessibilityNodeInfo.AccessibilityAction) this.f17545a).getId();
    }

    public final CharSequence c() {
        return ((AccessibilityNodeInfo.AccessibilityAction) this.f17545a).getLabel();
    }

    public final boolean d(View view) {
        q qVar = this.f17548d;
        if (qVar == null) {
            return false;
        }
        Class cls = this.f17547c;
        if (cls != null) {
            try {
                if (cls.getDeclaredConstructor(null).newInstance(null) == null) {
                    throw null;
                }
                throw new ClassCastException();
            } catch (Exception e3) {
                Log.e("A11yActionCompat", "Failed to execute command with argument class ViewCommandArgument: ".concat(cls.getName()), e3);
            }
        }
        return qVar.j(view);
    }

    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof d)) {
            return false;
        }
        Object obj2 = ((d) obj).f17545a;
        Object obj3 = this.f17545a;
        return obj3 == null ? obj2 == null : obj3.equals(obj2);
    }

    public final int hashCode() {
        Object obj = this.f17545a;
        if (obj != null) {
            return obj.hashCode();
        }
        return 0;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AccessibilityActionCompat: ");
        String strF = g.f(this.f17546b);
        if (strF.equals("ACTION_UNKNOWN") && c() != null) {
            strF = c().toString();
        }
        sb2.append(strF);
        return sb2.toString();
    }

    public d(Class cls, int i5) {
        this(null, i5, null, null, cls);
    }

    public d(Object obj, int i5, CharSequence charSequence, q qVar, Class cls) {
        this.f17546b = i5;
        this.f17548d = qVar;
        if (obj == null) {
            this.f17545a = new AccessibilityNodeInfo.AccessibilityAction(i5, charSequence);
        } else {
            this.f17545a = obj;
        }
        this.f17547c = cls;
    }
}
