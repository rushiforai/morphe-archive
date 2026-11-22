package app.morphe.extension.chmate;

import android.content.Context;import java.lang.reflect.*;import java.util.*;import java.util.regex.Pattern;

/** Adds real native BBS descriptors, so native BbsPreference/dialog/import/grouping remain in use. */
public final class SiteNativeBoards {
 private static final Map<String,Object> MODELS=new HashMap<>();
 static String[] nativeImageAttachments(String[] original){
  if(original==null||original.length==0)return original;
  boolean candidate=false;for(String url:original)if(animanchImage(url)){candidate=true;break;}
  if(!candidate)return original;
  Runtime runtime=Runtime.getRuntime();if(runtime.maxMemory()-runtime.totalMemory()+runtime.freeMemory()<=Math.max(4L*1024*1024,runtime.maxMemory()/100))return original;
  Context context=Haiagaru.applicationContextForExtension();if(context==null)return original;
  try{SiteBoardGateway gateway=SiteBoardGateway.get(context);String[] result=original;
   for(int i=0;i<original.length;i++){String url=original[i];if(!animanchImage(url))continue;
    String local=gateway.nativeImageUrl(url);if(local!=null&&!local.equals(url)){if(result==original)result=original.clone();result[i]=local;}
   }return result;
  }catch(Exception|OutOfMemoryError unavailable){return original;}
 }
 private static boolean animanchImage(String url){return url!=null&&(url.startsWith("https://bbs.animanch.com/img/")||url.startsWith("https://bbs.animanch.com/arc/img/"));}
 static String[] bodyImageAttachments(String body,String[] original){
  if(original==null||body==null||!body.contains("bbs.animanch.com/"))return original;
  Context context=Haiagaru.applicationContextForExtension();if(context==null)return original;
  try{SiteBoardGateway gateway=SiteBoardGateway.get(context);
   return AnimanchImageUrls.append(original,body,source->{try{return gateway.nativeImageUrl(source);}catch(Exception ignored){return null;}});
  }catch(RuntimeException unavailable){return original;}
 }
 static void rewriteInfo(Object info){
  Context context=Haiagaru.applicationContextForExtension();if(context==null||info==null)return;
  try{
   String[] fields=ExternalBoardEditor.infoFields().split(",");if(fields.length<2)return;
   Field server=NativeFields.find(info.getClass(),fields[0]),path=NativeFields.find(info.getClass(),fields[1]);
   String host=(String)server.get(info),boardPath=(String)path.get(info);
   if(!"die-or.work".equalsIgnoreCase(host)||boardPath==null)return;
   String address="https://die-or.work/"+boardPath.replaceAll("^/+|/+$","")+"/";
   SiteBoardProtocol.Board board=SiteBoardProtocol.address(address);
   if(SiteBoardProtocol.futabaTag(board).isEmpty())return;
   String local=SiteBoardGateway.get(context).localUrl(address);if(local==null)return;
   java.net.URI route=java.net.URI.create(local);
   if(!"127.0.0.1".equals(route.getHost())||route.getPort()<1)return;
   server.set(info,route.getRawAuthority());
   path.set(info,route.getPath().replaceAll("^/+|/+$",""));
  }catch(Exception unavailable){android.util.Log.w("Haiagaru","Futaba mirror board transport unavailable",unavailable);}
 }
 public static String localUrl(String address){Context context=Haiagaru.applicationContextForExtension();if(context==null)return null;try{return SiteBoardGateway.get(context).localUrl(address);}catch(Exception unavailable){return null;}}
 /** Resolve unknown Animanch thread categories on a background thread only. */
 static String resolveUnclassifiedAnimanch(String address){Context context=Haiagaru.applicationContextForExtension();if(context==null)return null;try{return SiteBoardGateway.get(context).resolveUnclassifiedAnimanch(address);}catch(Exception unavailable){android.util.Log.w("Haiagaru","Animanch category lookup unavailable",unavailable);return null;}}
 static String copiedText(String text){
  text=LocalImageArchive.copiedText(text);
  if(text==null)return null;
  if(text.contains("die-or.work")||text.contains("2chan.net/test/read.cgi/")){
   java.util.regex.Matcher external=Pattern.compile("https?://(?:die-or\\.work/|(?:img|may)\\.2chan\\.net/test/read\\.cgi/)[^\\s<>\"')）】]+").matcher(text);
   StringBuffer rewritten=new StringBuffer();
   while(external.find())external.appendReplacement(rewritten,java.util.regex.Matcher.quoteReplacement(SiteBoardProtocol.publicFutabaUrl(external.group())));
   external.appendTail(rewritten);text=rewritten.toString();
  }
  Context context=Haiagaru.applicationContextForExtension();if(context==null||!text.contains("127.0.0.1"))return text;
  java.util.regex.Matcher matcher=Pattern.compile("https?://127\\.0\\.0\\.1(?::[0-9]+)?/(?:test/read\\.cgi/"+SiteBoardGateway.KEY_PATTERN+"/[0-9]{1,12}(?:/[0-9ln-]*)?|m/"+SiteBoardGateway.KEY_PATTERN+"/(?:arc/)?img/[1-9][0-9]{0,11}/[1-9][0-9]{0,11}\\.jpg|"+SiteBoardGateway.KEY_PATTERN+"/)(?=$|[\\s<>\"')）】])").matcher(text);
  StringBuffer out=new StringBuffer();SiteBoardGateway gateway=SiteBoardGateway.get(context);while(matcher.find())matcher.appendReplacement(out,java.util.regex.Matcher.quoteReplacement(gateway.originalUrl(matcher.group())));matcher.appendTail(out);return out.toString();
 }
 static android.content.ClipData exportedClip(android.content.ClipData clip){
  if(clip==null)return null;
  try{
   ArrayList<android.content.ClipData.Item> items=new ArrayList<>();boolean changed=false;
   for(int n=0;n<clip.getItemCount();n++){
    android.content.ClipData.Item item=clip.getItemAt(n);if(item.getIntent()!=null){items.add(item);continue;}
    CharSequence original=item.getText();String text=original==null?null:copiedText(original.toString()),html=item.getHtmlText()==null?null:copiedText(item.getHtmlText());android.net.Uri uri=item.getUri();
    if(uri!=null){String target=copiedText(uri.toString());if(!target.equals(uri.toString()))uri=android.net.Uri.parse(target);}
    boolean edited=!Objects.equals(original==null?null:original.toString(),text)||!Objects.equals(item.getHtmlText(),html)||!Objects.equals(item.getUri(),uri);changed|=edited;
    items.add(edited?new android.content.ClipData.Item(text,html,null,uri):item);
   }
   if(!changed||items.isEmpty())return clip;android.content.ClipData out=new android.content.ClipData(new android.content.ClipDescription(clip.getDescription()),items.get(0));for(int n=1;n<items.size();n++)out.addItem(items.get(n));return out;
  }catch(RuntimeException unavailable){return clip;}
 }
 /** ChMate's “Open in another app” constructs a chooser directly. */
 public static void prepareBrowserChooser(android.content.Intent target){
  if(target==null||!android.content.Intent.ACTION_VIEW.equals(target.getAction()))return;
  Context owner=Haiagaru.applicationContextForExtension();
  if(owner!=null)prepareBrowserUrl(owner,target);
 }
 /** Resolve exported URLs before launching the browser while preserving explicit reader navigation. */
 static boolean prepareBrowserUrl(Context owner,android.content.Intent intent){
  android.content.ComponentName component=intent.getComponent();
  boolean browser=component==null?!owner.getPackageName().equals(intent.getPackage())
          :!owner.getPackageName().equals(component.getPackageName())||component.getClassName().equals("jp.syoboi.a2chMate.activity.WebViewActivity");
  if(!browser)return false;
  String before=intent.getDataString();
  if(before==null)return false;
  String after=SiteBoardProtocol.publicFutabaUrl(before);
  if(after.equals(before)&&"127.0.0.1".equals(intent.getData().getHost())){
   try{after=SiteBoardGateway.get(owner).originalUrl(before);}
   catch(RuntimeException unavailable){return false;}
  }
  if(after.equals(before))return false;
  intent.setDataAndType(android.net.Uri.parse(after),intent.getType());
  return true;
 }
 /** Modern ChMate upgrades compatible-board URL producers to HTTPS. */
 public static String rewriteInfoUrl(Object info,String value){
  if(info==null||value==null||!(value.startsWith("http://")||value.startsWith("https://")))return value;
  boolean directFutaba=value.startsWith("https://img.2chan.net/")||value.startsWith("http://img.2chan.net/")
          ||value.startsWith("https://may.2chan.net/")||value.startsWith("http://may.2chan.net/");
  if(!directFutaba&&!value.startsWith("https://127.0.0.1:"))return value;
  Context context=Haiagaru.applicationContextForExtension();if(context==null)return value;
  try{
   java.net.URI source=java.net.URI.create(value);
   if(source.getHost()!=null&&source.getHost().matches("(?:img|may)\\.2chan\\.net")&&source.getRawUserInfo()==null&&source.getPort()==-1){
    String[] fields=ExternalBoardEditor.infoFields().split(",");
    String host=(String)NativeFields.find(info.getClass(),fields[0]).get(info);
    String path=(String)NativeFields.find(info.getClass(),fields[1]).get(info);
    if(source.getHost().equals(host)&&"b".equals(path)){
     SiteBoardGateway gateway=SiteBoardGateway.get(context);
     String key=gateway.registeredKey(host,path);
     if(key!=null){
      String local=gateway.registrationUrl(key);
      if(source.getPath().startsWith("/b/")){
       String suffix=source.getPath().substring(3);
       if(suffix.isEmpty()||suffix.equals("SETTING.TXT")||suffix.equals("subject.txt")||suffix.matches("dat/[0-9]{1,12}\\.dat"))
        return local+suffix;
      }
      java.util.regex.Matcher thread=Pattern.compile("/test/read\\.cgi/b/([0-9]{1,12})/([0-9ln-]*)").matcher(source.getPath());
      if(thread.matches())return gateway.nativeUrl(key,SiteThreadIds.source(thread.group(1)))+thread.group(2);
     }
    }
   }
  }catch(Exception failure){android.util.Log.w("Haiagaru","Direct Futaba board transport unavailable",failure);}
  if(!value.startsWith("https://127.0.0.1:"))return value;
  try{
   java.net.URI uri=java.net.URI.create(value);if(!"127.0.0.1".equals(uri.getHost())||uri.getRawUserInfo()!=null)return value;
   String[] fields=ExternalBoardEditor.infoFields().split(",");if(fields.length!=2)return value;
   Field host=info.getClass().getDeclaredField(fields[0]),path=info.getClass().getDeclaredField(fields[1]);host.setAccessible(true);path.setAccessible(true);
   String key=(String)path.get(info);if(!uri.getRawAuthority().equals(host.get(info))||key==null||!key.matches(SiteBoardGateway.KEY_PATTERN))return value;
   if(SiteBoardGateway.get(context).registrationUrl(key).equals("http://"+uri.getRawAuthority()+"/"+key+"/"))return "http://"+value.substring("https://".length());
  }catch(Exception failure){android.util.Log.w("Haiagaru","Native added-board transport unavailable",failure);}
  return value;
 }
 /** Native URL parsing drops ports and assumes timestamp-sized thread numbers. */
 public static Object parse(String address){
  if(address==null)return null;
  if(!address.startsWith("http://127.0.0.1:")){String converted=localUrl(address);if(converted==null)return null;address=converted;}
  Context context=Haiagaru.applicationContextForExtension();if(context==null)return null;
  try{
   java.net.URI uri=java.net.URI.create(address);SiteBoardGateway gateway=SiteBoardGateway.get(context);
   if(!"127.0.0.1".equals(uri.getHost())||uri.getRawUserInfo()!=null||uri.getRawQuery()!=null)return null;
   java.util.regex.Matcher thread=Pattern.compile("/test/read\\.cgi/("+SiteBoardGateway.KEY_PATTERN+")/([0-9]{1,12})/(?:([0-9]+)|[ln][0-9]+)?").matcher(uri.getRawPath());
   java.util.regex.Matcher board=Pattern.compile("/("+SiteBoardGateway.KEY_PATTERN+")/").matcher(uri.getRawPath());
   String key;Long id=null;Integer response=null;
   if(thread.matches()){key=thread.group(1);id=SiteThreadIds.nativeInput(thread.group(2));if(thread.group(3)!=null)response=Integer.valueOf(thread.group(3));}
   else if(board.matches())key=board.group(1);else return null;
   if(!gateway.registrationUrl(key).equals("http://"+uri.getRawAuthority()+"/"+key+"/"))return null;
   Class<?> type=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,context.getClassLoader());
   Constructor<?> ctor=type.getDeclaredConstructor(String.class,String.class,Long.class,int.class,Integer.class,String.class);ctor.setAccessible(true);
   return ctor.newInstance(uri.getRawAuthority(),key,id,0,response,null);
  }catch(Exception failure){android.util.Log.w("Haiagaru","Native added-board URL unavailable",failure);return null;}
 }
 public static Iterator<?> providers(Iterator<?> original){
  Context context=Haiagaru.applicationContextForExtension();if(context==null)return original;
  return providers(original,SiteBoardGateway.get(context));
 }
 static synchronized Iterator<?> providers(Iterator<?> original,SiteBoardGateway gateway){
  ArrayList<Object> result=new ArrayList<>();original.forEachRemaining(result::add);if(result.isEmpty())return result.iterator();
  try{
   Class<?> type=result.get(0).getClass();Constructor<?> ctor=null;
   for(Constructor<?> c:type.getDeclaredConstructors()){Class<?>[] p=c.getParameterTypes();if(p.length==14&&p[0]==android.content.SharedPreferences.class&&p[6]==Pattern.class&&p[7]==Pattern.class){ctor=c;break;}}
   if(ctor==null)throw new ReflectiveOperationException("Native BBS constructor changed");ctor.setAccessible(true);Class<?>[] params=ctor.getParameterTypes();
   for(String kind:SiteBoardMenuProtocol.KINDS){
    // The native menu updater consumes this same registry. Keep unchecked
    // providers out of its board catalogue; Haiagaru settings can re-enable them.
    if(!gateway.siteEnabled(kind))continue;
    String address=gateway.siteMenuUrl(kind),name=SiteBoardMenuProtocol.title(kind),home=SiteBoardMenuProtocol.home(kind);Pattern pattern=gateway.sitePattern(kind);String signature=type.getName()+":"+kind+":"+address+":"+pattern.pattern();
    Object model=MODELS.get(signature);if(model==null){
     Object options=params[11].getDeclaredConstructor().newInstance();Object decoder=java.lang.reflect.Proxy.newProxyInstance(type.getClassLoader(),new Class<?>[]{params[12]},(proxy,method,args)->{
      if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);if(method.getName().equals("equals"))return proxy==args[0];if(method.getName().equals("toString"))return "Haiagaru board URL decoder";return args[0];
     });
     Object flags=Array.newInstance(params[13].getComponentType(),0);
     model=ctor.newInstance(gateway.prefs,SiteBoardGateway.siteProviderId(kind),name,"",home,address,pattern,null,"","",false,options,decoder,flags);
     MODELS.put(signature,model);
    }result.add(model);
   }
   if(MODELS.size()>512){Set<Object> used=Collections.newSetFromMap(new IdentityHashMap<>());used.addAll(result);MODELS.entrySet().removeIf(e->!used.contains(e.getValue()));}
  }catch(Exception failure){android.util.Log.w("Haiagaru","Native added-board descriptors unavailable",failure);}
  return result.iterator();
 }
 private SiteNativeBoards(){}
}
