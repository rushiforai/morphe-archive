package app.afterglow.extension.menus;

import java.util.List;

public final class LongPressCapturePolicyTest {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static String path(String hash){return "root|comment.e|"+hash+"|"+"ContainerType|".repeat(7)+"TextType|";}
    public static void main(String[] args){
        Object token=new Object();LongPressCapturePolicy model=new LongPressCapturePolicy(token);
        String text="A complete native comment with its original line breaks\nand details.";
        model.observe(token,"comment_thread.e",path("one"),text);
        check(model.match(List.of("Author",text,"Reply")).text.equals(text),"One actual comment preserves original text");
        check(model.match(List.of("Author","Something else","Reply"))==null,"No current text match fails open");
        check(model.match(List.of("A complete native comment with its original line breaks and details.")).text.equals(text),"Mounted whitespace can differ without changing copied content");
        check(model.match(List.of("A complete native comment with its original line breaks… Read more"))!=null,"Explicit native truncation with separated label");
        check(model.match(List.of("A complete native comment with its original line breaks belongs to B"))==null,"A shared introduction cannot recover stale comment A");
        check(model.match(List.of("A complete native comment with its original line breaks…replacement"))==null,"No arbitrary continuation after ellipsis");
        check(model.match(List.of("A complete native comment with its original line breaks"))==null,"No identity from unmarked fade-only text");
        model.observe(token,"comment_thread.e",path("two"),"A second comment");
        check(model.match(List.of(text,"A second comment"))==null,"A multi-comment root cannot be captured as one comment");
        check(model.match(List.of(text))==null,"Offscreen second entity still makes a root ineligible");
        Object next=new Object();LongPressCapturePolicy recycled=new LongPressCapturePolicy(next);
        recycled.observe(token,"comment_thread.e",path("one"),text);
        check(recycled.match(List.of(text))==null,"Delayed text from the old binding cannot populate a rebound root");
        recycled.observe(next,"comment_thread.e",path("new"),"The new comment");
        check(recycled.match(List.of("The new comment")).text.equals("The new comment"),"Rebound root recognizes its own current entity");
        check(recycled.match(List.of(text))==null,"Rebound root never recovers old entity text");
        recycled.observe(token,"comment_thread.e",path("one"),text);
        check(recycled.match(List.of("The new comment"))!=null,"Late old callback does not invalidate the current entity");
        recycled.observe(next,"video_metadata.e","root|TextType|","The new comment");
        check(recycled.match(List.of("The new comment"))==null,"Mixed semantic element roots are rejected even for equal text");
        LongPressCapturePolicy duplicate=new LongPressCapturePolicy(token);
        duplicate.observe(token,"comment_thread.e",path("one"),"Same words");duplicate.observe(token,"comment_thread.e",path("two"),"Same words");
        check(duplicate.match(List.of("Same words"))==null,"Identical words do not merge distinct native comments");
        check(LongPressCapturePolicy.commentIdentity(path("one")).endsWith("|comment.e|one|"),"Semantic branch retains template hash without treating it as an entity ID");
        check(LongPressCapturePolicy.commentIdentity("root|comment.e|one|ContainerType|TextType|").isEmpty(),"Author/date depth is excluded");
        check(LongPressCapturePolicy.commentIdentity("root|video_metadata.e|one|"+"ContainerType|".repeat(7)+"TextType|").isEmpty(),"Non-comment native text is excluded");
        check(LongPressCapturePolicy.commentIdentity("root|comment.e||"+"ContainerType|".repeat(7)+"TextType|").isEmpty(),"Missing native identity rejected");
        check(LongPressCapturePolicy.matches("こんにちは 世界","こんにちは\n世界"),"Non-Latin text retains identity");
        check(!LongPressCapturePolicy.matches("短い…","短いコメントです"),"Short truncated text cannot identify a comment");
        LongPressCapturePolicy sameTemplate=new LongPressCapturePolicy(token);
        sameTemplate.observe(token,"comment_thread.eml-js-fe|d982a5431929e34e",path("e4f80cdd23f3b973"),"He scrolls insta everyday");
        sameTemplate.observe(token,"comment_thread.eml-js-fe|d982a5431929e34e",path("e4f80cdd23f3b973"),"friendly fire");
        check(sameTemplate.match(List.of("friendly fire"))==null,"Recorded124 distinct comments sharing one template path cannot collapse into one entity");
        LongPressCapturePolicy metadata=new LongPressCapturePolicy(token);
        String nativePath="CellType|comment_thread.eml-js-fe|d982a5431929e34e|ContainerType|comment.eml-js-fe|e4f80cdd23f3b973|";
        metadata.observe(token,"comment_thread.eml-js-fe|d982a5431929e34e",nativePath+"ContainerType|".repeat(8)+"TextType|","He scrolls insta everyday");
        metadata.observe(token,"like-count",nativePath+"ContainerType|".repeat(6)+"engagement_toolbar.eml-js-fe|304936a9e60c532b|ContainerType|ContainerType|ContainerType|TextType|","5.3K");
        check(metadata.match(List.of("@author","He scrolls insta everyday","5.3K"))!=null,"Recorded124 engagement identifier remains legitimate comment metadata");
        check(metadata.match(List.of("He scrolls insta everyday","He scrolls insta everyday"))==null,"Two mounted occurrences with identical words are ambiguous");
        LongPressCapturePolicy.Entry previous=metadata.match(List.of("He scrolls insta everyday"));
        metadata.observe(token,"comment_thread.eml-js-fe|d982a5431929e34e",nativePath+"ContainerType|".repeat(8)+"TextType|","He scrolls insta everyday");
        check(metadata.match(List.of("He scrolls insta everyday"))==previous,"Identical native relayout preserves pending body identity");
        String postRoot="images_post_root_slim.eml-fe|46f80e605e6300a9|CellType|images_post_slim.eml-fe|ffb55ce8b2f575b8|ContainerType|ContainerType|";
        String postBody=postRoot+"ContainerType|post_text.eml-fe|946bdce24a350fb4|ContainerType|ExpandableTextType|";
        check(LongPressCapturePolicy.postBody(postBody),"Recorded124 post body path recognized");
        check(!LongPressCapturePolicy.postBody(postRoot+"post_header.eml-fe|61be758a1d3dbcfb|TextType|"),"Post header cannot become copied body");
        check(!LongPressCapturePolicy.postBody("post_shelf_slim.eml-fe|46f80e605e6300a9|"+postBody),"A shelf containing posts cannot become one captured post");
        LongPressCapturePolicy post=new LongPressCapturePolicy(token);
        post.observe(token,"images_post_root_slim.eml-fe|46f80e605e6300a9",postBody,"Your Month Your Character");
        check(post.match(List.of("Your Month Your Character"))==null,"Generic post text callback alone is not a proven body input");
        post.observePost(token,postBody,"Your Month Your Character");
        post.observe(token,"images_post_root_slim.eml-fe|46f80e605e6300a9",postBody,"...Read more");
        check(post.match(List.of("GOJO_EDITZ","Your Month Your Character","...Read more")).isPost,"Only marked native body supplies copied post text; read-more label stays separate");
        check(post.match(List.of("Your Month Your Character","Your Month Your Character"))==null,"Repeated matching post bodies are ambiguous");
        post.observePost(token,postBody,"Just some mirror selfies :)");
        check(post.match(List.of("Just some mirror selfies :)"))==null,"Distinct posts sharing template hashes cannot overwrite a binding");
        System.out.println(checks+" native comment ownership checks passed");
    }
}
