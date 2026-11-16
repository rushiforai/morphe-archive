package app.morphe.extension.chmate;
import org.json.JSONObject;
public final class MediaUploadManagementPolicyTest {
    static int checks;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
    public static void main(String[] args)throws Exception {
        String link="https://images2.imgbox.com/ab/cd/Fixture_o.png", page=MediaUploadManagementPolicy.imgbox("123","fixture-secret");
        check(MediaUploadManagementPolicy.valid("imgbox",link,page),"own imgbox management URL");
        String pile="https://cdn.imgpile.com/f/Fixture.webp", media=MediaUploadManagementPolicy.imgpile("Fixture");
        check(MediaUploadManagementPolicy.valid("imgpile",pile,media),"own imgpile media page");
        for(String bad:new String[]{"http://imgbox.com/upload/edit/123/secret","https://imgbox.com:444/upload/edit/123/secret",
                "https://name:pass@imgbox.com/upload/edit/123/secret","https://imgbox.com/upload/edit/123/secret?redirect=https://evil.test",
                "https://imgbox.com/upload/edit/123/secret#fragment","https://imgbox.com/upload/edit/../secret",
                "https://imgbox.com/upload/edit/123/%2e%2e","https://imgbox.com/upload/edit/123/secret/delete",""})
            check(!MediaUploadManagementPolicy.valid("imgbox",link,bad),"untrusted page rejected");
        check(!MediaUploadManagementPolicy.valid("imgbox",pile,page),"provider/media mismatch");
        check(!MediaUploadManagementPolicy.valid("imgpile",pile,page),"provider/admin mismatch");
        check(MediaUploadManagementPolicy.imgbox("123","../secret").isEmpty(),"secret path injection");
        check(MediaUploadManagementPolicy.imgpile("a/b").isEmpty(),"slug path injection");
        check(MediaUploadManagementPolicy.imgpile(null).isEmpty(),"null slug");
        check(MediaUploadManagementPolicy.imgur("https://i.imgur.com/Fixture.png"),"Imgur direct image");
        check(MediaUploadManagementPolicy.imgur("http://i.imgur.com/Fixture.png"),"legacy HTTP Imgur link");
        for(String bad:new String[]{"file:///x","https://i.imgur.com:444/x","https://x@i.imgur.com/a",""})
            check(!MediaUploadManagementPolicy.imgur(bad),"invalid history URLs rejected");
        check(MediaUploadManagementPolicy.valid("imgbox",link,"https://new.example.org/upload/edit/123/secret"),"management host unrestricted");
        check(MediaUploadManagementPolicy.imgur("https://new.example.org/Fixture.png"),"history host unrestricted");
        JSONObject result=new JSONObject().put("haiagaruProvider","imgbox").put("link",link).put("haiagaruManagementUrl",page);
        JSONObject record=MediaUploadManagementPolicy.record(result,123);
        check(record.getString("management").equals(page)&&record.getLong("time")==123,"private management record");
        check(MediaUploadManagementPolicy.record(new JSONObject().put("link",link),123)==null,"missing metadata never guessed");
        result.put("haiagaruManagementUrl","https://evil.test/delete");
        check(MediaUploadManagementPolicy.record(result,123)==null,"tampered metadata discarded");
        System.out.println("PASS "+checks+" management URL / foreign-deletion isolation checks (no network)");
    }
}
