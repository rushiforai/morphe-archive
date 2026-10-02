import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;

/** Export only changed methods and new helper classes, never the original app DEX. */
public class MakePayload {
    static Map<String,ClassDef> classes(File file) throws Exception {
        Map<String,ClassDef> result=new TreeMap<>();
        MultiDexContainer<? extends DexFile> container=DexFileFactory.loadDexContainer(file,Opcodes.getDefault());
        for(String entry:container.getDexEntryNames()) for(ClassDef cls:container.getEntry(entry).getDexFile().getClasses()) result.put(cls.getType(),cls);
        return result;
    }
    static String key(Method m) { return m.getName()+m.getParameterTypes()+m.getReturnType(); }
    public static void main(String[] args) throws Exception {
        Map<String,ClassDef> original=classes(new File(args[0])), modified=classes(new File(args[1]));
        Path source=Paths.get(args[2]), baseline=Paths.get(args[3]), output=Paths.get(args[4]);
        Files.createDirectories(output);
        List<ClassDef> delta=new ArrayList<>(), helpers=new ArrayList<>();
        List<String> changedPaths=new ArrayList<>();
        Files.walk(source).filter(p->p.toString().endsWith(".smali")).forEach(p->{
            try { Path relative=source.relativize(p), old=baseline.resolve(relative);
                if(!Files.exists(old)||!Arrays.equals(Files.readAllBytes(p),Files.readAllBytes(old))) changedPaths.add(relative.toString());
            } catch(IOException ex) { throw new UncheckedIOException(ex); }
        });
        int methodCount=0;
        for(String path:changedPaths) {
            String type="L"+path.replace('\\','/').replaceFirst("\\.smali$","")+";";
            ClassDef patched=Objects.requireNonNull(modified.get(type),type), old=original.get(type);
            if(old==null) { helpers.add(patched); continue; }
            // A changed source method is selected by comparing its full smali declaration.
            String oldText=Files.readString(baseline.resolve(path)), newText=Files.readString(source.resolve(path));
            Map<String,String> oldMethods=smaliMethods(oldText), newMethods=smaliMethods(newText);
            for(String signature:oldMethods.keySet()) if(!newMethods.containsKey(signature)) throw new IllegalStateException("Removed method requires explicit handling: "+type+signature);
            Set<String> changed=new HashSet<>();
            for(Map.Entry<String,String> m:newMethods.entrySet()) if(!m.getValue().equals(oldMethods.get(m.getKey()))) changed.add(m.getKey());
            List<Method> methods=new ArrayList<>();
            for(Method m:patched.getMethods()) {
                StringBuilder signature=new StringBuilder(m.getName()).append('(');
                for(CharSequence parameter:m.getParameterTypes()) signature.append(parameter);
                signature.append(')').append(m.getReturnType());
                if(changed.contains(signature.toString())) methods.add(m);
            }
            methodCount+=methods.size();
            delta.add(new ImmutableClassDef(patched.getType(),patched.getAccessFlags(),patched.getSuperclass(),patched.getInterfaces(),patched.getSourceFile(),patched.getAnnotations(),patched.getFields(),methods));
        }
        DexPool.writeTo(output.resolve("method-delta.dex").toString(),new ImmutableDexFile(Opcodes.getDefault(),delta));
        for(String helper:new String[]{args[5],args[6]}) helpers.addAll(classes(new File(helper)).values());
        Set<String> unique=new HashSet<>();
        for(ClassDef helper:helpers) if(!unique.add(helper.getType())||original.containsKey(helper.getType())) throw new IllegalStateException("Duplicate helper "+helper.getType());
        DexPool.writeTo(output.resolve("helpers.mpe").toString(),new ImmutableDexFile(Opcodes.getDefault(),helpers));
        try(ZipFile before=new ZipFile(args[0]); ZipFile after=new ZipFile(args[1]); ZipOutputStream payload=new ZipOutputStream(Files.newOutputStream(output.resolve("resources.zip")))) {
            Enumeration<? extends ZipEntry> entries=after.entries();
            int count=0;
            while(entries.hasMoreElements()) {
                ZipEntry entry=entries.nextElement(); String name=entry.getName();
                if(!(name.equals("AndroidManifest.xml")||name.equals("resources.arsc")||name.startsWith("res/"))) continue;
                byte[] next=after.getInputStream(entry).readAllBytes(); ZipEntry prev=before.getEntry(name);
                if(prev!=null&&Arrays.equals(next,before.getInputStream(prev).readAllBytes())) continue;
                payload.putNextEntry(new ZipEntry(name)); payload.write(next);payload.closeEntry();count++;
            }
            System.out.println("Resource entries: "+count);
        }
        System.out.println("Changed classes: "+delta.size()+", changed methods: "+methodCount+", helper classes: "+helpers.size());
    }
    static Map<String,String> smaliMethods(String text) {
        Map<String,String> result=new LinkedHashMap<>();
        java.util.regex.Matcher matcher=java.util.regex.Pattern.compile("(?m)^\\.method ([^\\r\\n]+)[\\s\\S]*?^\\.end method").matcher(text.replace("\r\n","\n"));
        while(matcher.find()) {String header=matcher.group(1);result.put(header.substring(header.lastIndexOf(' ')+1),matcher.group());}
        return result;
    }
}
