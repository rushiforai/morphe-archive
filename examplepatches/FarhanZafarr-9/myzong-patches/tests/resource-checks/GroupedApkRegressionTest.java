import app.zonghome.patches.CharcoalResources;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.*;
import java.nio.*;
import java.util.*;
import java.util.zip.*;

public final class GroupedApkRegressionTest {
    static byte[] read(ZipFile zip,String path)throws Exception {
        var entry=zip.getEntry(path);
        if(entry==null)throw new AssertionError("Missing resource: "+path);
        return zip.getInputStream(entry).readAllBytes();
    }
    static void check(boolean condition,String message) { if(!condition)throw new AssertionError(message); }
    static final List<String> HOME=List.of("cardSports","cardRamadan","cardFamilyBundle","cardViewMy5Banner",
        "streakView","fragmentBanners","fragmentEntertainmentMenuTray","layout5g","z_wallet_view","clStepCount",
        "layoutWeatherWaly","card_regional_offers","cardSms","tvTariff","btnLoan","btnRecharge","cardTray",
        "tv_myob","tv_bachat_bazar","tvZong4U","tvActiveInternetOffers");
    public static void main(String[] args)throws Exception {
        try(ZipFile original=new ZipFile(args[0]);ZipFile built=new ZipFile(args[1]);ZipFile bundle=new ZipFile(args[2])) {
            String profile=args[3];String variant=(profile.equals("visible") || profile.equals("icon-only"))?"dark":"light";
            var editor=new CharcoalResources();
            byte[] table=read(original,"resources.arsc");
            var ids=editor.viewIds(table,new HashSet<>(HOME));
            byte[] before=read(original,"res/layout/frag_home.xml"),after=read(built,"res/layout/frag_home.xml");
            for(String name:HOME) {
                int id=ids.get(name);
                if(!InitialVisibilityTest.views(before).containsKey(id))continue;
                int expected;
                if(profile.equals("visible") || profile.equals("icon-only"))expected=InitialVisibilityTest.visibility(before,id);
                else if(name.equals("btnRecharge"))expected=4;
                else if(profile.equals("light") && Set.of("tvTariff","btnLoan","cardTray").contains(name))
                    expected=InitialVisibilityTest.visibility(before,id);
                else expected=8;
                check(InitialVisibilityTest.visibility(after,id)==expected,"Wrong initial visibility: "+profile+" / "+name);
            }
            int iconId=editor.resourceIds(table,Set.of("ic_launcher_background"),"drawable").get("ic_launcher_background");
            byte[] expectedManifest=editor.launcherIconReferences(read(original,"AndroidManifest.xml"),iconId);
            check(Arrays.equals(expectedManifest,read(built,"AndroidManifest.xml")),"Launcher change modified unrelated manifest content");
            check(Arrays.equals(read(bundle,"branding/launcher-"+variant+".xml"),read(built,"res/drawable/ic_launcher_background.xml")),
                "Icon recolored by theme or wrong Light/Dark variant");
            if(profile.equals("icon-only")) {
                int splashId=0x7f0804f2;
                check(Arrays.equals(editor.drawableAlias(table,splashId,iconId),read(built,"resources.arsc")),"Icon-only changed unrelated table entries");
                check(Arrays.equals(before,after),"Deselected Home group changed layout");
                for(var entry:Collections.list(original.entries()))if(entry.getName().matches("classes[0-9]*\\.dex"))
                    check(Arrays.equals(read(original,entry.getName()),read(built,entry.getName())),"Icon-only patch changed bytecode");
                System.out.println("PASS: icon-only Dark preset; original Home XML, resource table and bytecode unchanged");
                return;
            }
            var actual=flags(built);
            boolean visible=profile.equals("visible");
            for(String name:List.of("hideSmsCard","hideTariff","hideLoanButton","hideShortcutCard")) {
                boolean expected=!visible && (!profile.equals("light") || name.equals("hideSmsCard"));
                check(actual.get(name)==expected,"Wrong runtime setting: "+profile+" / "+name);
            }
            check(actual.get("hideUsage")==profile.equals("hidden"),"Usage tab option ignored");
            check(actual.get("hideBundles")==profile.equals("hidden"),"Bundles tab option ignored");
            check(actual.get("hideNavigation")==profile.equals("hidden"),"Bottom bar option ignored");
            check(actual.get("startOnUsage")==profile.equals("hidden"),"Startup option ignored");
            check(actual.get("bundleControlsToggle")!=visible,"Controls button option ignored");
            check(actual.get("hideWhatsAppChannel")!=visible,"WhatsApp dialog option ignored");
            check(chatbotBlocked(built)!=visible,"Chatbot entry guard not conditional");
            System.out.println("PASS: "+profile+" Home visibility/runtime options, conditional chatbot guard, "+variant+" icon and manifest isolation");
        }
    }
    static Map<String,Boolean> flags(ZipFile apk)throws Exception {
        Map<String,Boolean> result=new HashMap<>();
        for(var entry:Collections.list(apk.entries())) {
            if(!entry.getName().matches("classes[0-9]*\\.dex"))continue;
            var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new BufferedInputStream(apk.getInputStream(entry)));
            for(var type:dex.getClasses()) {
                if(type.getType().equals("Lapp/zonghome/extension/StartupCover$Cover;")) {
                    boolean fixed=false;
                    for(var method:type.getMethods())if(method.getName().equals("<init>"))
                        for(var instruction:method.getImplementation().getInstructions()) {
                            if(instruction instanceof ReferenceInstruction named && named.getReference() instanceof com.android.tools.smali.dexlib2.iface.reference.StringReference literal && literal.getString().equals("wrap_splash_logo"))fixed=true;
                            if(instruction instanceof ReferenceInstruction ref && ref.getReference() instanceof com.android.tools.smali.dexlib2.iface.reference.FieldReference field)
                                check(!field.getDefiningClass().equals("Landroid/content/pm/ApplicationInfo;") || !field.getName().equals("icon"),
                                    "Startup cover must not inherit launcher preset");
                        }
                    check(fixed,"Startup cover must retain the native centered splash logo");
                }
                if(!Set.of("Lapp/zonghome/extension/NavigationStyle;","Lapp/zonghome/extension/PromotionControls;").contains(type.getType()))continue;
                for(var method:type.getMethods())if(method.getParameterTypes().isEmpty() && method.getReturnType().equals("Z")) {
                    var first=method.getImplementation().getInstructions().iterator().next();
                    result.put(method.getName(),((NarrowLiteralInstruction)first).getNarrowLiteral()!=0);
                }
            }
        }
        return result;
    }
    static boolean chatbotBlocked(ZipFile apk)throws Exception {
        for(var entry:Collections.list(apk.entries())) {
            if(!entry.getName().matches("classes[0-9]*\\.dex"))continue;
            var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new BufferedInputStream(apk.getInputStream(entry)));
            for(var type:dex.getClasses())if(type.getType().equals("Lcom/zong/customercare/HomeActivity;"))
                for(var method:type.getMethods())if(method.getName().equals("receiveFile") && method.getParameterTypes().isEmpty())
                    return method.getImplementation().getInstructions().iterator().next().getOpcode()==Opcode.RETURN_VOID;
        }
        throw new AssertionError("Chatbot entry method missing");
    }
}
