package app.morphe.extension.chmate;
public final class PosterHighlightExpiryTest {
 static int checks;static void ok(boolean value,String why){if(!value)throw new AssertionError(why);checks++;}
 public static void main(String[] args){long now=1700000000000L;
  ok(PosterHighlightRules.Rule.expiration(1,true,now)==now+86400000L,"ID 24 hours");
  for(int kind:new int[]{2,3})ok(PosterHighlightRules.Rule.expiration(kind,true,now)==now+604800000L,"slip seven days");
  for(int kind=0;kind<5;kind++)ok(PosterHighlightRules.Rule.expiration(kind,false,now)==0,"unchecked stays permanent");
  for(int kind:new int[]{0,4})ok(PosterHighlightRules.Rule.expiration(kind,true,now)==0,"unrequested identities stay permanent");
  PosterHighlightRules.Rule rule=new PosterHighlightRules.Rule(1,2,"","abc",true,2,now+1000);
  ok(!rule.expired(now)&&!rule.expired(now+999),"active before deadline");ok(rule.expired(now+1000)&&rule.expired(now+1001),"expires at deadline");
  ok(!new PosterHighlightRules.Rule(1,2,"","abc",true,2).expired(Long.MAX_VALUE),"old saved rules stay permanent");
  ok(rule.label().contains("自動削除"),"expiry displayed");
  System.out.println("PASS "+checks+" highlight expiry checks");
 }
}
