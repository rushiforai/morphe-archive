package mg;

import com.google.android.gms.common.api.Status;

/* loaded from: classes3.dex */
public final class h extends b {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f76301b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j f76302c;

    public /* synthetic */ h(int i5, j jVar) {
        this.f76301b = i5;
        this.f76302c = jVar;
    }

    @Override // mg.b, mg.m
    public void B(Status status) {
        switch (this.f76301b) {
            case 0:
                ((i) this.f76302c).C(status);
                break;
            default:
                super.B(status);
                break;
        }
    }

    @Override // mg.b, mg.m
    public void z(Status status) {
        switch (this.f76301b) {
            case 1:
                ((i) this.f76302c).C(status);
                break;
            default:
                super.z(status);
                break;
        }
    }
}
