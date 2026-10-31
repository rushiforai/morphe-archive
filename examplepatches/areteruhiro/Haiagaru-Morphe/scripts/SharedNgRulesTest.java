package app.morphe.extension.chmate;
public final class SharedNgRulesTest {
 static int checks;
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 static SharedNgRules.Rule rule(String kind,String value,String period,int votes){return new SharedNgRules.Rule("a".repeat(64),"5ch/poverty",kind,value,period,votes,false);}
 public static void main(String[] args){
  check(SharedNgRules.board("https://greta.5ch.io/poverty/").equals("5ch/all"),"server independence");
  check(SharedNgRules.board("https://greta.5ch.net/poverty/").equals("5ch/all"),"5ch domains");
  check(!SharedNgRules.board("https://5ch.io.evil.test/poverty/").equals("5ch/all"),"no suffix confusion");
  check(SharedNgRules.board("javascript:alert(1)").isEmpty(),"no scripts");
  check(SharedNgRules.board("https://u:p@greta.5ch.io/poverty/").isEmpty(),"no credentials");
  var id=rule("id","abc123","2026-10-22",5);
  check(id.matches("https://greta.5ch.io/poverty/","abc123","","2026/10/22(木)","",5),"ID match");
  check(id.matches("https://greta.5ch.io/poverty/","abc123","","2026/10/23(金)","",5),"ID no expiry");
  check(id.matches("https://greta.5ch.io/android/","abc123","","2026/10/22(木)","",5),"same parent board applies");
  check(!id.matches("https://greta.5ch.io/poverty/","abc123","","2026/10/22(木)","",10),"weak threshold");
  for(int n:new int[]{1,3,5})check(id.matches("https://greta.5ch.io/poverty/","abc123","","2026/10/22(木)","",n),"threshold "+n);
  var w=rule("wacchoi","2741-wbKe","2026-10-22",5);
  check(w.matches("https://greta.5ch.io/poverty/","","(ﾜｯﾁｮｲW 2741-wbKe)","2026/10/28(水)","",5),"weekly match");
  check(w.matches("https://greta.5ch.io/poverty/","","(ﾜｯﾁｮｲW 2741-wbKe)","2026/10/29(木)","",5),"Wacchoi no expiry");
  var k=rule("keyword","長文".repeat(25),"",1);
  check(k.matches("https://greta.5ch.io/poverty/","","","2030/01/01(火)","前"+"長文".repeat(25)+"後",1),"keyword persists");
  check(rule("keyword","死ね","",3).matches("https://greta.5ch.io/poverty/","","","","死ね",1),"approved short keyword");
  try{rule("wacchoi","wbKe","2026-10-22",1);throw new AssertionError("suffix accepted");}catch(IllegalArgumentException expected){checks++;}
  var revoked=new SharedNgRules.Rule("b".repeat(64),"5ch/poverty","keyword","長文".repeat(25),"",100,true);
  check(!revoked.matches("https://greta.5ch.io/poverty/","","","","長文".repeat(25),1),"revocation");
  check(SharedNgRules.week("2026/10/21").equals("2026-10-15"),"previous week");
  check(SharedNgRules.day("2026/02/30").isEmpty(),"invalid date");
  var suffix=new SharedNgRules.Rule("c".repeat(64),"bbs.eddibb.cc/liveedge","suffix","aB12","2026-10-22",10,false,4,10);
  check(suffix.matches("https://bbs.eddibb.cc/liveedge/","","L20 zz99-aB12","2026/10/28","",1),"Edge suffix case preserved");
  check(!suffix.matches("https://bbs.eddibb.cc/liveedge/","","L20 zz99-ab12","2026/10/28","",1),"suffix case isolated");
  check(suffix.matches("https://bbs.eddibb.cc/other/","","L20 zz99-aB12","2026/10/28","",1),"same external service applies");
  check(suffix.matches("https://bbs.eddibb.cc/liveedge/","","L20 zz99-aB12","2026/10/29","",1),"suffix has no expiry");
  var global=new SharedNgRules.Rule("d".repeat(64),"*","keyword","死ね","",3,false,2,3);
  check(global.matches("https://bbs.punipuni.eu/livepunipuni/","","","","死ね",1),"global approved keyword on external");
  check(!global.matches("https://bbs.punipuni.eu/livepunipuni/","","","","死ね",5),"server minimum plus client votes");
  for(String kind:new String[]{"prefix","suffix"}){
   var part=new SharedNgRules.Rule("e".repeat(64),"5ch/poverty",kind,kind.equals("prefix")?"2741":"wbKe","2026-10-22",10,false,4,10);
   check(part.matches("https://greta.5ch.io/poverty/","","2741-wbKe","2026/10/28","",1),kind+" matching");
   check(part.matches("https://greta.5ch.io/poverty/","","2741-wbKe","2026/10/29","",1),kind+" no expiry");
  }
  check(new SharedNgRules.Rule("f".repeat(64),"*","id","abc","",5,false).matches("https://bbs.eddibb.cc/liveedge/","abc","","","",1),"unscoped past ID applies globally");
  for(int n:new int[]{1,2,7,11,1001,Integer.MAX_VALUE})check(SharedNgRules.reportThreshold(Integer.toString(n))==n,"arbitrary report threshold "+n);
  for(String invalid:new String[]{"", "0", "-1", "1.5", "2147483648", "abc"})try{SharedNgRules.reportThreshold(invalid);throw new AssertionError("invalid threshold");}catch(IllegalArgumentException expected){checks++;}
  var seven=new SharedNgRules.Rule("f".repeat(64),"5ch/poverty","id","abc123","2026-10-22",7,false);
  check(seven.matches("https://greta.5ch.io/poverty/","abc123","","2026/10/22","",7),"custom seven votes accepted");
  check(!seven.matches("https://greta.5ch.io/poverty/","abc123","","2026/10/22","",8),"custom eight votes excluded");
  for(String kind:new String[]{"id","wacchoi","prefix","suffix","keyword"}){
   String value=kind.equals("id")?"Ab12":kind.equals("wacchoi")?"Ab12-Cd34":kind.equals("prefix")?"Ab12":kind.equals("suffix")?"Cd34":"sample";
   var single=new SharedNgRules.Rule("9".repeat(64),"5ch/android",kind,value,kind.equals("keyword")?"":"2026-10-22",1,false,1,1);
   check(single.matches("https://egg.5ch.io/android/","Ab12","Ab12-Cd34","2026/10/22","sample",1),kind+" one vote enabled at app threshold one");
   check(!single.matches("https://egg.5ch.io/android/","Ab12","Ab12-Cd34","2026/10/22","sample",2),kind+" one vote excluded at app threshold two");
  }
  var catalog=java.util.List.of(new String[]{"android","egg.5ch.io"},new String[]{"poverty","greta.5ch.io"},new String[]{"bbs.eddibb.cc/liveedge","bbs.eddibb.cc"},new String[]{"game/123","jbbs.shitaraba.net"});
  check(SharedNgRules.boardScope("android",catalog).equals("5ch/all"),"native Android scope resolved");
  check(SharedNgRules.boardScope("poverty",catalog).equals("5ch/all"),"other 5ch board resolved");
  check(SharedNgRules.boardScope("bbs.eddibb.cc/liveedge",catalog).equals("edge/all"),"external scope resolved");
  check(SharedNgRules.boardScope("game/123",catalog).equals("jbbs.shitaraba.net/all"),"hierarchical board resolved");
  check(SharedNgRules.boardScope("missing",catalog).equals("unknown.invalid/unresolved"),"unknown board held");
  check(SharedNgRules.boardScope("android",java.util.List.of(new String[]{"android","egg.5ch.io"},new String[]{"android","other.example"})).equals("unknown.invalid/unresolved"),"ambiguous native scope never guessed");
  check(new SharedNgRules.Rule("8".repeat(64),"5ch/android","id","Ab12","",1,false).matches("https://egg.5ch.io/android/","Ab12","","","",1),"ID applies without obtaining date");
  check(!id.matches("https://bbs.eddibb.cc/liveedge/","abc123","","","",1),"5ch and Edge isolated");
  check(SharedNgRules.board("https://mercury.bbspink.com/erobbs/").equals("pink/all"),"PINK kept separate");
  check(SharedNgRules.boardLabel("jbbs.shitaraba.net/all").equals("したらば掲示板"),"external service named");
  check(SharedNgRules.boardLabel("custom.example/all").equals("custom.example"),"unknown external service uses actual hostname");
  check(SharedNgRules.boardScope("bbs.eddibb.cc%2Fliveedge",java.util.List.of()).equals("edge/all"),"encoded Edge native key without catalog");
  check(SharedNgRules.boardScope("bbs.eddibb.cc/liveedge",java.util.List.of()).equals("edge/all"),"decoded Edge native key without catalog");
  check(SharedNgRules.boardScope("mercury.bbspink.com%2Ferobbs",java.util.List.of()).equals("pink/all"),"encoded PINK native key");
  check(SharedNgRules.boardScope("jbbs.shitaraba.net%2Fgame%2F123",java.util.List.of()).equals("jbbs.shitaraba.net/all"),"encoded hierarchical external board");
  check(SharedNgRules.boardScope("bbs.eddibb.cc.evil.example%2Fliveedge",java.util.List.of()).equals("bbs.eddibb.cc.evil.example/all"),"external host suffix cannot impersonate Edge");
  check(SharedNgRules.boardScope("bbs.eddibb.cc%252Fliveedge",java.util.List.of()).equals("unknown.invalid/unresolved"),"no double decoding");
  check(SharedNgRules.boardScope("android",java.util.List.of()).equals("unknown.invalid/unresolved"),"bare native key still requires catalog");
  check(SharedNgRules.boardScope("u%40bbs.eddibb.cc%2Fliveedge",java.util.List.of()).equals("unknown.invalid/unresolved"),"userinfo is never accepted");
  String[][] nativeScopes={
   {"egg.5ch.io%2Fandroid","5ch/all","5ch"},
   {"greta.5ch.net%2Fpoverty","5ch/all","5ch"},
   {"mercury.bbspink.com%2Ferobbs","pink/all","PINK"},
   {"jbbs.shitaraba.net%2Fgame%2F123","jbbs.shitaraba.net/all","したらば掲示板"},
   {"jbbs.livedoor.jp%2Fgame%2F123","jbbs.shitaraba.net/all","したらば掲示板"},
   {"hayabusa.open2ch.net%2Flivejupiter","open2ch.net/all","おーぷん2ch"},
   {"talk.jp%2Fpoverty","talk.jp/all","Talk"},
   {"anago.2ch.sc%2Fandroid","2ch.sc/all","2ch.sc"},
   {"bbs.punipuni.eu%2Flivepunipuni","bbs.punipuni.eu/all","ぷにぷに"},
   {"custom.example%3A8443%2Fboard","custom.example:8443/all","custom.example:8443"},
   {"https%3A%2F%2Fbbs.eddibb.cc%2Fliveedge%2F","edge/all","エッヂ"}
  };
  for(String[] nativeScope:nativeScopes){String resolved=SharedNgRules.boardScope(nativeScope[0],java.util.List.of());check(resolved.equals(nativeScope[1]),"native scope "+nativeScope[1]);check(SharedNgRules.boardLabel(resolved).equals(nativeScope[2]),"native service label "+nativeScope[2]);}
  System.out.println("PASS "+checks+" shared NG policy checks");
 }
}
