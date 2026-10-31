package ii;

import com.google.android.gms.common.api.Status;
import og.i;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Object f61603a;

    /* renamed from: b, reason: collision with root package name */
    public final Status f61604b;

    public a(Object obj, Status status) {
        this.f61603a = obj;
        this.f61604b = status;
    }

    public final String toString() {
        i iVar = new i(this);
        iVar.c(this.f61604b, "status");
        iVar.c(this.f61603a, "result");
        return iVar.toString();
    }
}
