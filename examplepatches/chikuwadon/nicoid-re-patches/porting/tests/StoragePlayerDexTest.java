import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.*;import java.util.*;
public class StoragePlayerDexTest {
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 public static void main(String[] args)throws Exception{
  Map<String,ClassDef> cs=new HashMap<>();MultiDexContainer<? extends DexFile> dex=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());for(String e:dex.getDexEntryNames())for(ClassDef c:dex.getEntry(e).getDexFile().getClasses())cs.put(c.getType(),c);
  ClassDef popup=cs.get("Le/e/a/u;");int popupStarts=0,strokeChecks=0;
  for(Method m:popup.getMethods())if(m.getImplementation()!=null){java.util.List<Instruction> instructions=new java.util.ArrayList<>();for(Instruction i:m.getImplementation().getInstructions())instructions.add(i);for(int n=0;n<instructions.size();n++){Instruction i=instructions.get(n);if(!(i instanceof ReferenceInstruction))continue;Reference r=((ReferenceInstruction)i).getReference();if(r instanceof MethodReference){MethodReference call=(MethodReference)r;if(call.getDefiningClass().equals("Le/e/a/CommentMotion;")&&call.getName().equals("start"))popupStarts++;if(call.getDefiningClass().equals("Landroid/graphics/Paint;")&&call.getName().equals("setStrokeWidth")){if(n>=2&&instructions.get(n-2) instanceof ReferenceInstruction){Reference prev=((ReferenceInstruction)instructions.get(n-2)).getReference();check(!(prev instanceof MethodReference&&((MethodReference)prev).getDefiningClass().equals("Le/e/a/CommentMotion;")),"comment clock cannot feed stroke width");}strokeChecks++;}}}}
  check(popupStarts==1&&strokeChecks>=6,"popup animation onset and stroke integrity");
  boolean localPath=false;for(Method m:cs.get("Lcom/devbrackets/android/exomedia/ui/widget/VideoView;").getMethods())if(m.getName().equals("setVideoPath"))for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference r=((ReferenceInstruction)i).getReference();if(r instanceof MethodReference&&((MethodReference)r).getDefiningClass().equals("Le/e/a/CachePlayback;"))localPath=true;}check(localPath,"offline setVideoPath uses SAF relay");
  int privateRoots=0,iconHooks=0,postForms=0;
  for(ClassDef c:cs.values())for(Method m:c.getMethods())if(m.getImplementation()!=null)for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference ref=((ReferenceInstruction)i).getReference();if(ref instanceof MethodReference){MethodReference call=(MethodReference)ref;if(c.getType().equals("Le/e/a/v0;")&&call.getDefiningClass().equals("Le/e/a/CacheFolders;")&&call.getName().equals("privateRoot"))privateRoots++;if(call.getDefiningClass().equals("Le/e/a/PlayerIcons;")&&call.getName().equals("background"))iconHooks++;if(c.getType().equals("Le/e/a/h1;")&&call.getDefiningClass().equals("Le/e/a/PlaybackSession;")&&call.getName().equals("showForm"))postForms++;}}
  check(privateRoots==4,"history and bookmarks use private read/write roots");check(iconHooks>=20&&postForms==1,"stateful player icons and themed comment form");
  int preferences=0,inputs=0;
  for(ClassDef c:cs.values())for(Method m:c.getMethods())if(m.getImplementation()!=null)for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference ref=((ReferenceInstruction)i).getReference();if(ref instanceof MethodReference){MethodReference call=(MethodReference)ref;if(c.getType().equals("Lcom/sauzask/nicoid/NicoidSetting;")&&m.getName().equals("onCreate")&&call.getDefiningClass().equals("Le/e/a/PreferenceDialogs;")&&call.getName().equals("attach"))preferences++;if(c.getType().equals("Le/e/a/PlaybackSession;")&&m.getName().equals("styleDialog")&&call.getDefiningClass().equals("Le/e/a/DialogInputs;")&&call.getName().equals("pad"))inputs++;}}
  check(preferences==1&&inputs==1,"framework preference dialogs and shared input spacing");
  int commandForms=0,loginForms=0;
  for(ClassDef c:cs.values())for(Method m:c.getMethods())if(m.getImplementation()!=null)for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference ref=((ReferenceInstruction)i).getReference();if(ref instanceof MethodReference){MethodReference call=(MethodReference)ref;if(call.getDefiningClass().equals("Le/e/a/PlaybackSession;")){if(c.getType().equals("Le/e/a/v0$a;")&&call.getName().equals("showForm"))commandForms++;if(c.getType().equals("Le/e/a/LoginSupport;")&&call.getName().equals("formDialog"))loginForms++;}}}
  check(commandForms==1&&loginForms==1,"command picker and login share rounded themed forms");
  int popupLayouts=0,cacheStarts=0,loopSymbols=0;
  for(ClassDef c:cs.values())for(Method m:c.getMethods())if(m.getImplementation()!=null)for(Instruction instruction:m.getImplementation().getInstructions())if(instruction instanceof ReferenceInstruction){Reference ref=((ReferenceInstruction)instruction).getReference();if(ref instanceof MethodReference){MethodReference call=(MethodReference)ref;if(c.getType().equals("Le/e/a/ModernEnhancements;")&&call.getDefiningClass().equals("Le/e/a/PopupOverlay;")&&call.getName().equals("attach"))popupLayouts++;if(c.getType().equals("Le/e/a/ModernEnhancements;")&&call.getDefiningClass().equals("Le/e/a/PlayerIcons;")&&call.getName().equals("symbol"))loopSymbols++;if(call.getDefiningClass().equals("Le/e/a/CacheFolders;")&&call.getName().equals("started")){check(c.getType().equals("Lcom/sauzask/nicoid/NicoidDownloadCache;")&&m.getName().equals("b")&&m.getParameterTypes().toString().contains("Intent"),"notification only on guarded cache-worker start");cacheStarts++;}}}
  check(popupLayouts==1&&loopSymbols==1&&cacheStarts==1,"responsive popup, common loop symbol and cache-start notification");
  int cacheConstructors=0,clock=0,gesture=0,folder=0,relay=0,hls=0,motion=0,fps=0,full=0,pack=0;
  for(ClassDef c:cs.values())for(Method m:c.getMethods()){if(m.getImplementation()==null)continue;for(Instruction i:m.getImplementation().getInstructions()){
   if(!(i instanceof ReferenceInstruction)||!(((ReferenceInstruction)i).getReference() instanceof MethodReference))continue;MethodReference r=(MethodReference)((ReferenceInstruction)i).getReference();String o=r.getDefiningClass();
   boolean app=c.getType().startsWith("Lcom/sauzask/")||c.getType().matches("Le/e/a/[a-z0-9]+(?:\\$.*)?;")||c.getType().equals("Le/e/a/CacheHls;");
   if(app&&r.getName().equals("<init>")&&(o.equals("Ljava/io/File;")||o.equals("Ljava/io/FileInputStream;")||o.equals("Ljava/io/FileOutputStream;")))throw new AssertionError("Unrouted file constructor "+c.getType()+m.getName());
   if(o.equals("Le/e/a/CacheFile;")&&r.getName().equals("<init>")){cacheConstructors++;if(c.getType().equals("Le/e/a/CacheHls;"))hls++;}
   if(o.equals("Le/e/a/CommentClock;")&&r.getName().equals("position")&&(c.getType().equals("Le/e/a/t;")||c.getType().equals("Le/e/a/u;")))clock++;
   if(o.equals("Le/e/a/CommentMotion;")&&r.getName().equals("frame"))motion++;
   if(o.equals("Le/e/a/CommentMotion;")&&r.getName().equals("period"))fps++;
   if(o.equals("Le/e/a/FullscreenControls;")&&r.getName().equals("update"))full++;
   if(o.equals("Le/e/a/CachePack;")&&r.getName().equals("completed"))pack++;
   if(o.equals("Le/e/a/PlayerGestures;")&&r.getName().equals("touch"))gesture++;
   if(o.equals("Le/e/a/CacheFolders;")&&r.getName().equals("root"))folder++;
   if(o.equals("Le/e/a/CachePlayback;"))relay++;
  }}
  check(cacheConstructors>30&&hls>0,"app and HLS cache routed");check(clock==4,"both comment renderers and clocks");check(gesture==1,"gesture dispatch");check(folder>0&&relay>0,"folder and playback routing");
  check(motion==2&&fps==2&&full>=2&&pack==1,"comment motion/FPS, fullscreen and consolidation hooks");
  for(String type:new String[]{"SpeedSlider","CachePack","CommentMotion","FullscreenControls","CacheInputStream","CacheOutputStream","CachePlayback","PlayerGestures","CommentClock"})check(cs.containsKey("Le/e/a/"+type+";"),type);
  System.out.println("Storage/player DEX hooks verified: "+cacheConstructors+" cache constructors, "+relay+" playback URI hooks");
 }
}
