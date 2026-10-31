package com.bykv.vk.openvk.preload.geckox.utils;

import b.u4;
import java.io.File;
import java.io.FileNotFoundException;

/* loaded from: classes2.dex */
public class BsPatch {
    static {
        System.loadLibrary("geckox_bspatch");
    }

    public static void a(File file, File file2, File file3, String str) throws Exception {
        if (!file.exists()) {
            throw new FileNotFoundException("full package not exist：" + file.getAbsolutePath());
        }
        if (!file2.exists()) {
            throw new FileNotFoundException("patch package not exist：" + file2.getAbsolutePath());
        }
        file3.mkdirs();
        File file4 = new File(file3, str);
        file4.delete();
        int iPatch = patch(file.getAbsolutePath(), file4.getAbsolutePath(), file2.getAbsolutePath());
        if (iPatch == 0) {
            return;
        }
        StringBuilder sbJ = u4.j(iPatch, "patch merged failed, code：", " full:");
        sbJ.append(file.getAbsolutePath());
        sbJ.append(" patch:");
        sbJ.append(file2.getAbsolutePath());
        sbJ.append(" dest:");
        sbJ.append(file4.getAbsolutePath());
        throw new RuntimeException(sbJ.toString());
    }

    private static native int patch(String str, String str2, String str3) throws Exception;
}
