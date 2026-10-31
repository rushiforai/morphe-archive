// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.chat;

import androidx.annotation.Nullable;

import java.util.regex.Pattern;

import io.github.joancomasfdz.extension.baconreader.settings.IncludedPatches;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * Reddit also sends each chat message to the inbox, as a private message titled "[direct chat room]". The Reddit
 * chat patch takes them out of the inbox and counts them next to Chat.
 */
public final class InboxChats {
    private static final Pattern SUBJECT = Pattern.compile("\\[[a-z ]*chat room]", Pattern.CASE_INSENSITIVE);

    private InboxChats() {
    }

    /** True while chat messages are kept apart from the inbox. */
    public static boolean separate() {
        return IncludedPatches.redditChat() && Settings.CHECK_CHAT_MESSAGES.get();
    }

    /** True for a chat message, while they're kept apart from the inbox. */
    public static boolean isChat(@Nullable String subject, boolean isComment) {
        return separate() && !isComment && subject != null && SUBJECT.matcher(subject.trim()).matches();
    }
}
