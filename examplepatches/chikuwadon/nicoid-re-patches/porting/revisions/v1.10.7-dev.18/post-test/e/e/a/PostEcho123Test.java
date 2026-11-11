package e.e.a;
import java.io.IOException;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

public final class PostEcho123Test {
    static int checks;
    static void check(boolean condition,String name){
        checks++;
        if(!condition)throw new AssertionError(name);
    }
    public static final class Player {public long getCurrentPosition(){return 12600L;}}
    public static final class Popup {public final Player e=new Player();}
    public static final class Fragment {public final Player a0=new Player();}
    public static final class Model {
        public final Object k;public final String d;public Object modernWatch=new Object();
        public Model(Object fragment,String id){k=fragment;d=id;}
        public void a(String flags,Integer[] attributes,String[] labels){
            attributes[0]=0;attributes[1]=0;attributes[2]=0;labels[2]="";
        }
    }
    static JSONObject reply(int status,String id,int no){
        return new JSONObject().put("meta",new JSONObject().put("status",status))
            .put("data",new JSONObject().put("id",id).put("no",no));
    }
    static JSONObject request(String id){
        return new JSONObject().put("videoId",id).put("body","test")
            .put("vposMs",10000L).put("commands",new JSONArray().put("small"));
    }
    static void mustReject(JSONObject response,String name){
        try{PostEcho123.accepted(response,null,null);throw new AssertionError(name);}
        catch(IOException expected){checks++;}
    }
    public static void main(String[]args)throws Exception {
        mustReject(reply(201,"",7),"missing ID");
        mustReject(reply(201,"123",0),"missing number");
        mustReject(reply(400,"123",7),"API error");
        mustReject(new JSONObject(),"missing metadata");
        PostEcho123.accepted(reply(201,"123",7),null,null);
        check(true,"confirmed request");
        Fragment fragment=new Fragment();
        Model model=new Model(fragment,"sm12");
        ArrayList<q> first=new ArrayList<>();
        first.add(new q("existing","",new Integer[]{1000,6,0,0,0,null,null,null}));
        ArrayList<?> current=PostEcho123.keep(model,first);
        check(current.size()==1,"first load unchanged");
        PostEcho123.accepted(reply(201,"999",7),fragment,request("sm12"));
        check(CommentUi.last!=null&&CommentUi.last.size()==2,"confirmed post echoed");
        Object preview=CommentUi.last.get(1);
        check(((q)preview).attributes[1]==7,"echo has server number");
        check(((q)preview).attributes[0]>=1320,"echo appears after current playback position");
        ArrayList<q> refreshed=new ArrayList<>(first);
        refreshed.add(new q("canonical","",new Integer[]{1000,7,0,0,0,null,null,null}));
        ArrayList<?> currentAgain=PostEcho123.keep(model,refreshed);
        check(currentAgain.size()==2,"canonical server copy replaces echo");
        PostEcho123.accepted(reply(201,"999",7),fragment,request("sm12"));
        check(CommentUi.last.size()==2,"already fetched server comment is not echoed twice");
        PostEcho123.accepted(reply(201,"888",8),fragment,request("sm55"));
        check(CommentUi.last.size()==2,"different video rejected");
        Fragment f2=new Fragment();Model m2=new Model(f2,"sm99");
        PostEcho123.keep(m2,new ArrayList<q>());
        PostEcho123.accepted(reply(201,"new",12),f2,request("sm99"));
        m2.modernWatch=new Object();
        check(PostEcho123.keep(m2,new ArrayList<q>()).isEmpty(),"same video reload must drop old-session echoes");
        android.os.Handler.defer=true;
        PostEcho123.accepted(reply(201,"late",13),f2,request("sm99"));
        Model replacement=new Model(f2,"sm99");
        PostEcho123.keep(replacement,new ArrayList<q>());
        CommentUi.last=null;
        android.os.Handler.flush();
        check(CommentUi.last==null,"queued acknowledgement cannot enter replacement session");
        android.os.Handler.defer=false;
        Object optional=new Object();Model optionalModel=new Model(optional,"sm21");
        PostEcho123.keep(optionalModel,new ArrayList<q>());CommentUi.last=null;
        PostEcho123.accepted(reply(201,"no-player",21),optional,request("sm21"));
        check(CommentUi.last!=null&&CommentUi.last.size()==1,"optional player absence cannot discard accepted echo");
        Popup popup=new Popup();Model popupModel=new Model(popup,"sm22");
        PostEcho123.keep(popupModel,new ArrayList<q>());CommentUi.last=null;
        PostEcho123.accepted(reply(201,"popup",22),popup,request("sm22"));
        check(CommentUi.last!=null&&((q)CommentUi.last.get(0)).attributes[0]>=1320,"popup player position uses service video field");
        Fragment networkFragment=new Fragment();Model networkModel=new Model(networkFragment,"sm30");
        PostEcho123.keep(networkModel,new ArrayList<q>());
        Object networkTicket=PostEcho123.ticket(networkFragment);
        // Request starts in this session; the server acknowledgement arrives after a same-video reload.
        PostEcho123.keep(new Model(networkFragment,"sm30"),new ArrayList<q>());CommentUi.last=null;
        PostEcho123.accepted(reply(201,"network-late",30),networkFragment,request("sm30"),networkTicket);
        check(CommentUi.last==null,"response from previous network session cannot echo into reloaded video");
        Object currentTicket=PostEcho123.ticket(networkFragment);
        PostEcho123.accepted(reply(201,"network-current",31),networkFragment,request("sm30"),currentTicket);
        check(CommentUi.last!=null&&CommentUi.last.size()==1,"current network session retains confirmed echo");
        System.out.println("PostEcho123: "+checks+" assertions passed");
    }
}
