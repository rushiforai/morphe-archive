package dev.rikunode.futatabi.bridge;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import java.util.Iterator;

/** Bounded inspection of React Router's flattened single-fetch table.
 * Not the different streaming codec used by /api/thread/.../messages.
 * Only the action envelope and status/redirect are inspected; no arbitrary
 * plugin execution, no response text is retained or displayed.
 */
final class MebukiActionResponse {
    enum Kind {
        NOT_RECEIVED, ROUTER_DATA, ROUTER_NO_CONTENT, SAME_THREAD_REDIRECT,
        OTHER_REDIRECT, ROUTER_ERROR, HTTP_ERROR, CHALLENGE, HTML, OTHER,
        MALFORMED, TRANSPORT_ERROR;
        boolean eligible() {
            return this==ROUTER_DATA||this==ROUTER_NO_CONTENT||this==SAME_THREAD_REDIRECT;
        }
    }
    private final JSONArray table;
    private MebukiActionResponse(JSONArray table){this.table=table;}
    private Object ref(Object v)throws Exception{
        if(!(v instanceof Integer)&&!(v instanceof Long))throw new IllegalArgumentException();
        long n=((Number)v).longValue();
        if(n==-5||n==-7)return JSONObject.NULL;
        if(n<0||n>=table.length())throw new IllegalArgumentException();
        return table.get((int)n);
    }
    private Object field(JSONObject obj,String name)throws Exception{
        Iterator<String> keys=obj.keys();
        while(keys.hasNext()){
            String key=keys.next();
            if(!key.matches("_[0-9]{1,6}"))throw new IllegalArgumentException();
            Object k=ref(Integer.parseInt(key.substring(1)));
            if(!(k instanceof String))throw new IllegalArgumentException();
            if(name.equals(k))return ref(obj.get(key));
        }
        return null;
    }
    private static Kind redirect(String location,String slug){
        try{
            java.net.URI u=java.net.URI.create("https://mebuki.moe").resolve(location);
            if("https".equals(u.getScheme())&&"mebuki.moe".equals(u.getHost())&&u.getRawUserInfo()==null&&
                    (u.getPort()==-1||u.getPort()==443)&&MebukiReplyClient.threadPath(slug).equals(u.getRawPath()))
                return Kind.SAME_THREAD_REDIRECT;
        }catch(Exception ignored){}
        return Kind.OTHER_REDIRECT;
    }
    static Kind classify(int status,String mime,boolean router,String location,
                         boolean challenge,String body,String slug){
        if(challenge)return Kind.CHALLENGE;
        if(status>=400&&!router)return Kind.HTTP_ERROR;
        if(status<400&&location!=null)return redirect(location,slug);
        if(status==204)return Kind.ROUTER_NO_CONTENT;
        if(mime!=null&&mime.toLowerCase(java.util.Locale.ROOT).startsWith("text/html"))return Kind.HTML;
        if(mime==null||!mime.toLowerCase(java.util.Locale.ROOT).startsWith("text/x-script"))
            return Kind.OTHER;
        if(status<200||status>=500||body==null||body.length()>64000)return status>=400?Kind.HTTP_ERROR:Kind.OTHER;
        try{
            // Fr() parses the first JSON line; deferred records are not needed for
            // a synchronous action result. Reject extra nonempty lines conservatively.
            JSONTokener tokener=new JSONTokener(body.trim());
            Object parsed=tokener.nextValue();
            if(tokener.nextClean()!=0||!(parsed instanceof JSONArray))return Kind.MALFORMED;
            JSONArray arr=(JSONArray)parsed;
            if(arr.length()==0||arr.length()>10000||!(arr.get(0) instanceof JSONObject))return Kind.MALFORMED;
            MebukiActionResponse t=new MebukiActionResponse(arr);
            JSONObject root=arr.getJSONObject(0);
            Object error=t.field(root,"error");
            if(error!=null)return Kind.ROUTER_ERROR;
            Object redirect=t.field(root,"redirect");
            if(redirect!=null)return redirect instanceof String?redirect((String)redirect,slug):Kind.OTHER_REDIRECT;
            Object data=t.field(root,"data");
            if(data==JSONObject.NULL)return status>=400?Kind.HTTP_ERROR:Kind.ROUTER_DATA;
            if(!(data instanceof JSONObject))return Kind.MALFORMED;
            JSONObject result=(JSONObject)data;
            Object state=t.field(result,"status");
            if("error".equals(state)||t.field(result,"error")!=null)return Kind.ROUTER_ERROR;
            // Official compose closes when lastResult.status != "error".
            // A router data result is only a candidate; readback must prove it.
            return status>=400?Kind.HTTP_ERROR:state==null||state==JSONObject.NULL||"success".equals(state)?Kind.ROUTER_DATA:Kind.MALFORMED;
        }catch(Exception ex){return Kind.MALFORMED;}
    }
}
