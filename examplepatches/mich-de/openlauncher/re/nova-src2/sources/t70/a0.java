package t70;

import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlinx.serialization.json.JsonBuilder;
import nova.branch.engage.sesame_lite.internal.stores.LinkStore;
import nova.branch.engage.sesame_lite.internal.stores.UsageStore;

/* loaded from: classes.dex */
public final /* synthetic */ class a0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88770a;

    public /* synthetic */ a0(int i5) {
        this.f88770a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f88770a) {
            case 0:
                CoroutineContext.Element element = (CoroutineContext.Element) obj;
                if (element instanceof c0) {
                    return (c0) element;
                }
                return null;
            case 1:
                ((JsonBuilder) obj).setIgnoreUnknownKeys(true);
                return Unit.f71706a;
            case 2:
                return Boolean.valueOf(LinkStore.onPostLoaded$lambda$1((Map.Entry) obj));
            case 3:
                return Boolean.valueOf(UsageStore.onPostLoaded$lambda$1((Map.Entry) obj));
            case 4:
                return new y1.d((Map) obj);
            case 5:
                return obj;
            case 6:
                synchronized (z1.k.f97943c) {
                    List list = z1.k.f97949i;
                    int size = list.size();
                    for (int i5 = 0; i5 < size; i5++) {
                        ((Function1) list.get(i5)).invoke(obj);
                    }
                }
                return Unit.f71706a;
            default:
                return Unit.f71706a;
        }
    }
}
