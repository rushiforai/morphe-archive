package f00;

import com.teslacoilsw.conditions.ConditionSetRecord;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53219a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ConditionModel.TimeOfDayDurationModel f53220b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ArrayList f53221c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f53222d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f53223e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ String f53224f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ e1 f53225g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f53226h;

    public /* synthetic */ a(ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel, DayOfWeek dayOfWeek, ArrayList arrayList, int i5, Function1 function1, String str, e1 e1Var) {
        this.f53220b = timeOfDayDurationModel;
        this.f53226h = dayOfWeek;
        this.f53221c = arrayList;
        this.f53222d = i5;
        this.f53223e = function1;
        this.f53224f = str;
        this.f53225g = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f53219a) {
            case 0:
                e1 e1Var = (e1) this.f53226h;
                ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel = this.f53220b;
                ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel2 = new ConditionModel.TimeOfDayDurationModel((LocalTime) obj, timeOfDayDurationModel.f45544c, timeOfDayDurationModel.f45545d);
                ArrayList arrayList = this.f53221c;
                arrayList.set(this.f53222d, timeOfDayDurationModel2);
                e1 e1Var2 = this.f53225g;
                List list = (List) e1Var2.getValue();
                ArrayList arrayList2 = new ArrayList();
                for (Object obj2 : list) {
                    if (!(((ConditionModel) obj2) instanceof ConditionModel.TimeOfDayDurationModel)) {
                        arrayList2.add(obj2);
                    }
                }
                e1Var2.setValue(b70.g.t1(arrayList, arrayList2));
                this.f53223e.invoke(new ConditionSetRecord(this.f53224f, (List) e1Var2.getValue()));
                e1Var.setValue(Boolean.FALSE);
                break;
            default:
                ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel3 = this.f53220b;
                long j11 = timeOfDayDurationModel3.f45544c;
                LocalTime localTime = timeOfDayDurationModel3.f45543b;
                List list2 = timeOfDayDurationModel3.f45545d;
                DayOfWeek dayOfWeek = (DayOfWeek) this.f53226h;
                ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel4 = ((Boolean) obj).booleanValue() ? new ConditionModel.TimeOfDayDurationModel(localTime, j11, b70.g.u1(list2, dayOfWeek)) : new ConditionModel.TimeOfDayDurationModel(localTime, j11, b70.g.p1(list2, dayOfWeek));
                ArrayList arrayList3 = this.f53221c;
                arrayList3.set(this.f53222d, timeOfDayDurationModel4);
                e1 e1Var3 = this.f53225g;
                List list3 = (List) e1Var3.getValue();
                ArrayList arrayList4 = new ArrayList();
                for (Object obj3 : list3) {
                    if (!(((ConditionModel) obj3) instanceof ConditionModel.TimeOfDayDurationModel)) {
                        arrayList4.add(obj3);
                    }
                }
                e1Var3.setValue(b70.g.t1(arrayList3, arrayList4));
                this.f53223e.invoke(new ConditionSetRecord(this.f53224f, (List) e1Var3.getValue()));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ a(ArrayList arrayList, int i5, ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel, Function1 function1, String str, e1 e1Var, e1 e1Var2) {
        this.f53221c = arrayList;
        this.f53222d = i5;
        this.f53220b = timeOfDayDurationModel;
        this.f53223e = function1;
        this.f53224f = str;
        this.f53225g = e1Var;
        this.f53226h = e1Var2;
    }
}
