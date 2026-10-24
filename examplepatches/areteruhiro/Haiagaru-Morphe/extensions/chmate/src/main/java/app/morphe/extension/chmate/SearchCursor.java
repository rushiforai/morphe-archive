package app.morphe.extension.chmate;

import org.json.*;
import java.util.*;

/** Durable page boundary. An interrupted page is replayed, never silently skipped. */
final class SearchCursor {
    final List<String> boards, edgeIds;
    final String boardChoice, date, to, board, four;
    final int page, limit, edgeIndex;
    final boolean firstHalf;
    SearchCursor(List<String> boards,String boardChoice,String date,String to,String board,
            int page,String four,boolean firstHalf,int limit,List<String> edgeIds,int edgeIndex){
        this.boards=boards;this.boardChoice=boardChoice;this.date=date;this.to=to;this.board=board;
        this.page=page;this.four=four;this.firstHalf=firstHalf;this.limit=limit;this.edgeIds=edgeIds;this.edgeIndex=edgeIndex;
    }
    JSONObject encode(String next,String url,String title,Set<String> visited)throws JSONException{
        return new JSONObject().put("version",1).put("boards",boards==null?JSONObject.NULL:new JSONArray(boards))
                .put("edgeIds",edgeIds==null?JSONObject.NULL:new JSONArray(edgeIds)).put("boardChoice",boardChoice)
                .put("date",date).put("to",to).put("board",board).put("page",page).put("four",four)
                .put("firstHalf",firstHalf).put("limit",limit).put("edgeIndex",edgeIndex)
                .put("next",next).put("url",url).put("title",title).put("visited",new JSONArray(visited));
    }
    static List<String> strings(JSONArray a){
        if(a==null)return null;List<String> out=new ArrayList<>();for(int i=0;i<a.length();i++)out.add(a.optString(i));return out;
    }
    static SearchCursor decode(JSONObject o)throws JSONException{
        if(o==null||o.optInt("version")!=1)throw new JSONException("停止位置が保存されていません");
        List<String> boards=strings(o.optJSONArray("boards")),ids=strings(o.optJSONArray("edgeIds"));
        int page=o.getInt("page"),limit=o.getInt("limit"),index=o.getInt("edgeIndex");
        if(page<0||page>1000000||limit<1||limit>10000||index<0||(boards==null)==(ids==null))throw new JSONException("停止位置が不正です");
        if(ids!=null){for(String id:ids)if(!id.matches("[0-9]{10,}"))throw new JSONException("スレIDが不正です");
            if(index>ids.size())throw new JSONException("スレ位置が不正です");
        }else{
            if(boards.isEmpty()||!boards.contains(o.getString("board")))throw new JSONException("板が不正です");
            for(String b:boards)if(!b.matches("[a-z0-9_-]+"))throw new JSONException("板が不正です");
            if(!o.getString("date").matches("[0-9]{8}")||!o.getString("to").matches("[0-9]{8}"))throw new JSONException("日付が不正です");
        }
        checkUrl(o.optString("next"));checkUrl(o.optString("url"));
        return new SearchCursor(boards,o.getString("boardChoice"),o.getString("date"),o.getString("to"),o.getString("board"),
                page,o.getString("four"),o.getBoolean("firstHalf"),limit,ids,index);
    }
    private static void checkUrl(String url)throws JSONException{
        if(url.isEmpty())return;
        try{java.net.URI u=java.net.URI.create(url);
            if(!"https".equals(u.getScheme())||!"www.kyodemo.net".equals(u.getHost())||u.getPort()!=-1||u.getUserInfo()!=null
                    ||!(u.getPath().startsWith("/sdemo/b/e_e_liveedge/")||u.getPath().startsWith("/sdemo/r/e_e_liveedge/")))throw new Exception();
        }catch(Exception e){throw new JSONException("再開URLが不正です");}
    }
    static String nullable(JSONObject o,String key){String value=o.optString(key,"");return value.isEmpty()?null:value;}
}
