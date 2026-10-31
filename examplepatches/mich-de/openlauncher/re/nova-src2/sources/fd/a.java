package fd;

import com.facebook.ads.AudienceNetworkAds;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import x7.l;

/* loaded from: classes.dex */
public final class a implements AudienceNetworkAds.InitListener {

    /* renamed from: d, reason: collision with root package name */
    public static a f54659d;

    /* renamed from: a, reason: collision with root package name */
    public boolean f54660a = false;

    /* renamed from: b, reason: collision with root package name */
    public boolean f54661b = false;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f54662c = new ArrayList();

    @Override // com.facebook.ads.AudienceNetworkAds.InitListener
    public final void onInitialized(AudienceNetworkAds.InitResult initResult) {
        this.f54660a = false;
        this.f54661b = initResult.isSuccess();
        ArrayList arrayList = this.f54662c;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            b bVar = (b) it.next();
            if (initResult.isSuccess()) {
                ((l) bVar.f54663a).onInitializationSucceeded();
            } else {
                String message = initResult.getMessage();
                Intrinsics.g(message, "message");
                ((l) bVar.f54663a).onInitializationFailed(message);
            }
        }
        arrayList.clear();
    }
}
