#!/usr/bin/env python3
"""Run the production playlist proxy with patch-time templates on JVM boundaries (no APK)."""
import re
import sys
from pathlib import Path

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
from host_java import PACKAGE, ROOT, STUBS, run

PLATFORM = {
    'android/net/Uri.java': '''package android.net; import java.net.URI;
        public class Uri {private final URI uri; private Uri(String s){uri=URI.create(s);}
        public static Uri parse(String s){return new Uri(s);}
        public String getHost(){return uri.getHost();} public String getScheme(){return uri.getScheme();}
        public String getEncodedPath(){return uri.getRawPath();}
        public String getEncodedQuery(){return uri.getRawQuery();}
        public String toString(){return uri.toString();} }''',
    'android/os/Looper.java': '''package android.os; public class Looper {
        public static Looper getMainLooper(){return null;} public static Looper myLooper(){return null;} }''',
    'android/graphics/Canvas.java': '''package android.graphics; public class Canvas {
        public void drawRect(Rect r,Paint p){} public void drawText(String s,float x,float y,Paint p){} }''',
    'android/graphics/Color.java': 'package android.graphics; public class Color {public static final int BLACK=0;}',
    'android/graphics/ColorFilter.java': 'package android.graphics; public class ColorFilter {}',
    'android/graphics/PixelFormat.java': 'package android.graphics; public class PixelFormat {public static final int OPAQUE=-1;}',
    'android/graphics/Rect.java': '''package android.graphics; public class Rect {
        public float exactCenterX(){return 0;} public float exactCenterY(){return 0;} }''',
    'android/graphics/Paint.java': '''package android.graphics; public class Paint {
        public static final int ANTI_ALIAS_FLAG=1; public enum Align {CENTER}
        public Paint(){} public Paint(int f){} public void setColor(int c){} public void setTextAlign(Align a){}
        public void setTypeface(Typeface t){} public void setTextSize(float s){}
        public float descent(){return 0;} public float ascent(){return 0;} }''',
    'android/graphics/Typeface.java': '''package android.graphics; public class Typeface {
        public static final Typeface DEFAULT_BOLD=new Typeface(); }''',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable; import android.graphics.*;
        public abstract class Drawable {public Rect getBounds(){return new Rect();}
        public abstract void draw(Canvas c); public abstract void setAlpha(int a);
        public abstract void setColorFilter(ColorFilter f); public abstract int getOpacity(); }''',
    'android/util/TypedValue.java': '''package android.util; public class TypedValue {
        public static final int COMPLEX_UNIT_SP=2;
        public static float applyDimension(int unit,float value,DisplayMetrics metrics){return value;} }''',
    'android/view/View.java': STUBS['android/view/View.java'].replace(
        'public View getRootView()', '''public android.graphics.drawable.Drawable getBackground(){return null;}
        public android.graphics.drawable.Drawable getForeground(){return null;}
        public void setForeground(android.graphics.drawable.Drawable d){}
        public View getRootView()'''),
    'org/json/JSONException.java': 'package org.json; public class JSONException extends Exception {}',
    'org/json/JSONObject.java': '''package org.json; public class JSONObject {
        public JSONObject(String s)throws JSONException{throw new AssertionError("unexpected ad cue");}
        public String optString(String k){return "";} }''',
}


if __name__ == '__main__':
    source = (ROOT / 'extensions/shared/src/main/java' / PACKAGE / 'twitch/TwitchAds.java').read_text()
    # The patch replaces this stub with its configured URL. Supply the same boundary per scenario;
    # the public injection hooks and all URL validation/substitution remain the production code.
    source, count = re.subn(r'(private static String proxyTemplate\(\)\s*\{)\s*return null;',
                           r'\1 return System.getProperty("lurk.test.proxy");', source)
    assert count == 1, 'playlist proxy patch-time template stub changed'
    run('PlaylistProxyProbe', [], Path(__file__).with_name('PlaylistProxyProbe.java').read_text(),
        sys.argv[1:] or ['channel', 'invalid', 'bare', 'url', 'disabled'],
        extra=PLATFORM | {PACKAGE + 'twitch/TwitchAds.java': source})
