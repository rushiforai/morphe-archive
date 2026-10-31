package io.github.emotionbug.patches.adot.security;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
import org.junit.Assume;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import static org.junit.Assert.*;

public class AppProtectNativeHashPatchTest {
    @Rule public TemporaryFolder temp=new TemporaryFolder();

    private static byte[] ascii(String value) {return value.getBytes(StandardCharsets.ISO_8859_1);}
    private static void put16(byte[] bytes,int offset,int value) {
        bytes[offset]=(byte)value;bytes[offset+1]=(byte)(value>>>8);
    }
    private static void put32(byte[] bytes,int offset,long value) {
        put16(bytes,offset,(int)value);put16(bytes,offset+2,(int)(value>>>16));
    }
    private static byte[] record(byte[] name,byte[] extra,byte[] comment) {
        byte[] result=new byte[46+name.length+extra.length+comment.length];
        put32(result,0,0x02014b50);put16(result,4,20);put16(result,6,20);
        put16(result,28,name.length);put16(result,30,extra.length);put16(result,32,comment.length);
        System.arraycopy(name,0,result,46,name.length);
        System.arraycopy(extra,0,result,46+name.length,extra.length);
        System.arraycopy(comment,0,result,46+name.length+extra.length,comment.length);
        return result;
    }
    private static byte[] archive(byte[] zipComment,byte[]... records) throws IOException {
        var out=new ByteArrayOutputStream();out.write(new byte[4]);
        int size=0;
        for (byte[] record:records) {out.write(record);size+=record.length;}
        byte[] end=new byte[22];put32(end,0,0x06054b50);put16(end,8,records.length);
        put16(end,10,records.length);put32(end,12,size);put32(end,16,4);put16(end,20,zipComment.length);
        out.write(end);out.write(zipComment);return out.toByteArray();
    }
    private AppProtectNativeHashPatch.DirectoryDigests digest(byte[] bytes) throws Exception {
        Path path=temp.newFile().toPath();Files.write(path,bytes);
        return AppProtectNativeHashPatch.directoryDigests(path);
    }
    private static String expected(String algorithm,byte[]... records) throws Exception {
        MessageDigest digest=MessageDigest.getInstance(algorithm);
        for (byte[] record:records) digest.update(record);
        return HexFormat.of().formatHex(digest.digest());
    }
    private void assertRecords(byte[] archive,byte[]... included) throws Exception {
        var actual=digest(archive);
        assertEquals(expected("MD5",included),actual.md5());
        assertEquals(expected("SHA-256",included),actual.sha256());
    }

    @Test public void rawHeadersNamesExtraAndCommentsAreHashedWithoutReencoding() throws Exception {
        byte[] first=record(new byte[]{(byte)0xff,'a',(byte)0x80},new byte[]{1,0,2,(byte)0xfe},new byte[]{0,9,(byte)0xc0});
        byte[] second=record(ascii("classes.dex"),new byte[0],ascii("entry comment"));
        put32(first,16,0xfeedbeefL);put32(first,38,0x81a40000L);
        assertRecords(archive(ascii("not hashed ZIP comment"),first,second),first,second);
        byte[] changed=first.clone();changed[38]^=1;
        assertNotEquals(digest(archive(new byte[0],first)).sha256(),digest(archive(new byte[0],changed)).sha256());
        changed=first.clone();changed[changed.length-1]^=1;
        assertNotEquals(digest(archive(new byte[0],first)).md5(),digest(archive(new byte[0],changed)).md5());
        changed=first.clone();changed[46+3]^=1;
        assertNotEquals(digest(archive(new byte[0],first)).sha256(),digest(archive(new byte[0],changed)).sha256());
    }

    @Test public void metaInfIsCaseSensitiveSubstringAndRespectsNativeCStringTerminator() throws Exception {
        byte[] ordinary=record(ascii("assets/a"),new byte[0],new byte[0]);
        byte[] skipped=record(ascii("prefix/META-INF/CERT.RSA"),ascii("ignored"),ascii("ignored"));
        byte[] lower=record(ascii("meta-inf/CERT.RSA"),new byte[0],new byte[0]);
        byte[] afterNul=record(ascii("file\0META-INF/CERT.RSA"),new byte[0],new byte[0]);
        byte[] beforeNul=record(ascii("META-INF/file\0suffix"),new byte[0],new byte[0]);
        assertRecords(archive(new byte[0],ordinary,skipped,lower,afterNul,beforeNul),ordinary,lower,afterNul);
        skipped[16]^=1;skipped[skipped.length-1]^=1;
        assertRecords(archive(new byte[0],ordinary,skipped),ordinary);
    }

    private byte[] realZip(String payload,long time) throws IOException {
        var bytes=new ByteArrayOutputStream();
        try (var zip=new ZipOutputStream(bytes)) {
            ZipEntry entry=new ZipEntry("classes.dex");entry.setTime(time);
            zip.putNextEntry(entry);zip.write(ascii(payload));zip.closeEntry();
        }
        return bytes.toByteArray();
    }
    @Test public void ordinaryPayloadAndMetadataChangesChangeBothDirectoryDigests() throws Exception {
        var baseline=digest(realZip("original",946684800000L));
        for (byte[] changed:new byte[][]{realZip("modified",946684800000L),realZip("original",978307200000L)}) {
            var actual=digest(changed);
            assertNotEquals(baseline.md5(),actual.md5());assertNotEquals(baseline.sha256(),actual.sha256());
        }
    }

    @Test public void payloadAloneIsNotReadOrHashed() throws Exception {
        byte[] central=record(ascii("file"),new byte[0],new byte[0]);
        byte[] original=archive(new byte[0],central),changed=original.clone();changed[0]=99;
        assertEquals(digest(original).sha256(),digest(changed).sha256());
        assertRecords(original,central);
    }

    @Test public void malformedAndUnsupportedBoundariesFailClosed() throws Exception {
        byte[] central=record(ascii("file"),new byte[0],new byte[0]);
        byte[] valid=archive(new byte[0],central);int end=valid.length-22;
        assertThrows(IOException.class,()->digest(new byte[21]));
        assertThrows(IOException.class,()->digest(Arrays.copyOf(valid,valid.length-1)));
        for (int kind=0;kind<13;kind++) {
            byte[] bad=valid.clone();
            switch (kind) {
                case 0 -> bad[4]=0; // Central signature.
                case 1 -> put32(bad,end+12,central.length+1);
                case 2 -> put32(bad,end+16,valid.length);
                case 3 -> put16(bad,end+10,2);
                case 4 -> put16(bad,end+4,1);
                case 5 -> put16(bad,end+20,1);
                case 6 -> put16(bad,4+28,32768);
                case 7 -> put16(bad,4+28,0);
                case 8 -> put16(bad,4+30,100);
                case 9 -> put32(bad,4+20,0xffffffffL);
                case 10 -> put16(bad,4+34,1);
                case 11 -> {put16(bad,end+8,32768);put16(bad,end+10,32768);}
                case 12 -> put32(bad,end+16,0x80000000L);
            }
            assertThrows("malformed case "+kind,IOException.class,()->digest(bad));
        }
        // Native would choose this later raw signature; never silently select an earlier EOCD.
        byte[] ambiguousComment=new byte[30];put32(ambiguousComment,0,0x06054b50);
        assertThrows(IOException.class,()->digest(archive(ambiguousComment,central)));
    }

    @Test public void interruptionStopsDirectoryCapture() throws Exception {
        byte[] bytes=archive(new byte[0],record(ascii("file"),new byte[0],new byte[0]));
        try {
            Thread.currentThread().interrupt();
            assertThrows(java.io.InterruptedIOException.class,()->digest(bytes));
        } finally {Thread.interrupted();}
    }

    @Test public void replacementsContainSeparateTerminatedDigestsAndRejectInvalidValues() {
        var hashes=new AppProtectNativeHashPatch.DirectoryDigests("0123456789abcdef0123456789abcdef","ab".repeat(32));
        for (var library:new AppProtectNativeHashPatch.Library[]{AppProtectNativeHashPatch.ARM64,AppProtectNativeHashPatch.THUMB}) {
            byte[] replacement=AppProtectNativeHashPatch.replacement(library,hashes);
            int start=library.code.length;
            assertArrayEquals(ascii(hashes.md5()+"\0"),Arrays.copyOfRange(replacement,start,start+33));
            assertArrayEquals(ascii(hashes.sha256()+"\0"),Arrays.copyOfRange(replacement,start+33,replacement.length));
            assertThrows(IllegalArgumentException.class,()->AppProtectNativeHashPatch.replacement(library,
                new AppProtectNativeHashPatch.DirectoryDigests("A".repeat(32),hashes.sha256())));
        }
    }

    @Test public void unsupportedLibrariesAreRejectedWithoutMutatingInput() {
        var hashes=new AppProtectNativeHashPatch.DirectoryDigests("0".repeat(32),"1".repeat(64));
        for (var library:new AppProtectNativeHashPatch.Library[]{AppProtectNativeHashPatch.ARM64,AppProtectNativeHashPatch.THUMB}) {
            byte[] bytes=new byte[library.size],copy=bytes.clone();
            assertThrows(IOException.class,()->AppProtectNativeHashPatch.patchLibrary(library,bytes,hashes));
            assertArrayEquals(copy,bytes);
        }
    }

    @Test public void privateOriginalLibrariesPatchOnlyOwnedRangesAndReapplicationFails() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide a private original APK via EBPATCHER_TEST_APK",path!=null);
        Path apk=Path.of(path);var hashes=AppProtectNativeHashPatch.directoryDigests(apk);
        try (var zip=new ZipFile(apk.toFile())) {
            for (var library:new AppProtectNativeHashPatch.Library[]{AppProtectNativeHashPatch.ARM64,AppProtectNativeHashPatch.THUMB}) {
                byte[] original;
                try (var in=zip.getInputStream(zip.getEntry(library.entry()))) {original=in.readAllBytes();}
                byte[] snapshot=original.clone(),patched=AppProtectNativeHashPatch.patchLibrary(library,original,hashes);
                assertEquals(snapshot.length,patched.length);
                int end=library.offset+library.code.length+98;
                assertArrayEquals(Arrays.copyOfRange(snapshot,0,library.offset),Arrays.copyOfRange(patched,0,library.offset));
                assertArrayEquals(Arrays.copyOfRange(snapshot,end,snapshot.length),Arrays.copyOfRange(patched,end,patched.length));
                assertThrows(IOException.class,()->AppProtectNativeHashPatch.patchLibrary(library,patched,hashes));
                for (int index:new int[]{0,library.offset,end-1,original.length-1}) {
                    byte[] changed=snapshot.clone();changed[index]^=1;
                    assertThrows(IOException.class,()->AppProtectNativeHashPatch.patchLibrary(library,changed,hashes));
                }
            }
        }
    }
}
