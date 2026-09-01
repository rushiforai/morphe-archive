package defpackage;

import com.medium.android.postpublishing.ui.TopicData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zod implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ eb8 b;
    public final /* synthetic */ TopicData c;

    public /* synthetic */ zod(eb8 eb8Var, TopicData topicData, int i) {
        this.a = i;
        this.b = eb8Var;
        this.c = topicData;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        TopicData topicData = this.c;
        eb8 eb8Var = this.b;
        switch (i) {
            case 0:
                eb8Var.invoke(topicData);
                break;
            default:
                eb8Var.invoke(topicData);
                break;
        }
        return c1eVar;
    }
}
