package com.medium.android.unsplash.data;

import defpackage.c1e;
import defpackage.f7e;
import defpackage.g65;
import defpackage.n92;
import defpackage.tqa;
import defpackage.zcb;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b`\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014J:\u0010\n\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\b0\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0005\u001a\u00020\u00042\b\b\u0001\u0010\u0006\u001a\u00020\u0004H§@¢\u0006\u0004\b\n\u0010\u000bJ>\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\f\u001a\u00020\u00022\b\b\u0001\u0010\u0005\u001a\u00020\u00042\b\b\u0001\u0010\u0006\u001a\u00020\u0004H§@¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0012\u001a\u00020\u00112\b\b\u0001\u0010\u0010\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0012\u0010\u0013¨\u0006\u0015À\u0006\u0003"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashApi;", "", "", "clientId", "", "page", "pageSize", "Lzcb;", "", "Lcom/medium/android/unsplash/data/UnsplashPhoto;", "loadPhotos", "(Ljava/lang/String;IILn92;)Ljava/lang/Object;", "query", "Lcom/medium/android/unsplash/data/SearchResponse;", "searchPhotos", "(Ljava/lang/String;Ljava/lang/String;IILn92;)Ljava/lang/Object;", "url", "Lc1e;", "trackDownload", "(Ljava/lang/String;Ln92;)Ljava/lang/Object;", "Companion", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public interface UnsplashApi {
    public static final String BASE_URL = "https://api.unsplash.com/";

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashApi$Companion;", "", "<init>", "()V", "BASE_URL", "", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();
        public static final String BASE_URL = "https://api.unsplash.com/";

        private Companion() {
        }
    }

    @g65("photos")
    Object loadPhotos(@tqa("client_id") String str, @tqa("page") int i, @tqa("per_page") int i2, n92<? super zcb<List<UnsplashPhoto>>> n92Var);

    @g65("search/photos")
    Object searchPhotos(@tqa("client_id") String str, @tqa("query") String str2, @tqa("page") int i, @tqa("per_page") int i2, n92<? super zcb<SearchResponse>> n92Var);

    @g65
    Object trackDownload(@f7e String str, n92<? super c1e> n92Var);
}
