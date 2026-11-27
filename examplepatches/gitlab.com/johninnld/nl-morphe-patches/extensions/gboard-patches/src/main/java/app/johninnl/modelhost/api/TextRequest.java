package app.johninnl.modelhost.api;
import org.json.JSONObject;
import org.json.JSONArray;
import java.util.*;
/** Immutable request. Raw generation preserves the caller's explicit role/intent protocol. */
public final class TextRequest {
    public final String operation,text,instruction,context,languageHint,prefixId;
    public final int maxOutputTokens;
    public final long timeoutMillis;
    public final List<ChatMessage> messages;
    public TextRequest(String operation,String text,String instruction,String context,String languageHint,String prefixId,int maxOutputTokens,long timeoutMillis){this(operation,text,instruction,context,languageHint,prefixId,maxOutputTokens,timeoutMillis,Collections.emptyList());}
    private TextRequest(String operation,String text,String instruction,String context,String languageHint,String prefixId,int maxOutputTokens,long timeoutMillis,List<ChatMessage> messages){
        if(operation==null || text==null || maxOutputTokens<1 || maxOutputTokens>2048 || timeoutMillis<100 || timeoutMillis>120000)throw new IllegalArgumentException("Invalid request bounds");
        this.operation=operation;this.text=text;this.instruction=instruction;this.context=context;this.languageHint=languageHint;this.prefixId=prefixId;this.maxOutputTokens=maxOutputTokens;this.timeoutMillis=timeoutMillis;this.messages=Collections.unmodifiableList(new ArrayList<>(messages));
    }
    public static TextRequest edit(String operation,String text){return new TextRequest(operation,text,null,null,null,null,512,30000);}
    public static TextRequest rawMessages(List<ChatMessage> messages,int maxOutputTokens,long timeoutMillis){if(messages==null || messages.isEmpty() || messages.size()>64)throw new IllegalArgumentException("Invalid message count");return new TextRequest("generate","",null,null,null,null,maxOutputTokens,timeoutMillis,messages);}
    String toJson(String correlationId){
        JSONObject o=Protocol.envelope();Protocol.put(o,"clientRequestId",correlationId);Protocol.put(o,"operation",operation);Protocol.put(o,"text",text);Protocol.put(o,"instruction",instruction);Protocol.put(o,"context",context);Protocol.put(o,"languageHint",languageHint);Protocol.put(o,"prefixId",prefixId);Protocol.put(o,"maxOutputTokens",maxOutputTokens);Protocol.put(o,"timeoutMillis",timeoutMillis);
        if(!messages.isEmpty()){JSONArray a=new JSONArray();for(ChatMessage m:messages)a.put(m.toJson());Protocol.put(o,"messages",a);}return o.toString();
    }
}
