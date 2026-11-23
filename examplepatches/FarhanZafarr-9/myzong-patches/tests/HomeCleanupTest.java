import android.view.View;
import app.zonghome.extension.HomeCleanup;
public class HomeCleanupTest {
    private static int checks;
    private static void check(boolean condition,String message) {
        checks++;
        if(!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        HomeCleanup.hideMatch(null);
        View root=new View();
        View match=root.add("cardSports",1), prayer=root.add("cardRamadan",2);
        View balance=root.add("tvBalance",3), family=root.add("cardFamilyBundle",4);
        View familyBanner=root.add("cardViewMy5Banner",5), streak=root.add("streakView",6);
        View sevenDay=root.add("layout7DaysStreak",7), promo=root.add("fragmentBanners",8);
        View entertainment=root.add("fragmentEntertainmentMenuTray",9), fiveG=root.add("layout5g",10);
        HomeCleanup.hideMatch(root);
        check(match.getVisibility()==View.GONE,"Selected card hidden before attach");
        check(prayer.getVisibility()==View.VISIBLE,"Unselected group remains visible");
        check(balance.getVisibility()==View.VISIBLE,"Balance remains visible");
        root.attach();
        check(root.getViewTreeObserver().listeners.size()==1,"One observer after attach");
        match.setVisibility(View.VISIBLE);
        check(!root.getViewTreeObserver().draw(),"Revealed target triggers layout before draw");
        check(match.getVisibility()==View.GONE,"Async visibility update suppressed");
        check(root.getViewTreeObserver().draw(),"Stable UI may draw; no perpetual cancellation");
        HomeCleanup.hidePrayers(root); HomeCleanup.hideFamily(root); HomeCleanup.hideStreaks(root);
        HomeCleanup.hidePromotions(root); HomeCleanup.hide5g(root); HomeCleanup.hideMatch(root);
        for(View v:new View[]{prayer,family,familyBanner,streak,sevenDay,promo,entertainment,fiveG})
            check(v.getVisibility()==View.GONE,"Selected group target hidden");
        check(balance.getVisibility()==View.VISIBLE,"Core view still retained with all groups");
        check(root.getViewTreeObserver().listeners.size()==1,"Groups share one observer");
        root.detach();
        check(root.getViewTreeObserver().listeners.isEmpty(),"Observer removed on detach");
        root.attach();
        check(root.getViewTreeObserver().listeners.size()==1,"Observer restored once on reattach");
        View other=new View(); View otherMatch=other.add("cardSports",1); other.attach();
        HomeCleanup.hide5g(other);
        check(otherMatch.getVisibility()==View.VISIBLE,"Roots and option masks are independent");
        check(other.getViewTreeObserver().draw(),"Missing optional IDs are tolerated");
        System.out.println("PASS: "+checks+" helper behavior checks (JVM view doubles; not device verification)");
    }
}
