package xyz.urro.transit;

/** Classifier checks against the exact Transit 6.3.5 native GO templates. */
public final class GoInstructionTest {
    private static int checks;
    private static void eq(Object want, Object got, String what) {
        checks++;
        if (want == null ? got != null : !want.equals(got)) throw new AssertionError(what + ": want " + want + " got " + got);
    }
    private static void kind(GoInstruction.Kind want, String text) { eq(want, GoInstruction.classify(text).kind, text); }
    public static void main(String[] args) {
        kind(GoInstruction.Kind.STOPS, "Get off in 3 stops");
        kind(GoInstruction.Kind.STOPS, "Get off in 29 stops at Example stop");
        kind(GoInstruction.Kind.STOPS, "<b>Get off in 1 stop</b> at <b>Example stop</b>");
        eq(29, GoInstruction.classify("Get off in 29 stops at Example stop").stops, "in-app stop count");
        kind(GoInstruction.Kind.OTHER, "Get off in 3 stops tomorrow");
        kind(GoInstruction.Kind.OTHER, "Get off in 3 stops at ");
        kind(GoInstruction.Kind.STOPS, "Get off in 1 stop");
        kind(GoInstruction.Kind.STOPS, "Stay onboard! Get off the bus in 4 stops");
        kind(GoInstruction.Kind.STOPS, "<color|5e7a82/c6c6ca>Get off in 2 stops</color>");
        kind(GoInstruction.Kind.NEXT, "Your stop is next!");
        kind(GoInstruction.Kind.CURRENT, "This is your stop!");
        kind(GoInstruction.Kind.CURRENT, "Approaching, Main St & 5th. This is your stop.");
        kind(GoInstruction.Kind.ABOARD, "Next stop: Main St");
        kind(GoInstruction.Kind.ABOARD, "At your stop");
        kind(GoInstruction.Kind.OTHER, "Walk to Main St");
        kind(GoInstruction.Kind.OTHER, "Board the 12 towards Downtown");
        kind(GoInstruction.Kind.OTHER, "Transit GO");
        kind(GoInstruction.Kind.OTHER, null);
        kind(GoInstruction.Kind.OTHER, "");
        eq(4, GoInstruction.classify("Stay onboard! Get off the bus in 4 stops").stops, "stops");
        eq("bus", GoInstruction.classify("Stay onboard! Get off the bus in 4 stops").vehicle, "vehicle");
        eq(null, GoInstruction.classify("Get off in 3 stops").vehicle, "no vehicle");
        eq(true, GoInstruction.classify("Your stop is next!").aboard(), "aboard");
        eq(false, GoInstruction.classify("Walk to Main St").aboard(), "not aboard");
        eq("OTHER", GoInstruction.shape("Walk to Main St"), "shape hides stop names");
        eq("STOPS:bus", GoInstruction.shape("Stay onboard! Get off the bus in 4 stops"), "shape");
        eq("Get bike in 4 stops", ReminderFormatter.render(true, ReminderFormatter.Event.STOPS, 4, null, "x"), "bike render");
        System.out.println("PASS GoInstructionTest " + checks + " checks");
    }
}
