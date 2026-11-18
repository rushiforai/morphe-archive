package app.afterglow.extension.litho;

import app.afterglow.extension.Afterglow;

/**
 * The Litho component being filtered, as handed to {@link LithoFilter#isFiltered}.
 *
 * <p>The identifier and path are always there. Everything else is computed on
 * first use: the accessibility string, and the element's protobuf bytes, which
 * YouTube encodes only when a filter asks for them.
 *
 * <p>One instance per Litho thread is reused for every component, so a filter
 * must not keep a reference to it after {@code isFiltered} returns.
 */
public final class LithoComponent {
    private static final byte[] NO_BYTES = new byte[0];
    /** Strings in the buffer shorter than this are noise, not names. */
    private static final int MIN_BUFFER_STRING_LENGTH = 4;
    private static final int MAX_BUFFER_STRINGS_LENGTH = 3000;

    private LithoContext context;
    private Object element;
    private String identifier;
    private StringBuilder path;
    private String accessibilityId;
    private String accessibilityText;
    private String accessibility;
    private byte[] buffer;
    private String bufferStrings;
    private String componentName;

    LithoComponent() {}

    void reset(LithoContext context, Object element, String identifier, StringBuilder path,
               String accessibilityId, String accessibilityText) {
        this.context = context;
        this.element = element;
        this.identifier = identifier;
        this.path = path;
        this.accessibilityId = accessibilityId == null ? "" : accessibilityId;
        this.accessibilityText = accessibilityText == null ? "" : accessibilityText;
        this.accessibility = null;
        this.buffer = null;
        this.bufferStrings = null;
        this.componentName = null;
    }

    /** Drops the references to YouTube's objects once the component is decided. */
    void clear() {
        reset(null, null, null, null, null, null);
    }

    /** Identifier of the element the component belongs to. */
    public String identifier() {
        return identifier;
    }

    /** Path of the component in its element, such as {@code "reel_action_bar.eml|...|button.eml|"}. Read-only. */
    public CharSequence path() {
        return path;
    }

    public boolean pathContains(String text) {
        return StringFilterGroup.indexOf(path, text, 0) >= 0;
    }

    public boolean pathStartsWith(String text) {
        int length = text.length();
        if (path.length() < length) return false;
        for (int i = 0; i < length; i++) {
            if (path.charAt(i) != text.charAt(i)) return false;
        }
        return true;
    }

    /** Index of {@code text} in the path at or after {@code fromIndex}, or -1. */
    public int pathIndexOf(String text, int fromIndex) {
        return StringFilterGroup.indexOf(path, text, fromIndex);
    }

    /**
     * Name of the component itself: the last component name in its path, such as
     * {@code "button.eml"}, skipping the tokens between names. "" if there is none.
     */
    public String componentName() {
        String name = componentName;
        if (name == null) {
            name = "";
            int end = path.length();
            if (end > 0 && path.charAt(end - 1) == '|') end--;
            while (end > 0) {
                int start = end - 1;
                while (start >= 0 && path.charAt(start) != '|') start--;
                int dot = StringFilterGroup.indexOf(path, ".e", start + 1);
                if (dot >= 0 && dot < end) {
                    name = path.subSequence(start + 1, end).toString();
                    break;
                }
                end = start;
            }
            componentName = name;
        }
        return name;
    }

    /** Accessibility id of the component's button, such as {@code "id.reel_comment_button"}, or "". */
    public String accessibilityId() {
        return accessibilityId;
    }

    /** Accessibility text of the component's button, or "". */
    public String accessibilityText() {
        return accessibilityText;
    }

    /** {@code "id|text"}, just the id when there is no text, or "" for components that are not buttons. */
    public String accessibility() {
        String value = accessibility;
        if (value == null) {
            if (!accessibilityText.isEmpty()) {
                value = accessibilityId + '|' + accessibilityText;
            } else {
                value = accessibilityId;
            }
            accessibility = value;
        }
        return value;
    }

    /**
     * The element's protobuf bytes, encoded by YouTube on first use. Empty if
     * the element cannot be encoded. Do not modify the returned array.
     */
    public byte[] buffer() {
        byte[] bytes = buffer;
        if (bytes == null) {
            bytes = NO_BYTES;
            if (element instanceof ElementProto) {
                try {
                    byte[] encoded = ((ElementProto) element).afterglow_encodeProto();
                    if (encoded != null) bytes = encoded;
                } catch (Throwable error) {
                    Afterglow.error("LithoComponent.buffer", error);
                }
            }
            buffer = bytes;
        }
        return bytes;
    }

    /** The printable strings in the buffer, separated by {@code '¦'}; for finding patterns in logs. */
    public String bufferStrings() {
        String strings = bufferStrings;
        if (strings == null) {
            strings = printableStrings(buffer());
            bufferStrings = strings;
        }
        return strings;
    }

    /** See {@link LithoContext#afterglow_getHeightConstraint()}. */
    public Integer heightConstraint() {
        return context.afterglow_getHeightConstraint();
    }

    /** See {@link LithoContext#afterglow_getSwipeProtector()}. */
    public Object swipeProtector() {
        return context.afterglow_getSwipeProtector();
    }

    String describe(boolean withBuffer) {
        String accessibility = accessibility();
        StringBuilder out = new StringBuilder(identifier.length() + path.length() + accessibility.length() + 32);
        out.append("ID: ").append(identifier);
        if (!accessibility.isEmpty()) out.append(" Accessibility: ").append(accessibility);
        out.append(" Path: ").append(path);
        if (withBuffer) out.append(" Buffer: ").append(bufferStrings());
        return out.toString();
    }

    private static String printableStrings(byte[] bytes) {
        StringBuilder out = new StringBuilder();
        int start = 0;
        for (int end = 0; end <= bytes.length && out.length() < MAX_BUFFER_STRINGS_LENGTH; end++) {
            boolean printable = end < bytes.length && bytes[end] >= 0x20 && bytes[end] < 0x7F;
            if (printable) continue;
            if (end - start >= MIN_BUFFER_STRING_LENGTH) {
                if (out.length() > 0) out.append('¦');
                for (int i = start; i < end; i++) out.append((char) bytes[i]);
            }
            start = end + 1;
        }
        return out.toString();
    }
}
