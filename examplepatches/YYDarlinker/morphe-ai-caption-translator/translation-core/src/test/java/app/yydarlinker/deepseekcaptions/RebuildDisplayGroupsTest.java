package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
public class RebuildDisplayGroupsTest {
  static final CaptionLanguageContext ZH=CaptionLanguageContext.explicit("en","zh-Hans"),
      EN=CaptionLanguageContext.explicit("ja","en"),
      JA=CaptionLanguageContext.explicit("en","ja");

  /** One source word per event, back to back unless a gap is given; times in ms. */
  static RebuildSource source(int words,long... gaps) {
    List<RebuildSource.Word> out=new ArrayList<>();long at=0;
    for(int i=0;i<words;i++){if(i<gaps.length)at+=gaps[i];out.add(new RebuildSource.Word("w"+i,at,at+1,0,RebuildSource.Precision.NATIVE));at+=1;}
    return new RebuildSource(out);
  }
  static RebuildProtocol.Event event(int token,long start,long end,String text) {
    return new RebuildProtocol.Event(token,token,start,end,text);
  }
  static List<RebuildDisplayGroups.Unit> partition(CaptionLanguageContext spec,RebuildSource s,RebuildProtocol.Event... events) {
    return RebuildDisplayGroups.partition(0,Arrays.asList(events),s,spec,null,null);
  }

  @Test public void missingFullStopsDoNotMergeACompletedRankingWithTheNextSentence() {
    RebuildSource s=source(3);
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,event(0,0,1400,"自信地把俄罗斯排在第二位"),
        event(1,1400,4400,"见鬼，甚至还有几个把俄罗斯排在第一位"),event(2,4400,8000,"想必是那些认为衡量军事实力的标准仍是坦克的人写的。"));
    assertEquals(3,units.size());
    assertEquals("自信地把俄罗斯排在第二位",units.get(0).text);
    assertEquals("见鬼，甚至还有几个把俄罗斯排在第一位",units.get(1).text);
    assertEquals(0,units.get(0).start);assertEquals(1400,units.get(0).end);
  }

  @Test public void punctuationNeedsNoExtraSeparatorAndListsChainWithinLimits() {
    RebuildSource s=words("Where","are","the","stealth","fighters","aircraft","carriers",
        "hypersonic","missiles","and","ballistic","missiles","coming","from");
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,
        new RebuildProtocol.Event(0,2,0,1900,"那么这些……都从哪里来"),
        new RebuildProtocol.Event(3,4,1900,2900,"隐形战斗机"),
        new RebuildProtocol.Event(5,6,2900,3800,"航空母舰"),
        new RebuildProtocol.Event(7,8,3800,4800,"高超音速导弹"),
        new RebuildProtocol.Event(9,11,4800,6300,"以及反舰弹道导弹"),
        new RebuildProtocol.Event(12,13,6300,6900,"又是从哪来的？"));
    assertEquals(2,units.size());
    assertTrue(units.get(0).text.contains("隐形战斗机"));
    assertTrue(units.get(1).text.endsWith("又是从哪来的？"));
    assertEquals("那么这些……都从哪里来隐形战斗机航空母舰高超音速导弹以及反舰弹道导弹又是从哪来的？",
        String.join("",texts(units)).replace("\u200b",""));
    for(RebuildDisplayGroups.Unit unit:units)
      assertTrue("a list item must not become a sub-minimum page",unit.end-unit.start>=RebuildPageLayout.MIN_PAGE_MS);
    units=partition(ZH,source(2),event(0,0,900,"毕竟，"),event(1,900,3000,"谁会在乎呢"));
    assertEquals("毕竟，谁会在乎呢",units.get(0).text);
  }

  @Test public void completeSentencesStayIndependentAndContinuationsCanSpanPages() {
    List<RebuildDisplayGroups.Unit> units=partition(ZH,source(3),event(0,0,1500,"好的。"),
        event(1,1500,4000,"我们开始吧"),event(2,4000,9500,"今天讲预算"));
    assertEquals(Arrays.asList("好的。","我们开始吧","今天讲预算"),texts(units));
    // A lead without a sentence end joins its continuation: one page that reads as one thought is
    // better than a page that stops mid-sentence. Unit duration is not page duration:
    // capacity and pacing are decided after this semantic span is assembled.
    units=partition(ZH,source(2),event(0,0,1500,"而且"),event(1,1500,6600,"这支部队后来成为了正规军"));
    assertEquals(1,units.size());
    assertEquals("而且这支部队后来成为了正规军",units.get(0).text);
    units=partition(ZH,source(2),event(0,0,1500,"而且"),event(1,1500,12000,"这支部队后来成为了正规军"));
    assertEquals(1,units.size());
    assertEquals(2,units.get(0).events.size());
    assertEquals(12000,units.get(0).end);
  }

  @Test public void spacedAndJapaneseTargetsUseTheirOwnSeparator() {
    assertEquals("and the reason is simple:",partition(EN,source(2),event(0,0,600,"and the reason"),event(1,600,1500,"is simple:")).get(0).text);
    assertEquals("Well, that works",partition(EN,source(2),event(0,0,500,"Well,"),event(1,500,1500,"that works")).get(0).text);
    assertEquals("そして\u200b日本へ",partition(JA,source(2),event(0,0,700,"そして"),event(1,700,1800,"日本へ")).get(0).text);
  }

  @Test public void blockedEmptyAndHardBreakEventsAreNeverJoined() {
    RebuildProtocol.Event a=event(0,0,800,"因为"),b=event(1,800,2000,"预算很大"),c=event(2,2000,2600,"");
    List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(0,Arrays.asList(a,b,c),source(3),ZH,null,e->e==b);
    assertEquals(3,units.size());assertTrue(units.get(1).blocked);assertFalse(units.get(0).blocked);
    // 700 ms of silence is a hard source break: not joined, but the caption stays up until the
    // next speech so the box does not blink; a pause of a second or more clears it.
    RebuildSource paused=source(2,0,699);
    units=partition(ZH,paused,event(0,0,1,"因为"),event(1,700,1800,"预算很大"));
    assertEquals(2,units.size());assertEquals(700,units.get(0).end);
    units=partition(ZH,source(2,0,1000),event(0,0,1,"因为"),event(1,1001,1800,"预算很大"));
    assertEquals(1,units.get(0).end);
  }

  @Test public void theLastPageOfABlockIsHeldUntilTheNextBlockSpeaks() {
    RebuildSource s=words("One.","Two.","Three.");
    s=new RebuildSource(Arrays.asList(s.words.get(0),s.words.get(1),
        new RebuildSource.Word("Three.",1200,1600,1,RebuildSource.Precision.NATIVE)));
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,new RebuildProtocol.Event(0,0,0,399,"第一句话说完了。"),
        new RebuildProtocol.Event(1,1,400,799,"第二句话也说完了。"));
    assertEquals(2,units.size());assertEquals(1200,units.get(1).end);
  }

  /** Punctuated words back to back; a word without punctuation means the sentence runs on. */
  static RebuildSource words(String... text) {
    List<RebuildSource.Word> out=new ArrayList<>();
    for(int i=0;i<text.length;i++)out.add(new RebuildSource.Word(text[i],i*400L,i*400L+399,0,RebuildSource.Precision.NATIVE));
    return new RebuildSource(out);
  }

  @Test public void aSentenceSplitMidClauseIsJoinedWithoutAPause() {
    // "claiming that Russia had | the second strongest army." The source runs on, so no separator.
    RebuildSource s=words("Before","2022,","people","claimed","Russia","had","the","second","army.");
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,new RebuildProtocol.Event(0,1,0,799,"在2022年之前，"),
        new RebuildProtocol.Event(2,5,800,2399,"人们声称俄罗斯拥有"),new RebuildProtocol.Event(6,8,2400,3599,"世界第二强大的军队。"));
    assertEquals(Arrays.asList("在2022年之前，人们声称俄罗斯拥有世界第二强大的军队。"),texts(units));
    // A sentence end in the source keeps the pause separator where the target has no punctuation.
    s=words("ranked","second.","Heck,","some","said","first.");
    units=partition(ZH,s,new RebuildProtocol.Event(0,1,0,799,"排在第二"),new RebuildProtocol.Event(2,5,800,2399,"见鬼，有的排第一。"));
    assertEquals("排在第二\u200b见鬼，有的排第一。",units.get(0).text);
  }

  @Test public void aLatinWordNextToChineseKeepsItsSpaceWhenPagesAreJoined() {
    // Captured DeepSeek page: "...iPhone 18 Pro Max" | "把它和上一代对比一下" came out as "Max把它".
    RebuildSource s=words("dismantled","the","iPhone","Pro","Max","and","compared","it");
    // A sub-minimum first event still joins; spacing is checked when a join is justified.
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,new RebuildProtocol.Event(0,4,0,799,"我已经拆解了 iPhone 18 Pro Max"),
        new RebuildProtocol.Event(5,7,800,3499,"把它和上一代对比一下"));
    assertEquals(Arrays.asList("我已经拆解了 iPhone 18 Pro Max 把它和上一代对比一下"),texts(units));
  }

  @Test public void aShortTailClosingTheSentenceJoinsTheOpenTextBeforeIt() {
    RebuildSource s=words("Before","February","24th","you","need","not","look","far",
        "to","find","people","claiming","Russia","had","the","second","strongest","army");
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,
        new RebuildProtocol.Event(0,7,0,2900,"在2月24日之前，你在网上不用走多远"),
        new RebuildProtocol.Event(8,14,2900,5000,"就能找到有人声称俄罗斯拥有"),
        new RebuildProtocol.Event(15,17,5000,7000,"世界第二强大的军队"));
    assertEquals(Arrays.asList("在2月24日之前，你在网上不用走多远","就能找到有人声称俄罗斯拥有世界第二强大的军队"),texts(units));
  }

  @Test public void shortPausesAreBridgedSoTheCaptionDoesNotFlicker() {
    RebuildSource s=source(2,0,300);
    List<RebuildDisplayGroups.Unit> units=partition(ZH,s,event(0,0,2000,"这是第一句完整的话。"),event(1,2300,4000,"这是第二句。"));
    assertEquals(2,units.size());assertEquals(2300,units.get(0).end);
  }

  @Test public void measuredFitIsRespected() {
    List<RebuildDisplayGroups.Unit> units=RebuildDisplayGroups.partition(0,Arrays.asList(event(0,0,800,"首先"),
        event(1,800,3000,"中国的国防预算比你想象的要大")),source(2),ZH,value->value.length()<8,null);
    assertEquals(2,units.size());
  }

  @Test public void cursorNeverShowsATokenTwiceAndAdoptsRepairsOnlyAtSharedBoundaries() {
    RebuildSource s=source(6);
    // Each sentence is closed by its own full stop, so each stays its own page.
    RebuildProtocol.Plan old=new RebuildProtocol.Plan(Arrays.asList(new RebuildProtocol.Event(0,2,0,3000,"互联网上充斥着文章和指数。"),
        new RebuildProtocol.Event(3,3,3000,6000,"它们都把俄罗斯排第二。"),new RebuildProtocol.Event(4,5,6000,9000,"甚至有排第一的。")),"{}");
    RebuildProtocol.Plan repair=new RebuildProtocol.Plan(Arrays.asList(new RebuildProtocol.Event(0,3,0,6000,"互联网上充斥着文章和排行榜，它们都把俄罗斯排第二"),
        new RebuildProtocol.Event(4,5,6000,9000,"甚至有几篇排第一。")),"{}");
    RebuildDisplayGroups.Cursor cursor=new RebuildDisplayGroups.Cursor();
    RebuildDisplayGroups.Unit first=cursor.select(0,old.events,RebuildDisplayGroups.partition(0,old.events,s,ZH,null,null),100);
    cursor.shown(first);
    assertEquals(2,first.to);
    assertTrue(cursor.onScreen(0,100));
    assertFalse("repair restarts the shown sentence",cursor.continues(0,repair));
    cursor.shown(cursor.select(0,old.events,RebuildDisplayGroups.partition(0,old.events,s,ZH,null,null),3100));
    assertTrue("old and repaired plans share the boundary after token 3",cursor.continues(0,repair));
    RebuildDisplayGroups.Unit next=cursor.select(0,repair.events,RebuildDisplayGroups.partition(0,repair.events,s,ZH,null,null),6100);
    assertEquals("甚至有几篇排第一。",next.text);
  }

  @Test public void regroupingAfterAGeometryChangeShowsOnlyTheUnseenPart() {
    RebuildSource s=source(2);
    List<RebuildProtocol.Event> events=Arrays.asList(event(0,0,800,"首先"),event(1,800,2500,"中国的预算更大"));
    RebuildDisplayGroups.Cursor cursor=new RebuildDisplayGroups.Cursor();
    // Narrow layout: no join, the lead is shown alone.
    cursor.shown(cursor.select(0,events,RebuildDisplayGroups.partition(0,events,s,ZH,value->false,null),100));
    // Wider layout now joins both events, but the lead already reached the screen.
    List<RebuildDisplayGroups.Unit> joined=RebuildDisplayGroups.partition(0,events,s,ZH,null,null);
    assertEquals("首先中国的预算更大".length()+1,joined.get(0).text.length());
    RebuildDisplayGroups.Unit rest=cursor.select(0,events,joined,900);
    assertEquals(1,rest.from);assertEquals("中国的预算更大",rest.text);
  }

  static List<String> texts(List<RebuildDisplayGroups.Unit> units) {
    List<String> out=new ArrayList<>();for(RebuildDisplayGroups.Unit u:units)out.add(u.text);return out;
  }
}
