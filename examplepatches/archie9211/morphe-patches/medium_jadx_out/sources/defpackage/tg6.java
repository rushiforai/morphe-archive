package defpackage;

import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class tg6 implements m45 {
    public final /* synthetic */ int a;
    public final int b;
    public final Object c;

    public /* synthetic */ tg6(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                Object obj2 = ((f41) obj).I().get(i2);
                obj2.getClass();
                return (r39) obj2;
            default:
                return (r39) ((List) obj).get(i2);
        }
    }
}
