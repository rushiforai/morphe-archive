package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Adds progress fan-out and delegates foreground installation to the system APK UI. */
public final class NuvioUpdateFlowPatch {
    public static final String PROGRESS = "Lsoftware/santodan/extension/nuvioupdate/UpdateProgress;";
    public static final String INSTALL_UI = "Lsoftware/santodan/extension/nuvioupdate/UpdateInstall;";
    static final String OBJECT = "Ljava/lang/Object;";
    static final String CONTEXT = "Landroid/content/Context;", FILE = "Ljava/io/File;";
    static final String WRAP = PROGRESS + "->wrap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String OPEN = INSTALL_UI + "->open(Landroid/content/Context;Ljava/io/File;Z)Z";
    static void hash(MutableMethod method, String expected) {
        if (!NuvioPlaybackButtonsPatch.fingerprint(method).equals(expected)) throw new IllegalStateException("Changed or already patched update flow: " + method);
    }
    public static void install(MutableClass repository, MutableClass downloader, MutableClass installer, MutableClass bridge,
        MutableClass provider, MutableClass strategy, MutableClass update) {
        MutableMethod download = NuvioUpdateInstaller.unique(repository, "b");
        if (!download.toString().equals("Llb/q;->b(Lmb/a;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;") ||
            (download.getAccessFlags() & 8) != 0) throw new IllegalStateException("Download signature changed");
        hash(download, "5ec2fa0b9f90656f50f26e7da3a7d8b60ede359ebdb66bad31c738aa8ca26443");
        MutableMethod stream = NuvioUpdateInstaller.unique(downloader, "a");
        if (!stream.toString().equals("Llb/b;->a(Ljava/lang/String;Ljava/io/File;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;") ||
            (stream.getAccessFlags() & 8) != 0) throw new IllegalStateException("Transfer signature changed");
        hash(stream, "5883b9670f3d44e272385d7b49482e298eafbc723c1a9cde829df0a7a5197d0a");
        MutableMethod session = NuvioUpdateInstaller.unique(installer, "b");
        MutableMethod plain = new MutableMethod(session);
        if (!NuvioUpdateInstaller.isZero(plain.getImplementation().getInstructions().get(0), 15)) throw new IllegalStateException("Metadata suppression missing");
        plain.getImplementation().removeInstruction(0);
        hash(plain, "7d40ed67d709182b487a6422037abae563644563c9b53afc78cedc665e0d3e18");
        MutableMethod uri = NuvioUpdateInstaller.unique(bridge, "contentUri");
        if (!uri.toString().equals(INSTALL_UI + "->contentUri(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;") ||
            (uri.getAccessFlags() & 8) == 0 || uri.getImplementation().getRegisterCount() != 3 ||
            uri.getImplementation().getInstructions().size() != 2) throw new IllegalStateException("URI bridge stub changed");
        var factory = NuvioUpdateInstaller.unique(provider, "c");
        var toUri = NuvioUpdateInstaller.unique(strategy, "c");
        if (!factory.toString().equals("Landroidx/core/content/FileProvider;->c(Landroid/content/Context;Ljava/lang/String;)La4/b;") ||
            (factory.getAccessFlags() & 9) != 9 || !toUri.toString().equals("La4/b;->c(Ljava/io/File;)Landroid/net/Uri;") ||
            (toUri.getAccessFlags() & 9) != 1) throw new IllegalStateException("Native FileProvider API changed");
        hash(factory, "57bff3bb26e55db532fb81fe503fb6691cc16d2ff81e4bfb685bde0b5708a3fa");
        hash(toUri, "9220ef5bbba3904c3320d1e7bab305621c970c891963403df99149951ad5985b");
        for (String field : List.of("f", "g")) {
            String type = field.equals("f") ? "Ljava/lang/String;" : "Ljava/lang/Long;";
            if (update.getFields().stream().filter(f -> f.getName().equals(field) && f.getType().equals(type) && (f.getAccessFlags() & 9) == 1).count() != 1)
                throw new IllegalStateException("Native release asset contract changed");
        }
        int start = download.getImplementation().getRegisterCount() - 3;
        if (start != 20 || stream.getImplementation().getRegisterCount() != 13) throw new IllegalStateException("Download parameter registers changed");
        var code = download.getImplementation();
        code.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, start, 2,
            new ImmutableMethodReference(PROGRESS, "wrap", List.of(OBJECT, OBJECT), OBJECT)));
        code.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, start + 1));
        code.addInstruction(2, new BuilderInstruction21c(Opcode.CHECK_CAST, start + 1, new ImmutableTypeReference("Lkotlin/jvm/functions/Function2;")));
        var install = session.getImplementation();
        var resume = install.newLabelForIndex(0);
        install.addInstruction(0, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, 12, 13, 14, 0, 0,
            new ImmutableMethodReference(INSTALL_UI, "open", List.of(CONTEXT, FILE, "Z"), "Z")));
        install.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        install.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, resume));
        install.addInstruction(3, new BuilderInstruction10x(Opcode.RETURN_VOID));
        var uriCode = uri.getImplementation();
        uriCode.removeInstruction(1); uriCode.removeInstruction(0);
        uriCode.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 1, 0, 0, 0,
            new ImmutableMethodReference("Landroidx/core/content/FileProvider;", "c", List.of(CONTEXT, "Ljava/lang/String;"), "La4/b;")));
        uriCode.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        uriCode.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 2, 0, 0, 0,
            new ImmutableMethodReference("La4/b;", "c", List.of(FILE), "Landroid/net/Uri;")));
        uriCode.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        uriCode.addInstruction(new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
    }
    static void removeDownloadHook(MutableMethod method) {
        var body = NuvioRemainingEpisodesPatch.instructions(method);
        if (body.size() < 4 || body.get(0).getOpcode() != Opcode.INVOKE_STATIC_RANGE ||
            !NuvioPlaybackButtonsPatch.reference(body.get(0)).equals(WRAP) ||
            ((RegisterRangeInstruction) body.get(0)).getStartRegister() != 20 || ((RegisterRangeInstruction) body.get(0)).getRegisterCount() != 2 ||
            body.get(1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction) body.get(1)).getRegisterA() != 21 ||
            body.get(2).getOpcode() != Opcode.CHECK_CAST || ((OneRegisterInstruction) body.get(2)).getRegisterA() != 21 ||
            !NuvioPlaybackButtonsPatch.reference(body.get(2)).equals("Lkotlin/jvm/functions/Function2;")) throw new IllegalStateException("Download bridge missing/changed");
        for (int i = 0; i < 3; i++) method.getImplementation().removeInstruction(0);
    }
    static void removeInstallHook(MutableMethod method) {
        var body = NuvioRemainingEpisodesPatch.instructions(method);
        if (body.size() < 5 || body.get(0).getOpcode() != Opcode.INVOKE_STATIC ||
            !NuvioPlaybackButtonsPatch.reference(body.get(0)).equals(OPEN) ||
            ((FiveRegisterInstruction) body.get(0)).getRegisterCount() != 3 ||
            ((FiveRegisterInstruction) body.get(0)).getRegisterC() != 12 || ((FiveRegisterInstruction) body.get(0)).getRegisterD() != 13 ||
            ((FiveRegisterInstruction) body.get(0)).getRegisterE() != 14 ||
            body.get(1).getOpcode() != Opcode.MOVE_RESULT || ((OneRegisterInstruction) body.get(1)).getRegisterA() != 0 ||
            body.get(2).getOpcode() != Opcode.IF_EQZ || ((OneRegisterInstruction) body.get(2)).getRegisterA() != 0 ||
            NuvioAnchors.branchTarget(body, 2) != 4 || body.get(3).getOpcode() != Opcode.RETURN_VOID) throw new IllegalStateException("Install routing missing/changed");
        for (int i = 0; i < 4; i++) method.getImplementation().removeInstruction(0);
    }
}
