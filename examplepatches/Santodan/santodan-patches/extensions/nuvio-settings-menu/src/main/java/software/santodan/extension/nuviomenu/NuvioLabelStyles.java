package software.santodan.extension.nuviomenu;

import android.app.Application;
import software.santodan.nuvio.NuvioNative;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

/** Runtime for the separately selectable label patch. Hooks are scoped to reviewed badge renderers. */
public final class NuvioLabelStyles {
    private static final ThreadLocal<Frame> FRAME = new ThreadLocal<>();
    private static final Map<String,Map<String,Object>> SAVED = new ConcurrentHashMap<>();
    private static final Map<String,long[]> COLORS = new ConcurrentHashMap<>();
    private static final Map<String,String> SAMPLES = new ConcurrentHashMap<>();
    private static final LinkedHashMap<String,String> LABELS = new LinkedHashMap<>();
    static final int MAX_LABELS = 128;
    private static final int MAX_IDENTIFIED = 256;
    private static final Object NONE = new Object();
    // Render-path memo: badge text -> label id (or NONE), so matching and hashing run once per text.
    private static final LinkedHashMap<String,Object> IDENTIFIED = new LinkedHashMap<>(64,0.75f,true);
    private static Object recalled(String memo) { synchronized(IDENTIFIED) { return IDENTIFIED.get(memo); } }
    private static void remember(String memo,Object id) {
        synchronized(IDENTIFIED) {
            IDENTIFIED.put(memo,id);
            if(IDENTIFIED.size()>MAX_IDENTIFIED) { Iterator<String> eldest=IDENTIFIED.keySet().iterator(); eldest.next(); eldest.remove(); }
        }
    }
    private static volatile Map<String,String> aliases = Collections.emptyMap();
    private static volatile List<Map.Entry<Pattern,String>> templates = Collections.emptyList();
    private static volatile String language = "";
    private static volatile SharedPreferences preferences;
    private static volatile Object revision;
    private static final class Frame {
        final String id; final Map<String,Object> values; boolean fontApplied; int part;
        Frame(String id,Map<String,Object> values) { this.id=id;this.values=values; }
    }
    private NuvioLabelStyles() {}
    // Only the new public patch changes this body, after the shared extension is merged.
    public static boolean available() { return false; }
    static SharedPreferences prefs() throws Exception {
        if (preferences==null) {
            Application app=(Application)Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            preferences=app.getSharedPreferences(LabelCustomization.SCOPE,0);
        }
        return preferences;
    }
    static void invalidate() { SAVED.clear(); }
    static Map<String,Object> saved(String id) throws Exception {
        Map<String,Object> existing=SAVED.get(id); if(existing!=null)return existing;
        Map<String,Object> values=new LinkedHashMap<>(); SharedPreferences p=prefs();
        for(String field:LabelCustomization.FIELDS) {
            String key=LabelCustomization.key(id,field); if(!p.contains(key))continue;
            try {
                Object value=field.endsWith("_color")?p.getLong(key,0L):field.equals("text")?p.getString(key,""):p.getInt(key,100);
                values.put(field,LabelCustomization.valid(field,value));
            } catch (ClassCastException|IllegalArgumentException invalid) { /* Ignore invalid imported/old values. */ }
        }
        values=Collections.unmodifiableMap(values); SAVED.put(id,values); return values;
    }
    static synchronized Map<String,String> labels() throws Exception { ensureLabels(); return new LinkedHashMap<>(LABELS); }
    private static synchronized void ensureLabels() throws Exception {
        if(LABELS.isEmpty()) {
            for(int i=0;i<LabelCustomization.IDS.length;i++)LABELS.put(LabelCustomization.IDS[i],LabelCustomization.NAMES[i]);
            for(var entry:prefs().getAll().entrySet())if(entry.getKey().matches("name_[a-z][a-z0-9_]{0,95}")&&entry.getValue() instanceof String&&LABELS.size()<MAX_LABELS)
                LABELS.put(entry.getKey().substring(5),(String)entry.getValue());
        }
    }
    private static String normalized(String text) { return text==null?"":text.trim().toUpperCase(Locale.ROOT); }
    private static synchronized void aliases() throws Exception {
        Application app=(Application)Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        String locale=app.getResources().getConfiguration().locale.toString();
        if(locale.equals(language)&&!aliases.isEmpty())return;
        Map<String,String> names=new LinkedHashMap<>(); List<Map.Entry<Pattern,String>> patterns=new ArrayList<>();
        for(int i=0;i<LabelCustomization.IDS.length;i++)for(int resource:LabelCustomization.RESOURCES[i]) {
            String text=normalized(app.getString(resource)); String id=LabelCustomization.IDS[i];
            addAlias(text,id,names,patterns);
        }
        for(int resource:new int[]{0x7f0f0001,0x7f0f0002})for(int quantity:new int[]{0,1,2,3,5,11})
            addAlias(normalized(app.getResources().getQuantityString(resource,quantity)),"airs_days",names,patterns);

        aliases=names; templates=patterns; language=locale; synchronized(IDENTIFIED){IDENTIFIED.clear();}
    }
    private static void addAlias(String text,String id,Map<String,String> names,List<Map.Entry<Pattern,String>> patterns) {
        if(!text.contains("%")){names.putIfAbsent(text,id);return;}
        StringBuilder regex=new StringBuilder("^");int start=0;
        java.util.regex.Matcher m=Pattern.compile("%(?:[0-9]+\\$)?[sdf]|%%",Pattern.CASE_INSENSITIVE).matcher(text);
        while(m.find()){regex.append(Pattern.quote(text.substring(start,m.start()))).append(m.group().equals("%%")?"%":".+?");start=m.end();}
        regex.append(Pattern.quote(text.substring(start))).append('$');
        patterns.add(new AbstractMap.SimpleImmutableEntry<>(Pattern.compile(regex.toString()),id));
    }
    private static String identify(String text,boolean metadata) throws Exception {
        aliases();String memo=(metadata?"m:":"b:")+text;Object known=recalled(memo);
        if(known==NONE)return null;
        // A discovered id may have been evicted from the registry; classify again so it is re-registered.
        if(known instanceof String&&registered((String)known))return (String)known;
        String id=classify(text,metadata);
        if(id!=null)remember(memo,id);else if(text==null||text.trim().isEmpty()||text.length()>100)remember(memo,NONE);
        return id;
    }
    private static synchronized boolean registered(String id) throws Exception { labels(); return LABELS.containsKey(id); }
    private static String classify(String text,boolean metadata) throws Exception {
        String value=normalized(text),id=aliases.get(value);if(id!=null)return id;
        for(var candidate:templates)if(candidate.getKey().matcher(value).matches())return candidate.getValue();
        if(metadata&&value.matches("(?:19|20)[0-9]{2}"))return observe("metadata_year","Year",text);
        if(metadata&&value.matches("[0-9]+(?:H|M| MIN| MINUTES).*"))return observe("metadata_runtime","Runtime",text);
        if(metadata&&value.matches("(?:TV-.*|PG(?:-13)?|R|G|NC-17|NR|UNRATED)"))return observe("metadata_certification","Age rating",text);
        if(text==null||text.trim().isEmpty()||text.length()>100)return null;
        byte[] digest=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder key=new StringBuilder(metadata?"metadata_":"badge_");for(int i=0;i<12;i++)key.append(String.format(Locale.ROOT,"%02x",digest[i]));
        return observe(key.toString(),(metadata?"Metadata: ":"Badge: ")+text,text);
    }
    private static synchronized String observe(String id,String title,String sample) throws Exception {
        ensureLabels();if(!LABELS.containsKey(id)) {
            SharedPreferences p=prefs();SharedPreferences.Editor editor=p.edit();
            if(LABELS.size()>=MAX_LABELS&&!evictDiscovered(p,editor))return null;
            LABELS.put(id,title);
            // While the feature is disabled, discovery stays in memory; nothing is written from composition.
            if(p.getBoolean("enabled",false))editor.putString("name_"+id,title);
            editor.apply();
        }
        if(sample!=null)SAMPLES.put(id,sample);return id;
    }
    /** Frees one slot by dropping the oldest discovered label that has no saved override. Built-ins and customized labels stay. */
    private static boolean evictDiscovered(SharedPreferences p,SharedPreferences.Editor editor) {
        Set<String> builtIn=new HashSet<>(Arrays.asList(LabelCustomization.IDS));
        for(String candidate:LABELS.keySet()) {
            if(builtIn.contains(candidate)||customized(p,candidate))continue;
            LABELS.remove(candidate);SAMPLES.remove(candidate);COLORS.remove(candidate);editor.remove("name_"+candidate);
            return true;
        }
        return false;
    }
    private static boolean customized(SharedPreferences p,String id) {
        for(String field:LabelCustomization.FIELDS)if(p.contains(LabelCustomization.key(id,field)))return true;
        return false;
    }
    private static void begin(String text,boolean metadata) {
        FRAME.remove(); if(!available())return;
        try {
            String id=identify(text,metadata);if(id==null)return;
            SAMPLES.put(id,text);
            FRAME.set(new Frame(id,prefs().getBoolean("enabled",false)?saved(id):Collections.emptyMap()));
        } catch(Exception ignored) { /* A badge remains native if settings cannot be read. */ }
    }
    public static void begin(String text) { begin(text,false); }
    public static void beginMetadata(String text) { begin(text,true); }
    public static void beginCard(Object card) {
        try {
            String reference=NuvioNative.REF_LABEL_CW_TEXT;
            String name=reference.substring(reference.indexOf("->")+2,reference.indexOf(':'));
            Field field=card.getClass().getDeclaredField(name);field.setAccessible(true);begin((String)field.get(card),false);
        } catch(Exception ignored) { FRAME.remove(); }
    }
    public static void beginFileSize() {
        FRAME.remove();if(!available())return;
        try { FRAME.set(new Frame("file_size",prefs().getBoolean("enabled",false)?saved("file_size"):Collections.emptyMap())); }
        catch(Exception ignored) { /* Native fallback. */ }
    }
    public static long background(long original) {
        Frame frame=FRAME.get();if(frame==null)return original;
        COLORS.computeIfAbsent(frame.id,id->new long[]{original,0xffffffff00000000L})[0]=original;
        return (Long)frame.values.getOrDefault("background_color",original);
    }
    public static long foreground(long original) {
        Frame frame=FRAME.get();if(frame==null)return original;
        COLORS.computeIfAbsent(frame.id,id->new long[]{0xff1976d200000000L,original})[1]=original;
        return (Long)frame.values.getOrDefault("foreground_color",original);
    }
    public static float padding(float original) {
        Frame frame=FRAME.get();return frame==null||!frame.values.containsKey("size_percent")?original:original*((Integer)frame.values.get("size_percent"))/100f;
    }
    public static Object modifier(Object modifier) {
        Frame frame=FRAME.get();if(frame==null||!frame.values.containsKey("position"))return modifier;
        try {
            ClassLoader loader=modifier.getClass().getClassLoader();Object box=loader.loadClass("d0.v").getField("a").get(null);
            Object alignment=loader.loadClass("w1.b").getField(DateLabelStyle.alignment((Integer)frame.values.get("position"))).get(null);
            return NuvioDateLabelStyle.method(box.getClass(),"a",2).invoke(box,modifier,alignment);
        } catch(Exception ignored) { return modifier; }
    }
    public static long fontSize(long original,Object style) {
        Frame frame=FRAME.get();if(frame==null||!frame.values.containsKey("font_size_percent"))return original;
        frame.fontApplied=false;
        try {
            long value=original;
            if(value==0L) { Object span=NuvioDateLabelStyle.field(style.getClass(),"a").get(style);value=NuvioDateLabelStyle.field(span.getClass(),"b").getLong(span); }
            float size=Float.intBitsToFloat((int)value)*((Integer)frame.values.get("font_size_percent"))/100f;
            frame.fontApplied=true;
            return (value&0xffffffff00000000L)|(Float.floatToRawIntBits(size)&0xffffffffL);
        } catch(Exception ignored) { return original; }
    }
    public static String text(String original) {
        Frame frame=FRAME.get();if(frame==null)return original;
        if(frame.part++>0)return original;
        if(original!=null)SAMPLES.put(frame.id,original);
        return LabelCustomization.text((String)frame.values.get("text"),original);
    }
    public static int defaults(int original) {
        Frame frame=FRAME.get();if(frame==null)return original;
        if(frame.fontApplied)original&=~8;
        if(frame.values.containsKey("foreground_color"))original&=~4;
        return original;
    }
    public static void subscribe(Object composer) {
        try {
            if(revision==null)revision=NuvioDateLabelStyle.state(composer.getClass().getClassLoader(),"label-styles:revision",0);
            NuvioDateLabelStyle.get(revision);
        } catch(Exception ignored) { /* Does not alter the native rendering path. */ }
    }
    static void changed(ClassLoader loader) throws Exception {
        invalidate();revision=NuvioDateLabelStyle.state(loader,"label-styles:revision",0);
        NuvioDateLabelStyle.set(revision,((Number)NuvioDateLabelStyle.get(revision)).intValue()+1);
    }
    /** Customize labels created by dependent Santodan patches without changing their live calculations. */
    public static Object[] applyAdded(String id,Object composer,Object[] original) throws Exception {
        if(!id.equals("remaining_count")&&!id.equals("date_label"))throw new IllegalArgumentException("Unknown added label");
        String nativeText=(String)original[0];SAMPLES.put(id,nativeText);subscribe(composer);
        if(!available()||!prefs().getBoolean("enabled",false))return original;
        Map<String,Object> values=saved(id);if(values.isEmpty())return original;
        ClassLoader loader=composer.getClass().getClassLoader();Object[] result=original.clone();
        if(id.equals("date_label")) {
            Map<String,Object> base=new LinkedHashMap<>();base.put("background_color",0xff1976d200000000L);base.put("foreground_color",0xffffffff00000000L);base.put("size_percent",100);base.put("font_size_percent",100);base.put("position",7);
            base.putAll(NuvioDateLabelStyle.legacyDateOverrides());base.putAll(values);
            Object[] style=NuvioDateLabelStyle.buildColors(loader,loader.loadClass("d0.v").getField("a").get(null),composer,NuvioNative.WIDE_CARD_NAME,
                (Long)base.get("background_color"),(Long)base.get("foreground_color"),(Integer)base.get("size_percent"),(Integer)base.get("font_size_percent"),(Integer)base.get("position"));
            result[1]=style[0];result[2]=style[1];result[3]=style[2];result[14]=style[3];result[18]=65520;
        } else {
            FRAME.set(new Frame(id,values));
            try {
                if(values.containsKey("background_color")||values.containsKey("size_percent")||values.containsKey("position")) {
                    Object theme=NuvioDateLabelStyle.method(composer.getClass(),"j",1).invoke(composer,NuvioDateLabelStyle.staticValue(loader,NuvioNative.NATIVE_COLOR_LOCAL_NAME,"a"));
                    long surface=((Number)NuvioDateLabelStyle.field(theme.getClass(),"a").get(theme)).longValue();
                    long nativeBackground=((Number)NuvioDateLabelStyle.method(loader.loadClass(NuvioNative.COLOR_NAME),"b",2).invoke(null,surface,0.8f)).longValue();
                    Object spacing=NuvioDateLabelStyle.staticValue(loader,NuvioNative.NATIVE_SPACING_LOCAL_NAME,"a");
                    float h=NuvioDateLabelStyle.field(spacing.getClass(),"e").getFloat(spacing),v=NuvioDateLabelStyle.field(spacing.getClass(),"d").getFloat(spacing);
                    Object modifier=modifier(NuvioDateLabelStyle.staticValue(loader,NuvioNative.EMPTY_MODIFIER_NAME,"b"));
                    modifier=NuvioDateLabelStyle.invokeReference(loader,NuvioNative.REF_LABEL_PADDING_ALL,modifier,h);
                    modifier=NuvioDateLabelStyle.method(loader.loadClass("a2.j"),"b",2).invoke(null,modifier,NuvioDateLabelStyle.staticValue(loader,NuvioNative.WIDE_CARD_NAME,"a"));
                    modifier=NuvioDateLabelStyle.invokeReference(loader,NuvioNative.REF_LABEL_BACKGROUND,modifier,background(nativeBackground),NuvioDateLabelStyle.staticValue(loader,"d2.i0","b"));
                    modifier=NuvioDateLabelStyle.invokeReference(loader,NuvioNative.REF_LABEL_PADDING,modifier,padding(h),padding(v));
                    result[1]=modifier;
                }
                result[2]=foreground((Long)original[2]);result[3]=fontSize((Long)original[3],original[14]);result[18]=defaults((Integer)original[18]);
            } finally {end();}
        }
        result[0]=LabelCustomization.text((String)values.get("text"),nativeText);return result;
    }
    public static void end() { FRAME.remove(); }
    static LabelCustomization.Draft draft(String id) throws Exception {
        Map<String,String> labels=labels();long[] colors=COLORS.get(id);
        long background=colors==null?(id.equals("new_season")?0xffb4530900000000L:0xff1976d200000000L):colors[0];
        long foreground=colors==null?0xffffffff00000000L:colors[1];
        Map<String,Object> values=new LinkedHashMap<>();
        if(id.equals("date_label")){values.putAll(NuvioDateLabelStyle.legacyDateOverrides());background=0xff1976d200000000L;}
        values.putAll(saved(id));
        return new LabelCustomization.Draft(id,values,background,foreground,SAMPLES.getOrDefault(id,id.equals("date_label")?"15-Nov":id.equals("remaining_count")?"8":labels.getOrDefault(id,id)));
    }
    static void save(Collection<LabelCustomization.Draft> drafts) throws Exception {
        SharedPreferences.Editor editor=prefs().edit();Map<String,String> names=labels();
        Set<String> builtIn=new HashSet<>(Arrays.asList(LabelCustomization.IDS));
        for(var draft:drafts)if(draft.dirty) {
            // Labels discovered while the feature was disabled are only in memory; keep the name of any label being customized.
            if(!builtIn.contains(draft.id)&&!draft.values().isEmpty()&&names.containsKey(draft.id))editor.putString("name_"+draft.id,names.get(draft.id));
            if(draft.id.equals("date_label")&&draft.values().isEmpty())NuvioDateLabelStyle.resetLegacyDate();
            for(String field:LabelCustomization.FIELDS)editor.remove(LabelCustomization.key(draft.id,field));
            for(var value:draft.values().entrySet()) {
                String key=LabelCustomization.key(draft.id,value.getKey());Object v=value.getValue();
                if(v instanceof String)editor.putString(key,(String)v);else if(v instanceof Long)editor.putLong(key,(Long)v);else editor.putInt(key,(Integer)v);
            }
        }
        editor.apply();invalidate();
    }
}
