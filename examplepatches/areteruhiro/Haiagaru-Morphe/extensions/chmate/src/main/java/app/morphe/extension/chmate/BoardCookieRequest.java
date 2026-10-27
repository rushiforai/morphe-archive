package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/** Inspect repeatable native form data without consuming or rewriting the request. */
final class BoardCookieRequest {
    static String board(Object request) {
        if(request==null)return null;
        try {
            String urlField;
            switch(request.getClass().getName()) {
                case "o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8":
                case "o.zzcvq": urlField="f"; break;
                case "o.zzdA": urlField="h"; break;
                default: return null;
            }
            return board(request,String.valueOf(field(request,urlField)));
        }catch(ReflectiveOperationException | RuntimeException unsupported){return null;}
    }

    static String board(Object request, String address) {
        try {
            String bodyField;
            switch (request.getClass().getName()) {
                case "o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8": bodyField="e"; break;
                case "o.zzdA": bodyField="b"; break;
                case "o.zzcvq": bodyField="d"; break;
                default: return BoardCookiePolicy.board(address,null);
            }
            return BoardCookiePolicy.board(address, formBoard(field(request,bodyField)));
        } catch (ReflectiveOperationException | RuntimeException unsupported) {
            return null;
        }
    }

    static String formBoard(Object body) throws ReflectiveOperationException {
        if(body==null)return null;
        // Names/values have explicit roles. A message containing "bbs" is not a key.
        switch(body.getClass().getName()) {
            case "o.oExternalSyntheticLambda1": return lists((List<?>)field(body,"a"),(List<?>)field(body,"b"));
            case "o.zzfv": return lists((List<?>)field(body,"e"),(List<?>)field(body,"b"));
            case "o.zzcvg": return lists((List<?>)field(body,"c"),(List<?>)field(body,"a"));
            case "o.r8lambdaGZC8a_4Sth8OENyznWf4FMVcU0$RemoteActionCompatParcelizer$IconCompatParcelizer":
                return bytes((byte[])field(body,"c"),(Integer)field(body,"a"),(Integer)field(body,"b"));
            case "o.zzdB$ComponentActivity$write":
                return bytes((byte[])field(body,"a"),(Integer)field(body,"d"),(Integer)field(body,"c"));
            case "o.zzcvw$IconCompatParcelizer$RemoteActionCompatParcelizer":
                return bytes((byte[])field(body,"a"),(Integer)field(body,"b"),(Integer)field(body,"d"));
            default: return null; // Stream/file/wrapped bodies are left untouched.
        }
    }

    static String lists(List<?> names,List<?> values) {
        if(names==null||values==null||names.size()!=values.size()||names.size()>4096)return null;
        String board=null;
        try {
            for(int i=0;i<names.size();i++) {
                String name=URLDecoder.decode((String)names.get(i),"UTF-8");
                if(!"bbs".equals(name)&&!"board".equals(name))continue;
                String value=URLDecoder.decode((String)values.get(i),"UTF-8");
                if(!value.matches("[A-Za-z0-9_-]{1,80}")||board!=null&&!board.equals(value))return null;
                board=value;
            }
        }catch(Exception invalid){return null;}
        return board;
    }

    static String bytes(byte[] data,int offset,int count) {
        if(data==null||offset<0||count<0||count>131072||offset>data.length-count)return null;
        return BoardCookiePolicy.formBoard(new String(data,offset,count,StandardCharsets.ISO_8859_1));
    }

    private static Object field(Object owner,String name)throws ReflectiveOperationException {
        Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);
    }
    private BoardCookieRequest(){}
}
