#!/usr/bin/env python3
"""Production IRC/provider scheduling with controlled network and clock boundaries (no APK)."""
import sys
from pathlib import Path
sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
from host_java import run, STUBS
from json_double import JSON_DOUBLE

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

# Emote loading (TwitchEmoteLoadingProbe) reads whole provider bodies: a small JsonReader that tokenizes them the
# way Android's does (names, strings, numbers, booleans, null), and a clock the probe moves forward.
LOADING = dict(PLATFORM)
LOADING['android/util/JsonReader.java'] = r'''package android.util;
public class JsonReader implements AutoCloseable {
  private final java.util.List<Object[]> tokens = new java.util.ArrayList<>(); private int at;
  public JsonReader(java.io.Reader in) throws java.io.IOException {
    StringBuilder text = new StringBuilder(); char[] buffer = new char[4096]; int n;
    while ((n = in.read(buffer)) > 0) text.append(buffer, 0, n);
    String s = text.toString(); int i = 0;
    while (i < s.length()) {
      char c = s.charAt(i);
      if (c == '{') { tokens.add(new Object[]{JsonToken.BEGIN_OBJECT}); i++; }
      else if (c == '}') { tokens.add(new Object[]{JsonToken.END_OBJECT}); i++; }
      else if (c == '[') { tokens.add(new Object[]{JsonToken.BEGIN_ARRAY}); i++; }
      else if (c == ']') { tokens.add(new Object[]{JsonToken.END_ARRAY}); i++; }
      else if (c == ',' || c == ':' || Character.isWhitespace(c)) i++;
      else if (c == '"') {
        StringBuilder value = new StringBuilder(); i++;
        while (s.charAt(i) != '"') {
          char d = s.charAt(i++);
          if (d == '\\') {
            char e = s.charAt(i++);
            if (e == 'u') { value.append((char) Integer.parseInt(s.substring(i, i + 4), 16)); i += 4; }
            else value.append(e == 'n' ? '\n' : e == 't' ? '\t' : e == 'r' ? '\r' : e == 'b' ? '\b' : e == 'f' ? '\f' : e);
          } else value.append(d);
        }
        i++;
        int j = i; while (j < s.length() && Character.isWhitespace(s.charAt(j))) j++;
        tokens.add(new Object[]{j < s.length() && s.charAt(j) == ':' ? JsonToken.NAME : JsonToken.STRING, value.toString()});
      } else {
        int j = i; while (j < s.length() && ",:]} \n\r\t".indexOf(s.charAt(j)) < 0) j++;
        String word = s.substring(i, j); i = j;
        if (word.equals("true") || word.equals("false")) tokens.add(new Object[]{JsonToken.BOOLEAN, word});
        else if (word.equals("null")) tokens.add(new Object[]{JsonToken.NULL});
        else if (word.matches("-?[0-9.eE+-]+")) tokens.add(new Object[]{JsonToken.NUMBER, word});
        else throw new java.io.IOException("malformed JSON at " + word);
      }
    }
  }
  public void setLenient(boolean lenient) {}
  public JsonToken peek() { return at < tokens.size() ? (JsonToken) tokens.get(at)[0] : JsonToken.END_DOCUMENT; }
  private Object[] next(JsonToken... expected) throws java.io.IOException {
    JsonToken token = peek();
    for (JsonToken e : expected) if (e == token) return tokens.get(at++);
    throw new IllegalStateException("expected " + java.util.Arrays.toString(expected) + " but was " + token);
  }
  public void beginObject() throws java.io.IOException { next(JsonToken.BEGIN_OBJECT); }
  public void endObject() throws java.io.IOException { next(JsonToken.END_OBJECT); }
  public void beginArray() throws java.io.IOException { next(JsonToken.BEGIN_ARRAY); }
  public void endArray() throws java.io.IOException { next(JsonToken.END_ARRAY); }
  public boolean hasNext() { JsonToken t = peek(); return t != JsonToken.END_OBJECT && t != JsonToken.END_ARRAY && t != JsonToken.END_DOCUMENT; }
  public String nextName() throws java.io.IOException { return (String) next(JsonToken.NAME)[1]; }
  public String nextString() throws java.io.IOException { return (String) next(JsonToken.STRING, JsonToken.NUMBER)[1]; }
  public boolean nextBoolean() throws java.io.IOException { return Boolean.parseBoolean((String) next(JsonToken.BOOLEAN)[1]); }
  public long nextLong() throws java.io.IOException { return Long.parseLong((String) next(JsonToken.NUMBER)[1]); }
  public void nextNull() throws java.io.IOException { next(JsonToken.NULL); }
  public void skipValue() throws java.io.IOException {
    int depth = 0;
    do {
      JsonToken t = peek(); at++;
      if (t == JsonToken.BEGIN_OBJECT || t == JsonToken.BEGIN_ARRAY) depth++;
      else if (t == JsonToken.END_OBJECT || t == JsonToken.END_ARRAY) depth--;
    } while (depth > 0);
  }
  public void close() {} }'''
LOADING['android/os/SystemClock.java'] = '''package android.os; public class SystemClock {
  public static volatile long offset;
  public static long elapsedRealtime(){return java.lang.System.nanoTime()/1000000+offset;}}'''

if __name__ == '__main__':
    run('TwitchProvidersProbe', ['twitch/TwitchEmotes.java', 'twitch/TwitchThirdParty.java', 'twitch/TwitchImageCache.java', 'twitch/TwitchContext.java', 'twitch/TwitchEmoteFavorites.java',
        'twitch/TwitchBadges.java', 'twitch/TwitchPronouns.java', 'twitch/TwitchSevenTvBadges.java'],
        Path(__file__).with_name('TwitchProvidersProbe.java').read_text(),
        sys.argv[1:] or ['unicode', 'multiline', 'queued-disable', 'badges-disable', 'pronouns-disable', 'rn-dispose', 'rn-native-demand', 'rn-badges-dispose',
            'rn-pronouns-dispose', 'rn-frame-passive', 'rn-passive', 'cache-bound', 'demand-reacquire', 'queue-rejection',
            'describe'], extra=PLATFORM | JSON_DOUBLE)

    # Issues 97 and 100: FrankerFaceZ's fallback to BetterTTV's copy, services loading independently of each
    # other and of the shared pool, retries after a failure, and cancelled loads stored as nothing.
    run('TwitchEmoteLoadingProbe', ['twitch/TwitchEmotes.java', 'twitch/TwitchThirdParty.java', 'twitch/TwitchImageCache.java', 'twitch/TwitchContext.java', 'twitch/TwitchEmoteFavorites.java',
        'twitch/TwitchBadges.java', 'twitch/TwitchPronouns.java', 'twitch/TwitchSevenTvBadges.java'],
        Path(__file__).with_name('TwitchEmoteLoadingProbe.java').read_text(),
        ['ffz-fallback', 'independent', 'retry', 'cancelled'], extra=LOADING | JSON_DOUBLE)

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
    run('PronounCompletionProbe', ['twitch/TwitchEmotes.java', 'twitch/TwitchThirdParty.java', 'twitch/TwitchImageCache.java', 'twitch/TwitchContext.java', 'twitch/TwitchEmoteFavorites.java',
        'twitch/TwitchBadges.java', 'twitch/TwitchPronouns.java', 'twitch/TwitchSevenTvBadges.java'],
        Path(__file__).with_name('PronounCompletionProbe.java').read_text(),
        ['user-live','names-live','user-retired','names-retired','user-off','names-off','user-native'],extra=completion | JSON_DOUBLE)
