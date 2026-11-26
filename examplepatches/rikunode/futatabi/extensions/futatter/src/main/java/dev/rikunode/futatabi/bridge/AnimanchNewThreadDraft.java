package dev.rikunode.futatabi.bridge;

import org.json.JSONArray;
import org.json.JSONObject;

/** One-shot in-process draft. Selection, not opening the picker, authorizes submission. */
final class AnimanchNewThreadDraft {
    interface Sender { BridgeServer.BridgeResponse send(JSONObject payload); }
    private JSONObject payload;
    private final Sender sender;
    private boolean started, finished;

    AnimanchNewThreadDraft(JSONObject payload, Sender sender) {
        String title=payload.optString("title"), body=payload.optString("body");
        JSONArray attachments=payload.optJSONArray("attachments");
        if(title.trim().isEmpty() || title.length()>64 || body.trim().isEmpty() ||
                body.length()>1000 || attachments==null || attachments.length()!=1)
            throw new IllegalArgumentException("あにまんのスレ立てには題名（64文字以内）・本文（1000文字以内）・画像1枚が必要です。");
        this.payload=payload;
        this.sender=sender;
    }

    synchronized boolean inFlight() { return started && !finished; }
    synchronized void cancel() {
        if(!started){payload=null;finished=true;}
    }
    BridgeServer.BridgeResponse choose(int id) {
        JSONObject selected;
        synchronized(this) {
            if(StockReplyRequest.animanchCategoryName(id)==null)
                return StockReply.error("選択できないカテゴリです。未送信です。");
            if(started || finished || payload==null)
                return StockReply.error("この下書きは処理済みです。再送しないでください。");
            started=true;
            selected=payload;
            payload=null;
        }
        try {
            selected.put("category",Integer.toString(id));
            return sender.send(selected);
        } catch(Exception ex) {
            return StockReply.error("投稿結果を確認できません。再送前にスレを確認してください。");
        } finally {
            synchronized(this){finished=true;}
        }
    }
}
