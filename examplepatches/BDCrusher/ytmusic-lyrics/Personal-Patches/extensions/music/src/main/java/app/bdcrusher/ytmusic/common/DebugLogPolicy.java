/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;
import android.os.*;import android.content.Context;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
/** Bounds and redacts normal Morphe exports; limits routine component-dump overhead. */
public final class DebugLogPolicy {
 private static long componentAt=-10000;private static int skipped;
 private static final java.util.regex.Pattern URL=java.util.regex.Pattern.compile("(?i)https?://[^\\s\"<>]+"),SECRET=java.util.regex.Pattern.compile("(?i)(bearer|authorization|cookie|token|jwt|secret|password)[=:\" ]+[^ ;,\\n]+"),JWT=java.util.regex.Pattern.compile("[A-Za-z0-9_-]{16,}\\.[A-Za-z0-9_-]{16,}\\.[A-Za-z0-9_-]{8,}");
 private DebugLogPolicy(){}
 public static String bound(String value){if(value==null)return "";String s=value.length()>6000?value.substring(0,6000)+" [truncated]":value;s=URL.matcher(s).replaceAll("[url omitted]");s=SECRET.matcher(s).replaceAll("$1=[redacted]");return JWT.matcher(s).replaceAll("[credential omitted]");}
 public static boolean stack(Logger.LogMessage message,Throwable error,boolean requested){if(error!=null)return requested;String name=message.getClass().getName();return requested&&!name.contains("FeatureDiagnostics")&&!name.contains("DebugLogPolicy");}
 public static synchronized void component(Logger.LogMessage message){
  if(!BaseSettings.DEBUG.get())return;long now=SystemClock.elapsedRealtime();if(now-componentAt<1000){skipped++;return;}componentAt=now;int count=skipped;skipped=0;
  Logger.printDebug(()->{String value=bound(message.buildMessageString());if(value.length()>1200)value=value.substring(0,1200)+" [component dump truncated]";return value+(count>0?" ["+count+" component messages suppressed]":"");});
 }
 public static String context(){
  Context c=FeatureDiagnostics.context();String apk="unknown",web="unknown";
  try{if(c!=null){android.content.pm.PackageInfo p=c.getPackageManager().getPackageInfo(c.getPackageName(),0);apk=p.versionName+"/"+(Build.VERSION.SDK_INT>=28?p.getLongVersionCode():p.versionCode);}}catch(Exception ignored){}
  if(Build.VERSION.SDK_INT>=26)try{android.content.pm.PackageInfo p=android.webkit.WebView.getCurrentWebViewPackage();if(p!=null)web=p.packageName+"/"+p.versionName;}catch(Exception ignored){}
  String rate="unknown";try{rate=app.morphe.extension.shared.settings.SharedYouTubeSettings.APP_REFRESH_RATE.get();}catch(Exception ignored){}
  return "YT-Music personal patches 0.6.0-beta.1; APK="+apk+"; Android="+Build.VERSION.SDK_INT+"; WebView="+web+"; debug="+BaseSettings.DEBUG.get()+"; entry="+FeatureDiagnostics.entry()+"; lyricsOpen="+FeatureDiagnostics.panelOpen()+"; appRefresh="+rate+". Callback cadence is distinct from Android missed deadlines.";
 }
 public static String export(String logs){return context()+"\n"+boundExport(logs);}
 private static String boundExport(String value){if(value==null)return "";String s=URL.matcher(value).replaceAll("[url omitted]");s=SECRET.matcher(s).replaceAll("$1=[redacted]");return JWT.matcher(s).replaceAll("[credential omitted]");}
}
