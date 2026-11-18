import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

/** Recover protected receivers from the matching official SDK DEX, never an empty substitute.
 * Usage: ExtractPizzaSdkReceivers original.apk output.dex matching-sdk.dex [...]
 */
public class ExtractPizzaSdkReceivers {
    static Map<String, ClassDef> classes(String path) throws Exception {
        var result = new HashMap<String, ClassDef>();
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (var cls : dex.getEntry(entry).getDexFile().getClasses()) result.put(cls.getType(), cls);
        return result;
    }
    static String signature(MethodReference m) { return m.getDefiningClass()+"->"+m.getName()+"("+String.join("",m.getParameterTypes())+")"+m.getReturnType(); }
    static boolean callsVm(Method m) {
        if (m.getImplementation() == null) return false;
        for (var i : m.getImplementation().getInstructions()) if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference call && call.getDefiningClass().equals("Lcom/pairip/VMRunner;") && call.getName().equals("invoke")) return true;
        return false;
    }
    static boolean hasField(Map<String,ClassDef> target, FieldReference field, String owner) {
        var cls = target.get(owner); if (cls == null) return false;
        for (var candidate : cls.getFields()) if (candidate.getName().equals(field.getName()) && candidate.getType().equals(field.getType())) return true;
        return cls.getSuperclass() != null && hasField(target, field, cls.getSuperclass());
    }
    static boolean hasMethod(Map<String,ClassDef> target, MethodReference method, String owner, Set<String> visited) {
        if (!visited.add(owner)) return false;
        var cls = target.get(owner);
        if (cls == null) return owner.startsWith("Ljava/") || owner.startsWith("Landroid/");
        for (var candidate : cls.getMethods()) if (candidate.getName().equals(method.getName()) && candidate.getReturnType().equals(method.getReturnType()) && candidate.getParameterTypes().equals(method.getParameterTypes())) return true;
        if (method.getName().equals("<init>")) return false;
        if (cls.getSuperclass() != null && hasMethod(target,method,cls.getSuperclass(),visited)) return true;
        return cls.getInterfaces().stream().anyMatch(iface -> hasMethod(target,method,iface,visited));
    }
    public static void main(String[] args) throws Exception {
        if (args.length < 3) throw new IllegalArgumentException("Usage: ExtractPizzaSdkReceivers original.apk output.dex matching-sdk.dex [...]");
        var target = classes(args[0]); var source = new HashMap<String, ClassDef>();
        for (int i=2;i<args.length;i++) for (var cls : classes(args[i]).values()) {
            if (source.putIfAbsent(cls.getType(),cls) != null) throw new IllegalArgumentException("Conflicting SDK class: "+cls.getType());
        }
        var definitions = new ArrayList<ClassDef>(); int count=0;
        for (var cls : new TreeMap<>(target).values()) {
            if (!source.containsKey(cls.getType())) continue;
            var recovered = new ArrayList<Method>();
            for (var method : cls.getMethods()) {
                if (!method.getName().equals("onReceive") || !method.getReturnType().equals("V") || !method.getParameterTypes().equals(List.of("Landroid/content/Context;","Landroid/content/Intent;")) || !callsVm(method)) continue;
                var candidates = new ArrayList<Method>();
                for (var m : source.get(cls.getType()).getMethods()) if (signature(m).equals(signature(method))) candidates.add(m);
                if (candidates.size()!=1 || candidates.get(0).getImplementation()==null || callsVm(candidates.get(0))) throw new IllegalArgumentException("Original SDK receiver unavailable: "+signature(method));
                var body = candidates.get(0).getImplementation();
                for (var i : body.getInstructions()) if (i instanceof ReferenceInstruction r) {
                    if (r.getReference() instanceof FieldReference f && target.containsKey(f.getDefiningClass()) && !hasField(target,f,f.getDefiningClass())) throw new IllegalArgumentException("SDK field incompatible: "+f);
                    if (r.getReference() instanceof MethodReference m && target.containsKey(m.getDefiningClass()) && !hasMethod(target,m,m.getDefiningClass(),new HashSet<>())) throw new IllegalArgumentException("SDK method incompatible: "+signature(m));
                }
                recovered.add(new ImmutableMethod(method.getDefiningClass(),method.getName(),method.getParameters(),method.getReturnType(),method.getAccessFlags(),method.getAnnotations(),method.getHiddenApiRestrictions(),body));
                count++; System.out.println("Recovered "+signature(method));
            }
            if (!recovered.isEmpty()) definitions.add(new ImmutableClassDef(cls.getType(),cls.getAccessFlags(),cls.getSuperclass(),cls.getInterfaces(),null,List.of(),List.of(),recovered));
        }
        if (count==0) throw new IllegalArgumentException("No matching protected receivers found");
        DexPool.writeTo(args[1],new ImmutableDexFile(Opcodes.getDefault(),definitions));
        System.out.println("Recovered SDK receivers: "+count);
    }
}
