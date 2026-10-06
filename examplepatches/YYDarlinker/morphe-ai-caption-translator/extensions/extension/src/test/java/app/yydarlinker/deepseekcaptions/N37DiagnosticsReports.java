package app.yydarlinker.deepseekcaptions;
final class N37DiagnosticsReports {
  static String read(android.content.Context c){
    java.util.concurrent.ExecutorService executor=java.util.concurrent.Executors.newSingleThreadExecutor();
    try{return executor.submit(()->CaptionDiagnostics.reportText(c,true)).get(10,java.util.concurrent.TimeUnit.SECONDS);}
    catch(Exception e){throw new AssertionError("background report",e);}finally{executor.shutdownNow();}
  }
}
