package app.pigfoot.camscanner;

/** Stateless compatibility policy. Never records diagnostics or changes a service host. */
public final class LoginApiPolicy {
    private LoginApiPolicy() {}
    public static String refreshLoginApis(String cached) {
        if (cached == null || cached.isEmpty() || cached.length() > 32768) return cached;
        try {
            Class<?> json = Class.forName("org.json.JSONObject");
            Object object = json.getConstructor(String.class).newInstance(cached);
            Object uapi = json.getMethod("opt", String.class).invoke(object, "UAPI");
            Object ret = json.getMethod("opt", String.class).invoke(object, "ret");
            Object err = json.getMethod("opt", String.class).invoke(object, "err");
            boolean knownError = ((Number) json.getMethod("length").invoke(object)).intValue() == 2 &&
                    err instanceof String && ret instanceof Number &&
                    ("101".equals(ret.toString()) || "515".equals(ret.toString()));
            return knownError || "https://api-cs-bak.intsig.net/user/cs".equals(uapi) ? null : cached;
        } catch (Throwable ignored) { return cached; }
    }
}
