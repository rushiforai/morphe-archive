package defpackage;

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
import java.util.Arrays;
import kotlin.io.FileAlreadyExistsException;
import kotlin.io.FileSystemException;
import kotlin.io.NoSuchFileException;

/* JADX INFO: loaded from: classes5.dex */
public abstract class oh4 extends xz5 {
    public static void G0(File file, File file2) throws IOException {
        if (!file.exists()) {
            throw new NoSuchFileException(file, null, "The source file doesn't exist.");
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
                op8.O(fileInputStream, fileOutputStream);
                fileOutputStream.close();
                fileInputStream.close();
            } finally {
            }
        } finally {
        }
    }

    public static boolean H0(File file) {
        file.getClass();
        lh4 lh4Var = lh4.BOTTOM_UP;
        lh4Var.getClass();
        ih4 ih4Var = new ih4(new hi3(file, lh4Var));
        while (true) {
            boolean z = true;
            while (ih4Var.hasNext()) {
                File file2 = (File) ih4Var.next();
                if (!file2.delete() && file2.exists()) {
                    z = false;
                } else {
                    if (z) {
                        break;
                    }
                    z = false;
                }
            }
            return z;
        }
    }

    public static String I0(File file) {
        file.getClass();
        String name = file.getName();
        name.getClass();
        int iE0 = muc.e0(name, 0, 6, ".");
        return iE0 == -1 ? name : name.substring(0, iE0);
    }

    public static byte[] J0(File file) {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            long length = file.length();
            if (length > 2147483647L) {
                throw new OutOfMemoryError("File " + file + " is too big (" + length + " bytes) to fit in memory.");
            }
            int i = (int) length;
            byte[] bArrCopyOf = new byte[i];
            int i2 = i;
            int i3 = 0;
            while (i2 > 0) {
                int i4 = fileInputStream.read(bArrCopyOf, i3, i2);
                if (i4 < 0) {
                    break;
                }
                i2 -= i4;
                i3 += i4;
            }
            if (i2 > 0) {
                bArrCopyOf = Arrays.copyOf(bArrCopyOf, i3);
            } else {
                int i5 = fileInputStream.read();
                if (i5 != -1) {
                    i74 i74Var = new i74(8193);
                    i74Var.write(i5);
                    op8.O(fileInputStream, i74Var);
                    int size = i74Var.size() + i;
                    if (size < 0) {
                        throw new OutOfMemoryError("File " + file + " is too big to fit in memory.");
                    }
                    byte[] bArrF = i74Var.f();
                    bArrCopyOf = Arrays.copyOf(bArrCopyOf, size);
                    k80.f0(i, 0, i74Var.size(), bArrF, bArrCopyOf);
                }
            }
            fileInputStream.close();
            return bArrCopyOf;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                k50.X(fileInputStream, th);
                throw th2;
            }
        }
    }

    public static String K0(File file, Charset charset) throws IOException {
        file.getClass();
        charset.getClass();
        InputStreamReader inputStreamReader = new InputStreamReader(new FileInputStream(file), charset);
        try {
            String strY = qk7.y(inputStreamReader);
            inputStreamReader.close();
            return strY;
        } finally {
        }
    }

    public static void L0(File file, String str) throws IOException {
        Charset charset = wk1.a;
        file.getClass();
        charset.getClass();
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try {
            M0(fileOutputStream, str, charset);
            fileOutputStream.close();
        } finally {
        }
    }

    public static final void M0(FileOutputStream fileOutputStream, String str, Charset charset) throws IOException {
        if (str.length() < 16384) {
            byte[] bytes = str.getBytes(charset);
            bytes.getClass();
            fileOutputStream.write(bytes);
            return;
        }
        CharsetEncoder charsetEncoderNewEncoder = charset.newEncoder();
        CodingErrorAction codingErrorAction = CodingErrorAction.REPLACE;
        CharsetEncoder charsetEncoderOnUnmappableCharacter = charsetEncoderNewEncoder.onMalformedInput(codingErrorAction).onUnmappableCharacter(codingErrorAction);
        CharBuffer charBufferAllocate = CharBuffer.allocate(8192);
        charsetEncoderOnUnmappableCharacter.getClass();
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(8192 * ((int) Math.ceil(charsetEncoderOnUnmappableCharacter.maxBytesPerChar())));
        byteBufferAllocate.getClass();
        int i = 0;
        int i2 = 0;
        while (i < str.length()) {
            int iMin = Math.min(8192 - i2, str.length() - i);
            int i3 = i + iMin;
            char[] cArrArray = charBufferAllocate.array();
            cArrArray.getClass();
            str.getChars(i, i3, cArrArray, i2);
            charBufferAllocate.limit(iMin + i2);
            i2 = 1;
            if (!charsetEncoderOnUnmappableCharacter.encode(charBufferAllocate, byteBufferAllocate, i3 == str.length()).isUnderflow()) {
                ygf.f("Check failed.");
                return;
            }
            fileOutputStream.write(byteBufferAllocate.array(), 0, byteBufferAllocate.position());
            if (charBufferAllocate.position() != charBufferAllocate.limit()) {
                charBufferAllocate.put(0, charBufferAllocate.get());
            } else {
                i2 = 0;
            }
            charBufferAllocate.clear();
            byteBufferAllocate.clear();
            i = i3;
        }
    }
}
