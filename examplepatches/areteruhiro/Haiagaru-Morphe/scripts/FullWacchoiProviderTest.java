package app.morphe.extension.chmate;
public final class FullWacchoiProviderTest {
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);}
 public static void main(String[] args){
  for(String query:new String[]{"Sdff-Q8ld","(ｽｯﾌﾟ Sdff-Q8ld 2/9)","名無しさん＠お腹いっぱい。(ﾜｯﾁｮｲ bed4-6Zun)","（ﾜｯﾁｮｲ Ｓｄｆｆ－Ｑ８ｌｄ）"})check(FullWacchoiProvider.full(query),"native full query missed: "+query);
  for(String query:new String[]{"-Q8ld","Sdff-","ID:HKq+ABFo0","",null})check(!FullWacchoiProvider.full(query),"partial/ID misrouted");
  for(boolean previous:new boolean[]{false,true}){
   check(!FullWacchoiProvider.kyodemo(0,false,previous),"auto ignores remembered choice");
   check(!FullWacchoiProvider.kyodemo(1,false,previous),"Hissi fixed ignores remembered choice");
   check(FullWacchoiProvider.kyodemo(2,false,previous),"Kyodemo fixed ignores remembered choice");
   check(FullWacchoiProvider.kyodemo(3,false,previous)==previous,"both restores last provider");
   for(int mode=0;mode<4;mode++)check(FullWacchoiProvider.kyodemo(mode,true,previous),"Edge does not route to Hissi");
  }
  check(FullWacchoiProvider.choiceKey("EGG.5ch.io","android").equals("wacchoi/egg.5ch.io/android"),"full search has separate remembered choice");
  System.out.println("PASS native prefixed/full-width tokens, partial/ID exclusion, all provider modes and independent choice key");
 }
}
