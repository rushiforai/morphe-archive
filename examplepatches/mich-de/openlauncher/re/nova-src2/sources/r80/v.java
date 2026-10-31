package r80;

import android.content.Intent;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;
import nova.branch.engage.sesame_lite.internal.Strs;

/* loaded from: classes5.dex */
public final class v extends w {

    /* renamed from: c, reason: collision with root package name */
    public final String f85715c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85716d;

    public /* synthetic */ v(String str, String str2, IdHash idHash) {
        this(str, str2, idHash, null);
    }

    public final Intent c() {
        Intent intentFromIntentUri = Strs.INSTANCE.fromIntentUri(this.f85715c);
        Intrinsics.d(intentFromIntentUri);
        String str = this.f85716d;
        if (str != null && this.f85717a.getType().a()) {
            intentFromIntentUri = intentFromIntentUri.setPackage(str);
        }
        Intrinsics.f(intentFromIntentUri, "let(...)");
        return intentFromIntentUri;
    }

    public final String d() {
        return this.f85715c;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(String str, String str2, IdHash idHash, String str3) {
        super(idHash, str3);
        Intrinsics.g(idHash, "idHash");
        this.f85715c = str;
        this.f85716d = str2;
    }
}
