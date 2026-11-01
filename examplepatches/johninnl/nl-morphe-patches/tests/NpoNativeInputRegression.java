import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import com.reandroid.apk.ApkModule;

/** Check the production dependency chain with real ZIP entries, before lazy native extraction. */
class NpoNativeInputRegression extends OriginalInputRegression {
    static final String LIB = "/libpairipcore.so";
    static final String XML = "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"%d\"/></manifest>";
    static void executeGuard(ResourcePatch guard, ResourcePatchContext context) throws Exception {
        for(Patch<?> dependency:guard.getDependencies()) {
            check(dependency instanceof ResourcePatch,"input dependency is a read-only resource guard");
            executeGuard((ResourcePatch)dependency,context);
        }
        guard.execute(context);
    }
    static PackageMetadata read(File file) throws Exception {
        try(ApkModule apk=ApkModule.loadApkFile(file)) {
            var m=apk.getAndroidManifest();
            return new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),apk.getApkSignatureBlock());
        }
    }
    static Map<String,byte[]> nativeEntries(File directory) throws Exception {
        Map<String,byte[]> entries=new TreeMap<>();
        for(File apk:Objects.requireNonNull(directory.listFiles((dir,name)->name.endsWith(".apk")))) {
            try(ZipFile archive=new ZipFile(apk)) {
                for(ZipEntry entry:Collections.list(archive.entries())) {
                    if(entry.getName().startsWith("lib/")&&!entry.isDirectory())
                        entries.put(entry.getName(),archive.getInputStream(entry).readAllBytes());
                }
            }
        }
        check(!entries.isEmpty(),"real publisher split set contains native resources");
        return entries;
    }
    static File fixture(File base, File scratch, String name, Map<String,byte[]> libraries) throws Exception {
        File result=new File(scratch,name+".apk");
        try(ZipFile original=new ZipFile(base);ZipOutputStream out=new ZipOutputStream(new FileOutputStream(result))) {
            for(ZipEntry entry:Collections.list(original.entries())) {
                if(!entry.getName().equals("AndroidManifest.xml"))continue;
                out.putNextEntry(new ZipEntry(entry.getName()));out.write(original.getInputStream(entry).readAllBytes());out.closeEntry();
            }
            for(var entry:libraries.entrySet()) {
                ZipEntry nativeEntry=new ZipEntry(entry.getKey());nativeEntry.setMethod(ZipEntry.STORED);
                nativeEntry.setSize(entry.getValue().length);CRC32 crc=new CRC32();crc.update(entry.getValue());nativeEntry.setCrc(crc.getValue());
                out.putNextEntry(nativeEntry);out.write(entry.getValue());out.closeEntry();
            }
        }
        return result;
    }
    static void probe(ResourcePatch guard,File input,PackageMetadata trusted,int sdk,File scratch,String name,boolean accepted) throws Exception {
        PatcherConfig config=config(input,scratch,name);
        config.setBehaviors$morphe_patcher(Set.of(PatcherBehavior.ON_REQUEST_RESOURCE_DECODING));
        try(ResourcePatchContext context=new ResourcePatchContext(config)) {
            context.decodeResources$morphe_patcher(app.morphe.patcher.resource.ResourceMode.RAW_ONLY);
            // ZIP fixtures are repacked to vary native resources. Preserve the independently
            // parsed publisher metadata so signer failure cannot conceal the native guard.
            Field metadata=ResourcePatchContext.class.getDeclaredField("packageMetadata");metadata.setAccessible(true);metadata.set(context,trusted);
            Path xml=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(xml.getParent());String manifest=XML.formatted(sdk);Files.writeString(xml,manifest);
            File libDirectory=context.get("lib",false);
            check(!libDirectory.exists(),name+" starts before native resource extraction");
            boolean rejected=false;
            try {executeGuard(guard,context);} catch(IllegalStateException failure) {
                rejected=true;
                if(!accepted)check(failure.getMessage().contains("complete original APKS")&&failure.getMessage().contains("libpairipcore.so"),name+" explains complete APKS and missing/invalid native dependency");
                else throw failure;
            }
            check(rejected!=accepted,name+(accepted?" accepted":" rejected"));
            check(Files.readString(xml).equals(manifest),name+" leaves manifest unchanged");
            try(ZipFile original=new ZipFile(input)) {
                for(String path:context.listApkEntries("lib/")) {
                    Path extracted=context.get(path,false).toPath();
                    if(Files.isRegularFile(extracted))
                        check(Arrays.equals(Files.readAllBytes(extracted),original.getInputStream(original.getEntry(path)).readAllBytes()),name+" preserves native bytes "+path);
                }
            }
        }
    }
    public static void main(String[] args) throws Exception {
        File scratch=new File(args[3]);
        try(URLClassLoader loader=new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},NpoNativeInputRegression.class.getClassLoader())) {
            ResourcePatch guard=(ResourcePatch)loader.loadClass("patches.npostarttv.CompatibilityKt").getDeclaredMethod("getOriginalInput").invoke(null);
            File tv=new File(args[1]),phone=new File(args[2]);PackageMetadata tvMetadata=read(tv),phoneMetadata=read(phone);
            // Exact captured crashing APK: no lib entries. Inject only the trusted TV
            // metadata, because the installed patched APK has a different signing key.
            File captured=new File(args[6]);
            try(ZipFile bad=new ZipFile(captured)){check(Collections.list(bad.entries()).stream().noneMatch(e->e.getName().startsWith("lib/")),"captured startup failure has no native library entries");}
            probe(guard,captured,tvMetadata,24,scratch,"captured-incomplete-TV",false);
            probe(guard,tv,tvMetadata,24,scratch,"publisher-TV-base-only",false);
            probe(guard,phone,phoneMetadata,32,scratch,"publisher-phone-base-only",false);
            for(var row:List.of(new Object[]{tv,tvMetadata,new File(args[4]),"TV",24},new Object[]{phone,phoneMetadata,new File(args[5]),"phone",32})) {
                File base=(File)row[0];PackageMetadata metadata=(PackageMetadata)row[1];String label=(String)row[3];int sdk=(int)row[4];
                Map<String,byte[]> complete=nativeEntries((File)row[2]);
                probe(guard,fixture(base,scratch,label+"-complete",complete),metadata,sdk,scratch,label+"-complete",true);
                Map<String,byte[]> unknown=new TreeMap<>(complete);
                unknown.put("lib/mips/libpairipcore.so",complete.values().iterator().next());
                probe(guard,fixture(base,scratch,label+"-unknown",unknown),metadata,sdk,scratch,label+"-unknown",false);
                for(int variantSdk:new int[]{24,29,32})
                    probe(guard,fixture(base,scratch,label+"-API"+variantSdk,complete),metadata,variantSdk,scratch,label+"-API"+variantSdk,true);
                for(String path:complete.keySet().stream().filter(n->n.endsWith(LIB)).toList()) {
                    String abi=path.split("/")[1];Map<String,byte[]> subset=new TreeMap<>();complete.forEach((key,value)->{if(key.startsWith("lib/"+abi+"/"))subset.put(key,value);});
                    probe(guard,fixture(base,scratch,label+"-"+abi,subset),metadata,sdk,scratch,label+"-"+abi,true);
                    Map<String,byte[]> missing=new TreeMap<>(complete);missing.remove(path);
                    probe(guard,fixture(base,scratch,label+"-missing-"+abi,missing),metadata,sdk,scratch,label+"-missing-"+abi,false);
                    byte[] bytes=complete.get(path);
                    for(int offset:new int[]{0,4,5,6,16,18,20,bytes[4]==1?40:52}) {
                        Map<String,byte[]> malformed=new TreeMap<>(complete);byte[] changed=bytes.clone();changed[offset]^=0x7f;malformed.put(path,changed);
                        probe(guard,fixture(base,scratch,label+"-bad-"+abi+"-"+offset,malformed),metadata,sdk,scratch,label+"-bad-"+abi+"-"+offset,false);
                    }
                    for(int size:new int[]{20,64,bytes.length-1}) {
                        Map<String,byte[]> truncated=new TreeMap<>(complete);truncated.put(path,Arrays.copyOf(bytes,size));
                        probe(guard,fixture(base,scratch,label+"-short-"+abi+"-"+size,truncated),metadata,sdk,scratch,label+"-short-"+abi+"-"+size,false);
                    }
                    Map<String,byte[]> corrupt=new TreeMap<>(complete);byte[] body=bytes.clone();body[body.length-1]^=1;corrupt.put(path,body);
                    probe(guard,fixture(base,scratch,label+"-body-"+abi,corrupt),metadata,sdk,scratch,label+"-body-"+abi,false);
                }
            }
            System.out.println("SUCCESS NPO native-input assertions="+checks);
        }
    }
}
