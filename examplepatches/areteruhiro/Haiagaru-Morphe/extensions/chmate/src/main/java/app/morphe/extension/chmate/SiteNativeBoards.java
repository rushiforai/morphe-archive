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
 public static String localUrl(String address){Context context=Haiagaru.applicationContextForExtension();if(context==null)return null;try{return SiteBoardGateway.get(context).localUrl(address);}catch(Exception unavailable){return null;}}
 /** Resolve unknown Animanch thread categories on a background thread only. */
 static String resolveUnclassifiedAnimanch(String address){Context context=Haiagaru.applicationContextForExtension();if(context==null)return null;try{return SiteBoardGateway.get(context).resolveUnclassifiedAnimanch(address);}catch(Exception unavailable){android.util.Log.w("Haiagaru","Animanch category lookup unavailable",unavailable);return null;}}
 static String copiedText(String text){
  text=LocalImageArchive.copiedText(text);
  Context context=Haiagaru.applicationContextForExtension();if(context==null||text==null||!text.contains("127.0.0.1"))return text;
  java.util.regex.Matcher matcher=Pattern.compile("https?://127\\.0\\.0\\.1(?::[0-9]+)?/(?:test/read\\.cgi/"+SiteBoardGateway.KEY_PATTERN+"/[0-9]{1,12}/(?:[0-9ln-]+)?|m/"+SiteBoardGateway.KEY_PATTERN+"/(?:arc/)?img/[1-9][0-9]{0,11}/[1-9][0-9]{0,11}\\.jpg|"+SiteBoardGateway.KEY_PATTERN+"/)(?=$|[\\s<>\"')）】])").matcher(text);
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
 /** Modern ChMate upgrades compatible-board URL producers to HTTPS. */
 public static String rewriteInfoUrl(Object info,String value){
  if(info==null||value==null||!value.startsWith("https://127.0.0.1:"))return value;
  Context context=Haiagaru.applicationContextForExtension();if(context==null)return value;
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
