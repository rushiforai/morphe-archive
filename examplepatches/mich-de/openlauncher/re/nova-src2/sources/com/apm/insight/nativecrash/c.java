package com.apm.insight.nativecrash;

import com.apm.insight.l.j;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: i, reason: collision with root package name */
    private static final Pattern f21806i = Pattern.compile("^pid:\\s(.*),\\stid:\\s(.*),\\sname:\\s(.*)\\s+>>>\\s(.*)\\s<<<$");

    /* renamed from: j, reason: collision with root package name */
    private static final Pattern f21807j = Pattern.compile("^signal\\s(.*),\\scode\\s(.*),\\sfault\\saddr\\s(.*)$");

    /* renamed from: k, reason: collision with root package name */
    private static final Pattern f21808k = Pattern.compile("^Abort message: (.*)$");

    /* renamed from: l, reason: collision with root package name */
    private static final Pattern f21809l = Pattern.compile("^Crash message: (.*)$");

    /* renamed from: m, reason: collision with root package name */
    private static final Pattern f21810m = Pattern.compile("^    \\/(\\w*)\\/.*\\/(.*\\.so)\\s\\(BuildId: ([a-f0-9]*)\\)$");

    /* renamed from: a, reason: collision with root package name */
    private String f21811a;

    /* renamed from: b, reason: collision with root package name */
    private String f21812b;

    /* renamed from: c, reason: collision with root package name */
    private String f21813c;

    /* renamed from: d, reason: collision with root package name */
    private String f21814d;

    /* renamed from: e, reason: collision with root package name */
    private String f21815e;

    /* renamed from: f, reason: collision with root package name */
    private String f21816f;

    /* renamed from: g, reason: collision with root package name */
    private String f21817g;

    /* renamed from: h, reason: collision with root package name */
    private Map<String, String> f21818h = new HashMap();

    public c(File file) {
        c(j.b(file));
    }

    public final String a() {
        return this.f21817g;
    }

    public final Map<String, String> b() {
        return this.f21818h;
    }

    public final String c() {
        StringBuilder sb2 = new StringBuilder();
        String str = this.f21815e;
        if (str != null) {
            sb2.append(str);
        }
        String str2 = this.f21816f;
        if (str2 != null) {
            sb2.append(str2);
        }
        String str3 = this.f21817g;
        if (str3 != null) {
            sb2.append(str3);
        }
        return sb2.toString();
    }

    public final void a(File file) {
        File fileB = j.b(file);
        if (fileB.exists()) {
            fileB.renameTo(new File(fileB.getAbsoluteFile() + ".old"));
        }
        NativeImpl.a(file);
        c(j.b(file));
    }

    public final void b(File file) {
        c(j.b(file));
    }

    /* JADX WARN: Code restructure failed: missing block: B:71:0x018a, code lost:
    
        r12 = r3.readLine();
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x018e, code lost:
    
        if (r12 == null) goto L118;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0196, code lost:
    
        if (r12.contains("BuildId:") == false) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0198, code lost:
    
        r12 = com.apm.insight.nativecrash.c.f21810m.matcher(r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x01a2, code lost:
    
        if (r12.find() == false) goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x01a4, code lost:
    
        r0 = r12.group(1);
        r1 = r12.group(2);
        r12 = r12.group(3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x01b6, code lost:
    
        if (r0.equals("data") == false) goto L124;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01b8, code lost:
    
        r11.f21818h.put(r1, r12);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void c(File file) {
        if (!file.exists() || file.length() == 0) {
            return;
        }
        BufferedReader bufferedReader = null;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            int i5 = 0;
            while (true) {
                try {
                    String line = bufferedReader2.readLine();
                    if (line == null || i5 >= 64) {
                        break;
                    }
                    if (this.f21811a == null && line.startsWith("pid: ")) {
                        Matcher matcher = f21806i.matcher(line);
                        if (matcher.find() && matcher.groupCount() == 4) {
                            this.f21811a = matcher.group(1);
                            this.f21812b = matcher.group(2);
                            this.f21814d = matcher.group(3);
                            this.f21813c = matcher.group(4);
                        }
                    } else if (this.f21815e == null && line.startsWith("signal ")) {
                        Matcher matcher2 = f21807j.matcher(line);
                        if (matcher2.find() && matcher2.groupCount() == 3) {
                            String strReplace = matcher2.group(1).replace(" ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                            String strReplace2 = matcher2.group(2).replace(" ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                            int iIndexOf = strReplace2.indexOf("frompid");
                            if (iIndexOf > 0) {
                                strReplace2 = strReplace2.substring(0, iIndexOf) + ")";
                            }
                            this.f21815e = "Signal " + strReplace + ", Code " + strReplace2 + "\n";
                        }
                    } else if (this.f21816f == null && line.startsWith("Abort ")) {
                        Matcher matcher3 = f21808k.matcher(line);
                        if (matcher3.find() && matcher3.groupCount() == 1) {
                            this.f21816f = "abort message: " + matcher3.group(1) + "\n";
                        }
                    } else if (this.f21816f == null && line.startsWith("Crash ")) {
                        Matcher matcher4 = f21809l.matcher(line);
                        if (matcher4.find() && matcher4.groupCount() == 1) {
                            this.f21816f = "crash message: " + matcher4.group(1) + "\n";
                        }
                    } else if (this.f21817g == null && line.startsWith("backtrace:")) {
                        StringBuilder sb2 = new StringBuilder();
                        while (true) {
                            String line2 = bufferedReader2.readLine();
                            if (line2 == null || !line2.startsWith("    #")) {
                                break;
                            }
                            sb2.append(line2.substring(4));
                            sb2.append('\n');
                        }
                        i5++;
                        this.f21817g = sb2.toString();
                    } else if (this.f21818h.isEmpty() && line.startsWith("build id:")) {
                        break;
                    }
                    i5++;
                } catch (Throwable th2) {
                    th = th2;
                    bufferedReader = bufferedReader2;
                    try {
                        com.apm.insight.c.a();
                        com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                        return;
                    } finally {
                        com.apm.insight.a.a((Closeable) bufferedReader);
                    }
                }
            }
            com.apm.insight.a.a((Closeable) bufferedReader2);
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
