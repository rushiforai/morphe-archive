package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class m extends g {

    /* renamed from: g, reason: collision with root package name */
    public static final Pattern f30334g = Pattern.compile("^(.+)\\.(\\d+)\\.(\\d+)\\.v1\\.exo$", 32);

    /* renamed from: h, reason: collision with root package name */
    public static final Pattern f30335h = Pattern.compile("^(.+)\\.(\\d+)\\.(\\d+)\\.v2\\.exo$", 32);

    /* renamed from: i, reason: collision with root package name */
    public static final Pattern f30336i = Pattern.compile("^(\\d+)\\.(\\d+)\\.(\\d+)\\.v3\\.exo$", 32);

    public m(String str, long j11, long j12, long j13, File file) {
        super(str, j11, j12, j13, file);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00e6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00e7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static m a(File file, i iVar) throws NumberFormatException {
        File file2;
        String strGroup;
        File file3;
        h hVarA;
        String name = file.getName();
        if (name.endsWith(".v3.exo")) {
            file2 = file;
        } else {
            String name2 = file.getName();
            Matcher matcher = f30335h.matcher(name2);
            if (matcher.matches()) {
                strGroup = matcher.group(1);
                int i5 = z.f30489a;
                int length = strGroup.length();
                int iEnd = 0;
                int i11 = 0;
                for (int i12 = 0; i12 < length; i12++) {
                    if (strGroup.charAt(i12) == '%') {
                        i11++;
                    }
                }
                if (i11 != 0) {
                    int i13 = length - (i11 * 2);
                    StringBuilder sb2 = new StringBuilder(i13);
                    Matcher matcher2 = z.f30495g.matcher(strGroup);
                    while (i11 > 0 && matcher2.find()) {
                        char c11 = (char) Integer.parseInt(matcher2.group(1), 16);
                        sb2.append((CharSequence) strGroup, iEnd, matcher2.start());
                        sb2.append(c11);
                        iEnd = matcher2.end();
                        i11--;
                    }
                    if (iEnd < length) {
                        sb2.append((CharSequence) strGroup, iEnd, length);
                    }
                    strGroup = sb2.length() != i13 ? null : sb2.toString();
                }
                if (strGroup == null) {
                    file3 = null;
                    if (file3 != null) {
                        return null;
                    }
                    name = file3.getName();
                    file2 = file3;
                } else {
                    File parentFile = file.getParentFile();
                    hVarA = (h) iVar.f30317a.get(strGroup);
                    if (hVarA == null) {
                        hVarA = iVar.a(strGroup, -1L);
                    }
                    int i14 = hVarA.f30313a;
                    long j11 = Long.parseLong(matcher.group(2));
                    long j12 = Long.parseLong(matcher.group(3));
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(i14);
                    sb3.append(".");
                    sb3.append(j11);
                    sb3.append(".");
                    file3 = new File(parentFile, a2.c.i(j12, ".v3.exo", sb3));
                    if (!file.renameTo(file3)) {
                    }
                    if (file3 != null) {
                    }
                }
            } else {
                matcher = f30334g.matcher(name2);
                if (matcher.matches()) {
                    strGroup = matcher.group(1);
                    File parentFile2 = file.getParentFile();
                    hVarA = (h) iVar.f30317a.get(strGroup);
                    if (hVarA == null) {
                    }
                    int i142 = hVarA.f30313a;
                    long j112 = Long.parseLong(matcher.group(2));
                    long j122 = Long.parseLong(matcher.group(3));
                    StringBuilder sb32 = new StringBuilder();
                    sb32.append(i142);
                    sb32.append(".");
                    sb32.append(j112);
                    sb32.append(".");
                    file3 = new File(parentFile2, a2.c.i(j122, ".v3.exo", sb32));
                    if (!file.renameTo(file3)) {
                    }
                    if (file3 != null) {
                    }
                }
                file3 = null;
                if (file3 != null) {
                }
            }
        }
        Matcher matcher3 = f30336i.matcher(name);
        if (!matcher3.matches()) {
            return null;
        }
        long length2 = file2.length();
        String str = (String) iVar.f30318b.get(Integer.parseInt(matcher3.group(1)));
        if (str == null) {
            return null;
        }
        return new m(str, Long.parseLong(matcher3.group(2)), length2, Long.parseLong(matcher3.group(3)), file2);
    }
}
