package w00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93514a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z f93515b;

    public /* synthetic */ g(z zVar, int i5) {
        this.f93514a = i5;
        this.f93515b = zVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f93514a) {
            case 0:
                p6.t.n(this.f93515b.a(), "Integrations", null, 6);
                break;
            case 1:
                p6.t.n(this.f93515b.a(), "ExternalSearchProviders", null, 6);
                break;
            case 2:
                p6.t.n(this.f93515b.a(), "SearchBarDesktop", null, 6);
                break;
            case 3:
                p6.t.n(this.f93515b.a(), "SearchBarDrawer", null, 6);
                break;
            default:
                p6.t.n(this.f93515b.a(), "SearchBarFeed", null, 6);
                break;
        }
        return Unit.f71706a;
    }
}
