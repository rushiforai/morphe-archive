package g20;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import u10.e0;
import u10.p0;

/* loaded from: classes.dex */
public final class s implements s80.d, s80.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List f56984a;

    public s(List list) {
        this.f56984a = list;
    }

    @Override // s80.c
    public final s80.e a() {
        return s80.e.f86766b;
    }

    @Override // s80.c
    public final String d() {
        return "com.teslacoilsw.launcher:HeroCardsData";
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        List list = this.f56984a;
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (!(((e20.k) obj).f52041c instanceof p0)) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            e20.k kVar = (e20.k) it.next();
            e0 e0Var = kVar.f52041c;
            arrayList2.add(new ExternalLink(e0Var.f90373a, e0Var.a(), null, kVar.f52041c.b().toString(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, null, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE));
        }
        return arrayList2;
    }
}
