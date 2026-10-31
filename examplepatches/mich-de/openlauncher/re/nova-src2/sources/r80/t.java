package r80;

import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes5.dex */
public final class t extends w {

    /* renamed from: c, reason: collision with root package name */
    public final String f85710c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(String key, String groupId, IdHash idHash) {
        super(idHash, null);
        Intrinsics.g(key, "key");
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(idHash, "idHash");
        this.f85710c = key;
    }

    public final String c() {
        return this.f85710c;
    }
}
