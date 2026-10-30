package local.maps.gsapatches;
import local.maps.gsa.CarStatePolicy;
public class CarStatePolicyTest{
 static int n;static void eq(String a,String b){n++;if(!a.equals(b))throw new AssertionError(a+" != "+b);}
 public static void main(String[]x){
 eq(CarStatePolicy.microphone(Boolean.TRUE),"MIC_MUTED");eq(CarStatePolicy.microphone(Boolean.FALSE),"MIC_OPEN");eq(CarStatePolicy.microphone(null),"UNKNOWN");eq(CarStatePolicy.microphone("MIC_OPEN"),"UNKNOWN");
 eq(CarStatePolicy.state("bhjo","MIC_OPEN"),"LISTENING");eq(CarStatePolicy.state("bhjo","MIC_MUTED"),"MUTED");eq(CarStatePolicy.state("bhjo","MIC_CLOSED"),"MUTED");eq(CarStatePolicy.state("bhjo","UNKNOWN"),"UNSUPPORTED");
 eq(CarStatePolicy.state("bhjr","MIC_MUTED"),"SPEAKING");eq(CarStatePolicy.state("bhjm","MIC_OPEN"),"ERROR");eq(CarStatePolicy.state("bhjk","MIC_OPEN"),"ENDED");eq(CarStatePolicy.state("unexpected","MIC_OPEN"),"UNSUPPORTED");
 eq(CarStatePolicy.glow("ERROR"),"GONE");eq(CarStatePolicy.glow("MUTED"),"GONE");eq(CarStatePolicy.glow("UNSUPPORTED"),"GONE");eq(CarStatePolicy.glow("PROCESSING"),"PROCESSING");eq(CarStatePolicy.glow("SPEAKING"),"GEMINI_SPEAKING");
 System.out.println("PASS CarStatePolicy "+n+" native-state/mic/fallback cases");}}
