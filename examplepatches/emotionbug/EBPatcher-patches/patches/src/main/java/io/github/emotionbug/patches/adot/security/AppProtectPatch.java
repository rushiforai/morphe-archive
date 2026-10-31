package io.github.emotionbug.patches.adot.security;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import io.github.emotionbug.patches.adot.PatchFiles;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.io.*;
import java.nio.file.*;
import java.security.*;
import java.util.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Preserve verification flow; supply the selected pre-patch base APK's digests. */
public final class AppProtectPatch implements MethodPatch {
    public static final String ID="adot.security.original-appprotect-hash";
    private static final String TARGET="Lnet/nshc/ap/AppProtect;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;";
    public final String originalMd5,originalSha256;
    public AppProtectPatch(Path input) throws IOException,NoSuchAlgorithmException {
        MessageDigest md5=MessageDigest.getInstance("MD5"),sha256=MessageDigest.getInstance("SHA-256");
        byte[] buffer=new byte[65536];
        try(InputStream in=Files.newInputStream(input)) {
            for(int count;(count=in.read(buffer))!=-1;) {
                PatchFiles.checkInterrupted();md5.update(buffer,0,count);sha256.update(buffer,0,count);
            }
        }
        originalMd5=hex(md5.digest());originalSha256=hex(sha256.digest());
    }
    private static String hex(byte[] digest) {
        char[] out=new char[digest.length*2];String digits="0123456789abcdef";
        for(int i=0;i<digest.length;i++){out[2*i]=digits.charAt((digest[i]>>>4)&15);out[2*i+1]=digits.charAt(digest[i]&15);}
        return new String(out);
    }
    @Override public String dexEntry() { return "classes2.dex"; }
    @Override public Set<String> methods() { return Collections.singleton(TARGET); }
    @Override public MethodImplementation implementation(Method original) {
        boolean fileHash=false;
        if(original.getImplementation()!=null)for(var instruction:original.getImplementation().getInstructions()) {
            if(instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof MethodReference call
                && call.getDefiningClass().equals("Lnet/nshc/ap/AppCommonUtils;") && call.getName().equals("getHash")
                && call.getParameterTypes().equals(Arrays.asList("Ljava/lang/String;","Ljava/lang/String;")))fileHash=true;
        }
        if(!id(original).equals(TARGET) || AccessFlags.STATIC.isSet(original.getAccessFlags()) || !fileHash)
            throw new IllegalStateException("Unsupported or already patched AppProtect APK hash helper.");
        // v2=this, v3=context, v4=algorithm. Both original enum branches retain their
        // original digest encoding; all native verification and request code is untouched.
        var b=new MethodImplementationBuilder(5);
        digestBranch(b,"MD5",originalMd5,"sha256");b.addLabel("sha256");
        digestBranch(b,"SHA-256",originalSha256,"unsupported");b.addLabel("unsupported");
        b.addInstruction(new BuilderInstruction21c(Opcode.NEW_INSTANCE,0,new ImmutableTypeReference("Ljava/security/NoSuchAlgorithmException;")));
        b.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_DIRECT,2,0,4,0,0,0,method("Ljava/security/NoSuchAlgorithmException;","<init>",Arrays.asList("Ljava/lang/String;"),"V")));
        b.addInstruction(new BuilderInstruction11x(Opcode.THROW,0));
        return b.getMethodImplementation();
    }
    private static void digestBranch(MethodImplementationBuilder b,String algorithm,String digest,String next) {
        b.addInstruction(string(0,algorithm));
        b.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL,2,0,4,0,0,0,method("Ljava/lang/String;","equalsIgnoreCase",Arrays.asList("Ljava/lang/String;"),"Z")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT,1));
        b.addInstruction(new BuilderInstruction21t(Opcode.IF_EQZ,1,b.getLabel(next)));
        b.addInstruction(string(0,digest));
        b.addInstruction(new BuilderInstruction11x(Opcode.RETURN_OBJECT,0));
    }
}
