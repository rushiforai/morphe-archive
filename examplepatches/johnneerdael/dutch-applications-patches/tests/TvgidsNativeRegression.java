import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.*;
import java.security.*;
import java.util.*;
import java.util.zip.*;
import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.PatchLoader;

/** Runs production ELF/preimage guards against original images, never publisher code. */
class TvgidsNativeRegression {
    static int checks;
    static Class<?> ranges, edits, binary;
    static Method transform, validate;
    static String sha(byte[] data) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(data));
    }
    static void check(boolean value, String name) {
        if (!value) throw new AssertionError(name);
        checks++;
    }
    static Object range(String name, long address, int size, String digest) throws Exception {
        return ranges.getConstructor(String.class,long.class,int.class,String.class).newInstance(name,address,size,digest);
    }
    static Object edit(Object function, long address, byte[] before, byte[] after) throws Exception {
        return edits.getConstructor(ranges,long.class,byte[].class,byte[].class).newInstance(function,address,before,after);
    }
    static byte[] apply(String abi, byte[] image, List<Object> changes, List<Object> prior) throws Exception {
        return (byte[])transform.invoke(null,abi,image,changes,prior);
    }
    @SuppressWarnings("unchecked")
    static Map<String,List<Object>> policyEdits(ClassLoader loader, String source, String getter) throws Exception {
        return (Map<String,List<Object>>)loader.loadClass("patches.tvgids."+source).getDeclaredMethod(getter).invoke(null);
    }
    static void consentPolicy(ClassLoader loader, Map<String,byte[]> images) throws Exception {
        Class<?> source;
        try { source=loader.loadClass("patches.tvgids.ConsentScreensPatchKt"); }
        catch(ClassNotFoundException absent) { throw new AssertionError("TVgids Skip consent screens control is missing", absent); }
        Object control=source.getDeclaredMethod("getSkipConsentScreens").invoke(null);
        Class<?> patch=loader.loadClass("app.morphe.patcher.patch.Patch");
        check(patch.getMethod("getDefault").invoke(control).equals(true),"consent control defaults on");
        check(patch.getMethod("getName").invoke(control).equals("Skip consent screens"),"consent control has public name");
        Object tracking=loader.loadClass("patches.tvgids.TrackingPatchKt").getDeclaredMethod("getDisableTracking").invoke(null);
        check(((Set<?>)patch.getMethod("getDependencies").invoke(control)).contains(tracking),"consent control requires hard tracking policy");
        Class<?> nativeSource=loader.loadClass("patches.tvgids.ConsentNativeKt");
        Object consentNative=nativeSource.getDeclaredMethod("getConsentNative").invoke(null);
        Object trackingNative=loader.loadClass("patches.tvgids.TrackingNativeKt").getDeclaredMethod("getTrackingNative").invoke(null);
        check(((Set<?>)patch.getMethod("getDependencies").invoke(consentNative)).contains(trackingNative),"native consent follows tracking");
        Map<String,List<Object>> ads=policyEdits(loader,"AdNativeKt","getNativeAdEdits");
        Map<String,List<Object>> measurement=policyEdits(loader,"TrackingNativeKt","getNativeTrackingEdits");
        Map<String,List<Object>> consent=policyEdits(loader,"ConsentNativeKt","getNativeConsentEdits");
        check(consent.keySet().equals(images.keySet()),"consent covers exactly all supported ABIs");
        for(var item:images.entrySet()) {
            String abi=item.getKey();byte[] original=item.getValue();
            List<Object> earlier=new ArrayList<>(ads.get(abi));earlier.addAll(measurement.get(abi));
            byte[] adsOnly=apply(abi,original,ads.get(abi),List.of());
            byte[] trackingOnly=apply(abi,adsOnly,measurement.get(abi),ads.get(abi));
            check(consent.get(abi).size()==2,"both consent gate regions supplied "+abi);
            byte[] result=apply(abi,trackingOnly,consent.get(abi),earlier);
            byte[] restored=result.clone();
            for(Object change:consent.get(abi)) {
                long at=(long)edits.getMethod("getAddress").invoke(change);
                byte[] before=(byte[])edits.getMethod("getBefore").invoke(change);
                System.arraycopy(before,0,restored,(int)at,before.length);
            }
            check(Arrays.equals(restored,trackingOnly),"consent preserves all preceding output bytes "+abi);
            check(Arrays.equals(apply(abi,trackingOnly,List.of(),earlier),trackingOnly),"tracking selection remains unchanged "+abi);
            rejects("prior",()->apply(abi,adsOnly,consent.get(abi),earlier));
            byte[] corrupt=trackingOnly.clone();corrupt[corrupt.length-1]^=1;
            rejects("image hash",()->apply(abi,corrupt,consent.get(abi),earlier));
        }
    }
    interface Action { void run() throws Exception; }
    static void rejects(String reason, Action action) throws Exception {
        try { action.run(); } catch (InvocationTargetException exception) {
            Throwable cause=exception.getCause();
            check(cause instanceof IllegalStateException && cause.getMessage().contains(reason),
                "Expected native rejection "+reason+", got "+cause);
            return;
        }
        throw new AssertionError("Accepted invalid native input: "+reason);
    }
    public static void main(String[] args) throws Exception {
        Set<Patch<?>> loaded=new PatchLoader.Jar(Set.of(new File(args[0])));
        List<Patch<?>> named=loaded.stream().filter(p->p.getName()!=null && p.getCompatibility()!=null &&
            p.getCompatibility().stream().anyMatch(c->c.getPackageName().equals("nl.tvgids"))).toList();
        check(named.size()==3 && named.stream().map(Patch::getName).collect(java.util.stream.Collectors.toSet()).equals(
            Set.of("Hide ads","Disable tracking","Skip consent screens")),"exactly three TVgids controls");
        check(named.stream().allMatch(Patch::getDefault),"all three TVgids controls default on");
        try (URLClassLoader loader=new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},TvgidsNativeRegression.class.getClassLoader())) {
            try {
                binary=loader.loadClass("patches.tvgids.NativeBinaryKt");
                ranges=loader.loadClass("patches.tvgids.NativeRange");
                edits=loader.loadClass("patches.tvgids.NativeEdit");
            } catch (ClassNotFoundException missing) {
                throw new AssertionError("TVgids production native preflight/transform is missing",missing);
            }
            transform=binary.getDeclaredMethod("transformNative",String.class,byte[].class,List.class,List.class);
            validate=binary.getDeclaredMethod("validateNativeInputs",Map.class);
            Map<String,byte[]> images=new LinkedHashMap<>();
            try(ZipFile original=new ZipFile(args[1])) {
                for(String abi:List.of("arm64-v8a","armeabi-v7a","x86_64"))
                    images.put(abi,original.getInputStream(original.getEntry("lib/"+abi+"/libapp.so")).readAllBytes());
            }
            Map<String,String> unchanged=new LinkedHashMap<>();
            for(var entry:images.entrySet())unchanged.put(entry.getKey(),sha(entry.getValue()));
            validate.invoke(null,images);check(true,"all original native images accepted");
            for(String missing:images.keySet()) {
                Map<String,byte[]> bad=new LinkedHashMap<>(images);bad.remove(missing);
                rejects("ABI set",()->validate.invoke(null,bad));
            }
            Map<String,byte[]> extra=new LinkedHashMap<>(images);extra.put("unknown",new byte[0]);
            rejects("ABI set",()->validate.invoke(null,extra));
            // Literal payload addresses/sizes from independent VM metadata. ELF mappings
            // for these shipped executable ranges have p_offset == p_vaddr.
            long[] addresses={0x77c4b0L,0x904088L,0x82f5fcL};
            int[] sizes={0x7c,0x74,0x6c};
            int index=0;
            for(var item:images.entrySet()) {
                String abi=item.getKey();byte[] input=item.getValue();long address=addresses[index];int size=sizes[index++];
                byte[] function=Arrays.copyOfRange(input,(int)address,(int)address+size);
                Object owner=range("AdvertisementSlot.build",address,size,sha(function));
                byte[] before=Arrays.copyOfRange(input,(int)address,(int)address+4), after=before.clone();after[0]^=1;
                Object first=edit(owner,address,before,after);
                byte[] result=apply(abi,input,List.of(first),List.of());
                check(result.length==input.length,"native file length retained "+abi);
                check(result[(int)address]==after[0],"owned edit applied "+abi);
                byte[] restored=result.clone();System.arraycopy(before,0,restored,(int)address,4);
                check(Arrays.equals(restored,input),"all unowned bytes retained "+abi);
                byte[] before2=Arrays.copyOfRange(input,(int)address+4,(int)address+8), after2=before2.clone();after2[1]^=2;
                Object second=edit(owner,address+4,before2,after2);
                byte[] combined=apply(abi,result,List.of(second),List.of(first));
                System.arraycopy(before,0,combined,(int)address,4);System.arraycopy(before2,0,combined,(int)address+4,4);
                check(Arrays.equals(combined,input),"shared-function policies compose exactly "+abi);
                rejects("overlap",()->apply(abi,input,List.of(first,first),List.of()));
                rejects("overlap",()->apply(abi,result,List.of(first),List.of(first)));
                rejects("preimage",()->apply(abi,input,List.of(edit(owner,address,after,before)),List.of()));
                rejects("prior",()->apply(abi,input,List.of(second),List.of(first)));
                rejects("function hash",()->apply(abi,input,List.of(edit(range("wrong",address,size,"0".repeat(64)),address,before,after)),List.of()));
                rejects("function bounds",()->apply(abi,input,List.of(edit(owner,address+size,before,after)),List.of()));
                rejects("range",()->apply(abi,input,List.of(edit(range("zero",address,0,sha(new byte[0])),address,before,after)),List.of()));
                rejects("range",()->apply(abi,input,List.of(edit(range("overflow",Long.MAX_VALUE-3,12,sha(function)),Long.MAX_VALUE-3,before,after)),List.of()));
                rejects("size",()->apply(abi,input,List.of(edit(owner,address,before,new byte[0])),List.of()));
                rejects("executable",()->apply(abi,input,List.of(edit(range("data",0x100,4,sha(Arrays.copyOfRange(input,0x100,0x104))),0x100,Arrays.copyOfRange(input,0x100,0x104),new byte[4])),List.of()));
                if(!abi.equals("x86_64"))rejects("alignment",()->apply(abi,input,List.of(edit(owner,address+1,before,after)),List.of()));
                byte[] endian=input.clone();endian[5]=2;
                rejects("little-endian",()->apply(abi,endian,List.of(),List.of()));
                byte[] machine=input.clone();machine[18]=0;machine[19]=0;
                rejects("machine",()->apply(abi,machine,List.of(),List.of()));
                byte[] badClass=input.clone();badClass[4]=(byte)(abi.equals("armeabi-v7a")?2:1);
                rejects("ELF class",()->apply(abi,badClass,List.of(),List.of()));
                byte[] corrupt=input.clone();corrupt[corrupt.length-1]^=1;
                rejects("image hash",()->apply(abi,corrupt,List.of(first),List.of()));
                Map<String,byte[]> bad=new LinkedHashMap<>(images);bad.put(abi,corrupt);
                rejects("image hash",()->validate.invoke(null,bad));
                rejects("ELF header",()->apply(abi,new byte[32],List.of(),List.of()));
                // A valid ELF magic is insufficient when its program table is out of bounds.
                byte[] table=input.clone();ByteBuffer header=ByteBuffer.wrap(table).order(ByteOrder.LITTLE_ENDIAN);
                if(abi.equals("armeabi-v7a"))header.putInt(28,table.length-1);else header.putLong(32,table.length-1L);
                rejects("program table",()->apply(abi,table,List.of(),List.of()));
                check(sha(input).equals(unchanged.get(abi)),"success/failure never mutate caller input "+abi);
            }
            consentPolicy(loader,images);
            System.out.println("SUCCESS TVgids native production assertions="+checks);
        }
    }
}
