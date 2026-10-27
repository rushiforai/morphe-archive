/* Read-only DEX evidence for ZenSMS port/regression verification. */
import java.io.*;
import java.nio.file.*;
import java.security.*;
import java.util.*;
import java.util.zip.*;
import com.google.gson.Gson;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

public class ZenSmsDex {
    static String id(MethodReference m) {
        return m.getDefiningClass()+"->"+m.getName()+"("+String.join("",m.getParameterTypes())+")"+m.getReturnType();
    }
    static Map<String,Object> instruction(Instruction i) throws Exception {
        Map<String,Object> out=new TreeMap<>(); out.put("op",i.getOpcode().name());
        Set<Class<?>> seen=new HashSet<>(); Deque<Class<?>> todo=new ArrayDeque<>(); todo.add(i.getClass());
        while(!todo.isEmpty()) {
            Class<?> c=todo.remove(); if(!seen.add(c))continue;
            todo.addAll(Arrays.asList(c.getInterfaces())); if(c.getSuperclass()!=null)todo.add(c.getSuperclass());
            if(!c.isInterface()||!c.getPackageName().startsWith("com.android.tools.smali.dexlib2.iface.instruction"))continue;
            for(var g:c.getDeclaredMethods()) {
                String n=g.getName(); if(!n.startsWith("get")||g.getParameterCount()!=0||n.equals("getOpcode")||n.equals("getCodeUnits"))continue;
                Object v=g.invoke(i); out.put(n.substring(3),v instanceof Number?v:String.valueOf(v));
            }
        }
        return out;
    }
    public static void main(String[] args)throws Exception {
        Gson gson=new Gson(); Map<String,Object> methods=new TreeMap<>(),classes=new TreeMap<>();
        try(ZipFile z=new ZipFile(args[0])) {
            for(var e:Collections.list(z.entries())) {
                if(!e.getName().matches("classes([0-9]+)?\\.dex"))continue;
                var dex=DexBackedDexFile.fromInputStream(null,new BufferedInputStream(z.getInputStream(e)));
                for(int ci=0;ci<dex.getClassSection().size();ci++) {
                    ClassDef c=dex.getClassSection().get(ci); if(classes.containsKey(c.getType()))throw new AssertionError("Duplicate "+c.getType());
                    List<String> fields=new ArrayList<>(); for(Field f:c.getFields())fields.add(f.getName()+":"+f.getType()+":"+f.getAccessFlags());
                    classes.put(c.getType(),Arrays.asList(c.getSuperclass(),c.getInterfaces(),fields));
                    for(Method m:c.getMethods()) {
                        Map<String,Object> data=new TreeMap<>(); data.put("flags",m.getAccessFlags());
                        var impl=m.getImplementation(); List<Object> insns=new ArrayList<>();
                        if(impl!=null) {data.put("registers",impl.getRegisterCount()); for(Instruction i:impl.getInstructions())insns.add(instruction(i));}
                        String encoded=gson.toJson(insns);
                        data.put("hash",HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(encoded.getBytes(java.nio.charset.StandardCharsets.UTF_8))));
                        if(args.length>2 && (id(m).matches(args[2])||encoded.matches("(?s).*(Text Size|is.your|tracking|SettingsSection|ConversationItem \\(|last_verified_time).*"))) {
                            data.put("instructions",insns);
                            List<Integer> units=new ArrayList<>(); if(impl!=null)for(Instruction i:impl.getInstructions())units.add(i.getCodeUnits());
                            data.put("units",units);
                        }
                        methods.put(id(m),data);
                    }
                }
            }
        }
        Files.writeString(Path.of(args[1]),gson.toJson(Map.of("classes",classes,"methods",methods)));
        System.out.println("Parsed "+classes.size()+" classes, "+methods.size()+" methods");
    }
}
