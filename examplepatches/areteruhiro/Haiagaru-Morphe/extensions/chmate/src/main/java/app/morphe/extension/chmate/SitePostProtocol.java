package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;

/** Plans a text reply from the site's own current form. Never fabricates browser proof or consent. */
final class SitePostProtocol {
    static final class Image {
        final byte[] bytes;final String name,type;
        Image(byte[] bytes)throws IOException{
            if(bytes==null||bytes.length<12||bytes.length>8*1024*1024)throw new IOException("画像は8MiB以内で指定してください");
            if((bytes[0]&255)==255&&(bytes[1]&255)==216&&(bytes[2]&255)==255){type="image/jpeg";name="image.jpg";}
            else if(bytes[0]==(byte)137&&bytes[1]==80&&bytes[2]==78&&bytes[3]==71&&bytes[4]==13&&bytes[5]==10&&bytes[6]==26&&bytes[7]==10){type="image/png";name="image.png";}
            else if(new String(bytes,0,6,java.nio.charset.StandardCharsets.US_ASCII).matches("GIF8[79]a")){type="image/gif";name="image.gif";}
            else throw new IOException("JPEG・PNG・GIFの画像を指定してください");
            this.bytes=bytes.clone();
        }
    }
    static final class Plan {
        final String url,check,charset,referer;final boolean multipart;final Map<String,String> fields;
        final Image image;final String imageField;
        Plan(String url,String check,String charset,boolean multipart,Map<String,String> fields,String referer){
            this(url,check,charset,multipart,fields,referer,null,null);
        }
        Plan(String url,String check,String charset,boolean multipart,Map<String,String> fields,String referer,Image image,String imageField){
            this.url=url;this.check=check;this.charset=charset;this.multipart=multipart;this.referer=referer;
            this.fields=Collections.unmodifiableMap(new LinkedHashMap<>(fields));
            this.image=image;this.imageField=imageField;
        }
    }
    static Plan attach(Plan plan,SiteBoardProtocol.Board board,String html,Image image)throws IOException{
        if(image==null)return plan;if(board.kind.equals("animanch"))return new Plan(plan.url,plan.check,plan.charset,plan.multipart,plan.fields,plan.referer,image,null);
        Document doc=Jsoup.parse(html,plan.referer);String field=board.kind.equals("futaba")?"upfile":"image_post";
        Element form=doc.selectFirst(board.kind.equals("futaba")?"form#fm":"form#imgForm, form#ajax_directForm, form[name=thrAdd]");if(form==null||form.selectFirst("input[type=file][name="+field+"]")==null)throw new IOException("この投稿フォームは画像添付に対応していません");
        if(board.kind.equals("futaba")){
            java.util.regex.Matcher limit=java.util.regex.Pattern.compile("([0-9]{1,6})KBまで").matcher(doc.text());if(!limit.find())throw new IOException("画像の上限サイズを確認できません");
            if(image.bytes.length>Long.parseLong(limit.group(1))*1024)throw new IOException("この板の画像サイズ上限を超えています");
        }
        Map<String,String> fields=new LinkedHashMap<>(plan.fields);fields.remove(field);fields.remove("textonly");
        return new Plan(plan.url,plan.check,plan.charset,true,fields,plan.referer,image,field);
    }
    static Plan imageUpload(String thread,int number,Image image)throws IOException{
        if(thread==null||!thread.matches("[1-9][0-9]{0,11}")||number<1||image==null)throw new IOException("画像の投稿先が不正です");
        Map<String,String> fields=new LinkedHashMap<>();fields.put("thread",thread);fields.put("upname",Integer.toString(number));
        return new Plan(AnimanchProtocol.ORIGIN+"/upload/",null,"UTF-8",true,fields,AnimanchProtocol.ORIGIN+"/board/"+thread+"/",image,"file1");
    }
    static Plan create(SiteBoardProtocol.Board board,String html,String title,String name,String email,String body,String password,Image image)throws IOException{
        if(title==null||title.trim().isEmpty()||body==null||body.trim().isEmpty()||body.length()>20000||body.indexOf('\0')>=0)throw new IOException("タイトルと本文を入力してください");
        String normalized=body.replace("\r\n","\n").replace('\r','\n');Document doc=Jsoup.parse(html,board.url);
        if(board.kind.equals("animanch")){
            if(image==null)throw new IOException("あにまんの新規スレには画像が必要です");if(title.length()>64||body.length()>1000||body.split("\n",-1).length>30||name.length()>15)throw new IOException("あにまんの入力文字数・行数を超えています");
            Element category=doc.selectFirst("select[name=category]");String number=board.path.replaceFirst("^/category([0-9]+)/$","$1");
            if(!number.matches("[0-9]+")||category==null||category.selectFirst("option[value="+number+"]")==null)throw new IOException("新規スレを作成するカテゴリを選択してください");
            Map<String,String> fields=new LinkedHashMap<>();fields.put("title",title);fields.put("category",number);fields.put("name",name);fields.put("text",normalized);
            return new Plan(AnimanchProtocol.POST,AnimanchProtocol.CHECK,"UTF-8",false,fields,board.url,image,null);
        }
        Element form=doc.selectFirst(board.kind.equals("futaba")?"form#fm":"form#imgForm, form[name=thrAdd]");if(form==null||!form.attr("method").equalsIgnoreCase("post"))throw new IOException("スレ作成フォームを確認できません");
        if(!form.select("input[type=checkbox][required]:not([checked])").isEmpty())throw new IOException("サイトの確認・同意が必要です");
        String target=SiteBoardProtocol.resolve(board.url,form.attr("action"));
        if(target==null||!board.host.equals(URI.create(target).getHost())||!(board.kind.equals("futaba")?URI.create(target).getPath().equals("/"+board.path+"/futaba.php"):URI.create(target).getPath().startsWith("/thr_tc1/")))throw new IOException("スレ作成先を確認できません");
        LinkedHashMap<String,String> fields=new LinkedHashMap<>();for(Element input:form.select("input[type=hidden][name]")){String key=input.attr("name");if(!key.matches("[A-Za-z0-9_]{1,80}")||fields.put(key,input.attr("value"))!=null)throw new IOException("未対応の投稿フォームです");}
        if(board.kind.equals("futaba")){
            if(!"regist".equals(fields.get("mode"))||!fields.getOrDefault("resto","").matches("0?"))throw new IOException("新規スレ用フォームではありません");
            fields.put("name",name);fields.put("email",email);fields.put("sub",title);fields.put("com",normalized);fields.put("pwd",password);if(image==null){if(form.selectFirst("input[name=textonly]")==null)throw new IOException("この板のスレ作成には画像が必要です");fields.put("textonly","on");}
        }else{
            for(String part:board.path.split("/")){String[] pair=part.split("=",2);if(pair.length==2&&!pair[1].equals(fields.get(pair[0])))throw new IOException("作成先の板が一致しません");}
            Element titleInput=form.selectFirst("input[name=title][maxlength]");if(titleInput==null||!titleInput.attr("maxlength").matches("[0-9]{1,4}")||title.length()>Integer.parseInt(titleInput.attr("maxlength")))throw new IOException("タイトルの長さを確認してください");
            fields.put("title",title);fields.put("name",name);fields.put("mailaddr",email);fields.put("body",normalized);
            for(Element required:form.select("input[required], textarea[required], select[required]")){
                if(required.hasAttr("disabled"))continue;
                if(required.attr("type").equalsIgnoreCase("file")){
                    if(image==null)throw new IOException("この板のスレ作成には画像が必要です");
                }else if(!fields.containsKey(required.attr("name"))||fields.get(required.attr("name")).trim().isEmpty()){
                    throw new IOException("この板では出典などの専用項目が必要なため、現在の書き込み画面からスレを作成できません");
                }
            }
        }
        return attach(new Plan(target,null,board.kind.equals("futaba")?"windows-31j":"UTF-8",true,fields,board.url),board,html,image);
    }
    static String createdThread(SiteBoardProtocol.Board board,int status,String location,String body){
        if(board.kind.equals("animanch"))try{org.json.JSONObject obj=new org.json.JSONObject(body);String id=String.valueOf(obj.get("thread"));return status==200&&AnimanchProtocol.postedReply(body,id)==1?id:null;}catch(Exception invalid){return null;}
        if(status==302||status==303)return SiteBoardProtocol.threadIn(board,SiteBoardProtocol.resolve(board.url,location));
        return null;
    }
    static Plan confirmation(SiteBoardProtocol.Board board,Plan previous,String html)throws IOException{
        if(!board.kind.equals("bakusai")||!URI.create(previous.url).getPath().startsWith("/thr_tc1/"))return null;
        Document doc=Jsoup.parse(html,previous.url);Element form=doc.selectFirst("form#imgForm,form[name=thrAdd]");if(form==null)return null;
        String target=SiteBoardProtocol.resolve(previous.url,form.attr("action"));if(target==null||!"bakusai.com".equals(URI.create(target).getHost())||!URI.create(target).getPath().matches("/thr_tc[2-9]/[^?]*")||!form.attr("method").equalsIgnoreCase("post"))return null;
        if(!form.select("input[type=checkbox][required]:not([checked])").isEmpty())throw new IOException("サイトの追加確認が必要です");
        Map<String,String> fields=new LinkedHashMap<>();for(Element input:form.select("input[type=hidden][name]")){String key=input.attr("name");if(!key.matches("[A-Za-z0-9_]{1,80}")||fields.put(key,input.attr("value"))!=null)throw new IOException("確認フォームが不正です");}
        for(String key:new String[]{"title","body","acode","ctgid","bid"})if(!Objects.equals(fields.get(key),previous.fields.get(key)))throw new IOException("確認画面の投稿内容・投稿先が一致しません");
        return new Plan(target,null,previous.charset,true,fields,previous.url,previous.image,previous.imageField);
    }
    static Plan reply(SiteBoardProtocol.Board board,String thread,String html,String name,String email,String body,String password)throws IOException{
        if(body==null||body.trim().isEmpty()||body.length()>20000||body.indexOf('\0')>=0)throw new IOException("本文を入力してください（2万文字以内）");
        String normalized=body.replace("\r\n","\n").replace('\r','\n');
        if(board.kind.equals("animanch")){
            AnimanchProtocol.replyForm(thread,name,body);
            LinkedHashMap<String,String> fields=new LinkedHashMap<>();fields.put("thread",thread);fields.put("name",name);fields.put("text",normalized);
            return new Plan(AnimanchProtocol.POST,AnimanchProtocol.CHECK,"UTF-8",false,fields,board.threadUrl(thread));
        }
        Document doc=Jsoup.parse(html,board.threadUrl(thread));Element form=doc.selectFirst(board.kind.equals("futaba")?"form#fm":"form#imgForm, form#ajax_directForm");
        if(form==null&&board.kind.equals("bakusai")){
            Element closed=doc.selectFirst(".over1000 .caution_body");
            if(closed!=null&&closed.text().contains("スレが立ってから30日を過ぎるとレス投稿が出来なくなります"))throw new IOException("このスレは作成から30日を過ぎたため、爆サイ側で投稿受付が終了しています。新しいスレを選んでください");
        }
        if(form==null||!form.attr("method").equalsIgnoreCase("post"))throw new IOException("投稿フォームを確認できません");
        if(!form.select("input[type=checkbox][required]:not([checked])").isEmpty())throw new IOException("サイトの確認・同意を通常の投稿画面で行ってください");
        String url=SiteBoardProtocol.resolve(board.threadUrl(thread),form.attr("action"));
        try{URI u=URI.create(url);if(!board.host.equals(u.getHost())
                ||(board.kind.equals("futaba")?!u.getPath().equals("/"+board.path+"/futaba.php"):!u.getPath().startsWith("/thr_cp/")))throw new IOException("投稿先が一致しません");}
        catch(RuntimeException invalid){throw new IOException("投稿先が不正です");}
        LinkedHashMap<String,String> fields=new LinkedHashMap<>();
        for(Element input:form.select("input[type=hidden][name]")){
            String key=input.attr("name");if(!key.matches("[A-Za-z0-9_]{1,80}")||fields.put(key,input.attr("value"))!=null)throw new IOException("未対応の投稿フォームです");
        }
        if(board.kind.equals("futaba")){
            if(!thread.equals(fields.get("resto"))||!"regist".equals(fields.get("mode")))throw new IOException("返信先を確認できません");
            fields.put("name",name);fields.put("email",email);fields.put("sub","");fields.put("com",normalized);fields.put("pwd",password);
        }else{
            if(!thread.equals(fields.get("tid")))throw new IOException("返信先を確認できません");
            for(String part:board.path.split("/")){String[] pair=part.split("=",2);if(pair.length==2&&!pair[1].equals(fields.get(pair[0])))throw new IOException("投稿先の板が一致しません");}
            fields.put("name",name);fields.put("mailaddr",email);fields.put("body",normalized);
        }
        return new Plan(url,null,board.kind.equals("futaba")?"windows-31j":"UTF-8",true,fields,board.threadUrl(thread));
    }
    static byte[] encoded(Plan plan,String boundary)throws IOException{
        StringBuilder out=new StringBuilder();
        if(!plan.multipart){for(Map.Entry<String,String> f:plan.fields.entrySet()){
            if(out.length()>0)out.append('&');out.append(URLEncoder.encode(f.getKey(),plan.charset)).append('=').append(URLEncoder.encode(f.getValue(),plan.charset));
        }}else{
            if(!boundary.matches("[A-Za-z0-9-]{12,80}"))throw new IOException("Invalid boundary");
            for(Map.Entry<String,String> f:plan.fields.entrySet()){
                if(f.getValue().contains(boundary))throw new IOException("投稿本文の区切りが競合しました");
                out.append("--").append(boundary).append("\r\nContent-Disposition: form-data; name=\"").append(f.getKey()).append("\"\r\n\r\n").append(f.getValue()).append("\r\n");
            }
            if(plan.image!=null&&plan.imageField!=null){
                if(!plan.imageField.matches("[A-Za-z0-9_]{1,80}"))throw new IOException("画像フィールドが不正です");
                out.append("--").append(boundary).append("\r\nContent-Disposition: form-data; name=\"").append(plan.imageField).append("\"; filename=\"").append(plan.image.name).append("\"\r\nContent-Type: ").append(plan.image.type).append("\r\n\r\n");
                if(!Charset.forName(plan.charset).newEncoder().canEncode(out))throw new IOException("この板の文字コードで送信できない文字があります");
                ByteArrayOutputStream binary=new ByteArrayOutputStream();binary.write(out.toString().getBytes(plan.charset));binary.write(plan.image.bytes);binary.write(("\r\n--"+boundary+"--\r\n").getBytes("US-ASCII"));return binary.toByteArray();
            }
            out.append("--").append(boundary).append("--\r\n");
        }
        if(!Charset.forName(plan.charset).newEncoder().canEncode(out))throw new IOException("この板の文字コードで送信できない文字があります");
        return out.toString().getBytes(plan.charset);
    }
    static boolean success(SiteBoardProtocol.Board board,String thread,int status,String location,String body){
        if(status<200||status>=400)return false;
        if(board.kind.equals("animanch"))try{return status==200&&AnimanchProtocol.postedReply(body,thread)>0;}catch(IOException failed){return false;}
        if(status==302||status==303){String target=SiteBoardProtocol.resolve(board.threadUrl(thread),location);return thread.equals(SiteBoardProtocol.threadIn(board,target));}
        if(status!=200)return false;
        Document doc=Jsoup.parse(body);if(doc.selectFirst(".thre,#threadBody,#res0_whole")!=null)return false;
        if(board.kind.equals("futaba")&&doc.selectFirst("form,blockquote") == null){
            for(Element meta:doc.select("meta[http-equiv]"))if(meta.attr("http-equiv").equalsIgnoreCase("refresh")){
                java.util.regex.Matcher redirect=java.util.regex.Pattern.compile("(?i)^[0-9]+;\\s*URL=(.+)$").matcher(meta.attr("content").trim());
                if(redirect.matches()&&thread.equals(SiteBoardProtocol.threadIn(board,SiteBoardProtocol.resolve(board.url,redirect.group(1))))
                        &&doc.body().text().matches("スレッド\\s*"+java.util.regex.Pattern.quote(thread)+"\\s*に切り替えます.*"))return true;
            }
        }
        String title=doc.title().trim();
        return title.equals("書きこみました。")||title.equals("書き込みました。")||title.equals("投稿完了")||title.equals("レス投稿完了");
    }
    static String futabaRejection(String body){
        if(body==null||body.length()>8192)return "";
        Document doc=Jsoup.parse(body);
        if(doc.selectFirst("form,script,blockquote,.thre,meta[http-equiv=refresh]")!=null)return "";
        String text=doc.body().text().trim();
        if(text.equals("cookieを有効にしてもう一度送信してください"))return "ふたばの投稿用Cookieを受け取りました。数秒待ってから、もう一度送信してください。今回の本文は投稿されていません。";
        if(text.matches("操作が早すぎます あと[0-9]{1,3}秒で再送できます"))return text+"。今回の本文は投稿されていません。";
        return "";
    }
    private SitePostProtocol(){}
}
