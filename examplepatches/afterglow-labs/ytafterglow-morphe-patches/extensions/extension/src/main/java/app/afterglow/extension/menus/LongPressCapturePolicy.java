/* Copyright 2026 Morphe. Comment path recognition follows the original Copy text
 * implementation (PR 3592); see NOTICE. This Afterglow adaptation adds single-root
 * ownership and conservative mounted-text validation for image capture actions.
 * Portions provided "AS IS" by the Morphe software project, without express or
 * implied warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.menus;

import java.util.List;
import java.util.regex.Pattern;

/** A native element root must identify exactly one currently displayed comment. */
public final class LongPressCapturePolicy {
    private static final Pattern COMMENT_BODY = Pattern.compile("^(ContainerType\\|){7,}TextType\\|$");
    private static final Pattern POST_ROOT = Pattern.compile("^(?:CellType\\|)?(?:images|text|options|poll|videos)_post_(?:responsive_root|root(?:_slim)?)\\.eml(?:-[a-z]+)*\\|[0-9a-f]{16}\\|");
    private static final Pattern POST_BODY = Pattern.compile("\\|post_text\\.eml(?:-[a-z]+)*\\|[0-9a-f]{16}\\|ContainerType\\|ExpandableTextType\\|$");
    private final Object bindingToken;
    private Entry comment,post;
    private boolean ambiguousComment,ambiguousPost,sawComment,sawPost,sawOther;

    public LongPressCapturePolicy(Object bindingToken) {
        if(bindingToken==null)throw new IllegalArgumentException("Missing native binding token");
        this.bindingToken=bindingToken;
    }
    synchronized boolean bindingMatches(Object token){return token==bindingToken;}
    synchronized int diagnosticState(){return(comment!=null?1:0)|(post!=null?2:0)|(ambiguousComment?4:0)
            |(ambiguousPost?8:0)|(sawOther?16:0)|(sawComment&&sawPost?32:0);}

    public static final class Entry {
        public final String identity, text;
        public final boolean isPost;
        private Entry(String identity, String text,boolean isPost) { this.identity=identity;this.text=text;this.isPost=isPost; }
    }

    public static String commentIdentity(String path) {
        if(path==null)return "";
        int start=path.lastIndexOf("|comment.e");if(start<0)return "";
        int nameEnd=path.indexOf('|',start+1),hashEnd=nameEnd<0?-1:path.indexOf('|',nameEnd+1);
        return hashEnd>nameEnd+1&&COMMENT_BODY.matcher(path.substring(hashEnd+1)).matches()
                ?path.substring(0,hashEnd+1):"";
    }

    /** Delayed text from a previous binding cannot repopulate a recycled root. */
    public synchronized void observe(Object token,String identifier,String path,CharSequence value) {
        if(token!=bindingToken)return;
        if(identifier==null||identifier.isEmpty()||value==null)return;
        if(path!=null&&(path.contains("|comment.e")||path.startsWith("comment.e")
                ||path.contains("|comment_thread.e")||path.startsWith("comment_thread.e")))sawComment=true;
        else if(postTree(path))sawPost=true;
        else sawOther=true;
        String identity=commentIdentity(path);
        if(identity.isEmpty())return;
        String text=value.toString().trim();if(text.isEmpty())return;
        // The hash identifies a template, not a comment. Distinct body values in one
        // binding are ambiguous even when the complete path is identical.
        if(comment==null)comment=new Entry(identity,text,false);
        else if(!comment.identity.equals(identity)||!LongPressTextPolicy.normalize(comment.text)
                .equals(LongPressTextPolicy.normalize(text)))ambiguousComment=true;
    }

    public static boolean postTree(String path){return path!=null&&POST_ROOT.matcher(path).find();}
    public static boolean postBody(String path){return postTree(path)&&POST_BODY.matcher(path).find();}

    /** Only a model made by native Lutn.u may supply this value; label models are excluded. */
    public synchronized void observePost(Object token,String path,CharSequence value){
        if(token!=bindingToken||value==null||!postBody(path))return;
        String text=value.toString().trim();if(text.isEmpty())return;
        sawPost=true;
        if(post==null)post=new Entry(path,text,true);
        else if(!post.identity.equals(path)||!LongPressTextPolicy.normalize(post.text)
                .equals(LongPressTextPolicy.normalize(text)))ambiguousPost=true;
    }

    public synchronized Entry match(List<? extends CharSequence> mounted) {
        if(sawOther||sawComment&&sawPost||mounted==null||mounted.isEmpty())return null;
        Entry selected=comment!=null?comment:post;
        if(selected==null||(selected.isPost?ambiguousPost:ambiguousComment))return null;
        int occurrences=0;
        for(CharSequence shown:mounted)if(shown!=null&&matches(shown.toString(),selected.text))occurrences++;
        // Repeated comments can share both their template path and their exact words.
        return occurrences==1?selected:null;
    }

    public static boolean matches(String shown,String original) {
        String current=LongPressTextPolicy.normalize(shown),full=LongPressTextPolicy.normalize(original);
        if(current.isEmpty()||full.isEmpty())return false;
        if(current.equals(full))return true;
        int marker=current.indexOf('\u2026'),dots=current.indexOf("...");
        if(marker<0||dots>=0&&dots<marker)marker=dots;
        if(marker<20||current.length()-marker>40)return false;
        String prefix=current.substring(0,marker).trim();
        int suffix=marker+(current.startsWith("...",marker)?3:1);
        return prefix.length()>=20&&full.startsWith(prefix)&&full.length()>prefix.length()
                &&(suffix==current.length()||Character.isWhitespace(current.charAt(suffix)));
    }
}
