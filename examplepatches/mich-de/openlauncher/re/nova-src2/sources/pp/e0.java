package pp;

import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PairSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@SerialName("SearchEvent")
@Serializable
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class e0 extends a0 {

    @NotNull
    public static final d0 Companion = new d0();

    /* renamed from: h, reason: collision with root package name */
    public static final KSerializer[] f82715h = {EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.SearchOpenMethod", f0.values()), new PairSerializer(EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.ResultType", b0.values()), IntSerializer.INSTANCE), null, null, null, null};

    /* renamed from: b, reason: collision with root package name */
    public final f0 f82716b;

    /* renamed from: c, reason: collision with root package name */
    public final Pair f82717c;

    /* renamed from: d, reason: collision with root package name */
    public final k f82718d;

    /* renamed from: e, reason: collision with root package name */
    public final int f82719e;

    /* renamed from: f, reason: collision with root package name */
    public final long f82720f;

    /* renamed from: g, reason: collision with root package name */
    public final long f82721g;

    public e0(f0 openMethod, Pair pair, k kVar, int i5, long j11, long j12) {
        Intrinsics.g(openMethod, "openMethod");
        this.f82716b = openMethod;
        this.f82717c = pair;
        this.f82718d = kVar;
        this.f82719e = i5;
        this.f82720f = j11;
        this.f82721g = j12;
    }

    public final k a() {
        return this.f82718d;
    }

    public final f0 b() {
        return this.f82716b;
    }

    public final Pair c() {
        return this.f82717c;
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        String str;
        String strName = this.f82716b.name();
        Pair pair = this.f82717c;
        if (pair != null) {
            str = "ResultClicked(" + pair.f71683a + ", position=" + pair.f71684b + ") ";
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
        }
        StringBuilder sb2 = new StringBuilder("SearchEvent(");
        sb2.append(strName);
        sb2.append(" ");
        sb2.append(str);
        sb2.append(this.f82718d);
        sb2.append(" queryLength=");
        sb2.append(this.f82719e);
        sb2.append(" duration=");
        return a2.c.i(this.f82720f, "ms)", sb2);
    }

    public /* synthetic */ e0(int i5, f0 f0Var, Pair pair, k kVar, int i11, long j11, long j12) {
        if (61 != (i5 & 61)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 61, c0.f82702a.getDescriptor());
        }
        this.f82716b = f0Var;
        if ((i5 & 2) == 0) {
            this.f82717c = null;
        } else {
            this.f82717c = pair;
        }
        this.f82718d = kVar;
        this.f82719e = i11;
        this.f82720f = j11;
        this.f82721g = j12;
    }
}
