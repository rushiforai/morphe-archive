package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import java.util.*;
/** UI-language-independent, bounded target codes. Never touches target intent, Remember or API profiles. */
final class CaptionLanguageSelection {
    static final String STORE="caption_language_menu", KEY="selected_codes";
    static final List<String> CODES=Collections.unmodifiableList(new ArrayList<>(new TreeSet<>(CaptionLanguageProfile.profiles().keySet())));
    static String canonical(String raw) {
        CaptionLanguageProfile p=CaptionLanguageProfile.fromCode(raw);
        return p==CaptionLanguageProfile.GENERIC?"":p.id;
    }
    static Set<String> normalize(Collection<String> values) {
        TreeSet<String> out=new TreeSet<>();
        for(String raw:values) { String code=canonical(raw);if(code.isEmpty())throw new IllegalArgumentException("unsupported_language_code");out.add(code); }
        return Collections.unmodifiableSet(new LinkedHashSet<>(out));
    }
    static Set<String> read(Context c) {
        if(c==null)return Collections.emptySet();
        try{Set<String> raw=c.getSharedPreferences(STORE,Context.MODE_PRIVATE).getStringSet(KEY,Collections.emptySet());return normalize(new HashSet<>(raw));}
        catch(IllegalArgumentException | ClassCastException invalid) { CaptionDiagnostics.mark(c,"LANGUAGE_SELECTION_INVALID","reason=unsupported_stored_code");return Collections.emptySet(); }
    }
    static void save(Context c,Collection<String> values) {
        Set<String> codes=normalize(values);
        c.getSharedPreferences(STORE,Context.MODE_PRIVATE).edit().putStringSet(KEY,new LinkedHashSet<>(codes)).apply();
    }
    static Set<String> menuCodes() {
        TreeSet<String> codes=new TreeSet<>();
        if(CaptionAddonSupport.aiInstalled())codes.addAll(read(CaptionAddonSupport.context()));
        // Backward-compatible standalone root; AI no longer needs that root for this menu seam.
        if(CaptionAddonSupport.simplifiedInstalled())codes.add("zh-Hans");
        return Collections.unmodifiableSet(new LinkedHashSet<>(codes));
    }
}
