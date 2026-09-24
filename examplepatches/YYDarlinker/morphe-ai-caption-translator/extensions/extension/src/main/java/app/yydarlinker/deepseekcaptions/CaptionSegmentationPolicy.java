package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Same checks for fresh and cached plans. Never allocates timing by translated character length. */
final class CaptionSegmentationPolicy {
    static boolean dependent(String text){String s=text.trim().replaceAll("[，,:：;；]+$","").toLowerCase(Locale.ROOT);
        return Arrays.asList("到底","究竟","意味着","意味著","因为","因為","但是","所以","而且","以及","虽然","雖然","because","although","in order to","which means","so that","but","and then").contains(s);}
    static boolean speakerStart(String s){return s.trim().startsWith(">>");}
    static String issue(AnchoredCaptionPlan.Segment s){
        if(s.text.isEmpty())return "";int length=CaptionPresentationPolicy.visible(s.text);
        // Only request resegmentation of multi-clause overflow; a long indivisible phrase is not split locally.
        boolean clauses=s.text.matches("(?s).+[。！？!?，,；;].+");
        if(clauses && (s.endMs-s.startMs>7000 || length>(CaptionPresentationPolicy.cjk(s.text)?42:100)))return "resegment_at_complete_clause;not_by_character_ratio";
        if(dependent(s.text))return "attach_dependent_phrase_to_following_clause";
        return "";
    }
}
