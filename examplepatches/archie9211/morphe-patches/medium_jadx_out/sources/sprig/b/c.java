package sprig.b;

import defpackage.bu1;
import defpackage.f25;
import defpackage.j15;
import defpackage.m15;
import defpackage.z15;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001d\u0010\t\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\r\u0010\u000b\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\u0003J\u0015\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\r\u0010\u000eJ\u001f\u0010\u0013\u001a\u00020\b2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0013\u0010\u0014R!\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000eø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0006\n\u0004\b\u0016\u0010\u0017R#\u0010\u001d\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00150\u00198\u0002X\u0082\u0004ø\u0001\u0000¢\u0006\u0006\n\u0004\b\u001b\u0010\u001cR!\u0010\u001f\u001a\u00020\u0015*\u00020\u00118BX\u0082\u0004ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u001eR#\u0010!\u001a\u0004\u0018\u00010\u0015*\u00020\u00068BX\u0082\u0004ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0006\u001a\u0004\b\u0016\u0010 \u0082\u0002\u000f\n\u0002\b\u0019\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\""}, d2 = {"Lsprig/b/c;", "Lz15;", "<init>", "()V", "", "event", "Lm15;", "activity", "Lc1e;", "registerEvent", "(Ljava/lang/String;Lm15;)V", "clearRegisteredEvents", "", "sameFragmentVisibleForEvent", "(Ljava/lang/String;)Z", "Lf25;", "fm", "Lj15;", "f", "onFragmentResumed", "(Lf25;Lj15;)V", "Lsprig/b/d;", "a", "Ljava/lang/String;", "currentFragment", "", "Lsprig/b/a;", "b", "Ljava/util/Map;", "fragmentForEvent", "(Lj15;)Ljava/lang/String;", "name", "(Lm15;)Ljava/lang/String;", "visibleFragmentName", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class c extends z15 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public static String currentFragment;
    public static final c INSTANCE = new c();

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public static final Map fragmentForEvent = new LinkedHashMap();

    private c() {
    }

    public final String a(m15 m15Var) {
        List listM = m15Var.m().c.M();
        listM.getClass();
        j15 j15Var = (j15) bu1.z0(listM);
        if (j15Var != null) {
            return a(j15Var);
        }
        return null;
    }

    public final void clearRegisteredEvents() {
        fragmentForEvent.clear();
    }

    @Override // defpackage.z15
    public void onFragmentResumed(f25 fm, j15 f) {
        fm.getClass();
        f.getClass();
        currentFragment = a(f);
    }

    public final void registerEvent(String event, m15 activity) {
        event.getClass();
        activity.getClass();
        String strA = a(activity);
        if (strA != null) {
            d dVar = (d) fragmentForEvent.put(a.m147boximpl(a.m148constructorimpl(event)), d.m154boximpl(strA));
            String strM160unboximpl = dVar != null ? dVar.m160unboximpl() : null;
            d dVarM154boximpl = strM160unboximpl != null ? d.m154boximpl(strM160unboximpl) : null;
            if (dVarM154boximpl != null) {
                dVarM154boximpl.m160unboximpl();
            }
        }
    }

    public final boolean sameFragmentVisibleForEvent(String event) {
        String str;
        event.getClass();
        d dVar = (d) fragmentForEvent.remove(a.m147boximpl(a.m148constructorimpl(event)));
        String strM160unboximpl = dVar != null ? dVar.m160unboximpl() : null;
        return strM160unboximpl == null || (str = currentFragment) == null || strM160unboximpl.equals(str);
    }

    public final String a(j15 j15Var) {
        String name = j15Var.y;
        if (name == null) {
            name = j15Var.getClass().getName();
        }
        return d.m155constructorimpl(name);
    }
}
