package com.facebook.ads.redexgen.X;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.dR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1626dR {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 71);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{53, 124, 102, 53, 123, 122, 97, 53, 113, 124, 103, 112, 118, 97, 122, 103, 108, 52, 7, 42, 49, 38, 32, 55, 44, 49, 58, 99, 102, 48, 99, 32, 34, 45, 100, 55, 99, 33, 38, 99, 32, 49, 38, 34, 55, 38, 39, 110, 89, 89, 68, 89, 11, 89, 78, 72, 89, 78, 74, 95, 78, 11, 81, 78, 89, 68, 6, 88, 66, 81, 78, 11, 77, 66, 71, 78, 11, 36, 19, 19, 14, 19, 65, 18, 4, 21, 65, 13, 0, 18, 21, 65, 12, 14, 5, 8, 7, 8, 4, 5, 65, 5, 0, 21, 4, 65, 21, 14, 65, 69, 106, 111, 102, 35, 99, 102, 117};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static synchronized void A06(File file) throws IOException {
        if (file.exists()) {
            if (!file.isDirectory()) {
                throw new IOException(A00(109, 5, 68) + file + A00(0, 18, 82));
            }
        } else if (!file.mkdirs()) {
            throw new IOException(String.format(Locale.US, A00(18, 29, 4), file.getAbsolutePath()));
        }
    }

    public static List<File> A01(File file) {
        LinkedList linkedList = new LinkedList();
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null) {
            List<File> listAsList = Arrays.asList(fileArrListFiles);
            Collections.sort(listAsList, new C1625dQ());
            return listAsList;
        }
        return linkedList;
    }

    public static void A03(File file) throws IOException {
        if (file.exists()) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (!file.setLastModified(jCurrentTimeMillis)) {
                A04(file);
                if (file.lastModified() >= jCurrentTimeMillis) {
                } else {
                    throw new IOException(A00(77, 32, 38) + file);
                }
            }
        }
    }

    public static void A04(File file) throws IOException {
        long length = file.length();
        if (length == 0) {
            A05(file);
            return;
        }
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, A00(114, 3, 86));
        long size = length - 1;
        randomAccessFile.seek(size);
        byte b11 = randomAccessFile.readByte();
        randomAccessFile.seek(length - 1);
        randomAccessFile.write(b11);
        randomAccessFile.close();
    }

    public static void A05(File file) throws IOException {
        if (file.delete() && file.createNewFile()) {
        } else {
            throw new IOException(A00(47, 30, 108) + file);
        }
    }
}
