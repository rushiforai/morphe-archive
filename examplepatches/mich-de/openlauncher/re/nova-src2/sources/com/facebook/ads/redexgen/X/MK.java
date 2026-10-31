package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.File;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class MK extends C1681eL {
    public static byte[] A00;
    public static String[] A01 = {"I4nb8GxG61c", "lWcZexrzZyPCwXa97JGbRx7RMJI9gKq1", "aakAI8mh6jqTIwflRhZ8D8Z0ceFTjQl", "vyRM5UEFF9IluSyRJ5unfvLfh1Lz04qO", "nBXQmVWORPT1", "tt93hsDHQxAndY2rD5XDN08ttdcn", "s8Ypc7mSdfoJt0WWWrUbzXXDxRiQzd3", "Gmc"};
    public static final Pattern A02;
    public static final Pattern A03;
    public static final Pattern A04;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 22 out of bounds for length 18
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static MK A00(File file, long j11, long j12, C1690eU c1690eU) throws NumberFormatException {
        String strA0F;
        long j13 = j12;
        long length = j11;
        String name = file.getName();
        if (!name.endsWith(A06(1, 7, 51))) {
            file = A05(file, c1690eU);
            if (file == null) {
                return null;
            }
            name = file.getName();
        }
        Matcher matcher = A04.matcher(name);
        if (!matcher.matches() || (strA0F = c1690eU.A0F(Integer.parseInt((String) AbstractC1062Ln.A01(matcher.group(1))))) == null) {
            return null;
        }
        if (length == -1) {
            length = file.length();
        }
        if (length == 0) {
            return null;
        }
        long j14 = Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(2)));
        if (j13 == -9223372036854775807L) {
            j13 = Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(3)));
        }
        return new MK(strA0F, j14, length, j13, file);
    }

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            String[] strArr = A01;
            if (strArr[6].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = "Ts3WY6eF5JEGJnDZKyxqmKfGkyXOPSQH";
            strArr2[1] = "3uLJhb5CzQdeeBRXFU6Oy1dBtA7VgI52";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 6);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A00 = new byte[]{11, 27, 67, 6, 27, 80, 77, 90, 121, 15, 9, 12, 14, 123, 9, 15, 123, 67, 12, 14, 123, 9, 15, 123, 67, 12, 14, 123, 9, 81, 22, 123, 9, 66, 95, 72, 3, 101, 19, 21, 16, 18, 103, 21, 19, 103, 95, 16, 18, 103, 21, 19, 103, 95, 16, 18, 103, 21, 77, 9, 103, 21, 94, 67, 84, 31, 126, 8, 124, 68, 11, 9, 124, 14, 8, 124, 68, 11, 9, 124, 14, 8, 124, 68, 11, 9, 124, 14, 86, 19, 124, 14, 69, 88, 79, 4};
    }

    static {
        A07();
        A02 = Pattern.compile(A06(8, 29, 33), 32);
        A03 = Pattern.compile(A06(37, 29, 61), 32);
        A04 = Pattern.compile(A06(66, 30, 38), 32);
    }

    public MK(String str, long j11, long j12, long j13, File file) {
        super(str, j11, j12, j13, file);
    }

    public static MK A01(File file, long j11, C1690eU c1690eU) {
        return A00(file, j11, -9223372036854775807L, c1690eU);
    }

    public static MK A02(String str, long j11) {
        return new MK(str, j11, -1L, -9223372036854775807L, null);
    }

    public static MK A03(String str, long j11, long j12) {
        return new MK(str, j11, j12, -9223372036854775807L, null);
    }

    public static File A04(File file, int i5, long j11, long j12) {
        StringBuilder sbAppend = new StringBuilder().append(i5);
        String strA06 = A06(0, 1, 35);
        return new File(file, sbAppend.append(strA06).append(j11).append(strA06).append(j12).append(A06(1, 7, 51)).toString());
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x003d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static File A05(File file, C1690eU c1690eU) throws NumberFormatException {
        String strA0l = null;
        String name = file.getName();
        Matcher matcher = A03.matcher(name);
        if (matcher.matches()) {
            String strGroup = matcher.group(1);
            String[] strArr = A01;
            String filename = strArr[3];
            if (filename.charAt(6) != strArr[1].charAt(6)) {
                A01[4] = "ow8kvC";
                String key = (String) AbstractC1062Ln.A01(strGroup);
                strA0l = N1.A0l(key);
                if (strA0l != null) {
                    return null;
                }
                File file2 = (File) AbstractC1062Ln.A02(file.getParentFile());
                int iA0B = c1690eU.A0B(strA0l);
                String key2 = matcher.group(2);
                long j11 = Long.parseLong((String) AbstractC1062Ln.A01(key2));
                String key3 = matcher.group(3);
                File fileA04 = A04(file2, iA0B, j11, Long.parseLong((String) AbstractC1062Ln.A01(key3)));
                if (!file.renameTo(fileA04)) {
                    return null;
                }
                return fileA04;
            }
            throw new RuntimeException();
        }
        Pattern pattern = A02;
        String key4 = A01[4];
        if (key4.length() != 5) {
            String[] strArr2 = A01;
            strArr2[3] = "S7mgE4wgu7RVVt6ksDuDtQLvooCgQXJY";
            strArr2[1] = "YrgFSEXA3Qgd65zP5V28q2MnJWVi9qqT";
            matcher = pattern.matcher(name);
            if (matcher.matches()) {
                String key5 = matcher.group(1);
                strA0l = (String) AbstractC1062Ln.A01(key5);
            }
            if (strA0l != null) {
            }
        }
        throw new RuntimeException();
    }

    public final MK A0D(File file, long j11) {
        AbstractC1062Ln.A08(this.A05);
        return new MK(this.A04, this.A02, this.A01, j11, file);
    }
}
