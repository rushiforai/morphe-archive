import app.template.extension.extension.Diagnostics;

public class DiagnosticsTest {
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    public static void main(String[] args) {
        Diagnostics.stop(); Diagnostics.clear();
        Diagnostics.begin("192.0.2.1", "1.2.3"); Diagnostics.finish("cache", "ok", "integer", "1");
        check(Diagnostics.count()==0, "disabled recording must not collect");
        Diagnostics.start(); Diagnostics.begin("192.0.2.1", "1.2.3"); Diagnostics.finish("printer", "ok", "octets_base64", "YWJj");
        String csv=Diagnostics.csv();
        check(Diagnostics.count()==1 && csv.contains("192.0.2.1") && csv.contains("YWJj") && csv.contains("printer"), "export omits response");
        Diagnostics.begin("192.0.2.1", "1.2.4",42);Diagnostics.finish("cache","ok","integer","3");
        csv=Diagnostics.csv();check(csv.contains("burst_sequence")&&csv.contains(",42,")&&!csv.contains("latest_span_ms"),"each exported event must retain its own sequence without joining unrelated latest totals");
        Diagnostics.begin("192.0.2.1","1.3.6.1.2.1.1.1.0",42);Diagnostics.finish("printer","ok","integer","3");
        check(Diagnostics.csv().contains("System description")&&Diagnostics.recent().contains("System description"),"diagnostics should label known requests");
        Diagnostics.stop(); Diagnostics.begin("192.0.2.1", "1.2.3"); Diagnostics.finish("cache", "ok", "integer", "2");
        check(Diagnostics.count()==3,"stop must stop collecting");
        Diagnostics.start(); for(int i=0;i<2100;i++){Diagnostics.begin("192.0.2.1", "1.2.3"); Diagnostics.finish("cache", "ok", "integer", "2");}
        check(Diagnostics.count()==2000 && Diagnostics.dropped()>0,"recording must be bounded");
        Diagnostics.clear();check(Diagnostics.count()==0,"clear failed");Diagnostics.stop();
        System.out.println("Diagnostic recording checks passed");
    }
}
