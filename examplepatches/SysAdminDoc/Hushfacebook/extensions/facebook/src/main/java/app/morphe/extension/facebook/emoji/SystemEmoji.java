/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.emoji;

import android.graphics.Typeface;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Draws emoji with the phone's own emoji font instead of Meta's (asked for on the r/MorpheApp
 * thread: "use our device's system emojis instead of Meta's emojis").
 *
 * <p>Facebook doesn't turn emoji in text into images. It downloads Meta's emoji font,
 * FacebookEmoji.ttf, into an emoji_font folder and hands it out from one provider, which keeps
 * the name FacebookEmojiTypefaceProviderImpl as its log tag. The text pipeline behind posts,
 * comments, chats and the composers finds each run of emoji and gives it a TypefaceSpan (family
 * "FacebookEmoji") holding that typeface, an emoticon such as :) becomes a replacement span that
 * draws its emoji with it, and the emoji pickers draw their glyphs with it too. Each of them asks
 * the provider, and the provider is the only reader of the holders the font is loaded into.
 *
 * <p>{@link #typeface} runs first in the provider. While the switch is on it answers the phone's
 * default typeface, whose font fallback ends in the phone's emoji font (Noto Color Emoji on a
 * Pixel, Samsung's own on a Galaxy), so every span and picker draws the phone's emoji. Facebook's
 * own screenshot tests do much the same behind an end-to-end flag, with the file
 * /system/fonts/NotoColorEmoji.ttf, which misses a phone whose emoji font is another file.
 * Otherwise it answers null and the provider carries on as Facebook wrote it, so anything this
 * doesn't recognise draws Meta's emoji as before.
 *
 * <p>Reactions and stickers aren't text. They're images and animations of their own, so they
 * stay. A span already made keeps its typeface until its text is laid out again, and the quick
 * emoji picker keeps the first typeface it gets until Facebook restarts, which is why the switch
 * asks for a restart.
 */
public final class SystemEmoji {
    private static final String PROVIDER = "emoji typeface provider";

    private SystemEmoji() {
    }

    /**
     * The phone's default typeface while the switch is on, or null for Facebook's own emoji font.
     * Called first thing in Facebook's emoji typeface provider, from any thread that lays out text.
     */
    @Nullable
    public static Typeface typeface() {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_EMOJI);
            if (!Utils.settingsReady() || !Settings.USE_SYSTEM_EMOJI.get()) return null;
            HookStatus.bound(FamilyNames.SYSTEM_EMOJI, PROVIDER);
            return Typeface.DEFAULT;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_EMOJI, PROVIDER, failure);
            return null;
        }
    }
}
