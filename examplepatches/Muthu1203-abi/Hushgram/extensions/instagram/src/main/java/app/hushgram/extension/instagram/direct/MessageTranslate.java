/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.instagram.settings.SettingsStatus;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Translate in the menu you get when you hold a chat message with text. The row is added through the
 * same hooks as Copy link ({@link ChatButtonLinks}): Instagram's own card row model, so it looks and sits
 * like the other rows, and its tap comes back through the same dispatcher, told apart by {@link #PREFIX}.
 * The message's text is read with {@link ChatMessages#text}, which the Chat history tools patch fills in.
 *
 * <p>A tap hands the text to Google Translate's pop-up over the chat (the text selection Translate
 * action), so Instagram stays open under it. Without the Translate app the text opens in Google Translate
 * on the web, into {@link #TARGET}. HushGram itself sends the text nowhere: it only goes where the tap
 * hands it.
 *
 * <p>Both hooks fail open: off, paused, before the settings are read, with no text or on anything
 * thrown, the menu is Instagram's.
 */
public final class MessageTranslate {
    /** What a Translate row's text starts with, so its tap is told from the other rows. */
    static final String PREFIX = "hushgram:translate\n";

    /** The language Google Translate on the web translates into: Tamil. */
    static final String TARGET = "ta";

    static final String TRANSLATE_APP = "com.google.android.apps.translate";

    /** Icons tried for the row, in order. */
    static final String[] ICONS = {"instagram_translate_pano_outline_24", "instagram_globe_pano_outline_24"};

    /** The steps a throw is reported under, and what Hook status counts. */
    static final String ROWS = "translate row";
    static final String PICKED = "translate tap";
    static final String COUNT_ADDED = "Translate added";
    static final String COUNT_OPENED = "translation opened";

    private MessageTranslate() {
    }

    /**
     * Called with the menu rows {@link ChatButtonLinks#rows} answered and the held message. Answers a copy
     * with a Translate row at the end when the switch is on and the message has text, else [rows]. Never throws.
     */
    @Nullable
    static List<?> rows(@Nullable List<?> rows, Object message) {
        try {
            if (message == null || !switchedOn()) return rows;
            HookStatus.invoked(FamilyNames.TRANSLATE_MESSAGES);
            if (!ChatMessages.isMessage(message)) return rows;
            String text = ChatMessages.text(message);
            if (text == null || text.trim().isEmpty()) return rows;
            Object row = ChatButtonLinks.row(L10n.t("Translate"), icon(Utils.getContext()), PREFIX + text);
            if (row == null) return rows;
            List<Object> out = rows == null ? new ArrayList<>() : new ArrayList<>(rows);
            out.add(row);
            HookStatus.counted(FamilyNames.TRANSLATE_MESSAGES, COUNT_ADDED);
            return out;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TRANSLATE_MESSAGES, ROWS, failure);
            return rows;
        }
    }

    /**
     * Called first from {@link ChatButtonLinks#picked} with the chat's activity and the tapped row's text.
     * True when the row is a Translate row, which this then handles. Never throws.
     */
    static boolean picked(@Nullable Activity activity, @Nullable String payload) {
        if (payload == null || !payload.startsWith(PREFIX)) return false;
        try {
            String text = payload.substring(PREFIX.length()).trim();
            Context context = activity != null ? activity : Utils.getContext();
            if (text.isEmpty() || context == null) return true;
            open(context, text);
            HookStatus.counted(FamilyNames.TRANSLATE_MESSAGES, COUNT_OPENED);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TRANSLATE_MESSAGES, PICKED, failure);
        }
        return true;
    }

    /** Google Translate's pop-up when the app is there, else Google Translate on the web. */
    private static void open(Context context, String text) {
        Intent popup = new Intent(Intent.ACTION_PROCESS_TEXT)
                .setType("text/plain")
                .setPackage(TRANSLATE_APP)
                .putExtra(Intent.EXTRA_PROCESS_TEXT, text)
                .putExtra(Intent.EXTRA_PROCESS_TEXT_READONLY, true);
        if (!(context instanceof Activity)) popup.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(popup);
            return;
        } catch (ActivityNotFoundException | SecurityException noApp) {
            // No Translate app: the web page instead.
        }
        Intent web = new Intent(Intent.ACTION_VIEW, webLink(text));
        if (!(context instanceof Activity)) web.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(web);
        } catch (ActivityNotFoundException noBrowser) {
            Utils.showToastShort(L10n.t(context, "No app can translate this"));
        }
    }

    /** Google Translate on the web with [text], from any language into {@link #TARGET}. */
    static Uri webLink(String text) {
        return Uri.parse("https://translate.google.com/").buildUpon()
                .appendQueryParameter("sl", "auto")
                .appendQueryParameter("tl", TARGET)
                .appendQueryParameter("op", "translate")
                .appendQueryParameter("text", text)
                .build();
    }

    @Nullable
    private static Integer icon(@Nullable Context context) {
        if (context == null) return null;
        try {
            Resources resources = context.getResources();
            String owner = Utils.resourcePackage(context);
            for (String name : ICONS) {
                int id = resources.getIdentifier(name, "drawable", owner);
                if (id != 0) return id;
            }
        } catch (Throwable ignored) {
            // No icon: the row shows without one.
        }
        return null;
    }

    /** Whether the switch is on: the patch is in, and on, and not while paused or before the settings are read. */
    static boolean switchedOn() {
        return SettingsStatus.translateMessages() && Utils.settingsReady() && Settings.TRANSLATE_MESSAGES.get();
    }
}
