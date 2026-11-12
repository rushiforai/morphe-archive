package app.morphe.extension.chmate;

import java.lang.reflect.*;
import java.net.URLDecoder;
import java.util.*;
import android.util.Log;

/** Split native unmatched boards into stable site groups without changing persisted IDs or logs. */
public final class ExternalBoardGroups {
 public static final String KEY="externalBoardSiteGroups";
 private static Object field(Object owner,String name)throws Exception{return NativeFields.find(owner.getClass(),name).get(owner);}
 private static String host(Object row,boolean modern)throws Exception{return (String)field(row,modern?"f":"server");}
 private static Object repair(Object row,boolean modern)throws Exception{
  Object stored=field(row,modern?"a":"categories");List<String> categories=stored instanceof String[]?Arrays.asList((String[])stored):(List<String>)stored;
  if(categories==null)return row;
  boolean invalid=false;LinkedHashSet<String> clean=new LinkedHashSet<>();
  for(String s:categories){if(BbsMenuHtml.scriptCategory(s))invalid=true;else if(s!=null&&!s.isEmpty())clean.add(s);}
  if(!invalid)return row;
  String server=host(row,modern);if(clean.isEmpty())clean.add(BbsMenuHtml.siteTitle(server));
  Object bid=field(row,modern?"c":"bid");String title=(String)field(row,modern?"h":"title");
  if(BbsMenuHtml.siteTitle(server).equals("エッヂ")&&URLDecoder.decode(bid.toString(),"UTF-8").endsWith("/liveedge"))title="エッヂ";
  Class<?> type=row.getClass();
  if(modern){
   Field extra=NativeFields.find(type,"d");
   return type.getConstructor(int.class,String.class,bid.getClass(),String.class,List.class,int.class,long.class,extra.getType())
    .newInstance(field(row,"b"),server,bid,title,new ArrayList<>(clean),field(row,"e"),field(row,"i"),extra.get(row));
  }
  return type.getConstructor(int.class,String.class,String.class,String.class,String[].class,byte.class,String.class,long.class)
   .newInstance(field(row,"order"),server,bid.toString(),title,clean.toArray(new String[0]),field(row,"rating"),field(row,"mExtraJson"),field(row,"updated"));
 }
 private static List<Object> repaired(List<?> rows,boolean modern)throws Exception{
  ArrayList<Object> result=new ArrayList<>(rows.size());for(Object row:rows)result.add(repair(row,modern));return result;
 }
 private static Object make(Object template,boolean modern,String id,String title,List<?> rows)throws Exception{
  Class<?> type=template.getClass();
  if(modern){Object kind=field(template,"a");return type.getConstructor(String.class,String.class,NativeFields.find(type,"a").getType(),List.class).newInstance(id,title,kind,rows);}
  Object group=type.getConstructor(String.class,String.class,String.class).newInstance(id,null,title);
  ((List<Object>)field(group,type.getName().equals("o.MediationServiceImplExternalSyntheticLambda3")?"d":"a")).addAll(rows);return group;
 }
 public static List<?> regroup(List<?> source){
  if(source==null||source.isEmpty())return source;
  try{
   String name=source.get(0).getClass().getName();boolean old=name.equals("o.MediationServiceImplExternalSyntheticLambda3"),middle=name.equals("o.ConscryptSocketAdapterCompanionfactory1"),modern=name.equals("o.setUserHandle");
   if(!old&&!middle&&!modern)return source;
   String idField=old?"a":"c",titleField=old?"c":"d",rowsField=old?"d":middle?"a":"e";
   android.content.Context context=Haiagaru.applicationContextForExtension();
   boolean splitSites=context!=null&&context.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(KEY,false);
   ArrayList<Object> result=new ArrayList<>();
   for(Object group:source){
    String id=(String)field(group,idField);List<?> original=(List<?>)field(group,rowsField);List<Object> rows=repaired(original,modern);
    if(!splitSites||!"<otherGroup>".equals(id)){
     if(modern){Object kind=field(group,"a");result.add(group.getClass().getConstructor(String.class,String.class,NativeFields.find(group.getClass(),"a").getType(),List.class).newInstance(id,field(group,titleField),kind,rows));}
     else {List<Object> nativeRows=(List<Object>)field(group,rowsField);nativeRows.clear();nativeRows.addAll(rows);result.add(group);}
     continue;
    }
    LinkedHashMap<String,List<Object>> sites=new LinkedHashMap<>();
    for(Object row:rows){String server=host(row,modern);String key=BbsMenuHtml.siteKey(server);sites.computeIfAbsent(key,k->new ArrayList<>()).add(row);}
    for(Map.Entry<String,List<Object>> entry:sites.entrySet())result.add(make(group,modern,"<haiagaru-external:"+entry.getKey()+">",BbsMenuHtml.siteTitle(entry.getKey()),entry.getValue()));
   }
   return result;
  }catch(Exception error){Log.w("Haiagaru","External board grouping unavailable",error);return source;}
 }
 public static void regroupLegacy(List<Object> source){List<?> result=regroup(source);if(result!=source){source.clear();source.addAll(result);}}
 private ExternalBoardGroups(){}
}
