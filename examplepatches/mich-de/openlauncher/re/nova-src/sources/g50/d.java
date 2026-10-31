package g50;

import java.net.HttpURLConnection;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import o50.p;

/* loaded from: classes.dex */
public final class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ boolean f57181a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ HttpURLConnection f57182b;

    public d(boolean z11, HttpURLConnection httpURLConnection) {
        this.f57181a = z11;
        this.f57182b = httpURLConnection;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        String key = (String) obj;
        String value = (String) obj2;
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        if (this.f57181a) {
            List list = p.f79582a;
            if (!key.equals("Content-Length")) {
                this.f57182b.addRequestProperty(key, value);
            }
        }
        return Unit.f71706a;
    }
}
