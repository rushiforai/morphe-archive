package io.github.emotionbug.patches.adot.security;

import io.github.emotionbug.patches.adot.PatchFiles;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Supplies the selected base APK's native directory hashes, not a verification verdict. */
public final class AppProtectNativeHashPatch {
    private static final byte[] META_INF="META-INF/".getBytes(StandardCharsets.US_ASCII);
    private static final String LIBRARY="libap1.11.12.so";
    // Generated from src/main/native/appprotect-hash-{arm64,thumb}.S with LLVM 20 + NDK LLD.
    // Position-independent relative calls retain the original calloc PLT and free ownership.
    static final Library ARM64=new Library("arm64-v8a",26552,0x2be0,
        "ba65d8fc34317bd05f6a66a11d7ec07585bd6fc7c859f477282c94d832d0b208",
        "3641b999c1eeecdb361819a97e2d5729f8a3acad6120a37c1d653358fcdf1b59",
        "5fb00071c00000545f980071610300548304003024088052030000142303001024048052"+
        "f353bea9f57b01a9f30301aaf40303aaf50304aa20008052e10315aa88fbff97200100b4"+
        "e30300aa8216403862140038b50600f1a1ffff54600200f9000080520200001400008012"+
        "f57b41a9f353c2a8c0035fd600008012c0035fd6");
    static final Library THUMB=new Library("armeabi-v7a",30404,0x28cc,
        "93c048570140715f905e867597be8c409cf23d7daa1c99bb4680865dc86ef57f",
        "8e8d852b28da70af225842e6d6fbd95b202e9d9786ed6916dfc16f24f41d8bbb",
        "2c2a05d0262a1cd10ff25d03412202e00ff23403212270b50c461d46164601203146"+
        "fff740e948b1014615f8012b01f8012b013ef9d12060002070bd4ff0ff3070bd4ff0ff307047");

    public final String originalDirectoryMd5,originalDirectorySha256;

    public AppProtectNativeHashPatch(Path input) throws IOException,NoSuchAlgorithmException {
        DirectoryDigests digests=directoryDigests(input);
        originalDirectoryMd5=digests.md5();
        originalDirectorySha256=digests.sha256();
    }

    public interface LibrarySource { byte[] read(String entry, int expectedSize) throws IOException; }

    /** The original snapshot supplies hashes; the current APK supplies guarded code. */
    public Map<String,byte[]> replacements(LibrarySource source) throws IOException,NoSuchAlgorithmException {
        Map<String,byte[]> patched=new LinkedHashMap<>();
        DirectoryDigests digests=new DirectoryDigests(originalDirectoryMd5,originalDirectorySha256);
        for (Library library:new Library[]{ARM64,THUMB}) {
            PatchFiles.checkInterrupted();
            patched.put(library.entry(),patchLibrary(library,source.read(library.entry(),library.size),digests));
        }
        return patched;
    }

    public static final class DirectoryDigests {
        private final String md5,sha256;
        public DirectoryDigests(String md5,String sha256) {this.md5=md5;this.sha256=sha256;}
        public String md5() {return md5;}
        public String sha256() {return sha256;}
    }

    /** Raw central records, excluding case-sensitive C-string substring META-INF/. */
    public static DirectoryDigests directoryDigests(Path apk) throws IOException,NoSuchAlgorithmException {
        MessageDigest md5=MessageDigest.getInstance("MD5"),sha256=MessageDigest.getInstance("SHA-256");
        try (RandomAccessFile file=new RandomAccessFile(apk.toFile(),"r")) {
            long length=file.length();
            require(length>=22,"Missing ZIP end record");
            byte[] tail=new byte[(int)Math.min(length,65557)];
            long tailStart=length-tail.length;
            file.seek(tailStart);file.readFully(tail);
            int end=-1;
            // Native scans backwards for the first signature, not the first *valid* EOCD.
            // Fail closed on an ambiguous signature in a ZIP comment rather than disagree.
            for (int i=tail.length-22;i>=0;i--) {
                if (u32(tail,i)==0x06054b50L) {end=i;break;}
            }
            require(end>=0,"Missing ZIP end record");
            long endOffset=tailStart+end;
            require(endOffset>=2 && end+22+u16(tail,end+20)==tail.length,"Invalid ZIP end boundary");
            int entries=u16(tail,end+10);
            require(u16(tail,end+4)==0 && u16(tail,end+6)==0 && u16(tail,end+8)==entries,
                "Multi-disk ZIP is unsupported");
            long directorySize=u32(tail,end+12),directoryOffset=u32(tail,end+16);
            // Both shipped helpers sign-extend the entry count, variable lengths and CD offset.
            require(entries<=32767 && directoryOffset<=Integer.MAX_VALUE && directorySize!=0xffffffffL,
                "ZIP64 or signed native ZIP limits exceeded");
            require(directoryOffset<=endOffset && directorySize==endOffset-directoryOffset,
                "Invalid central-directory boundary");
            file.seek(directoryOffset);
            byte[] header=new byte[46],name=new byte[32767],buffer=new byte[8192];
            for (int index=0;index<entries;index++) {
                PatchFiles.checkInterrupted();
                require(file.getFilePointer()<=endOffset-46,"Truncated central header");
                file.readFully(header);
                require(u32(header,0)==0x02014b50L,"Invalid central header signature");
                int nameLength=u16(header,28),extraLength=u16(header,30),commentLength=u16(header,32);
                require(nameLength>0 && nameLength<=32767 && extraLength<=32767 && commentLength<=32767,
                    "Unsupported native central-record lengths");
                require(u16(header,34)==0 && u32(header,20)!=0xffffffffL && u32(header,24)!=0xffffffffL
                    && u32(header,42)!=0xffffffffL,"ZIP64 or multi-disk entry is unsupported");
                long remaining=(long)nameLength+extraLength+commentLength;
                require(remaining<=endOffset-file.getFilePointer(),"Truncated central record");
                file.readFully(name,0,nameLength);
                boolean skip=isMetaInf(name,nameLength);
                if (!skip) {
                    md5.update(header);sha256.update(header);
                    md5.update(name,0,nameLength);sha256.update(name,0,nameLength);
                }
                for (int rest=extraLength+commentLength;rest>0;) {
                    PatchFiles.checkInterrupted();
                    int count=Math.min(rest,buffer.length);file.readFully(buffer,0,count);
                    if (!skip) {md5.update(buffer,0,count);sha256.update(buffer,0,count);}
                    rest-=count;
                }
            }
            require(file.getFilePointer()==endOffset,"Central-directory count/size mismatch");
        }
        return new DirectoryDigests(hex(md5.digest()),hex(sha256.digest()));
    }

    private static boolean isMetaInf(byte[] name,int length) {
        int cLength=0;
        while (cLength<length && name[cLength]!=0) cLength++;
        outer: for (int i=0;i<=cLength-META_INF.length;i++) {
            for (int j=0;j<META_INF.length;j++) if (name[i+j]!=META_INF[j]) continue outer;
            return true;
        }
        return false;
    }

    static byte[] patchLibrary(Library library,byte[] original,DirectoryDigests digests)
            throws IOException,NoSuchAlgorithmException {
        require(original.length==library.size,"Unsupported AppProtect library size: "+library.abi);
        MessageDigest sha256=MessageDigest.getInstance("SHA-256");
        require(hex(sha256.digest(original)).equals(library.sha256),
            "Unsupported or already patched AppProtect library: "+library.abi);
        int rangeLength=library.code.length+33+65;
        sha256.update(original,library.offset,rangeLength);
        require(hex(sha256.digest()).equals(library.rangeSha256),
            "AppProtect hash helper bytes do not match: "+library.abi);
        byte[] replacement=replacement(library,digests);
        System.arraycopy(replacement,0,original,library.offset,replacement.length);
        return original;
    }

    static byte[] replacement(Library library,DirectoryDigests digests) {
        if (!lowerHex(digests.md5(),32) || !lowerHex(digests.sha256(),64))
            throw new IllegalArgumentException("Expected lower-case original directory hashes");
        byte[] result=Arrays.copyOf(library.code,library.code.length+33+65);
        byte[] md5=digests.md5().getBytes(StandardCharsets.US_ASCII);
        byte[] sha256=digests.sha256().getBytes(StandardCharsets.US_ASCII);
        System.arraycopy(md5,0,result,library.code.length,md5.length);
        System.arraycopy(sha256,0,result,library.code.length+33,sha256.length);
        return result;
    }

    private static boolean lowerHex(String value,int length) {
        if (value==null || value.length()!=length) return false;
        for (int i=0;i<length;i++) {
            char c=value.charAt(i);
            if (!(c>='0' && c<='9') && !(c>='a' && c<='f')) return false;
        }
        return true;
    }

    private static int u16(byte[] bytes,int offset) {
        return (bytes[offset]&255)|((bytes[offset+1]&255)<<8);
    }
    private static long u32(byte[] bytes,int offset) {
        return Integer.toUnsignedLong(u16(bytes,offset)|(u16(bytes,offset+2)<<16));
    }
    private static void require(boolean condition,String message) throws IOException {
        if (!condition) throw new IOException(message);
    }
    private static String hex(byte[] bytes) {
        char[] result=new char[bytes.length*2];
        String digits="0123456789abcdef";
        for (int i=0;i<bytes.length;i++) {
            result[2*i]=digits.charAt((bytes[i]>>>4)&15);
            result[2*i+1]=digits.charAt(bytes[i]&15);
        }
        return new String(result);
    }
    private static byte[] parseHex(String value) {
        byte[] result=new byte[value.length()/2];
        for (int i=0;i<result.length;i++)
            result[i]=(byte)((Character.digit(value.charAt(2*i),16)<<4)|Character.digit(value.charAt(2*i+1),16));
        return result;
    }

    static final class Library {
        final String abi,sha256,rangeSha256;
        final int size,offset;
        final byte[] code;
        Library(String abi,int size,int offset,String sha256,String rangeSha256,String code) {
            this.abi=abi;this.size=size;this.offset=offset;this.sha256=sha256;this.rangeSha256=rangeSha256;
            this.code=parseHex(code);
        }
        String entry() {return "lib/"+abi+"/"+LIBRARY;}
    }
}
