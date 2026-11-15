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
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Message menus: save voice, message actions, seen and reply-read reports, ads, MQTT telemetry, text style and pinned chats. */
final class Menus {

    static final String MENU_PARAMS = "Lcom/facebook/messaging/dialog/MenuDialogParams;";
    static final String MENU_ITEM = "Lcom/facebook/messaging/dialog/MenuDialogItem;";
    static final String MENU_MESSAGE = "Lcom/facebook/messaging/model/messages/Message;";
    static final String MENU_AUDIO_DATA = "Lcom/facebook/messaging/attachments/AudioAttachmentData;";
    static final String MENU_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;";
    static final String MENU_COPY_OF = "Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;";
    static final String MENU_FRAGMENT = "Lcom/facebook/messaging/dialog/MenuDialogFragment;";
    static final String MORE_SHEET_TAG = "MORE_ACTION_DRAWER_MENU_DIALOG_TAG";
    static final String AUDIO_MESSAGE_CAST = "null cannot be cast to non-null type com.facebook.xapp.messaging.threadview.model.audio.AudioMessage";

    static String menuString(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s ? s.getString() : null;
    }

    static FieldReference menuField(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f ? f : null;
    }

    static MethodReference menuCall(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m ? m : null;
    }

    static boolean menuOpenClass(Map<String, ClassDef> byType, String type) {
        var cls = byType.get(type);
        return cls != null && AccessFlags.PUBLIC.isSet(cls.getAccessFlags());
    }

    static boolean menuOpenField(Map<String, ClassDef> byType, FieldReference field, boolean write) {
        if (!menuOpenClass(byType, field.getDefiningClass())) return false;
        for (var f : byType.get(field.getDefiningClass()).getFields())
            if (f.getName().equals(field.getName()) && f.getType().equals(field.getType()) && AccessFlags.PUBLIC.isSet(f.getAccessFlags()) &&
                (!write || !AccessFlags.FINAL.isSet(f.getAccessFlags()))) return true;
        return false;
    }

    static boolean menuOpenMethod(Map<String, ClassDef> byType, MethodReference call, boolean isStatic) {
        if (!menuOpenClass(byType, call.getDefiningClass())) return false;
        for (var m : byType.get(call.getDefiningClass()).getMethods())
            if (m.getName().equals(call.getName()) && m.getReturnType().equals(call.getReturnType()) && params(m).equals(refParams(call)) &&
                AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && AccessFlags.STATIC.isSet(m.getAccessFlags()) == isStatic) return true;
        return false;
    }

    static boolean menuOpenConstructor(Map<String, ClassDef> byType, String type, List<String> wanted) {
        if (!menuOpenClass(byType, type)) return false;
        for (var m : byType.get(type).getMethods())
            if (m.getName().equals("<init>") && params(m).equals(wanted) && AccessFlags.PUBLIC.isSet(m.getAccessFlags())) return true;
        return false;
    }

    /** MenuDialogParams' constructor from its builder, reading the row list straight into its one ImmutableList copy. */
    static boolean menuRowsSite(Method method) {
        var params = params(method);
        if (!MENU_PARAMS.equals(method.getDefiningClass()) || !"<init>".equals(method.getName()) || params.size() != 1 || params.get(0).startsWith("Landroid")) return false;
        var code = instructions(method);
        int copy = -1;
        for (int i = 0; i < code.size(); i++) if (MENU_COPY_OF.equals(ref(code.get(i)))) {
            if (copy >= 0) return false;
            copy = i;
        }
        if (copy <= 0 || copy + 1 >= code.size()) return false;
        var read = code.get(copy - 1);
        var rows = menuField(read);
        if (rows == null || read.getOpcode() != Opcode.IGET_OBJECT || !rows.getDefiningClass().equals(params.get(0)) || !"Ljava/util/List;".equals(rows.getType())) return false;
        int list = ((TwoRegisterInstruction) read).getRegisterA(), source = ((TwoRegisterInstruction) read).getRegisterB();
        if (!callArgs(code.get(copy)).equals(List.of(list)) || code.get(copy + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return false;
        int scratch = register(code.get(copy + 1));
        if (scratch == list || scratch == source || scratch > 15) return false;
        var extras = new HashSet<String>();
        for (var i : code) {
            var f = menuField(i);
            if (f != null && i.getOpcode() == Opcode.IGET_OBJECT && f.getDefiningClass().equals(params.get(0)) && "Ljava/lang/Object;".equals(f.getType()) &&
                ((TwoRegisterInstruction) i).getRegisterB() == source) extras.add(f.toString());
        }
        return extras.size() == 1;
    }

    static final String MENU_BUNDLE_READ = "Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;";

    /**
     * What the Bundle key read at {@code at} says when it's a Redex string pool's answer, as 586's family B taps read it: a
     * constant key, the pool's static (I)String lookup, its answer, then getParcelable by it cast straight to a Message.
     * Null for anything else. Mirrors SaveVoiceMenu.kt's pooledMessageKey and the pool check in resolveSaveVoiceMenu.
     */
    static String menuPooledMessageKey(Map<String, ClassDef> byType, List<Instruction> code, int at) {
        if (at < 2 || at + 3 >= code.size() || code.get(at).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(at - 1).getOpcode() != Opcode.INVOKE_STATIC ||
            !(code.get(at - 1) instanceof FiveRegisterInstruction lookup) || lookup.getRegisterCount() != 1) return null;
        var pool = menuCall(lookup);
        if (pool == null || !"Ljava/lang/String;".equals(pool.getReturnType()) || !refParams(pool).equals(List.of("I"))) return null;
        var key = code.get(at - 2);
        if (!Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16).contains(key.getOpcode()) || register(key) != lookup.getRegisterC()) return null;
        var read = code.get(at + 1);
        var args = callArgs(read);
        if (read.getOpcode() != Opcode.INVOKE_VIRTUAL || !MENU_BUNDLE_READ.equals(ref(read)) || args.size() < 2 || args.get(1) != register(code.get(at))) return null;
        var message = code.get(at + 2);
        var cast = code.get(at + 3);
        if (message.getOpcode() != Opcode.MOVE_RESULT_OBJECT || cast.getOpcode() != Opcode.CHECK_CAST || !MENU_MESSAGE.equals(ref(cast)) || register(cast) != register(message)) return null;
        var owner = byType.get(pool.getDefiningClass());
        if (owner == null) return null;
        var pools = new ArrayList<Method>();
        for (var m : owner.getMethods()) if (hookId(m).equals(pool.toString())) pools.add(m);
        return pools.size() == 1 ? poolString(pools.get(0), ((NarrowLiteralInstruction) key).getNarrowLiteral()) : null;
    }

    /** The chat menu's tap method: returns the handler field and its type, or null for anything else. */
    static String[] menuTapSite(Method method, Map<String, ClassDef> byType) {
        if (!"Z".equals(method.getReturnType()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !params(method).equals(List.of(MENU_ITEM, "Ljava/lang/Object;"))) return null;
        var code = instructions(method);
        int start = -1;
        boolean row = false;
        for (int i = 0; i < code.size(); i++) {
            if ("ThreadItemContextMenuHandler".equals(menuString(code.get(i)))) {
                if (start >= 0) return null;
                start = i;
            }
            if ("rowMessage".equals(menuString(code.get(i)))) row = true;
        }
        // Family B builds read the Bundle's key from a string pool instead.
        for (int i = 0; i < code.size() && !row; i++) if ("rowMessage".equals(menuPooledMessageKey(byType, code, i))) row = true;
        if (start < 0 || !row) return null;
        int scratch = register(code.get(start));
        int first = method.getImplementation().getRegisterCount() - 3;
        if (scratch < 0 || first < 0 || scratch >= first || scratch > 15) return null;
        for (int i = 0; i < start; i++) {
            int a = register(code.get(i));
            if (code.get(i).getOpcode().setsRegister() && a >= first && a <= first + 2) return null;
        }
        // The handler sits in a field of its own type (586 kept it in an Object field and cast it after the read).
        for (int i = start; i < code.size(); i++) {
            var f = menuField(code.get(i));
            if (f == null || code.get(i).getOpcode() != Opcode.IGET_OBJECT || !f.getDefiningClass().equals(method.getDefiningClass())) continue;
            if (!f.getType().startsWith("L") || "Ljava/lang/Object;".equals(f.getType())) return null;
            return new String[] {f.toString(), f.getType()};
        }
        return null;
    }

    /** The fetcher's prefetch step: the lazy holder off this, the reader out of it, the voice data, then the data's Uri. */
    static boolean menuAudioPrefetch(Method method) {
        if (!"V".equals(method.getReturnType()) || !params(method).equals(List.of(MENU_SESSION, MENU_MESSAGE))) return false;
        var code = instructions(method);
        if (code.size() < 9) return false;
        var wanted = List.of(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.IGET_OBJECT);
        for (int i = 0; i < wanted.size(); i++) if (code.get(i).getOpcode() != wanted.get(i)) return false;
        var holder = menuField(code.get(0));
        var get = menuCall(code.get(1));
        var read = menuCall(code.get(5));
        var uri = menuField(code.get(8));
        if (holder == null || get == null || read == null || uri == null) return false;
        return get.getDefiningClass().equals(holder.getType()) && refParams(get).equals(List.of(holder.getType())) && "Ljava/lang/Object;".equals(get.getReturnType()) &&
            read.getDefiningClass().equals(ref(code.get(3))) && MENU_AUDIO_DATA.equals(read.getReturnType()) && refParams(read).equals(List.of(MENU_MESSAGE, "Ljava/lang/String;")) &&
            MENU_AUDIO_DATA.equals(uri.getDefiningClass()) && "Landroid/net/Uri;".equals(uri.getType());
    }

    /** The held message's More sheet, with the held row's copy still in its register after the builder's made: returns the builder's type, or null. */
    static String moreSheetBuilder(Method method) {
        if (!"V".equals(method.getReturnType()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || params(method).size() != 4) return null;
        var code = instructions(method);
        boolean tagged = false;
        MethodReference made = null;
        for (var i : code) {
            if (MORE_SHEET_TAG.equals(menuString(i))) tagged = true;
            var call = menuCall(i);
            if (call != null && i.getOpcode() == Opcode.INVOKE_DIRECT && MENU_PARAMS.equals(call.getDefiningClass()) && "<init>".equals(call.getName())) {
                if (made != null) return null;
                made = call;
            }
        }
        if (!tagged || made == null || refParams(made).size() != 1) return null;
        String builderType = refParams(made).get(0);
        int at = -1;
        for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.NEW_INSTANCE && builderType.equals(ref(code.get(i)))) {
            if (at >= 0) return null;
            at = i;
        }
        if (at < 0 || at + 2 >= code.size()) return null;
        int builder = register(code.get(at));
        var start = code.get(at + 1);
        if (start.getOpcode() != Opcode.INVOKE_DIRECT || !(builderType + "-><init>()V").equals(ref(start)) || !callArgs(start).equals(List.of(builder))) return null;
        int last = method.getImplementation().getRegisterCount() - 1, copy = -1;
        for (int i = 0; i < code.size() && copy < 0; i++)
            if (code.get(i).getOpcode() == Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction) code.get(i)).getRegisterB() == last) copy = i;
        if (copy < 0 || copy >= at) return null;
        int hold = register(code.get(copy));
        if (hold == builder || hold > 15 || builder > 15) return null;
        for (int i = copy + 1; i < at; i++) {
            int a = register(code.get(i));
            var op = code.get(i).getOpcode();
            if (a >= 0 && (op.setsRegister() && a == hold || op.setsWideRegister() && a + 1 == hold)) return null;
        }
        return builderType;
    }

    /** A More sheet's tap: reads the row's id, hands the tap to a listener of four parameters, and has a local to spare. */
    static boolean menuSheetTap(Method method) {
        if (!"Z".equals(method.getReturnType()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !params(method).equals(List.of(MENU_ITEM, "Ljava/lang/Object;")) ||
            method.getImplementation() == null || method.getImplementation().getRegisterCount() - 3 < 1) return false;
        boolean readsId = false, handsOn = false;
        for (var i : instructions(method)) {
            var f = menuField(i);
            if (i.getOpcode() == Opcode.IGET && f != null && MENU_ITEM.equals(f.getDefiningClass()) && "I".equals(f.getType())) readsId = true;
            var call = menuCall(i);
            if (i.getOpcode() == Opcode.INVOKE_INTERFACE && call != null && "V".equals(call.getReturnType()) && refParams(call).size() == 4) handsOn = true;
        }
        return readsId && handsOn;
    }

    /** The one field of the tap's class it reads straight into a cast to this type, or null. */
    static FieldReference menuTapFieldCastTo(List<Instruction> code, String owner, String type) {
        FieldReference found = null;
        for (int i = 0; i + 1 < code.size(); i++) {
            var f = menuField(code.get(i));
            var cast = code.get(i + 1);
            if (f == null || code.get(i).getOpcode() != Opcode.IGET_OBJECT || !owner.equals(f.getDefiningClass()) || cast.getOpcode() != Opcode.CHECK_CAST ||
                !type.equals(ref(cast)) || register(cast) != register(code.get(i))) continue;
            if (found != null && !found.toString().equals(f.toString())) return null;
            found = f;
        }
        return found;
    }

    /** The sheet and its tap, taken only when every piece their stubs are written from reads as expected and is public. */
    static List<Method> saveVoiceSheet(List<ClassDef> classes, Map<String, ClassDef> byType) {
        Method sheet = null;
        String builderType = null;
        for (var c : classes) for (var m : c.getMethods()) {
            String built = moreSheetBuilder(m);
            if (built == null) continue;
            if (sheet != null) return List.of();
            sheet = m;
            builderType = built;
        }
        if (sheet == null) return List.of();
        var sheetClass = byType.get(sheet.getDefiningClass());
        var builderClass = byType.get(builderType);
        if (sheetClass == null || builderClass == null) return List.of();
        int sessions = 0;
        boolean openSession = false;
        for (var f : sheetClass.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && MENU_SESSION.equals(f.getType())) {
            sessions++;
            openSession = AccessFlags.PUBLIC.isSet(f.getAccessFlags());
        }
        int adds = 0;
        for (var m : builderClass.getMethods())
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) && AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && "V".equals(m.getReturnType()) && params(m).equals(List.of(MENU_ITEM))) adds++;
        if (sessions != 1 || !openSession || adds != 1 || !AccessFlags.PUBLIC.isSet(sheetClass.getAccessFlags()) || !menuOpenClass(byType, builderType)) return List.of();

        var sheetCode = instructions(sheet);
        var tapTypes = new LinkedHashSet<String>();
        for (int at = 0; at < sheetCode.size(); at++) {
            var f = menuField(sheetCode.get(at));
            if (sheetCode.get(at).getOpcode() != Opcode.IPUT_OBJECT || f == null || !MENU_FRAGMENT.equals(f.getDefiningClass())) continue;
            for (int i = at - 1; i >= 0; i--) if (sheetCode.get(i).getOpcode() == Opcode.NEW_INSTANCE && register(sheetCode.get(i)) == register(sheetCode.get(at))) {
                tapTypes.add(ref(sheetCode.get(i)));
                break;
            }
        }
        String tapClass = null;
        Method tap = null;
        for (var type : tapTypes) {
            var owner = byType.get(type);
            if (owner == null) continue;
            var taps = new ArrayList<Method>();
            for (var m : owner.getMethods())
                if ("Z".equals(m.getReturnType()) && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && params(m).equals(List.of(MENU_ITEM, "Ljava/lang/Object;"))) taps.add(m);
            if (taps.isEmpty()) continue;
            if (tapClass != null || taps.size() != 1) return List.of();
            tapClass = type;
            tap = taps.get(0);
        }
        if (tap == null || !menuSheetTap(tap) || !menuOpenClass(byType, tapClass)) return List.of();
        var tapCode = instructions(tap);
        var sheetField = menuTapFieldCastTo(tapCode, tapClass, sheet.getDefiningClass());
        var heldField = menuTapFieldCastTo(tapCode, tapClass, params(sheet).get(3));
        if (sheetField == null || heldField == null || !menuOpenField(byType, sheetField, false) || !menuOpenField(byType, heldField, false)) return List.of();

        List<Instruction> caster = null;
        for (var c : classes) for (var m : c.getMethods()) {
            if (!"V".equals(m.getReturnType())) continue;
            var code = instructions(m);
            boolean names = false;
            for (var i : code) if (AUDIO_MESSAGE_CAST.equals(menuString(i))) names = true;
            if (!names) continue;
            if (caster != null) return List.of();
            caster = code;
        }
        if (caster == null) return List.of();
        int named = 0;
        while (!AUDIO_MESSAGE_CAST.equals(menuString(caster.get(named)))) named++;
        // 587 reads the model through the held message's own interface getter; 586 read a field of the row type.
        FieldReference modelField = null;
        MethodReference modelGetter = null;
        if (named >= 1 && caster.get(named - 1).getOpcode() == Opcode.IGET_OBJECT) modelField = menuField(caster.get(named - 1));
        else if (named >= 2 && caster.get(named - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT &&
            (caster.get(named - 2).getOpcode() == Opcode.INVOKE_INTERFACE || caster.get(named - 2).getOpcode() == Opcode.INVOKE_INTERFACE_RANGE)) {
            var call = menuCall(caster.get(named - 2));
            if (call != null && refParams(call).isEmpty() && call.getReturnType().startsWith("L")) modelGetter = call;
        }
        if (modelField == null && modelGetter == null) return List.of();
        String rowModel = modelField != null ? modelField.toString() : modelGetter.toString();
        boolean sheetReads = false;
        for (var i : sheetCode) if ((i.getOpcode() == Opcode.IGET_OBJECT || i.getOpcode() == Opcode.INVOKE_INTERFACE) && rowModel.equals(ref(i))) sheetReads = true;
        if (!sheetReads) return List.of();
        String audioMessage = null;
        for (int i = named + 1; i < Math.min(named + 5, caster.size()) && audioMessage == null; i++)
            if (caster.get(i).getOpcode() == Opcode.CHECK_CAST) audioMessage = ref(caster.get(i));
        if (audioMessage == null || !byType.containsKey(audioMessage)) return List.of();
        int uris = 0;
        boolean openUri = false;
        for (var f : byType.get(audioMessage).getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && "Landroid/net/Uri;".equals(f.getType())) {
            uris++;
            openUri = AccessFlags.PUBLIC.isSet(f.getAccessFlags());
        }
        boolean modelOpen = modelField != null ? menuOpenField(byType, modelField, false) : menuOpenMethod(byType, modelGetter, false);
        if (uris != 1 || !openUri || !modelOpen || !menuOpenClass(byType, audioMessage)) return List.of();
        return List.of(sheet, tap);
    }

    /**
     * save_voice_menu: MenuDialogParams' constructor, the chat menu's tap method, the More sheet and its tap, taken only when
     * every piece the extension's stubs are written from reads as expected and is public. Mirrors SaveVoiceMenu.kt.
     */
    static List<Method> saveVoiceMenu(List<ClassDef> classes) {
        var byType = new HashMap<String, ClassDef>();
        for (var c : classes) byType.put(c.getType(), c);
        var paramsClass = byType.get(MENU_PARAMS);
        if (paramsClass == null) return List.of();
        Method rows = null;
        for (var m : paramsClass.getMethods()) if (menuRowsSite(m)) {
            if (rows != null) return List.of();
            rows = m;
        }
        if (rows == null) return List.of();
        Method tap = null;
        String[] tapSite = null;
        for (var cls : classes) for (var m : cls.getMethods()) {
            var site = menuTapSite(m, byType);
            if (site == null) continue;
            if (tap != null) return List.of();
            tap = m;
            tapSite = site;
        }
        if (tap == null) return List.of();

        // The handler keeps the account the tap's download runs for.
        var handler = byType.get(tapSite[1]);
        if (handler == null) return List.of();
        Field session = null;
        for (var f : handler.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && MENU_SESSION.equals(f.getType())) {
            if (session != null) return List.of();
            session = f;
        }
        if (session == null || !AccessFlags.PUBLIC.isSet(handler.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(session.getAccessFlags()) || !menuOpenClass(byType, tap.getDefiningClass())) return List.of();
        FieldReference tapField = null;
        for (var i : instructions(tap)) {
            var f = menuField(i);
            if (f != null && f.toString().equals(tapSite[0])) { tapField = f; break; }
        }
        if (tapField == null || !menuOpenField(byType, tapField, false)) return List.of();

        // MenuDialogItem's constructor reads its builder in a fixed order: title resource, id, icon, then two more ints.
        var itemClass = byType.get(MENU_ITEM);
        if (itemClass == null) return List.of();
        Method item = null;
        for (var m : itemClass.getMethods()) {
            var p = params(m);
            if ("<init>".equals(m.getName()) && p.size() == 1 && !p.get(0).startsWith("Landroid")) {
                if (item != null) return List.of();
                item = m;
            }
        }
        if (item == null) return List.of();
        var builder = params(item).get(0);
        if (!AccessFlags.PUBLIC.isSet(item.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(itemClass.getAccessFlags()) || !menuOpenConstructor(byType, builder, List.of())) return List.of();
        var itemCode = instructions(item);
        var ints = new ArrayList<Integer>();
        FieldReference builderTitle = null, builderTag = null;
        int titles = 0, tags = 0;
        for (int i = 0; i < itemCode.size(); i++) {
            var f = menuField(itemCode.get(i));
            if (f == null || !f.getDefiningClass().equals(builder)) continue;
            if (itemCode.get(i).getOpcode() == Opcode.IGET) ints.add(i);
            if (itemCode.get(i).getOpcode() == Opcode.IGET_OBJECT && "Ljava/lang/CharSequence;".equals(f.getType())) { builderTitle = f; titles++; }
            if (itemCode.get(i).getOpcode() == Opcode.IGET_OBJECT && "Ljava/lang/String;".equals(f.getType())) { builderTag = f; tags++; }
        }
        if (ints.size() != 5 || ints.get(1) + 1 >= itemCode.size()) return List.of();
        var idStore = itemCode.get(ints.get(1) + 1);
        var itemId = menuField(idStore);
        if (itemId == null || idStore.getOpcode() != Opcode.IPUT || !MENU_ITEM.equals(itemId.getDefiningClass()) || !"I".equals(itemId.getType())) return List.of();
        var builderId = menuField(itemCode.get(ints.get(1)));
        var builderIcon = menuField(itemCode.get(ints.get(2)));
        if (titles != 1 || tags != 1) return List.of();
        for (var f : List.of(builderId, builderIcon, builderTitle, builderTag)) if (!menuOpenField(byType, f, true)) return List.of();
        if (!menuOpenField(byType, itemId, false)) return List.of();

        // The icon is the constant Save video's row stores in the builder's icon field.
        Method saveRow = null;
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!MENU_ITEM.equals(m.getReturnType())) continue;
            boolean names = false;
            for (var i : instructions(m)) if ("save_video".equals(menuString(i))) names = true;
            if (!names) continue;
            if (saveRow != null) return List.of();
            saveRow = m;
        }
        if (saveRow == null) return List.of();
        var saveCode = instructions(saveRow);
        int iconStore = -1;
        for (int i = 0; i < saveCode.size(); i++) if (saveCode.get(i).getOpcode() == Opcode.IPUT && builderIcon.toString().equals(ref(saveCode.get(i)))) { iconStore = i; break; }
        if (iconStore < 1) return List.of();
        var iconLoad = saveCode.get(iconStore - 1);
        if ((iconLoad.getOpcode() != Opcode.CONST && iconLoad.getOpcode() != Opcode.CONST_HIGH16) ||
            register(iconLoad) != ((TwoRegisterInstruction) saveCode.get(iconStore)).getRegisterA()) return List.of();

        // The download, the class that holds it, and the one field of that class whose type reads voice messages for the prefetch.
        var downloads = voiceDownloads(classes);
        if (downloads.size() != 1) return List.of();
        var download = downloads.get(0);
        var fetcher = byType.get(download.getDefiningClass());
        if (fetcher == null) return List.of();
        var request = params(download).get(2);
        if (!menuOpenConstructor(byType, fetcher.getType(), List.of()) || !menuOpenConstructor(byType, request, List.of("Z", "Landroid/net/Uri;")) ||
            !AccessFlags.PUBLIC.isSet(download.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(fetcher.getAccessFlags())) return List.of();
        Field prefetcherField = null;
        Method prefetch = null;
        for (var f : fetcher.getFields()) {
            if (AccessFlags.STATIC.isSet(f.getAccessFlags()) || byType.get(f.getType()) == null) continue;
            Method matched = null;
            int matches = 0;
            for (var m : byType.get(f.getType()).getMethods()) if (menuAudioPrefetch(m)) { matched = m; matches++; }
            if (matches != 1) continue;
            if (prefetcherField != null) return List.of();
            prefetcherField = f;
            prefetch = matched;
        }
        if (prefetcherField == null || !AccessFlags.PUBLIC.isSet(prefetcherField.getAccessFlags()) || !menuOpenClass(byType, prefetcherField.getType())) return List.of();
        var prefetchCode = instructions(prefetch);
        var holderField = menuField(prefetchCode.get(0));
        var holderGet = menuCall(prefetchCode.get(1));
        var reader = ref(prefetchCode.get(3));
        var readAudio = menuCall(prefetchCode.get(5));
        var audioUri = menuField(prefetchCode.get(8));
        if (!menuOpenField(byType, holderField, false) || !menuOpenMethod(byType, holderGet, true) || !menuOpenMethod(byType, readAudio, false) ||
            !menuOpenClass(byType, MENU_AUDIO_DATA) || !menuOpenField(byType, audioUri, false)) return List.of();

        // The reader starts by asking its classifier the message's kind, and goes on only for the one kind that's audio.
        if (byType.get(reader) == null) return List.of();
        Method readMethod = null;
        for (var m : byType.get(reader).getMethods()) if (m.getName().equals(readAudio.getName()) && params(m).equals(refParams(readAudio))) {
            if (readMethod != null) return List.of();
            readMethod = m;
        }
        if (readMethod == null) return List.of();
        var readCode = instructions(readMethod);
        FieldReference classifierField = null;
        for (var i : readCode) {
            var f = menuField(i);
            if (f != null && i.getOpcode() == Opcode.IGET_OBJECT && f.getDefiningClass().equals(reader)) { classifierField = f; break; }
        }
        if (classifierField == null) return List.of();
        // 586's reader asks the classifier's session-free static step itself, the step a row added with no account at hand asks too.
        var classifier = byType.get(classifierField.getType());
        if (classifier == null) return List.of();
        int ask = -1;
        for (int i = 0; i < readCode.size(); i++) {
            var call = menuCall(readCode.get(i));
            if (call != null && readCode.get(i).getOpcode() == Opcode.INVOKE_STATIC && call.getDefiningClass().equals(classifier.getType()) &&
                refParams(call).equals(List.of(classifier.getType(), MENU_MESSAGE))) { ask = i; break; }
        }
        if (ask < 0 || ask + 2 >= readCode.size()) return List.of();
        var asked = menuCall(readCode.get(ask));
        var kind = asked.getReturnType();
        if (readCode.get(ask + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || readCode.get(ask + 2).getOpcode() != Opcode.SGET_OBJECT) return List.of();
        var audioKind = menuField(readCode.get(ask + 2));
        if (audioKind == null || !audioKind.getType().equals(kind)) return List.of();
        Method classify = null;
        for (var m : classifier.getMethods())
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals(kind) && params(m).equals(List.of(classifier.getType(), MENU_MESSAGE))) {
                if (classify != null) return List.of();
                classify = m;
            }
        if (classify == null || !classify.getName().equals(asked.getName()) || !menuOpenField(byType, classifierField, false) || !AccessFlags.PUBLIC.isSet(classifier.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(classify.getAccessFlags()) ||
            !menuOpenField(byType, audioKind, false) || !menuOpenClass(byType, MENU_MESSAGE) || !menuOpenClass(byType, kind)) return List.of();
        var sheet = saveVoiceSheet(classes, byType);
        return sheet.isEmpty() ? List.of() : List.of(rows, tap, sheet.get(0), sheet.get(1));
    }

    static final String ACTIONS_COPY = "Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;";
    static final String ACTIONS_LIST = "Lcom/google/common/collect/ImmutableList;";
    static final String ACTIONS_LIST_BUILDER = "Lcom/google/common/collect/ImmutableList$Builder;";
    static final Set<Opcode> ACTIONS_MOVES = EnumSet.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);

    static Integer actionMoveSource(Instruction i) {
        return ACTIONS_MOVES.contains(i.getOpcode()) ? ((TwoRegisterInstruction) i).getRegisterB() : null;
    }

    /** Whether any try block covers the instruction at index. */
    static boolean actionCovered(Method m, List<Instruction> code, int index) {
        int address = 0;
        for (int k = 0; k < index; k++) address += code.get(k).getCodeUnits();
        for (var b : m.getImplementation().getTryBlocks())
            if (address >= b.getStartCodeAddress() && address < b.getStartCodeAddress() + b.getCodeUnitCount()) return true;
        return false;
    }

    /** The held message itself, or a copy of it made straight from its parameter or from one earlier copy of it. */
    static boolean actionHoldsHeld(List<Instruction> code, int register, int at, int held, int hops) {
        if (register == held) return true;
        for (int k = 0; k < code.size(); k++) if (writes(code.get(k), register)) {
            Integer from = actionMoveSource(code.get(k));
            return k < at && hops > 0 && from != null && actionHoldsHeld(code, from, k, held, hops - 1);
        }
        return false;
    }

    /**
     * message_actions: the method that builds a held message's actions, an instance method of (held message, EnumMap) that
     * names "menuItems", whose only copy measured right away is the full list before the cut, with the message's own sent
     * flag read off it. Mirrors MessageActions.kt's actionsBarSite.
     */
    static boolean messageActionsSite(Method m) {
        var p = params(m);
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().startsWith("L") || p.size() != 2 || !"Ljava/util/EnumMap;".equals(p.get(1))) return false;
        var code = instructions(m);
        boolean marked = false;
        for (var i : code) if ("menuItems".equals(menuString(i))) marked = true;
        if (!marked) return false;
        int copy = -1;
        for (int i = 0; i + 2 < code.size(); i++) {
            if (!ACTIONS_COPY.equals(ref(code.get(i))) || code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
            var c = menuCall(code.get(i + 2));
            if (c == null || !"size".equals(c.getName()) || !"I".equals(c.getReturnType()) || !c.getParameterTypes().isEmpty()) continue;
            if (copy != -1) return false;
            copy = i;
        }
        if (copy == -1) return false;
        int list = register(code.get(copy + 1)), at = copy + 2;
        var size = code.get(at);
        if (size.getOpcode() != Opcode.INVOKE_VIRTUAL && size.getOpcode() != Opcode.INVOKE_INTERFACE || !callArgs(size).equals(List.of(list))) return false;
        if (at + 2 >= code.size() || code.get(at + 1).getOpcode() != Opcode.MOVE_RESULT) return false;
        int scratch = register(code.get(at + 1));
        if (code.get(at + 2).getOpcode() != Opcode.IF_LE || ((TwoRegisterInstruction) code.get(at + 2)).getRegisterA() != scratch) return false;
        if (list > 15 || scratch > 15 || list == scratch || actionCovered(m, code, at)) return false;
        int held = parameterRegister(m, 1);
        for (var i : code) if (writes(i, held)) return false;
        // The sent flag: held.row().call(), the row getter declared on the held message's own type (586 cast and read a field).
        var sent = new HashSet<List<String>>();
        for (int j = 0; j + 3 < code.size(); j++) {
            if (code.get(j).getOpcode() != Opcode.INVOKE_INTERFACE) continue;
            var row = menuCall(code.get(j));
            var call = menuCall(code.get(j + 2));
            var args = callArgs(code.get(j));
            if (row == null || !row.getDefiningClass().equals(p.get(0)) || !row.getParameterTypes().isEmpty() || !row.getReturnType().startsWith("L")) continue;
            if (args.size() != 1 || !actionHoldsHeld(code, args.get(0), j, held, 2) || code.get(j + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
            if (code.get(j + 2).getOpcode() != Opcode.INVOKE_INTERFACE || call == null || !call.getDefiningClass().equals(row.getReturnType())) continue;
            if (!"Z".equals(call.getReturnType()) || !call.getParameterTypes().isEmpty() ||
                !callArgs(code.get(j + 2)).equals(List.of(register(code.get(j + 1)))) ||
                code.get(j + 3).getOpcode() != Opcode.MOVE_RESULT) continue;
            sent.add(List.of(ref(code.get(j)), ref(code.get(j + 2))));
        }
        return sent.size() == 1;
    }

    /**
     * message_actions_more: the held message's More sheet, the one method that names MORE_SHEET_TAG, where the sorted list
     * and the skip past the sort meet at the new row builder. Mirrors MessageActions.kt's actionsMoreSite.
     */
    static boolean messageActionsMoreSite(Method m) {
        if (!"V".equals(m.getReturnType()) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getParameterTypes().size() != 4) return false;
        var code = instructions(m);
        boolean tagged = false;
        for (var i : code) if (MORE_SHEET_TAG.equals(menuString(i))) tagged = true;
        if (!tagged) return false;
        // Every read of the handed list goes through one field; 586 kept a copy of it and built with build(builder).
        int read = -1;
        String field = null;
        for (int k = 0; k < code.size(); k++) {
            var f = menuField(code.get(k));
            if (code.get(k).getOpcode() != Opcode.IGET_OBJECT || f == null || !f.getDefiningClass().equals(m.getDefiningClass()) || !ACTIONS_LIST.equals(f.getType())) continue;
            if (field != null && !field.equals(f.toString())) return false;
            if (read == -1) read = k;
            field = f.toString();
        }
        if (read == -1 || read + 1 >= code.size()) return false;
        int list = ((TwoRegisterInstruction) code.get(read)).getRegisterA();
        int sheet = ((TwoRegisterInstruction) code.get(read)).getRegisterB();
        var test = code.get(read + 1).getOpcode();
        if (test != Opcode.IF_EQZ && test != Opcode.IF_NEZ) return false;
        int at = mediaTarget(code, read + 1);
        if (at < read + 4 || code.get(at).getOpcode() != Opcode.NEW_INSTANCE) return false;
        int scratch = register(code.get(at));
        if (code.get(at - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || register(code.get(at - 1)) != list) return false;
        var built = menuCall(code.get(at - 2));
        if (code.get(at - 2).getOpcode() != Opcode.INVOKE_STATIC || built == null || !ACTIONS_LIST.equals(built.getReturnType()) ||
            !refParams(built).equals(List.of(ACTIONS_LIST_BUILDER, "Ljava/lang/Iterable;"))) return false;
        if (list > 15 || scratch > 15 || sheet > 15 || list == scratch || list == sheet || scratch == sheet) return false;
        for (int k = read + 1; k < at; k++) if (writes(code.get(k), sheet)) return false;
        int landings = 0;
        for (int k = 0; k < code.size(); k++) {
            var op = code.get(k).getOpcode();
            if (code.get(k) instanceof OffsetInstruction && op != Opcode.PACKED_SWITCH && op != Opcode.SPARSE_SWITCH && mediaTarget(code, k) == at) landings++;
        }
        return landings == 1 && !mediaTargets(m, false).contains(at) && !actionCovered(m, code, at);
    }

    static List<Method> messageActions(List<ClassDef> classes) {
        Method found = null;
        for (var c : classes) for (var m : c.getMethods()) if (messageActionsSite(m)) {
            if (found != null) return List.of();
            found = m;
        }
        return found == null ? List.of() : List.of(found);
    }

    static List<Method> messageActionsMore(List<ClassDef> classes) {
        Method found = null;
        for (var c : classes) for (var m : c.getMethods()) if (messageActionsMoreSite(m)) {
            if (found != null) return List.of();
            found = m;
        }
        return found == null ? List.of() : List.of(found);
    }

    static final String SEND_MESSAGE_EVENT = "Lcom/facebook/xapp/messaging/composer/send/event/SendMessageEvent;";

    /**
     * hide_read_receipts: the open chat's seen handler, a static (FbUserSession, own class, String)V that names
     * MARK_THREAD_AS_SEEN_JOB and broadcast_message_seen_internal. reply_read: the common typed composer
     * dispatcher. Mirrors ReadReceipts.kt.
     */
    static List<Method> chatSeenBroadcasts(List<ClassDef> classes) {
        var seen = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
                !"V".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            if (!params.equals(List.of("Lcom/facebook/auth/usersession/FbUserSession;", cls.getType(), "Ljava/lang/String;"))) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("MARK_THREAD_AS_SEEN_JOB") && strings.contains("broadcast_message_seen_internal") && seenThreadStore(cls))
                seen.add(method);
        }
        return seen;
    }

    static final String THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;";

    /**
     * The seen hook reads the chat from the handler's own ThreadKey field, which ReadReceipts.kt's
     * resolveReadReceiptThreadFields takes as the class's one public final ThreadKey field, stored once by its
     * (FbUserSession, ThreadKey, ...) constructor straight from that parameter into this. Mirrored so a changed field or
     * constructor shows up here instead of at patch time.
     */
    static boolean seenThreadStore(ClassDef owner) {
        Field field = null;
        for (var f : owner.getFields()) {
            if (!THREAD_KEY.equals(f.getType()) || !AccessFlags.PUBLIC.isSet(f.getAccessFlags()) || !AccessFlags.FINAL.isSet(f.getAccessFlags())) continue;
            if (field != null) return false;
            field = f;
        }
        if (field == null) return false;
        Method ctor = null;
        for (var m : owner.getMethods()) {
            var p = m.getParameterTypes();
            if (!"<init>".equals(m.getName()) || m.getImplementation() == null || p.size() < 2 ||
                    !"Lcom/facebook/auth/usersession/FbUserSession;".contentEquals(p.get(0)) || !THREAD_KEY.contentEquals(p.get(1))) continue;
            if (ctor != null) return false;
            ctor = m;
        }
        if (ctor == null) return false;
        int parameterRegisters = 1;
        for (var t : ctor.getParameterTypes()) parameterRegisters += t.charAt(0) == 'J' || t.charAt(0) == 'D' ? 2 : 1;
        int self = ctor.getImplementation().getRegisterCount() - parameterRegisters;
        int stores = 0;
        boolean direct = false;
        for (var i : ctor.getImplementation().getInstructions()) {
            // Like the patch, a constructor that reuses this or the ThreadKey's register before the store doesn't count.
            if (stores == 0 && i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction written) {
                int low = written.getRegisterA(), high = low + (i.getOpcode().setsWideRegister() ? 1 : 0);
                if (low <= self && self <= high || low <= self + 2 && self + 2 <= high) return false;
            }
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(((ReferenceInstruction) i).getReference() instanceof FieldReference ref) ||
                    !owner.getType().equals(ref.getDefiningClass()) || !field.getName().equals(ref.getName()) || !field.getType().equals(ref.getType()))
                continue;
            stores++;
            var registers = (TwoRegisterInstruction) i;
            direct = registers.getRegisterA() == self + 2 && registers.getRegisterB() == self;
        }
        return stores == 1 && direct;
    }

    static List<Method> replyReadDispatches(List<ClassDef> classes) {
        var events = new ArrayList<Method>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                var params = method.getParameterTypes();
                if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || params.size() != 15 ||
                        !"Lcom/facebook/auth/usersession/FbUserSession;".contentEquals(params.get(0)) || !SEND_MESSAGE_EVENT.contentEquals(params.get(11)) ||
                        method.getImplementation() == null) continue;
                var strings = new HashSet<String>();
                for (var i : method.getImplementation().getInstructions())
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
                if (strings.contains("AdapterSender") && strings.contains("meta_ai_invocation") && replyReadShape(method)) events.add(method);
            }
        }
        return events;
    }

    /**
     * Where ReadReceipts.kt's REPLY_READ_SHAPE puts the pieces: composer copy, account copy, the thread's null default,
     * the null path's copy, the dispatch, the composer copy's register, how far before the dispatch v12 is staged, the
     * frame size and the register the dispatch's first String comes to v15 from.
     */
    static final int[] REPLY_READ_SHAPE = {10, 20, 26, 71, 238, 20, 4, 36, 18};

    /** Each shape by its body size: 398 instructions on every 587 build. */
    static final Map<Integer, int[]> REPLY_READ_SHAPES = Map.of(398, REPLY_READ_SHAPE);

    /**
     * reply_read injects at fixed indices, so ReadReceipts.kt's validateReplyRead pins the method's shape. The same
     * outline is checked here, so a changed body shows up as unresolved instead of passing until patch time: 587's 36
     * registers and 398 instructions, the typed ThreadKey getter on p7's type two after the null default with its
     * result in v12, v12 taking v10 four before the dispatch, and the five-argument dispatch on p4's type that starts
     * with the FbUserSession and ends with two Strings. The dataflow proof stays in the patch.
     */
    static boolean replyReadShape(Method method) {
        var impl = method.getImplementation();
        if (impl == null) return false;
        var code = new ArrayList<Instruction>();
        impl.getInstructions().forEach(code::add);
        int[] shape = REPLY_READ_SHAPES.get(code.size());
        if (shape == null || impl.getRegisterCount() != shape[7]) return false;
        int composer = shape[0], session = shape[1], n = shape[2], absent = shape[3], d = shape[4], cr = shape[5], s = d - shape[6];
        var params = method.getParameterTypes();
        if (code.get(n + 2).getOpcode() != Opcode.INVOKE_INTERFACE_RANGE || !(code.get(n + 2) instanceof ReferenceInstruction g) ||
                !(g.getReference() instanceof MethodReference getter) || !params.get(7).toString().equals(getter.getDefiningClass()) ||
                !getter.getParameterTypes().isEmpty() || !"Lcom/facebook/messaging/model/threadkey/ThreadKey;".equals(getter.getReturnType()))
            return false;
        if (code.get(n + 3).getOpcode() != Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction) code.get(n + 3)).getRegisterA() != 12) return false;
        if (code.get(s).getOpcode() != Opcode.MOVE_OBJECT || ((TwoRegisterInstruction) code.get(s)).getRegisterA() != 12 ||
                ((TwoRegisterInstruction) code.get(s)).getRegisterB() != 10) return false;
        if (code.get(d).getOpcode() != Opcode.INVOKE_INTERFACE_RANGE || !(code.get(d) instanceof ReferenceInstruction di) ||
                !(di.getReference() instanceof MethodReference dispatch) || !params.get(4).toString().equals(dispatch.getDefiningClass()) ||
                !"V".equals(dispatch.getReturnType())) return false;
        var types = dispatch.getParameterTypes();
        if (types.size() != 5 || !"Lcom/facebook/auth/usersession/FbUserSession;".contentEquals(types.get(0)) ||
            !"Ljava/lang/String;".contentEquals(types.get(3)) || !"Ljava/lang/String;".contentEquals(types.get(4)) ||
            ((RegisterRangeInstruction) code.get(d)).getStartRegister() != 11 || ((RegisterRangeInstruction) code.get(d)).getRegisterCount() != 6)
            return false;
        // The registers and branches validateReplyRead proves its dataflow on.
        int[] p = new int[params.size()];
        int next = impl.getRegisterCount() - params.stream().mapToInt(t -> t.charAt(0) == 'J' || t.charAt(0) == 'D' ? 2 : 1).sum();
        for (int at = 0; at < p.length; at++) { p[at] = next; next += params.get(at).charAt(0) == 'J' || params.get(at).charAt(0) == 'D' ? 2 : 1; }
        var getterArgs = (RegisterRangeInstruction) code.get(n + 2);
        if (getterArgs.getStartRegister() != p[7] || getterArgs.getRegisterCount() != 1) return false;
        if (!moves(code.get(4), Opcode.MOVE_OBJECT_FROM16, 7, p[11]) || !moves(code.get(composer), Opcode.MOVE_OBJECT_FROM16, cr, p[4]) ||
            !moves(code.get(session), Opcode.MOVE_OBJECT_FROM16, 10, p[0]) || !moves(code.get(s - 1), Opcode.MOVE_OBJECT_FROM16, 11, cr) ||
            !moves(code.get(absent), Opcode.MOVE_OBJECT, 12, 5)) return false;
        int stringMoves = 0, from = shape[8];
        var stringMove = from < 16 ? Opcode.MOVE_OBJECT : Opcode.MOVE_OBJECT_FROM16;
        for (int at = s + 1; at < d; at++) if (moves(code.get(at), stringMove, 15, from)) stringMoves++;
        if (stringMoves != 1) return false;
        if (code.get(n).getOpcode() != Opcode.CONST_4 || ((OneRegisterInstruction) code.get(n)).getRegisterA() != 5 ||
            ((NarrowLiteralInstruction) code.get(n)).getNarrowLiteral() != 0 || code.get(n + 1).getOpcode() != Opcode.IF_EQZ ||
            ((OneRegisterInstruction) code.get(n + 1)).getRegisterA() != p[7] || !jumpsTo(code, n + 1, absent)) return false;
        int[] address = new int[code.size() + 1];
        var index = new HashMap<Integer, Integer>();
        for (int at = 0; at < code.size(); at++) { index.put(address[at], at); address[at + 1] = address[at] + code.get(at).getCodeUnits(); }
        var targets = new HashSet<Integer>();
        for (int at = 0; at < code.size(); at++) {
            if (!(code.get(at) instanceof OffsetInstruction jump)) continue;
            Integer landed = index.get(address[at] + jump.getCodeOffset());
            if (landed == null) return false;
            if (code.get(landed) instanceof SwitchPayload payload) {
                for (var element : payload.getSwitchElements()) targets.add(index.get(address[at] + element.getOffset()));
            } else targets.add(landed);
        }
        for (var block : impl.getTryBlocks()) {
            for (var handler : block.getExceptionHandlers()) targets.add(index.get(handler.getHandlerCodeAddress()));
            // Code inserted at the dispatch would land inside a try that covers the seam.
            for (int at = s - 3; at <= d + 1; at++)
                if (address[at] >= block.getStartCodeAddress() && address[at] < block.getStartCodeAddress() + block.getCodeUnitCount()) return false;
        }
        for (int at = s; at <= d + 1; at++) if (targets.contains(at)) return false;
        for (int at : new int[] {n, n + 1, n + 2, n + 3}) if (targets.contains(at)) return false;
        return true;
    }

    static boolean moves(Instruction instruction, Opcode opcode, int to, int from) {
        return instruction.getOpcode() == opcode && instruction instanceof TwoRegisterInstruction move &&
            move.getRegisterA() == to && move.getRegisterB() == from;
    }

    /**
     * attribution_uploads: the one void worker that takes the session and names both the AttributionIdUpdate failure
     * text and the IAdvertisingIdService Binder fallback. In 586 it sits on an obfuscated class, not LatStatusJob.
     * Mirrors AttributionUploads.kt.
     */
    static List<Method> attributionUploads(List<ClassDef> classes) {
        var uploads = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType()) ||
                method.getParameterTypes().stream().noneMatch(t -> "Lcom/facebook/auth/usersession/FbUserSession;".equals(t.toString()))) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (strings.contains("Failure while creating and sending attribution state through AttributionIdUpdate.") &&
                strings.contains("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService")) uploads.add(method);
        }
        return uploads.size() == 1 ? uploads : List.of();
    }

    /**
     * ad_events: the static (context, FbUserSession, four Strings)V click-to-message entry event that reads ad_id and
     * page_id, and the inbox tracker's non-static (rows, Z)V callback that names InboxCustomizedImpressionTracker and
     * inbox2_vr. Mirrors AdEvents.kt.
     */
    static List<Method> adEvents(List<ClassDef> classes) {
        var events = new ArrayList<Method>();
        var string = "Ljava/lang/String;";
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || !"V".equals(method.getReturnType())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            var isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());
            var entry = isStatic && params.size() == 6 && params.get(1).equals("Lcom/facebook/auth/usersession/FbUserSession;") &&
                params.subList(2, 6).equals(List.of(string, string, string, string));
            var visibility = !isStatic && params.size() == 2 && params.get(1).equals("Z");
            if (!entry && !visibility) continue;
            var strings = new HashSet<String>();
            for (var i : method.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
            if (entry && strings.contains("ad_id") && strings.contains("page_id") ||
                visibility && strings.contains("inbox2_vr") && strings.contains("InboxCustomizedImpressionTracker")) events.add(method);
        }
        return events;
    }

    static Set<String> literals(Method method) {
        var strings = new HashSet<String>();
        for (var i : instructions(method))
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
        return strings;
    }

    /** The publish's not-connected answer: the first sget-object after "not_connected", returned at once, of its own class. */
    static boolean hasNotSentAnswer(List<Instruction> code) {
        int logged = -1;
        for (int i = 0; i < code.size(); i++) {
            if (!(code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "not_connected".equals(sr.getString()))) continue;
            if (logged >= 0) return false;
            logged = i;
        }
        if (logged < 0) return false;
        for (int i = logged + 1; i < code.size() - 1; i++) {
            if (code.get(i).getOpcode() != Opcode.SGET_OBJECT) continue;
            if (!(((ReferenceInstruction) code.get(i)).getReference() instanceof FieldReference field)) return false;
            return code.get(i + 1).getOpcode() == Opcode.RETURN_OBJECT && register(code.get(i + 1)) == register(code.get(i)) &&
                field.getType().equals(field.getDefiningClass());
        }
        return false;
    }

    /** One iget-boolean tested by the next if-eqz whose false branch is the plain ping, a static (own class, X)V call. */
    static boolean hasHealthKeepaliveFlag(Method method) {
        var code = instructions(method);
        int topic = -1;
        for (int i = 0; i < code.size() && topic < 0; i++)
            if (code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                "/mqtt_health_stats".equals(sr.getString())) topic = i;
        int sites = 0;
        for (int at = 0; at < topic; at++) {
            if (code.get(at).getOpcode() != Opcode.IGET_BOOLEAN || code.get(at + 1).getOpcode() != Opcode.IF_EQZ ||
                ((TwoRegisterInstruction) code.get(at)).getRegisterA() != register(code.get(at + 1))) continue;
            for (int target = 0; target < code.size(); target++) {
                if (!jumpsTo(code, at + 1, target)) continue;
                if (code.get(target).getOpcode() == Opcode.INVOKE_STATIC &&
                    ((ReferenceInstruction) code.get(target)).getReference() instanceof MethodReference ping &&
                    ping.getDefiningClass().equals(method.getDefiningClass()) && "V".equals(ping.getReturnType()) &&
                    ping.getParameterTypes().size() == 2 && ping.getParameterTypes().get(0).toString().equals(method.getDefiningClass())) sites++;
                break;
            }
        }
        return sites == 1;
    }

    /**
     * mqtt_telemetry: the MQTT client's instance publish (two callbacks, Integer, String, String, [B, I, J) that names
     * exception/publish, not_connected and /mqtt_health_stats and returns a singleton when not connected, and the same
     * class's instance (String)V keepalive that names exception/send_keepalive and /mqtt_health_stats and picks the plain
     * ping on one config flag. Both or neither. Mirrors MqttTelemetry.kt.
     */
    static List<Method> mqttTelemetry(List<ClassDef> classes) {
        var publish = new ArrayList<Method>();
        var keepalive = new ArrayList<Method>();
        var tail = List.of("Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/String;", "[B", "I", "J");
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
            var params = new ArrayList<String>();
            for (var t : method.getParameterTypes()) params.add(t.toString());
            var strings = literals(method);
            if (params.size() == 8 && method.getReturnType().startsWith("L") && params.get(0).startsWith("L") &&
                params.get(1).startsWith("L") && params.subList(2, 8).equals(tail) &&
                strings.containsAll(List.of("exception/publish", "not_connected", "/mqtt_health_stats")) &&
                hasNotSentAnswer(instructions(method))) publish.add(method);
            if (params.equals(List.of("Ljava/lang/String;")) && "V".equals(method.getReturnType()) &&
                strings.containsAll(List.of("exception/send_keepalive", "/mqtt_health_stats")) &&
                hasHealthKeepaliveFlag(method)) keepalive.add(method);
        }
        if (publish.size() != 1 || keepalive.size() != 1 ||
            !publish.get(0).getDefiningClass().equals(keepalive.get(0).getDefiningClass())) return List.of();
        return List.of(publish.get(0), keepalive.get(0));
    }

    /** The selection change's one invoke-super of Android's onSelectionChanged, made on this. */
    static boolean hasSelectionSuperCall(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getImplementation() == null ||
            !"onSelectionChanged".equals(method.getName()) || !"V".equals(method.getReturnType())) return false;
        var params = new ArrayList<String>();
        for (var t : method.getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of("I", "I"))) return false;
        int self = method.getImplementation().getRegisterCount() - 3;
        int calls = 0;
        for (var i : instructions(method)) {
            if (i.getOpcode() != Opcode.INVOKE_SUPER && i.getOpcode() != Opcode.INVOKE_SUPER_RANGE) continue;
            if (!(((ReferenceInstruction) i).getReference() instanceof MethodReference call)) continue;
            int receiver = i instanceof FiveRegisterInstruction f ? f.getRegisterC() : ((RegisterRangeInstruction) i).getStartRegister();
            var types = new ArrayList<String>();
            for (var t : call.getParameterTypes()) types.add(t.toString());
            if (Set.of("Landroid/widget/TextView;", "Landroid/widget/EditText;").contains(call.getDefiningClass()) &&
                "onSelectionChanged".equals(call.getName()) && "V".equals(call.getReturnType()) && types.equals(params) &&
                receiver == self) calls++;
        }
        return calls == 1;
    }

    /**
     * text_style: the one method of an EditText subclass that names updateState:TextInputComponent.remeasureForUpdatedText
     * has to be its instance onTextChanged(CharSequence, III)V, and the hook is the same class's
     * onSelectionChanged(II)V that calls Android's own on this. Mirrors TextStyle.kt.
     */
    static List<Method> textStyleField(List<ClassDef> classes) {
        ClassDef field = null;
        Method anchor = null;
        int anchors = 0;
        for (var cls : classes) {
            if (!"Landroid/widget/EditText;".equals(cls.getSuperclass())) continue;
            for (var method : cls.getMethods()) {
                if (!literals(method).contains("updateState:TextInputComponent.remeasureForUpdatedText")) continue;
                anchors++;
                field = cls;
                anchor = method;
            }
        }
        // Family B: no EditText names it, its onTextChanged calls a static helper that does.
        if (anchors == 0) {
            var helpers = new HashSet<String>();
            for (var cls : classes) for (var method : cls.getMethods())
                if (AccessFlags.STATIC.isSet(method.getAccessFlags()) &&
                    literals(method).contains("updateState:TextInputComponent.remeasureForUpdatedText")) helpers.add(hookId(method));
            for (var cls : classes) {
                if (!"Landroid/widget/EditText;".equals(cls.getSuperclass())) continue;
                for (var method : cls.getMethods()) {
                    if (instructions(method).stream().noneMatch(i -> (i.getOpcode() == Opcode.INVOKE_STATIC ||
                        i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) && helpers.contains(ref(i)))) continue;
                    anchors++;
                    field = cls;
                    anchor = method;
                }
            }
        }
        if (anchors != 1 || AccessFlags.STATIC.isSet(anchor.getAccessFlags()) ||
            !hookId(anchor).endsWith(";->onTextChanged(Ljava/lang/CharSequence;III)V")) return List.of();
        var selection = new ArrayList<Method>();
        for (var method : field.getMethods()) if (hasSelectionSuperCall(method)) selection.add(method);
        return selection.size() == 1 ? selection : List.of();
    }

    static final long PINNED_CHAT_LIMIT_CONFIG = 0x82059500020f8fL;

    /**
     * pinned_chats: every method that reads the pinned chat limit's config id, which 586 reads in place. Each one
     * loads the id once, hands that register pair straight to a static (Object, J)I config read and takes its answer
     * with the next instruction. Counted only when every reader looks like that. Mirrors PinnedChats.kt.
     */
    static List<Method> pinLimitReaders(List<ClassDef> classes) {
        var found = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            var code = instructions(method);
            var loads = new ArrayList<Integer>();
            for (int at = 0; at < code.size(); at++)
                if (code.get(at).getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) code.get(at)).getWideLiteral() == PINNED_CHAT_LIMIT_CONFIG) loads.add(at);
            if (loads.isEmpty()) continue;
            if (loads.size() != 1) return List.of();
            int at = loads.get(0), id = register(code.get(at));
            if (at + 2 >= code.size() || !(code.get(at + 1) instanceof FiveRegisterInstruction read) || read.getOpcode() != Opcode.INVOKE_STATIC ||
                !(((ReferenceInstruction) read).getReference() instanceof MethodReference target) || !"I".equals(target.getReturnType()) ||
                !target.getParameterTypes().stream().map(Object::toString).toList().equals(List.of("Ljava/lang/Object;", "J")) ||
                read.getRegisterCount() != 3 || read.getRegisterD() != id || read.getRegisterE() != id + 1 ||
                code.get(at + 2).getOpcode() != Opcode.MOVE_RESULT) return List.of();
            found.add(method);
        }
        // Family B reads it in static getters that return the answer as it is, and their callers read it in their place.
        var getters = new HashSet<String>();
        for (var method : found) {
            var code = instructions(method);
            int at = 0;
            while (code.get(at).getOpcode() != Opcode.CONST_WIDE || ((WideLiteralInstruction) code.get(at)).getWideLiteral() != PINNED_CHAT_LIMIT_CONFIG) at++;
            if (AccessFlags.STATIC.isSet(method.getAccessFlags()) && "I".equals(method.getReturnType()) && at + 3 < code.size() &&
                code.get(at + 3).getOpcode() == Opcode.RETURN && register(code.get(at + 3)) == register(code.get(at + 2))) getters.add(hookId(method));
        }
        if (found.isEmpty() || getters.isEmpty()) return found;
        var readers = new ArrayList<Method>();
        for (var method : found) if (!getters.contains(hookId(method))) readers.add(method);
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            var code = instructions(method);
            var calls = new ArrayList<Integer>();
            for (int at = 0; at < code.size(); at++)
                if (code.get(at) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference ref && getters.contains(ref.toString())) calls.add(at);
            if (calls.isEmpty()) continue;
            if (calls.size() != 1 || calls.get(0) + 1 >= code.size() || code.get(calls.get(0) + 1).getOpcode() != Opcode.MOVE_RESULT) return List.of();
            readers.add(method);
        }
        return readers;
    }

    static final String PIN_MENU_ITEM = "Lcom/facebook/messaging/threadlist/threaditemmenu/plugins/core/pinmenuitem/PinMenuItemImplementation;";
    static final String UNPIN_MENU_ITEM = "Lcom/facebook/messaging/threadlist/threaditemmenu/plugins/core/unpinmenuitem/UnpinMenuItemImplementation;";

    /** Every hook of Pin more chats but the chat list read. Mirrors findPinnedChats in PinnedChats.kt. */
    static Map<String, List<Method>> pinnedChats(List<ClassDef> classes) {
        var readers = pinLimitReaders(classes);
        var asks = readers.stream().filter(m -> params(m).contains(THREAD_KEY)).toList();
        Method ask = asks.size() == 1 ? asks.get(0) : null;
        var hooks = new HashMap<String, List<Method>>();
        hooks.put("pinned_chats", readers.stream().filter(m -> !params(m).contains(THREAD_KEY)).toList());
        hooks.put("pin_ask", ask != null && pinStepKey(ask) >= 0 ? List.of(ask) : List.of());
        hooks.put("pin_drop", List.of());
        hooks.put("pin_full", List.of());
        if (ask != null) {
            var owner = pinClass(classes, ask.getDefiningClass());
            if (owner != null) {
                var drops = new ArrayList<Method>();
                for (var m : owner.getMethods()) if (isPinDrop(m)) drops.add(m);
                if (drops.size() == 1 && pinStepKey(drops.get(0)) >= 0) hooks.put("pin_drop", drops);
            }
            var built = instructions(ask).stream().filter(i -> i.getOpcode() == Opcode.NEW_INSTANCE).findFirst();
            var lambda = built.isEmpty() ? null : pinClass(classes, ((TypeReference) ((ReferenceInstruction) built.get()).getReference()).getType());
            if (lambda != null) {
                var sites = new ArrayList<Method>();
                for (var m : lambda.getMethods()) if (ask.getDefiningClass().equals(pinFullOwner(m))) sites.add(m);
                if (sites.size() == 1) hooks.put("pin_full", sites);
            }
        }
        var rows = new ArrayList<Method>();
        for (var type : List.of(PIN_MENU_ITEM, UNPIN_MENU_ITEM)) {
            var cls = pinClass(classes, type);
            if (cls == null) continue;
            var checks = new ArrayList<Method>();
            for (var m : cls.getMethods()) if (isPinRow(m)) checks.add(m);
            if (checks.size() == 1 && pinRowProved(checks.get(0))) rows.add(checks.get(0));
        }
        hooks.put("pin_rows", rows.size() == 2 ? rows : List.of());
        return hooks;
    }

    static ClassDef pinClass(List<ClassDef> classes, String type) {
        for (var cls : classes) if (cls.getType().equals(type)) return cls;
        return null;
    }

    static int pinWords(List<String> types) {
        int words = 0;
        for (var type : types) words += type.equals("J") || type.equals("D") ? 2 : 1;
        return words;
    }

    /** The ThreadKey's register in the pin or unpin call, or -1 without a scratch local or with a jump to its start. */
    static int pinStepKey(Method m) {
        var impl = m.getImplementation();
        if (impl == null || !AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType())) return -1;
        var types = params(m);
        int index = types.indexOf(THREAD_KEY), words = pinWords(types);
        if (impl.getRegisterCount() <= words || mediaTargets(m).contains(0) || index < 0) return -1;
        return impl.getRegisterCount() - words + pinWords(types.subList(0, index));
    }

    static boolean isPinDrop(Method m) {
        var types = params(m);
        return AccessFlags.STATIC.isSet(m.getAccessFlags()) && "V".equals(m.getReturnType()) && types.size() == 5 && types.get(0).equals(THREAD_KEY) &&
            types.get(1).equals(m.getDefiningClass()) && types.get(3).equals("Ljava/lang/Long;") && types.get(4).equals("Z");
    }

    static boolean isPinRow(Method m) {
        var types = params(m);
        return AccessFlags.STATIC.isSet(m.getAccessFlags()) && "Z".equals(m.getReturnType()) && types.size() == 3 && types.get(0).equals(BUBBLE_SESSION) &&
            types.get(1).equals(THREAD_SUMMARY_TYPE) && pinWords(types.subList(2, 3)) == 1;
    }

    /** A row's check reads the chat key and both pinned flags, and its summary and answers fit a plain call at each return. */
    static boolean pinRowProved(Method m) {
        var impl = m.getImplementation();
        if (impl == null) return false;
        var code = instructions(m);
        var flags = new HashSet<String>();
        boolean key = false;
        for (var i : code) {
            if (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof FieldReference f) || !THREAD_SUMMARY_TYPE.equals(f.getDefiningClass())) continue;
            if (i.getOpcode() == Opcode.IGET_OBJECT && THREAD_KEY.equals(f.getType())) key = true;
            if (i.getOpcode() == Opcode.IGET_BOOLEAN) flags.add(f.toString());
        }
        int summary = impl.getRegisterCount() - 2;
        if (!key || flags.size() < 2 || summary < 0 || summary > 15) return false;
        boolean returned = false;
        for (var i : code) {
            if (writes(i, summary)) return false;
            if (i.getOpcode() != Opcode.RETURN) continue;
            if (register(i) > 15) return false;
            returned = true;
        }
        return returned;
    }

    /** The controller the pin count's answer belongs to, in the lambda the controller's pin builds, or null. */
    static String pinFullOwner(Method m) {
        if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"invoke".equals(m.getName()) ||
            !"Ljava/lang/Object;".equals(m.getReturnType()) || !params(m).equals(List.of("Ljava/lang/Object;"))) return null;
        var code = instructions(m);
        String owner = null;
        for (int at = 0; at < code.size(); at++) {
            var here = pinFullOwnerAt(code, at);
            if (here == null) continue;
            if (owner != null) return null;
            owner = here;
        }
        return owner;
    }

    static String pinFullOwnerAt(List<Instruction> code, int at) {
        if (at + 5 >= code.size() || !(code.get(at) instanceof FiveRegisterInstruction ask) || ask.getOpcode() != Opcode.INVOKE_STATIC ||
            !(((ReferenceInstruction) ask).getReference() instanceof MethodReference asked) || !"Z".equals(asked.getReturnType()) ||
            !inboxParams(asked).equals(List.of("Ljava/lang/Object;"))) return null;
        var taken = code.get(at + 1); var controller = code.get(at + 2); var cast = code.get(at + 3); var early = code.get(at + 4);
        // 587 reads the Context and casts it between the controller's cast and the branch.
        int gap = early.getOpcode() == Opcode.IGET_OBJECT && code.get(at + 5).getOpcode() == Opcode.CHECK_CAST && register(code.get(at + 5)) == register(early) ? 2 : 0;
        if (at + 5 + gap >= code.size()) return null;
        var branch = code.get(at + 4 + gap); var first = code.get(at + 5 + gap);
        if (taken.getOpcode() != Opcode.MOVE_RESULT || controller.getOpcode() != Opcode.IGET_OBJECT || cast.getOpcode() != Opcode.CHECK_CAST ||
            branch.getOpcode() != Opcode.IF_EQZ || register(branch) != register(taken) || first.getOpcode() != Opcode.IGET_OBJECT) return null;
        int self = ((TwoRegisterInstruction) first).getRegisterB();
        if (register(first) == self || ((TwoRegisterInstruction) controller).getRegisterB() != self) return null;
        if (gap > 0 && (((TwoRegisterInstruction) early).getRegisterB() != self || register(early) == register(taken))) return null;
        var owner = ((TypeReference) ((ReferenceInstruction) cast).getReference()).getType();
        boolean key = false;
        for (int i = at + 5 + gap; i < Math.min(at + 40, code.size() - 1); i++) {
            var step = code.get(i);
            if (!key && step.getOpcode() == Opcode.CHECK_CAST && THREAD_KEY.equals(((TypeReference) ((ReferenceInstruction) step).getReference()).getType()) &&
                code.get(i - 1).getOpcode() == Opcode.IGET_OBJECT) key = true;
            if (!(step instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference dialog)) continue;
            if ((step.getOpcode() != Opcode.INVOKE_STATIC && step.getOpcode() != Opcode.INVOKE_STATIC_RANGE) || !owner.equals(dialog.getDefiningClass()) ||
                !"V".equals(dialog.getReturnType()) || !inboxParams(dialog).equals(List.of("Landroid/app/Activity;", "Landroid/content/Context;",
                    "Landroid/content/DialogInterface$OnClickListener;", owner, "I", "I"))) continue;
            if (code.get(i + 1).getOpcode() != Opcode.IF_EQZ) return null;
            int done = mediaTarget(code, i + 1);
            if (done < 0 || done + 1 >= code.size() || code.get(done).getOpcode() != Opcode.SGET_OBJECT ||
                code.get(done + 1).getOpcode() != Opcode.RETURN_OBJECT || register(code.get(done)) != register(code.get(done + 1))) return null;
            return key ? owner : null;
        }
        return null;
    }

    /** The items read can take a call right after its trace and reads the supplier's own list of rows. */
    static boolean pinListSite(Method items) {
        var code = instructions(items);
        var targets = mediaTargets(items);
        if (code.size() < 2 || targets.contains(0) || targets.contains(1)) return false;
        for (var i : code)
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f &&
                INBOX_SUPPLIER.equals(f.getDefiningClass()) && IMMUTABLE_LIST.equals(f.getType())) return true;
        return false;
    }
}
