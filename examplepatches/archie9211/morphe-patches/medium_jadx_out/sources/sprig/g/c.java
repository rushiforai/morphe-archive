package sprig.g;

import defpackage.g76;
import defpackage.gy2;
import java.net.URL;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b0\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0002\u0006\u0007¨\u0006\b"}, d2 = {"Lsprig/g/c;", "", "<init>", "()V", "a", "b", "Lsprig/g/c$a;", "Lsprig/g/c$b;", "userleap_release"}, k = 1, mv = {1, 8, 0})
public abstract class c {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\u0010\u0005\u001a\u00060\u0002j\u0002`\u0003¢\u0006\u0004\b\u0013\u0010\u0014J\r\u0010\u0004\u001a\u00060\u0002j\u0002`\u0003HÆ\u0003J\u0017\u0010\u0006\u001a\u00020\u00002\f\b\u0002\u0010\u0005\u001a\u00060\u0002j\u0002`\u0003HÆ\u0001J\t\u0010\b\u001a\u00020\u0007HÖ\u0001J\t\u0010\n\u001a\u00020\tHÖ\u0001J\u0013\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bHÖ\u0003R\u001b\u0010\u0005\u001a\u00060\u0002j\u0002`\u00038\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0015"}, d2 = {"Lsprig/g/c$a;", "Lsprig/g/c;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "component1", "exception", "copy", "", "toString", "", "hashCode", "", "other", "", "equals", "a", "Ljava/lang/Exception;", "getException", "()Ljava/lang/Exception;", "<init>", "(Ljava/lang/Exception;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class a extends c {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final Exception exception;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Exception exc) {
            super(null);
            exc.getClass();
            this.exception = exc;
        }

        public static /* synthetic */ a copy$default(a aVar, Exception exc, int i, Object obj) {
            if ((i & 1) != 0) {
                exc = aVar.exception;
            }
            return aVar.copy(exc);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Exception getException() {
            return this.exception;
        }

        public final a copy(Exception exception) {
            exception.getClass();
            return new a(exception);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof a) && g76.L(this.exception, ((a) other).exception);
        }

        public final Exception getException() {
            return this.exception;
        }

        public int hashCode() {
            return this.exception.hashCode();
        }

        public String toString() {
            return "Error(exception=" + this.exception + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\u0013\u0010\u0005\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0002HÆ\u0001J\t\u0010\u0007\u001a\u00020\u0006HÖ\u0001J\t\u0010\t\u001a\u00020\bHÖ\u0001J\u0013\u0010\r\u001a\u00020\f2\b\u0010\u000b\u001a\u0004\u0018\u00010\nHÖ\u0003R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u0010\u000f\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0014"}, d2 = {"Lsprig/g/c$b;", "Lsprig/g/c;", "Ljava/net/URL;", "component1", "localFileUrl", "copy", "", "toString", "", "hashCode", "", "other", "", "equals", "a", "Ljava/net/URL;", "getLocalFileUrl", "()Ljava/net/URL;", "<init>", "(Ljava/net/URL;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class b extends c {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final URL localFileUrl;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(URL url) {
            super(null);
            url.getClass();
            this.localFileUrl = url;
        }

        public static /* synthetic */ b copy$default(b bVar, URL url, int i, Object obj) {
            if ((i & 1) != 0) {
                url = bVar.localFileUrl;
            }
            return bVar.copy(url);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final URL getLocalFileUrl() {
            return this.localFileUrl;
        }

        public final b copy(URL localFileUrl) {
            localFileUrl.getClass();
            return new b(localFileUrl);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof b) && g76.L(this.localFileUrl, ((b) other).localFileUrl);
        }

        public final URL getLocalFileUrl() {
            return this.localFileUrl;
        }

        public int hashCode() {
            return this.localFileUrl.hashCode();
        }

        public String toString() {
            return "Success(localFileUrl=" + this.localFileUrl + ")";
        }
    }

    public /* synthetic */ c(gy2 gy2Var) {
        this();
    }

    private c() {
    }
}
