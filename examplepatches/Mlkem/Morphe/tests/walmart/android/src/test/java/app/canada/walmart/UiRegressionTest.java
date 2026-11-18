package app.canada.walmart;

import android.app.*;import android.view.*;import android.widget.*;import android.os.Looper;
import com.walmart.glass.lists.domain.*;
import com.walmart.glass.lists.view.lists.ListDetailTileView;
import org.junit.*;import org.junit.runner.RunWith;
import org.robolectric.*;import org.robolectric.annotation.Config;import org.robolectric.shadows.ShadowAlertDialog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=35)
public class UiRegressionTest {
 Activity activity;ListDetailTileView tile;ListItemProduct product;
 public static class Holder {public View itemView;Holder(View v){itemView=v;}}
 public static class Section {public String a="";public boolean b;}
 public static class Price {public String a="$5.00";public Double b=5.0;public boolean o,B;}
 public static class Data {public String j="product",i="item",g="offer",k="seller",z="EACH",t="PICKUP";}
 public static class BrowseModel {public Price price=new Price();public Data data=new Data();public Price U(){return price;}public Data getData(){return data;}}
 @Before public void setup(){activity=Robolectric.buildActivity(Activity.class).setup().get();HistoryStore.data(activity).edit().clear().commit();HistoryStore.meta(activity).edit().clear().commit();PatchStatus.counts.clear();PatchStatus.installed.clear();PatchStatus.errors.clear();ToolSettings.prefs(activity).edit().clear().commit();AdCleaner.candidates.clear();tile=new ListDetailTileView(activity);activity.setContentView(tile);product=new ListItemProduct("A2");}
 void bind(){TileHooks.history(new Holder(tile),new ListItem.ListDetailItem(product));}
 void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
 Button button(){return (Button)tile.getTag(0x7e010011);}
 @Test public void hiddenNativePriceStillGetsHistoryAndClickableFooter(){
  bind();idle();assertEquals(1,HistoryStore.keys(activity).size());assertTrue(button().getText().toString().contains("1 saved"));assertEquals(View.GONE,tile.findViewById(ListDetailTileView.PRICE).getVisibility());
  ListDetailTileView.Params original=(ListDetailTileView.Params)tile.findViewById(ListDetailTileView.UNIT).getLayoutParams();assertEquals(-1,original.l);assertEquals(button().getId(),original.k);
  assertTrue(button().performClick());assertNotNull(ShadowAlertDialog.getLatestAlertDialog());assertTrue(PatchStatus.errors.toString(),PatchStatus.errors.isEmpty());
 }
 @Test public void recycledBeforePostedBindRecordsOnlyCurrentProduct(){bind();product=new ListItemProduct("B4");product.n="item-2";product.o="Second item";bind();idle();assertEquals(1,HistoryStore.keys(activity).size());String key=HistoryStore.keys(activity).get(0);assertEquals("Second item",HistoryStore.meta(activity).getString(key+"_name",""));}
 @Test public void recycledMissingPriceClearsOldButtonActionAndPrice(){bind();idle();product.A=null;bind();idle();assertTrue(button().getText().toString().contains("unavailable"));assertFalse(button().getText().toString().contains("$5"));assertEquals(1,HistoryStore.keys(activity).size());}
 @Test public void repeatedBindAddsOnlyOneFooterAndSameDayObservation(){bind();idle();int n=tile.getChildCount();bind();idle();assertEquals(n,tile.getChildCount());String key=HistoryStore.keys(activity).get(0);assertEquals(1,PriceLedger.decode(HistoryStore.data(activity).getString(key,"")).size());}
 @Test public void priceChangeCreatesSecondObservation(){bind();idle();product.A.f=4.5;bind();idle();String key=HistoryStore.keys(activity).get(0);assertEquals(2,PriceLedger.decode(HistoryStore.data(activity).getString(key,"")).size());assertTrue(button().getText().toString().contains("↓"));}
 @Test public void hidesWholeSponsoredCardAndRestoresOrganicRecycle(){View card=new View(activity);card.setLayoutParams(new FrameLayout.LayoutParams(200,120));card.setMinimumHeight(80);Section s=new Section();s.a="Sponsored";AdCleaner.sponsored(card,s);assertEquals(View.GONE,card.getVisibility());assertEquals(0,card.getLayoutParams().height);s.a="";AdCleaner.sponsored(card,s);assertEquals(View.VISIBLE,card.getVisibility());assertEquals(120,card.getLayoutParams().height);assertEquals(200,card.getLayoutParams().width);assertEquals(80,card.getMinimumHeight());}
 @Test public void dedicatedContainerStaysHiddenAfterNativeVisibilityReset(){View ad=new View(activity);ad.setLayoutParams(new FrameLayout.LayoutParams(300,100));AdCleaner.dedicated(ad);ad.setVisibility(View.VISIBLE);ad.getLayoutParams().height=100;AdCleaner.Hidden state=(AdCleaner.Hidden)ad.getTag(AdCleaner.STATE);assertFalse(state.onPreDraw());assertEquals(View.GONE,ad.getVisibility());assertEquals(0,ad.getLayoutParams().height);assertTrue(state.onPreDraw());}
 @Test public void oldHistorySurvivesAndCollectionIsBounded(){HistoryStore.data(activity).edit().putString("p_legacy","1700000000000,500;").commit();assertTrue(HistoryStore.keys(activity).contains("p_legacy"));for(int i=0;i<130;i++)HistoryStore.record(activity,"p_"+i,"Item "+i,"Store","Seller",500);assertEquals(128,HistoryStore.keys(activity).size());}
 @Test public void patchToolsShowsInstalledSeparatelyFromRuntimeActivity(){PatchStatus.history();PatchStatus.show(activity);assertNotNull(ShadowAlertDialog.getLatestAlertDialog());assertTrue(PatchStatus.counts.isEmpty());assertTrue(ToolsPanel.report(activity).contains("Personal Price History"));}

 @Test public void visibleBrowseCardRecordsPriceAndUsesSeparateContext(){BrowseModel m=new BrowseModel();ListEnhancements.bindBrowse(tile,m);idle();assertEquals(1,HistoryStore.keys(activity).size());String k=HistoryStore.keys(activity).get(0);assertTrue(HistoryStore.meta(activity).getString(k+"_scope","").startsWith("Browse"));assertTrue(PatchStatus.errors.toString(),PatchStatus.errors.isEmpty());}
 @Test public void hiddenSponsoredBrowseCardDoesNotCreatePriceHistory(){AdCleaner.dedicated(tile);ListEnhancements.bindBrowse(tile,new BrowseModel());idle();assertTrue(HistoryStore.keys(activity).isEmpty());}
 @Test public void pausedListRecordingKeepsHistoryAccessibleWithoutSaving(){ToolSettings.set(activity,"record",false);bind();idle();assertTrue(HistoryStore.keys(activity).isEmpty());assertTrue(button().getText().toString().contains("paused"));assertTrue(button().performClick());assertNotNull(ShadowAlertDialog.getLatestAlertDialog());}
 @Test public void browseRecordingSwitchPreventsNewObservations(){ToolSettings.set(activity,"record_browse",false);ListEnhancements.bindBrowse(tile,new BrowseModel());idle();assertTrue(HistoryStore.keys(activity).isEmpty());}
}
