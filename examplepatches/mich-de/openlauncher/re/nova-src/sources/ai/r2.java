package ai;

import ads_mobile_sdk.b6;
import android.content.pm.ShortcutInfo;
import android.view.View;
import com.google.android.gms.common.api.Scope;
import java.lang.reflect.Field;
import java.util.Comparator;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;
import kotlin.Pair;

/* loaded from: classes3.dex */
public final /* synthetic */ class r2 implements Comparator {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ r2 f13279b = new r2(0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ r2 f13280c = new r2(20);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13281a;

    public /* synthetic */ r2(int i5) {
        this.f13281a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f13281a) {
            case 0:
                return Long.compare(((Long) obj).longValue(), ((Long) obj2).longValue());
            case 1:
                return ((Comparable) obj).compareTo((Comparable) obj2);
            case 2:
                return ab.e0.t(obj != null ? obj.toString() : null, obj2 != null ? obj2.toString() : null);
            case 3:
                return ab.e0.t(obj != null ? obj.toString() : null, obj2 != null ? obj2.toString() : null);
            case 4:
                return ab.e0.t(obj != null ? obj.toString() : null, obj2 != null ? obj2.toString() : null);
            case 5:
                return ab.e0.t(String.valueOf(((Map.Entry) obj).getKey()), String.valueOf(((Map.Entry) obj2).getKey()));
            case 6:
                return ab.e0.t((String) ((Map.Entry) obj).getKey(), (String) ((Map.Entry) obj2).getKey());
            case 7:
                return ab.e0.t(Long.valueOf(((b6) obj).p()), Long.valueOf(((b6) obj2).p()));
            case 8:
                return ab.e0.t((Long) ((Pair) obj2).f71684b, (Long) ((Pair) obj).f71684b);
            case 9:
                return ab.e0.t(((Field) obj).getName(), ((Field) obj2).getName());
            case 10:
                return ((byte[]) obj).length - ((byte[]) obj2).length;
            case 11:
                return ((e4.f) obj).f52156b - ((e4.f) obj2).f52156b;
            case 12:
                return ((Comparable) obj).compareTo((Comparable) obj2);
            case 13:
                return ab.e0.t(Integer.valueOf(((ft.b) obj).f55908l), Integer.valueOf(((ft.b) obj2).f55908l));
            case 14:
                return ab.e0.t((Double) ((Pair) obj).f71684b, (Double) ((Pair) obj2).f71684b);
            case 15:
                return ab.e0.t(Long.valueOf(((jx.y) obj).f70431a), Long.valueOf(((jx.y) obj2).f70431a));
            case 16:
                ShortcutInfo shortcutInfo = (ShortcutInfo) obj;
                ShortcutInfo shortcutInfo2 = (ShortcutInfo) obj2;
                if (shortcutInfo.isDeclaredInManifest() && !shortcutInfo2.isDeclaredInManifest()) {
                    return -1;
                }
                if (shortcutInfo.isDeclaredInManifest() || !shortcutInfo2.isDeclaredInManifest()) {
                    return Integer.compare(shortcutInfo.getRank(), shortcutInfo2.getRank());
                }
                return 1;
            case 17:
                return ab.e0.t((Integer) ((Pair) obj).f71683a, (Integer) ((Pair) obj2).f71683a);
            case 18:
                WeakHashMap weakHashMap = a5.a1.f250a;
                float fG = a5.s0.g((View) obj);
                float fG2 = a5.s0.g((View) obj2);
                if (fG > fG2) {
                    return -1;
                }
                return fG < fG2 ? 1 : 0;
            case 19:
                x60.e eVar = (x60.e) obj2;
                dc0.b bVar = (dc0.b) ((x60.e) obj);
                String str = bVar.f49217a;
                if (str != null) {
                    dc0.b bVar2 = (dc0.b) eVar;
                    if (str.equals(bVar2.f49217a)) {
                        return bVar.toString().compareTo(bVar2.toString());
                    }
                }
                return bVar.toString().compareTo(((dc0.b) eVar).toString());
            case 20:
                return ((Scope) obj).f31805g.compareTo(((Scope) obj2).f31805g);
            case 21:
                return ((Scope) obj).f31805g.compareTo(((Scope) obj2).f31805g);
            case 22:
                Map.Entry entry = (Map.Entry) obj;
                Map.Entry entry2 = (Map.Entry) obj2;
                Objects.requireNonNull(entry);
                Objects.requireNonNull(entry2);
                Comparable comparable = (Comparable) entry.getKey();
                Comparable comparable2 = (Comparable) entry2.getKey();
                comparable.getClass();
                comparable2.getClass();
                return comparable.compareTo(comparable2);
            case 23:
                return ab.e0.t(((mt.j) obj).getKey(), ((mt.j) obj2).getKey());
            case 24:
                return ((mx.z) obj).f77281c.toString().toLowerCase(Locale.getDefault()).compareTo(((mx.z) obj2).f77281c.toString().toLowerCase(Locale.getDefault()));
            case 25:
                return ab.e0.t((Integer) ((Pair) obj).f71683a, (Integer) ((Pair) obj2).f71683a);
            case 26:
                return ab.e0.t(((n90.h) obj).f78048a, ((n90.h) obj2).f78048a);
            case 27:
                o9.y3 y3Var = (o9.y3) obj;
                o9.y3 y3Var2 = (o9.y3) obj2;
                boolean z11 = y3Var instanceof o9.c3;
                String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                String str3 = z11 ? ((o9.c3) y3Var).f79799f : y3Var instanceof o9.d3 ? ((o9.d3) y3Var).f79809d : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (y3Var2 instanceof o9.c3) {
                    str2 = ((o9.c3) y3Var2).f79799f;
                } else if (y3Var2 instanceof o9.d3) {
                    str2 = ((o9.d3) y3Var2).f79809d;
                }
                return str3.compareTo(str2.toString());
            default:
                return ((View) obj).getTop() - ((View) obj2).getTop();
        }
    }
}
