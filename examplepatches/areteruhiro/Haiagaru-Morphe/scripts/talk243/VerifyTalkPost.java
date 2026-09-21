import app.morphe.extension.chmate.TalkPostCompatibility;

public class VerifyTalkPost {
    private static final RuntimeException FAILURE = new RuntimeException("original method invoked");

    public static Object generatedOuter(String input) {
        throw FAILURE;
    }

    public static Object fallback(boolean fail) {
        if (fail) throw FAILURE;
        return "fallback-result";
    }

    public static void main(String[] args) throws Throwable {
        o.setExtras.e = 42;
        var generatedPost = o.isAtLeastJellyBeanMR1.class.getMethod(
            "c", Object.class, String.class, String.class, long.class);
        Object generatedResult = TalkPostCompatibility.invoke(
            generatedPost, null, new Object[]{new Object(), "", "", 1L});
        if (!"generated-result".equals(generatedResult)) {
            throw new AssertionError("generated post result");
        }

        var generated = VerifyTalkPost.class.getMethod("generatedOuter", String.class);
        Object token = TalkPostCompatibility.invoke(generated, null, new Object[]{"body"});
        if (!"digest:body".equals(token)) throw new AssertionError("callable result");

        var fallback = VerifyTalkPost.class.getMethod("fallback", boolean.class);
        Object fallbackResult = TalkPostCompatibility.invoke(fallback, null, new Object[]{false});
        if (!"fallback-result".equals(fallbackResult)) throw new AssertionError("fallback result");
        try {
            TalkPostCompatibility.invoke(fallback, null, new Object[]{true});
            throw new AssertionError("fallback exception swallowed");
        } catch (RuntimeException error) {
            if (error != FAILURE) throw new AssertionError("fallback exception wrapped");
        }
        System.out.println("PASS: cache invalidation, integrity normalization, callable bypass and fallback");
    }
}
