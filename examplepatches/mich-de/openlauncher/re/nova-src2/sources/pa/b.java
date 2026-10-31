package pa;

import android.content.ComponentName;
import android.os.Process;
import com.android.launcher3.util.ComponentKey;
import ja.h;
import java.util.function.Function;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements Function {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82476a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f82477b;

    public /* synthetic */ b(e eVar, int i5) {
        this.f82476a = i5;
        this.f82477b = eVar;
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        switch (this.f82476a) {
            case 0:
                String str = (String) obj;
                e eVar = this.f82477b;
                eVar.getClass();
                try {
                    String[] strArrSplit = str.split("#");
                    return new ComponentKey(ComponentName.unflattenFromString(strArrSplit[0]), strArrSplit.length > 2 ? ((h) h.f69294h.h(eVar.f82482a)).e(Long.parseLong(strArrSplit[2])) : Process.myUserHandle());
                } catch (Exception unused) {
                    return null;
                }
            default:
                ComponentKey componentKey = (ComponentKey) obj;
                e eVar2 = this.f82477b;
                eVar2.getClass();
                return componentKey.f21251a.flattenToShortString() + "#" + ((h) h.f69294h.h(eVar2.f82482a)).d(componentKey.f21252b);
        }
    }
}
