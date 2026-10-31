package kotlin.io;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import e1.k0;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m70.a;
import r70.k;
import u90.b;

@Metadata(d1 = {"u90/b", "kotlin/io/FilesKt", "kotlin/io/FilesKt", "kotlin/io/FilesKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class FilesKt extends b {
    private FilesKt() {
    }

    public static void m0(File file, File file2) {
        if (!file.exists()) {
            throw new NoSuchFileException(file);
        }
        if (file2.exists() && !file2.delete()) {
            throw new FileAlreadyExistsException(file, file2, "Tried to overwrite the destination, but failed to delete it.");
        }
        if (file.isDirectory()) {
            if (!file2.mkdirs()) {
                throw new FileSystemException(file, file2, "Failed to create target directory.");
            }
            return;
        }
        File parentFile = file2.getParentFile();
        if (parentFile != null) {
            parentFile.mkdirs();
        }
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file2);
            try {
                ByteStreamsKt.a(fileInputStream, fileOutputStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                fileOutputStream.close();
                fileInputStream.close();
            } finally {
            }
        } finally {
        }
    }

    public static boolean n0(File file) {
        Intrinsics.g(file, "<this>");
        Iterator it = new FileTreeWalk(file, FileWalkDirection.f71829b).getF71970a();
        while (true) {
            boolean z11 = true;
            while (it.hasNext()) {
                File file2 = (File) it.next();
                if (!file2.delete() && file2.exists()) {
                    z11 = false;
                } else {
                    if (z11) {
                        break;
                    }
                    z11 = false;
                }
            }
            return z11;
        }
    }

    public static final void o0(File file, Charset charset, Function1 function1) throws IOException {
        Intrinsics.g(file, "<this>");
        Intrinsics.g(charset, "charset");
        TextStreamsKt.a(new BufferedReader(new InputStreamReader(new FileInputStream(file), charset)), function1);
    }

    public static String p0(File file) {
        Intrinsics.g(file, "<this>");
        String name = file.getName();
        Intrinsics.f(name, "getName(...)");
        return k.n1('.', name, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public static String q0(File file) {
        Intrinsics.g(file, "<this>");
        String name = file.getName();
        Intrinsics.f(name, "getName(...)");
        return k.r1(name, name);
    }

    public static byte[] r0(File file) throws IOException {
        Intrinsics.g(file, "<this>");
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            long length = file.length();
            if (length > 2147483647L) {
                throw new OutOfMemoryError("File " + file + " is too big (" + length + " bytes) to fit in memory.");
            }
            int i5 = (int) length;
            byte[] bArrCopyOf = new byte[i5];
            int i11 = i5;
            int i12 = 0;
            while (i11 > 0) {
                int i13 = fileInputStream.read(bArrCopyOf, i12, i11);
                if (i13 < 0) {
                    break;
                }
                i11 -= i13;
                i12 += i13;
            }
            if (i11 > 0) {
                bArrCopyOf = Arrays.copyOf(bArrCopyOf, i12);
                Intrinsics.f(bArrCopyOf, "copyOf(...)");
            } else {
                int i14 = fileInputStream.read();
                if (i14 != -1) {
                    a aVar = new a();
                    aVar.write(i14);
                    ByteStreamsKt.a(fileInputStream, aVar, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    int size = aVar.size() + i5;
                    if (size < 0) {
                        throw new OutOfMemoryError("File " + file + " is too big to fit in memory.");
                    }
                    byte[] bArrA = aVar.a();
                    bArrCopyOf = Arrays.copyOf(bArrCopyOf, size);
                    Intrinsics.f(bArrCopyOf, "copyOf(...)");
                    b.q(bArrA, i5, bArrCopyOf, 0, aVar.size());
                }
            }
            fileInputStream.close();
            return bArrCopyOf;
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(fileInputStream, th2);
                throw th3;
            }
        }
    }

    public static ArrayList s0(File file) throws IOException {
        Charset charset = Charsets.f72000b;
        Intrinsics.g(file, "<this>");
        Intrinsics.g(charset, "charset");
        ArrayList arrayList = new ArrayList();
        o0(file, charset, new k0(arrayList, 3));
        return arrayList;
    }

    public static String t0(File file, Charset charset) throws IOException {
        Intrinsics.g(charset, "charset");
        InputStreamReader inputStreamReader = new InputStreamReader(new FileInputStream(file), charset);
        try {
            String strB = TextStreamsKt.b(inputStreamReader);
            inputStreamReader.close();
            return strB;
        } finally {
        }
    }

    public static File u0(File file, String relative) {
        int length;
        int iR0;
        Intrinsics.g(file, "<this>");
        Intrinsics.g(relative, "relative");
        File file2 = new File(relative);
        String path = file2.getPath();
        Intrinsics.f(path, "getPath(...)");
        char c11 = File.separatorChar;
        int iR02 = k.R0(c11, 0, 4, path);
        if (iR02 != 0) {
            length = (iR02 <= 0 || path.charAt(iR02 + (-1)) != ':') ? (iR02 == -1 && k.M0(path, AbstractJsonLexerKt.COLON)) ? path.length() : 0 : iR02 + 1;
        } else if (path.length() <= 1 || path.charAt(1) != c11 || (iR0 = k.R0(c11, 2, 4, path)) < 0) {
            length = 1;
        } else {
            int iR03 = k.R0(c11, iR0 + 1, 4, path);
            length = iR03 >= 0 ? iR03 + 1 : path.length();
        }
        if (length > 0) {
            return file2;
        }
        String string = file.toString();
        Intrinsics.f(string, "toString(...)");
        if ((string.length() == 0) || k.M0(string, c11)) {
            return new File(string + file2);
        }
        return new File(string + c11 + file2);
    }

    public static void v0(File file, byte[] array) throws IOException {
        Intrinsics.g(array, "array");
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try {
            fileOutputStream.write(array);
            Unit unit = Unit.f71706a;
            fileOutputStream.close();
        } finally {
        }
    }

    public static void w0(File file, String text, Charset charset) {
        Intrinsics.g(file, "<this>");
        Intrinsics.g(text, "text");
        Intrinsics.g(charset, "charset");
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try {
            y0(fileOutputStream, text, charset);
            Unit unit = Unit.f71706a;
            fileOutputStream.close();
        } finally {
        }
    }

    public static final void y0(FileOutputStream fileOutputStream, String text, Charset charset) throws IOException {
        Intrinsics.g(text, "text");
        Intrinsics.g(charset, "charset");
        if (text.length() < 16384) {
            byte[] bytes = text.getBytes(charset);
            Intrinsics.f(bytes, "getBytes(...)");
            fileOutputStream.write(bytes);
            return;
        }
        CharsetEncoder charsetEncoderNewEncoder = charset.newEncoder();
        CodingErrorAction codingErrorAction = CodingErrorAction.REPLACE;
        CharsetEncoder charsetEncoderOnUnmappableCharacter = charsetEncoderNewEncoder.onMalformedInput(codingErrorAction).onUnmappableCharacter(codingErrorAction);
        CharBuffer charBufferAllocate = CharBuffer.allocate(UserMetadata.MAX_INTERNAL_KEY_SIZE);
        Intrinsics.d(charsetEncoderOnUnmappableCharacter);
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(UserMetadata.MAX_INTERNAL_KEY_SIZE * ((int) Math.ceil(charsetEncoderOnUnmappableCharacter.maxBytesPerChar())));
        Intrinsics.f(byteBufferAllocate, "allocate(...)");
        int i5 = 0;
        int i11 = 0;
        while (i5 < text.length()) {
            int iMin = Math.min(8192 - i11, text.length() - i5);
            int i12 = i5 + iMin;
            char[] cArrArray = charBufferAllocate.array();
            Intrinsics.f(cArrArray, "array(...)");
            text.getChars(i5, i12, cArrArray, i11);
            charBufferAllocate.limit(iMin + i11);
            i11 = 1;
            if (!charsetEncoderOnUnmappableCharacter.encode(charBufferAllocate, byteBufferAllocate, i12 == text.length()).isUnderflow()) {
                throw new IllegalStateException("Check failed.");
            }
            fileOutputStream.write(byteBufferAllocate.array(), 0, byteBufferAllocate.position());
            if (charBufferAllocate.position() != charBufferAllocate.limit()) {
                charBufferAllocate.put(0, charBufferAllocate.get());
            } else {
                i11 = 0;
            }
            charBufferAllocate.clear();
            byteBufferAllocate.clear();
            i5 = i12;
        }
    }
}
