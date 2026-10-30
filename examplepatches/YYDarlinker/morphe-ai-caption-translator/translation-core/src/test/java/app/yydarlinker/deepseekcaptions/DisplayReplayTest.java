package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Replays plans captured on a phone (diagnostics quality evidence, with real word times) through
 * the display partition and cursor, the same calls render() makes. Playback is continuous, so
 * every shown page must start right after the previous one and no source token may appear twice.
 */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
public class DisplayReplayTest {
  static final CaptionLanguageContext CONTEXT=CaptionLanguageContext.explicit("en","zh-Hans");

  static final class Capture {
    final RebuildSource source;
    final TreeMap<Integer,RebuildPlanner.Block> blocks=new TreeMap<>();
    final TreeMap<Integer,List<RebuildProtocol.Plan>> plans=new TreeMap<>();
    Capture(RebuildSource source){this.source=source;}
  }

  static Capture load(String name) throws Exception {
    List<JSONObject> rows=new ArrayList<>();
    try(BufferedReader in=new BufferedReader(new InputStreamReader(
        DisplayReplayTest.class.getResourceAsStream("/display/"+name),StandardCharsets.UTF_8))) {
      for(String line;(line=in.readLine())!=null;)if(!line.isEmpty())rows.add(new JSONObject(line));
    }
    List<RebuildSource.Word> words=new ArrayList<>(RebuildR28CapturedTest.source().words);
    for(JSONObject row:rows) {
      JSONObject p=row.getJSONObject("payload");
      JSONArray tokens=p.getJSONArray("owned_tokens"),times=p.getJSONArray("diagnostic_only_source_times");
      for(int j=0;j<tokens.length();j++) {
        JSONArray t=tokens.getJSONArray(j),m=times.getJSONArray(j);
        assertEquals(words.get(t.getInt(0)).text,t.getString(1));
        words.set(t.getInt(0),new RebuildSource.Word(t.getString(1),m.getLong(1),m.getLong(2),m.getInt(3),
            RebuildSource.Precision.valueOf(m.getString(4))));
      }
    }
    Capture capture=new Capture(new RebuildSource(words));
    for(JSONObject row:rows) {
      String[] id=row.getJSONObject("payload").getString("block").substring(1).split("_");
      int index=Integer.parseInt(id[0]);
      RebuildPlanner.Block block=new RebuildPlanner.Block(index,Integer.parseInt(id[1]),Integer.parseInt(id[2]),capture.source);
      capture.blocks.put(index,block);
      capture.plans.computeIfAbsent(index,k->new ArrayList<>())
          .add(RebuildProtocol.parseBound(row.getString("response"),capture.source,block,CONTEXT));
    }
    return capture;
  }

  static final class Page {
    final RebuildDisplayGroups.Unit unit;final long shownAt;
    Page(RebuildDisplayGroups.Unit unit,long shownAt){this.unit=unit;this.shownAt=shownAt;}
    public String toString(){return String.format(Locale.ROOT,"%7.2fs %-12s %s",shownAt/1000.0,unit.id(),unit.text);}
  }

  /** Two lines of about 23 CJK columns, as measured on the phone in both captured sessions. */
  static boolean fits(String value){return CONTEXT.renderSpec.lineUnits(value)<=46;}

  /** Continuous playback; {@code repairs} maps block -> playback time when its later plan arrived. */
  static List<Page> replay(Capture c,int first,int last,Map<Integer,Long> repairs) {
    CaptionRenderSpec spec=CONTEXT.renderSpec;
    RebuildDisplayGroups.Cursor cursor=new RebuildDisplayGroups.Cursor();
    Map<Integer,RebuildProtocol.Plan> plans=new HashMap<>(),pending=new HashMap<>();
    for(int i=first;i<=last;i++)plans.put(i,c.plans.get(i).get(0));
    List<Page> pages=new ArrayList<>();
    for(long t=c.blocks.get(first).start;t<c.blocks.get(last).end;t+=40) {
      int index=-1;
      for(int i=first;i<=last;i++)if(c.blocks.get(i).start<=t&&t<c.blocks.get(i).end)index=i;
      if(index<0)continue;
      for(Map.Entry<Integer,Long> repair:repairs.entrySet())
        if(t<=repair.getValue()&&repair.getValue()<t+40) {
          RebuildProtocol.Plan later=c.plans.get(repair.getKey()).get(c.plans.get(repair.getKey()).size()-1);
          if(cursor.shownIn(repair.getKey()))pending.put(repair.getKey(),later);else plans.put(repair.getKey(),later);
        }
      RebuildProtocol.Plan waiting=pending.get(index);
      if(waiting!=null&&!(cursor.onScreen(index,t)&&!cursor.keepsShown(index,waiting))&&cursor.continues(index,waiting)) {
        plans.put(index,waiting);pending.remove(index);
      }
      RebuildProtocol.Plan plan=plans.get(index);
      List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(index,plan.events,c.source,CONTEXT,
          DisplayReplayTest::fits,null);
      RebuildDisplayGroups.Unit unit=cursor.select(index,plan.events,units,t);
      if(unit==null||unit.blocked||unit.text.isEmpty())continue;
      if(pages.isEmpty()||pages.get(pages.size()-1).unit!=unit)pages.add(new Page(unit,t));
      cursor.shown(unit);
    }
    return pages;
  }

  static void assertContinuous(String label,List<Page> pages,Capture c,int first,int last) {
    int next=c.blocks.get(first).from;
    Set<Integer> shown=new HashSet<>();
    StringBuilder report=new StringBuilder();
    for(Page page:pages) {
      report.append(page).append('\n');
      assertEquals(label+": page must continue right after the previous one: "+page,next,page.unit.from);
      for(int token=page.unit.from;token<=page.unit.to;token++)assertTrue(label+": token shown twice "+token,shown.add(token));
      next=page.unit.to+1;
      // Text is joined, never edited: each accepted event's text appears inside its page.
      for(RebuildProtocol.Event e:page.unit.events)assertTrue(page.unit.text.contains(e.text.trim()));
      assertTrue(label+": page must be visible at its own start",page.shownAt>=page.unit.start-40);
    }
    assertEquals(label+": playback must reach the end of the replayed blocks",c.blocks.get(last).to+1,next);
    System.out.println("REPLAY_"+label+" pages="+pages.size()+"\n"+report);
  }

  @Test public void deepSeekOpeningNeverRepeatsShownText() throws Exception {
    Capture c=load("deepseek-flash.jsonl");
    // Block 1 was re-requested for "tank fleet"; its repaired plan arrived at 9.9 s while 25-33 was on screen.
    List<Page> pages=replay(c,0,14,Collections.singletonMap(1,9920L));
    assertContinuous("DEEPSEEK",pages,c,0,14);
    int events=0;for(int i=0;i<=14;i++)events+=c.plans.get(i).get(c.plans.get(i).size()-1).events.size();
    System.out.println("REPLAY_DEEPSEEK events="+events+" pages="+pages.size());
    assertTrue("short DeepSeek fragments are joined into fuller pages",pages.size()<events);
  }

  @Test public void qwenOpeningNeverRepeatsShownText() throws Exception {
    Capture c=load("qwen3.8-flash.jsonl");
    List<Page> pages=replay(c,0,10,Collections.emptyMap());
    assertContinuous("QWEN",pages,c,0,10);
  }

  @Test public void repairWaitsForASharedBoundaryInsteadOfRestartingTheSentence() throws Exception {
    Capture c=load("deepseek-flash.jsonl");
    RebuildProtocol.Plan first=c.plans.get(1).get(0),repair=c.plans.get(1).get(1);
    assertNotEquals("captured repair segments block 1 differently",first.events.get(0).to,repair.events.get(0).to);
    List<Page> pages=replay(c,1,1,Collections.singletonMap(1,9920L));
    assertContinuous("DEEPSEEK_REPAIR",pages,c,1,1);
    // The repaired wording must still reach the screen after the shared boundary.
    boolean repairedShown=false;
    for(Page page:pages)for(RebuildProtocol.Event e:page.unit.events)
      if(repair.events.contains(e)&&!first.events.contains(e))repairedShown=true;
    assertTrue(repairedShown);
  }
}
