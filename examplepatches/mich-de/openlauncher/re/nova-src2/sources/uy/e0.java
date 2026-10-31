package uy;

import android.content.ComponentName;
import android.os.UserHandle;
import com.android.launcher3.shortcuts.ShortcutKey;
import java.util.Set;

/* loaded from: classes4.dex */
public final /* synthetic */ class e0 implements ya.v {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f91705b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f91706c;

    public /* synthetic */ e0(Object obj, int i5) {
        this.f91705b = i5;
        this.f91706c = obj;
    }

    @Override // ya.v
    public final boolean b(ga.e eVar, ComponentName componentName) {
        switch (this.f91705b) {
            case 0:
                return eVar.f57291c == ((f0) this.f91706c).f91710j;
            case 1:
                return eVar.o.equals((UserHandle) this.f91706c);
            case 2:
                return ((ya.r) this.f91706c).d(eVar.f57289a);
            default:
                return eVar.f57290b == 6 && ((Set) this.f91706c).contains(ShortcutKey.d(eVar.d(), eVar.o));
        }
    }
}
