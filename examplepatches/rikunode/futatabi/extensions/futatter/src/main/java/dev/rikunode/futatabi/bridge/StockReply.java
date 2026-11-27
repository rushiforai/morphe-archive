package dev.rikunode.futatabi.bridge;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import org.json.JSONObject;

/** Only the stock in-process multipart form can enter the existing official writers. */
final class StockReply {
    private final AimogeAdapter aimoge;
    private final AnimanchAdapter animanch;
    private final ExtensionApi api;
    interface MebukiHandoff { String open(MebukiNewThreadDraft draft); }
    interface AnimanchHandoff { BridgeServer.BridgeResponse open(AnimanchNewThreadDraft draft); }
    private final MebukiHandoff handoff;
    private final AnimanchHandoff categoryPicker;
    StockReply(AimogeAdapter a,AnimanchAdapter b,ExtensionApi e){this(a,b,e,draft->"めぶきの確認画面を開けません。未送信です。");}
    StockReply(AimogeAdapter a,AnimanchAdapter b,ExtensionApi e,MebukiHandoff h){this(a,b,e,h,draft->error("カテゴリ選択画面を開けません。未送信です。"));}
    StockReply(AimogeAdapter a,AnimanchAdapter b,ExtensionApi e,MebukiHandoff h,AnimanchHandoff picker){aimoge=a;animanch=b;api=e;handoff=h;categoryPicker=picker;}
    static boolean isPath(String path){
        return "/aimoge/futaba.php?guid=on".equals(path)||"/animanch/futaba.php?guid=on".equals(path)
                ||"/mebuki/futaba.php?guid=on".equals(path);
    }
    static boolean stockHeaders(Map<String,String> h){
        if(!"127.0.0.1:18765".equals(h.get("host")) || h.containsKey("origin"))return false;
        for(String key:h.keySet())if(key.startsWith("sec-fetch-")||key.equals("access-control-request-method"))return false;
        return true;
    }
    BridgeServer.BridgeResponse submit(String path,Map<String,String> headers,byte[] body){
        if(!isPath(path)||!stockHeaders(headers))return BridgeServer.BridgeResponse.text(403,"Not authorized");
        try{
            StockReplyRequest request=StockReplyRequest.parse(headers.get("content-type"),body);
            String board=path.startsWith("/aimoge/")?"aimoge":path.startsWith("/mebuki/")?"mebuki":"animanch";
            String id=request.get("resto");
            boolean creating=id.isEmpty()||"0".equals(id);
            if(creating&&"mebuki".equals(board)) {
                try { return error(handoff.open(new MebukiNewThreadDraft(request))); }
                catch(IllegalArgumentException ex){return error(ex.getMessage());}
            }
            if(!creating&&!id.matches("[1-9][0-9]{12}"))return error("\u8fd4\u4fe1\u5148\u304c\u4e0d\u6b63\u3067\u3059\u3002");
            if("mebuki".equals(board))return submitMebuki(request,id);
            boolean a="aimoge".equals(board);
            String source=creating?"":a?aimoge.stockThreadUuid(id):animanch.stockThreadId(id);
            if(source==null)return error("\u8fd4\u4fe1\u5148\u3092\u7279\u5b9a\u3067\u304d\u307e\u305b\u3093\u3002");
            JSONObject payload;
            try{payload=request.payload(board,creating?"":a?source:id);}
            catch(IllegalArgumentException ex){return error(ex.getMessage());}
            if(creating&&!a) {
                try { return categoryPicker.open(new AnimanchNewThreadDraft(payload,
                        selected->send(false,true,"","",selected))); }
                catch(IllegalArgumentException ex){return error(ex.getMessage());}
            }
            return send(a,creating,source,id,payload);
        }catch(Exception ex){
            return error("投稿結果を確認できません。再送前にスレを確認してください。");
        }
    }
    private BridgeServer.BridgeResponse send(boolean a,boolean creating,String source,String id,JSONObject payload){
        try{
            BridgeServer.BridgeResponse upstream=a?api.submit(payload):animanch.post(payload);
            if(upstream.status!=201){
                if(upstream.status==409 && !a){
                    try{
                        JSONObject partial=new JSONObject(new String(upstream.bytes,StandardCharsets.UTF_8));
                        if(creating&&partial.optBoolean("newThreadError"))return error(partial.getString("error"));
                        if(partial.optBoolean("postAccepted")){
                            int status=partial.optInt("uploadHttpStatus",0);
                            String detail=status>0?"（HTTP "+status+"）":"（HTTPステータス未取得）";
                            return error("本文受理済み。画像の送信結果を確認できません"+detail+"。再投稿せずスレを更新して確認してください。");
                        }
                    }catch(Exception ignored){}
                }
                return error("\u6295\u7a3f\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093 (HTTP "+upstream.status+")\u3002\u518d\u9001\u524d\u306b\u30b9\u30ec\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
            }
            String number;
            try{
                JSONObject result=new JSONObject(new String(upstream.bytes,StandardCharsets.UTF_8));
                number=creating?(a?aimoge.confirmedNewThread(result):animanch.confirmedNewThread(result)):
                        (a?aimoge.confirmedNumber(source,result):animanch.confirmedNumber(id,result));
            }catch(Exception ex){number=null;}
            if(number==null)return error("\u53d7\u7406\u6e08\u307f\u3067\u3059\u304c\u6295\u7a3f\u756a\u53f7\u306e\u78ba\u8a8d\u306b\u5931\u6557\u3002\u518d\u6295\u7a3f\u305b\u305a\u66f4\u65b0\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
            return new BridgeServer.BridgeResponse(200,"application/json; charset=Shift_JIS",
                    ("{\"status\":\"ok\",\"thisno\":"+number+"}").getBytes(StandardCharsets.US_ASCII));
        }catch(Exception ex){
            return error("\u6295\u7a3f\u7d50\u679c\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3002\u518d\u9001\u524d\u306b\u30b9\u30ec\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
        }
    }
    private BridgeServer.BridgeResponse submitMebuki(StockReplyRequest request,String id)throws Exception{
        if(request.image!=null)return error("\u3081\u3076\u304d\u306e\u6dfb\u4ed8\u6295\u7a3f\u306f\u307e\u3060\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093\u3002");
        if(!request.get("sub").isEmpty()||!request.get("name").isEmpty()||!request.get("email").isEmpty())
            return error("\u3081\u3076\u304d\u3067\u306f\u984c\u540d\u30fb\u540d\u524d\u30fbE-mail\u6b04\u3092\u7a7a\u306b\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
        JSONObject payload=new JSONObject().put("threadId",id).put("content",request.get("com"))
                .put("stockQuote",true).put("showUsername",false).put("showThreadOwner",false);
        BridgeServer.BridgeResponse result=api.submitMebuki(payload);
        if(result.status==201){
            JSONObject data=new JSONObject(new String(result.bytes,StandardCharsets.UTF_8));
            String no=data.optString("thisno");
            if(data.optBoolean("confirmed")&&no.matches("[1-9][0-9]{12}"))
                return new BridgeServer.BridgeResponse(200,"application/json; charset=Shift_JIS",
                    ("{\"status\":\"ok\",\"thisno\":"+no+"}").getBytes(StandardCharsets.US_ASCII));
        }
        if(result.status==401)return error("\u3081\u3076\u304d\u306e\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059\u3002\u62e1\u5f35\u30db\u30fc\u30e0\u3067\u518d\u8a8d\u8a3c\u30fb\u4fdd\u5b58\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
        if(result.status==405)return error("\u3081\u3076\u304d\u306e\u6295\u7a3f\u5148\u304c\u53d7\u4ed8\u4e0d\u53ef\u3067\u3059\uff08HTTP 405\uff09\u3002\u6295\u7a3f\u8a3a\u65ad\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
        if(result.status==429)return error("\u3081\u3076\u304d\u306e\u6295\u7a3f\u5236\u9650\u4e2d\u3067\u3059\u3002\u6642\u9593\u3092\u304a\u3044\u3066\u304f\u3060\u3055\u3044\u3002");
        if(result.status==403)return error("\u3081\u3076\u304d\u304c\u6295\u7a3f\u3092\u62d2\u5426\u3057\u307e\u3057\u305f\u3002\u516c\u5f0f\u30b5\u30a4\u30c8\u3067\u6295\u7a3f\u6a29\u9650\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
        if(result.status==400||result.status==422||result.status==404)return error("\u3081\u3076\u304d\u306e\u6295\u7a3f\u6761\u4ef6\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
        if(result.status==503)return error("\u3081\u3076\u304d\u306e\u30bb\u30c3\u30b7\u30e7\u30f3\u307e\u305f\u306f\u30b9\u30ec\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3002\u6295\u7a3f\u306f\u9001\u4fe1\u3057\u3066\u3044\u307e\u305b\u3093\u3002");
        return error("\u3081\u3076\u304d\u306e\u6295\u7a3f\u7d50\u679c\u304c\u672a\u78ba\u5b9a\u3067\u3059\u3002\u518d\u6295\u7a3f\u305b\u305a\u30b9\u30ec\u3092\u66f4\u65b0\u3057\u3066\u304f\u3060\u3055\u3044\u3002\u62e1\u5f35\u30db\u30fc\u30e0\u306e\u3081\u3076\u304d\u6295\u7a3f\u8a3a\u65ad\u3082\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
    }
    static BridgeServer.BridgeResponse error(String message){
        // Stock client decodes Windows31J and treats non-success text as a failure.
        return new BridgeServer.BridgeResponse(200,"text/plain; charset=Shift_JIS",
                message.getBytes(Charset.forName("Shift_JIS")));
    }
}
