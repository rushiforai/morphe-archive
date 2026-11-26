package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.json.*;

/** Display-only HOME ordering. Never rewrites bookmarks, stars or read positions. */
public final class HomeThreadOrder {
    public static final int DRAG_TAG=0x48690135;
    public interface DragOrder { boolean move(int from,int to); void togglePin(int position); boolean pinned(int position); }
    static final String PREFS="haiagaru.home-thread-order";
    static final String FOLD_ON_TAP="homeCategoryFoldOnTap";
    static final String ENABLED="homeThreadCustomOrderEnabled";
    static final String KEYWORD_MENU="homeKeywordDisplayNameMenu";
    static boolean enabled(){Context c=Haiagaru.applicationContextForExtension();return c==null||SettingsProfiles.prefs(c).getBoolean(ENABLED,true);}
    private static final String FAVORITE_BOARDS_SECTION="\u0000favoriteBoards";
    private static final int MENU=0x48690133;
    private static final int KEYWORD_DISPLAY_MENU=0x48690139;
    private static final Map<Integer,List<?>> latest=new HashMap<>();
    private static final Map<Integer,List<?>> presented=new HashMap<>();
    private static final ThreadLocal<List<?>> expandedForDisplay=new ThreadLocal<>();
    private static final List<FoldProjection> foldProjections=new ArrayList<>();
    private static final class FoldProjection {
        final java.lang.ref.WeakReference<List<?>> rows;
        final int size;
        final List<String> sections=new ArrayList<>();final List<int[]> ranges=new ArrayList<>();
        FoldProjection(List<?> values){
            rows=new java.lang.ref.WeakReference<>(values);size=values.size();String section=null,run=null;int start=0;
            for(int i=0;i<values.size();i++){
                Object row=values.get(i);String id=key(row),part;
                if(id==null||boardDivider(row)){section=row==null?null:categoryKey(row);part=null;}
                else part=id.startsWith("board\n")?null:section;
                if(!Objects.equals(run,part)){if(start<i){sections.add(run);ranges.add(new int[]{start,i});}start=i;run=part;}
            }
            if(start<values.size()){sections.add(run);ranges.add(new int[]{start,values.size()});}
        }
    }
    private static FoldProjection projection(List<?> rows){
        synchronized(foldProjections){
            foldProjections.removeIf(p->{List<?> current=p.rows.get();return current==null||current.size()!=p.size;});
            for(FoldProjection p:foldProjections)if(p.rows.get()==rows)return p;
            FoldProjection p=new FoldProjection(rows);if(foldProjections.size()>=64)foldProjections.remove(0);foldProjections.add(p);return p;
        }
    }
    static List<?> expandedForDisplay(){return expandedForDisplay.get();}
    static List<?> refold(List<?> expanded,int mode){
        if(expanded==null)return null;
        Set<String> folded=foldedCategories(mode);
        if(folded.isEmpty()){synchronized(presented){presented.put(mode,expanded);}return expanded;}
        List<Object> result=new ArrayList<>(expanded.size());FoldProjection projection=projection(expanded);
        for(int i=0;i<projection.ranges.size();i++){
            if(folded.contains(projection.sections.get(i)))continue;
            int[] range=projection.ranges.get(i);result.addAll(expanded.subList(range[0],range[1]));
        }
        synchronized(presented){presented.put(mode,result);}
        return result;
    }
    private static final Map<Object,Integer> modes=new WeakHashMap<>();
    private static final ThreadLocal<Integer> sortingMode=new ThreadLocal<>();
    private static final Set<Object> labelRows=Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<Integer,RankOrder> rankCache=new HashMap<>();
    private static final class RankOrder {
        final String json;final Map<String,Integer> ranks;
        RankOrder(String json,Map<String,Integer> ranks){this.json=json;this.ranks=ranks;}
    }
    private static Map<String,Integer> ranks(int mode){
        int key=Math.abs(mode);String json=prefs().getString(key==101?"unreadInheritedOrder":"order:"+key,prefs().getString("order:"+key,"[]"));
        synchronized(rankCache){
            RankOrder cached=rankCache.get(key);if(cached!=null&&Objects.equals(cached.json,json))return cached.ranks;
            Map<String,Integer> ranks=new HashMap<>();
            try{JSONArray order=new JSONArray(json);for(int i=0;i<order.length();i++)ranks.put(order.getString(i),i);}catch(JSONException ignored){}
            rankCache.put(key,new RankOrder(json,Collections.unmodifiableMap(ranks)));return ranks;
        }
    }
    private static int tabMode(int mode){int value=Math.abs(mode);return value==105||value==106?102:value;}
    public static void selected(Object owner,int mode){
        synchronized(modes){modes.put(owner,tabMode(mode));}
        sortingMode.set(tabMode(mode));
    }
    static int logicalMode(int mode){
        // AdapterData uses 106 for the native starred/rating-ordered thread list.
        // Its HOME tab and custom label settings use 102.
        mode=tabMode(mode);
        Integer selected=sortingMode.get();
        return Math.abs(mode)==102&&selected!=null&&(selected==108||selected==109)?selected:Math.abs(mode);
    }
    static int mode(Object fragment){
        if(fragment==null)return 0;
        try{
            String name=fragment.getClass().getName();
            boolean middle=name.equals("jp.syoboi.a2chMate.fragment.HomeFragment");
            if(middle||name.equals("jp.syoboi.a2chMate.ui.home.HomeFragment")){
                Object model=fragment.getClass().getMethod(middle?"i":"m").invoke(fragment);
                Object flow=NativeFields.find(model.getClass(),middle?"s":"o").get(model);
                java.lang.reflect.Method read=flow.getClass().getMethod(middle?"c":"d");read.setAccessible(true);
                return tabMode(((Number)read.invoke(flow)).intValue());
            }
        }catch(Exception ignored){}

        synchronized(modes){Integer value=modes.get(fragment);if(value!=null)return tabMode(value);}
        try{Object model=fragment.getClass().getMethod("m").invoke(fragment);synchronized(modes){Integer value=modes.get(model);if(value!=null)return tabMode(value);}}catch(Exception ignored){}
        return 0;
    }
    private static SharedPreferences prefs(){return Haiagaru.applicationContextForExtension().getSharedPreferences(PREFS,0);}
    private static boolean target(int mode){int m=tabMode(mode);return m==100||m==101||m==102||m==103||m==104||m==107||m==108||m==109;}
    static String key(Object row){
        if(row==null)return null;
        if("板一覧へ".equals(label(row)))return "board\n@navigation";
        String type=row.getClass().getName(),board,id;
        if(type.equals("o.onAdDisplayed$setIcon")){board="g";id="h";}
        else if(type.equals("o.Yy2$open")){board="b";id="g";}
        else if(type.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")){board="e";id="b";}
        else {
            String field=type.equals("o.onAdDisplayed$IconCompatParcelizer")?"a":type.equals("o.Yy2$RemoteActionCompatParcelizer")?"d":type.equals("o.getAvailabilityStatus$ComponentActivity")?"a":null;
            if(field==null)return null;
            try{Object value=NativeFields.find(row.getClass(),field).get(row);return value==null?null:"board\n"+value;}catch(Exception unavailable){return null;}
        }
        try{Object b=NativeFields.find(row.getClass(),board).get(row);long thread=NativeFields.find(row.getClass(),id).getLong(row);return b==null||thread<=0?null:b.toString()+"\n"+thread;}catch(Exception unavailable){return null;}
    }
    static List<?> apply(List<?> source,int mode){
        mode=logicalMode(mode);
        expandedForDisplay.remove();
        List<?> rows=apply(source,mode,true);
        if(expandedForDisplay.get()==null)expandedForDisplay.set(rows);
        if(target(mode))synchronized(presented){presented.put(mode,rows);}
        return rows;
    }

    // Search rows already have the native result order and no custom category projection.
    static List<?> applyModernSearch(List<?> rows, int mode) {
        expandedForDisplay.remove();
        if (rows == null || !target(mode)) return rows;
        List<?> result = uniqueRows(rows);
        synchronized (presented) {
            presented.put(tabMode(mode), result);
        }
        return result;
    }

    private static List<?> uniqueRows(List<?> source) {
        ArrayList<Object> clean=new ArrayList<>();
        Set<String> seen=new HashSet<>();
        for(Object row:source){
            if(labelRows.contains(row))continue;
            String id=key(row);
            if(id==null||seen.add(id))clean.add(row);
        }
        return clean;
    }

    private static boolean searchActive(){
        for(Activity activity:GlobalSearchHome.activitiesForLabels()){
            if(activity!=null&&!activity.isFinishing()
                    &&GlobalSearchHome.hasSearchText(activity.getWindow().getDecorView()))return true;
        }
        return false;
    }

    static List<?> presented(int mode){
        synchronized(presented){return presented.get(tabMode(mode));}
    }
    /** Resolve positions against the adapter displaying them. The next model may already differ. */
    static List<?> presented(View list, int mode) {
        if (list == null) return presented(mode);
        if (!(list instanceof ListView)) return modernPresented(list, mode);
        ListView visible = (ListView) list;
        ListAdapter adapter = visible.getAdapter();
        if (adapter == null) return Collections.emptyList();
        String field;
        switch (adapter.getClass().getName()) {
            case "o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA": field = "j"; break;
            case "o.bea1": field = "d"; break;
            default: field = null;
        }
        if (field != null) {
            try {
                Object current = NativeFields.find(adapter.getClass(), field).get(adapter);
                if (current instanceof List<?>) {
                    List<?> rows = (List<?>) current;
                    int size = rows.size();
                    if (size == adapter.getCount() &&
                            (size == 0 || (rows.get(0) == adapter.getItem(0)
                                    && rows.get(size - 1) == adapter.getItem(size - 1)))) return rows;
                }
            } catch (ReflectiveOperationException ignored) {}
        }
        return new AbstractList<Object>() {
            @Override public int size() { return adapter.getCount(); }
            @Override public Object get(int index) { return adapter.getItem(index); }
        };
    }

    private static List<?> modernPresented(View list, int mode) {
        try {
            Object adapter=list.getClass().getMethod("getAdapter").invoke(list);
            if(adapter==null)return Collections.emptyList();
            if(!adapter.getClass().getName().equals("o.ModuleInstallStatusCodes"))return presented(mode);
            // 242's native adapter uses the committed AsyncListDiffer list. Its
            // positions include native header rows and can lag the next model.
            Object differ=NativeFields.find(adapter.getClass().getSuperclass(),"b").get(adapter);
            Object rows=differ==null?null:NativeFields.find(differ.getClass(),"a").get(differ);
            return rows instanceof List<?>?(List<?>)rows:Collections.emptyList();
        }catch(ReflectiveOperationException unavailable){
            return Collections.emptyList();
        }
    }

    static boolean canReorder(int mode) { return target(mode); }

    private static List<?> apply(List<?> source,int mode,boolean respectFolds){
        if(source==null||!target(mode)||Haiagaru.applicationContextForExtension()==null)return source;

        // Unread keyword headings and repeated matches belong to the native grouping.
        if(mode==101){
            Map<String,Integer> inherited=ranks(mode);
            ArrayList<Object> result=new ArrayList<>();ArrayList<Object> group=new ArrayList<>();
            Comparator<Object> order=Comparator.comparingInt(row->inherited.getOrDefault(key(row),Integer.MAX_VALUE));
            for(Object row:source){
                if(key(row)==null||isBoard(key(row))){group.sort(order);result.addAll(group);group.clear();result.add(row);}
                else group.add(row);
            }
            group.sort(order);result.addAll(group);return result;
        }
        source = uniqueRows(source);
        if(searchActive())return source;
        synchronized(latest){latest.put(mode,new ArrayList<>(source));}
        Map<String,Integer> ranks=ranks(mode);
        Set<String> pinned=prefs().getStringSet("pins:"+Math.abs(mode),Collections.emptySet());JSONObject labels=visibleLabels(mode);
        Set<String> folded=respectFolds?foldedCategories(mode):Collections.emptySet();
        boolean customSectionOrder=prefs().contains("sectionOrder:"+Math.abs(mode))||prefs().contains("boardSectionOrder:"+Math.abs(mode));
        if(mode==102&&containsBoardSections(source))
            return applyBoardSections(source,mode,ranks,pinned,respectFolds);
        if(ranks.isEmpty()&&pinned.isEmpty()&&labels.length()==0&&folded.isEmpty()&&!customSectionOrder)return source;
        if(mode==107){
            // Only board rows participate in board ordering. Navigation rows keep their native slots.
            ArrayList<Object> boards=new ArrayList<>();
            for(Object row:source)if(isBoard(key(row)))boards.add(row);
            boards.sort(Comparator.comparingInt(row->ranks.getOrDefault(key(row),Integer.MAX_VALUE)));
            ArrayList<Object> ordered=new ArrayList<>(source.size());
            int boardIndex=0;
            for(Object row:source)ordered.add(isBoard(key(row))?boards.get(boardIndex++):row);
            return ordered;
        }
        Map<String,String> labelForThread=new HashMap<>();
        Map<String,Object> labelHeadings=new LinkedHashMap<>();
        for(String name:orderedLabels(labels,mode)){
            Object heading=labelHeading(source,name);
            if(heading==null)continue;
            labelHeadings.put(categoryKey(heading),heading);
            JSONArray members=labels.optJSONArray(name);
            if(members!=null)for(int i=0;i<members.length();i++)labelForThread.putIfAbsent(members.optString(i),categoryKey(heading));
        }
        // Keep native category headings while allowing explicit display placement across them.
        Map<String,String> placements=new HashMap<>();
        try{JSONObject saved=new JSONObject(prefs().getString("categories:"+Math.abs(mode),"{}"));
            Iterator<String> savedKeys=saved.keys();while(savedKeys.hasNext()){String name=savedKeys.next();placements.put(name,saved.getString(name));}
        }catch(JSONException ignored){}
        Set<String> categories=new HashSet<>();categories.add("");
        for(Object row:source)if(key(row)==null)categories.add(categoryKey(row));
        Map<String,List<Object>> buckets=new HashMap<>();String category="";
        for(Object row:source){
            if(isFavoriteBoardsRow(row))continue;
            String id=key(row);
            if(id==null){
                category=categoryKey(row);
                continue;
            }
            String target=labelForThread.get(id);
            if(id.startsWith("board\n"))continue;
            if(target==null){target=placements.get(id);if(target==null||!categories.contains(target))target=category;}
            buckets.computeIfAbsent(target,k->new ArrayList<>()).add(row);
        }
        Comparator<Object> comparator=Comparator.comparingInt(row->ranks.getOrDefault(key(row),Integer.MAX_VALUE));
        for(Map.Entry<String,List<Object>> bucket:buckets.entrySet())
            if(!labelHeadings.containsKey(bucket.getKey()))bucket.getValue().sort(comparator);
        ArrayList<Object> result=new ArrayList<>(source.size());
        List<Object> favoriteBoards=new ArrayList<>();
        Map<String,Object> sections=new LinkedHashMap<>(labelHeadings);
        for(Object row:source){
            String id=key(row);
            if(isFavoriteBoardsRow(row)||isBoard(id)) {
                favoriteBoards.add(row);
            } else if(row!=null&&id==null) {
                sections.putIfAbsent(categoryKey(row),row);
            }
        }
        if(!favoriteBoards.isEmpty())sections.put(FAVORITE_BOARDS_SECTION,null);
        for(String categoryKey:sectionOrder(mode,sections.keySet())){
            if(FAVORITE_BOARDS_SECTION.equals(categoryKey)){
                result.addAll(favoriteBoards);
                continue;
            }
            Object heading=sections.get(categoryKey);
            result.add(heading);
            result.addAll(buckets.getOrDefault(categoryKey,Collections.emptyList()));
        }
        result.addAll(buckets.getOrDefault("",Collections.emptyList()));
        if(respectFolds){expandedForDisplay.set(result);return refold(result,mode);}
        return result;
    }

    private static boolean containsBoardSections(List<?> rows){
        for(Object row:rows)if(boardDivider(row))return true;
        return false;
    }

    /** Keep each native board heading with its thread rows while folding and reordering headings. */
    private static List<?> applyBoardSections(List<?> source,int mode,Map<String,Integer> ranks,
            Set<String> pinned,boolean respectFolds){
        LinkedHashMap<String,Object> headings=new LinkedHashMap<>();
        Map<String,List<Object>> members=new HashMap<>();
        List<Object> loose=new ArrayList<>();String section=null;
        for(Object row:source){
            if(boardDivider(row)||isBoardSectionRow(row)){
                section=categoryKey(row);headings.putIfAbsent(section,row);members.computeIfAbsent(section,k->new ArrayList<>());continue;
            }
            if(isFavoriteBoardsRow(row)){section=null;loose.add(row);continue;}
            String id=key(row);
            if(id==null){
                if(row!=null){section=categoryKey(row);headings.putIfAbsent(section,row);members.computeIfAbsent(section,k->new ArrayList<>());}
                else {section=null;loose.add(row);}
            }else if(section==null||isBoard(id))loose.add(row);
            else members.computeIfAbsent(section,k->new ArrayList<>()).add(row);
        }
        if(headings.isEmpty())return source;
        Comparator<Object> comparator=Comparator
            .comparing((Object row)->!pinned.contains(key(row)))
            .thenComparingInt(row->ranks.getOrDefault(key(row),Integer.MAX_VALUE));
        List<Object> result=new ArrayList<>(source.size());
        result.addAll(loose);
        List<String> order=new ArrayList<>(headings.keySet());
        try{JSONArray saved=new JSONArray(prefs().getString("boardSectionOrder:"+mode,"[]"));
            List<String> restored=new ArrayList<>();for(int i=0;i<saved.length();i++){String key=saved.optString(i);if(order.remove(key))restored.add(key);}restored.addAll(order);order=restored;
        }catch(JSONException ignored){}
        for(String key:order){
            Object heading=headings.get(key);if(heading==null)continue;
            result.add(heading);
            List<Object> threads=members.get(key);
            if(threads!=null){threads.sort(comparator);result.addAll(threads);}
        }
        expandedForDisplay.set(result);
        return respectFolds?refold(result,mode):result;
    }

    private static Set<String> foldedCategories(int mode){
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null||!SettingsProfiles.prefs(context).getBoolean(FOLD_ON_TAP,true))return Collections.emptySet();
        return prefs().getStringSet("foldedCategories:"+Math.abs(mode),Collections.emptySet());
    }

    static boolean toggleCategory(Object fragment,Object row){
        Activity activity=Haiagaru.toolbarActivity(fragment);
        if(activity==null||row==null||isFavoriteBoardsRow(row)||key(row)!=null)return false;
        int mode=logicalMode(mode(fragment));
        if(!target(mode)||mode==107)return false;
        String title=label(row);
        boolean custom=customLabel(row,mode)!=null;
        if(!custom&&!hasCategoryThreads(mode,row))return false;
        if(!SettingsProfiles.prefs(activity).getBoolean(FOLD_ON_TAP,true))return custom;
        String key=categoryKey(row),setting="foldedCategories:"+Math.abs(mode);
        Set<String> folded=new HashSet<>(foldedCategories(mode));
        if(!folded.remove(key))folded.add(key);
        prefs().edit().putStringSet(setting,folded).apply();
        BrowsingHistory.refreshCategory(fragment,activity,mode);
        return true;
    }

    static boolean boardSection(Object row){return boardDivider(row);}
    static boolean boardSectionFolded(Object row,int mode){
        return row!=null&&foldedCategories(mode).contains(categoryKey(row));
    }
    static void setBoardSectionFolded(Object fragment,Object row,int mode,boolean collapse){
        Activity activity=Haiagaru.toolbarActivity(fragment);
        if(activity==null||row==null||!boardDivider(row))return;
        String key=categoryKey(row),setting="foldedCategories:"+Math.abs(mode);
        Set<String> folded=new HashSet<>(prefs().getStringSet(setting,Collections.emptySet()));
        boolean changed=collapse?folded.add(key):folded.remove(key);
        if(!changed)return;
        prefs().edit().putStringSet(setting,folded).apply();
        BrowsingHistory.refreshCategory(fragment,activity,mode);
    }

    private static boolean hasCategoryThreads(int mode,Object heading){
        List<?> rows;
        synchronized(latest){rows=latest.get(mode);}
        if(rows==null)return false;
        String group=categoryKey(heading);
        if(foldedCategories(mode).contains(group))return true;
        for(int i=0;i+1<rows.size();i++){
            Object item=rows.get(i);
            String next=key(rows.get(i+1));
            if(item!=null&&key(item)==null&&group.equals(categoryKey(item))
                    &&next!=null&&!next.startsWith("board\n"))return true;
        }
        return false;
    }

    private static List<String> sectionOrder(int mode,Collection<String> sections){
        Set<String> remaining=new LinkedHashSet<>(sections);
        List<String> result=new ArrayList<>();
        try{
            JSONArray saved=new JSONArray(prefs().getString("sectionOrder:"+mode,"[]"));
            for(int i=0;i<saved.length();i++){
                String key=saved.optString(i);
                if(remaining.remove(key))result.add(key);
            }
        }catch(JSONException ignored){}
        // New custom labels appear above the existing categories.
        JSONObject labels=visibleLabels(mode);
        List<String> added=new ArrayList<>();
        for(String key:new ArrayList<>(remaining)){
            if(labels.has(key.substring(key.indexOf('\n')+1))){
                added.add(key);remaining.remove(key);
            }
        }
        if(remaining.remove(FAVORITE_BOARDS_SECTION))result.add(0,FAVORITE_BOARDS_SECTION);
        int afterBoards=result.indexOf(FAVORITE_BOARDS_SECTION)+1;
        result.addAll(afterBoards,added);
        result.addAll(remaining);
        return result;
    }

    public static boolean legacyLabelLongClick(Object owner,android.widget.AdapterView<?> list,int position){
        if(list==null||position<0||position>=list.getCount())return false;
        Object fragment=owner;
        if(owner.getClass().getName().endsWith("$9")){
            try{fragment=NativeFields.find(owner.getClass(),"c").get(owner);}
            catch(ReflectiveOperationException error){return false;}
        }
        return labelLongClick(fragment,list.getItemAtPosition(position));
    }

    public static boolean labelLongClick(Object fragment,Object row){
        if(HomeThreadDrag.active(fragment))return true;
        int mode=mode(fragment);
        String oldName=customLabel(row,mode);
        Activity activity=Haiagaru.toolbarActivity(fragment);
        if(oldName==null||activity==null)return false;
        EditText input=new EditText(activity);input.setSingleLine(true);input.setText(oldName);
        input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(60)});
        new HaiagaruDialog.Builder(activity).setTitle("ラベル名を変更").setView(input)
            .setNegativeButton("キャンセル",null).setPositiveButton("保存",(dialog,which)->{
                String name=input.getText().toString().trim();
                JSONObject labels=readLabels(mode);
                if(name.isEmpty()||name.equals(oldName))return;
                if(labels.has(name)){Toast.makeText(activity,"同じ名前のラベルがあります",Toast.LENGTH_SHORT).show();return;}
                JSONArray members=labels.optJSONArray(oldName);
                if(members==null)return;
                ArrayList<String> order=orderedLabels(labels,mode);
                int at=order.indexOf(oldName);
                if(at<0)return;
                try{labels.put(name,members);}
                catch(JSONException error){return;}
                labels.remove(oldName);
                order.set(at,name);
                String setting="foldedCategories:"+Math.abs(mode);
                Set<String> folded=new HashSet<>(prefs().getStringSet(setting,Collections.emptySet()));
                if(folded.remove(categoryKey(row)))folded.add(row.getClass().getName()+"\n"+name);
                prefs().edit().putString("labels:"+mode,labels.toString())
                    .putString("labelOrder:"+mode,new JSONArray(order).toString()).putStringSet(setting,folded).apply();
                BrowsingHistory.refreshVisible(activity);
            }).show();
        return true;
    }

    static JSONObject visibleLabels(int mode){
        JSONObject result=new JSONObject();
        for(int origin:new int[]{100,101,102,103,104,108,109}){
            JSONObject labels=readLabels(origin);
            Iterator<String> names=labels.keys();
            while(names.hasNext()){
                String name=names.next();
                Set<String> defaults=Collections.singleton(Integer.toString(origin));
                Set<String> targets=prefs().getStringSet("labelTargets:"+origin+":"+name,defaults);
                if(origin!=mode&&!targets.contains(Integer.toString(mode)))continue;
                if(origin==mode&&!targets.contains(Integer.toString(mode)))continue;
                try{if(!result.has(name))result.put(name,labels.getJSONArray(name));}
                catch(JSONException ignored){}
            }
        }
        return result;
    }

    private static JSONObject readLabels(int mode){
        try{return new JSONObject(prefs().getString("labels:"+mode,"{}"));}
        catch(JSONException invalid){return new JSONObject();}
    }

    static String customLabel(Object row,int mode){
        if(row==null||isFavoriteBoardsRow(row)||key(row)!=null)return null;
        String name=label(row);
        if(!visibleLabels(mode).has(name))return null;
        Object heading=labelHeading(Collections.singletonList(row),name);
        return sameHeading(row,heading)?name:null;
    }

    private static boolean isBoard(String key){
        return key!=null&&key.startsWith("board\n");
    }

    private static boolean isFavoriteBoardsRow(Object row){
        return row!=null&&row.getClass().getName().equals("o.getAvailabilityStatus$write");
    }
    private static boolean isBoardSectionRow(Object row){
        if(row==null)return false;String type=row.getClass().getName();
        return type.equals("o.onAdDisplayed$write")||type.equals("o.Yy2$write")
            ||type.equals("o.getAvailabilityStatus$RemoteActionCompatParcelizer");
    }
    private static boolean boardDivider(Object row){
        if(row==null||!isBoard(key(row)))return false;
        for(java.lang.reflect.Field field:NativeFields.all(row.getClass()))if(field.getType()==boolean.class){
            try{field.setAccessible(true);return field.getBoolean(row);}catch(Exception ignored){}
        }
        return false;
    }

    static String sectionKey(Object row){
        if(row==null)return null;
        if(boardDivider(row))return categoryKey(row);
        if(isBoardSectionRow(row))return categoryKey(row);
        if(isFavoriteBoardsRow(row))return FAVORITE_BOARDS_SECTION;
        String id=key(row);
        return id==null?categoryKey(row):isBoard(id)?FAVORITE_BOARDS_SECTION:null;
    }

    static boolean moveLabel(Object source,Object target,int mode,List<?> rows){
        if(rows==null)return false;
        List<String> order=displayedSections(rows,mode);
        int from=order.indexOf(sectionKey(source)),to=order.indexOf(sectionKey(target));
        if(from<0||to<0||from==to)return false;
        order.add(to,order.remove(from));
        boolean boardOrder=boardDivider(source)&&boardDivider(target);
        prefs().edit().putString((boardOrder?"boardSectionOrder:":"sectionOrder:")+mode,new JSONArray(order).toString()).apply();
        return true;
    }

    private static ArrayList<String> displayedSections(List<?> rows,int mode){
        Set<String> sections=new LinkedHashSet<>();
        if(rows!=null)for(Object row:rows){
            String section=sectionKey(row);
            if(section!=null)sections.add(section);
        }
        return new ArrayList<>(sections);
    }

    private static ArrayList<String> orderedLabels(JSONObject labels,int mode){
        LinkedHashSet<String> names=new LinkedHashSet<>();
        try{
            JSONArray saved=new JSONArray(prefs().getString("labelOrder:"+mode,"[]"));
            for(int i=0;i<saved.length();i++){
                String name=saved.optString(i);
                if(labels.has(name))names.add(name);
            }
        }catch(JSONException ignored){}
        Iterator<String> remaining=labels.keys();
        while(remaining.hasNext())names.add(remaining.next());
        return new ArrayList<>(names);
    }

    private static void labelActions(Activity activity,int mode,List<?> rows,JSONObject labels,String name){
        editLabel(activity,mode,rows,labels,name);
    }

    private static void confirmDeleteLabel(Activity activity,int mode,String name){
        new HaiagaruDialog.Builder(activity).setTitle("ラベルを削除")
            .setMessage("「"+name+"」を削除します。所属スレは元のカテゴリに戻ります。")
            .setNegativeButton("キャンセル",null).setPositiveButton("削除",(dialog,which)->{
                JSONObject labels=readLabels(mode);
                if(!labels.has(name))return;
                labels.remove(name);
                prefs().edit().putString("labels:"+mode,labels.toString())
                    .putString("labelOrder:"+mode,new JSONArray(orderedLabels(labels,mode)).toString()).apply();
                BrowsingHistory.refreshVisible(activity);
            }).show();
    }

    private static LinearLayout labelMoveButtons(Activity activity,int mode,ArrayList<String> order,int index){
        LinearLayout controls=new LinearLayout(activity);
        TextView position=new TextView(activity);
        Button up=new Button(activity);up.setText("上のラベルに移動する");
        Button down=new Button(activity);down.setText("下のラベルに移動する");
        controls.setOrientation(LinearLayout.VERTICAL);
        controls.addView(position);controls.addView(up);controls.addView(down);
        String name=order.get(index);
        Runnable update=()->{
            int current=order.indexOf(name);
            position.setText((current+1)+" / "+order.size());
            up.setEnabled(current>0);
            down.setEnabled(current<order.size()-1);
        };
        View.OnClickListener move=view->{
            int current=order.indexOf(name),destination=current+(view==up?-1:1);
            if(destination<0||destination>=order.size())return;
            Collections.swap(order,current,destination);
            prefs().edit().putString("sectionOrder:"+mode,new JSONArray(order).toString()).apply();
            BrowsingHistory.refreshVisible(activity);
            update.run();
        };
        up.setOnClickListener(move);down.setOnClickListener(move);update.run();
        return controls;
    }

    private static Object labelHeading(List<?> source,String title){
        for(Object row:source){
            if(row==null)continue;
            String name=row.getClass().getName();
            String heading=name.startsWith("o.onAdDisplayed$")?"o.onAdDisplayed$write":
                name.startsWith("o.Yy2$")?"o.Yy2$write":
                name.startsWith("o.getAvailabilityStatus$")?"o.getAvailabilityStatus$RemoteActionCompatParcelizer":null;
            if(heading==null)continue;
            try{
                Class<?> type=Class.forName(heading,false,row.getClass().getClassLoader());
                java.lang.reflect.Constructor<?> ctor=type.getDeclaredConstructor(String.class);
                ctor.setAccessible(true);
                Object headingRow=ctor.newInstance(title);
                labelRows.add(headingRow);
                return headingRow;
            }catch(ReflectiveOperationException error){return null;}
        }
        return null;
    }

    static void labels(Activity activity,int mode){
        if(activity==null)return;
        List<?> rows; synchronized(latest){rows=latest.get(mode);}
        if(rows==null)rows=Collections.emptyList();
        final List<?> availableRows=rows;
        JSONObject labels=readLabels(mode);
        ArrayList<String> names=new ArrayList<>();
        names.add("ラベルを新規作成");
        LinkedHashSet<String> editable=new LinkedHashSet<>(orderedLabels(labels,mode));
        editable.addAll(orderedLabels(visibleLabels(mode),mode));
        names.addAll(editable);
        new HaiagaruDialog.Builder(activity).setTitle("スレのラベル")
            .setItems(names.toArray(new String[0]),(dialog,index)->{
                if(index>0){
                    String name=names.get(index);
                    if(labels.has(name)){labelActions(activity,mode,availableRows,labels,name);return;}
                    for(int origin:new int[]{100,101,102,103,104,108,109}){
                        JSONObject original=readLabels(origin);
                        if(!original.has(name)||!prefs().getStringSet("labelTargets:"+origin+":"+name,
                                Collections.singleton(Integer.toString(origin))).contains(Integer.toString(mode)))continue;
                        List<?> originalRows;
                        synchronized(latest){originalRows=latest.get(origin);}
                        editLabel(activity,origin,originalRows==null?availableRows:originalRows,original,name,mode);
                        return;
                    }
                }
                EditText input=new EditText(activity);input.setSingleLine(true);input.setHint("ラベル名");
                input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(60)});
                new HaiagaruDialog.Builder(activity).setTitle("ラベルを新規作成").setView(input)
                    .setNegativeButton("キャンセル",null).setPositiveButton("次へ",(d,w)->{
                        String name=input.getText().toString().trim();
                        if(!name.isEmpty())editLabel(activity,mode,availableRows,labels,name);
                    }).show();
            }).setNegativeButton("閉じる",null).show();
    }

    private static void labelTargets(Activity activity,int origin,String name){
        int[] modes={103,104,102,101};
        String[] titles={"閲覧履歴","書き込み履歴","スレ","未読"};
        String setting="labelTargets:"+origin+":"+name;
        Set<String> selected=new HashSet<>(prefs().getStringSet(setting,Collections.singleton(Integer.toString(origin))));
        boolean[] checked=new boolean[modes.length];
        for(int i=0;i<modes.length;i++)checked[i]=selected.contains(Integer.toString(modes[i]));
        new HaiagaruDialog.Builder(activity).setTitle("ラベルの表示先")
            .setMultiChoiceItems(titles,checked,(dialog,index,on)->{
                String target=Integer.toString(modes[index]);
                if(on)selected.add(target);else selected.remove(target);
            }).setNegativeButton("キャンセル",null).setPositiveButton("保存",(dialog,which)->{
                prefs().edit().putStringSet(setting,selected).apply();
                BrowsingHistory.refreshVisible(activity);
            }).show();
    }

    private static void editLabel(Activity activity,int mode,List<?> rows,JSONObject labels,String name){
        editLabel(activity,mode,rows,labels,name,mode);
    }

    private static void editLabel(Activity activity,int mode,List<?> rows,JSONObject labels,String name,int displayMode){
        LinkedHashMap<String,String> threads=new LinkedHashMap<>();
        for(Object row:rows){
            String id=key(row);
            if(id!=null&&!id.startsWith("board\n"))threads.putIfAbsent(id,label(row));
        }
        ArrayList<String> ids=new ArrayList<>(threads.keySet());
        Set<String> members=new LinkedHashSet<>();
        JSONArray saved=labels.optJSONArray(name);
        if(saved!=null)for(int i=0;i<saved.length();i++)members.add(saved.optString(i));
        boolean[] checked=new boolean[ids.size()];
        for(int i=0;i<ids.size();i++)checked[i]=members.contains(ids.get(i));
        LinearLayout title=new LinearLayout(activity);
        title.setOrientation(LinearLayout.VERTICAL);
        TextView heading=new TextView(activity);
        heading.setText("所属スレを編集："+name);
        heading.setTextSize(18);
        title.addView(heading);
        Button destinations=new Button(activity);
        destinations.setText("ラベルの表示先");
        destinations.setOnClickListener(view->labelTargets(activity,mode,name));
        title.addView(destinations);
        Object editedHeading=labelHeading(rows,name);
        if(editedHeading!=null&&readLabels(mode).has(name)){
            String editedKey=categoryKey(editedHeading);
            ArrayList<String> ordering=displayedSections(displayed(displayMode),displayMode);
            int position=ordering.indexOf(editedKey);
            if(position>=0)title.addView(labelMoveButtons(activity,displayMode,ordering,position));
        }
        new HaiagaruDialog.Builder(activity).setCustomTitle(title)
            .setNeutralButton("ラベルを削除",(dialog,which)->confirmDeleteLabel(activity,mode,name))
            .setMultiChoiceItems(threads.values().toArray(new String[0]),checked,(d,i,on)->{
                if(on)members.add(ids.get(i));else members.remove(ids.get(i));
            }).setPositiveButton("保存",(d,w)->{
                try{
                    JSONObject updated=readLabels(mode);
                    boolean created=!updated.has(name);
                    updated.put(name,new JSONArray(members));
                    SharedPreferences.Editor editor=prefs().edit().putString("labels:"+mode,updated.toString());
                    if(created){
                        ArrayList<String> order=orderedLabels(updated,mode);
                        order.remove(name);order.add(0,name);
                        editor.putString("labelOrder:"+mode,new JSONArray(order).toString());
                    }
                    editor.apply();
                    BrowsingHistory.refreshVisible(activity);
                }
                catch(JSONException error){android.util.Log.w("Haiagaru","Could not save HOME label",error);}
            }).setNegativeButton("キャンセル",null).show();
    }

    public static void menu(Object fragment,Menu menu){
        HomeBoardFoldLabels.menu(fragment,menu);
        ResponseNotes.homeMenu(fragment,menu);
        GlobalSearchHome.menu(fragment,menu);
        if(menu!=null&&menu.findItem(KEYWORD_DISPLAY_MENU)==null){
            menu.add(Menu.NONE,KEYWORD_DISPLAY_MENU,Menu.NONE,"キーワードの表示名を設定")
                .setOnMenuItemClickListener(item->{DisplayNames.showKeywords(Haiagaru.toolbarActivity(fragment));return true;});
        }
        if(menu!=null&&menu.findItem(KEYWORD_DISPLAY_MENU)!=null){
            Context context=Haiagaru.applicationContextForExtension();
            menu.findItem(KEYWORD_DISPLAY_MENU).setVisible(context!=null&&SettingsProfiles.prefs(context).getBoolean(KEYWORD_MENU,false));
        }
        if(menu==null)return;
        MenuItem item=menu.findItem(MENU);if(item==null){item=menu.add(Menu.NONE,MENU,Menu.NONE,"並び替える");item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);item.setOnMenuItemClickListener(v->{showInline(fragment);return true;});}item.setTitle(HomeThreadDrag.active(fragment)?"並び替えを終了":"並び替える");item.setVisible(enabled()&&target(mode(fragment)));
    }
    private static void showInline(Object fragment){
        Activity activity=Haiagaru.toolbarActivity(fragment);if(activity==null)return;
        try{View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
            int selected=mode(fragment);
            HomeThreadDrag.toggle(activity,fragment,root,selected);
        }catch(Exception error){android.util.Log.w("Haiagaru","HOME drag unavailable",error);}
    }
    static List<?> displayed(int mode){List<?> rows=presented(mode);return rows==null?null:new ArrayList<>(rows);}
    static void confirmResetOrder(Activity activity,int mode){
        new HaiagaruDialog.Builder(activity).setTitle("元の並び順に戻す")
            .setMessage("この一覧のスレとカテゴリを、手動で並び替える前の順序に戻します。ラベルと所属スレは残ります。")
            .setNegativeButton("キャンセル",null).setPositiveButton("戻す",(dialog,which)->{
                int key=Math.abs(mode);
                prefs().edit().remove("order:"+key).remove("categories:"+key)
                    .remove("labelOrder:"+key).remove("sectionOrder:"+key).apply();
                BrowsingHistory.refreshVisible(activity);
            }).show();
    }

    static Set<String> pins(int mode){return prefs().getStringSet("pins:"+Math.abs(mode),Collections.emptySet());}
    static boolean pinned(String key,int mode){return pins(mode).contains(key);}
    static void togglePin(String key,int mode){
        if(key==null)return;Set<String> pins=new HashSet<>(prefs().getStringSet("pins:"+Math.abs(mode),Collections.emptySet()));
        if(!pins.remove(key))pins.add(key);prefs().edit().putStringSet("pins:"+Math.abs(mode),pins).apply();
    }
    static boolean dropThread(Object thread,Object destination,int mode,boolean downward){
        if(mode==107&&(!isBoard(key(thread))||!isBoard(key(destination))))return false;
        List<?> source;
        synchronized(latest){source=latest.get(mode);}
        if(source==null)return false;
        ArrayList<Object> rows=new ArrayList<>(apply(source,mode,false));
        int from=rows.indexOf(thread);
        if(from<0)return false;
        rows.remove(from);
        for(int i=0;i<rows.size();i++){
            Object row=rows.get(i);
            if(row!=destination&&!sameHeading(row,destination))continue;
            boolean heading=key(row)==null;
            int insertion=i+(heading||downward?1:0);
            rows.add(insertion,thread);
            saveDisplay(rows,mode);
            return true;
        }
        return false;
    }

    private static void saveDisplay(List<?> rows,int mode){
        ArrayList<String> order=new ArrayList<>();JSONObject categories=new JSONObject();String category="";
        for(Object row:rows){String id=key(row);if(id==null){category=categoryKey(row);continue;}order.add(id);try{categories.put(id,category);}catch(JSONException ignored){}}
        JSONObject labels=readLabels(mode);
        Iterator<String> names=labels.keys();
        while(names.hasNext()){
            String name=names.next();
            Object heading=labelHeading(rows,name);
            if(heading==null)continue;
            String target=categoryKey(heading);
            Set<String> members=new LinkedHashSet<>();
            JSONArray previous=labels.optJSONArray(name);
            if(previous!=null)for(int i=0;i<previous.length();i++)members.add(previous.optString(i));
            for(String id:order){
                if(target.equals(categories.optString(id)))members.add(id);
                else members.remove(id);
            }
            try{labels.put(name,new JSONArray(members));}
            catch(JSONException error){android.util.Log.w("Haiagaru","Could not update HOME label",error);}
        }
        if(mode==100||mode==102||mode==103||mode==104)
            prefs().edit().putString("unreadInheritedOrder",new JSONArray(order).toString()).apply();
        prefs().edit().putString("order:"+Math.abs(mode),new JSONArray(order).toString())
            .putString("categories:"+Math.abs(mode),categories.toString())
            .putString("labels:"+mode,labels.toString()).apply();
    }
    static boolean sameHeading(Object first,Object second){
        return first!=null&&second!=null&&first.getClass()==second.getClass()
            &&key(first)==null&&key(second)==null&&categoryKey(first).equals(categoryKey(second));
    }

    private static String categoryKey(Object row){return row.getClass().getName()+"\n"+label(row);}
    private static String label(Object row){
        if(row==null)return "";
        String type=row.getClass().getName();String field=type.equals("o.onAdDisplayed$setIcon")?"e":type.equals("o.Yy2$open")?"k":type.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")?"m":type.equals("o.Yy2$RemoteActionCompatParcelizer")?"e":type.equals("o.getAvailabilityStatus$ComponentActivity")?"d":null;
        try{if(field!=null)return String.valueOf(NativeFields.find(row.getClass(),field).get(row));
            for(java.lang.reflect.Field f:NativeFields.all(row.getClass()))if(f.getType()==String.class){f.setAccessible(true);Object value=f.get(row);if(value!=null)return value.toString();}
        }catch(Exception ignored){}return row.toString();
    }
    public static boolean click(Object fragment,int action){
        if(action==KEYWORD_DISPLAY_MENU){
            Activity activity=Haiagaru.toolbarActivity(fragment);
            if(activity==null||activity.isFinishing())return false;
            DisplayNames.showKeywords(activity);
            return true;
        }
        if(action!=MENU)return false;
        Activity activity=Haiagaru.toolbarActivity(fragment);
        if(activity!=null)showInline(fragment);
        return true;
    }
    private HomeThreadOrder(){}
}
