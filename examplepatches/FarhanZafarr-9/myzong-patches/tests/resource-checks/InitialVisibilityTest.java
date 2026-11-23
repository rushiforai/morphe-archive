import app.zonghome.patches.CharcoalResources;
import kotlin.Pair;
import java.nio.*;
import java.util.*;
import java.util.zip.*;
public final class InitialVisibilityTest {
    static int checks;
    static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    static int u16(ByteBuffer b,int p){return Short.toUnsignedInt(b.getShort(p));}
    static Map<Integer,Map<Integer,Integer>> views(byte[] bytes) {
        ByteBuffer b=ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        int[] resources=null;Map<Integer,Map<Integer,Integer>> result=new LinkedHashMap<>();
        for(int p=u16(b,2);p<bytes.length;p+=b.getInt(p+4)) {
            int type=u16(b,p);
            if(type==0x180){resources=new int[(b.getInt(p+4)-8)/4];for(int i=0;i<resources.length;i++)resources[i]=b.getInt(p+8+i*4);}
            if(type!=0x102)continue;
            int first=p+16+u16(b,p+24),stride=u16(b,p+26),count=u16(b,p+28),id=0;
            Map<Integer,Integer> attrs=new LinkedHashMap<>();
            for(int i=0;i<count;i++) {
                int at=first+i*stride,name=b.getInt(at+4);
                int resource=resources!=null && name>=0 && name<resources.length?resources[name]:0;
                if(resource==0x010100d0)id=b.getInt(at+16);
                if(resource!=0)attrs.put(resource,b.getInt(at+16));
            }
            if(id!=0)result.put(id,attrs);
        }
        return result;
    }
    static int visibility(byte[] xml,int id){return views(xml).get(id).getOrDefault(0x010100dc,0);}
    static void onlyTargetChanges(byte[] before,byte[] after,Set<Integer> targets) {
        Map<Integer,Map<Integer,Integer>> a=views(before),b=views(after);
        check(a.keySet().equals(b.keySet()),"View inventory unchanged");
        for(int id:a.keySet()) {
            Map<Integer,Integer> left=new LinkedHashMap<>(a.get(id)),right=new LinkedHashMap<>(b.get(id));
            if(targets.contains(id)){left.remove(0x010100dc);right.remove(0x010100dc);}
            check(left.equals(right),"Unrelated attributes changed for "+Integer.toHexString(id));
        }
    }
    public static void main(String[] args)throws Exception {
        byte[] table,home;
        try(ZipFile apk=new ZipFile(args[0])) {
            table=apk.getInputStream(apk.getEntry("resources.arsc")).readAllBytes();
            home=apk.getInputStream(apk.getEntry("res/layout/frag_home.xml")).readAllBytes();
        }
        byte[] untouched=home.clone();CharcoalResources editor=new CharcoalResources();
        Map<String,Integer> ids=editor.viewIds(table,Set.of("z_wallet_view","btnRecharge","btnLoan","card_view_myob","tv_myob","tv_bachat_bazar","tvZong4U"));
        int wallet=ids.get("z_wallet_view"),recharge=ids.get("btnRecharge"),loan=ids.get("btnLoan"),card=ids.get("card_view_myob");
        byte[] hidden=editor.initialVisibility(home,Map.of(wallet,8),null);
        check(visibility(hidden,wallet)==8,"Wallet starts GONE");onlyTargetChanges(home,hidden,Set.of(wallet));
        check(Arrays.equals(hidden,editor.initialVisibility(hidden,Map.of(wallet,8),null)),"Repeated initial hiding is idempotent");
        byte[] anchor=editor.initialVisibility(home,Map.of(recharge,4),null);
        check(visibility(anchor,recharge)==4,"Recharge starts INVISIBLE, preserving loan anchor");
        check(views(home).get(loan).equals(views(anchor).get(loan)),"Loan attributes untouched");onlyTargetChanges(home,anchor,Set.of(recharge));
        Set<Integer> shortcuts=Set.of(ids.get("tv_myob"),ids.get("tv_bachat_bazar"),ids.get("tvZong4U"));
        Pair<Integer,Set<Integer>> collapse=new Pair<>(card,shortcuts);
        byte[] partial=editor.initialVisibility(home,Map.of(ids.get("tv_myob"),8),collapse);
        check(visibility(partial,card)!=8,"One hidden shortcut keeps its section visible");
        partial=editor.initialVisibility(partial,Map.of(ids.get("tv_bachat_bazar"),8),collapse);
        check(visibility(partial,card)!=8,"Two hidden shortcuts keep the third available");
        byte[] full=editor.initialVisibility(partial,Map.of(ids.get("tvZong4U"),8),collapse);
        check(visibility(full,card)==8,"All three hidden shortcuts collapse their section before inflation");
        check(Arrays.equals(home,untouched),"Original resource bytes not mutated");
        if(args.length>1) {
            byte[] built;
            try(ZipFile apk=new ZipFile(args[1])){built=apk.getInputStream(apk.getEntry("res/layout/frag_home.xml")).readAllBytes();}
            String[] hiddenNames={"cardSports","cardRamadan","cardFamilyBundle","cardViewMy5Banner","streakView","layout7DaysStreak","cardViewStreak","cardViewStreakDetail",
                "fragmentBanners","fragmentBannersNew","fragmentEntertainmentMenuTray","layoutAdaptiveParentAd","tvBanner","cardViewFlashSale","ribbon","tvFlashSale","timeRemaining","tvTime","tvRemaining","fragmentHotOffers","layout5g","z_wallet_view","clStepCount","fragment_step_counter","layoutWeatherWaly","imgWeatherExpend",
                "tv_myob","iv_myob","view_purple","tv_bachat_bazar","iv_bachat_bazar","viewBachatBazar","tvZong4U","ivZong4U","viewZong4U","tvActiveInternetOffers","tvActiveVoiceOffers","tvActiveSmsOffers","card_regional_offers","card_view_myob"};
            Map<String,Integer> finalIds=editor.viewIds(table,new HashSet<>(Arrays.asList(hiddenNames)));
            Map<Integer,Map<Integer,Integer>> baseViews=views(home);
            for(String name:hiddenNames)if(baseViews.containsKey(finalIds.get(name)))check(visibility(built,finalIds.get(name))==8,"Built APK must initially hide "+name);
            check(visibility(built,recharge)==4,"Built APK preserves invisible Recharge anchor");
            check(views(built).get(loan).equals(views(home).get(loan)),"Built APK retains loan button constraints");
        }
        System.out.println("PASS: "+checks+" binary-XML checks, optional hiding, anchor preservation and shortcut collapse");
    }
}
