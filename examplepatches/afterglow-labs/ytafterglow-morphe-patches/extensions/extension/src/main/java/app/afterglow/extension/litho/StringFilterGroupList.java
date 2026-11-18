package app.afterglow.extension.litho;

/** {@link StringFilterGroup}s searched together, such as the buttons of a bar by accessibility id. */
public final class StringFilterGroupList extends FilterGroupList<CharSequence, StringFilterGroup> {
    public StringFilterGroupList() {
        super(new TrieSearch.Text());
    }
}
