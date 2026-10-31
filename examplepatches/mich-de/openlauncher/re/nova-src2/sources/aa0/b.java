package aa0;

import b.u4;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final HashMap f670a;

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f671b;

    static {
        HashMap map = new HashMap();
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(b.class.getResourceAsStream("/org/commonmark/internal/util/entities.properties"), Charset.forName("UTF-8")));
            while (true) {
                try {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        bufferedReader.close();
                        map.put("NewLine", "\n");
                        f670a = map;
                        f671b = Pattern.compile("^&#[Xx]?");
                        return;
                    }
                    if (line.length() != 0) {
                        int iIndexOf = line.indexOf("=");
                        map.put(line.substring(0, iIndexOf), line.substring(iIndexOf + 1));
                    }
                } finally {
                }
            }
        } catch (IOException e3) {
            throw new IllegalStateException("Failed reading data for HTML named character references", e3);
        }
    }

    public static String a(String str) throws NumberFormatException {
        Matcher matcher = f671b.matcher(str);
        if (!matcher.find()) {
            String str2 = (String) f670a.get(u4.f(1, 1, str));
            return str2 != null ? str2 : str;
        }
        try {
            int i5 = Integer.parseInt(str.substring(matcher.end(), str.length() - 1), matcher.end() == 2 ? 10 : 16);
            return i5 == 0 ? "�" : new String(Character.toChars(i5));
        } catch (IllegalArgumentException unused) {
            return "�";
        }
    }
}
