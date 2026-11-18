package app.template.extension.extension;

import java.util.*;

/** Read-only sequential replay of the exact single-object GETs captured in one burst. */
public final class ReplayEngine {
 public static final class Spec {
  public final String oid,community; public final int version,id,port,timeout,retries;
  public Spec(String oid,String community,int version,int id,int port,int timeout,int retries){this.oid=oid;this.community=community;this.version=version;this.id=id;this.port=port;this.timeout=timeout;this.retries=retries;}
 }
 public interface Transport extends AutoCloseable {String probe(Spec first)throws Exception;String request(Spec spec)throws Exception;void close();}
 public static final class Change {public final String oid,before,after;Change(String o,String b,String a){oid=o;before=b;after=a;}}
 public static final class Result {public final long elapsedMs;public final int completed,uncached,unsupported;public final List<Change> changes;public final List<String> responses;Result(long t,int n,int u,int x,List<Change> c,List<String> responses){elapsedMs=t;completed=n;uncached=u;unsupported=x;changes=Collections.unmodifiableList(new ArrayList<>(c));this.responses=Collections.unmodifiableList(new ArrayList<>(responses));}}
 public static final class ProbeException extends Exception {public ProbeException(String m){super(m);}public ProbeException(String m,Throwable t){super(m,t);}}
 public static Result run(List<Spec> specs,Map<String,String> cache,String expectedMac,Transport transport)throws Exception{
  try{
   if(specs==null||specs.isEmpty())throw new ProbeException("No recorded activity is available. Open a preview and try again.");
   if(expectedMac==null||expectedMac.isEmpty())throw new ProbeException("Cannot verify this printer's hardware address. Open a preview and try again.");
   String identity;try{identity=transport.probe(specs.get(0));}catch(Exception e){throw new ProbeException("Printer did not respond to the identity check. No requests were replayed.",e);}
   if(identity==null||!identity.equalsIgnoreCase(expectedMac))throw new ProbeException("The printer's hardware address did not match. No requests were replayed.");
   long start=System.nanoTime();int n=0,uncached=0,unsupported=0;Map<String,Change> changes=new LinkedHashMap<>();List<String> responses=new ArrayList<>();
   for(Spec spec:specs){String value=transport.request(spec);responses.add(value);n++;if(value==null){unsupported++;continue;}String before=cache.get(spec.oid);if(before==null){uncached++;continue;}if(!before.equals(value))changes.put(spec.oid,new Change(spec.oid,before,value));}
   return new Result(Math.max(0,(System.nanoTime()-start)/1000000L),n,uncached,unsupported,new ArrayList<>(changes.values()),responses);
  }finally{transport.close();}
 }
 public static Result runRecorded(List<Spec> specs,List<String> responses,String expectedMac,Transport transport)throws Exception{
  try{
   if(specs==null||specs.isEmpty()||responses==null||responses.size()!=specs.size())throw new ProbeException("No complete recorded activity is available.");
   if(expectedMac==null||expectedMac.isEmpty())throw new ProbeException("Cannot verify this printer's hardware address. Open a preview and try again.");
   String identity;try{identity=transport.probe(specs.get(0));}catch(Exception e){throw new ProbeException("Printer did not respond to the identity check. No requests were replayed.",e);}
   if(identity==null||!identity.equalsIgnoreCase(expectedMac))throw new ProbeException("The printer's hardware address did not match. No requests were replayed.");
   long start=System.nanoTime();int completed=0,missing=0,unsupported=0;List<Change> changes=new ArrayList<>();List<String> replayed=new ArrayList<>();
   for(int i=0;i<specs.size();i++){Spec spec=specs.get(i);String value=transport.request(spec);replayed.add(value);completed++;if(value==null){unsupported++;continue;}String before=responses.get(i);if(before==null){missing++;continue;}if(!before.equals(value))changes.add(new Change(spec.oid,before,value));}
   return new Result(Math.max(0,(System.nanoTime()-start)/1000000L),completed,missing,unsupported,changes,replayed);
  }finally{transport.close();}
 }
 public static boolean isRoutine(String oid){return "1.3.6.1.2.1.1.3.0".equals(oid)||"1.3.6.1.2.1.25.1.1.0".equals(oid);}
 private ReplayEngine(){}
}

