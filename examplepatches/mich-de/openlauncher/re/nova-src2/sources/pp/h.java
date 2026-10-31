package pp;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@SerialName("CardUpdateEvent")
@Serializable
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class h extends a0 {

    @NotNull
    public static final f Companion = new f();

    /* renamed from: i, reason: collision with root package name */
    public static final KSerializer[] f82744i = {EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.CardUpdateEvent.CardType", e.values()), null, null, null, null, null, new ArrayListSerializer(EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.CardUpdateEvent.ConditionType", g.values()))};

    /* renamed from: b, reason: collision with root package name */
    public final e f82745b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f82746c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f82747d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f82748e;

    /* renamed from: f, reason: collision with root package name */
    public final int f82749f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f82750g;

    /* renamed from: h, reason: collision with root package name */
    public final List f82751h;

    public h(e eVar, boolean z11, boolean z12, boolean z13, int i5, boolean z14, ArrayList arrayList) {
        this.f82745b = eVar;
        this.f82746c = z11;
        this.f82747d = z12;
        this.f82748e = z13;
        this.f82749f = i5;
        this.f82750g = z14;
        this.f82751h = arrayList;
    }

    public final int[] a() {
        int iOrdinal = this.f82745b.ordinal();
        List list = this.f82751h;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(Integer.valueOf(((g) it.next()).f82743a));
        }
        Iterator it2 = arrayList.iterator();
        int iIntValue = 0;
        while (it2.hasNext()) {
            iIntValue += ((Number) it2.next()).intValue();
        }
        return new int[]{iOrdinal, this.f82746c, this.f82747d, this.f82748e, this.f82749f, this.f82750g, iIntValue};
    }

    public /* synthetic */ h(int i5, e eVar, boolean z11, boolean z12, boolean z13, int i11, boolean z14, List list) {
        if (127 != (i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE)) {
            PluginExceptionsKt.throwMissingFieldException(i5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, d.f82703a.getDescriptor());
        }
        this.f82745b = eVar;
        this.f82746c = z11;
        this.f82747d = z12;
        this.f82748e = z13;
        this.f82749f = i11;
        this.f82750g = z14;
        this.f82751h = list;
    }
}
