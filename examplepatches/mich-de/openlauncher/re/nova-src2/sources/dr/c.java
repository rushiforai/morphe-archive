package dr;

import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import org.json.JSONObject;
import r70.j;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49381a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ JSONObject f49382b;

    public /* synthetic */ c(JSONObject jSONObject, int i5) {
        this.f49381a = i5;
        this.f49382b = jSONObject;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String str = (String) obj;
        switch (this.f49381a) {
            case 0:
                return new Pair(str, this.f49382b.get(str).toString());
            default:
                return new Pair(Integer.valueOf(Integer.parseInt(j.F0(str, "image_", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false))), this.f49382b.getString(str));
        }
    }
}
