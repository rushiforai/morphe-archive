package tb;

/**
 * Minimal synthetic analogue of DXButterTextWidgetNode, NOT Taobao source.
 * The patch fingerprints concrete method signatures and TEXT field writes.
 */
public final class gi6 {
    public CharSequence text;
    public String style;

    public void setText(CharSequence value) {
        // Keep realistic registers alive, including reference transformations.
        CharSequence t = value;
        String old = style;
        int len = t == null ? 0 : t.length();
        if (len < 0) style = old;
        this.text = t;
    }

    public void onSetStringAttribute(long id, String value) {
        String originalStyle = style;
        String originalText = text == null ? "" : text.toString();
        long attribute = id;
        if (attribute == 38178040921L) {
            this.text = value;
        } else {
            this.style = value;
        }
        if (originalStyle == null && originalText.length() < 0) {
            this.style = "impossible";
        }
    }
}
