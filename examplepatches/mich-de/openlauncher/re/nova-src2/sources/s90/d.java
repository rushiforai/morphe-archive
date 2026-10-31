package s90;

import android.net.http.HeaderBlock;
import java.util.List;
import java.util.Map;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes5.dex */
public final class d extends UrlResponseInfo.HeaderBlock {

    /* renamed from: a, reason: collision with root package name */
    public final HeaderBlock f86897a;

    public d(HeaderBlock headerBlock) {
        this.f86897a = headerBlock;
    }

    @Override // org.chromium.net.UrlResponseInfo.HeaderBlock
    public final List getAsList() {
        return this.f86897a.getAsList();
    }

    @Override // org.chromium.net.UrlResponseInfo.HeaderBlock
    public final Map getAsMap() {
        return this.f86897a.getAsMap();
    }
}
