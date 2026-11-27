import java.lang.ref.WeakReference;
/** Bridges custom operations into Gboard's actual GenAiEditHandler apply/undo path. */
public final class MorpheSharedEditor188 {
 private static WeakReference<pdq> editor=new WeakReference<>(null);
 public static void remember(Object receiver){if(dev.jason.gboardpatches.extension.sharedmodel.SharedWritingDiagnostics.enabled())dev.jason.gboardpatches.extension.sharedmodel.SharedWritingDiagnostics.event("native.editor.activated valid="+(receiver instanceof pdq));if(receiver instanceof pdq){editor=new WeakReference<>((pdq)receiver);dev.jason.gboardpatches.extension.sharedmodel.SharedWritingActivation.nativeReady();}}
 public static boolean available(){return editor.get()!=null;}
 public static void invalidate(){if(dev.jason.gboardpatches.extension.sharedmodel.SharedWritingDiagnostics.enabled())dev.jason.gboardpatches.extension.sharedmodel.SharedWritingDiagnostics.event("native.editor.invalidated");editor.clear();}
 public static String prepare(){pdq current=editor.get();return current==null?null:current.morpheSharedPrepare();}
 public static boolean apply(String text,String operation){pdq current=editor.get();if(current==null)return false;current.morpheSharedApply(text,operation);return true;}
 public static aeaj operation(String name){for(aeaj value:aeaj.values())if(name.equals(value.toString()))return value;for(aeaj value:aeaj.values())if("prompt".equals(value.toString()))return value;throw new IllegalStateException("Native operation enum drift");}
}
