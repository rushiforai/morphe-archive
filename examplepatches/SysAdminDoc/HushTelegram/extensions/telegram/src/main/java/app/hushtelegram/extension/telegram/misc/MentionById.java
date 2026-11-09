/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Mention by ID: {@code @123456789} or {@code tg://user?id=123456789} typed in the message box goes
 * out as a real mention of that person.
 *
 * <p>Telegram builds the message's entities from the box in one method, and the patch hands its answer
 * here just before it returns. For each ID in the text this asks the app's own user table for the
 * person. If the app has seen them, a mention entity over the typed text is added, built the way
 * Telegram builds one when you pick a name from its list. If it hasn't, the text goes out as typed
 * and a short toast says so, once for each ID, since Telegram asks again whenever a draft is saved.
 * The server won't take a mention of someone this account has no access
 * hash for, and the app only has one for people it has met (a chat, a group member list, a contact).
 * Nothing is looked up over the network.
 */
public final class MentionById {
    private MentionById() {}

    /** A user ID is at least five digits in practice, and usernames can't be only digits, so this can't be a handle. */
    private static final Pattern BY_AT = Pattern.compile("(?<![\\w@/])@(\\d{5,15})(?![\\w])");
    private static final Pattern BY_LINK = Pattern.compile("tg://user\\?id=(\\d{5,15})(?![\\w])");
    private static long lastUnknownId = -1;

    /** Finds Telegram's tables; a test swaps it. */
    interface Users {
        /** The input user for an ID the app has seen, or null when it hasn't. */
        Object inputUser(int account, long id) throws ReflectiveOperationException;
    }

    static volatile Users users = MentionById::telegramInputUser;
    static volatile Entities entities = new TelegramEntities();

    /** Builds and reads Telegram's entity objects; a test swaps it. */
    interface Entities {
        Object mention(Object inputUser, int offset, int length) throws ReflectiveOperationException;

        int offset(Object entity) throws ReflectiveOperationException;

        int length(Object entity) throws ReflectiveOperationException;
    }

    /**
     * Called with the entity list Telegram built for a message and returns the list to use. Never
     * throws: on any trouble the list comes back as it came in.
     *
     * @param controller the media controller whose method the patch hooks, which knows its account
     * @param message Telegram's one-element text array
     * @param list the entities so far, or null
     */
    public static ArrayList<Object> add(Object controller, Object message, Object list) {
        @SuppressWarnings("unchecked")
        ArrayList<Object> current = list instanceof ArrayList ? (ArrayList<Object>) list : null;
        try {
            if (!Utils.settingsReady() || !Settings.MENTION_BY_ID.get()) return current;
            if (!(message instanceof CharSequence[])) return current;
            CharSequence[] box = (CharSequence[]) message;
            if (box.length == 0 || box[0] == null || box[0].length() < 6) return current;
            String text = box[0].toString();
            List<int[]> spans = new ArrayList<>();
            List<Long> ids = new ArrayList<>();
            find(BY_AT.matcher(text), spans, ids);
            find(BY_LINK.matcher(text), spans, ids);
            if (spans.isEmpty()) return current;
            int account = Accounts.indexOf(controller);
            if (account < 0) return current;
            ArrayList<Object> result = current == null ? new ArrayList<>() : current;
            long unknown = -1;
            boolean added = false;
            for (int i = 0; i < spans.size(); i++) {
                int[] span = spans.get(i);
                if (overlaps(result, span[0], span[1])) continue;
                Object input = users.inputUser(account, ids.get(i));
                if (input == null) {
                    unknown = ids.get(i);
                    continue;
                }
                result.add(sortedPosition(result, span[0]), entities.mention(input, span[0], span[1]));
                added = true;
            }
            if (unknown >= 0) toast(unknown);
            if (added) HookStatus.invoked(FamilyNames.NORMAL_PASTE);
            return added || current != null ? result : current;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.NORMAL_PASTE, "mention by id", failure);
            return current;
        }
    }

    private static void find(Matcher matcher, List<int[]> spans, List<Long> ids) {
        while (matcher.find()) {
            try {
                ids.add(Long.parseLong(matcher.group(1)));
                spans.add(new int[] {matcher.start(), matcher.end() - matcher.start()});
            } catch (NumberFormatException tooBig) {
                // Fifteen digits always fit; this is a guard for a changed pattern.
            }
        }
    }

    private static boolean overlaps(List<Object> existing, int offset, int length) throws ReflectiveOperationException {
        for (Object entity : existing) {
            int start = entities.offset(entity);
            int end = start + entities.length(entity);
            if (offset < end && start < offset + length) return true;
        }
        return false;
    }

    private static int sortedPosition(List<Object> existing, int offset) throws ReflectiveOperationException {
        int at = 0;
        while (at < existing.size() && entities.offset(existing.get(at)) <= offset) at++;
        return at;
    }

    private static void toast(long id) {
        synchronized (MentionById.class) {
            if (id == lastUnknownId) return;
            lastUnknownId = id;
        }
        try {
            Utils.showToastShort(L10n.t("I haven't seen that person."));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.NORMAL_PASTE, "mention by id toast", failure);
        }
    }

    private static Object telegramInputUser(int account, long id) throws ReflectiveOperationException {
        Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
        Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
        if (instance == null) return null;
        Object user = HostNames.method(controller, "getUser", Long.class).invoke(instance, id);
        if (user == null) return null;
        Method input = null;
        for (Method each : controller.getMethods()) {
            if (HostNames.named(each, "getInputUser") && each.getParameterTypes().length == 1
                    && each.getParameterTypes()[0].isInstance(user)) {
                input = each;
                break;
            }
        }
        if (input == null) return null;
        Object made = input.invoke(instance, user);
        return made == null || made.getClass().getSimpleName().equals("TL_inputUserEmpty") ? null : made;
    }

    private static final class TelegramEntities implements Entities {
        private Field offset;
        private Field length;

        @Override public Object mention(Object inputUser, int start, int size) throws ReflectiveOperationException {
            Class<?> type = Class.forName("org.telegram.tgnet.TLRPC$TL_inputMessageEntityMentionName");
            Object entity = type.getConstructor().newInstance();
            HostNames.field(type, "user_id").set(entity, inputUser);
            HostNames.field(type, "offset").setInt(entity, start);
            HostNames.field(type, "length").setInt(entity, size);
            return entity;
        }

        @Override public int offset(Object entity) throws ReflectiveOperationException {
            if (offset == null) offset = HostNames.field(entity.getClass(), "offset");
            return offset.getInt(entity);
        }

        @Override public int length(Object entity) throws ReflectiveOperationException {
            if (length == null) length = HostNames.field(entity.getClass(), "length");
            return length.getInt(entity);
        }
    }
}
