/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.text.SpannableString;
import android.text.Spanned;

/** Asks {@link Spoilers} about a stand-in spoiler, which unpatched stubs can't recognize. */
public final class SpoilersForTests {
    private SpoilersForTests() {}

    private static final class Spoiler {}

    /** Whether text with a spoiler would be left uncovered. */
    public static boolean textUncovered() {
        SpannableString text = new SpannableString("the ending is sad");
        text.setSpan(new Spoiler(), 14, 17, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return Spoilers.skipText(null, text, span -> span instanceof Spoiler);
    }

    /** Whether media only its sender covered would be drawn uncovered. */
    public static boolean mediaUncovered() {
        return !Spoilers.covered(true, new Object(), message -> false);
    }
}
