package w50;

import b.c0;
import h6.c1;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93785a;

    /* renamed from: b, reason: collision with root package name */
    public final String f93786b;

    public /* synthetic */ g(String str, int i5) {
        this.f93785a = i5;
        this.f93786b = str;
    }

    public final String toString() {
        switch (this.f93785a) {
            case 0:
                return c0.q(new StringBuilder("Phase('"), this.f93786b, "')");
            default:
                return c1.t(new StringBuilder("<"), this.f93786b, '>');
        }
    }
}
