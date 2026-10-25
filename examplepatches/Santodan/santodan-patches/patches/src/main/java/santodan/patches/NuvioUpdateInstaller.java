package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.*;

/** Proven beta.8 installer contracts; preserves native permission/result/error flows. */
public final class NuvioUpdateInstaller {
    public static final String INSTALLER = "Lkb/c;";
    public static final String RECEIVER = "Lcom/nuvio/tv/updater/UpdateInstallResultReceiver;";
    public static final String INSTALL_ACTION = "Lcom/nuvio/tv/data/local/gc;";
    static final String AUTHORITY = "com.nuvio.tv.fileprovider";
    static final String DM_KEY = "com.nuvio.tv.updater.WITH_DEX_METADATA";
    static final String RECEIVER_HASH = "0d7f1df4e58fbe1d8138112e0100401e6b23638cca527ae2073f252ab55e1a39";
    static MutableMethod unique(MutableClass owner, String name) {
        var matches = new ArrayList<MutableMethod>();
        for (var method : owner.getMethods()) if (method.getName().equals(name)) matches.add(method);
        if (matches.size() != 1 || matches.get(0).getImplementation() == null)
            throw new IllegalStateException("Missing/ambiguous installer " + owner.getType() + "->" + name);
        return matches.get(0);
    }
    static int authority(MutableMethod method) {
        var code = NuvioRemainingEpisodesPatch.instructions(method);
        return NuvioAnchors.unique(code, i -> NuvioApkUpdates.string(code.get(i)).endsWith(".fileprovider"), "native update FileProvider");
    }
    static int dmResult(MutableMethod method) {
        var code = NuvioRemainingEpisodesPatch.instructions(method);
        int key = NuvioAnchors.unique(code, i -> NuvioApkUpdates.string(code.get(i)).equals(DM_KEY), "installer metadata extra");
        if (!NuvioPlaybackButtonsPatch.reference(code.get(key + 1)).equals("Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z") ||
            code.get(key + 2).getOpcode() != Opcode.MOVE_RESULT) throw new IllegalStateException("Installer metadata layout changed");
        return key + 2;
    }
    static boolean isZero(Instruction instruction, int register) {
        return instruction.getOpcode() == Opcode.CONST_4 && ((OneRegisterInstruction) instruction).getRegisterA() == register &&
            ((NarrowLiteralInstruction) instruction).getNarrowLiteral() == 0;
    }
    static MutableMethod receiver(MutableClass owner) {
        MutableMethod method = unique(owner, "onReceive");
        if (!method.toString().equals(RECEIVER + "->onReceive(Landroid/content/Context;Landroid/content/Intent;)V") || (method.getAccessFlags() & 8) != 0)
            throw new IllegalStateException("Installer receiver signature changed");
        MutableMethod copy = new MutableMethod(method);
        var body = NuvioRemainingEpisodesPatch.instructions(copy);
        int result = dmResult(copy);
        int register = ((OneRegisterInstruction) body.get(result)).getRegisterA();
        if (isZero(body.get(result + 1), register)) copy.getImplementation().removeInstruction(result + 1);
        int provider = authority(copy);
        var instruction = NuvioRemainingEpisodesPatch.instructions(copy).get(provider);
        copy.getImplementation().replaceInstruction(provider, new BuilderInstruction21c(Opcode.CONST_STRING,
            ((OneRegisterInstruction) instruction).getRegisterA(), new ImmutableStringReference(AUTHORITY)));
        if (!NuvioPlaybackButtonsPatch.fingerprint(copy).equals(RECEIVER_HASH)) throw new IllegalStateException("Native receiver layout changed");
        return method;
    }
    public static void disableMetadata(MutableClass installer, MutableClass receiver) {
        MutableMethod method = unique(installer, "b");
        if (!method.toString().equals(INSTALLER + "->b(Landroid/content/Context;Ljava/io/File;ZZ)V") ||
            (method.getAccessFlags() & 8) == 0 || !NuvioPlaybackButtonsPatch.fingerprint(method).equals("1e29a58ab2c05823711d154852665e211d50fc42f5036aae7af3b395fa612e38"))
            throw new IllegalStateException("Changed or already patched installer");
        MutableMethod callback = receiver(receiver);
        int result = dmResult(callback);
        var code = NuvioRemainingEpisodesPatch.instructions(callback);
        int register = ((OneRegisterInstruction) code.get(result)).getRegisterA();
        if (isZero(code.get(result + 1), register)) throw new IllegalStateException("Installer receiver already patched");
        int parameter = method.getImplementation().getRegisterCount() - 1;
        if (parameter > 15 || register > 15) throw new IllegalStateException("Unencodable installer flags");
        // Stock .dm profiles describe original DEX, not this patched APK. Do not stage them.
        method.getImplementation().addInstruction(0, new BuilderInstruction11n(Opcode.CONST_4, parameter, 0));
        // Failures fall back to Android's installer; never recopy the APK in onReceive().
        callback.getImplementation().addInstruction(result + 1, new BuilderInstruction11n(Opcode.CONST_4, register, 0));
    }
    public static void renameProviders(MutableClass action, MutableClass receiver, String authority) {
        if (!authority.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z][A-Za-z0-9_]*)+\\.fileprovider") || authority.equals(AUTHORITY))
            throw new IllegalArgumentException("Invalid clone update authority");
        MutableMethod install = unique(action, "invokeSuspend");
        if (!install.toString().equals(INSTALL_ACTION + "->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;") ||
            !NuvioPlaybackButtonsPatch.fingerprint(install).equals("72e91b9a9fbc6629acf63d2bd878decc4e8cd4d66eb16800b7b144e5fbabca97"))
            throw new IllegalStateException("Changed or already renamed install action");
        MutableMethod callback = receiver(receiver);
        for (var method : List.of(install, callback)) {
            int index = authority(method);
            if (!NuvioApkUpdates.string(NuvioRemainingEpisodesPatch.instructions(method).get(index)).equals(AUTHORITY))
                throw new IllegalStateException("Update provider already renamed");
        }
        for (var method : List.of(install, callback)) {
            int index = authority(method);
            var old = NuvioRemainingEpisodesPatch.instructions(method).get(index);
            method.getImplementation().replaceInstruction(index, new BuilderInstruction21c(Opcode.CONST_STRING,
                ((OneRegisterInstruction) old).getRegisterA(), new ImmutableStringReference(authority)));
        }
    }
}
