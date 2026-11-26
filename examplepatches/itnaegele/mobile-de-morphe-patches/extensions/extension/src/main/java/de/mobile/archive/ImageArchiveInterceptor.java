package de.mobile.archive;

import java.io.IOException;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

public final class ImageArchiveInterceptor implements Interceptor {
    private static final MediaType JPEG_MEDIA_TYPE = MediaType.parse("image/jpeg");

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        ArchiveManager mgr = ArchiveManager.get();
        if (mgr == null || !mgr.getConfig().isEnabled() || !mgr.getConfig().isArchiveImages()) {
            return chain.proceed(request);
        }

        String urlStr = request.url().toString();
        String host = request.url().host();
        boolean isListingImage = host != null
                && (host.contains("classistatic.de") || host.contains("ebayimg.com") || host.contains("mobile.de"));
        if (!isListingImage) {
            return chain.proceed(request);
        }

        String imageKey = LocalArchiveStore.normalizeImageKey(urlStr);
        Response response = null;
        IOException networkError = null;
        try {
            response = chain.proceed(request);
        } catch (IOException e) {
            networkError = e;
        }

        if (response != null && response.isSuccessful()) {
            return response;
        }

        if (imageKey != null) {
            byte[] archivedBytes = mgr.loadImageBlocking(imageKey);
            if (archivedBytes != null && archivedBytes.length > 100) {
                if (response != null) response.close();
                return new Response.Builder()
                        .request(request)
                        .protocol(Protocol.HTTP_1_1)
                        .code(200)
                        .message("OK")
                        .header("Content-Type", "image/jpeg")
                        .header("X-Mobile-Archive-Image", "hit")
                        .body(ResponseBody.create(JPEG_MEDIA_TYPE, archivedBytes))
                        .build();
            }
        }

        if (networkError != null) {
            throw networkError;
        }
        return response;
    }
}
