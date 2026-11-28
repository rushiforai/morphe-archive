/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.hushgram.extension.shared.L10n;

/**
 * The text a list of chats is kept in, shared by the locked chats ({@link ChatLocks}) and the hidden
 * ones ({@link HiddenChats}), and what one account sees of it.
 *
 * <p>Each chat belongs to the account it was picked on, by the id Instagram's own session gives that
 * account, never by a name. A group two of your accounts are both in has the same thread id on each,
 * so a chat locked on one account stays as it was on the other. The text starts with {@link #HEADER},
 * then has a line for each chat: the account's id, a tab, the thread id, a tab, the name the chat had
 * on that account, and for a chat kept from before accounts were, a tab and the accounts that let it
 * go, separated by commas.
 *
 * <p>A list saved before accounts were kept has a line for each chat, its thread id, a tab and its
 * name, and nothing in it says whose chat it was. Each of those chats stays locked or hidden for every
 * account, its old name is never shown again (an account sees "Chat" and the end of its id), and it's
 * never handed to whichever account comes along first. An account that opens one of them while
 * signed in gets a line of its own for it, under the name it sees there, and one that takes it off
 * its list lets it go for that account alone. The old lines are rewritten only when the list next
 * changes, all in one write, so a write that fails or stops partway leaves the old list, which still
 * keeps every chat on it locked or hidden.
 *
 * <p>Reading never throws, and a line with no id is skipped. Nothing here changes a list: each change
 * answers a new one, or the same one when there's nothing to change.
 */
final class ChatList {
    /** The first line of a list that keeps each chat's account. */
    static final String HEADER = "#chats 2";

    /** One chat on a list. */
    static final class Row {
        /** The account the chat was picked on, or "" for a chat kept from before accounts were. */
        final String account;
        final String id;
        /** The name the chat had on that account, or "" when none was found. Never shown for an old chat. */
        final String name;
        /** For an old chat, the accounts that took it off their list. Empty for every other. */
        final Set<String> released;

        Row(String account, String id, String name, Set<String> released) {
            this.account = account;
            this.id = id;
            this.name = name;
            this.released = released;
        }

        /** A chat kept from before accounts were, which belongs to nobody. */
        boolean old() {
            return account.isEmpty();
        }

        /** The chat stays locked or hidden for [forAccount], or for anybody when the account isn't known. */
        boolean protects(@Nullable String forAccount) {
            if (forAccount == null) return true;
            return old() ? !released.contains(forAccount) : account.equals(forAccount);
        }
    }

    private ChatList() {
    }

    /** The chats in [text], oldest first, from either kind of list. */
    static List<Row> parse(@Nullable String text) {
        List<Row> rows = new ArrayList<>();
        if (text == null || text.isEmpty()) return rows;
        String[] lines = text.split("\n");
        boolean current = lines[0].trim().equals(HEADER);
        Set<String> seen = new HashSet<>();
        for (int at = current ? 1 : 0; at < lines.length; at++) {
            Row row = current ? line(lines[at]) : oldLine(lines[at]);
            if (row != null && seen.add(row.account + "\t" + row.id)) rows.add(row);
        }
        return rows;
    }

    /** A line of a list that keeps accounts: account, thread id, name, and the accounts that let an old chat go. */
    @Nullable
    private static Row line(String line) {
        String[] fields = line.split("\t", -1);
        if (fields.length < 2) return null;
        String id = fields[1].trim();
        if (id.isEmpty()) return null;
        String account = fields[0].trim();
        // A name that only stood in for the chat's name, kept before such names were left out, isn't one.
        String name = fields.length > 2 ? keptName(id, fields[2]) : "";
        Set<String> released = new LinkedHashSet<>();
        if (account.isEmpty() && fields.length > 3) {
            for (String each : fields[3].split(",")) {
                if (!each.trim().isEmpty()) released.add(each.trim());
            }
        }
        // An old chat's name is never kept, whatever the line says.
        return new Row(account, id, account.isEmpty() ? "" : name, Collections.unmodifiableSet(released));
    }

    /** A line of a list from before accounts were kept: the thread id, a tab and a name nobody sees again. */
    @Nullable
    private static Row oldLine(String line) {
        int tab = line.indexOf('\t');
        String id = (tab < 0 ? line : line.substring(0, tab)).trim();
        if (id.isEmpty()) return null;
        return new Row("", id, "", Collections.emptySet());
    }

    /** [rows] as the text they're kept in, or "" for none. */
    static String format(List<Row> rows) {
        if (rows.isEmpty()) return "";
        StringBuilder text = new StringBuilder(HEADER);
        for (Row row : rows) {
            text.append('\n').append(clean(row.account)).append('\t').append(clean(row.id)).append('\t')
                    .append(row.old() ? "" : clean(row.name));
            if (row.old() && !row.released.isEmpty()) text.append('\t').append(String.join(",", row.released));
        }
        return text.toString();
    }

    /** Some chat on [rows] with [id] stays locked or hidden for [account], or for anybody when it isn't known. */
    static boolean protects(List<Row> rows, @Nullable String account, String id) {
        if (id == null) return false;
        for (Row row : rows) {
            if (row.id.equals(id) && row.protects(account)) return true;
        }
        return false;
    }

    /** The thread ids [rows] keep locked or hidden for [account], every one when it isn't known. */
    static Set<String> ids(List<Row> rows, @Nullable String account) {
        Set<String> ids = new HashSet<>();
        for (Row row : rows) {
            if (row.protects(account)) ids.add(row.id);
        }
        return ids;
    }

    /**
     * What [account]'s list shows: its own chats under the names it found, and each old chat it
     * hasn't let go under "Chat" and the end of its id, oldest first, each chat once. Nothing for an
     * account that isn't known.
     */
    static List<ChatLocks.Chat> shown(List<Row> rows, @Nullable String account) {
        List<ChatLocks.Chat> chats = new ArrayList<>();
        if (account == null || account.isEmpty()) return chats;
        Set<String> own = new HashSet<>();
        for (Row row : rows) {
            if (row.account.equals(account)) own.add(row.id);
        }
        Set<String> listed = new HashSet<>();
        for (Row row : rows) {
            if (!row.protects(account) || (row.old() && own.contains(row.id)) || !listed.add(row.id)) continue;
            chats.add(new ChatLocks.Chat(row.id, row.old() || row.name.isEmpty() ? placeholder(row.id) : row.name));
        }
        return chats;
    }

    /** [rows] with [id] on [account]'s list, under [name], or renamed there when it is already. */
    static List<Row> added(List<Row> rows, String account, String id, @Nullable String name) {
        String kept = keptName(id, name);
        List<Row> changed = new ArrayList<>(rows.size() + 1);
        boolean found = false;
        for (Row row : rows) {
            if (row.account.equals(account) && row.id.equals(id)) {
                found = true;
                changed.add(new Row(account, id, kept, Collections.emptySet()));
            } else {
                changed.add(row);
            }
        }
        if (!found) changed.add(new Row(account, id, kept, Collections.emptySet()));
        return changed;
    }

    /**
     * [rows] with [id] off [account]'s list. An old chat with that id is let go for [account] alone
     * and stays for every other account.
     */
    static List<Row> removed(List<Row> rows, String account, String id) {
        List<Row> changed = new ArrayList<>(rows.size());
        boolean any = false;
        for (Row row : rows) {
            if (!row.id.equals(id)) {
                changed.add(row);
            } else if (row.account.equals(account)) {
                any = true;
            } else if (row.old() && !row.released.contains(account)) {
                Set<String> released = new LinkedHashSet<>(row.released);
                released.add(account);
                changed.add(new Row("", id, "", Collections.unmodifiableSet(released)));
                any = true;
            } else {
                changed.add(row);
            }
        }
        return any ? changed : rows;
    }

    /**
     * [rows] after [account], signed in, found its chat [id] under [name]: its own line takes the
     * name, and an old chat it hasn't let go gets a line of its own for [account] under that name,
     * right after the old one, so the chat keeps its place on the list. The old chat stays for every
     * other account. The same [rows] when there's nothing to change.
     */
    static List<Row> named(List<Row> rows, String account, String id, @Nullable String name) {
        String kept = keptName(id, name);
        if (kept.isEmpty()) return rows;
        int old = -1;
        for (int at = 0; at < rows.size(); at++) {
            Row row = rows.get(at);
            if (!row.id.equals(id)) continue;
            if (row.account.equals(account)) return kept.equals(row.name) ? rows : added(rows, account, id, kept);
            if (row.old() && row.protects(account)) old = at;
        }
        if (old < 0) return rows;
        List<Row> changed = new ArrayList<>(rows);
        changed.add(old + 1, new Row(account, id, kept, Collections.emptySet()));
        return changed;
    }

    /** The name kept for [id]: "" for none, or for one that only stands in for its name ({@link #standsIn}). */
    static String keptName(String id, @Nullable String name) {
        String kept = clean(name);
        return standsIn(id, kept) ? "" : kept;
    }

    /**
     * [name] only stands in for the name of the chat [id], so it's never kept and a real one found
     * later takes its place: one {@link #standsIn(String)} says so of, or "Chat" and the end of [id],
     * which is shown for a chat with no name anyway.
     */
    static boolean standsIn(String id, String name) {
        return standsIn(name) || name.equals(placeholder(id));
    }

    /**
     * [name], as {@link #clean} leaves it, isn't a chat's name: it's empty, or nothing but dots,
     * dashes or other marks, as a chat's header can show before the chat has loaded. A name with a
     * letter, a digit or an emoji in it is a name.
     */
    static boolean standsIn(String name) {
        if (name.isEmpty()) return true;
        for (int at = 0; at < name.length(); ) {
            int c = name.codePointAt(at);
            if (Character.isLetterOrDigit(c) || Character.getType(c) == Character.OTHER_SYMBOL) return false;
            at += Character.charCount(c);
        }
        return true;
    }

    static String clean(@Nullable String text) {
        return text == null ? "" : text.replace('\t', ' ').replace('\n', ' ').trim();
    }

    /** What a chat is called when its name was never found. */
    static String placeholder(String id) {
        String tail = id.length() > 4 ? id.substring(id.length() - 4) : id;
        return L10n.f("Chat %1$s", tail);
    }
}
