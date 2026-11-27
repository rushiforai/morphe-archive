// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.websitepreview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.os.Looper;
import app.reseam.runtime.Export;
import com.bumptech.glide.f;
import com.bumptech.glide.g;
import h3.n;
import h3.o;
import h3.r;
import java.io.IOException;
import java.net.Proxy;
import java.net.ProxySelector;
import java.util.List;
import okhttp3.HttpUrl;

public final class WebsitePreviews {
    private static final String STOCK_PROXY = "https://ap.syncforreddit.com/image?url=";
    private static final String YOUTUBE_THUMBNAIL = "https://i.ytimg.com/vi/";

    private WebsitePreviews() {}

    @Export
    private static native boolean stockEligibility(String page);

    @Export
    private static native boolean isYouTube(String page);

    @Export
    private static native boolean isWebsiteLink(String page);

    @Export
    private static native Context appContext();

    @Export
    private static native boolean previewsEnabled();

    @Export
    public static boolean eligible(String page) {
        if (page == null) return false;
        if (isYouTube(page)) return stockEligibility(page);
        return previewsEnabled() && isWebsiteLink(page) && directAvailable(appContext());
    }

    private static boolean directAvailable(Context context) {
        ConnectivityManager connectivity = context == null ? null : context.getSystemService(ConnectivityManager.class);
        return connectivity != null && connectivity.getDefaultProxy() == null;
    }

    @Export
    public static void register(Context context, w2.e registry) {
        register(context, registry, WebsitePreviews::eligible, new PreviewClient());
    }

    interface Eligibility {
        boolean allows(String page);
    }

    static void register(Context context, w2.e registry, Eligibility eligibility, PreviewClient client) {
        Context application = context.getApplicationContext();
        registry.r(Page.class, Bitmap.class, new o<Page, Bitmap>() {
            @Override
            public void a() {}

            @Override
            public n<Page, Bitmap> b(r unused) {
                return new n<Page, Bitmap>() {
                    @Override
                    public n.a<Bitmap> a(Page page, int width, int height, a3.i options) {
                        return new n.a<>(new w3.d(page), new Fetcher(application, page, eligibility, client));
                    }

                    @Override
                    public boolean b(Page page) {
                        return true;
                    }
                };
            }
        });
    }

    @Export
    public static f<Drawable> load(g requests, String stockModel) {
        if (stockModel != null && stockModel.startsWith(YOUTUBE_THUMBNAIL)) return requests.x(stockModel);

        // Keep the stock AMP normalization and the URL string used by the layout code.
        HttpUrl url = stockModel != null && stockModel.startsWith(STOCK_PROXY)
                ? PreviewClient.url(stockModel.substring(STOCK_PROXY.length()), null)
                : null;
        // A cache hit would skip the fetcher's current account and proxy checks on rebind.
        return requests.w(url == null ? null : new Page(url)).h(d3.j.b).i0(true);
    }

    private static final class Page {
        final HttpUrl url;

        Page(HttpUrl url) {
            this.url = url;
        }
    }

    private static boolean allows(Context context, HttpUrl url) {
        if (!directAvailable(context)) return false;
        ProxySelector selector = ProxySelector.getDefault();
        if (selector == null) return true;
        List<Proxy> proxies = selector.select(url.uri());
        if (proxies == null) return false;
        for (Proxy proxy : proxies) {
            if (!Proxy.NO_PROXY.equals(proxy)) return false;
        }
        return true;
    }

    private static Bitmap decode(byte[] bytes) throws IOException {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        int width = options.outWidth;
        int height = options.outHeight;
        if (width < 1 || height < 1 || width > 8192 || height > 8192 || (long) width * height > 24_000_000) {
            throw new IOException("Unsupported website preview dimensions");
        }

        options.inJustDecodeBounds = false;
        options.inSampleSize = 1;
        while (Math.max(width, height) / options.inSampleSize > 1200) {
            options.inSampleSize *= 2;
        }
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (bitmap == null) throw new IOException("Website preview image could not be decoded");
        return bitmap;
    }

    private static final class Fetcher implements b3.d<Bitmap> {
        private final Context context;
        private final Page page;
        private final Eligibility eligibility;
        private final PreviewClient client;
        private final PreviewClient.RequestScope scope = new PreviewClient.RequestScope();

        Fetcher(Context context, Page page, Eligibility eligibility, PreviewClient client) {
            this.context = context;
            this.page = page;
            this.eligibility = eligibility;
            this.client = client;
        }

        @Override
        public Class<Bitmap> a() {
            return Bitmap.class;
        }

        @Override
        public void b() {}

        @Override
        public void cancel() {
            scope.cancel();
        }

        @Override
        public a3.a d() {
            return a3.a.b; // Glide's REMOTE data source.
        }

        private boolean stillAllowed(HttpUrl url) {
            return !scope.isCancelled() && eligibility.allows(page.url.toString()) && allows(context, url);
        }

        @Override
        public void e(w2.c priority, b3.d.a<? super Bitmap> callback) {
            Bitmap image = null;
            try {
                if (Looper.myLooper() == Looper.getMainLooper()) throw new IOException("Preview requires a worker");
                PreviewClient.FetchedImage<Bitmap> fetched =
                        client.fetch(page.url, this::stillAllowed, scope, WebsitePreviews::decode);
                image = fetched.image;
                // Access and proxy settings may have changed while the image was loading.
                if (!stillAllowed(page.url) || !allows(context, fetched.url)) {
                    throw new IOException("Website preview disabled");
                }
            } catch (IOException | RuntimeException ignored) {
                if (image != null) image.recycle();
                if (!scope.isCancelled()) callback.c(new IOException("Website preview unavailable"));
                return;
            }
            if (scope.isCancelled()) {
                image.recycle();
            } else {
                callback.f(image);
            }
        }
    }
}
