package ip;

import fp.e;
import java.sql.Timestamp;
import java.util.Date;

/* loaded from: classes4.dex */
public final class b extends e {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f67953c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(Class cls, int i5) {
        super(cls);
        this.f67953c = i5;
    }

    @Override // fp.e
    public final Date a(Date date) {
        switch (this.f67953c) {
            case 0:
                return new java.sql.Date(date.getTime());
            default:
                return new Timestamp(date.getTime());
        }
    }
}
