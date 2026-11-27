package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import java.nio.charset.Charset;

/** Only bridge-generated documents; no change to the stock Flutter theme. */
final class BridgePalette {
    static final String KEY="flutter.futatabi.bridgePalette";
    static final String DARK="dark", LIGHT="light";
    private static SharedPreferences prefs(Context c){
        return c.getSharedPreferences("FlutterSharedPreferences",Context.MODE_PRIVATE);
    }
    static String get(Context c){
        return LIGHT.equals(prefs(c).getString(KEY,DARK))?LIGHT:DARK;
    }
    static boolean save(Context c,String choice){
        if(!DARK.equals(choice)&&!LIGHT.equals(choice))return false;
        return prefs(c).edit().putString(KEY,choice).commit();
    }
    static String style(String choice){
        return "<style>body{background:"+ (LIGHT.equals(choice)?"#fafafa;color:#222":"#202124;color:#e8eaed")
                +"}a{color:"+(LIGHT.equals(choice)?"#315d9c":"#a8c7fa")+"}.meta{color:"
                +(LIGHT.equals(choice)?"#555":"#b4b8bf")+"}article{border-color:"
                +(LIGHT.equals(choice)?"#bbb":"#444")+"}</style>";
    }
    static String decorate(String html,String choice){
        return html.replace("</head>",style(choice)+"</head>");
    }
    static byte[] decorate(Context c,byte[] html){
        Charset sjis=Charset.forName("Shift_JIS");
        return decorate(new String(html,sjis),get(c)).getBytes(sjis);
    }
}
