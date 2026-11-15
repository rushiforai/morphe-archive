package compat;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import static compat.CompatReport.*;
import static compat.Bubbles.*;
import static compat.Coexist.*;
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** The message log: analytics upload entries, message ids, unsent recall and clear, quiet chats and the secret text field. */
final class MessageLog {

    // The analytics logger's upload components and the entry points Android starts them through. Mirrors AnalyticsUploads.kt.
    static final String ANALYTICS2_UPLOAD_SERVICE = "Lcom/facebook/analytics2/logger/legacy/uploader/Analytics2UploadService;";
    static final String START_COMMAND = "onStartCommand(Landroid/content/Intent;II)I";
    static final String START_JOB = "onStartJob(Landroid/app/job/JobParameters;)Z";
    static final Map<String, Set<String>> ANALYTICS_UPLOAD_ENTRIES = Map.of(
        "Lcom/facebook/analytics2/logger/legacy/uploader/AlarmBasedUploadService;", Set.of(START_COMMAND),
        "Lcom/facebook/analytics2/logger/legacy/uploader/LollipopUploadService;", Set.of(START_COMMAND, START_JOB),
        "Lcom/facebook/analytics2/logger/service/LollipopUploadSafeService;", Set.of(START_COMMAND, START_JOB),
        "Lcom/facebook/analytics2/logger/GooglePlayUploadService;", Set.of(START_COMMAND),
        "Lcom/facebook/analytics2/logger/legacy/uploader/HighPriUploadRetryReceiver;",
            Set.of("onReceive(Landroid/content/Context;Landroid/content/Intent;)V"));

    static String entryPoint(Method m) {
        return m.getName() + "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
    }

    // The message log's capture point: the one new-message notification constructor. Mirrors MessageLog.kt.
    static final String NEW_MESSAGE_NOTIFICATION = "Lcom/facebook/messaging/notify/type/NewMessageNotification;";
    static final String MESSENGER_ACCOUNT_TYPE = "Lcom/facebook/messaging/accountswitch/model/MessengerAccountType;";
    static final String MESSAGE_TYPE = "Lcom/facebook/messaging/model/messages/Message;";
    static final String THREAD_SUMMARY_TYPE = "Lcom/facebook/messaging/model/threads/ThreadSummary;";

    static final String MESSENGER_BROWSER_LAUNCHER = "Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;";
    static final List<String> REVOKE_HANDLER = List.of("Landroid/content/Intent;", BUBBLE_SESSION, "Ljava/lang/String;", "Ljava/util/Map;");
    static final String JSON_PUT = "Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;";

    /**
     * Message String fields the browser launcher reads straight after loading "message_id" and puts into a JSONObject
     * under that key, all three on the same registers. Mirrors findMessageIdFields.
     */
    static Set<String> messageIdFields(List<ClassDef> classes) {
        var fields = new LinkedHashSet<String>();
        for (var cls : classes) {
            if (!MESSENGER_BROWSER_LAUNCHER.equals(cls.getType())) continue;
            for (var m : cls.getMethods()) {
                if (m.getImplementation() == null) continue;
                var code = new ArrayList<Instruction>();
                m.getImplementation().getInstructions().forEach(code::add);
                for (int at = 0; at + 2 < code.size(); at++) {
                    var key = code.get(at);
                    if ((key.getOpcode() != Opcode.CONST_STRING && key.getOpcode() != Opcode.CONST_STRING_JUMBO) ||
                        !(((ReferenceInstruction) key).getReference() instanceof StringReference name) || !"message_id".equals(name.getString())) continue;
                    if (code.get(at + 1).getOpcode() != Opcode.IGET_OBJECT ||
                        !(((ReferenceInstruction) code.get(at + 1)).getReference() instanceof FieldReference field) ||
                        !MESSAGE_TYPE.equals(field.getDefiningClass()) || !"Ljava/lang/String;".equals(field.getType())) continue;
                    if (code.get(at + 2).getOpcode() != Opcode.INVOKE_VIRTUAL || !(code.get(at + 2) instanceof FiveRegisterInstruction put) ||
                        !JSON_PUT.equals(((ReferenceInstruction) put).getReference().toString()) || put.getRegisterCount() != 3 ||
                        put.getRegisterD() != ((OneRegisterInstruction) key).getRegisterA() ||
                        put.getRegisterE() != ((TwoRegisterInstruction) code.get(at + 1)).getRegisterA()) continue;
                    fields.add(field.getDefiningClass() + "->" + field.getName() + ":" + field.getType());
                }
            }
        }
        return fields;
    }

    /** The one id field, public so the notification class can read it, or null when there isn't exactly one. */
    static String messageIdField(List<ClassDef> classes) {
        var fields = messageIdFields(classes);
        if (fields.size() != 1) return null;
        var id = fields.iterator().next();
        for (var cls : classes) {
            if (!MESSAGE_TYPE.equals(cls.getType())) continue;
            for (var f : cls.getFields()) {
                if ((MESSAGE_TYPE + "->" + f.getName() + ":" + f.getType()).equals(id) && AccessFlags.PUBLIC.isSet(f.getAccessFlags())) return id;
            }
        }
        return null;
    }

    /**
     * The Message boolean that the notification text builder, the one (Message, ThreadSummary)String method, reads to
     * show "Secret conversation" instead of the text. Public, or null when there isn't exactly one. Mirrors
     * findHiddenTextFields.
     */
    static String hiddenTextField(List<ClassDef> classes) {
        var fields = new LinkedHashSet<String>();
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                var params = m.getParameterTypes();
                if (!"Ljava/lang/String;".equals(m.getReturnType()) || params.size() != 2 || !MESSAGE_TYPE.contentEquals(params.get(0)) ||
                    !THREAD_SUMMARY_TYPE.contentEquals(params.get(1)) || m.getImplementation() == null) continue;
                for (var insn : m.getImplementation().getInstructions()) {
                    if (insn.getOpcode() == Opcode.IGET_BOOLEAN && ((ReferenceInstruction) insn).getReference() instanceof FieldReference field &&
                        MESSAGE_TYPE.equals(field.getDefiningClass()) && "Z".equals(field.getType()))
                        fields.add(field.getDefiningClass() + "->" + field.getName() + ":" + field.getType());
                }
            }
        }
        if (fields.size() != 1) return null;
        var hidden = fields.iterator().next();
        for (var cls : classes) {
            if (!MESSAGE_TYPE.equals(cls.getType())) continue;
            for (var f : cls.getFields()) {
                if ((MESSAGE_TYPE + "->" + f.getName() + ":" + f.getType()).equals(hidden) && AccessFlags.PUBLIC.isSet(f.getAccessFlags())) return hidden;
            }
        }
        return null;
    }

    /**
     * The non-Parcel NewMessageNotification constructor, whose message and thread parameters the hook reads. Without one
     * readable message id the log couldn't tell two messages apart, and without the hidden-text flag it would log a
     * disappearing chat's stand-in, so either way the build reports no hook.
     */
    static List<Method> messageLogHooks(List<ClassDef> classes) {
        if (messageIdField(classes) == null || hiddenTextField(classes) == null) return List.of();
        for (var cls : classes) {
            if (!NEW_MESSAGE_NOTIFICATION.equals(cls.getType())) continue;
            var ctors = new ArrayList<Method>();
            for (var m : cls.getMethods()) {
                var params = m.getParameterTypes();
                if ("<init>".equals(m.getName()) && "V".equals(m.getReturnType()) && params.size() >= 3 &&
                    MESSENGER_ACCOUNT_TYPE.contentEquals(params.get(0)) && MESSAGE_TYPE.contentEquals(params.get(1)) &&
                    THREAD_SUMMARY_TYPE.contentEquals(params.get(2)) && m.getImplementation() != null) ctors.add(m);
            }
            return ctors.size() == 1 && messageLogRoom(ctors.get(0)) && messageLogContract(classes, ctors.get(0)) ? ctors : List.of();
        }
        return List.of();
    }

    static final List<String> RECALLER_PARAMETERS = List.of(BUBBLE_SESSION, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;");

    /**
     * unsent_recall: the one instance (session, message id, push id, offline id)Z method logging as NotificationRecaller,
     * which takes an unsent message out of its notification. Mirrors MessageLog.kt's findUnsentRecall.
     */
    static List<Method> unsentRecall(List<ClassDef> classes) {
        Method recaller = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Z".equals(method.getReturnType()) || method.getImplementation() == null) continue;
            var params = new ArrayList<String>();
            for (var type : method.getParameterTypes()) params.add(type.toString());
            if (!params.equals(RECALLER_PARAMETERS) || !stringsOf(method).contains("NotificationRecaller")) continue;
            if (recaller != null) return List.of();
            recaller = method;
        }
        return recaller == null ? List.of() : List.of(recaller);
    }

    static final List<String> CLEAR_THREAD_PARAMETERS = List.of(BUBBLE_SESSION, "Lcom/facebook/messaging/model/threadkey/ThreadKey;", "Ljava/lang/String;");
    static final List<String> DROP_LOG_PARAMETERS = List.of("Lcom/facebook/messaging/notify/client/MessagesNotificationManager;",
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;");

    static boolean invokes(Instruction i, String owner, List<String> params, String returns) {
        return i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m &&
            (owner == null || owner.equals(m.getDefiningClass())) && returns.equals(m.getReturnType()) && refParams(m).equals(params);
    }

    /** chat_channel_keep's shape: static String recreate(channel, session, manager, key, importance, demoted). Mirrors ChatPopups.kt. */
    static boolean channelRecreateShape(List<String> params) {
        return params.size() == 6 && "Landroid/app/NotificationChannel;".equals(params.get(0)) &&
            "Lcom/facebook/auth/usersession/FbUserSession;".equals(params.get(1)) && !"Ljava/lang/String;".equals(params.get(2)) &&
            "Ljava/lang/String;".equals(params.get(3)) && "I".equals(params.get(4)) && "Z".equals(params.get(5));
    }

    /** chat_channel_keep: the channel manager's recreate, which logs its importance change. Mirrors ChatPopups.kt's findChatChannelKeep. */
    static List<Method> chatChannelKeep(List<ClassDef> classes) {
        var out = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var params = new ArrayList<String>();
            for (var p : method.getParameterTypes()) params.add(p.toString());
            if (method.getImplementation() != null && AccessFlags.STATIC.isSet(method.getAccessFlags()) &&
                "Ljava/lang/String;".equals(method.getReturnType()) && channelRecreateShape(params) &&
                stringsOf(method).contains("recreateChannel for updating channel importance")) out.add(method);
        }
        return out;
    }

    /**
     * chat_channel_raise: the run() that reports the Chats channel's banner state and calls the recreate once. Its bound
     * check of importance 3 is followed by a write to the bound's register, no jump lands there, and the gates between
     * that and the raise leave what the raise reads alone. Mirrors ChatPopups.kt's chatRaiseSite.
     */
    static List<Method> chatChannelRaise(List<ClassDef> classes) {
        var out = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!"run".equals(method.getName()) || method.getImplementation() == null ||
                !stringsOf(method).contains("chats_channel_banner_state")) continue;
            var code = instructions(method);
            int recreate = -1, recreates = 0;
            for (int at = 0; at < code.size(); at++) {
                if (!(code.get(at) instanceof ReferenceInstruction r) || !(r.getReference() instanceof MethodReference m)) continue;
                if ("Ljava/lang/String;".equals(m.getReturnType()) && channelRecreateShape(refParams(m))) { recreate = at; recreates++; }
            }
            if (recreates != 1) continue;
            var args = callArgs(code.get(recreate));
            if (args.isEmpty()) continue;
            int channel = args.get(0), raise = -1;
            for (int at = recreate; at >= 0 && raise < 0; at--) {
                if (code.get(at) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m &&
                    "Landroid/app/NotificationChannel;".equals(m.getDefiningClass()) && "getImportance".equals(m.getName()) &&
                    callArgs(code.get(at)).equals(List.of(channel))) raise = at;
            }
            if (raise < 0) continue;
            int bound = -1, bounds = 0;
            for (int at = 1; at < raise; at++) {
                if (code.get(at).getOpcode() == Opcode.IF_LT && code.get(at - 1) instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == 3 &&
                    code.get(at - 1) instanceof OneRegisterInstruction load && ((TwoRegisterInstruction) code.get(at)).getRegisterB() == load.getRegisterA()) {
                    bound = at;
                    bounds++;
                }
            }
            if (bounds != 1) continue;
            int gates = bound + 1, scratch = ((OneRegisterInstruction) code.get(bound - 1)).getRegisterA();
            if (!chatChannelWrites(code.get(gates), scratch) || mediaTargets(method).contains(gates)) continue;
            var carried = new ArrayList<Integer>(List.of(channel));
            for (int at = raise; at < recreate; at++) if (code.get(at) instanceof TwoRegisterInstruction two) carried.add(two.getRegisterB());
            boolean overwritten = false;
            for (int at = gates; at < raise; at++) for (int register : carried) overwritten |= chatChannelWrites(code.get(at), register);
            if (!overwritten) out.add(method);
        }
        return out;
    }

    private static boolean chatChannelWrites(Instruction i, int register) {
        return i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction one && (one.getRegisterA() == register ||
            (i.getOpcode().setsWideRegister() && one.getRegisterA() + 1 == register));
    }

    /**
     * unsent_clear: the notification manager's one method that clears a chat's notification with "UnsendMessage" when
     * the unsent message is the only one it shows. Its recaller call's message id register must be the one the drop log
     * after the clear prints, unwritten between, and no jump may land on the load or the clear. Mirrors MessageLog.kt's
     * findUnsentClear.
     */
    static List<Method> unsentClear(List<ClassDef> classes) {
        String manager = "Lcom/facebook/messaging/notify/client/MessagesNotificationManager;";
        Method match = null;
        for (var cls : classes) {
            if (!manager.equals(cls.getType())) continue;
            for (var method : cls.getMethods()) {
                if (method.getImplementation() == null || !stringsOf(method).contains("new_message_notification_recalled_by_clearing")) continue;
                var code = instructions(method);
                int reason = -1, loads = 0;
                for (int at = 0; at + 1 < code.size(); at++) {
                    var load = code.get(at);
                    if ((load.getOpcode() != Opcode.CONST_STRING && load.getOpcode() != Opcode.CONST_STRING_JUMBO) ||
                        !(((ReferenceInstruction) load).getReference() instanceof StringReference s) || !"UnsendMessage".equals(s.getString())) continue;
                    var args = callArgs(code.get(at + 1));
                    if (!invokes(code.get(at + 1), manager, CLEAR_THREAD_PARAMETERS, "V") || args.isEmpty() ||
                        args.get(args.size() - 1) != ((OneRegisterInstruction) load).getRegisterA()) continue;
                    reason = at;
                    loads++;
                }
                if (loads != 1) continue;
                var jumps = mediaTargets(method);
                if (jumps.contains(reason) || jumps.contains(reason + 1)) continue;
                Integer id = null;
                int recalls = 0;
                for (var i : code) {
                    if (i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE ||
                        !invokes(i, null, RECALLER_PARAMETERS, "Z")) continue;
                    recalls++;
                    var args = callArgs(i);
                    id = args.size() > 2 ? args.get(2) : null;
                }
                if (recalls != 1 || id == null) continue;
                int end = -1;
                for (int at = reason + 2; at < code.size(); at++) if (!code.get(at).getOpcode().canContinue()) { end = at; break; }
                if (end < 0) continue;
                int log = -1, logs = 0;
                for (int at = reason + 2; at < end; at++) {
                    var i = code.get(at);
                    if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) &&
                        invokes(i, manager, DROP_LOG_PARAMETERS, "V")) { log = at; logs++; }
                }
                if (logs != 1) continue;
                var logArgs = callArgs(code.get(log));
                if (logArgs.size() < 3 || logArgs.get(2).intValue() != id) continue;
                boolean rewritten = false;
                for (int at = reason; at < log; at++) if (writes(code.get(at), id)) rewritten = true;
                if (rewritten) continue;
                if (match != null) return List.of();
                match = method;
            }
        }
        return match == null ? List.of() : List.of(match);
    }

    static final String PARTICIPANT_INFO = "Lcom/facebook/messaging/model/messages/ParticipantInfo;";

    /**
     * quiet_log_drop: the notification manager's one (session, new-message notification)V method that logs itself as
     * notifyNewMessageInternal, with room for the drop's four locals, when the message log resolves and every field the
     * drop reads is one the manager may read: the notification's Message, the Message's thread key, id and "senderInfo"
     * ParticipantInfo, that person's "name" and SecretString's text. Mirrors QuietChats.kt.
     */
    static List<Method> quietLogDrop(List<ClassDef> classes) {
        ClassDef manager = null, firstNotification = null, firstSecret = null;
        for (var cls : classes) {
            if (manager == null && MESSAGES_NOTIFICATION_MANAGER.equals(cls.getType())) manager = cls;
            if (firstNotification == null && NEW_MESSAGE_NOTIFICATION.equals(cls.getType())) firstNotification = cls;
            if (firstSecret == null && SECRET_STRING.equals(cls.getType())) firstSecret = cls;
        }
        if (manager == null || firstNotification == null || firstSecret == null) return List.of();
        var drops = new ArrayList<Method>();
        for (var m : manager.getMethods())
            if ("V".equals(m.getReturnType()) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null &&
                m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(BUBBLE_SESSION, NEW_MESSAGE_NOTIFICATION)) &&
                stringsOf(m).contains("notifyNewMessageInternal")) drops.add(m);
        if (drops.size() != 1 || drops.get(0).getImplementation().getRegisterCount() < 3 + 4) return List.of();
        var drop = drops.get(0);
        // The message log's own contract, as resolveMessageLogContract has it, without the hook's room.
        String messageId = messageIdField(classes);
        if (messageId == null || hiddenTextField(classes) == null) return List.of();
        var ctors = new ArrayList<Method>();
        for (var m : firstNotification.getMethods()) {
            var params = m.getParameterTypes();
            if ("<init>".equals(m.getName()) && "V".equals(m.getReturnType()) && params.size() >= 3 &&
                MESSENGER_ACCOUNT_TYPE.contentEquals(params.get(0)) && MESSAGE_TYPE.contentEquals(params.get(1)) &&
                THREAD_SUMMARY_TYPE.contentEquals(params.get(2)) && m.getImplementation() != null) ctors.add(m);
        }
        if (ctors.size() != 1 || !messageLogContract(classes, ctors.get(0))) return List.of();
        String threadKey = objectReads(ctors.get(0), MESSAGE_TYPE, THREAD_KEY).iterator().next();
        String text = secretTextField(firstSecret);
        // The drop's own fields, from the last class of each type, as associateBy keeps it.
        var byType = new HashMap<String, ClassDef>();
        for (var cls : classes) byType.put(cls.getType(), cls);
        var message = byType.get(MESSAGE_TYPE);
        var notification = byType.get(NEW_MESSAGE_NOTIFICATION);
        var participant = byType.get(PARTICIPANT_INFO);
        var secret = byType.get(SECRET_STRING);
        if (text == null || message == null || participant == null) return List.of();
        var reads = objectReads(drop, NEW_MESSAGE_NOTIFICATION, MESSAGE_TYPE);
        var senders = new LinkedHashSet<String>();
        for (var cls : classes) for (var m : cls.getMethods())
            if ("Lorg/json/JSONObject;".equals(m.getReturnType()) &&
                m.getParameterTypes().stream().map(Object::toString).toList().contains(MESSAGE_TYPE)) senders.addAll(keyedObjectReads(m, "senderInfo"));
        var names = new LinkedHashSet<String>();
        for (var cls : classes) {
            if (!PARTICIPANT_INFO.equals(cls.getType())) continue;
            for (var m : cls.getMethods()) {
                if (!"toString".equals(m.getName()) || !m.getParameterTypes().isEmpty() || !"Ljava/lang/String;".equals(m.getReturnType())) continue;
                var code = instructions(m);
                for (int at = 0; at + 1 < code.size(); at++) {
                    var load = code.get(at);
                    if ((load.getOpcode() != Opcode.CONST_STRING && load.getOpcode() != Opcode.CONST_STRING_JUMBO) || !"name".equals(text(load))) continue;
                    if (code.get(at + 1).getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) code.get(at + 1)).getReference() instanceof FieldReference f &&
                        PARTICIPANT_INFO.equals(f.getDefiningClass()) && SECRET_STRING.equals(f.getType())) names.add(fieldId(f));
                }
            }
        }
        if (reads.size() != 1 || senders.size() != 1 || names.size() != 1) return List.of();
        String reader = MESSAGES_NOTIFICATION_MANAGER;
        return readableFrom(notification, reads.iterator().next(), reader) && readableFrom(message, senders.iterator().next(), reader) &&
            readableFrom(message, threadKey, reader) && readableFrom(message, messageId, reader) &&
            readableFrom(participant, names.iterator().next(), reader) && readableFrom(secret, text, reader) ? List.of(drop) : List.of();
    }

    /** Message ParticipantInfo fields read straight after `const-string key` and put into a JSONObject under it, on the same registers. */
    static Set<String> keyedObjectReads(Method method, String key) {
        var out = new LinkedHashSet<String>();
        var code = instructions(method);
        for (int at = 0; at + 2 < code.size(); at++) {
            var load = code.get(at);
            if ((load.getOpcode() != Opcode.CONST_STRING && load.getOpcode() != Opcode.CONST_STRING_JUMBO) || !key.equals(text(load))) continue;
            var read = code.get(at + 1);
            if (read.getOpcode() != Opcode.IGET_OBJECT || !(((ReferenceInstruction) read).getReference() instanceof FieldReference f) ||
                !MESSAGE_TYPE.equals(f.getDefiningClass()) || !PARTICIPANT_INFO.equals(f.getType())) continue;
            if (!(code.get(at + 2) instanceof FiveRegisterInstruction put) || !JSON_PUT.equals(ref(code.get(at + 2))) || put.getRegisterCount() != 3 ||
                put.getRegisterD() != register(load) || put.getRegisterE() != ((TwoRegisterInstruction) read).getRegisterA()) continue;
            out.add(fieldId(f));
        }
        return out;
    }

    /** The String field SecretString's one (String) constructor fills from its argument, or null. Mirrors resolveMessageLogContract. */
    static String secretTextField(ClassDef secret) {
        var ctors = new ArrayList<Method>();
        for (var m : secret.getMethods())
            if ("<init>".equals(m.getName()) && m.getImplementation() != null &&
                m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/lang/String;"))) ctors.add(m);
        if (ctors.size() != 1) return null;
        int argument = ctors.get(0).getImplementation().getRegisterCount() - 1;
        var texts = new LinkedHashSet<String>();
        for (var i : instructions(ctors.get(0)))
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f && SECRET_STRING.equals(f.getDefiningClass()) &&
                "Ljava/lang/String;".equals(f.getType()) && i instanceof TwoRegisterInstruction t && t.getRegisterA() == argument) texts.add(fieldId(f));
        return texts.size() == 1 ? texts.iterator().next() : null;
    }

    /** Whether cls declares the field where code in reader can read it: public, or non-private in the reader's package. */
    static boolean readableFrom(ClassDef cls, String id, String reader) {
        for (var f : cls.getFields()) {
            if (!(cls.getType() + "->" + f.getName() + ":" + f.getType()).equals(id)) continue;
            String pkg = cls.getType().substring(0, cls.getType().lastIndexOf('/'));
            return AccessFlags.PUBLIC.isSet(f.getAccessFlags()) || (!AccessFlags.PRIVATE.isSet(f.getAccessFlags()) &&
                pkg.equals(reader.substring(0, reader.lastIndexOf('/'))));
        }
        return false;
    }

    static final String SECRET_STRING = "Lcom/facebook/secure/secrettypes/SecretString;";
    static final String MESSAGES_NOTIFICATION_MANAGER = "Lcom/facebook/messaging/notify/client/MessagesNotificationManager;";
    static final String UNSEND_RETRACTION = "messenger_android_unsend_notificaiton_retraction";

    /** Two free locals past the parameters, as MessageLog.kt's validateMessageLog needs for the hook. */
    static boolean messageLogRoom(Method ctor) {
        int words = 1;
        for (var type : ctor.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        return !AccessFlags.STATIC.isSet(ctor.getAccessFlags()) && ctor.getImplementation().getRegisterCount() >= words + 2;
    }

    static String fieldId(FieldReference field) {
        return field.getDefiningClass() + "->" + field.getName() + ":" + field.getType();
    }

    /** The instance fields of owner with this type that the method reads with iget-object, as MessageLog.kt's fieldReads. */
    static Set<String> objectReads(Method method, String owner, String type) {
        var reads = new LinkedHashSet<String>();
        for (var i : instructions(method))
            if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f &&
                owner.equals(f.getDefiningClass()) && type.equals(f.getType())) reads.add(fieldId(f));
        return reads;
    }

    /** Whether cls declares the field where the notification class can read it: public, or non-private in its package. */
    static boolean readableFromNotification(ClassDef cls, String id) {
        for (var f : cls.getFields()) {
            if (!(cls.getType() + "->" + f.getName() + ":" + f.getType()).equals(id)) continue;
            String pkg = cls.getType().substring(0, cls.getType().lastIndexOf('/'));
            return AccessFlags.PUBLIC.isSet(f.getAccessFlags()) || (!AccessFlags.PRIVATE.isSet(f.getAccessFlags()) &&
                pkg.equals(NEW_MESSAGE_NOTIFICATION.substring(0, NEW_MESSAGE_NOTIFICATION.lastIndexOf('/'))));
        }
        return false;
    }

    /**
     * The rest of MessageLog.kt's resolveMessageLogContract, which messageIdField and hiddenTextField start: one text
     * field Message's SecretString getter reads, one String field SecretString's constructor fills from its argument,
     * both readable from the notification, one ThreadKey field the constructor loads and one unsent check.
     */
    static boolean messageLogContract(List<ClassDef> classes, Method ctor) {
        ClassDef message = null, secret = null;
        for (var cls : classes) {
            if (message == null && MESSAGE_TYPE.equals(cls.getType())) message = cls;
            if (secret == null && SECRET_STRING.equals(cls.getType())) secret = cls;
        }
        if (message == null || secret == null) return false;
        var bodies = new LinkedHashSet<String>();
        for (var m : message.getMethods())
            if (SECRET_STRING.equals(m.getReturnType()) && m.getImplementation() != null && stringsOf(m).contains("text"))
                bodies.addAll(objectReads(m, MESSAGE_TYPE, SECRET_STRING));
        var secretCtors = new ArrayList<Method>();
        for (var m : secret.getMethods())
            if ("<init>".equals(m.getName()) && m.getImplementation() != null &&
                m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/lang/String;"))) secretCtors.add(m);
        if (bodies.size() != 1 || secretCtors.size() != 1) return false;
        int argument = secretCtors.get(0).getImplementation().getRegisterCount() - 1;
        var texts = new LinkedHashSet<String>();
        for (var i : instructions(secretCtors.get(0)))
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f && SECRET_STRING.equals(f.getDefiningClass()) &&
                "Ljava/lang/String;".equals(f.getType()) && i instanceof TwoRegisterInstruction t && t.getRegisterA() == argument) texts.add(fieldId(f));
        return texts.size() == 1 && readableFromNotification(message, bodies.iterator().next()) &&
            readableFromNotification(secret, texts.iterator().next()) && objectReads(ctor, MESSAGE_TYPE, THREAD_KEY).size() == 1 &&
            unsentChecks(classes).size() == 1;
    }

    /**
     * MessageLog.kt's findUnsentChecks: the (Message)Z checks the notification manager calls where it logs an unsend
     * retraction, kept when their public class holds them as public static checks of one long Message field.
     */
    static Set<String> unsentChecks(List<ClassDef> classes) {
        ClassDef manager = null;
        for (var cls : classes) if (MESSAGES_NOTIFICATION_MANAGER.equals(cls.getType())) { manager = cls; break; }
        if (manager == null) return Set.of();
        var called = new HashSet<String>();
        for (var m : manager.getMethods()) {
            if (m.getImplementation() == null || !stringsOf(m).contains(UNSEND_RETRACTION)) continue;
            for (var i : instructions(m))
                if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) && i instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference mr && "Z".equals(mr.getReturnType()) &&
                    mr.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(MESSAGE_TYPE))) called.add(mr.toString());
        }
        var owners = new HashSet<String>();
        for (var id : called) owners.add(id.substring(0, id.indexOf("->")));
        var checks = new LinkedHashSet<String>();
        for (var cls : classes) {
            if (!owners.contains(cls.getType()) || !AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) continue;
            for (var m : cls.getMethods()) if (called.contains(hookId(m)) && unsentCheck(m)) checks.add(hookId(m));
        }
        return checks;
    }

    static Long wide(Instruction i) {
        return i instanceof WideLiteralInstruction w ? w.getWideLiteral() : null;
    }

    static boolean isNarrow(Instruction i, long value) {
        return i instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == value;
    }

    static TwoRegisterInstruction twoRegister(List<Instruction> code, int at, Opcode op) {
        return code.get(at).getOpcode() == op && code.get(at) instanceof TwoRegisterInstruction t ? t : null;
    }

    /**
     * XheAudio.kt's source checks for xhe_transcode: the worker's source path (its first String parameter, the fourth
     * register from the top) is read before anything overwrites it, and it or a plain copy of it reaches a static
     * (String)Uri call, Messenger parsing the source it's about to read.
     */
    static boolean transcodeSourceParsed(Method method) {
        var code = instructions(method);
        int source = method.getImplementation().getRegisterCount() - 6 + 3;
        var holders = new HashSet<Integer>(List.of(source));
        boolean read = false;
        for (Instruction insn : code) {
            List<Integer> named = new ArrayList<>();
            if (insn instanceof FiveRegisterInstruction f) {
                int[] all = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
                for (int i = 0; i < f.getRegisterCount(); i++) named.add(all[i]);
            } else if (insn instanceof RegisterRangeInstruction r) {
                for (int i = 0; i < r.getRegisterCount(); i++) named.add(r.getStartRegister() + i);
            }
            Opcode op = insn.getOpcode();
            Integer written = op.setsRegister() && !op.name.endsWith("/2addr") && insn instanceof OneRegisterInstruction o
                ? o.getRegisterA() : null;
            if (insn instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference m &&
                (op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE) && "Landroid/net/Uri;".equals(m.getReturnType()) &&
                m.getParameterTypes().size() == 1 && "Ljava/lang/String;".contentEquals(m.getParameterTypes().get(0)) &&
                named.size() == 1 && holders.contains(named.get(0))) return true;
            if ((op == Opcode.MOVE_OBJECT || op == Opcode.MOVE_OBJECT_FROM16 || op == Opcode.MOVE_OBJECT_16) &&
                holders.contains(((TwoRegisterInstruction) insn).getRegisterB())) {
                holders.add(((TwoRegisterInstruction) insn).getRegisterA());
                read = true;
                continue;
            }
            if (!read && written != null && (written == source || (op.setsWideRegister() && written + 1 == source))) return false;
            if (named.contains(source)) read = true;
            if (written != null) {
                holders.remove(written);
                if (op.setsWideRegister()) holders.remove(written + 1);
            }
            if (holders.isEmpty()) return false;
        }
        return false;
    }

    /**
     * OriginalVideo.kt's videoPassthroughSite: the one size check against the bitrate limit plus Messenger's configured
     * margin, with the limit arithmetic, the metadata reads and the registers the hook needs all where 583 has them.
     */
    static boolean videoPassthroughSite(Method method) {
        var code = instructions(method);
        var sites = new ArrayList<Integer>();
        for (int c = 9; c < code.size() - 1; c++) {
            if (code.get(c).getOpcode() != Opcode.CMP_LONG) continue;
            boolean configured = c >= 11 && code.get(c + 1).getOpcode() == Opcode.IF_LTZ &&
                code.get(c - 6).getOpcode() == Opcode.CONST_WIDE_16 && Long.valueOf(8000L).equals(wide(code.get(c - 6))) &&
                isNarrow(code.get(c - 3), 1000);
            boolean constant = code.get(c + 1).getOpcode() == Opcode.IF_GEZ &&
                code.get(c - 4).getOpcode() == Opcode.CONST_WIDE_16 && Long.valueOf(8000L).equals(wide(code.get(c - 4))) &&
                code.get(c - 2).getOpcode() == Opcode.CONST_WIDE_32 && Long.valueOf(5_000_000L).equals(wide(code.get(c - 2))) &&
                code.get(c - 3).getOpcode() == Opcode.DIV_LONG_2ADDR && code.get(c - 5).getOpcode() == Opcode.MUL_LONG_2ADDR;
            if (configured || constant) sites.add(c);
        }
        if (sites.size() != 1) return false;
        int c = sites.get(0);
        boolean constant = code.get(c - 2).getOpcode() == Opcode.CONST_WIDE_32 && Long.valueOf(5_000_000L).equals(wide(code.get(c - 2)));
        var cmp = (ThreeRegisterInstruction) code.get(c);
        int limit = cmp.getRegisterC(), size = cmp.getRegisterB(), result = cmp.getRegisterA();
        var add = twoRegister(code, c - 1, Opcode.ADD_LONG_2ADDR);
        var div = twoRegister(code, constant ? c - 3 : c - 5, Opcode.DIV_LONG_2ADDR);
        var mul = twoRegister(code, constant ? c - 5 : c - 7, Opcode.MUL_LONG_2ADDR);
        var duration = twoRegister(code, constant ? c - 6 : c - 8, Opcode.IGET_WIDE);
        var widen = twoRegister(code, constant ? c - 7 : c - 9, Opcode.INT_TO_LONG);
        var bytes = twoRegister(code, constant ? c - 9 : c - 11, Opcode.IGET_WIDE);
        if (add == null || div == null || mul == null || duration == null || widen == null || bytes == null) return false;
        int temp = register(code.get(constant ? c - 2 : c - 6));
        if (constant) {
            if (register(code.get(c - 2)) != temp) return false;
        } else {
            var widenMargin = twoRegister(code, c - 2, Opcode.INT_TO_LONG);
            var margin = twoRegister(code, c - 3, Opcode.MUL_INT_LIT16);
            if (widenMargin == null || margin == null || widenMargin.getRegisterA() != temp || widenMargin.getRegisterB() != temp ||
                margin.getRegisterA() != temp || margin.getRegisterB() != temp) return false;
        }
        if (add.getRegisterA() != limit || add.getRegisterB() != temp || div.getRegisterA() != limit ||
            div.getRegisterB() != temp || mul.getRegisterA() != limit || mul.getRegisterB() != duration.getRegisterA() ||
            widen.getRegisterA() != limit || widen.getRegisterB() != limit) return false;
        var bytesField = (FieldReference) ((ReferenceInstruction) bytes).getReference();
        var durationField = (FieldReference) ((ReferenceInstruction) duration).getReference();
        if (bytes.getRegisterA() != size || !"J".equals(bytesField.getType()) || !"J".equals(durationField.getType()) ||
            !bytesField.getDefiningClass().equals(durationField.getDefiningClass()) || bytesField.getName().equals(durationField.getName()) ||
            bytes.getRegisterB() != duration.getRegisterB()) return false;
        // Nothing between the size read and the compare may write the size pair.
        for (int at = (constant ? c - 8 : c - 10); at < c; at++) {
            if (!(code.get(at) instanceof OneRegisterInstruction one)) continue;
            int written = one.getRegisterA();
            if (written == size || written == size + 1 || written + 1 == size) return false;
        }
        return register(code.get(c + 1)) == result && !mediaTargets(method).contains(c + 1) &&
            result <= 15 && size + 1 <= 15 && result != size && result != size + 1;
    }

    /** Static, public, (Message)Z, and all it reads is one long field of the message, compared once. */
    static boolean unsentCheck(Method m) {
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) ||
            !m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(MESSAGE_TYPE))) return false;
        var code = instructions(m);
        var touches = code.stream().filter(i -> i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference).toList();
        if (touches.size() != 1 || touches.get(0).getOpcode() != Opcode.IGET_WIDE) return false;
        var field = (FieldReference) ((ReferenceInstruction) touches.get(0)).getReference();
        return MESSAGE_TYPE.equals(field.getDefiningClass()) && "J".equals(field.getType()) &&
            code.stream().filter(i -> i.getOpcode() == Opcode.CMP_LONG).count() == 1;
    }
}
