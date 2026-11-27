package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.Context;
/** Small cached switches: keyboard callbacks do no disk I/O or Binder work. */
public final class SharedInlineSettings {
 private static volatile boolean compose,grammar,initialized;
 private SharedInlineSettings(){}
 public static void refresh(Context context){updated("true".equals(SharedWritingPreferences.read(context,"compose")),"true".equals(SharedWritingPreferences.read(context,"grammar")));}
 public static void updated(boolean completion,boolean correction){compose=completion;grammar=correction;initialized=true;}
 public static boolean completionSelected(Context context){if(context==null)return false;if(!initialized)refresh(context);return compose && GboardSharedWritingRuntime.selected(context);}
 public static int completionMode(Context context){if(context==null || !GboardSharedWritingRuntime.selected(context))return -1;return compose && SharedModelClient.isReadyCached()?1:0;}
 public static boolean grammarSelected(Context context){if(context==null)return false;if(!initialized)refresh(context);return grammar && GboardSharedWritingRuntime.selected(context);}
 public static boolean grammar(Context context){return grammar && GboardSharedWritingRuntime.selected(context) && SharedModelClient.isReadyCached();}
}
