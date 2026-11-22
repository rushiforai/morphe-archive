/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p;

import java.util.Locale;

/** 画面に出す文章を、端末の言語で日本語と英語から選ぶ。 */
public final class Text {
    private Text() {
    }

    public static boolean japanese() {
        return "ja".equals(Locale.getDefault().getLanguage());
    }

    public static String of(String japanese, String english) {
        return japanese() ? japanese : english;
    }
}
