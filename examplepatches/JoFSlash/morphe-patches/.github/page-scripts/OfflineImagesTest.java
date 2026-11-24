package app.jofslash.extension.quora;

/** Checks where the saved copy reader puts the pictures. Run by run.sh. */
public final class OfflineImagesTest {

    private static int failures;

    private static void at(String what, int got, int want) {
        if (got != want) {
            System.err.println("FAIL OfflineCopies.after: " + what + ": " + got + ", want " + want);
            failures++;
        }
    }

    public static void main(String[] args) {
        String text = "First paragraph here.\nSecond   paragraph\nwith a break.\nLast one.";
        at("after the first paragraph", OfflineCopies.after(text, "paragraph here.", 0), 21);
        at("spaces and breaks match a space", OfflineCopies.after(text, "Second paragraph with a", 0), 54);
        at("no text before it", OfflineCopies.after(text, "", 5), 5);
        at("text that isn't there", OfflineCopies.after(text, "Not in the text", 0), text.length());
        at("pieces joined with spaces", OfflineCopies.after("campaign trail.[1]\nNext", "trail. [ 1 ]", 0), 18);
        at("the same text as the picture before", OfflineCopies.after(text, "paragraph here.", 21), 21);
        if (failures > 0) System.exit(1);
        System.out.println("OfflineImages: ok");
    }
}
