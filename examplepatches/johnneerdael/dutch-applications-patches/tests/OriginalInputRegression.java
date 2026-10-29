import java.io.*;
import java.lang.reflect.*;
import java.security.cert.X509Certificate;
import java.security.cert.CertificateFactory;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.PatchClasses;
import app.morphe.patcher.dex.*;
import com.reandroid.apk.ApkModule;
import com.android.tools.smali.dexlib2.immutable.*;
import kotlin.InitializedLazyImpl;

class OriginalInputRegression {
    static int checks;
    static Method validate, unique;
    static void check(boolean condition, String name) {
        if (!condition) throw new AssertionError(name);
        checks++; System.out.println("PASS " + name);
    }
    static void reject(String name, Throwing action) throws Exception {
        try { action.run(); } catch (InvocationTargetException e) {
            Throwable cause=e.getCause();
            if(cause instanceof IllegalStateException || cause instanceof PatchException) {
                check(true,name);return;
            }
            throw e;
        }
        throw new AssertionError("Accepted invalid input: " + name);
    }
    interface Throwing { void run() throws Exception; }
    static PackageMetadata metadata(PackageMetadata original,String pkg,String version,String code,
                                    List<X509Certificate> certs) throws Exception {
        PackageMetadata value=new PackageMetadata(pkg,version,code,null);
        // Fixture injection replaces only the SDK's parsed certificate collection.
        // The production guard still hashes actual X509Certificate.encoded bytes.
        Field delegate=PackageMetadata.class.getDeclaredField("signingCertificates$delegate");
        delegate.setAccessible(true);
        var scheme=original.getSigningCertificates().keySet().iterator().next();
        delegate.set(value,new InitializedLazyImpl<>(Map.of(scheme,certs)));
        return value;
    }
    static void validate(Compatibility target,PackageMetadata meta,Integer sdk) throws Exception {
        validate.invoke(null,target,meta,sdk);
    }
    static Set<Patch<?>> closure(Patch<?> root) {
        Set<Patch<?>> result=new HashSet<>();
        List<Patch<?>> remaining=new ArrayList<>(List.of(root));
        while(!remaining.isEmpty()) {
            Patch<?> patch=remaining.removeLast();
            if(result.add(patch))remaining.addAll(patch.getDependencies());
        }
        return result;
    }
    public static void main(String[] args) throws Exception {
        File bundle=new File(args[0]), originals=new File(args[1]), scratch=new File(args[2]);
        Set<Patch<?>> patches=new PatchLoader.Jar(Set.of(bundle));
        Field execution=Patch.class.getDeclaredField("executeBlock");execution.setAccessible(true);
        ClassLoader loader=execution.get(patches.stream().filter(p->p.getName()!=null && p.getCompatibility()!=null && p.getCompatibility().stream().anyMatch(c->c.getPackageName().equals("nl.weerplaza.app"))).findFirst().get()).getClass().getClassLoader();
        String[][] apps={{"weerplaza","weerplaza","nl.weerplaza.app"},{"nu.nl","nunl","nl.sanomamedia.android.nu"},{"volkskrant","volkskrant","be.persgroep.android.news.mobilevk"},{"trouw","trouw","be.persgroep.android.news.mobiletr"},{"ftm","ftm","nl.ftm.ftmpulse"},{"flitsmeister","flitsmeister","nl.flitsmeister"},{"ad","ad","be.persgroep.android.news.mobilead"},{"nrc","nrc","com.twipemobile.nrc"}};
        List<PackageMetadata> originalsMeta=new ArrayList<>();
        List<Integer> originalsSdk=new ArrayList<>();
        for(String[] app:apps)try(ApkModule apk=ApkModule.loadApkFile(new File(originals,app[0]+"/base.apk"))) {
            var manifest=apk.getAndroidManifest();
            originalsMeta.add(new PackageMetadata(manifest.getPackageName(),manifest.getVersionName(),String.valueOf(manifest.getVersionCode()),apk.getApkSignatureBlock()));
            originalsSdk.add(manifest.getMinSdkVersion());
        }
        for(int i=0;i<apps.length;i++) {
            String[] app=apps[i];
            Class<?> compatibility=loader.loadClass("patches."+app[1]+".CompatibilityKt");
            Optional<Method> getter=Arrays.stream(compatibility.getDeclaredMethods()).filter(m->m.getName().equals("getOriginalInput")).findFirst();
            check(getter.isPresent(),app[0]+" production preflight exists");
            ResourcePatch guard=(ResourcePatch)getter.get().invoke(null);
            List<Patch<?>> named=patches.stream().filter(p->p.getName()!=null&&p.getCompatibility()!=null&&p.getCompatibility().stream().anyMatch(c->c.getPackageName().equals(app[2]))).toList();
            check(!named.isEmpty(),app[0]+" named patches loaded");
            for(Patch<?> patch:named)for(Patch<?> node:closure(patch)) {
                if(node!=guard)check(node.getDependencies().contains(guard),app[0]+" preflight precedes mutation "+patch.getName()+" / "+node.getName());
            }
            Compatibility target=named.getFirst().getCompatibility().stream().filter(c->c.getPackageName().equals(app[2])).findFirst().get();
            if(validate==null) {
                Class<?> production=loader.loadClass("patches.shared.OriginalInputKt");
                validate=production.getDeclaredMethod("validateOriginalInput",Compatibility.class,PackageMetadata.class,Integer.class);
                unique=production.getDeclaredMethod("uniqueMatch",BytecodePatchContext.class,Fingerprint.class);
            }
            PackageMetadata original=originalsMeta.get(i);
            int sdk=originalsSdk.get(i);
            validate(target,original,sdk);check(true,app[0]+" actual original metadata accepted");
            List<X509Certificate> lineage=new ArrayList<>();
            if(app[1].equals("volkskrant")||app[1].equals("trouw")||app[1].equals("ad")) {
                try(InputStream certificates=new FileInputStream(new File(scratch,"dpg-publisher-certificates.pem"))) {
                    CertificateFactory.getInstance("X.509").generateCertificates(certificates)
                        .forEach(certificate->lineage.add((X509Certificate)certificate));
                }
                check(lineage.size()==2,app[0]+" two actual publisher lineage certificates loaded");
            }
            List<X509Certificate> trusted=java.util.stream.Stream.concat(
                original.getSigningCertificates().values().stream().flatMap(Collection::stream),lineage.stream()).distinct().toList();
            // Related publishers can legitimately share a signing lineage. Pick an
            // actually disjoint certificate set for negative signer controls.
            List<X509Certificate> other=originalsMeta.stream()
                .map(meta->meta.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList())
                .filter(certs->!certs.isEmpty()&&Collections.disjoint(trusted,certs)).findFirst().orElseThrow();
            for(X509Certificate signer:trusted) {
                validate(target,metadata(original,app[2],original.getVersionName(),original.getVersionCode(),List.of(signer)),sdk);
                check(true,app[0]+" individual publisher lineage signer accepted");
            }
            reject(app[0]+" wrong package",()->validate(target,metadata(original,"negative.wrong.package",original.getVersionName(),original.getVersionCode(),trusted),sdk));
            reject(app[0]+" wrong version name",()->validate(target,metadata(original,app[2],"0.0.0-negative",original.getVersionCode(),trusted),sdk));
            reject(app[0]+" wrong version code",()->validate(target,metadata(original,app[2],original.getVersionName(),"1",trusted),sdk));
            reject(app[0]+" missing signer",()->validate(target,new PackageMetadata(app[2],original.getVersionName(),original.getVersionCode(),null),sdk));
            reject(app[0]+" untrusted signer",()->validate(target,metadata(original,app[2],original.getVersionName(),original.getVersionCode(),other),sdk));
            List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(other);
            reject(app[0]+" mixed signer",()->validate(target,metadata(original,app[2],original.getVersionName(),original.getVersionCode(),mixed),sdk));
            reject(app[0]+" wrong manifest minSdk",()->validate(target,original,sdk+1));
            reject(app[0]+" missing manifest minSdk",()->validate(target,original,null));
            // Exercise the actual production resource patch, not just its validator.
            PatcherConfig config=config(new File(originals,app[0]+"/base.apk"),scratch,app[0]);
            try(ResourcePatchContext context=new ResourcePatchContext(config)) {
                context.get("AndroidManifest.xml",false).getParentFile().mkdirs();
                java.nio.file.Files.writeString(context.get("AndroidManifest.xml",false).toPath(),"<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\""+sdk+"\"/></manifest>");
                guard.execute(context);check(true,app[0]+" actual resource guard original accepted");
                Field resourceMetadata=ResourcePatchContext.class.getDeclaredField("packageMetadata");
                resourceMetadata.setAccessible(true);
                PackageMetadata[] invalid={
                    metadata(original,"negative.wrong.package",original.getVersionName(),original.getVersionCode(),trusted),
                    metadata(original,app[2],"0.0.0-negative",original.getVersionCode(),trusted),
                    metadata(original,app[2],original.getVersionName(),"1",trusted),
                    new PackageMetadata(app[2],original.getVersionName(),original.getVersionCode(),null),
                    metadata(original,app[2],original.getVersionName(),original.getVersionCode(),other),
                    metadata(original,app[2],original.getVersionName(),original.getVersionCode(),mixed)
                };
                String[] invalidNames={"package","version name","version code","missing signer","untrusted signer","mixed signer"};
                byte[] untouched=java.nio.file.Files.readAllBytes(context.get("AndroidManifest.xml",false).toPath());
                for(int bad=0;bad<invalid.length;bad++) {
                    resourceMetadata.set(context,invalid[bad]);
                    boolean refused=false;
                    try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,app[0]+" actual resource guard rejects "+invalidNames[bad]);
                    check(Arrays.equals(untouched,java.nio.file.Files.readAllBytes(context.get("AndroidManifest.xml",false).toPath())),app[0]+" rejected preflight leaves manifest unchanged");
                }
                resourceMetadata.set(context,original);
                java.nio.file.Files.writeString(context.get("AndroidManifest.xml",false).toPath(),"<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"999\"/></manifest>");
                boolean rejected=false;
                try{guard.execute(context);}catch(IllegalStateException expected){rejected=true;}
                check(rejected,app[0]+" actual resource guard bad manifest rejected");
            }
        }
        // The strict production resolver must reject ambiguity and missing targets.
        try(BytecodePatchContext context=new BytecodePatchContext(config(new File(originals,"weerplaza/base.apk"),scratch,"fingerprints"),originalsMeta.getFirst())) {
            String type="Lregression/Required;";
            var zero=new ImmutableMethod(type,"required",List.of(),"V",1,Set.of(),Set.of(),new ImmutableMethodImplementation(2,List.of(),List.of(),List.of()));
            var one=new ImmutableMethod(type,"required",List.of(new ImmutableMethodParameter("I",Set.of(),null)),"V",1,Set.of(),Set.of(),new ImmutableMethodImplementation(2,List.of(),List.of(),List.of()));
            context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(new ImmutableClassDef(type,1,"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(zero,one)))));
            Fingerprint broad=new Fingerprint(null,type,null,null,"required",null,null,"V",null,null,(List<String>)null,null);
            reject("production strict resolver ambiguous",()->unique.invoke(null,context,broad));
            Fingerprint missing=new Fingerprint(null,type,null,null,"absent",null,null,"V",List.of(),null,(List<String>)null,null);
            reject("production strict resolver missing",()->unique.invoke(null,context,missing));
            Fingerprint exact=new Fingerprint(null,type,null,null,"required",null,null,"V",List.of(),null,(List<String>)null,null);
            check(unique.invoke(null,context,exact)!=null,"production strict resolver exact lawful overload accepted");
            check(broad.matchAll(context,new kotlin.ranges.IntRange(2,2)).size()==2,"intentional two-match SDK cardinality preserved");
            // Exercise the app helper itself so using the strict shared resolver
            // in an unrelated test cannot conceal a raw first-match helper.
            for(String helperApp:List.of("trouw","ftm","flitsmeister","ad","nrc")) {
                Method appExact=Arrays.stream(loader.loadClass("patches."+helperApp+".CompatibilityKt").getDeclaredMethods())
                    .filter(method->method.getName().equals("exact")).findFirst().orElseThrow();
                Object[] absentArgs=exactArgs(appExact,context,type,"absent");
                reject(helperApp+" production helper missing target",()->appExact.invoke(null,absentArgs));
                Object[] exactArgs=exactArgs(appExact,context,type,"required");
                Object appMatch=appExact.invoke(null,exactArgs);
                check(appMatch!=null&&!(appMatch instanceof Fingerprint),helperApp+" production helper resolves exact lawful overload eagerly");
            }
        }
        System.out.println("SUCCESS original-input regression assertions="+checks);
    }
    static Object[] exactArgs(Method helper,BytecodePatchContext context,String type,String name) {
        return switch(helper.getParameterCount()) {
            case 5 -> new Object[]{context,type,name,"V",new String[0]};
            case 4 -> new Object[]{type,name,"V",new String[0]};
            case 3 -> new Object[]{context,type,name+"()V"};
            default -> throw new AssertionError("Unexpected exact helper: "+helper);
        };
    }
    static PatcherConfig config(File apk,File scratch,String name) {
        File workspace=new File(scratch,name);workspace.mkdirs();
        DexVerifier verifier=(DexVerifier)java.lang.reflect.Proxy.newProxyInstance(OriginalInputRegression.class.getClassLoader(),new Class[]{DexVerifier.class},(proxy,method,values)->{throw new AssertionError("Unexpected DEX validation");});
        return new PatcherConfig(apk,workspace,Set.of(),BytecodeMode.NONE,verifier,workspace,null,false);
    }
}
