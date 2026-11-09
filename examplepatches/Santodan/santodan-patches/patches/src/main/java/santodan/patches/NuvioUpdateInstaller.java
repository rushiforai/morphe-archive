package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.*;

/** Proven beta.8 installer contracts; preserves native permission/result/error flows. */
public final class NuvioUpdateInstaller {
    public static final String INSTALLER = "Llb/c;";
    public static final String RECEIVER = "Lcom/nuvio/tv/updater/UpdateInstallResultReceiver;";
    public static final String INSTALL_ACTION = "Lcom/nuvio/tv/data/local/da;";
    static final String AUTHORITY = "com.nuvio.tv.fileprovider";
    static final String DM_KEY = "com.nuvio.tv.updater.WITH_DEX_METADATA";
    static final String RECEIVER_HASH = "e15f35d58a006eece9cd6a70f722e4c7fbdc82c637c861714724a608410c17f4";
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
        if (!NuvioPlaybackButtonsPatch.fingerprint(copy).equals(RECEIVER_HASH)) throw new IllegalStateException("Native receiver layout changed");
        receiverProvider(owner);
        return method;
    }
    /** Beta.13 moved the fallback installer and its FileProvider into a static helper. */
    static MutableMethod receiverProvider(MutableClass owner) {
        MutableMethod method = unique(owner, "a");
        if (!method.toString().equals(RECEIVER + "->a(Landroid/content/Context;Ljava/io/File;ZZ)V") ||
            (method.getAccessFlags() & 8) == 0)
            throw new IllegalStateException("Receiver fallback signature changed");
        MutableMethod copy = new MutableMethod(method);
        int provider = authority(copy);
        var instruction = NuvioRemainingEpisodesPatch.instructions(copy).get(provider);
        copy.getImplementation().replaceInstruction(provider, new BuilderInstruction21c(Opcode.CONST_STRING,
            ((OneRegisterInstruction) instruction).getRegisterA(), new ImmutableStringReference(AUTHORITY)));
        if (!NuvioPlaybackButtonsPatch.fingerprint(copy).equals("86a506aa055aec926b118e50b03b3852b25ff3c3700ca05df397b46f3fd158d6"))
            throw new IllegalStateException("Receiver fallback layout changed");
        return method;
    }
    public static void disableMetadata(MutableClass installer, MutableClass receiver) {
        MutableMethod method = unique(installer, "b");
        if (!method.toString().equals(INSTALLER + "->b(Landroid/content/Context;Ljava/io/File;ZZ)V") ||
            (method.getAccessFlags() & 8) == 0 || !NuvioPlaybackButtonsPatch.fingerprint(method).equals("7d40ed67d709182b487a6422037abae563644563c9b53afc78cedc665e0d3e18"))
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
            !NuvioPlaybackButtonsPatch.fingerprint(install).equals("52cdd61f5188ec28bc3cceefb8e3b11e3d0e9ceb5965fff39a5d912429e9a8c7"))
            throw new IllegalStateException("Changed or already renamed install action");
        receiver(receiver);
        MutableMethod provider = receiverProvider(receiver);
        for (var method : List.of(install, provider)) {
            int index = authority(method);
            if (!NuvioApkUpdates.string(NuvioRemainingEpisodesPatch.instructions(method).get(index)).equals(AUTHORITY))
                throw new IllegalStateException("Update provider already renamed");
        }
        for (var method : List.of(install, provider)) {
            int index = authority(method);
            var old = NuvioRemainingEpisodesPatch.instructions(method).get(index);
            method.getImplementation().replaceInstruction(index, new BuilderInstruction21c(Opcode.CONST_STRING,
                ((OneRegisterInstruction) old).getRegisterA(), new ImmutableStringReference(authority)));
        }
    }
}
