package defpackage;

import com.medium.android.postpublishing.ui.TopicData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class jea implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ a1a b;
    public final /* synthetic */ l78 c;

    public /* synthetic */ jea(a1a a1aVar, l78 l78Var, int i) {
        this.a = i;
        this.b = a1aVar;
        this.c = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.c;
        a1a a1aVar = this.b;
        switch (i) {
            case 0:
                TopicData topicData = (TopicData) obj;
                topicData.getClass();
                l78Var.setValue("");
                a1aVar.Z((String) l78Var.getValue());
                wea weaVar = (wea) a1aVar.b;
                weaVar.getClass();
                sea seaVar = (sea) weaVar.e.a.getValue();
                if ((seaVar instanceof rea) && ((rea) seaVar).a.size() < 5) {
                    vx0.c0(f76.F(weaVar), null, null, new tea(weaVar, topicData, null, 0), 3);
                }
                break;
            default:
                String str = (String) obj;
                str.getClass();
                l78Var.setValue(str);
                a1aVar.Z(str);
                break;
        }
        return c1eVar;
    }
}
