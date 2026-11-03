import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.nio.file.*;
import java.util.*;

/** Offline developer tool: convert measured legacy selections into reviewed fixed bindings. */
public final class BuildChmateClassBindings {
    static boolean externalLaunch(ClassDef cls){
        for(var method:cls.getMethods())if(method.getImplementation()!=null)
            for(var instruction:method.getImplementation().getInstructions())
                if(instruction instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref){
                    var params=ref.getParameterTypes().stream().map(Object::toString).toList();
                    boolean launch=ref.getName().equals("startActivity")&&params.equals(List.of("Landroid/content/Intent;"));
                    boolean result=ref.getName().equals("startActivityForResult")&&params.equals(List.of("Landroid/content/Intent;","I"));
                    if((launch||result)&&ref.getReturnType().equals("V")&&Set.of("Landroid/content/Context;","Landroid/app/Activity;","Landroidx/fragment/app/Fragment;").contains(ref.getDefiningClass()))return true;
                }
        return false;
    }
    public static void main(String[] args)throws Exception{
        var classes=VerifyViewingUserAgentHooks.load(args[0]);
        var bindings=new TreeMap<String,LinkedHashSet<String>>();
        for(String line:Files.readAllLines(Path.of(args[1]))){
            int start=line.indexOf("CLASS_BINDING_BEGIN|");
            if(start>=0)bindings.computeIfAbsent(line.substring(start+20).trim(),x->new LinkedHashSet<>());
            start=line.indexOf("CLASS_BINDING|");
            if(start>=0){var parts=line.substring(start).split("\\|",3);bindings.computeIfAbsent(parts[1],x->new LinkedHashSet<>()).add(parts[2].trim());}
        }
        // Legacy code eagerly materializes every native class before checking launch calls.
        // Keep only actual boundary owners; retain all native calls inside each selected owner.
        var launches=bindings.get("HaiagaruPatch:9");
        if(launches!=null)launches.removeIf(type->!externalLaunch(Objects.requireNonNull(classes.get(type),type)));
        // The touch patch needs ancestors for its inheritance check, not a global class map.
        var touch=bindings.get("XPostPreviewPatch:2");
        if(touch!=null)for(String type:List.copyOf(touch)){
            ClassDef cls=classes.get(type);
            while(cls!=null&&cls.getSuperclass()!=null){String parent=cls.getSuperclass();cls=classes.get(parent);if(cls!=null)touch.add(parent);}
        }
        // The BE worker is read-only: its class name is bound into an extension
        // getter, so mutable-owner tracing alone cannot observe its selection.
        var patched=VerifyViewingUserAgentHooks.load(args[3]);
        var be=patched.get("Lapp/morphe/extension/chmate/BeAutoLogout;");
        if(be!=null&&bindings.containsKey("BeAutoLogoutPatch:1")){
            String worker=null;
            for(var method:be.getMethods())if(method.getName().equals("nativeWorker")&&method.getImplementation()!=null)
                for(var instruction:method.getImplementation().getInstructions())
                    if(instruction instanceof ReferenceInstruction r&&r.getReference() instanceof StringReference value
                            &&(value.getString().startsWith("o.")||value.getString().startsWith("jp.syoboi.")))worker="L"+value.getString().replace('.','/')+";";
            if(worker==null||!classes.containsKey(worker))throw new AssertionError("BE worker binding missing");
            bindings.get("BeAutoLogoutPatch:1").add(worker);
        }
        var out=new ArrayList<String>();out.add("# Exact class bindings from verified ChMate APK; preserve selection order.");
        for(var entry:bindings.entrySet()){
            out.add("["+entry.getKey()+"]");out.addAll(entry.getValue());
        }
        Files.createDirectories(Path.of(args[2]).getParent());Files.write(Path.of(args[2]),out);
        System.out.println("Generated "+args[2]+": "+bindings.size()+" operations, "+bindings.values().stream().mapToInt(Set::size).sum()+" class references");
    }
}
