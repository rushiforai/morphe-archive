package app.jimaku.extension.menu;

/** How subtitles would be made: from YouTube's captions, as a free translation of the cached transcript, or with minutes. */
public final class Plan {
    public enum Method { CAPTIONS, TRANSLATE, PREMIUM, NONE }

    /** What is missing where they can't be made. */
    public enum Why { NO_MINUTES, TOO_LONG, NO_CAPTIONS, SIGN_IN, LIVE }

    public final Method method;
    /** With {@link Method#PREMIUM}: the video's cost in minutes, or null while its length or the balance isn't known. */
    public final Long minutes;
    /** With {@link Method#NONE}: what is missing. */
    public final Why why;

    private Plan(Method method, Long minutes, Why why) {
        this.method = method;
        this.minutes = minutes;
        this.why = why;
    }

    static Plan captions() {
        return new Plan(Method.CAPTIONS, null, null);
    }

    static Plan translate() {
        return new Plan(Method.TRANSLATE, null, null);
    }

    static Plan premium(Long minutes) {
        return new Plan(Method.PREMIUM, minutes, null);
    }

    static Plan none(Why why) {
        return new Plan(Method.NONE, null, why);
    }

    @Override
    public String toString() {
        return method + (method == Method.PREMIUM ? " " + minutes : why != null ? " " + why : "");
    }
}
