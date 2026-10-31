package okhttp3.internal.connection;

import java.io.IOException;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lokhttp3/internal/connection/RouteException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "okhttp"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes.dex */
public final class RouteException extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final IOException f80489a;

    /* renamed from: b, reason: collision with root package name */
    public IOException f80490b;

    public RouteException(IOException iOException) {
        super(iOException);
        this.f80489a = iOException;
        this.f80490b = iOException;
    }
}
