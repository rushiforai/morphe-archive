package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;

public class RebuildR28Test {
  @Test public void dateNumbersAreComparedAcrossEnglishAndChinese() {
    assertTrue(RebuildProtocol.numbersSafe("before february 24th you did not have to search", "在2月24日之前，你无需搜索"));
    assertTrue(RebuildProtocol.numbersSafe("before february 24th you did not have to search", "二月24日之前，你无需搜索"));
    assertFalse(RebuildProtocol.numbersSafe("before february 24th you did not have to search", "在2月25日之前，你无需搜索"));
  }
  @Test public void layoutFailureDoesNotRejectOtherEvents() throws Exception {
    RebuildSource s=RebuildContractTest.source("first sentence. second sentence.",1000);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    org.json.JSONArray es=new org.json.JSONArray().put(RebuildContractTest.event(0,1,"第一句。" ).put("source",s.text(0,1))).put(RebuildContractTest.event(2,3,"这是第二句需要使用足够文字来验证局部布局风险。").put("source",s.text(2,3)));
    RebuildProtocol.Plan p=RebuildProtocol.parseBound(RebuildContractTest.reply(b,es).replace("first sentence. second sentence.",""),s,b);
    RebuildProtocol.Plan reviewed=RebuildReview.withLayoutReview(p,x->x.length()<20);
    assertEquals(2,reviewed.events.size());
    assertTrue(reviewed.issues.stream().anyMatch(x->x.code.equals("layout_overflow")&&x.from==2));
  }
}
