package h30;

import android.content.Context;
import android.net.Uri;
import java.net.URLDecoder;

/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public Context f59085a;

    public final j a(i iVar) {
        String[] strArrB = iVar.b();
        if (strArrB.length == 3) {
            return new j(this.f59085a, iVar, Uri.parse(URLDecoder.decode(strArrB[1])), URLDecoder.decode(strArrB[2]));
        }
        throw new RuntimeException("bad path: " + iVar);
    }
}
