package org.ungoogled.waze;

/** Answers the shared phone/car policy requirement before either UI is requested. */
public final class ConsentAnswers {
    private ConsentAnswers() {}

    public static Boolean answerModern(boolean required) {
        return answerModern(required, ConsentAnswers::acceptCurrentPolicy);
    }

    static boolean answerModern(boolean required, Runnable accept) {
        if (!required || !Customization.on("skipConsent")) return required;
        accept.run();
        return false;
    }

    /** Replaced by the patch with Waze's own current-policy acceptance implementation. */
    public static void acceptCurrentPolicy() {
        throw new IllegalStateException("Waze policy acceptance binding missing");
    }
}
