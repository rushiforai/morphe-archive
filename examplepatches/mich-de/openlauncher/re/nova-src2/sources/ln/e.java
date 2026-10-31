package ln;

import in.g;
import java.sql.Timestamp;
import java.util.Date;

/* loaded from: classes.dex */
public final class e extends g {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f75059c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(Class cls, int i5) {
        super(cls);
        this.f75059c = i5;
    }

    @Override // in.g
    public final Date a(Date date) {
        switch (this.f75059c) {
            case 0:
                return new java.sql.Date(date.getTime());
            default:
                return new Timestamp(date.getTime());
        }
    }
}
