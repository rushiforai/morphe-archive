package app.morphe.extension.chmate;

import java.io.*;import java.util.*;import java.util.concurrent.*;import java.security.MessageDigest;

/** Whole-site BBSMENU catalogue, preserving source categories for native folders. */
final class SiteBoardCatalog {
 interface Menus {List<SiteBoardMenuProtocol.Choice> get(String kind,int region)throws IOException;}
 static String prefix(String kind){return kind.equals("bakusai")?"hb":kind.equals("futaba")?"hf":"ha";}
 static String key(SiteBoardProtocol.Board board){try{byte[] bytes=MessageDigest.getInstance("SHA-256").digest(board.url.getBytes("UTF-8"));StringBuilder out=new StringBuilder(prefix(board.kind));for(int n=0;n<16;n++)out.append(String.format(Locale.ROOT,"%02x",bytes[n]&255));return out.toString();}catch(Exception impossible){throw new IllegalStateException(impossible);}}
 static List<SiteBoardMenuProtocol.Choice> load(String kind,Menus source)throws IOException{
  if(!kind.equals("bakusai"))return source.get(kind,0);
  ExecutorService pool=Executors.newFixedThreadPool(4,r->{Thread t=new Thread(r,"Haiagaru-board-catalogue");t.setDaemon(true);return t;});List<Future<List<SiteBoardMenuProtocol.Choice>>> work=new ArrayList<>();
  try{for(int n=0;n<SiteBoardMenuProtocol.REGIONS.length;n++){final int region=n;work.add(pool.submit(()->source.get(kind,region)));}
   LinkedHashMap<String,SiteBoardMenuProtocol.Choice> result=new LinkedHashMap<>();for(int n=0;n<work.size();n++)for(SiteBoardMenuProtocol.Choice row:work.get(n).get(30,TimeUnit.SECONDS))result.putIfAbsent(row.url,new SiteBoardMenuProtocol.Choice(row.name,row.url,SiteBoardMenuProtocol.REGION_NAMES[n]+"／"+row.group));return new ArrayList<>(result.values());
  }catch(Exception error){if(error instanceof InterruptedException)Thread.currentThread().interrupt();throw new IOException("爆サイの地域別板一覧を全件取得できませんでした",error);}finally{for(Future<?> future:work)future.cancel(true);pool.shutdownNow();}
 }
 private SiteBoardCatalog(){}
}
