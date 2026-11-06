package com.openbubbles.wear.patch;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;

import com.localob.messaging.app.service.BackendForegroundService;
import com.localob.messaging.app.service.BackendState;
import com.localob.messaging.app.LocalObApplication;
import com.localob.messaging.app.messaging.AndroidContactsRepository;
import com.localob.messaging.app.notifications.ChatNotifications;
import com.localob.messaging.backend.contacts.Contact;
import com.localob.messaging.backend.db.Attachment;
import com.localob.messaging.backend.db.Chat_;
import com.localob.messaging.backend.db.Database;
import com.localob.messaging.backend.db.Message_;
import com.localob.messaging.backend.domain.BackendService;
import com.localob.messaging.backend.domain.AssociatedMessage;
import com.localob.messaging.backend.domain.Chat;
import com.localob.messaging.backend.domain.ContentRun;
import com.localob.messaging.backend.domain.DeliveryState;
import com.localob.messaging.backend.domain.Message;
import com.localob.messaging.backend.domain.MessageContent;
import com.localob.messaging.backend.domain.MessageRef;
import com.localob.messaging.backend.domain.ReactionKind;
import com.localob.messaging.backend.domain.RunFormat;

import io.objectbox.query.Query;
import io.objectbox.query.QueryCondition;
import io.objectbox.query.QueryBuilder;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.regex.Pattern;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;

/**
 * Backend operations behind the Wear IPC service. Every method runs on the
 * service's worker thread, so waiting for a coroutine continuation is safe.
 */
final class BridgeOps {
    static final String PATCH_VERSION = "2.0.0";
    static final int API_VERSION = 1;

    private static final String TAG = "OBWearPatch";
    private static final long OP_TIMEOUT_MS = 20_000L;
    private static final int DEFAULT_CHAT_LIMIT = 80;
    private static final int MAX_CHAT_LIMIT = 200;
    private static final int MAX_CHAT_OFFSET = 5000;
    private static final int DEFAULT_MESSAGE_LIMIT = 80;
    private static final int MAX_MESSAGE_LIMIT = 240;
    private static final int MAX_REACTION_EVENTS = 256;
    static final int MAX_TEXT_LENGTH = 800;
    static final int MAX_COLLECTION_CHARS = 120_000;
    private static final int MAX_PARTICIPANTS = 32;
    private static volatile AndroidContactsRepository contacts;

    private static final Pattern CHAT_GUID = Pattern.compile("^(iMessage|SMS|RCS);[+-];[^;\\s\\p{Cntrl}]{1,512}$");
    private static final Pattern NATIVE_CHAT_GUID = Pattern.compile(
            "(?i)^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$");
    private static final Pattern NATIVE_GROUP_GUID = Pattern.compile("(?i)^(?:[0-9a-f]{64}|[0-9a-f]{72})$");
    private static final Pattern CHAT_IDENTIFIER = Pattern.compile("(?i)^chat[_-]?[0-9a-f-]{5,}$");
    private static final Pattern PHONE = Pattern.compile("\\+?[0-9 ().-]+");
    private static final Pattern EMAIL = Pattern.compile(
            "[A-Z0-9.!#$%&'*+/=^_`{|}~-]{1,64}@[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?(?:\\.[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?)+",
            Pattern.CASE_INSENSITIVE);

    private BridgeOps() {
    }

    static void initializeNames(Context context) {
        try {
            Context app = context.getApplicationContext();
            if (app instanceof LocalObApplication) contacts = ((LocalObApplication) app).getContacts();
        } catch (Throwable ignored) { }
    }

    private static ChatNames names() {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        return new ChatNames(address -> {
            AndroidContactsRepository repository = contacts;
            if (repository == null) return null;
            long remaining = TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
            if (remaining <= 0) {
                Contact cached = repository.peek(address);
                return cached == null ? null : cached.getDisplayName();
            }
            Contact found = (Contact) Await.await(continuation -> repository.resolve(address, continuation), remaining);
            return found == null ? null : found.getDisplayName();
        });
    }

    static JSONObject status(Context context) throws Exception {
        JSONObject out = baseResponse(null);
        BackendState state = null;
        try {
            state = BackendForegroundService.Companion.getState().getValue();
        } catch (Throwable t) {
            Log.w(TAG, "Backend state unavailable", t);
        }
        out.put("ok", true);
        out.put("ready", state instanceof BackendState.Ready);
        out.put("backendState", state == null ? "Unavailable" : bounded(state.getClass().getSimpleName(), 80));
        out.put("appVersion", bounded(appVersion(context), 80));
        out.put("patchVersion", PATCH_VERSION);
        return out;
    }

    static JSONObject chats(JSONObject request) throws Exception {
        JSONObject out = baseResponse(request.optString("requestId", null));
        BackendService backend = backend();
        if (backend == null) return notReady(out);
        int limit = clamp(request.optInt("limit", DEFAULT_CHAT_LIMIT), 1, MAX_CHAT_LIMIT);
        int offset = clamp(request.optInt("offset", 0), 0, MAX_CHAT_OFFSET);
        List<com.localob.messaging.backend.db.Chat> entities = Database.INSTANCE.getChats().getAll();
        List<JSONObject> chats = new ArrayList<>();
        int deleted = 0;
        int routingStubs = 0;
        int invalidGuids = 0;
        int unreadableRows = 0;
        for (com.localob.messaging.backend.db.Chat chat : entities) {
            try {
                if (chat.getDateDeleted() != null) {
                    deleted++;
                    continue;
                }
                if (chat.isRoutingStub()) {
                    routingStubs++;
                    continue;
                }
                if (!validChatGuid(chat.getGuid())) {
                    invalidGuids++;
                    continue;
                }
                chats.add(chatJson(chat));
            } catch (Throwable t) {
                unreadableRows++;
            }
        }
        if (deleted + routingStubs + invalidGuids + unreadableRows > 0) {
            Log.w(TAG, "Skipped chat rows: deleted=" + deleted + ", routing-stub=" + routingStubs +
                    ", invalid-guid=" + invalidGuids + ", unreadable=" + unreadableRows);
        }
        Collections.sort(chats, (left, right) -> {
            int byActivity = Long.compare(right.optLong("lastTimestamp", 0L), left.optLong("lastTimestamp", 0L));
            return byActivity != 0 ? byActivity : left.optString("id").compareTo(right.optString("id"));
        });
        JSONArray array = new JSONArray();
        ChatNames names = names();
        int chars = 0;
        int end = Math.min(chats.size(), offset + limit);
        int index = Math.min(offset, chats.size());
        for (; index < end; index++) {
            JSONObject chat = chats.get(index);
            names.apply(chat);
            chars += chat.toString().length() + 1;
            if (chars > MAX_COLLECTION_CHARS) break;
            array.put(chat);
        }
        out.put("ok", true);
        out.put("offset", offset);
        if (index < chats.size()) out.put("nextOffset", offset + array.length());
        out.put("chats", array);
        return out;
    }

    static JSONObject thread(JSONObject request) throws Exception {
        String requestId = request.optString("requestId", null);
        JSONObject out = baseResponse(requestId);
        BackendService backend = backend();
        if (backend == null) return notReady(out);
        int limit = clamp(request.optInt("limit", DEFAULT_MESSAGE_LIMIT), 1, MAX_MESSAGE_LIMIT);
        try {
            Chat chat = resolve(backend,
                    request.optString("threadId", null),
                    request.optString("address", null), false);
            if (chat == null) {
                out.put("ok", false);
                out.put("error", "Conversation not found.");
                return out;
            }
            out.put("ok", true);
            out.put("thread", threadJson(chat, limit));
        } catch (Throwable t) {
            return failure(out, t);
        }
        return out;
    }

    static JSONObject send(JSONObject request) throws Exception {
        return send(backend(), request);
    }

    static JSONObject send(BackendService backend, JSONObject request) throws Exception {
        JSONObject out = baseResponse(request.optString("requestId", null));
        if (backend == null) return notReady(out);
        String text = request.optString("text", "").trim();
        if (text.isEmpty()) {
            out.put("ok", false);
            out.put("error", "The message is empty.");
            return out;
        }
        if (text.length() > MAX_TEXT_LENGTH) {
            out.put("ok", false);
            out.put("error", "The message is too long (maximum 800 characters).");
            return out;
        }
        Chat chat;
        Message message;
        Message replyTarget = null;
        MessageRef replyRef = null;
        String guid;
        try {
            boolean quotes = request.has("replyToMessageId") && !request.isNull("replyToMessageId");
            String requestedReplyId = quotes ? request.optString("replyToMessageId", null) : null;
            int requestedReplyPart = request.optInt("replyToPartIndex", 0);
            String requestedThread = request.optString("threadId", null);
            if (quotes && (blank(requestedReplyId) || requestedReplyId.length() > 512 || hasControl(requestedReplyId) ||
                    requestedReplyPart < 0 || requestedReplyPart > 1024 || guidFromThreadId(requestedThread) == null)) {
                out.put("ok", false);
                out.put("error", "Choose a message in an existing conversation to reply to.");
                return out;
            }
            chat = resolve(backend, requestedThread, quotes ? null : request.optString("address", null), !quotes);
            if (chat == null) {
                out.put("ok", false);
                out.put("error", guidFromThreadId(requestedThread) != null
                        ? "Conversation not found. Refresh your conversations."
                        : "Enter a phone number or email address, like +15551234567 or name@example.com.");
                return out;
            }
            if (quotes) {
                if (!chat.isIMessage()) {
                    out.put("ok", false);
                    out.put("error", "Replies are unavailable for this conversation.");
                    return out;
                }
                replyTarget = (Message) Await.await(
                        continuation -> chat.messageById(requestedReplyId, continuation), OP_TIMEOUT_MS);
                if (!isMessageTarget(replyTarget, chat.getGuid())) {
                    out.put("ok", false);
                    out.put("error", "The quoted message is unavailable in this conversation.");
                    return out;
                }
                replyRef = resolveReplyReference(replyTarget, requestedReplyPart);
                if (replyRef == null || blank(replyRef.getMessageId()) || replyRef.getMessageId().length() > 512) {
                    out.put("ok", false);
                    out.put("error", "The quoted message is unavailable in this conversation.");
                    return out;
                }
            }
            MessageContent content = new MessageContent(
                    Collections.singletonList(new ContentRun.Text(text, RunFormat.Companion.getPlain())),
                    Collections.emptyList(),
                    null, replyRef, null, null, false);
            guid = chat.getGuid();
            if (!validChatGuid(guid)) throw new IllegalStateException("Invalid backend conversation ID.");
            message = (Message) Await.await(
                    continuation -> chat.send(content, null, continuation), OP_TIMEOUT_MS);
        } catch (Throwable t) {
            return failure(out, t);
        }
        // Once send returns, refresh errors must never invite a duplicate send.
        out.put("ok", true);
        out.put("threadId", guid);
        try {
            com.localob.messaging.backend.db.Chat chatEntity = findChatEntity(guid);
            JSONObject sentMessage = messageJson(message, names(), new JSONArray(), chatEntity);
            if (sentMessage != null && replyRef != null) {
                sentMessage.put("replyTo", replyReferenceJson(chatEntity, replyRef, names()));
                if (chatEntity != null && supportsReactions(chatEntity)) sentMessage.put("canReply", true);
            }
            out.put("message", sentMessage);
        } catch (Throwable t) {
            Log.w(TAG, "Sent message could not be serialized", t);
            out.put("historyUnavailable", true);
        }
        try {
            out.put("thread", threadJson(chat, DEFAULT_MESSAGE_LIMIT));
        } catch (Throwable t) {
            Log.w(TAG, "Message sent; history refresh unavailable", t);
            out.put("historyUnavailable", true);
        }
        return out;
    }

    static JSONObject markRead(Context context, JSONObject request) throws Exception {
        return markRead(context, backend(), request);
    }

    static JSONObject markRead(Context context, BackendService backend, JSONObject request) throws Exception {
        JSONObject out = baseResponse(request.optString("requestId", null));
        if (backend == null) return notReady(out);
        try {
            Chat chat = resolve(backend,
                    request.optString("threadId", null),
                    request.optString("address", null), false);
            if (chat == null) {
                out.put("ok", false);
                out.put("error", "Conversation not found.");
                return out;
            }
            boolean read = request.optBoolean("read", true);
            Await.await(continuation -> chat.markRead(read, continuation), OP_TIMEOUT_MS);
            if (read) Await.await(continuation -> ChatNotifications.INSTANCE.clear(
                    context, backend, chat.getGuid(), continuation), OP_TIMEOUT_MS);
            out.put("ok", true);
            out.put("threadId", chat.getGuid());
        } catch (Throwable t) {
            return failure(out, t);
        }
        return out;
    }

    static JSONObject react(JSONObject request) throws Exception {
        return react(backend(), request);
    }

    static JSONObject react(BackendService backend, JSONObject request) throws Exception {
        JSONObject out = baseResponse(request.optString("requestId", null));
        if (backend == null) return notReady(out);
        Chat chat;
        com.localob.messaging.backend.db.Message target;
        com.localob.messaging.backend.db.Chat chatEntity;
        List<com.localob.messaging.backend.db.Message> reactionRows;
        ReactionKind.Standard reaction = reactionKind(request.optString("reaction", ""));
        int partIndex = request.optInt("partIndex", 0);
        if (reaction == null || partIndex < 0 || partIndex > 1024) {
            out.put("ok", false);
            out.put("error", "Choose one of the supported reactions and a valid message part.");
            return out;
        }
        try {
            chat = resolve(backend, request.optString("threadId", null), null, false);
            if (chat == null) {
                out.put("ok", false);
                out.put("error", "Reactions are unavailable for this conversation.");
                return out;
            }
            String messageId = request.optString("messageId", null);
            if (blank(messageId) || messageId.length() > 512 || hasControl(messageId)) {
                out.put("ok", false);
                out.put("error", "Message not found.");
                return out;
            }
            try (Query<com.localob.messaging.backend.db.Chat> query = Database.INSTANCE.getChats()
                    .query().equal(Chat_.guid, chat.getGuid(), QueryBuilder.StringOrder.CASE_SENSITIVE).build()) {
                chatEntity = query.findUnique();
            }
            if (chatEntity == null) {
                out.put("ok", false);
                out.put("error", "Conversation not found.");
                return out;
            }
            if (!supportsReactions(chatEntity)) {
                out.put("ok", false);
                out.put("error", "Reactions are unavailable for this conversation.");
                return out;
            }
            try (Query<com.localob.messaging.backend.db.Message> query = Database.INSTANCE.getMessages()
                    .query().equal(Message_.chatId, chatEntity.getId())
                    .equal(Message_.guid, messageId, QueryBuilder.StringOrder.CASE_SENSITIVE).build()) {
                target = query.findUnique();
            }
            if (!isReactableTarget(target, chat.getGuid())) {
                out.put("ok", false);
                out.put("error", "Message not found or reactions are unavailable.");
                return out;
            }
            reactionRows = reactionRows(chatEntity, Collections.singletonList(target.getGuid()));
            applyReaction(target, reactionRows, reaction, partIndex, request.optBoolean("remove", false));
        } catch (Throwable t) {
            return failure(out, t);
        }

        // The native mutation is acknowledged. Serialization failures must not invite a duplicate reaction.
        out.put("ok", true);
        out.put("threadId", chat.getGuid());
        try {
            reactionRows = reactionRows(chatEntity, Collections.singletonList(target.getGuid()));
            JSONObject updated = messageJson(target, names(), summarizeReactions(target.getGuid(), reactionRows), chatEntity);
            if (updated != null) updated.put("replyCount", replyCounts(chatEntity).getOrDefault(target.getGuid(), 0));
            out.put("message", updated);
        } catch (Throwable t) {
            Log.w(TAG, "Reaction updated; message refresh unavailable", t);
            out.put("historyUnavailable", true);
        }
        try {
            out.put("thread", threadJson(chat, DEFAULT_MESSAGE_LIMIT));
        } catch (Throwable t) {
            Log.w(TAG, "Reaction updated; history refresh unavailable", t);
            out.put("historyUnavailable", true);
        }
        return out;
    }

    static JSONObject reactionEvents(JSONObject request) throws Exception {
        JSONObject out = baseResponse(request.optString("requestId", null));
        BackendService backend = backend();
        if (backend == null) return notReady(out);
        JSONArray events = new JSONArray();
        ChatNames chatNames = names();
        try (Query<com.localob.messaging.backend.db.Message> query = Database.INSTANCE.getMessages().query()
                .notNull(Message_.associatedMessageType)
                .orderDesc(Message_.dateCreated).build()) {
            for (com.localob.messaging.backend.db.Message row : query.find(0, MAX_REACTION_EVENTS)) {
                if (row.getDateDeleted() != null || !Boolean.FALSE.equals(row.isFromMe()) ||
                        !row.getReactionEnabled()) continue;
                String id = row.getGuid();
                String targetGuid = row.getTargetGuid();
                String sender = row.getSender();
                Date created = row.getDateCreated();
                if (blank(id) || blank(targetGuid) || created == null || created.getTime() <= 0)
                    continue;
                com.localob.messaging.backend.db.Chat chat = row.getChat() == null ? null : row.getChat().getTarget();
                if (!supportsReactions(chat) || !chat.getGuid().equals(row.getChatGuid())) continue;
                // ObjectBox fills mute fields after constructing the entity's flow.
                chat.refreshMuted();
                boolean muted = Boolean.TRUE.equals(chat.isMutedFlow().getValue());
                com.localob.messaging.backend.db.Message target;
                try (Query<com.localob.messaging.backend.db.Message> targetQuery = Database.INSTANCE.getMessages().query()
                        .equal(Message_.chatId, chat.getId())
                        .equal(Message_.guid, targetGuid, QueryBuilder.StringOrder.CASE_SENSITIVE)
                        .isNull(Message_.associatedMessageType).isNull(Message_.dateDeleted).build()) {
                    target = targetQuery.findUnique();
                }
                if (target == null || !isReactableTarget(target, chat.getGuid())) continue;
                JSONObject event = reactionEventJson(id, chat.getGuid(), created.getTime(),
                        blank(sender) ? "Someone" : chatNames.sender(sender), row.getReaction(), row.getReactionEnabled(),
                        Boolean.TRUE.equals(row.isFromMe()), targetGuid, target.getGuid(), preview(target));
                if (event != null) events.put(event.put("muted", muted));
            }
        }
        out.put("ok", true);
        out.put("events", events);
        return out;
    }

    static JSONObject reactionEventJson(String id, String threadId, long timestamp, String sender,
                                        ReactionKind reaction, boolean enabled, boolean fromMe,
                                        String targetGuid, String expectedTargetGuid, String targetText) throws Exception {
        String emoji = reactionEmoji(reaction);
        if (blank(id) || blank(threadId) || timestamp <= 0 || blank(sender) || fromMe || !enabled ||
                blank(targetGuid) || !targetGuid.equals(expectedTargetGuid) || emoji == null) return null;
        String preview = blank(targetText) ? "message" : targetText.trim();
        return new JSONObject().put("id", bounded(id, 512)).put("threadId", threadId)
                .put("timestamp", timestamp).put("sender", bounded(sender, 160))
                .put("text", bounded(emoji + " to: " + preview, 160));
    }

    private static String reactionEmoji(ReactionKind reaction) {
        if (reaction == ReactionKind.Standard.LOVE) return "❤️";
        if (reaction == ReactionKind.Standard.LIKE) return "👍";
        if (reaction == ReactionKind.Standard.DISLIKE) return "👎";
        if (reaction == ReactionKind.Standard.LAUGH) return "😂";
        if (reaction == ReactionKind.Standard.EMPHASIZE) return "‼️";
        if (reaction == ReactionKind.Standard.QUESTION) return "❓";
        if (reaction == ReactionKind.Sticker.INSTANCE) return "🏷️";
        if (reaction instanceof ReactionKind.Emoji) {
            String emoji = ((ReactionKind.Emoji) reaction).getEmoji();
            return blank(emoji) ? null : emoji;
        }
        return null;
    }

    static ReactionKind.Standard reactionKind(String value) {
        if (value == null) return null;
        switch (value) {
            case "love": return ReactionKind.Standard.LOVE;
            case "like": return ReactionKind.Standard.LIKE;
            case "dislike": return ReactionKind.Standard.DISLIKE;
            case "laugh": return ReactionKind.Standard.LAUGH;
            case "emphasize": return ReactionKind.Standard.EMPHASIZE;
            case "question": return ReactionKind.Standard.QUESTION;
            default: return null;
        }
    }

    static String reactionType(ReactionKind reaction) {
        if (reaction == ReactionKind.Standard.LOVE) return "love";
        if (reaction == ReactionKind.Standard.LIKE) return "like";
        if (reaction == ReactionKind.Standard.DISLIKE) return "dislike";
        if (reaction == ReactionKind.Standard.LAUGH) return "laugh";
        if (reaction == ReactionKind.Standard.EMPHASIZE) return "emphasize";
        if (reaction == ReactionKind.Standard.QUESTION) return "question";
        return null;
    }

    private static String reactionStateKey(ReactionKind reaction) {
        String type = reactionType(reaction);
        if (type != null) return type;
        if (reaction instanceof ReactionKind.Emoji)
            return "emoji:" + ((ReactionKind.Emoji) reaction).getEmoji();
        if (reaction == ReactionKind.Sticker.INSTANCE) return "stickerback";
        return null;
    }

    private static boolean supportsReactions(com.localob.messaging.backend.db.Chat chat) {
        return chat != null && chat.isIMessage();
    }

    static boolean isReactableTarget(com.localob.messaging.backend.db.Message target, String chatGuid) {
        if (!isMessageTarget(target, chatGuid)) return false;
        try { return supportsReactions(target.getChat().getTarget()); }
        catch (Throwable ignored) { return false; }
    }

    static boolean isMessageTarget(Message target, String chatGuid) {
        if (target == null || blank(chatGuid) || blank(target.getGuid()) || target.getGuid().length() > 512 ||
                !chatGuid.equals(target.getChatGuid())) return false;
        if (target instanceof com.localob.messaging.backend.db.Message) {
            com.localob.messaging.backend.db.Message entity = (com.localob.messaging.backend.db.Message) target;
            return entity.getDateDeleted() == null && entity.getAssociatedMessageType() == null;
        }
        if (target instanceof com.localob.messaging.backend.domain.AssociatedMessage &&
                ((com.localob.messaging.backend.domain.AssociatedMessage) target).getTargetGuid() != null) return false;
        try { return target.getDateDeletedFlow().getValue() == null; }
        catch (Throwable ignored) { return false; }
    }

    static MessageRef resolveReplyReference(Message target, int partIndex) {
        return com.localob.messaging.app.messaging.ReplyThreadingKt.resolveReplyTarget(target, partIndex);
    }

    private static List<com.localob.messaging.backend.db.Message> reactionRows(
            com.localob.messaging.backend.db.Chat chat, List<String> targetGuids) {
        QueryCondition<com.localob.messaging.backend.db.Message> targets = null;
        for (String targetGuid : targetGuids) {
            QueryCondition<com.localob.messaging.backend.db.Message> condition =
                    Message_.associatedMessageGuid.equal(targetGuid);
            targets = targets == null ? condition : targets.or(condition);
        }
        if (targets == null) return Collections.emptyList();
        try (Query<com.localob.messaging.backend.db.Message> query = Database.INSTANCE.getMessages().query()
                .equal(Message_.chatId, chat.getId()).apply(targets)
                .notNull(Message_.associatedMessageType).build()) {
            return query.find();
        }
    }

    static void applyReaction(Message target, List<? extends AssociatedMessage> rows,
                              ReactionKind.Standard reaction, int partIndex, boolean remove) throws Exception {
        ActiveReaction current = ownReaction(target.getGuid(), rows, partIndex);
        String wanted = reactionType(reaction);
        if (wanted == null) throw new IllegalArgumentException("Unsupported reaction.");
        if (remove) {
            if (current != null && wanted.equals(current.type))
                Await.await(c -> target.react(reaction, partIndex, false, c), OP_TIMEOUT_MS);
        } else if (current == null || !wanted.equals(current.key)) {
            if (current != null && current.kind != null) {
                ReactionKind old = current.kind;
                Await.await(c -> target.react(old, partIndex, false, c), OP_TIMEOUT_MS);
            }
            Await.await(c -> target.react(reaction, partIndex, true, c), OP_TIMEOUT_MS);
        }
    }

    private static ActiveReaction ownReaction(String targetGuid, List<? extends AssociatedMessage> rows, int partIndex) {
        for (ActiveReaction reaction : activeReactions(targetGuid, rows).values())
            if (reaction.fromMe && reaction.part == partIndex) return reaction;
        return null;
    }

    private static int reactionPart(AssociatedMessage row) {
        Integer part = row.getTargetPartIndex();
        return part == null ? 0 : part;
    }

    private static List<AssociatedMessage> orderedReactions(List<? extends AssociatedMessage> rows, String targetGuid) {
        List<AssociatedMessage> out = new ArrayList<>();
        if (rows != null) for (AssociatedMessage row : rows) {
            if (row instanceof com.localob.messaging.backend.db.Message &&
                    ((com.localob.messaging.backend.db.Message) row).getDateDeleted() != null) continue;
            if (targetGuid.equals(row.getTargetGuid()) && row.getReaction() != null) {
                out.add(row);
            }
        }
        Collections.sort(out, (left, right) -> {
            int byTime = Long.compare(reactionTime(left), reactionTime(right));
            if (byTime != 0) return byTime;
            if (left instanceof com.localob.messaging.backend.db.Message && right instanceof com.localob.messaging.backend.db.Message)
                return Long.compare(
                    ((com.localob.messaging.backend.db.Message) left).getId(),
                    ((com.localob.messaging.backend.db.Message) right).getId());
            return left.getGuid().compareTo(right.getGuid());
        });
        return out;
    }

    private static long reactionTime(AssociatedMessage row) {
        if (row instanceof com.localob.messaging.backend.db.Message) {
            Date date = ((com.localob.messaging.backend.db.Message) row).getDateCreated();
            return date == null ? 0L : date.getTime();
        }
        return row.getTimestamp().toEpochMilliseconds();
    }

    private static final class ActiveReaction {
        final String key;
        final String type;
        final boolean fromMe;
        final int part;
        final ReactionKind kind;

        ActiveReaction(String key, String type, boolean fromMe, int part, ReactionKind kind) {
            this.key = key;
            this.type = type;
            this.fromMe = fromMe;
            this.part = part;
            this.kind = kind;
        }
    }

    private static java.util.Map<String, ActiveReaction> activeReactions(
            String targetGuid, List<? extends AssociatedMessage> rows) {
        java.util.Map<String, ActiveReaction> active = new java.util.LinkedHashMap<>();
        for (AssociatedMessage row : orderedReactions(rows, targetGuid)) {
            ReactionKind kind = row.getReaction();
            String reactionKey = reactionStateKey(kind);
            if (reactionKey == null) continue;
            String type = reactionType(kind);
            String sender = Boolean.TRUE.equals(row.isFromMe()) ? "\u0000me" : row.getSender();
            if (blank(sender)) sender = "\u0000unknown:" + row.getGuid();
            int part = reactionPart(row);
            String key = sender + "\u0000" + part;
            if (!row.getReactionEnabled()) {
                ActiveReaction old = active.get(key);
                if (old != null && old.key.equals(reactionKey)) active.remove(key);
            } else {
                active.put(key, new ActiveReaction(reactionKey, type, Boolean.TRUE.equals(row.isFromMe()), part, kind));
            }
        }
        return active;
    }

    static JSONArray summarizeReactions(String targetGuid, List<? extends AssociatedMessage> rows) throws Exception {
        class Count { int value; boolean own; int part; }
        java.util.Map<String, Count> counts = new java.util.TreeMap<>();
        for (ActiveReaction value : activeReactions(targetGuid, rows).values()) {
            String key = value.part + "\u0000" + value.key;
            Count count = counts.get(key);
            if (count == null) { count = new Count(); count.part = value.part; counts.put(key, count); }
            count.value++;
            count.own |= value.fromMe;
        }
        JSONArray result = new JSONArray();
        for (java.util.Map.Entry<String, Count> entry : counts.entrySet()) {
            String type = entry.getKey().substring(entry.getKey().indexOf('\u0000') + 1);
            Count count = entry.getValue();
            result.put(new JSONObject().put("type", type).put("count", count.value)
                    .put("fromMe", count.own).put("partIndex", count.part));
        }
        return result;
    }

    private static java.util.Map<String, List<AssociatedMessage>> groupReactionRows(List<com.localob.messaging.backend.db.Message> rows) {
        java.util.Map<String, List<AssociatedMessage>> grouped = new java.util.HashMap<>();
        for (com.localob.messaging.backend.db.Message row : rows) {
            String target = row.getTargetGuid();
            if (blank(target) || row.getReaction() == null || row.getDateDeleted() != null) continue;
            List<AssociatedMessage> messages = grouped.get(target);
            if (messages == null) { messages = new ArrayList<>(); grouped.put(target, messages); }
            messages.add(row);
        }
        return grouped;
    }

    private static boolean hasControl(String value) {
        for (int i = 0; i < value.length(); i++) if (Character.isISOControl(value.charAt(i))) return true;
        return false;
    }

    private static JSONObject baseResponse(String requestId) throws Exception {
        JSONObject out = new JSONObject();
        out.put("apiVersion", API_VERSION);
        if (requestId != null) out.put("requestId", bounded(requestId, 128));
        out.put("patchVersion", PATCH_VERSION);
        return out;
    }

    private static JSONObject notReady(JSONObject out) throws Exception {
        out.put("ok", false);
        out.put("ready", false);
        out.put("error", "OpenBubbles is still starting. Open it on the phone once, then retry.");
        return out;
    }

    private static JSONObject failure(JSONObject out, Throwable t) throws Exception {
        Log.w(TAG, "Bridge operation failed", t);
        out.put("ok", false);
        out.put("error", friendlyError(t));
        return out;
    }

    private static String friendlyError(Throwable t) {
        String message = t.getMessage();
        if (t instanceof TimeoutException) {
            return "OpenBubbles did not finish the request in time. Wait a moment, then try again.";
        }
        if (message == null || message.trim().isEmpty()) {
            return "OpenBubbles could not complete the request.";
        }
        // Kotlin exceptions sometimes carry class names or full stack traces.
        int newline = message.indexOf('\n');
        if (newline >= 0) message = message.substring(0, newline);
        message = message.trim();
        return message.isEmpty() ? "OpenBubbles could not complete the request." : bounded(message, 300);
    }

    private static BackendService backend() {
        try {
            BackendState state = BackendForegroundService.Companion.getState().getValue();
            if (state instanceof BackendState.Ready) return ((BackendState.Ready) state).getBackend();
        } catch (Throwable t) {
            Log.w(TAG, "Backend not ready", t);
        }
        return null;
    }

    static Chat resolve(BackendService backend, String threadId, String address, boolean create)
            throws Exception {
        String guid = guidFromThreadId(threadId);
        if (guid != null) {
            Chat found = (Chat) Await.await(
                    continuation -> backend.chatById(guid, continuation), OP_TIMEOUT_MS);
            if (found != null && !guid.equals(found.getGuid())) {
                throw new IllegalStateException("The backend returned a different conversation.");
            }
            return found;
        }
        if (!blank(threadId) && !isAddressThreadId(threadId)) {
            throw new IllegalArgumentException("Invalid conversation ID. Refresh your conversations.");
        }
        String normalized = normalizeAddress(address);
        if (normalized == null) return null;
        @SuppressWarnings("unchecked")
        List<Chat> existing = (List<Chat>) Await.await(
                continuation -> backend.findChats(Collections.singletonList(normalized), null, continuation),
                OP_TIMEOUT_MS);
        if (existing != null) {
            for (Chat chat : existing) if (isSingleRecipient(chat, normalized)) return chat;
        }
        if (!create) return null;
        Chat created = (Chat) Await.await(
                continuation -> backend.chat(Collections.singletonList(normalized), null, true, continuation),
                OP_TIMEOUT_MS);
        if (created != null && !isSingleRecipient(created, normalized)) {
            throw new IllegalStateException("The backend returned a different recipient.");
        }
        return created;
    }

    private static boolean isSingleRecipient(Chat chat, String address) {
        if (chat == null || chat.isGroup() || !validChatGuid(chat.getGuid()) || chat.getGuid().contains(";+;")) return false;
        String recipient = normalizeAddress(chat.getGuid());
        if (recipient != null) return address.equals(recipient);
        List<String> handles = chat.getHandlesFlow().getValue();
        return handles != null && handles.size() == 1 && address.equals(normalizeAddress(handles.get(0)));
    }

    /** OpenBubbles' own chat identifier, e.g. chat125428204935, is not a display name. */
    static boolean isChatIdentifier(String value) {
        return value != null && CHAT_IDENTIFIER.matcher(value.trim()).matches();
    }

    static boolean validChatGuid(String value) {
        return value != null && (CHAT_GUID.matcher(value).matches() || NATIVE_CHAT_GUID.matcher(value).matches()
                || NATIVE_GROUP_GUID.matcher(value).matches());
    }

    static String guidFromThreadId(String threadId) {
        if (threadId == null) return null;
        String value = threadId.trim();
        if (value.startsWith("chat_")) value = value.substring("chat_".length());
        return validChatGuid(value) ? value : null;
    }

    private static boolean isAddressThreadId(String value) {
        value = value.trim();
        if (value.startsWith("chat_")) value = value.substring("chat_".length());
        return value.startsWith("addr:") || value.startsWith("contact:") ||
                value.startsWith("new:") || value.startsWith("new-");
    }

    static String normalizeAddress(String address) {
        if (address == null) return null;
        if (address.length() > 600) return null;
        for (int i = 0; i < address.length(); i++) if (Character.isISOControl(address.charAt(i))) return null;
        String value = address.trim();
        if (value.isEmpty()) return null;
        String lower = value.toLowerCase(Locale.ROOT);
        for (String prefix : new String[]{"tel:", "sms:", "smsto:", "mailto:"}) {
            if (lower.startsWith(prefix)) {
                value = value.substring(prefix.length());
                break;
            }
        }
        if (validChatGuid(value) && value.charAt(value.indexOf(';') + 1) == '-') {
            value = value.substring(value.indexOf(";-;") + 3);
        }
        value = value.trim();
        if (value.length() > 254) return null;
        if (value.contains("@")) {
            String local = value.substring(0, value.indexOf('@'));
            return EMAIL.matcher(value).matches() && !local.startsWith(".") && !local.endsWith(".") &&
                    !local.contains("..") ? value.toLowerCase(Locale.ROOT) : null;
        }
        if (!PHONE.matcher(value).matches()) return null;
        StringBuilder digits = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if ((c >= '0' && c <= '9') || c == '+') digits.append(c);
        }
        int count = digits.length() - (digits.indexOf("+") == 0 ? 1 : 0);
        return count >= 5 && count <= 15 ? digits.toString() : null;
    }

    private static JSONObject chatJson(com.localob.messaging.backend.db.Chat chat) throws Exception {
        JSONObject out = new JSONObject();
        out.put("id", chat.getGuid());
        String address = null;
        JSONArray participants = new JSONArray();
        try {
            List<com.localob.messaging.backend.db.Handle> handles = chat.getHandles();
            for (com.localob.messaging.backend.db.Handle handle : handles) {
                String value = handle.getAddress();
                if (blank(value)) continue;
                if (participants.length() < MAX_PARTICIPANTS) participants.put(bounded(value, 254));
                if (address == null) address = normalizeAddress(value);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to read participants for " + chat.getGuid(), t);
        }
        boolean group = participants.length() > 1 || chat.isGroup();
        String title = firstNonBlank(chat.getDisplayName(), chat.getTitle(),
                group ? null : address, chat.getChatIdentifier(), chat.getGuid());
        out.put("title", bounded(title, 160));
        out.put("isGroup", group);
        try { putAvatarSource(out, chat.getCustomAvatarPath()); } catch (Throwable ignored) { }
        if (!group && address != null) out.put("address", address);
        out.put("participants", participants);
        out.put("unread", Boolean.TRUE.equals(chat.getHasUnreadMessage()));
        Date fallbackDate = null;
        try {
            fallbackDate = chat.getDbOnlyLatestMessageDate();
        } catch (Throwable ignored) {
        }
        Message last = null;
        try {
            io.objectbox.relation.ToOne<com.localob.messaging.backend.db.Message> latest = chat.getDbLatestMessage();
            if (latest != null) last = latest.getTarget();
        } catch (Throwable ignored) {
        }
        putChatActivity(out, last, fallbackDate);
        return out;
    }

    private static com.localob.messaging.backend.db.Chat findChatEntity(String guid) {
        try (Query<com.localob.messaging.backend.db.Chat> query = Database.INSTANCE.getChats().query()
                .equal(Chat_.guid, guid, QueryBuilder.StringOrder.CASE_SENSITIVE).build()) {
            return query.findUnique();
        } catch (Throwable ignored) { return null; }
    }

    static void putChatActivity(JSONObject out, Message last, Date fallbackDate) throws Exception {
        long timestamp = fallbackDate == null ? 0L : fallbackDate.getTime();
        String lastPreview = "";
        if (last != null) {
            try {
                kotlinx.datetime.Instant messageTimestamp = last.getTimestamp();
                if (messageTimestamp != null) timestamp = messageTimestamp.toEpochMilliseconds();
            } catch (Throwable ignored) {
            }
            try {
                lastPreview = preview(last);
            } catch (Throwable ignored) {
            }
        }
        out.put("lastTimestamp", timestamp);
        out.put("lastPreview", bounded(lastPreview, MAX_TEXT_LENGTH));
    }

    private static void putAvatarSource(JSONObject out, String path) throws Exception {
        if (!blank(path)) out.put("avatarUri", android.net.Uri.fromFile(new java.io.File(path)).toString());
    }

    private static JSONObject threadJson(Chat chat, int limit) throws Exception {
        ChatNames names = names();
        JSONObject out = new JSONObject();
        String guid = chat.getGuid();
        out.put("id", guid);
        com.localob.messaging.backend.db.Chat entity;
        try (Query<com.localob.messaging.backend.db.Chat> query = Database.INSTANCE.getChats()
                .query().equal(Chat_.guid, guid, QueryBuilder.StringOrder.CASE_SENSITIVE).build()) {
            entity = query.findUnique();
        }
        if (entity != null) {
            out = chatJson(entity);
        } else {
            out = threadMetadata(chat);
        }
        JSONArray messages = new JSONArray();
        names.apply(out);
        if (entity != null) {
            List<com.localob.messaging.backend.db.Message> found;
            try (Query<com.localob.messaging.backend.db.Message> query = Database.INSTANCE.getMessages()
                    .query()
                    .equal(Message_.chatId, entity.getId())
                    .isNull(Message_.associatedMessageType)
                    .orderDesc(Message_.dateCreated)
                    .build()) {
                found = query.find(0, limit);
            }
            List<String> targetGuids = new ArrayList<>();
            for (com.localob.messaging.backend.db.Message message : found)
                if (!blank(message.getGuid())) targetGuids.add(message.getGuid());
            List<com.localob.messaging.backend.db.Message> reactions = reactionRows(entity, targetGuids);
            java.util.Map<String, List<AssociatedMessage>> reactionsByTarget = groupReactionRows(reactions);
            java.util.Map<String, Integer> replyCounts = replyCounts(entity);
            List<JSONObject> serialized = new ArrayList<>();
            int chars = 0;
            for (com.localob.messaging.backend.db.Message message : found) {
                if (message.getDateDeleted() != null) continue;
                JSONObject json = messageJson(message, names,
                        summarizeReactions(message.getGuid(), reactionsByTarget.get(message.getGuid())), entity);
                if (json == null) continue;
                json.put("replyCount", replyCounts.getOrDefault(message.getGuid(), 0));
                chars += json.toString().length() + 1;
                if (chars > MAX_COLLECTION_CHARS) break;
                serialized.add(json);
            }
            Collections.reverse(serialized);
            for (JSONObject json : serialized) messages.put(json);
        }
        out.put("messages", messages);
        return out;
    }

    static JSONObject threadMetadata(Chat chat) throws Exception {
        JSONObject out = new JSONObject();
        out.put("id", chat.getGuid());
        out.put("title", bounded(firstNonBlank(chat.getDisplayNameFlow().getValue(), chat.getGuid()), 160));
        out.put("isGroup", chat.isGroup());
        try { putAvatarSource(out, chat.getGroupPhotoFlow().getValue()); } catch (Throwable ignored) { }
        out.put("unread", Boolean.TRUE.equals(chat.getHasUnreadFlow().getValue()));
        JSONArray participants = new JSONArray();
        List<String> handles = chat.getHandlesFlow().getValue();
        if (handles != null) {
            for (String handle : handles) {
                if (!blank(handle) && participants.length() < MAX_PARTICIPANTS) participants.put(bounded(handle, 254));
            }
            if (!chat.isGroup() && handles.size() == 1) out.put("address", normalizeAddress(handles.get(0)));
        }
        out.put("participants", participants);
        kotlinx.datetime.Instant activity = chat.getLastActivityFlow().getValue();
        out.put("lastTimestamp", activity == null ? 0L : activity.toEpochMilliseconds());
        Message last = chat.getLastMessageFlow().getValue();
        out.put("lastPreview", last == null ? "" : preview(last));
        return out;
    }

    static JSONObject messageJson(Message message) throws Exception {
        return messageJson(message, null, new JSONArray(), null);
    }

    private static JSONObject messageJson(Message message, ChatNames names) throws Exception {
        return messageJson(message, names, new JSONArray(), null);
    }

    private static JSONObject messageJson(Message message, ChatNames names, JSONArray reactions) throws Exception {
        return messageJson(message, names, reactions, null);
    }

    private static JSONObject messageJson(Message message, ChatNames names, JSONArray reactions,
                                          com.localob.messaging.backend.db.Chat chatEntity) throws Exception {
        if (message == null || blank(message.getGuid()) || message.getGuid().length() > 512) return null;
        String text = messageText(message);
        boolean attachment = false;
        long timestamp;
        boolean fromMe;
        String sender = null;
        if (message instanceof com.localob.messaging.backend.db.Message) {
            com.localob.messaging.backend.db.Message entity = (com.localob.messaging.backend.db.Message) message;
            attachment = Boolean.TRUE.equals(entity.getHasAttachments());
            timestamp = entity.getDateCreated() == null ? 0L : entity.getDateCreated().getTime();
            fromMe = Boolean.TRUE.equals(entity.isFromMe());
            sender = entity.getSender();
        } else {
            timestamp = message.getTimestamp().toEpochMilliseconds();
            fromMe = Boolean.TRUE.equals(message.isFromMe());
            sender = message.getSender();
        }
        if (blank(text) && !attachment) return null;
        JSONObject out = new JSONObject();
        out.put("id", message.getGuid());
        out.put("text", bounded(text, MAX_TEXT_LENGTH));
        out.put("timestamp", timestamp);
        out.put("fromMe", fromMe);
        out.put("canReact", canReact(message, chatEntity));
        out.put("canReply", canReact(message, chatEntity));
        out.put("reactions", reactions == null ? new JSONArray() : reactions);
        out.put("replyCount", 0);
        JSONObject replyTo = replyToJson(message, chatEntity, names);
        if (replyTo != null) out.put("replyTo", replyTo);
        if (sender != null) out.put("sender", bounded(names == null ? sender : names.sender(sender), 254));
        if (attachment) out.put("attachment", true);
        if (fromMe) {
            try {
                String status;
                if (message instanceof com.localob.messaging.backend.db.Message) {
                    // ObjectBox hydrates fields before OB initializes the entity's delivery flow.
                    com.localob.messaging.backend.db.Message entity = (com.localob.messaging.backend.db.Message) message;
                    status = entity.getDateRead() != null ? "read" : entity.getDateDelivered() != null ? "delivered" :
                            entity.getErrorMessage() != null ? "failed" : entity.getSendingServiceId() != null ? "sending" : "sent";
                } else {
                    DeliveryState state = message.getDeliveryStateFlow().getValue();
                    status = state instanceof DeliveryState.Failed ? "failed" :
                            state instanceof DeliveryState.Read ? "read" :
                            state instanceof DeliveryState.Delivered || state instanceof DeliveryState.DeliveredQuietly ? "delivered" :
                            state instanceof DeliveryState.Sending ? "sending" : state instanceof DeliveryState.Sent ? "sent" : null;
                }
                if (status != null) out.put("status", status);
            } catch (Throwable t) {
                Log.d(TAG, "Message delivery status unavailable", t);
            }
        }
        if (attachment && message instanceof com.localob.messaging.backend.db.Message) {
            CompanionMediaProvider.putMedia(out, (com.localob.messaging.backend.db.Message) message);
        }
        return out;
    }

    private static boolean canReact(Message message) {
        if (!(message instanceof com.localob.messaging.backend.db.Message)) return false;
        try {
            com.localob.messaging.backend.db.Message entity = (com.localob.messaging.backend.db.Message) message;
            return isReactableTarget(entity, entity.getChatGuid());
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean canReact(Message message,
                                    com.localob.messaging.backend.db.Chat chatEntity) {
        if (chatEntity == null) return canReact(message);
        if (!supportsReactions(chatEntity) || message == null || blank(message.getGuid())) return false;
        if (message instanceof com.localob.messaging.backend.db.Message)
            return isReactableTarget((com.localob.messaging.backend.db.Message) message, chatEntity.getGuid());
        if (message instanceof com.localob.messaging.backend.domain.AssociatedMessage &&
                ((com.localob.messaging.backend.domain.AssociatedMessage) message).getTargetGuid() != null) return false;
        try {
            return chatEntity.getGuid().equals(message.getChatGuid()) && message.getDateDeletedFlow().getValue() == null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static JSONObject replyToJson(Message message,
                                          com.localob.messaging.backend.db.Chat chatEntity,
                                          ChatNames names) throws Exception {
        String rootGuid;
        Integer partIndex;
        try {
            rootGuid = message.getThreadOriginatorGuid();
            partIndex = message.getThreadOriginatorPartIndex();
        } catch (Throwable ignored) {
            return null;
        }
        if (blank(rootGuid)) return null;
        MessageRef reference = new MessageRef(rootGuid, partIndex == null ? 0 : partIndex);
        try { return replyReferenceJson(chatEntity, reference, names); }
        catch (Throwable error) {
            Log.d(TAG, "Reply preview unavailable", error);
            return replyReferenceJson(reference, null, names);
        }
    }

    private static JSONObject replyReferenceJson(com.localob.messaging.backend.db.Chat chatEntity,
                                                 MessageRef reference, ChatNames names) throws Exception {
        String messageId = reference.getMessageId();
        if (chatEntity == null || blank(messageId)) return replyReferenceJson(reference, null, names);
        try {
            com.localob.messaging.backend.db.Message original;
            try (Query<com.localob.messaging.backend.db.Message> query = Database.INSTANCE.getMessages()
                    .query().equal(Message_.chatId, chatEntity.getId())
                    .equal(Message_.guid, messageId, QueryBuilder.StringOrder.CASE_SENSITIVE).build()) {
                original = query.findUnique();
            }
            return replyReferenceJson(reference, original, names);
        } catch (Throwable error) {
            Log.d(TAG, "Reply source lookup unavailable", error);
            return replyReferenceJson(reference, null, names);
        }
    }

    static JSONObject replyReferenceJson(MessageRef reference, Message original) throws Exception {
        return replyReferenceJson(reference, original, null);
    }

    private static JSONObject replyReferenceJson(MessageRef reference, Message original, ChatNames names) throws Exception {
        String messageId = bounded(reference.getMessageId(), 512);
        int partIndex = reference.getPartIndex() == null ? 0 : Math.max(0, reference.getPartIndex());
        JSONObject out = new JSONObject().put("messageId", messageId).put("partIndex", partIndex)
                .put("text", "Original message unavailable").put("fromMe", false);
        if (original == null || blank(messageId) || !messageId.equals(original.getGuid())) return out;
        if (original instanceof com.localob.messaging.backend.db.Message) {
            com.localob.messaging.backend.db.Message entity = (com.localob.messaging.backend.db.Message) original;
            if (entity.getDateDeleted() != null || entity.getAssociatedMessageType() != null) return out;
        } else if (original instanceof com.localob.messaging.backend.domain.AssociatedMessage &&
                ((com.localob.messaging.backend.domain.AssociatedMessage) original).getTargetGuid() != null) {
            return out;
        } else {
            try { if (original.getDateDeletedFlow().getValue() != null) return out; }
            catch (Throwable ignored) { return out; }
        }
        String text = preview(original);
        if (!blank(text)) out.put("text", bounded(text, MAX_TEXT_LENGTH));
        out.put("fromMe", Boolean.TRUE.equals(original.isFromMe()));
        String sender = original.getSender();
        if (!blank(sender)) out.put("sender", bounded(names == null ? sender : names.sender(sender), 254));
        return out;
    }

    private static java.util.Map<String, Integer> replyCounts(com.localob.messaging.backend.db.Chat chat) {
        java.util.Map<String, Integer> counts = new java.util.HashMap<>();
        try (Query<com.localob.messaging.backend.db.Message> query = Database.INSTANCE.getMessages().query()
                .equal(Message_.chatId, chat.getId()).notNull(Message_.threadOriginatorGuid)
                .isNull(Message_.associatedMessageType).isNull(Message_.dateDeleted).build()) {
            for (com.localob.messaging.backend.db.Message reply : query.find()) {
                String root = reply.getThreadOriginatorGuid();
                if (!blank(root)) counts.put(root, counts.getOrDefault(root, 0) + 1);
            }
        }
        return counts;
    }

    /** Downloads one attachment on demand for the trusted watch companion. */
    static boolean downloadAttachment(Attachment attachment, long timeoutMs) {
        if (attachment == null) return false;
        try {
            Object result = Await.await(continuation -> attachment.download(continuation), timeoutMs);
            return Boolean.TRUE.equals(result) || Boolean.TRUE.equals(attachment.isDownloaded());
        } catch (Throwable t) {
            Log.w(TAG, "Unable to download attachment", t);
            return false;
        }
    }

    private static String preview(Message message) {
        String text = messageText(message);
        if (!blank(text)) return bounded(text.trim(), MAX_TEXT_LENGTH);
        if (message instanceof com.localob.messaging.backend.db.Message &&
                Boolean.TRUE.equals(((com.localob.messaging.backend.db.Message) message).getHasAttachments())) {
            return "Photo";
        }
        return "";
    }

    /** Domain messages expose text through content runs; entities store it directly. */
    private static String messageText(Message message) {
        if (message instanceof com.localob.messaging.backend.db.Message) {
            return bounded(((com.localob.messaging.backend.db.Message) message).getText(), MAX_TEXT_LENGTH);
        }
        try {
            MessageContent content = message.getContentFlow().getValue();
            if (content == null) return null;
            StringBuilder text = new StringBuilder();
            for (ContentRun run : content.getRuns()) {
                if (run instanceof ContentRun.Text) {
                    String value = ((ContentRun.Text) run).getText();
                    if (value != null) {
                        int remaining = MAX_TEXT_LENGTH - text.length();
                        text.append(bounded(value, remaining));
                        if (value.length() >= remaining) break;
                    }
                }
            }
            return text.toString();
        } catch (Throwable t) {
            return null;
        }
    }

    private static String appVersion(Context context) {
        try {
            return context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException ignored) {
            return "";
        }
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    static String bounded(String value, int max) {
        if (value == null) return "";
        if (value.length() <= max) return value;
        int end = max;
        if (end > 0 && Character.isHighSurrogate(value.charAt(end - 1))) end--;
        return value.substring(0, end);
    }

    private static boolean blank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private static String firstNonBlank(String... values) {
        for (String value : values) if (!blank(value)) return value.trim();
        return "";
    }

    /**
     * Runs a Kotlin suspend call outside a coroutine and waits for its result.
     * Only safe on a background thread, never the main thread.
     */
    private interface SuspendCall<T> {
        Object invoke(Continuation<Object> continuation) throws Exception;
    }

    private static final class Await<T> implements Continuation<Object> {
        private final CountDownLatch latch = new CountDownLatch(1);
        private volatile Object value;

        @Override
        public CoroutineContext getContext() {
            return EmptyCoroutineContext.INSTANCE;
        }

        @Override
        public void resumeWith(Object result) {
            value = result;
            latch.countDown();
        }

        static <T> T await(SuspendCall<T> call, long timeoutMs) throws Exception {
            Await<T> await = new Await<>();
            Object result = call.invoke(await);
            if (result != IntrinsicsKt.getCOROUTINE_SUSPENDED()) {
                ResultKt.throwOnFailure(result);
                @SuppressWarnings("unchecked") T value = (T) result;
                return value;
            }
            if (!await.latch.await(timeoutMs, TimeUnit.MILLISECONDS)) {
                throw new TimeoutException("OpenBubbles timed out");
            }
            ResultKt.throwOnFailure(await.value);
            @SuppressWarnings("unchecked") T value = (T) await.value;
            return value;
        }
    }
}
