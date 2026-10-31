package a1;

import b10.b2;
import bn.x;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorkers;
import com.instabridge.ai.context.AiContextManager;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import e10.r;
import e10.y2;
import java.util.Calendar;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.StringSerializer;
import p1.m0;
import p1.z2;
import r10.p0;

/* loaded from: classes2.dex */
public final /* synthetic */ class m implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f102a;

    public /* synthetic */ m(int i5) {
        this.f102a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f102a) {
            case 0:
                m0 m0Var = n.f103a;
                return null;
            case 1:
                z2 z2Var = a2.j.f113a;
                return null;
            case 2:
                return Long.valueOf(Calendar.getInstance().getTimeInMillis());
            case 3:
                y2.f51877a.getClass();
                y2.Z0().i(Boolean.TRUE);
                return Unit.f71706a;
            case 4:
                return Unit.f71706a;
            case 5:
                int i5 = FirstRunActivityCompose.f45937s;
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 6:
                int i11 = FirstRunActivityCompose.f45937s;
                return androidx.compose.runtime.d.k(null);
            case 7:
                int i12 = FirstRunActivityCompose.f45937s;
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 8:
                int i13 = FirstRunActivityCompose.f45937s;
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 9:
                int i14 = FirstRunActivityCompose.f45937s;
                return androidx.compose.runtime.d.k(b2.f16584b);
            case 10:
                int i15 = FirstRunActivityCompose.f45937s;
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 11:
                int i16 = FirstRunActivityCompose.f45937s;
                return 2;
            case 12:
                int i17 = FirstRunActivityCompose.f45937s;
                return Unit.f71706a;
            case 13:
                return androidx.compose.runtime.d.k(Boolean.TRUE);
            case 14:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 15:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 16:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 17:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 18:
                y2.f51877a.getClass();
                return androidx.compose.runtime.d.k(Boolean.valueOf(((Set) y2.f1().l()).contains(p0.f85208e)));
            case 19:
                y2.f51877a.getClass();
                return androidx.compose.runtime.d.k(y2.o().l());
            case 20:
                y2.f51877a.getClass();
                return androidx.compose.runtime.d.k(((Set) y2.f1().l()).contains(p0.f85205b) ? r.f51775c : ((Set) y2.f1().l()).contains(p0.f85206c) ? r.f51776d : r.f51774b);
            case 21:
                return androidx.compose.runtime.d.k(y2.f51877a.K0().l());
            case 22:
                throw new IllegalStateException("CompositionLocal LocalSavedStateRegistryOwner not present");
            case 23:
                return new LinkedHashMapSerializer(StringSerializer.INSTANCE, x.f18307a);
            case 24:
                return Unit.f71706a;
            case 25:
                m0 m0Var2 = bw.c.f18653a;
                return bw.l.f18667a;
            case 26:
                return new bw.k();
            case 27:
                return CrashlyticsWorkers.Companion.checkBlockingThread$lambda$1();
            case 28:
                return Long.valueOf(System.currentTimeMillis());
            default:
                return AiContextManager.moshi_delegate$lambda$1();
        }
    }
}
