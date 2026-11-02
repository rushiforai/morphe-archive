import X.*; import java.util.*;

import app.morphe.extension.facebook.marketplace.MarketplaceOnly;
public class Test {
  static int fails=0;
  static void run(C2GO c,boolean hide){ MarketplaceOnly.capture(c); if(hide) MarketplaceOnly.onStartingTabDeterminedHideBar(); else MarketplaceOnly.onStartingTabDetermined(); }
  static void check(boolean ok,String m){ System.out.println((ok?"PASS ":"FAIL ")+m); if(!ok)fails++; }
  public static void main(String[] a){
    long MP=1606854132932955L, FEED=4748854339L;
    // 1: marketplace in the middle, feed selected -> switches by ID not position
    C2GO c=new C2GO(new C23681Hz(Arrays.asList(new X.FakeTab(FEED),new X.FakeTab(11L),new X.FakeTab(MP),new X.FakeTab(22L))));
    c.A01=0; c.A02=FEED;
    run(c,false);
    check(c.A01==2 && c.A02==MP,"selects Marketplace by id at index 2 (A01="+c.A01+")");
    check(c.A09.vis==0,"tab bar untouched when hide option off");
    // 2: different order
    c=new C2GO(new C23681Hz(Arrays.asList(new X.FakeTab(MP),new X.FakeTab(FEED))));
    c.A01=1; c.A02=FEED; run(c,true);
    check(c.A01==0 && c.A02==MP,"works when Marketplace is first");
    check(c.A09.vis==8,"tab bar hidden (GONE) in hide variant");
    // 3: marketplace absent -> no change at all
    c=new C2GO(new C23681Hz(Arrays.asList(new X.FakeTab(FEED),new X.FakeTab(11L))));
    c.A01=1; c.A02=11L; run(c,true);
    check(c.A01==1 && c.A02==11L && c.A09.vis==0,"no-op (incl. bar left visible) when Marketplace tab missing");
    // 4: garbage / null never throws
    MarketplaceOnly.capture(null); MarketplaceOnly.onStartingTabDetermined();
    MarketplaceOnly.capture(new Object()); MarketplaceOnly.onStartingTabDetermined();
    MarketplaceOnly.onStartingTabDeterminedHideBar();
    check(true,"null / wrong object does not throw");
    // 5: idempotent (A06 runs again on reset)
    c=new C2GO(new C23681Hz(Arrays.asList(new X.FakeTab(FEED),new X.FakeTab(MP))));
    run(c,false); run(c,false);
    check(c.A01==1,"idempotent on repeat call");
    // 6: blank strip. root 1080x2000; content, a short full-width bottom filler leaf, a small FAB-like leaf,
    //    the (now GONE) bar; the root has 147px bottom padding = the bar height (read from its LayoutParams).
    FakeView root=new FakeView(0,0,1080,2000); root.padB=147;
    FakeView content=new FakeView(0,0,1080,1850); content.add(new FakeView(0,0,1080,500));
    FakeView filler=new FakeView(0,1850,1080,1900);                 // 50px high, full width, bottom of content area?
    FakeView fab=new FakeView(900,1700,1040,1840);                  // not full width
    FakeView bar=new FakeView(0,1850,1080,1850); bar.lp.height=147;
    root.add(content).add(fab).add(bar).add(filler);
    filler.t=1803; filler.b=1853;                               // sits on the parent's bottom edge (2000-150 padding)
    C2GO c6=new C2GO(new C23681Hz(Arrays.asList(new X.FakeTab(FEED),new X.FakeTab(MP))), bar);
    c6.A01=0; c6.A02=FEED; run(c6,true);
    check(bar.vis==8 && bar.lp.height==0,"bar GONE and 0 high");
    check(filler.vis==8,"full-width short bottom leaf filler is hidden");
    check(fab.vis==0 && content.vis==0,"FAB-like (not full width) and content left alone");
    check(root.padB==0,"leftover bottom padding on bar's ancestor cleared (matches the remembered bar height)");
    // 7: once the bar height is known, only a matching padding/margin is cleared (keeps nav-bar inset padding)
    FakeView root2=new FakeView(0,0,1080,2000); root2.padB=63;       // e.g. gesture/nav inset, bar was 147 high
    FakeView bar2=new FakeView(0,1853,1080,2000); // getHeight()==147 before hide
    root2.add(new FakeView(0,0,1080,1853)).add(bar2);
    bar2.lp.bottomMargin=147;
    C2GO c7=new C2GO(new C23681Hz(Arrays.asList(new X.FakeTab(FEED),new X.FakeTab(MP))), bar2);
    run(c7,true);
    check(root2.padB==63,"padding that doesn't match the bar height is kept (nav inset)");
    check(bar2.lp.bottomMargin==0,"bottom margin equal to bar height is cleared");
    check(MarketplaceOnly.marketplaceHomeTabId()==1606854132932955L,"home tab id for back handling is Marketplace");
    // 8: return-to-app redirect: any requested tab index becomes Marketplace's index
    MarketplaceOnly.capturePager(new X.FakePager(FEED,11L,MP,22L));
    check(MarketplaceOnly.redirectTabIndex(0)==2,"Feed index (0) redirected to Marketplace index (2)");
    check(MarketplaceOnly.redirectTabIndex(3)==2,"another tab redirected to Marketplace");
    check(MarketplaceOnly.redirectTabIndex(2)==2,"Marketplace stays Marketplace");
    MarketplaceOnly.capturePager(new X.FakePager(FEED,11L));
    check(MarketplaceOnly.redirectTabIndex(1)==1,"Marketplace absent: requested index untouched");
    X.FakePager bad=new X.FakePager(FEED,MP); bad.throwing=true; MarketplaceOnly.capturePager(bad);
    check(MarketplaceOnly.redirectTabIndex(0)==0,"controller not ready (A04 throws): requested index untouched");
    MarketplaceOnly.capturePager(null);
    check(MarketplaceOnly.redirectTabIndex(5)==5,"no controller captured: requested index untouched");
    MarketplaceOnly.capturePager(new Object());
    check(MarketplaceOnly.redirectTabIndex(4)==4,"wrong object (no A04): requested index untouched");
    System.out.println(fails==0?"ALL PASS":"FAILURES: "+fails); System.exit(fails==0?0:1);
  }
}
