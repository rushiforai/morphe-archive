package local.maps.gsapatches;
import local.maps.gsa.VoiceStripPolicy;
public class VoiceStripPolicyTest {
 static int n;
 static void test(String page,String mic,long elapsed,String expected){
  String actual=VoiceStripPolicy.state(page,mic,elapsed);
  if(!expected.equals(actual))throw new AssertionError(page+"/"+mic+" at "+elapsed+": "+actual+" != "+expected);
  n++;
 }
 public static void main(String[] args){
  test("INVOCATION","bbnz",500,"LISTENING");
  test("INVOCATION","bboa",600,"LISTENING");
  test("INVOCATION","bbob",2000,"STARTING");
  test("INVOCATION","bbob",4000,"STARTING");
  test("INVOCATION","bboc",14999,"STARTING");
  test("INVOCATION","bbob",15000,"FALLBACK");
  test("INVOCATION","bboc",15000,"FALLBACK");
  test("INVOCATION","bbnz",14999,"LISTENING");
  test("UNKNOWN","UNKNOWN",9999,"STARTING");
  test("UNKNOWN","UNKNOWN",10000,"FALLBACK");
  test("RESPONSE","bbnz",0,"RESPONSE");
  test("RESPONSE","UNKNOWN",30000,"RESPONSE");
  test("LIVE","bbnz",50,"NATIVE");
  test("AGENT_DASHBOARD","bbnz",50,"NATIVE");
  test("LOADING","UNKNOWN",300,"PROCESSING");
  test("LOADING","bboc",29999,"PROCESSING");
  test("LOADING","bbnz",30000,"FALLBACK");
  test("PAGE_NOT_SET","bbnz",2100,"STARTING");
  test("PAGE_NOT_SET","bbnz",10000,"FALLBACK");
  test("INVOCATION","something_new",9999,"STARTING");
  test("INVOCATION","something_new",10000,"FALLBACK");
  System.out.println("PASS VoiceStripPolicy "+n+" native-state/response/cold-start/fallback cases");
 }
}
