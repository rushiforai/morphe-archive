package com.bykv.vk.openvk.preload.geckox.utils;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public final class g {
    public static Long a(File file) throws NumberFormatException {
        File[] fileArrListFiles = file.listFiles(new FileFilter() { // from class: com.bykv.vk.openvk.preload.geckox.utils.g.1
            @Override // java.io.FileFilter
            public final boolean accept(File file2) {
                return file2.isDirectory();
            }
        });
        Long l9 = null;
        if (fileArrListFiles != null && fileArrListFiles.length != 0) {
            for (File file2 : fileArrListFiles) {
                try {
                    Long lValueOf = Long.valueOf(file2.getName());
                    long jLongValue = lValueOf.longValue();
                    if (l9 == null || jLongValue > l9.longValue()) {
                        l9 = lValueOf;
                    }
                } catch (Exception unused) {
                }
            }
        }
        return l9;
    }

    public static List<Long> b(File file) throws NumberFormatException {
        File[] fileArrListFiles = file.listFiles(new FileFilter() { // from class: com.bykv.vk.openvk.preload.geckox.utils.g.2
            @Override // java.io.FileFilter
            public final boolean accept(File file2) {
                return file2.isDirectory();
            }
        });
        if (fileArrListFiles == null || fileArrListFiles.length == 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (File file2 : fileArrListFiles) {
            try {
                Long lValueOf = Long.valueOf(file2.getName());
                lValueOf.longValue();
                arrayList.add(lValueOf);
            } catch (Exception unused) {
            }
        }
        return arrayList;
    }
}
