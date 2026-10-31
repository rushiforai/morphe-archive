import org.junit.runner.*;
public final class AuditComparison250 {
 public static void main(String[] args)throws Exception {
  Class<?> type=Class.forName("e.e.a.FinalAudit250Test");int failures=0;
  for(String method:new String[]{"resizingCommitsOneWindowUpdateAfterFittingControls","terminalFrameCannotPinADetachedPlayerInStaticCache","nullListLoaderIsAnOptionalNonRankingLifecycleState"}){
   Result result=new JUnitCore().run(Request.method(type,method));
   if(result.getRunCount()==0)throw new AssertionError("No comparison tests ran");
   System.err.println(method+": runs="+result.getRunCount()+", failures="+result.getFailureCount());
   for(org.junit.runner.notification.Failure failure:result.getFailures())System.err.println("  "+failure.getMessage());
   failures+=result.getFailureCount();
  }
  if(args.length>0&&args[0].equals("fixed")&&failures!=0)System.exit(1);
  System.exit(0);
 }
}
