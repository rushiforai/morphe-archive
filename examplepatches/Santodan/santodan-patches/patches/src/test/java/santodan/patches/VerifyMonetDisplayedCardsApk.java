package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.iface.*;
import java.util.*;
import java.util.zip.*;

/** Validate the Desktop-rebuilt standalone APK, including unrelated file contents. */
public final class VerifyMonetDisplayedCardsApk {
    public static void main(String[] args) throws Exception {
        var originals=VerifyMonet.read(args[0]);
        var contracts=MonetDisplayedCardsPatch.validate(originals);
        Map<String,ClassDef> types=new HashMap<>();originals.forEach(c->types.put(c.getType(),c));
        Set<String> seen=new HashSet<>();int hooks=0,extension=0;
        for(ClassDef c:VerifyMonet.read(args[1])) {
            VerifyMonetCatalog.require(seen.add(c.getType()),"Duplicate APK class "+c.getType());
            ClassDef before=types.get(c.getType());
            if(before==null) {
                VerifyMonetCatalog.require(c.getType().startsWith("Lsoftware/santodan/extension/monetcards/"),"Unexpected APK class "+c.getType());extension++;continue;
            }
            Map<String,Method> methods=new HashMap<>();before.getMethods().forEach(m->methods.put(m.toString(),m));
            int count=0;
            for(Method m:c.getMethods()) {
                count++;Method old=methods.get(m.toString());VerifyMonetCatalog.require(old!=null,"Unexpected native method "+m);
                if(MonetDisplayedCardsPatch.TARGETS.contains(m.toString())) {
                    VerifyMonetDisplayedCards.mutation(contracts.get(m.toString()),m);hooks++;
                } else if(old.getImplementation()!=null) VerifyMonetCatalog.require(
                    NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(old)).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(m))),"Unrelated APK method changed "+m);
            }
            VerifyMonetCatalog.require(count==methods.size(),"Native methods lost");
        }
        VerifyMonetCatalog.require(hooks==5&&extension>0&&seen.containsAll(types.keySet()),"APK hooks/class set incomplete");
        int unchanged=0;
        try(var original=new ZipFile(args[0]);var apk=new ZipFile(args[1])) {
            for(var entry:Collections.list(original.entries())) {
                String name=entry.getName();if(entry.isDirectory()||name.startsWith("META-INF/")||name.matches("classes[0-9]*\\.dex"))continue;
                var actual=apk.getEntry(name);VerifyMonetCatalog.require(actual!=null,"APK file missing "+name);
                try(var a=original.getInputStream(entry);var b=apk.getInputStream(actual)) {
                    VerifyMonetCatalog.require(Arrays.equals(a.readAllBytes(),b.readAllBytes()),"Unrelated APK file changed "+name);
                }
                unchanged++;
            }
        }
        System.out.println("PASS: rebuilt APK retains "+types.size()+" native classes, adds only "+extension+" adapter classes, preserves all unrelated methods and "+unchanged+" non-DEX files; five hooks survive rebuild");
    }
}
