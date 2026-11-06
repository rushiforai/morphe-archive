import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

/**
 * Chat keywords: runs Rumble's live chat DTO getters, a real message entity and Compose's background
 * modifier through the extension, with the keyword settings on and off.
 */
public final class KeywordsProbe {
    private static final String CHAT = "io.github.jordanwoodson.extension.shared.rumble.RumbleChat";
    private static final String DTO = "com.rumble.network.dto.livechat.";

    public static void main(String[] args) {
        ProbeSupport.run("blocked words and users, learned username, mention and word highlights", KeywordsProbe::run);
    }

    private static void run() throws Exception {
        // Joining a chat signed in as user 42 ("Lurker"): the mapper passes "_u" + base 36.
        Method currentUserId = Class.forName(CHAT).getMethod("currentUserId", String.class);
        currentUserId.invoke(null, "_u" + Long.toString(42, 36));
        Object plain = message(1, 7, "hello there");
        Object spam = message(2, 7, "buy SPAM now");
        Object fromBob = message(3, 8, "hi");
        List<Object> messages = new ArrayList<>(List.of(plain, spam, fromBob));
        List<Object> users = List.of(user(7, "viewer"), user(8, "Bob"), user(42, "Lurker"));
        Class<?> initType = Class.forName(DTO + "LiveChatInitData");
        Object init = ProbeSupport.allocate(initType);
        ProbeSupport.set(init, "messages", messages);
        ProbeSupport.set(init, "users", users);
        Method history = ProbeSupport.method("rumble.chat.history_getter",
                "Lcom/rumble/network/dto/livechat/LiveChatInitData;->f()Ljava/util/List;");

        Object modifier = modifierCompanion();
        Method highlight = Class.forName(CHAT).getMethod("highlight", Object.class, Object.class);
        List<Object> empty = new ArrayList<>();
        ProbeSupport.set(init, "messages", empty);
        ProbeSupport.check(history.invoke(init) == empty, "empty history keeps its list");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Lurker")) != modifier,
                "empty join learns the signed-in identity");

        // An account change clears the name immediately. While keywords are off the hook doesn't read the
        // users list at all; the next update with keywords on learns the new account.
        currentUserId.invoke(null, "_u" + Long.toString(43, 36));
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Lurker")) == modifier,
                "account transition clears the previous identity");
        ProbeSupport.setting("chat_keywords", "false");
        ProbeSupport.set(init, "users", List.of(user(42, "Lurker"), user(43, "Second")));
        ProbeSupport.set(init, "messages", messages);
        ProbeSupport.check(history.invoke(init) == messages, "keywords-off join keeps its messages");
        ProbeSupport.setting("chat_keywords", "true");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Second")) == modifier,
                "keywords-off join must not read the users list");
        ProbeSupport.check(history.invoke(init) == messages, "keywords-on update keeps its messages");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Second")) != modifier,
                "keywords-on update learns the new account");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Lurker")) == modifier,
                "previous account no longer receives mention highlights");
        currentUserId.invoke(null, "_u" + Long.toString(42, 36));
        ProbeSupport.set(init, "users", users);

        // On by default with empty lists: nothing hidden.
        ProbeSupport.check(history.invoke(init) == messages, "empty lists hide nothing");
        ProbeSupport.setting("chat_blocked_words", "spam");
        ProbeSupport.setting("chat_blocked_users", "@bob");
        ProbeSupport.check(((List<?>) history.invoke(init)).equals(List.of(plain)), "blocked word and user hidden");
        ProbeSupport.setting("chat_keywords", "false");
        ProbeSupport.check(history.invoke(init) == messages, "keywords off hides nothing");
        ProbeSupport.setting("chat_keywords", "true");

        // Highlights, on a real entity (locator Ke.l: d = userName, f = message) and Compose's Modifier.
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hello there")) == modifier,
                "a plain message keeps Rumble's modifier");
        Object mention = highlight.invoke(null, modifier, entity("viewer", "hi @Lurker how are you"));
        ProbeSupport.check(mention != modifier && Class.forName("t1.o").isInstance(mention),
                "a mention of the learned username gets a background modifier");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("lurker", "hi @lurker")) == modifier,
                "your own messages aren't mentions");
        ProbeSupport.setting("chat_highlight_mentions", "false");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Lurker")) == modifier, "mentions off");
        ProbeSupport.setting("chat_highlight_words", "kekw, good game");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "GOOD GAME all")) != modifier,
                "highlight words, any case");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "kekwait")) == modifier, "whole words only");
        ProbeSupport.setting("chat_keywords", "false");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "good game")) == modifier, "off: no tint");

        // Signed out: the mapper passes no ID, and mentions stop.
        ProbeSupport.setting("chat_keywords", "true");
        ProbeSupport.setting("chat_highlight_mentions", "true");
        currentUserId.invoke(null, "");
        ProbeSupport.check(highlight.invoke(null, modifier, entity("viewer", "hi @Lurker")) == modifier,
                "no mentions once signed out");
    }

    private static Object message(long id, long userId, String text) throws Exception {
        Object message = ProbeSupport.allocate(Class.forName(DTO + "LiveChatMessage"));
        ProbeSupport.set(message, "id", id);
        ProbeSupport.set(message, "userId", userId);
        ProbeSupport.set(message, "text", text);
        return message;
    }

    private static Object user(long id, String name) throws Exception {
        Object user = ProbeSupport.allocate(Class.forName(DTO + "LiveChatUser"));
        ProbeSupport.set(user, "id", id);
        ProbeSupport.set(user, "userName", name);
        return user;
    }

    /** A message entity with its userName and message fields, as the chat patches found them. */
    private static Object entity(String userName, String text) throws Exception {
        Object entity = ProbeSupport.allocate(ProbeSupport.type("rumble.chat.entity", "LKe/l;"));
        ProbeSupport.set(entity, ProbeSupport.fieldName("rumble.chat.entity_user_name", "LKe/l;->d:Ljava/lang/String;"),
                userName);
        ProbeSupport.set(entity, ProbeSupport.fieldName("rumble.chat.entity_message", "LKe/l;->f:Ljava/lang/String;"), text);
        return entity;
    }

    /** Compose's Modifier (the message row's first parameter): the companion every modifier chain starts from. */
    private static Object modifierCompanion() throws Exception {
        Class<?> modifier = ProbeSupport.method("rumble.chat.message_row",
                "Lic/X;->d(Lt1/o;LKe/l;Ljava/util/Map;LKe/k;Lkotlin/jvm/functions/Function1;"
                        + "Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;"
                        + "Lkotlin/jvm/functions/Function1;LZ0/r;II)V").getParameterTypes()[0];
        for (Field field : modifier.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && modifier.isAssignableFrom(field.getType())) {
                field.setAccessible(true);
                return field.get(null);
            }
        }
        throw new AssertionError("no Modifier companion");
    }
}
