package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE)
public class ContinuationContractTest {
    private static final CaptionLanguageContext ZH=CaptionLanguageContext.explicit("en","zh-Hans");

    @Test public void reportingComplementKeepsItsObjectButDemonstrativesStayIndependent() {
        String[][] cases={
            {"people are claiming that the budget will grow","有人声称"},
            {"the auditors said that the budget will grow","审计人员表示"},
            {"we are reporting that the budget will grow","我们报告称"},
            {"the minister explained that the budget will grow","部长解释说"}};
        for(String[] row:cases) {
            RebuildSource source=RebuildContractTest.source(row[0],900);
            RebuildProtocol.Event first=new RebuildProtocol.Event(0,2,0,2700,row[1]);
            RebuildProtocol.Event last=new RebuildProtocol.Event(3,7,2700,7200,"预算还会继续增长");
            List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(0,Arrays.asList(first,last),source,ZH,v->true,null);
            assertEquals(1,units.size());assertEquals(first.text+last.text,units.get(0).text);
            assertSame(first,units.get(0).events.get(0));assertSame(last,units.get(0).events.get(1));
            assertEquals(2700,first.end);assertEquals(2700,last.start);
        }
        RebuildSource source=RebuildContractTest.source("people were singing that year we moved home",900);
        List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(0,Arrays.asList(
                new RebuildProtocol.Event(0,2,0,2700,"他们当时正在唱歌"),
                new RebuildProtocol.Event(3,7,2700,7200,"那一年我们搬到了新的住处")),source,ZH,v->true,null);
        assertEquals("an -ing suffix alone is not a reporting complement",2,units.size());
    }

    @Test public void aDanglingLinkCanJoinAcrossSinglePageLimitsWithoutChangingEvents() {
        RebuildSource source=RebuildContractTest.source("the report is ready we will inspect all accounts",1800);
        RebuildProtocol.Event first=new RebuildProtocol.Event(0,3,0,7200,"本季度的全部工作记录已经整理归档，因此");
        RebuildProtocol.Event last=new RebuildProtocol.Event(4,8,7200,16200,"我们将逐项复核接下来各个项目的预算，并在完成核对之后公布全部明细。");
        List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(0,Arrays.asList(first,last),source,ZH,v->false,null);
        assertEquals("semantic continuation is not a two-line page",1,units.size());
        RebuildDisplayGroups.Unit unit=units.get(0);assertEquals(0,unit.start);assertEquals(16200,unit.end);
        assertEquals(0,unit.from);assertEquals(8,unit.to);
        List<RebuildPageLayout.Page> pages=RebuildPageLayout.unitPages(unit.text,unit.start,unit.end,
                v->v.length()<=22,v->v.length()<=44,ZH.renderSpec);
        assertTrue(pages.size()>1);StringBuilder all=new StringBuilder();
        for(RebuildPageLayout.Page page:pages){all.append(page.text);assertFalse(page.text.replace("\u200b","").endsWith("因此"));}
        assertEquals(first.text+last.text,all.toString());
        assertSame(first,unit.events.get(0));assertSame(last,unit.events.get(1));
        List<RebuildDisplayGroups.Unit> blocked=RebuildDisplayGroups.partition(0,Arrays.asList(first,last),source,ZH,v->false,e->e==last);
        assertEquals("a semantic link cannot override a blocked event",2,blocked.size());
        RebuildProtocol.Event paused=new RebuildProtocol.Event(4,8,8000,17000,last.text);
        assertEquals("a semantic link cannot bridge a hard pause",2,
                RebuildDisplayGroups.partition(0,Arrays.asList(first,paused),source,ZH,v->false,null).size());
    }

    private static final class View implements RebuildPresentationSelection.BlockView {
        RebuildProtocol.Plan accepted,prefix;int state=RebuildController.RUNNING;
        public RebuildProtocol.Plan accepted(){return accepted;}
        public RebuildProtocol.Plan provisional(){return prefix;}
        public RebuildProtocol.Plan pending(){return null;}
        public int state(){return state;}
        public String reason(){return "";}
    }

    @Test public void anIncompleteStreamingPrefixWaitsWithoutFreezingTheCursorOrRequestingRepair() {
        RebuildSource source=RebuildContractTest.source("people are claiming that the budget will grow",900);
        RebuildPlanner.Block block=new RebuildPlanner.Block(0,0,7,source);
        RebuildProtocol.Event first=new RebuildProtocol.Event(0,2,0,2700,"调查人员声称");
        RebuildProtocol.Event last=new RebuildProtocol.Event(3,7,2700,7200,"预算还会继续增长");
        View view=new View();view.prefix=new RebuildProtocol.Plan(Collections.singletonList(first),"{}");
        RebuildPresentationSelection selection=new RebuildPresentationSelection();
        List<RebuildPlanner.Block> blocks=Collections.singletonList(block);selection.configure(source,blocks,ZH);
        RebuildPresentationSelection.Selected selected=selection.begin(null,source,blocks,ZH,false,false,"",true,"loading",500,0,view);
        RebuildProtocol.Plan plan=selection.plan(view);
        selection.selectBlock(null,source,block,view,plan,selection.units(selection.layout(0,plan,null)),500,"loading");
        assertTrue(selected.status);assertEquals("loading",selected.text);assertFalse(selection.shownIn(0));
        assertFalse("waiting for this response must not create another model request",selection.needsGuarantee(source,false,500));
        view.prefix=new RebuildProtocol.Plan(Arrays.asList(first,last),"{}");
        selected=selection.begin(null,source,blocks,ZH,false,false,"",true,"loading",500,0,view);
        plan=selection.plan(view);
        selection.selectBlock(null,source,block,view,plan,selection.units(selection.layout(0,plan,null)),500,"loading");
        assertFalse(selected.status);assertEquals(first.text+last.text,selected.text);assertTrue(selection.shownIn(0));
        assertEquals(0,selected.eventStart);assertEquals(7200,selected.eventEnd);
        view.accepted=view.prefix;view.prefix=null;view.state=RebuildController.READY;
        selected=selection.begin(null,source,blocks,ZH,false,false,"",true,"loading",600,0,view);
        plan=selection.plan(view);
        selection.selectBlock(null,source,block,view,plan,selection.units(selection.layout(0,plan,null)),600,"loading");
        assertEquals(first.text+last.text,selected.text);
        selection.reset();view.accepted=null;view.prefix=new RebuildProtocol.Plan(Collections.singletonList(first),"{}");
        view.state=RebuildController.FAILED;
        selected=selection.begin(null,source,blocks,ZH,false,false,"",true,"loading",500,0,view);
        plan=selection.plan(view);
        selection.selectBlock(null,source,block,view,plan,selection.units(selection.layout(0,plan,null)),500,"loading");
        assertFalse("a failed request must not wait forever for a continuation",selected.status);
        assertEquals(first.text,selected.text);
        RebuildPlanner.Block end=new RebuildPlanner.Block(0,0,2,source);
        blocks=Collections.singletonList(end);selection.reset();selection.configure(source,blocks,ZH);
        view.state=RebuildController.RUNNING;
        selected=selection.begin(null,source,blocks,ZH,false,false,"",true,"loading",500,0,view);
        plan=selection.plan(view);
        selection.selectBlock(null,source,end,view,plan,selection.units(selection.layout(0,plan,null)),500,"loading");
        assertFalse("request boundaries cannot become an unbounded context wait",selected.status);
    }
}
