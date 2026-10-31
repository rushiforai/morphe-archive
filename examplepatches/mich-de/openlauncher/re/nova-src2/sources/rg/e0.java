package rg;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class e0 implements qg.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BasePendingResult f85887a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ og.i f85888b;

    public e0(og.i iVar, BasePendingResult basePendingResult) {
        this.f85887a = basePendingResult;
        Objects.requireNonNull(iVar);
        this.f85888b = iVar;
    }

    @Override // qg.j
    public final void a(Status status) {
        ((Map) this.f85888b.f80412b).remove(this.f85887a);
    }
}
