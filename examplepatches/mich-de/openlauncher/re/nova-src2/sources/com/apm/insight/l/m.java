package com.apm.insight.l;

import android.text.TextUtils;
import b.c0;
import com.apm.insight.l.e;
import com.apm.insight.nativecrash.NativeImpl;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    private static final StackTraceElement f21773a = new StackTraceElement(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0);

    public static class a {

        /* renamed from: a, reason: collision with root package name */
        public int f21774a;

        /* renamed from: b, reason: collision with root package name */
        public int f21775b;

        public a(int i5, int i11) {
            this.f21774a = i5;
            this.f21775b = i11;
        }

        public final JSONObject a() {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("start", this.f21774a);
                jSONObject.put("end", this.f21775b);
            } catch (Throwable unused) {
            }
            return jSONObject;
        }
    }

    public static String a(StackTraceElement[] stackTraceElementArr) {
        StringBuilder sb2 = new StringBuilder();
        for (StackTraceElement stackTraceElement : stackTraceElementArr) {
            a(stackTraceElement, sb2);
        }
        return sb2.toString();
    }

    public static StackTraceElement[] b(Throwable th2) {
        ArrayList arrayList = new ArrayList();
        try {
            a(th2, arrayList);
        } catch (Throwable unused) {
        }
        return (StackTraceElement[]) arrayList.toArray(new StackTraceElement[arrayList.size()]);
    }

    private static boolean c(String str) {
        Set<String> setA = g.a();
        if (setA.contains(str)) {
            return true;
        }
        for (String str2 : setA) {
            if (!TextUtils.isEmpty(str) && str.startsWith(str2)) {
                return true;
            }
        }
        return false;
    }

    public static boolean d(Throwable th2) {
        if (th2 == null) {
            return false;
        }
        int i5 = 0;
        while (th2 != null) {
            try {
                if ((th2 instanceof OutOfMemoryError) && (th2.getMessage().contains("allocate") || th2.getMessage().contains("thrown"))) {
                    return true;
                }
                if (i5 > 20) {
                    return false;
                }
                i5++;
                th2 = th2.getCause();
            } catch (Throwable unused) {
                return true;
            }
        }
        return false;
    }

    public static StringBuilder a(StackTraceElement stackTraceElement, StringBuilder sb2) {
        String className = stackTraceElement.getClassName();
        sb2.append("  at ");
        sb2.append(className);
        sb2.append(".");
        sb2.append(stackTraceElement.getMethodName());
        sb2.append("(");
        sb2.append(stackTraceElement.getFileName());
        sb2.append(":");
        sb2.append(stackTraceElement.getLineNumber());
        sb2.append(")\n");
        return sb2;
    }

    public static JSONObject b(String str) {
        try {
            Map<Thread, StackTraceElement[]> allStackTraces = Thread.getAllStackTraces();
            JSONObject jSONObject = new JSONObject();
            if (allStackTraces == null) {
                return null;
            }
            jSONObject.put("thread_all_count", allStackTraces.size());
            JSONArray jSONArray = new JSONArray();
            for (Map.Entry<Thread, StackTraceElement[]> entry : allStackTraces.entrySet()) {
                JSONObject jSONObject2 = new JSONObject();
                Thread key = entry.getKey();
                String name = key.getName();
                if (!c(name) && (str == null || (!str.equals(name) && !name.startsWith(str) && !name.endsWith(str)))) {
                    jSONObject2.put("thread_name", key.getName() + "(" + key.getId() + ")");
                    StackTraceElement[] value = entry.getValue();
                    if (value != null) {
                        JSONArray jSONArray2 = new JSONArray();
                        for (StackTraceElement stackTraceElement : value) {
                            jSONArray2.put(stackTraceElement.getClassName() + "." + stackTraceElement.getMethodName() + "(" + stackTraceElement.getLineNumber() + ")");
                        }
                        jSONObject2.put("thread_stack", jSONArray2);
                        if (jSONArray2.length() > 0) {
                        }
                    }
                    jSONArray.put(jSONObject2);
                }
            }
            jSONObject.put("thread_stacks", jSONArray);
            return jSONObject;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static boolean c(Throwable th2) {
        if (th2 == null) {
            return false;
        }
        int i5 = 0;
        while (th2 != null) {
            if (th2 instanceof OutOfMemoryError) {
                return true;
            }
            if (i5 > 20) {
                return false;
            }
            i5++;
            try {
                th2 = th2.getCause();
            } catch (Throwable unused) {
            }
        }
        return false;
    }

    public static String a(Throwable th2) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        try {
            a(th2, printWriter);
            String string = stringWriter.toString();
            printWriter.close();
            return string;
        } catch (Throwable unused) {
            printWriter.close();
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public static String a(Throwable th2, PrintStream printStream, e.a aVar) throws IOException {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (Throwable unused) {
            messageDigest = null;
        }
        e eVar = new e(printStream, messageDigest, aVar);
        try {
            a(th2, eVar);
        } catch (Throwable unused2) {
        }
        eVar.close();
        if (messageDigest == null) {
            return null;
        }
        byte[] bArrDigest = messageDigest.digest();
        if (bArrDigest != null && bArrDigest.length > 0) {
            char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
            char[] cArr2 = new char[bArrDigest.length << 1];
            int i5 = 0;
            for (byte b11 : bArrDigest) {
                int i11 = i5 + 1;
                cArr2[i5] = cArr[(b11 >>> 4) & 15];
                i5 += 2;
                cArr2[i11] = cArr[b11 & 15];
            }
            return new String(cArr2);
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String a(String str) {
        BufferedReader bufferedReader = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (!file.exists()) {
            return null;
        }
        LinkedList linkedList = new LinkedList();
        LinkedList linkedList2 = new LinkedList();
        StringBuilder sb2 = new StringBuilder();
        int i5 = 0;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            int i11 = 0;
            while (true) {
                try {
                    String line = bufferedReader2.readLine();
                    if (line == null) {
                        break;
                    }
                    if (i11 <= 256) {
                        linkedList.add(line);
                        sb2.append(line);
                        sb2.append('\n');
                    } else {
                        linkedList2.add(line);
                        if (linkedList2.size() > 256) {
                            linkedList2.poll();
                            i5++;
                        }
                    }
                    i11++;
                } catch (Throwable unused) {
                    bufferedReader = bufferedReader2;
                    com.apm.insight.a.a((Closeable) bufferedReader);
                    if (!linkedList2.isEmpty()) {
                    }
                    return sb2.toString();
                }
            }
            com.apm.insight.a.a((Closeable) bufferedReader2);
        } catch (Throwable unused2) {
        }
        if (!linkedList2.isEmpty()) {
            if (i5 != 0) {
                sb2.append("\t... skip ");
                sb2.append(i5);
                sb2.append(" lines\n");
            }
            Iterator it = linkedList2.iterator();
            while (it.hasNext()) {
                sb2.append((String) it.next());
                sb2.append('\n');
            }
        }
        return sb2.toString();
    }

    private static void b(Throwable th2, int i5) {
        th2.getClass();
        String localizedMessage = th2.getLocalizedMessage();
        try {
            NativeImpl.a(i5, th2.getClass().getName());
            if (localizedMessage != null) {
                NativeImpl.a(i5, ": ");
                NativeImpl.a(i5, localizedMessage);
            }
            NativeImpl.a(i5, "\n");
        } catch (Throwable unused) {
        }
    }

    private static void a(StackTraceElement stackTraceElement, int i5) {
        try {
            NativeImpl.a(i5, "\tat ");
            NativeImpl.a(i5, stackTraceElement.getClassName());
            NativeImpl.a(i5, ".");
            NativeImpl.a(i5, stackTraceElement.getMethodName());
            if (stackTraceElement.isNativeMethod()) {
                NativeImpl.a(i5, "(Native Method)");
            } else if (stackTraceElement.getFileName() != null) {
                if (stackTraceElement.getLineNumber() >= 0) {
                    NativeImpl.a(i5, "(");
                    NativeImpl.a(i5, stackTraceElement.getFileName());
                    NativeImpl.a(i5, ":");
                    NativeImpl.a(i5, String.valueOf(stackTraceElement.getLineNumber()));
                    NativeImpl.a(i5, ")");
                } else {
                    NativeImpl.a(i5, "(");
                    NativeImpl.a(i5, stackTraceElement.getFileName());
                    NativeImpl.a(i5, ")");
                }
            } else if (stackTraceElement.getLineNumber() >= 0) {
                NativeImpl.a(i5, "(Unknown Source:");
                NativeImpl.a(i5, String.valueOf(stackTraceElement.getLineNumber()));
                NativeImpl.a(i5, ")");
            } else {
                NativeImpl.a(i5, "(Unknown Source)");
            }
            NativeImpl.a(i5, "\n");
        } catch (Throwable unused) {
        }
    }

    private static void a(Throwable th2, List<StackTraceElement> list) {
        if (th2 == null) {
            return;
        }
        Set setNewSetFromMap = Collections.newSetFromMap(new IdentityHashMap());
        setNewSetFromMap.add(th2);
        list.add(f21773a);
        com.apm.insight.e.y();
        StackTraceElement[] stackTrace = th2.getStackTrace();
        boolean z11 = stackTrace.length > 384;
        int length = stackTrace.length;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            StackTraceElement stackTraceElement = stackTrace[i5];
            if (z11 && i11 > 256) {
                list.add(f21773a);
                break;
            } else {
                list.add(stackTraceElement);
                i11++;
                i5++;
            }
        }
        if (z11) {
            for (int length2 = stackTrace.length - 128; length2 < stackTrace.length; length2++) {
                list.add(stackTrace[length2]);
            }
        }
        for (Throwable th3 : th2.getSuppressed()) {
            a(th3, list, "\t", setNewSetFromMap, 128);
        }
        Throwable cause = th2.getCause();
        if (cause != null) {
            a(cause, list, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, setNewSetFromMap, 128);
        }
    }

    private static void a(Throwable th2, List<StackTraceElement> list, String str, Set<Throwable> set, int i5) {
        while (!set.contains(th2)) {
            set.add(th2);
            StackTraceElement[] stackTrace = th2.getStackTrace();
            int i11 = 0;
            boolean z11 = stackTrace.length > i5;
            list.add(f21773a);
            com.apm.insight.e.y();
            int length = stackTrace.length;
            int i12 = 0;
            int i13 = 0;
            while (true) {
                if (i12 >= length) {
                    break;
                }
                StackTraceElement stackTraceElement = stackTrace[i12];
                if (z11 && i13 > i5) {
                    list.add(f21773a);
                    break;
                } else {
                    list.add(stackTraceElement);
                    i13++;
                    i12++;
                }
            }
            if (z11) {
                for (int length2 = stackTrace.length - (i5 / 2); length2 < stackTrace.length; length2++) {
                    list.add(stackTrace[length2]);
                }
            }
            Throwable[] suppressed = th2.getSuppressed();
            int length3 = suppressed.length;
            while (true) {
                int i14 = 10;
                if (i11 >= length3) {
                    break;
                }
                Throwable th3 = suppressed[i11];
                String strE = c0.E(str, "\t");
                int i15 = i5 / 2;
                if (i15 > 10) {
                    i14 = i15;
                }
                a(th3, list, strE, set, i14);
                i11++;
            }
            th2 = th2.getCause();
            if (th2 == null) {
                return;
            }
            i5 /= 2;
            if (i5 <= 10) {
                i5 = 10;
            }
        }
        list.add(f21773a);
    }

    private static void a(Throwable th2, PrintWriter printWriter) {
        if (th2 == null) {
            return;
        }
        Set setNewSetFromMap = Collections.newSetFromMap(new IdentityHashMap());
        setNewSetFromMap.add(th2);
        printWriter.println(th2);
        StackTraceElement[] stackTrace = th2.getStackTrace();
        boolean z11 = stackTrace.length > 384;
        int length = stackTrace.length;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            StackTraceElement stackTraceElement = stackTrace[i5];
            if (z11 && i11 > 256) {
                StringBuilder sb2 = new StringBuilder("\t... skip ");
                sb2.append((stackTrace.length - i11) - 128);
                sb2.append(" lines");
                printWriter.println(sb2.toString());
                break;
            }
            printWriter.println("\tat ".concat(String.valueOf(stackTraceElement)));
            i11++;
            i5++;
        }
        if (z11) {
            for (int length2 = stackTrace.length - 128; length2 < stackTrace.length; length2++) {
                printWriter.println("\tat " + stackTrace[length2]);
            }
        }
        for (Throwable th3 : th2.getSuppressed()) {
            a(th3, printWriter, "Suppressed: ", "\t", setNewSetFromMap, 128);
        }
        Throwable cause = th2.getCause();
        if (cause != null) {
            a(cause, printWriter, "Caused by: ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, setNewSetFromMap, 128);
        }
    }

    private static void a(Throwable th2, int i5, String str, String str2) {
        while (true) {
            StackTraceElement[] stackTrace = th2.getStackTrace();
            try {
                NativeImpl.a(i5, str2);
                NativeImpl.a(i5, str);
            } catch (Throwable unused) {
            }
            b(th2, i5);
            for (StackTraceElement stackTraceElement : stackTrace) {
                a(stackTraceElement, i5);
            }
            for (Throwable th3 : th2.getSuppressed()) {
                a(th3, i5, "Suppressed: ", c0.E(str2, "\t"));
            }
            th2 = th2.getCause();
            if (th2 == null) {
                return;
            } else {
                str = "Caused by: ";
            }
        }
    }

    private static void a(Throwable th2, PrintWriter printWriter, String str, String str2, Set<Throwable> set, int i5) {
        while (!set.contains(th2)) {
            set.add(th2);
            StackTraceElement[] stackTrace = th2.getStackTrace();
            boolean z11 = stackTrace.length > i5;
            printWriter.println(str2 + str + th2);
            int length = stackTrace.length;
            int i11 = 0;
            int i12 = 0;
            while (true) {
                if (i11 >= length) {
                    break;
                }
                StackTraceElement stackTraceElement = stackTrace[i11];
                if (z11 && i12 > i5) {
                    printWriter.println("\t... skip " + ((stackTrace.length - i12) - (i5 / 2)) + " lines");
                    break;
                }
                printWriter.println("\tat ".concat(String.valueOf(stackTraceElement)));
                i12++;
                i11++;
            }
            if (z11) {
                for (int length2 = stackTrace.length - (i5 / 2); length2 < stackTrace.length; length2++) {
                    printWriter.println("\tat " + stackTrace[length2]);
                }
            }
            for (Throwable th3 : th2.getSuppressed()) {
                int i13 = i5 / 2;
                a(th3, printWriter, "Suppressed: ", c0.E(str2, "\t"), set, i13 > 10 ? i13 : 10);
            }
            PrintWriter printWriter2 = printWriter;
            Set<Throwable> set2 = set;
            th2 = th2.getCause();
            if (th2 == null) {
                return;
            }
            i5 /= 2;
            if (i5 <= 10) {
                i5 = 10;
            }
            str = "Caused by: ";
            printWriter = printWriter2;
            set = set2;
        }
        printWriter.println("\t[CIRCULAR REFERENCE:" + th2 + "]");
    }

    private static boolean a(String str, String[] strArr) {
        if (strArr != null && !TextUtils.isEmpty(str)) {
            for (String str2 : strArr) {
                if (str.contains(str2)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static JSONArray a(StackTraceElement[] stackTraceElementArr, String[] strArr) {
        a aVar = new a(-1, -1);
        JSONArray jSONArray = new JSONArray();
        for (int i5 = 0; i5 < stackTraceElementArr.length; i5++) {
            if (aVar.f21774a == -1) {
                if (a(stackTraceElementArr[i5].getClassName(), strArr)) {
                    aVar.f21774a = i5;
                    aVar.f21775b = i5;
                }
            } else if (!a(stackTraceElementArr[i5].getClassName(), strArr)) {
                aVar.f21775b = i5;
                jSONArray.put(aVar.a());
                aVar = new a(-1, -1);
            }
        }
        if (aVar.f21774a != -1) {
            aVar.f21775b = stackTraceElementArr.length;
            jSONArray.put(aVar.a());
        }
        return jSONArray;
    }

    public static JSONArray a(String[] strArr, String[] strArr2) {
        a aVar = new a(-1, -1);
        JSONArray jSONArray = new JSONArray();
        for (int i5 = 0; i5 < strArr.length; i5++) {
            if (aVar.f21774a == -1) {
                if (a(strArr[i5], strArr2)) {
                    aVar.f21774a = i5;
                    aVar.f21775b = i5;
                }
            } else if (!a(strArr[i5], strArr2)) {
                aVar.f21775b = i5;
                jSONArray.put(aVar.a());
                aVar = new a(-1, -1);
            }
        }
        if (aVar.f21774a != -1) {
            aVar.f21775b = strArr.length;
            jSONArray.put(aVar.a());
        }
        return jSONArray;
    }

    public static void a(Throwable th2, int i5) {
        if (th2 == null || i5 <= 0) {
            return;
        }
        try {
            b(th2, i5);
            for (StackTraceElement stackTraceElement : th2.getStackTrace()) {
                a(stackTraceElement, i5);
            }
            for (Throwable th3 : th2.getSuppressed()) {
                a(th3, i5, "Suppressed: ", "\t");
            }
            Throwable cause = th2.getCause();
            if (cause != null) {
                a(cause, i5, "Caused by: ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
        } catch (Throwable unused) {
        }
    }
}
