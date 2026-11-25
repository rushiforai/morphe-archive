package nl.johninnl.warningprobe.integration;

import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Opt-in private synthetic-utterance observer. No microphone, policy change or production class. */
final class IntegratedMapsPcmObserver {
    private static final int LIMIT=1024*1024;
    private final Map<String,Record> records=new LinkedHashMap<>();
    private TextToSpeech tts;private UtteranceProgressListener original,wrapper;private Field listenerField;
    private int total,overflow,forwardFailures;private boolean restored,untouchedReplacement;
    void install(Object speaker)throws Exception {
        if(tts!=null)return;Field initialized=field(speaker.getClass(),"initialized");if(!initialized.getBoolean(speaker))return;
        TextToSpeech actual=(TextToSpeech)field(speaker.getClass(),"tts").get(speaker);if(actual==null)return;
        UtteranceProgressListener production=(UtteranceProgressListener)field(speaker.getClass(),"progress").get(speaker);
        // Do not change hidden-API policy or overwrite an unrelated/newer listener.
        Field slot=TextToSpeech.class.getDeclaredField("mUtteranceProgressListener");slot.setAccessible(true);
        if(slot.get(actual)!=production)throw new IllegalStateException("Production TTS listener is not the expected original instance");
        tts=actual;original=production;listenerField=slot;
        wrapper=new UtteranceProgressListener(){
            private void forward(Runnable action){try{action.run();}catch(RuntimeException|Error error){synchronized(IntegratedMapsPcmObserver.this){forwardFailures++;}throw error;}}
            @Override public void onStart(String id){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null)r.starts++;}forward(()->original.onStart(id));}
            @Override public void onDone(String id){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null)r.done++;}forward(()->original.onDone(id));}
            @Override public void onError(String id){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null)r.errors++;}forward(()->original.onError(id));}
            @Override public void onError(String id,int code){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null)r.errors++;}forward(()->original.onError(id,code));}
            @Override public void onStop(String id,boolean interrupted){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null)r.stops++;}forward(()->original.onStop(id,interrupted));}
            @Override public void onBeginSynthesis(String id,int rate,int format,int channels){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null){r.rate=rate;r.format=format;r.channels=channels;}}forward(()->original.onBeginSynthesis(id,rate,format,channels));}
            @Override public void onAudioAvailable(String id,byte[] bytes){synchronized(IntegratedMapsPcmObserver.this){Record r=record(id);if(r!=null){if(total+bytes.length<=LIMIT){r.pcm.write(bytes,0,bytes.length);total+=bytes.length;}else overflow++;}}forward(()->original.onAudioAvailable(id,bytes));}
            @Override public void onRangeStart(String id,int start,int end,int frame){forward(()->original.onRangeStart(id,start,end,frame));}
        };
        if(tts.setOnUtteranceProgressListener(wrapper)!=TextToSpeech.SUCCESS)throw new IllegalStateException("Could not install private forwarding observer");
    }
    private Record record(String id){if(id==null||!id.startsWith("morphe-warning-"))return null;Record found=records.get(id);if(found==null){if(records.size()>=8)throw new IllegalStateException("Private utterance bound");found=new Record();records.put(id,found);}return found;}
    void restore()throws Exception {if(tts==null)return;if(listenerField.get(tts)==wrapper){tts.setOnUtteranceProgressListener(original);restored=listenerField.get(tts)==original;if(!restored)throw new IllegalStateException("Original listener restore failed");}else untouchedReplacement=true;}
    synchronized JSONObject report(File folder)throws Exception {
        JSONArray values=new JSONArray();for(Map.Entry<String,Record> entry:records.entrySet()){
            Record r=entry.getValue();byte[] bytes=r.pcm.toByteArray();int nonzero=0;for(byte b:bytes)if(b!=0)nonzero++;
            JSONObject value=new JSONObject().put("utterance_id",entry.getKey()).put("starts",r.starts).put("done",r.done).put("stops",r.stops).put("errors",r.errors).put("bytes",bytes.length).put("nonzero_bytes",nonzero).put("rate",r.rate).put("format",r.format).put("channels",r.channels);
            if(bytes.length>0&&r.format==android.media.AudioFormat.ENCODING_PCM_16BIT){File file=new File(folder,entry.getKey()+".wav");try(FileOutputStream out=new FileOutputStream(file)){out.write(new byte[]{'R','I','F','F'});little(out,36+bytes.length,4);out.write(new byte[]{'W','A','V','E','f','m','t',' '});little(out,16,4);little(out,1,2);little(out,r.channels,2);little(out,r.rate,4);little(out,r.rate*r.channels*2,4);little(out,r.channels*2,2);little(out,16,2);out.write(new byte[]{'d','a','t','a'});little(out,bytes.length,4);out.write(bytes);}value.put("wav",file.getAbsolutePath());}values.put(value);
        }
        return new JSONObject().put("installed",tts!=null).put("total_bytes",total).put("overflow_chunks",overflow).put("forward_failures",forwardFailures).put("original_listener_restored",restored).put("newer_listener_untouched",untouchedReplacement).put("utterances",values).put("scope","Private test observer of the actual receiver-owned synthetic warning TTS stream only; no microphone or other-app audio");
    }
    private static Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
    private static void little(FileOutputStream out,int value,int count)throws Exception{for(int i=0;i<count;i++)out.write((value>>>(8*i))&255);}
    private static final class Record {final ByteArrayOutputStream pcm=new ByteArrayOutputStream();int starts,done,stops,errors,rate,format,channels;}
}
