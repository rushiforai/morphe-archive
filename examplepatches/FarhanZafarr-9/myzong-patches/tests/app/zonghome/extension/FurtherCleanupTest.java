package app.zonghome.extension;
import android.view.View;
import android.view.ViewGroup;
import android.view.Menu;
import android.view.MenuItem;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
public class FurtherCleanupTest {
    private static int checks;
    private static void check(boolean value,String label) {checks++;if(!value)throw new AssertionError(label);}
    private static void install(View root,int flag) throws Exception {
        Method m=FurtherCleanup.class.getDeclaredMethod("install",View.class,int.class);
        m.setAccessible(true);m.invoke(null,root,flag);
    }
    public static class FakeNav extends View {
        final HashMap<Integer,Boolean> shown=new HashMap<>();
        final Menu menu=(Menu)Proxy.newProxyInstance(Menu.class.getClassLoader(),new Class[]{Menu.class},(p,m,a)-> {
            if(m.getName().equals("findItem")) {
                final int id=(Integer)a[0];
                if(!shown.containsKey(id))return null;
                return Proxy.newProxyInstance(MenuItem.class.getClassLoader(),new Class[]{MenuItem.class},(q,n,b)->{
                    if(n.getName().equals("isVisible"))return shown.get(id);
                    if(n.getName().equals("setVisible")){shown.put(id,(Boolean)b[0]);return q;}
                    return null;
                });
            }
            return null;
        });
        public Menu getMenu(){return menu;}
    }
    public static class ObfuscatedNav extends View {
        final FakeNav data=new FakeNav();
        public Menu a(){return data.menu;}
    }
    public static void main(String[] args) throws Exception {
        FurtherCleanup.hideWallet(null);
        View root=new View();
        View wallet=root.add("z_wallet_view",1),step=root.add("clStepCount",2);
        View weather=root.add("layoutWeatherWaly",3), arrow=root.add("imgWeatherExpend",4);
        View value=root.add("tvInternetRemaining",5),count=root.add("tvActiveInternetOffers",6);
        FurtherCleanup.hideWallet(root);
        check(wallet.getVisibility()==View.GONE,"Wallet hidden");
        check(step.getVisibility()==View.VISIBLE,"Step option independent");
        FurtherCleanup.hideSteps(root);FurtherCleanup.hideWeather(root);FurtherCleanup.hideOfferCounts(root);
        check(step.getVisibility()==View.GONE,"Step shortcut hidden");
        check(weather.getVisibility()==View.GONE && arrow.getVisibility()==View.GONE,"Weather and expand arrow hidden");
        check(value.getVisibility()==View.VISIBLE && count.getVisibility()==View.GONE,"Counts hidden but values retained");
        root.attach();wallet.setVisibility(View.VISIBLE);
        check(!root.getViewTreeObserver().draw(),"Async reveal cancels one draw");
        check(wallet.getVisibility()==View.GONE && root.getViewTreeObserver().draw(),"Hiding settles without a draw loop");
        View recharge=root.add("btnRecharge",90),loan=root.add("btnLoan",91);
        recharge.setLayoutParams(new ViewGroup.LayoutParams(180,60));
        FurtherCleanup.hideHomeRecharge(root);
        check(recharge.getVisibility()==View.INVISIBLE,"Recharge hides without removing the loan width anchor");
        check(recharge.getLayoutParams().width==180,"Recharge anchor keeps its measured-width input");
        check(loan.getVisibility()==View.VISIBLE,"Loan action remains visible");
        recharge.setVisibility(View.VISIBLE);root.getViewTreeObserver().draw();
        check(recharge.getVisibility()==View.INVISIBLE,"Async recharge updates preserve its invisible anchor");
        check(root.getViewTreeObserver().draw(),"Anchor correction settles without draw loop");
        View drawerRoot=new View();FakeNav drawer=new FakeNav();drawerRoot.addView("nav_view",100,drawer);
        String[] removed={"pressRelease","fragFindUs","fragContactUs","fragvideotut","fragFaq","fragFeedback"};
        for(int i=0;i<removed.length;i++){drawerRoot.add(removed[i],110+i);drawer.shown.put(110+i,true);}
        drawerRoot.add("fragProfile",120);drawer.shown.put(120,true);
        install(drawerRoot,131072);
        for(int i=0;i<removed.length;i++)check(!drawer.shown.get(110+i),"Requested drawer link hidden: "+removed[i]);
        check(drawer.shown.get(120),"Drawer cleanup retains My Profile");
        drawerRoot.attach();check(drawerRoot.getViewTreeObserver().draw(),"Drawer cleanup is idempotent");
        View tray=root.add("cardTray",7),regional=root.add("card_regional_offers",8);
        ViewGroup.MarginLayoutParams a=new ViewGroup.MarginLayoutParams(100,80),b=new ViewGroup.MarginLayoutParams(100,80);
        a.topMargin=3;b.topMargin=64;tray.setLayoutParams(a);regional.setLayoutParams(b);
        FurtherCleanup.spaceHomeSections(root);
        check(a.topMargin==48,"24dp minimum respects density");
        check(b.topMargin==64,"Larger existing margin retained");
        check(root.getViewTreeObserver().draw(),"Spacing changes are idempotent");
        FurtherCleanup.hideCityOffers(root);
        check(regional.getVisibility()==View.GONE,"Regional offers have an independent hide switch");
        View chatRoot=new View();
        View launcher=chatRoot.add("ivChatbot",80),overlay=chatRoot.add("chatbotOverlay",81);
        View dialog=chatRoot.add("clChatView",82),unrelated=chatRoot.add("bottomNav",83);
        install(chatRoot,8192);
        check(launcher.getVisibility()==View.GONE && overlay.getVisibility()==View.GONE && dialog.getVisibility()==View.GONE,
                "Chat launcher and overlay are hidden together");
        check(unrelated.getVisibility()==View.VISIBLE,"Chat hide switch does not hide navigation");
        View usage=new View(),banner=usage.add("cvBanner",10),promo=usage.add("layoutAdaptiveParentAd",11);
        View summary=usage.add("rvSummary",12);
        FurtherCleanup.hideUsageBanner(usage);
        check(banner.getVisibility()==View.GONE && promo.getVisibility()==View.VISIBLE,"Usage removals independent");
        FurtherCleanup.hideUsagePromotions(usage);
        check(summary.getVisibility()==View.VISIBLE && promo.getVisibility()==View.GONE,"Usage data retained");
        for(int flags=0;flags<8;flags++) {
            int[] visible=FurtherCleanup.visibleShortcuts(flags<<3);
            check(visible.length==3-Integer.bitCount(flags),"All eight shortcut selection combinations");
            int previous=-1;
            for(int i:visible){check(i>previous && (flags&(1<<i))==0,"Shortcut order and membership");previous=i;}
        }
        View rowRoot=new View(),row=rowRoot.add("card_view_myob",30);
        FurtherCleanup.hideMyob(rowRoot);FurtherCleanup.hideBachat(rowRoot);
        check(row.getVisibility()==View.VISIBLE,"Row retained while any shortcut is selected");
        FurtherCleanup.hideZong4u(rowRoot);
        check(row.getVisibility()==View.GONE,"All three hidden collapses entire row");
        View activityRoot=new View();FakeNav nav=new FakeNav();activityRoot.addView("bottomNav",1,nav);
        activityRoot.getResources().register("fragMore",101);activityRoot.getResources().register("fragZClub",102);
        nav.shown.put(101,true);nav.shown.put(102,true);nav.shown.put(103,true);
        install(activityRoot,1024);
        check(!nav.shown.get(101) && nav.shown.get(102),"More can be hidden independently");
        install(activityRoot,2048);
        check(!nav.shown.get(102) && nav.shown.get(103),"Z Play hidden; unrelated tab retained");
        activityRoot.attach();nav.shown.put(101,true);activityRoot.getViewTreeObserver().draw();
        check(!nav.shown.get(101),"Menu refresh cannot reveal selected tab");
        View renamedRoot=new View();ObfuscatedNav renamed=new ObfuscatedNav();
        renamedRoot.addView("bottomNav",1,renamed);renamedRoot.getResources().register("fragMore",101);
        renamed.data.shown.put(101,true);install(renamedRoot,1024);
        check(!renamed.data.shown.get(101),"Renamed Material menu getter resolved by framework return type");
        root.detach();
        check(root.getViewTreeObserver().listeners.isEmpty(),"Observer detached");
        root.attach();
        check(root.getViewTreeObserver().listeners.size()==1,"One observer on reattach");
        System.out.println("PASS: "+checks+" second-pass behavior checks; Android rendering still needs phone testing");
    }
}
