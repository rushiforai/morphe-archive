package app.yydarlinker.aicaptions;

import java.net.HttpURLConnection;
import java.net.URI;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * OpenAI Chat Completions compatible endpoints. No redirects, suffix-spoofing or protocol guessing.
 */
public final class ProviderEndpoint {
    /** Hosts whose OpenAI-compatible root is a plain {@code /v1}. */
    private static final Set<String> V1_HOSTS =
            new HashSet<>(
                    Arrays.asList(
                            "api.cerebras.ai",
                            "api.anthropic.com",
                            "api.minimax.io",
                            "api.minimaxi.com",
                            "api.openai.com",
                            "api.deepseek.com",
                            "api.siliconflow.cn",
                            "api.siliconflow.com",
                            "api.moonshot.cn",
                            "api.moonshot.ai",
                            "api.mistral.ai",
                            "api.x.ai",
                            "api.together.ai",
                            "api.together.xyz"));

    static boolean domain(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }

    static boolean ark(String host) {
        return host.matches("ark\\.[a-z0-9-]+\\.volces\\.com");
    }

    static String host(String base) {
        try {
            return URI.create(base).getHost().toLowerCase(Locale.ROOT);
        } catch (Exception e) {
            return "";
        }
    }

    static boolean bailian(String host) {
        return domain(host, "dashscope.aliyuncs.com")
                || domain(host, "dashscope-intl.aliyuncs.com")
                || domain(host, "dashscope-us.aliyuncs.com")
                || domain(host, "maas.aliyuncs.com");
    }

    public static String validate(String base) {
        try {
            URI u = URI.create(base == null ? "" : base.trim());
            String h = u.getHost();
            if (h == null
                    || !("https".equalsIgnoreCase(u.getScheme())
                            || "http".equalsIgnoreCase(u.getScheme()))
                    || u.getRawUserInfo() != null
                    || u.getRawFragment() != null) throw new IllegalArgumentException();
            String path = u.getPath();
            while (path.endsWith("/")) path = path.substring(0, path.length() - 1);
            if (path.endsWith("/messages")
                    || path.endsWith("/responses")
                    || path.contains(":generateContent")
                    || path.endsWith("/api/generate")
                    || path.endsWith("/api/chat")
                    || path.endsWith("/apps/anthropic"))
                throw new IllegalArgumentException(
                        "Use an OpenAI-compatible Chat Completions endpoint, not a native"
                                + " Messages/Responses/Generate endpoint");
            return u.toASCIIString();
        } catch (IllegalArgumentException invalid) {
            throw new IllegalArgumentException(
                    "Invalid API URL: use an HTTP(S) OpenAI-compatible base URL without credentials"
                            + " or fragments",
                    invalid);
        }
    }

    static String chat(String base) {
        return resolve(base, false);
    }

    public static String models(String base) {
        return resolve(base, true);
    }

    private static String resolve(String base, boolean models) {
        URI u = URI.create(validate(base));
        String h = host(base), path = u.getRawPath();
        while (path.endsWith("/")) path = path.substring(0, path.length() - 1);
        if (path.endsWith("/chat/completions")) path = path.substring(0, path.length() - 17);
        else if (path.endsWith("/models")) path = path.substring(0, path.length() - 7);
        else if (path.endsWith("/completions")) path = path.substring(0, path.length() - 12);
        if (path.isEmpty()) path = defaultPath(h);
        if (models && path.contains("/deployments/"))
            throw new IllegalArgumentException(
                    "Azure deployment URLs require a manually entered deployment name");
        return u.getScheme()
                + "://"
                + u.getRawAuthority()
                + path
                + (models ? "/models" : "/chat/completions")
                + (u.getRawQuery() == null ? "" : "?" + u.getRawQuery());
    }

    /** The API root a bare host implies; empty when the host is not a known provider. */
    private static String defaultPath(String h) {
        if (h.equals("coding.dashscope.aliyuncs.com")) return "/v1";
        if (bailian(h)) return "/compatible-mode/v1";
        if (h.equals("openrouter.ai")) return "/api/v1";
        if (h.equals("api.groq.com")) return "/openai/v1";
        if (h.equals("generativelanguage.googleapis.com")) return "/v1beta/openai";
        if (h.equals("open.bigmodel.cn")) return "/api/paas/v4";
        if (ark(h)) return "/api/v3";
        if (domain(h, "openai.azure.com") || domain(h, "services.ai.azure.com"))
            return "/openai/v1";
        if (h.equals("api.fireworks.ai")) return "/inference/v1";
        return V1_HOSTS.contains(h) ? "/v1" : "";
    }

    public static void authenticate(HttpURLConnection c, String base, String key) {
        String h = host(base);
        boolean azure = domain(h, "openai.azure.com") || domain(h, "services.ai.azure.com");
        c.setRequestProperty(azure ? "api-key" : "Authorization", azure ? key : "Bearer " + key);
    }
}
