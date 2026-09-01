package com.drew.lang;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class StringUtil {
    public static int compare(String str, String str2) {
        boolean z = str == null;
        boolean z2 = str2 == null;
        if (z && z2) {
            return 0;
        }
        if (z) {
            return -1;
        }
        if (z2) {
            return 1;
        }
        return str.compareTo(str2);
    }

    public static String fromStream(InputStream inputStream) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        StringBuilder sb = new StringBuilder();
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                return sb.toString();
            }
            sb.append(line);
        }
    }

    public static String join(Iterable<? extends CharSequence> iterable, String str) {
        int length = str.length();
        Iterator<? extends CharSequence> it2 = iterable.iterator();
        StringBuilder sb = new StringBuilder(it2.hasNext() ? it2.next().length() + length : 0);
        Iterator<? extends CharSequence> it3 = iterable.iterator();
        if (it3.hasNext()) {
            sb.append(it3.next());
            while (it3.hasNext()) {
                sb.append(str);
                sb.append(it3.next());
            }
        }
        return sb.toString();
    }

    public static String urlEncode(String str) {
        return str.replace(" ", "%20");
    }

    public static <T extends CharSequence> String join(T[] tArr, String str) {
        int length = str.length();
        int length2 = 0;
        for (T t : tArr) {
            length2 += t.length() + length;
        }
        StringBuilder sb = new StringBuilder(length2);
        boolean z = true;
        for (T t2 : tArr) {
            if (z) {
                z = false;
            } else {
                sb.append(str);
            }
            sb.append((CharSequence) t2);
        }
        return sb.toString();
    }
}
