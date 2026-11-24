/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.fomo;

import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;

/**
 * Answers the placeholders the server sends in place of a blurred review, which accuse the reader of being a hacker
 * and end with the signature KangProdak: the reply goes under the first one of a label, after a divider. React Native builds the text of every label through one method, so the patch passes each result here.
 */
public final class DecoyText {
    /** The signature every variant of the placeholder ends with. */
    private static final String SIGNATURE = "KangProdak";
    private static final String REPLY =
            "\n---\nAmpun bang bukan hacker. Saya juga langganan beneran kok kalo lagi butuh :) TTD: KangPatch";

    private DecoyText() {
    }

    /**
     * Returns [text] with the reply added under the placeholder, in the style of the placeholder.
     *
     * @param text the text of a label
     * @return [text] itself when it holds no placeholder
     */
    public static Spannable replace(Spannable text) {
        // Most labels are short and none of them is the placeholder: look for its signature before doing anything else.
        int at = text == null ? -1 : TextUtils.indexOf(text, SIGNATURE);
        if (at < 0 || TextUtils.indexOf(text, "KangPatch") >= 0) return text;
        SpannableStringBuilder replaced = new SpannableStringBuilder(text);
        replaced.insert(at + SIGNATURE.length(), REPLY);
        return replaced;
    }
}
