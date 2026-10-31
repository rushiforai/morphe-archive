package wf;

import android.graphics.Color;
import android.text.TextUtils;
import h6.c1;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import vk.b0;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f94311a = Pattern.compile("^rgb\\((\\d{1,3}),(\\d{1,3}),(\\d{1,3})\\)$");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f94312b = Pattern.compile("^rgba\\((\\d{1,3}),(\\d{1,3}),(\\d{1,3}),(\\d{1,3})\\)$");

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f94313c = Pattern.compile("^rgba\\((\\d{1,3}),(\\d{1,3}),(\\d{1,3}),(\\d*\\.?\\d*?)\\)$");

    /* renamed from: d, reason: collision with root package name */
    public static final HashMap f94314d;

    static {
        HashMap map = new HashMap();
        f94314d = map;
        c1.x(-984833, map, "aliceblue", -332841, "antiquewhite");
        map.put("aqua", -16711681);
        map.put("aquamarine", -8388652);
        c1.x(-983041, map, "azure", -657956, "beige");
        c1.x(-6972, map, "bisque", -16777216, "black");
        c1.x(-5171, map, "blanchedalmond", -16776961, "blue");
        c1.x(-7722014, map, "blueviolet", -5952982, "brown");
        c1.x(-2180985, map, "burlywood", -10510688, "cadetblue");
        c1.x(-8388864, map, "chartreuse", -2987746, "chocolate");
        c1.x(-32944, map, "coral", -10185235, "cornflowerblue");
        c1.x(-1828, map, "cornsilk", -2354116, "crimson");
        map.put("cyan", -16711681);
        map.put("darkblue", -16777077);
        c1.x(-16741493, map, "darkcyan", -4684277, "darkgoldenrod");
        map.put("darkgray", -5658199);
        map.put("darkgreen", -16751616);
        map.put("darkgrey", -5658199);
        map.put("darkkhaki", -4343957);
        c1.x(-7667573, map, "darkmagenta", -11179217, "darkolivegreen");
        c1.x(-29696, map, "darkorange", -6737204, "darkorchid");
        c1.x(-7667712, map, "darkred", -1468806, "darksalmon");
        c1.x(-7357297, map, "darkseagreen", -12042869, "darkslateblue");
        map.put("darkslategray", -13676721);
        map.put("darkslategrey", -13676721);
        map.put("darkturquoise", -16724271);
        map.put("darkviolet", -7077677);
        c1.x(-60269, map, "deeppink", -16728065, "deepskyblue");
        map.put("dimgray", -9868951);
        map.put("dimgrey", -9868951);
        map.put("dodgerblue", -14774017);
        map.put("firebrick", -5103070);
        c1.x(-1296, map, "floralwhite", -14513374, "forestgreen");
        map.put("fuchsia", -65281);
        map.put("gainsboro", -2302756);
        c1.x(-460545, map, "ghostwhite", -10496, "gold");
        map.put("goldenrod", -2448096);
        map.put("gray", -8355712);
        c1.x(-16744448, map, "green", -5374161, "greenyellow");
        map.put("grey", -8355712);
        map.put("honeydew", -983056);
        c1.x(-38476, map, "hotpink", -3318692, "indianred");
        c1.x(-11861886, map, "indigo", -16, "ivory");
        c1.x(-989556, map, "khaki", -1644806, "lavender");
        c1.x(-3851, map, "lavenderblush", -8586240, "lawngreen");
        c1.x(-1331, map, "lemonchiffon", -5383962, "lightblue");
        c1.x(-1015680, map, "lightcoral", -2031617, "lightcyan");
        map.put("lightgoldenrodyellow", -329006);
        map.put("lightgray", -2894893);
        map.put("lightgreen", -7278960);
        map.put("lightgrey", -2894893);
        c1.x(-18751, map, "lightpink", -24454, "lightsalmon");
        c1.x(-14634326, map, "lightseagreen", -7876870, "lightskyblue");
        map.put("lightslategray", -8943463);
        map.put("lightslategrey", -8943463);
        map.put("lightsteelblue", -5192482);
        map.put("lightyellow", -32);
        c1.x(-16711936, map, "lime", -13447886, "limegreen");
        map.put("linen", -331546);
        map.put("magenta", -65281);
        c1.x(-8388608, map, "maroon", -10039894, "mediumaquamarine");
        c1.x(-16777011, map, "mediumblue", -4565549, "mediumorchid");
        c1.x(-7114533, map, "mediumpurple", -12799119, "mediumseagreen");
        c1.x(-8689426, map, "mediumslateblue", -16713062, "mediumspringgreen");
        c1.x(-12004916, map, "mediumturquoise", -3730043, "mediumvioletred");
        c1.x(-15132304, map, "midnightblue", -655366, "mintcream");
        c1.x(-6943, map, "mistyrose", -6987, "moccasin");
        c1.x(-8531, map, "navajowhite", -16777088, "navy");
        c1.x(-133658, map, "oldlace", -8355840, "olive");
        c1.x(-9728477, map, "olivedrab", -23296, "orange");
        c1.x(-47872, map, "orangered", -2461482, "orchid");
        c1.x(-1120086, map, "palegoldenrod", -6751336, "palegreen");
        c1.x(-5247250, map, "paleturquoise", -2396013, "palevioletred");
        c1.x(-4139, map, "papayawhip", -9543, "peachpuff");
        c1.x(-3308225, map, "peru", -16181, "pink");
        c1.x(-2252579, map, "plum", -5185306, "powderblue");
        c1.x(-8388480, map, "purple", -10079335, "rebeccapurple");
        c1.x(-65536, map, "red", -4419697, "rosybrown");
        c1.x(-12490271, map, "royalblue", -7650029, "saddlebrown");
        c1.x(-360334, map, "salmon", -744352, "sandybrown");
        c1.x(-13726889, map, "seagreen", -2578, "seashell");
        c1.x(-6270419, map, "sienna", -4144960, "silver");
        c1.x(-7876885, map, "skyblue", -9807155, "slateblue");
        map.put("slategray", -9404272);
        map.put("slategrey", -9404272);
        map.put("snow", -1286);
        map.put("springgreen", -16711809);
        c1.x(-12156236, map, "steelblue", -2968436, "tan");
        c1.x(-16744320, map, "teal", -2572328, "thistle");
        c1.x(-40121, map, "tomato", 0, "transparent");
        c1.x(-12525360, map, "turquoise", -1146130, "violet");
        c1.x(-663885, map, "wheat", -1, "white");
        c1.x(-657931, map, "whitesmoke", -256, "yellow");
        map.put("yellowgreen", -6632142);
    }

    public static int a(String str, boolean z11) throws NumberFormatException {
        int i5;
        a.e(!TextUtils.isEmpty(str));
        String strReplace = str.replace(" ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        if (strReplace.charAt(0) == '#') {
            int i11 = (int) Long.parseLong(strReplace.substring(1), 16);
            if (strReplace.length() == 7) {
                return (-16777216) | i11;
            }
            if (strReplace.length() == 9) {
                return ((i11 & 255) << 24) | (i11 >>> 8);
            }
            throw new IllegalArgumentException();
        }
        if (strReplace.startsWith("rgba")) {
            Matcher matcher = (z11 ? f94313c : f94312b).matcher(strReplace);
            if (matcher.matches()) {
                if (z11) {
                    String strGroup = matcher.group(4);
                    strGroup.getClass();
                    i5 = (int) (Float.parseFloat(strGroup) * 255.0f);
                } else {
                    String strGroup2 = matcher.group(4);
                    strGroup2.getClass();
                    i5 = Integer.parseInt(strGroup2, 10);
                }
                String strGroup3 = matcher.group(1);
                strGroup3.getClass();
                int i12 = Integer.parseInt(strGroup3, 10);
                String strGroup4 = matcher.group(2);
                strGroup4.getClass();
                int i13 = Integer.parseInt(strGroup4, 10);
                String strGroup5 = matcher.group(3);
                strGroup5.getClass();
                return Color.argb(i5, i12, i13, Integer.parseInt(strGroup5, 10));
            }
        } else if (strReplace.startsWith("rgb")) {
            Matcher matcher2 = f94311a.matcher(strReplace);
            if (matcher2.matches()) {
                String strGroup6 = matcher2.group(1);
                strGroup6.getClass();
                int i14 = Integer.parseInt(strGroup6, 10);
                String strGroup7 = matcher2.group(2);
                strGroup7.getClass();
                int i15 = Integer.parseInt(strGroup7, 10);
                String strGroup8 = matcher2.group(3);
                strGroup8.getClass();
                return Color.rgb(i14, i15, Integer.parseInt(strGroup8, 10));
            }
        } else {
            Integer num = (Integer) f94314d.get(b0.s(strReplace));
            if (num != null) {
                return num.intValue();
            }
        }
        throw new IllegalArgumentException();
    }
}
