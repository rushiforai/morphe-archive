import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Fail closed if an ads-only APK accidentally embeds the full runtime or its hooks. */
public final class VerifyAdsOnlyApk {
 static Map<String,ClassDef> load(String path)throws Exception{
  Map<String,ClassDef> out=new HashMap<>();
  try(var zip=new ZipFile(path)){for(var es=zip.entries();es.hasMoreElements();){var e=es.nextElement();if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
   try(var in=new BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())out.put(c.getType(),c);}
  }}return out;
 }
 public static void main(String[] args)throws Exception{
  var original=load(args[0]);var patched=load(args[1]);
  var allowed=Set.of("installSignatureSpoof","originalPackageName","retargetSelfIntent","shouldHideAds","hideAdView","hideHomeBanner","hideLegacyBanner","hideLegacyThreadListAd","hideModernThreadListAd","suppressTabletThreadHeaderAdSpace","rewrite5chUrl","rewriteBbsMenuUrl","normalizeLegacyTalkAuthIntegrity","invokeLegacyTalkAuthenticator","invokePreIoTalkPoster","invokePreIoTalkAuthenticator","invokeIoTalkPoster","invokeIoTalkAuth","normalizeImageUploadIntegrity242","invokePreIoImageUploader","invokeCurrentImageUploader");
  Set<String> runtime=new HashSet<>();
  try(var in=new BufferedInputStream(new FileInputStream(args[2]))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())runtime.add(c.getType());}
  int added=0,hooks=0;Set<String> entries=new TreeSet<>();
  for(var c:patched.values()){
   if(!original.containsKey(c.getType())){
    added++;
    if(!runtime.contains(c.getType()))throw new AssertionError("Unexpected added library: "+c.getType());
    if(c.getType().contains("NativeToolTabs")||c.getType().contains("SearchController")||c.getType().contains("Compose")||c.getType().contains("VideoFrame"))throw new AssertionError("Full runtime leaked: "+c.getType());
   }
   if(!original.containsKey(c.getType()))continue;
   for(var m:c.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions()){
    if(!(i instanceof ReferenceInstruction r)||!(r.getReference() instanceof MethodReference ref)||!ref.getDefiningClass().startsWith("Lapp/morphe/extension/"))continue;
    if(!(ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/Haiagaru;")&&allowed.contains(ref.getName()) || ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/TalkPostCompatibility;")&&Set.of("invoke","normalizeIntegrityState","normalizeIntegrityState242").contains(ref.getName())))throw new AssertionError("Unexpected lightweight hook: "+ref);
    hooks++;entries.add(ref.getName());
    var target=patched.get(ref.getDefiningClass());boolean found=false;
    for(var t:target.getMethods())if(t.getName().equals(ref.getName())&&t.getReturnType().equals(ref.getReturnType())&&t.getParameterTypes().equals(ref.getParameterTypes()))found=true;
    if(!found)throw new AssertionError("Missing runtime method "+ref);
   }
  }
  // Verify every runtime-to-runtime call too: injected methods must not leave
  // unresolved references to settings/upload/full-runtime helpers.
  int resolved=0;
  for(var c:patched.values())for(var m:c.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions()){
   if(!(i instanceof ReferenceInstruction r)||!(r.getReference() instanceof MethodReference ref)||!ref.getDefiningClass().startsWith("Lapp/morphe/extension/"))continue;
   var target=patched.get(ref.getDefiningClass());if(target==null)throw new AssertionError("Missing extension class "+ref);
   boolean found=false;for(var t:target.getMethods())if(t.getName().equals(ref.getName())&&t.getReturnType().equals(ref.getReturnType())&&t.getParameterTypes().equals(ref.getParameterTypes()))found=true;
   if(!found)throw new AssertionError("Unresolved extension call "+ref);resolved++;
  }
  System.out.println("PASS all "+resolved+" extension method references resolve");
  if(!patched.containsKey("Lapp/morphe/extension/chmate/AdsOnlyRuntime;"))throw new AssertionError("Ads-only marker missing");
  if(added>40||added==0)throw new AssertionError("Unexpected runtime class count "+added);
  if(!entries.contains("installSignatureSpoof")||!entries.contains("hideAdView")||hooks==0)throw new AssertionError("Required hooks missing");
  if(!entries.contains("rewriteBbsMenuUrl"))throw new AssertionError("Menu migration hook missing");
  boolean defaultMenu=false;
  for(var c:patched.values())for(var m:c.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions())
   if(i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference ref && ref.getString().equals("https://menu.5ch.io/bbsmenu.html"))defaultMenu=true;
  if(!defaultMenu)throw new AssertionError("IO menu default missing");
  System.out.println("PASS ads-only APK: "+added+" added classes; "+hooks+" allowed compatibility/ad calls; "+entries);
 }
}
