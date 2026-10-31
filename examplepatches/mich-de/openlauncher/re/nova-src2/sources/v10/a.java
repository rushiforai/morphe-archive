package v10;

import android.content.Intent;
import b20.e;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import pp.r;
import pp.t;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91896a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f91897b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b f91898c;

    public /* synthetic */ a(e eVar, b bVar, int i5) {
        this.f91896a = i5;
        this.f91897b = eVar;
        this.f91898c = bVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f91896a) {
            case 0:
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setData(this.f91898c.f91902d);
                intent.setFlags(268468224);
                this.f91897b.i(intent, t.f82774c, null);
                break;
            default:
                Intent intent2 = new Intent("android.intent.action.SEND");
                intent2.putExtra("android.intent.extra.STREAM", this.f91898c.f91902d);
                intent2.setType("image/*");
                intent2.setFlags(268468224);
                this.f91897b.i(Intent.createChooser(intent2, null), r.f82773j, null);
                break;
        }
        return Unit.f71706a;
    }
}
