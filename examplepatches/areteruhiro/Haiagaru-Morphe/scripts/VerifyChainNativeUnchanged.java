import java.util.*;
public class VerifyChainNativeUnchanged {
 public static void main(String[] args)throws Exception{
  var a=VerifyViewerFilterHooks.load(args[0]);var b=VerifyViewerFilterHooks.load(args[1]);String v=args[2];
  String owner=v.equals("191")?"Lo/m9ExternalSyntheticLambda1;":v.equals("226")?"Lo/listener;":"Lo/zzaW;";
  String row=v.equals("191")?"Lo/processAdDisplayErrorPostbackForUserError;":v.equals("226")?"Lo/BouncyCastleSocketAdapterCompanion;":"Lo/KeJ11;";
  String method=v.equals("191")?"SE_":v.equals("226")?"d":"c";
  var params=v.equals("242")?List.of(row,"Z"):List.of(row,"Z",v.equals("191")?"Landroid/util/SparseIntArray;":"Lo/getNextExecuteNanoTimeokhttp;");
  VerifyViewerFilterHooks.same(VerifyViewerFilterHooks.method(a,owner,method,params),VerifyViewerFilterHooks.method(b,owner,method,params));
  if(!v.equals("242"))VerifyViewerFilterHooks.same(VerifyViewerFilterHooks.method(a,owner,v.equals("191")?"c":"b",List.of("Z")),VerifyViewerFilterHooks.method(b,owner,v.equals("191")?"c":"b",List.of("Z")));
  if(v.equals("242"))for(String type:List.of("Lo/emptyToNull;","Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel$onBackPressedInput_delegatelambda0$3;"))for(var m:a.get(type).getMethods())if(m.getImplementation()!=null){var params2=new java.util.ArrayList<String>();for(var p:m.getParameterTypes())params2.add(p.toString());VerifyViewerFilterHooks.same(m,VerifyViewerFilterHooks.method(b,type,m.getName(),params2));}
  System.out.println("PASS "+v+" native chain flags and legacy rebuild register/body/branch unchanged");
 }
}
