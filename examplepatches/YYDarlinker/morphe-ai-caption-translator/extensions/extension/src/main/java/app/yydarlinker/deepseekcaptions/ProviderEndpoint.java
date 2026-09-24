package app.yydarlinker.deepseekcaptions;
import java.net.URI;
import java.util.Locale;
import java.net.HttpURLConnection;
/** OpenAI Chat Completions compatible endpoints. No redirects, suffix-spoofing or protocol guessing. */
final class ProviderEndpoint {
    static boolean domain(String host,String domain){return host.equals(domain)||host.endsWith("."+domain);}
    static boolean ark(String host){return host.matches("ark\\.[a-z0-9-]+\\.volces\\.com");}
    static String host(String base){try{return URI.create(base).getHost().toLowerCase(Locale.ROOT);}catch(Exception e){return "";}}
    static boolean bailian(String host){return domain(host,"dashscope.aliyuncs.com")||domain(host,"dashscope-intl.aliyuncs.com")||domain(host,"dashscope-us.aliyuncs.com")||domain(host,"maas.aliyuncs.com");}
    static String validate(String base){
        try{
            URI u=URI.create(base==null?"":base.trim());String h=u.getHost();
            if(h==null||!("https".equalsIgnoreCase(u.getScheme())||"http".equalsIgnoreCase(u.getScheme()))||u.getRawUserInfo()!=null||u.getRawFragment()!=null)throw new IllegalArgumentException();
            String path=u.getPath();while(path.endsWith("/"))path=path.substring(0,path.length()-1);
            if(path.endsWith("/messages")||path.endsWith("/responses")||path.contains(":generateContent")||path.endsWith("/api/generate")||path.endsWith("/api/chat")||path.endsWith("/apps/anthropic"))
                throw new IllegalArgumentException("Use an OpenAI-compatible Chat Completions endpoint, not a native Messages/Responses/Generate endpoint");
            return u.toASCIIString();
        }catch(IllegalArgumentException invalid){throw new IllegalArgumentException("Invalid API URL: use an HTTP(S) OpenAI-compatible base URL without credentials or fragments",invalid);}
    }
    static String chat(String base){return resolve(base,false);}
    static String models(String base){return resolve(base,true);}
    private static String resolve(String base,boolean models){
        URI u=URI.create(validate(base));String h=host(base),path=u.getRawPath();
        while(path.endsWith("/"))path=path.substring(0,path.length()-1);
        if(path.endsWith("/chat/completions"))path=path.substring(0,path.length()-17);
        else if(path.endsWith("/models"))path=path.substring(0,path.length()-7);
        else if(path.endsWith("/completions"))path=path.substring(0,path.length()-12);
        if(path.isEmpty()){
            if(h.equals("coding.dashscope.aliyuncs.com"))path="/v1";
            else if(bailian(h))path="/compatible-mode/v1";
            else if(h.equals("openrouter.ai"))path="/api/v1";
            else if(h.equals("api.groq.com")||h.equals("api.cerebras.ai"))path=h.equals("api.groq.com")?"/openai/v1":"/v1";
            else if(h.equals("generativelanguage.googleapis.com"))path="/v1beta/openai";
            else if(h.equals("open.bigmodel.cn"))path="/api/paas/v4";
            else if(ark(h))path="/api/v3";
            else if(domain(h,"openai.azure.com")||domain(h,"services.ai.azure.com"))path="/openai/v1";
            else if(h.equals("api.anthropic.com")||h.equals("api.minimax.io")||h.equals("api.minimaxi.com")||h.equals("api.openai.com")||h.equals("api.deepseek.com")||h.equals("api.siliconflow.cn")||h.equals("api.siliconflow.com")||h.equals("api.moonshot.cn")||h.equals("api.moonshot.ai")||h.equals("api.mistral.ai")||h.equals("api.x.ai")||h.equals("api.together.ai")||h.equals("api.together.xyz")||h.equals("api.fireworks.ai"))path=h.equals("api.fireworks.ai")?"/inference/v1":"/v1";
        }
        if(models&&path.contains("/deployments/"))throw new IllegalArgumentException("Azure deployment URLs require a manually entered deployment name");
        return u.getScheme()+"://"+u.getRawAuthority()+path+(models?"/models":"/chat/completions")+(u.getRawQuery()==null?"":"?"+u.getRawQuery());
    }
    static void authenticate(HttpURLConnection c,String base,String key){
        String h=host(base);boolean azure=domain(h,"openai.azure.com")||domain(h,"services.ai.azure.com");
        c.setRequestProperty(azure?"api-key":"Authorization",azure?key:"Bearer "+key);
    }
}
