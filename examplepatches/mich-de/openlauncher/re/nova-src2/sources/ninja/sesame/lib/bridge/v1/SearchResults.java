package ninja.sesame.lib.bridge.v1;

import androidx.annotation.Keep;
import java.util.ArrayList;
import java.util.List;

@Keep
/* loaded from: classes5.dex */
public class SearchResults {
    public int iter;
    public String queryTerm;
    public List<SesameShortcut> appResults = new ArrayList();
    public List<SesameShortcut> shortcutResults = new ArrayList();
    public List<SesameShortcut> quickSearchResults = new ArrayList();
    public List<SesameShortcut> suggestions = new ArrayList();
}
