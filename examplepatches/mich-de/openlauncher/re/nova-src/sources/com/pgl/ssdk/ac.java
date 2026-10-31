package com.pgl.ssdk;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.util.HashMap;
import java.util.regex.Pattern;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class ac {

    /* renamed from: a, reason: collision with root package name */
    private static final FileFilter f42259a = new a();

    public static class a implements FileFilter {
        @Override // java.io.FileFilter
        public boolean accept(File file) {
            return Pattern.matches("cpu[0-9]", file.getName());
        }
    }

    private static int a() {
        try {
            return new File("/sys/devices/system/cpu/").listFiles(f42259a).length;
        } catch (Throwable unused) {
            return -1;
        }
    }

    private static HashMap<String, String> b() {
        FileReader fileReader;
        HashMap<String, String> map = new HashMap<>();
        BufferedReader bufferedReader = null;
        try {
            fileReader = new FileReader("/proc/cpuinfo");
            try {
                BufferedReader bufferedReader2 = new BufferedReader(fileReader);
                while (true) {
                    try {
                        String line = bufferedReader2.readLine();
                        if (line == null) {
                            try {
                                break;
                            } catch (Throwable unused) {
                            }
                        } else {
                            String[] strArrSplit = line.split(":", 2);
                            if (strArrSplit.length >= 2) {
                                String strTrim = strArrSplit[0].trim();
                                String strTrim2 = strArrSplit[1].trim();
                                if (map.get(strTrim) == null) {
                                    map.put(strTrim, strTrim2);
                                }
                            }
                        }
                    } catch (Throwable unused2) {
                        bufferedReader = bufferedReader2;
                        if (bufferedReader != null) {
                            try {
                                bufferedReader.close();
                            } catch (Throwable unused3) {
                            }
                        }
                        if (fileReader != null) {
                            fileReader.close();
                        }
                        return map;
                    }
                }
                bufferedReader2.close();
            } catch (Throwable unused4) {
            }
        } catch (Throwable unused5) {
            fileReader = null;
        }
        try {
            fileReader.close();
        } catch (Throwable unused6) {
        }
        return map;
    }

    public static String c() {
        JSONObject jSONObject = new JSONObject();
        try {
            HashMap<String, String> mapB = b();
            jSONObject.put("core", a());
            jSONObject.put("hw", a(mapB, "Hardware"));
            jSONObject.put(InneractiveMediationNameConsts.MAX, a("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"));
            jSONObject.put("min", a("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq"));
            jSONObject.put("ft", a(mapB, "Features"));
        } catch (Throwable unused) {
        }
        String string = jSONObject.toString();
        return string == null ? "{}" : string.trim();
    }

    /* JADX WARN: Can't wrap try/catch for region: R(7:0|2|(4:28|3|26|4)|(3:30|5|(2:34|6))|24|14|(1:16)(2:18|19)) */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0024 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0027  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String a(String str) {
        BufferedReader bufferedReader;
        FileReader fileReader;
        String line = null;
        try {
            fileReader = new FileReader(str);
            try {
                bufferedReader = new BufferedReader(fileReader);
            } catch (Throwable unused) {
                bufferedReader = null;
            }
        } catch (Throwable unused2) {
            bufferedReader = null;
            fileReader = null;
        }
        try {
            line = bufferedReader.readLine();
            try {
                bufferedReader.close();
            } catch (Throwable unused3) {
            }
        } catch (Throwable unused4) {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (Throwable unused5) {
                }
            }
            if (fileReader != null) {
                fileReader.close();
            }
            if (line != null) {
            }
        }
        fileReader.close();
        return line != null ? "0" : line.trim();
    }

    private static String a(HashMap<String, String> map, String str) {
        String str2;
        try {
            str2 = map.get(str);
        } catch (Throwable unused) {
            str2 = null;
        }
        return str2 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2.trim();
    }
}
