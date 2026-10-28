#!/usr/bin/env python3
"""Production IRC/provider scheduling with controlled network and clock boundaries (no APK)."""
import sys
from pathlib import Path
sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
from host_java import run, STUBS

PLATFORM = {
    'android/graphics/Bitmap.java': '''package android.graphics; public class Bitmap {
      public enum Config {ARGB_8888} public enum CompressFormat {PNG}
      public static Bitmap createBitmap(int w,int h,Config c){throw new AssertionError("unexpected image rendering");}
      public int getWidth(){return 20;} public int getHeight(){return 20;} public void recycle(){}
      public boolean compress(CompressFormat f,int q,java.io.OutputStream o){return true;} }''',
    'android/graphics/BitmapFactory.java': '''package android.graphics; public class BitmapFactory {
      public static Bitmap decodeByteArray(byte[] b,int o,int n){throw new AssertionError("unexpected image decoding");} }''',
    'android/graphics/Canvas.java': '''package android.graphics; public class Canvas {
      public Canvas(Bitmap b){} public void drawRoundRect(float a,float b,float c,float d,float e,float f,Paint p){}
      public void drawBitmap(Bitmap b,float x,float y,Paint p){} public void drawText(String s,float x,float y,Paint p){}
      public void drawColor(int c){} }''',
    'android/graphics/Paint.java': '''package android.graphics; public class Paint {
      public static final int ANTI_ALIAS_FLAG=1,SUBPIXEL_TEXT_FLAG=2;
      public Paint(int f){} public void setColor(int c){} public void setTypeface(Typeface t){} public void setTextSize(float s){}
      public float measureText(String s){return s.length()*20;} public FontMetrics getFontMetrics(){return new FontMetrics();}
      public static class FontMetrics {public float ascent=-30,descent=5;} }''',
    'android/graphics/Typeface.java': '''package android.graphics; public class Typeface {public static final Typeface DEFAULT_BOLD=new Typeface();}''',
    'android/graphics/Color.java': '''package android.graphics; public class Color {
      public static final int WHITE=-1;public static int parseColor(String s){return Integer.parseInt(s.substring(1),16);} }''',
    'android/util/Base64.java': '''package android.util; public class Base64 {
      public static final int NO_WRAP=2; public static String encodeToString(byte[] b,int f){return java.util.Base64.getEncoder().encodeToString(b);} }''',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;
      public class Drawable {public android.graphics.Rect getBounds(){return new android.graphics.Rect(0,0,20,20);}
      public void setBounds(int a,int b,int c,int d){} }''',
    'android/util/JsonToken.java': '''package android.util;
      public enum JsonToken {STRING,NUMBER,BOOLEAN,BEGIN_OBJECT,BEGIN_ARRAY,NULL,END_OBJECT,END_ARRAY,END_DOCUMENT,NAME}''',
    'android/util/JsonReader.java': '''package android.util;
      public class JsonReader implements AutoCloseable {
      public JsonReader(java.io.Reader r){throw new AssertionError("unexpected network body");}
      public void setLenient(boolean b){} public JsonToken peek(){throw new AssertionError();}
      public String nextString(){throw new AssertionError();} public String nextName(){throw new AssertionError();}
      public boolean nextBoolean(){throw new AssertionError();} public long nextLong(){throw new AssertionError();}
      public void skipValue(){} public void beginObject(){} public void endObject(){}
      public void beginArray(){} public void endArray(){} public boolean hasNext(){return false;} public void close(){} }''',
    'android/os/SystemClock.java': '''package android.os; public class SystemClock {
      public static long elapsedRealtime(){return java.lang.System.nanoTime()/1000000;}}''',
}

if __name__ == '__main__':
    run('TwitchProvidersProbe', ['twitch/TwitchEmotes.java', 'twitch/TwitchThirdParty.java',
        'twitch/TwitchBadges.java', 'twitch/TwitchPronouns.java'],
        Path(__file__).with_name('TwitchProvidersProbe.java').read_text(),
        sys.argv[1:] or ['unicode', 'multiline', 'queued-disable', 'badges-disable', 'pronouns-disable', 'rn-dispose', 'rn-native-demand', 'rn-badges-dispose',
            'rn-pronouns-dispose', 'rn-frame-passive', 'rn-passive', 'cache-bound', 'demand-reacquire', 'queue-rejection',
            'describe'], extra=PLATFORM)

    # Completion ordering uses tokenized HTTP bodies and a drawing boundary; cache/scheduling code is production.
    completion=dict(PLATFORM)
    completion['android/util/JsonReader.java']='''package android.util;
    public class JsonReader implements AutoCloseable {
     String[] tokens;int at;
     public JsonReader(java.io.Reader r)throws java.io.IOException {
     int c=r.read(); tokens=(c=='U'?"BEGIN_OBJECT,NAME,pronoun_id,STRING,hehim,END_OBJECT":"BEGIN_OBJECT,NAME,hehim,BEGIN_OBJECT,NAME,subject,STRING,He,NAME,object,STRING,Him,END_OBJECT,END_OBJECT").split(",");
     }
     public void setLenient(boolean b){} public JsonToken peek(){return at<tokens.length?JsonToken.valueOf(tokens[at]):JsonToken.END_DOCUMENT;}
     public String nextString(){at++;return tokens[at++];} public String nextName(){at++;return tokens[at++];}
     public boolean nextBoolean(){throw new AssertionError();} public long nextLong(){throw new AssertionError();}
     public void skipValue(){throw new AssertionError();} public void beginObject(){at++;} public void endObject(){at++;}
     public void beginArray(){throw new AssertionError();} public void endArray(){throw new AssertionError();}
     public boolean hasNext(){return peek()!=JsonToken.END_OBJECT;} public void close(){} }
    '''
    completion['android/graphics/Bitmap.java']=completion['android/graphics/Bitmap.java'].replace('throw new AssertionError("unexpected image rendering");','return new Bitmap();')
    run('PronounCompletionProbe', ['twitch/TwitchEmotes.java', 'twitch/TwitchThirdParty.java',
        'twitch/TwitchBadges.java', 'twitch/TwitchPronouns.java'],
        Path(__file__).with_name('PronounCompletionProbe.java').read_text(),
        ['user-live','names-live','user-retired','names-retired','user-off','names-off','user-native'],extra=completion)
