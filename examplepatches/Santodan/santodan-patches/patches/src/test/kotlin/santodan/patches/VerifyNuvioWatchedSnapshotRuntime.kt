package santodan.patches

import java.io.File
import java.net.URLClassLoader
import java.nio.file.Files
import javax.tools.ToolProvider

/** Run the production streaming decoder; the JVM substitutes Gson for Android's JsonReader API. */
fun main(args: Array<String>) {
    val root = Files.createTempDirectory(File(args[1]).apply { mkdirs() }.toPath(), "watched-snapshot-").toFile()
    val sources = mapOf(
        "android.util.JsonToken" to """package android.util; public enum JsonToken {
            BEGIN_ARRAY,END_ARRAY,BEGIN_OBJECT,END_OBJECT,NAME,STRING,NUMBER,BOOLEAN,NULL,END_DOCUMENT
        }""",
        "android.util.JsonReader" to """package android.util;
            public class JsonReader implements java.io.Closeable {
                private final com.google.gson.stream.JsonReader reader;
                public JsonReader(java.io.Reader input){reader=new com.google.gson.stream.JsonReader(input);}
                public void beginObject() throws java.io.IOException {reader.beginObject();}
                public void endObject() throws java.io.IOException {reader.endObject();}
                public void beginArray() throws java.io.IOException {reader.beginArray();}
                public void endArray() throws java.io.IOException {reader.endArray();}
                public boolean hasNext() throws java.io.IOException {return reader.hasNext();}
                public String nextName() throws java.io.IOException {return reader.nextName();}
                public String nextString() throws java.io.IOException {return reader.nextString();}
                public int nextInt() throws java.io.IOException {return reader.nextInt();}
                public long nextLong() throws java.io.IOException {return reader.nextLong();}
                public void nextNull() throws java.io.IOException {reader.nextNull();}
                public void skipValue() throws java.io.IOException {reader.skipValue();}
                public JsonToken peek() throws java.io.IOException {return JsonToken.valueOf(reader.peek().name());}
                public void close() throws java.io.IOException {reader.close();}
            }""",
        "fixture.Runner" to """package fixture;
            import java.util.*;
            import java.util.concurrent.CancellationException;
            import java.util.concurrent.atomic.AtomicInteger;
            import software.santodan.extension.nuviomerged.NuvioWatchedSnapshot;
            import software.santodan.extension.nuviomerged.NuvioMembershipCache;
            public class Runner {
                static void check(boolean value){if(!value)throw new AssertionError();}
                static Object model(Map<String,Object> values){
                    check(values.get("getWatchedAt") instanceof Long);
                    return values;
                }
                static String snapshot(int count){
                    StringBuilder json=new StringBuilder("{\"progress\":[{\"unused\":\""+"x".repeat(10000)+"\"}],");
                    json.append("\"watchedHistory\":{\"tt1\":[[0,1],[1,2],[1,2]],\"tt2\":[]},");
                    json.append("\"siblings\":{\"tt1\":[\"tmdb:1\",\"tmdb:1\"],\"tt2\":[\"__ambiguous__\"]},\"watchedItems\":[");
                    for(int i=0;i<count;i++){
                        if(i>0)json.append(',');
                        json.append("{\"getContentId\":\"tt1\",\"getContentType\":\"series\",\"getTitle\":\"Escaped \\\"title\\\"\",\"getSeason\":1,\"getEpisode\":")
                            .append(i+1).append(",\"getWatchedAt\":1234567890123,\"getPoster\":null,\"getTrackingProviderId\":\"TRAKT\"}");
                    }
                    return json.append("]}").toString();
                }
                public static void run() throws Exception {
                    // Persisted NMC1 files from the unbuffered writer remain readable.
                    java.io.ByteArrayOutputStream legacyBytes=new java.io.ByteArrayOutputStream();
                    try(java.io.DataOutputStream out=new java.io.DataOutputStream(new java.util.zip.GZIPOutputStream(legacyBytes))){
                        out.writeInt(0x4e4d4301);out.writeLong(1234567890123L);
                        out.writeInt(2);out.writeUTF("old:id");out.writeUTF("__ambiguous__");
                        out.writeInt(1);out.writeInt(1);out.writeLong((1L<<32)|2);
                        out.writeInt(1);out.writeInt(0);out.writeInt(0);
                        out.writeInt(1);out.writeInt(1);out.writeInt(1);
                        out.writeInt(1);out.writeInt(0);out.writeInt(0);
                    }
                    StringBuilder legacyPacked=new StringBuilder("NMC1:");
                    for(byte b:legacyBytes.toByteArray())legacyPacked.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
                    NuvioMembershipCache oldFile=NuvioMembershipCache.read(legacyPacked.toString(),(s,e)->s+":"+e,()->{});
                    check(oldFile.savedAt==1234567890123L&&oldFile.history.get("old:id").contains("1:2"));
                    check(oldFile.siblings.get("old:id").contains("__ambiguous__"));
                    Map<String,Set<Object>> histories=new LinkedHashMap<>();
                    Set<Object> manyEpisodes=new LinkedHashSet<>();
                    for(int i=0;i<2000;i++)manyEpisodes.add((1L<<32)|i);
                    for(int i=0;i<3000;i++)histories.put("catalog:"+i,new LinkedHashSet<>(manyEpisodes));
                    histories.put("empty",Collections.emptySet());
                    Map<String,Set<String>> aliases=new LinkedHashMap<>();
                    aliases.put("catalog:0",new LinkedHashSet<>(Arrays.asList("catalog:1","__ambiguous__")));
                    aliases.put("catalog:1",new LinkedHashSet<>(aliases.get("catalog:0")));
                    aliases.put("empty",Collections.emptySet());
                    String packed=NuvioMembershipCache.encode(histories,aliases,1234567890123L,x->(Long)x,()->{});
                    AtomicInteger models=new AtomicInteger();
                    NuvioMembershipCache cached=NuvioMembershipCache.read(packed,(s,e)->{
                        models.incrementAndGet(); return ((long)s<<32)|(e&0xffffffffL);
                    },()->{});
                    check(cached.savedAt==1234567890123L&&cached.history.equals(histories)&&cached.siblings.equals(aliases));
                    check(models.get()==2000); // Six million expanded memberships decode just 2,000 episode values.
                    check(cached.history.get("catalog:0")==cached.history.get("catalog:2999"));
                    check(cached.siblings.get("catalog:0")==cached.siblings.get("catalog:1"));
                    check(packed.length()<100000);
                    try{cached.history.get("catalog:0").clear();throw new AssertionError();}
                    catch(UnsupportedOperationException expected){}
                    check(NuvioMembershipCache.read(NuvioMembershipCache.encode(Collections.emptyMap(),Collections.emptyMap(),0,x->0L,()->{}),
                        (s,e)->s+":"+e,()->{}).history.isEmpty());
                    for(String corrupt:Arrays.asList("NMC1:xx","NMC1:0",packed.substring(0,packed.length()-8),"garbage")){
                        try{NuvioMembershipCache.read(corrupt,(s,e)->s+":"+e,()->{});throw new AssertionError("Corruption accepted");}
                        catch(java.io.IOException expected){}
                    }
                    AtomicInteger cancelledRead=new AtomicInteger();
                    try{NuvioMembershipCache.read(packed,(s,e)->s+":"+e,()->{
                        if(cancelledRead.incrementAndGet()==10)throw new CancellationException();
                    });throw new AssertionError("Cancelled cache returned data");}catch(CancellationException expected){}
                    try{NuvioMembershipCache.encode(histories,aliases,0,x->(Long)x,()->{throw new CancellationException();});
                        throw new AssertionError();}catch(CancellationException expected){}
                    System.out.println("PASS: six million memberships use shared sets and decode only 2,000 episode values; timestamp, empty/ambiguous aliases, corruption and cancellation preserved");
                    String encoded=snapshot(10321);
                    NuvioWatchedSnapshot restored=NuvioWatchedSnapshot.read(encoded,()->{},(s,e)->s+":"+e,Runner::model);
                    check(restored.history.get("tt1").equals(new LinkedHashSet<>(Arrays.asList("0:1","1:2"))));
                    check(restored.history.get("tt2").isEmpty());
                    check(restored.siblings.get("tt1").equals(Collections.singleton("tmdb:1")));
                    check(restored.siblings.get("tt2").contains("__ambiguous__"));
                    check(restored.items.size()==10321);
                    Map<?,?> first=(Map<?,?>)restored.items.get(0);
                    check(first.get("getSeason").equals(1)&&first.get("getEpisode").equals(1));
                    check(first.get("getWatchedAt").equals(1234567890123L));
                    check(first.containsKey("getPoster")&&first.get("getPoster")==null);
                    check(first.get("getTitle").equals("Escaped \"title\""));
                    NuvioWatchedSnapshot projection=NuvioWatchedSnapshot.projection(encoded,()->{},(s,e)->s+":"+e);
                    check(projection.historyPresent&&projection.siblingsPresent);
                    check(projection.history.equals(restored.history)&&projection.siblings.equals(restored.siblings));
                    check(projection.items.isEmpty());
                    // The independent membership store omits model/seed sections entirely.
                    // It must give the same badge decisions as a full cache with 10,321 models.
                    String compact="{\"watchedHistory\":{\"tt1\":[[0,1],[1,2]],\"tt2\":[]},"+
                        "\"siblings\":{\"tt1\":[\"tmdb:1\"],\"tt2\":[\"__ambiguous__\"]}}";
                    NuvioWatchedSnapshot membership=NuvioWatchedSnapshot.projection(compact,()->{},(s,e)->s+":"+e);
                    check(membership.history.equals(projection.history));
                    check(membership.siblings.equals(projection.siblings));
                    check(NuvioWatchedSnapshot.projection("{\"savedAt\":1234567890123,\"watchedHistory\":{},\"siblings\":{}}",
                        ()->{},(s,e)->s+":"+e).savedAt==1234567890123L);
                    // Startup can decide episode membership without constructing any of the 10,321 models.
                    check(projection.history.get("tt1").contains("1:2"));
                    NuvioWatchedSnapshot emptyProjection=NuvioWatchedSnapshot.projection(
                        "{\"watchedHistory\":{},\"siblings\":{}}",()->{},(s,e)->s+":"+e);
                    check(emptyProjection.historyPresent&&emptyProjection.siblingsPresent&&emptyProjection.history.isEmpty());
                    NuvioWatchedSnapshot missingProjection=NuvioWatchedSnapshot.projection(
                        "{\"progress\":[]}",()->{},(s,e)->s+":"+e);
                    check(!missingProjection.historyPresent&&!missingProjection.siblingsPresent);
                    // Full-history-only model details must not be interpreted by projection restoration.
                    check(NuvioWatchedSnapshot.projection(
                        "{\"watchedItems\":[{\"getWatchedAt\":\"not a model timestamp\"}],\"watchedHistory\":{},\"siblings\":{}}",
                        ()->{},(s,e)->s+":"+e).items.isEmpty());
                    AtomicInteger projectionReads=new AtomicInteger();
                    try {
                        NuvioWatchedSnapshot.projection(encoded,()->{if(projectionReads.incrementAndGet()==8)throw new CancellationException();},(s,e)->s+":"+e);
                        throw new AssertionError("Cancelled projection returned partial data");
                    } catch(CancellationException expected){}
                    AtomicInteger decoded=new AtomicInteger();
                    try {
                        NuvioWatchedSnapshot.read(encoded,()->{if(decoded.get()==3)throw new CancellationException();},
                            (s,e)->s+":"+e, values->{decoded.incrementAndGet();return model(values);});
                        throw new AssertionError("Cancelled snapshot returned partial data");
                    } catch(CancellationException expected){check(decoded.get()==3);}
                    AtomicInteger reads=new AtomicInteger(),unexpectedModels=new AtomicInteger();
                    try {
                        NuvioWatchedSnapshot.read(encoded,()->{if(reads.incrementAndGet()==5)throw new CancellationException();},
                            (s,e)->s+":"+e,values->{unexpectedModels.incrementAndGet();return model(values);});
                        throw new AssertionError("Skipping legacy data ignored cancellation");
                    } catch(CancellationException expected){check(unexpectedModels.get()==0);}
                    check(NuvioWatchedSnapshot.read(snapshot(2),()->{},(s,e)->s+":"+e,Runner::model).items.size()==2);
                    check(NuvioWatchedSnapshot.read("{\"watchedHistory\":null,\"siblings\":null,\"watchedItems\":null}",
                        ()->{},(s,e)->s+":"+e,Runner::model).items.isEmpty());
                    for(String invalid:Arrays.asList("{\"watchedItems\":[", "{\"watchedHistory\":{\"id\":[[1]]}}", "{} {}")) {
                        boolean failed=false;
                        try {NuvioWatchedSnapshot.read(invalid,()->{},(s,e)->s+":"+e,Runner::model);}
                        catch(Exception expected){failed=true;}
                        check(failed);
                    }
                }
            }"""
    )
    val files = sources.map { (name, source) ->
        File(root, name.replace('.', '/') + ".java").apply { parentFile.mkdirs(); writeText(source) }
    } + listOf(File(args[0]), File(File(args[0]).parentFile, "NuvioMembershipCache.java"))
    val gson = com.google.gson.Gson::class.java.protectionDomain.codeSource.location
    val classes = File(root, "classes").apply { mkdirs() }
    check(ToolProvider.getSystemJavaCompiler().run(null, null, null, "--release", "11", "-classpath",
        File(gson.toURI()).path, "-d", classes.path, *files.map { it.path }.toTypedArray()) == 0)
    URLClassLoader(arrayOf(classes.toURI().toURL(), gson), ClassLoader.getSystemClassLoader().parent).use {
        it.loadClass("fixture.Runner").getMethod("run").invoke(null)
    }
    println("PASS: 10,321 watched records stream into final collections; numbering, aliases, nulls and long timestamps preserved; cancellation during decoding and legacy skipping returns no partial snapshot; retry and malformed input checked")
}
