package n00;

import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77546a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f77547b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f77548c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p6.t f77549d;

    public /* synthetic */ b(Function1 function1, e1 e1Var, p6.t tVar) {
        this.f77546a = 0;
        this.f77548c = function1;
        this.f77549d = tVar;
        this.f77547b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        ArrayList arrayList;
        Set setEntrySet;
        int i5 = this.f77546a;
        p6.t tVar = this.f77549d;
        Function1 function1 = this.f77548c;
        e1 e1Var = this.f77547b;
        switch (i5) {
            case 0:
                String str = f.f77555a;
                Map map = (Map) e1Var.getValue();
                if (map == null || (setEntrySet = map.entrySet()) == null) {
                    arrayList = null;
                } else {
                    ArrayList arrayList2 = new ArrayList();
                    for (Object obj : setEntrySet) {
                        if (((Boolean) ((Map.Entry) obj).getValue()).booleanValue()) {
                            arrayList2.add(obj);
                        }
                    }
                    arrayList = new ArrayList(b70.c.u0(arrayList2, 10));
                    Iterator it = arrayList2.iterator();
                    while (it.hasNext()) {
                        arrayList.add((SimpleBluetoothDevice) ((Map.Entry) it.next()).getKey());
                    }
                }
                if (arrayList != null && !arrayList.isEmpty()) {
                    function1.invoke(new ConditionModel.BluetoothConnectedModel(arrayList));
                    tVar.o();
                }
                break;
            case 1:
                function1.invoke(new ConditionModel.WeatherChangeModel(0L, ((Number) e1Var.getValue()).longValue()));
                tVar.o();
                break;
            default:
                function1.invoke(new ConditionModel.WifiConnectedModel((String) e1Var.getValue()));
                tVar.o();
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ b(e1 e1Var, Function1 function1, p6.t tVar, int i5) {
        this.f77546a = i5;
        this.f77547b = e1Var;
        this.f77548c = function1;
        this.f77549d = tVar;
    }
}
