package app.twoeno.extension.untappd;

import app.twoeno.extension.shared.Logger;
import app.twoeno.extension.shared.Reflection;

/**
 * Filters sponsored items out of every JSON response from the Untappd API,
 * before the React Native code of the app receives it.
 */
@SuppressWarnings("unused")
public final class HideSponsoredContentPatch {
    private static final String FILTERED_HEADER = "X-2eno-Filtered";

    private HideSponsoredContentPatch() {
    }

    private static boolean isUntappdHost(String host) {
        return host.equals("untappd.com") || host.endsWith(".untappd.com");
    }

    /**
     * Injection point: return value of {@code okhttp3.internal.http.RealInterceptorChain.proceed(Request)}.
     *
     * @param response An {@code okhttp3.Response}.
     * @return The original response, or a copy with sponsored items removed from the body.
     */
    public static Object filterResponse(Object response) {
        if (response == null) return null;

        try {
            Class<?> responseClass = response.getClass();
            if (Reflection.findMethod(responseClass, "header", "java.lang.String")
                    .invoke(response, FILTERED_HEADER) != null) return response;
            // Compressed bodies are only seen if the app decompresses itself. Leave them alone.
            if (Reflection.findMethod(responseClass, "header", "java.lang.String")
                    .invoke(response, "Content-Encoding") != null) return response;

            Object request = Reflection.call(response, "request");
            Object url = Reflection.call(request, "url");
            String host = (String) Reflection.call(url, "host");
            if (host == null || !isUntappdHost(host)) return response;

            Object body = Reflection.call(response, "body");
            if (body == null) return response;
            Object contentType = Reflection.call(body, "contentType");
            if (contentType == null || !contentType.toString().contains("json")) return response;

            // Reading the body consumes it, so a new response must be built in any case.
            String json = (String) Reflection.call(body, "string");
            SponsoredFilter.Result result = SponsoredFilter.filter(json);
            if (result.removed > 0) {
                Logger.info("Removed " + result.removed + " sponsored item(s) from " + host);
            }

            ClassLoader classLoader = responseClass.getClassLoader();
            Class<?> responseBodyClass = Class.forName("okhttp3.ResponseBody", false, classLoader);
            Object newBody = Reflection.findMethod(responseBodyClass, "create", "okhttp3.MediaType", "java.lang.String")
                    .invoke(null, contentType, result.json);

            Object builder = Reflection.call(response, "newBuilder");
            Class<?> builderClass = builder.getClass();
            Reflection.findMethod(builderClass, "body", "okhttp3.ResponseBody").invoke(builder, newBody);
            Reflection.findMethod(builderClass, "header", "java.lang.String", "java.lang.String")
                    .invoke(builder, FILTERED_HEADER, "1");
            return Reflection.call(builder, "build");
        } catch (Throwable ex) {
            Logger.error("filterResponse failure", ex);
            return response;
        }
    }
}
