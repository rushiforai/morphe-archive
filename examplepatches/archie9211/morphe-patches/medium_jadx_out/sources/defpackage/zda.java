package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zda extends b8 implements x45 {
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zda(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.h = i3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.h;
        c1e c1eVar = c1e.a;
        Object obj2 = this.a;
        switch (i) {
            case 0:
                ((lma) obj2).e((PublicationData) obj, false);
                break;
            default:
                ((o78) obj2).b((mrb) obj);
                break;
        }
        return c1eVar;
    }
}
