package dev.jason.gboardpatches.extension.editingaccesspoints;

/** Android editor semantics; independent of keyboard language and Gboard transport codes. */
public enum EditorAction {
    SELECT_ALL("text_edit_select_all", android.R.id.selectAll),
    COPY("text_edit_copy", android.R.id.copy),
    CUT("text_edit_cut", android.R.id.cut),
    PASTE("text_edit_paste", android.R.id.paste);

    public final String token;
    public final int contextMenuId;

    EditorAction(String token, int contextMenuId) {
        this.token = token;
        this.contextMenuId = contextMenuId;
    }
}
