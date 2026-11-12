package e.e.a;

public final class LiveStreamUpdatePolicyTest {
 static void ok(boolean result,String why){if(!result)throw new AssertionError(why);}
 public static void main(String[] args){
  String a="https://live.example.test/master.m3u8?token=1";
  String b="https://live.example.test/master.m3u8?token=2";
  ok(LiveStreamUpdatePolicy.reuse(a,a,"abr","abr",true),"same URI: reuse player and new cookies");
  ok(!LiveStreamUpdatePolicy.reuse(a,b,"abr","abr",true),"signed URI rotation: update player");
  ok(!LiveStreamUpdatePolicy.reuse(a,a,"abr","720p",true),"quality changes: update player");
  ok(!LiveStreamUpdatePolicy.reuse(a,a,"abr","abr",false),"player error/idle: reinitialize");
  ok(!LiveStreamUpdatePolicy.reuse("",a,"abr","abr",true),"new stream: initialize");
  ok(!LiveStreamUpdatePolicy.reuse(null,a,"abr","abr",true),"null previous URI");
  ok(!LiveStreamUpdatePolicy.reuse(a,null,"abr","abr",true),"null new URI");
  System.out.println("PASS: live stream refresh preserves healthy playback while credentials rotate");
 }
}
