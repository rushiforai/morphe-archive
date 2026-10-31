package l50;

import com.google.android.gms.internal.consent_sdk.e0;
import io.ktor.utils.io.t;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import o50.q;
import o50.u;
import o50.v;
import t70.j0;

/* loaded from: classes.dex */
public abstract class b implements q, j0 {
    public abstract d50.b b();

    public abstract t c();

    public abstract v50.d d();

    public abstract v50.d e();

    public abstract v f();

    public abstract u g();

    public final String toString() {
        return "HttpResponse[" + e0.M(this).getUrl() + ", " + f() + AbstractJsonLexerKt.END_LIST;
    }
}
