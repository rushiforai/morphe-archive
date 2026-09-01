package sprig.g;

import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import java.net.URL;
import java.util.List;
import kotlin.Metadata;
import sprig.view.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b0\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0002\u0006\u0007¨\u0006\b"}, d2 = {"Lsprig/g/b;", "", "<init>", "()V", "a", "b", "Lsprig/g/b$a;", "Lsprig/g/b$b;", "userleap_release"}, k = 1, mv = {1, 8, 0})
public abstract class b {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\u0010\u0005\u001a\u00060\u0002j\u0002`\u0003¢\u0006\u0004\b\u0013\u0010\u0014J\r\u0010\u0004\u001a\u00060\u0002j\u0002`\u0003HÆ\u0003J\u0017\u0010\u0006\u001a\u00020\u00002\f\b\u0002\u0010\u0005\u001a\u00060\u0002j\u0002`\u0003HÆ\u0001J\t\u0010\b\u001a\u00020\u0007HÖ\u0001J\t\u0010\n\u001a\u00020\tHÖ\u0001J\u0013\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bHÖ\u0003R\u001b\u0010\u0005\u001a\u00060\u0002j\u0002`\u00038\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0015"}, d2 = {"Lsprig/g/b$a;", "Lsprig/g/b;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "component1", "exception", "copy", "", "toString", "", "hashCode", "", "other", "", "equals", "a", "Ljava/lang/Exception;", "getException", "()Ljava/lang/Exception;", "<init>", "(Ljava/lang/Exception;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class a extends b {

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

    public /* synthetic */ b(gy2 gy2Var) {
        this();
    }

    private b() {
    }

    /* JADX INFO: renamed from: sprig.g.b$b, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\u001a\u0010\u001bJ\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\u000f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0003J#\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0007\u001a\u00020\u00022\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001J\t\u0010\u000b\u001a\u00020\nHÖ\u0001J\t\u0010\r\u001a\u00020\fHÖ\u0001J\u0013\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eHÖ\u0003R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015R\u001d\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0016\u0010\u0017\u001a\u0004\b\u0018\u0010\u0019¨\u0006\u001c"}, d2 = {"Lsprig/g/b$b;", "Lsprig/g/b;", "Ljava/net/URL;", "component1", "", "Lsprig/d/b$a;", "component2", "localFileUrl", "eventDigest", "copy", "", "toString", "", "hashCode", "", "other", "", "equals", "a", "Ljava/net/URL;", "getLocalFileUrl", "()Ljava/net/URL;", "b", "Ljava/util/List;", "getEventDigest", "()Ljava/util/List;", "<init>", "(Ljava/net/URL;Ljava/util/List;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class C0022b extends b {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final URL localFileUrl;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final List eventDigest;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0022b(URL url, List<b.a> list) {
            super(null);
            url.getClass();
            list.getClass();
            this.localFileUrl = url;
            this.eventDigest = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ C0022b copy$default(C0022b c0022b, URL url, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                url = c0022b.localFileUrl;
            }
            if ((i & 2) != 0) {
                list = c0022b.eventDigest;
            }
            return c0022b.copy(url, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final URL getLocalFileUrl() {
            return this.localFileUrl;
        }

        public final List<b.a> component2() {
            return this.eventDigest;
        }

        public final C0022b copy(URL localFileUrl, List<b.a> eventDigest) {
            localFileUrl.getClass();
            eventDigest.getClass();
            return new C0022b(localFileUrl, eventDigest);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof C0022b)) {
                return false;
            }
            C0022b c0022b = (C0022b) other;
            return g76.L(this.localFileUrl, c0022b.localFileUrl) && g76.L(this.eventDigest, c0022b.eventDigest);
        }

        public final List<b.a> getEventDigest() {
            return this.eventDigest;
        }

        public final URL getLocalFileUrl() {
            return this.localFileUrl;
        }

        public int hashCode() {
            return this.eventDigest.hashCode() + (this.localFileUrl.hashCode() * 31);
        }

        public String toString() {
            return "Success(localFileUrl=" + this.localFileUrl + ", eventDigest=" + this.eventDigest + ")";
        }

        public /* synthetic */ C0022b(URL url, List list, int i, gy2 gy2Var) {
            this(url, (i & 2) != 0 ? ey3.a : list);
        }
    }
}
