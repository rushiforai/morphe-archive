package dev.rikunode.futatabi.bridge;

import org.json.JSONObject;

/** Synthetic display and quote data only; run on Android runtime, no network. */
public final class PostPresentationTest {
    private static void check(boolean ok, String label) {
        if (!ok) throw new AssertionError(label);
    }
    public static void main(String[] args) throws Exception {
        String thread = "01900000-0000-7000-8000-000000000111";
        String post = "01900000-0000-7000-8000-000000000112";
        JSONObject result = new JSONObject().put("threadId",thread).put("postId",post).put("seq",6).put("status","public");
        check(PostPresentation.completion("aimoge",result.toString(),thread).contains("6"),"public reply");
        result.put("status","shadowed");
        check(PostPresentation.completion("aimoge",result.toString(),thread)==null,"not publicly confirmed");
        result.put("status","public");
        try { PostPresentation.completion("aimoge",result.toString(),post); throw new AssertionError("mismatch accepted"); }
        catch (IllegalArgumentException expected) {}
        try { PostPresentation.completion("aimoge","{}",thread); throw new AssertionError("malformed accepted"); }
        catch (org.json.JSONException expected) {}
        check(PostPresentation.quote("aimoge","123456789","fixture").equals(">No.123456789\nfixture"),"aimoge number");
        check(PostPresentation.quote("animanch","5","fixture").equals(">>5\nfixture"),"animanch number");
        check(PostPresentation.quote("animanch","","fixture").equals("fixture"),"whole thread");
        check(PostPresentation.quote("aimoge","123456789",">No.123456789\nfixture").equals(">No.123456789\nfixture"),"no duplicate quote");
        String html = "minutes.</p><p>Wait &amp; retry &#33;</p>";
        String text = PostPresentation.error(html);
        check(!text.contains("</p>") && !text.contains("&amp;") && text.contains("Wait & retry !"),"HTML plain text");
        String nested = new JSONObject().put("error",new JSONObject().put("message","<b>Wait</b> &amp; retry")).toString();
        check(PostPresentation.error(nested).equals("Wait & retry"),"JSON message only");
        String partial = new JSONObject().put("postAccepted",true).put("error","<p>upload failed</p>").toString();
        check(PostPresentation.error(partial).contains("upload failed") && !PostPresentation.error(partial).contains("<p>"),"partial upload error");
        System.out.println("PASS 11 presentation / reply cases (synthetic Android runtime; no POST)");
    }
}
