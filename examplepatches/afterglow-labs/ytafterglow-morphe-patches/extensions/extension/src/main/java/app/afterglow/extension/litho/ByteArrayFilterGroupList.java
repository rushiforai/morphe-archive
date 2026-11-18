package app.afterglow.extension.litho;

/** {@link ByteArrayFilterGroup}s searched together over one proto buffer. */
public final class ByteArrayFilterGroupList extends FilterGroupList<byte[], ByteArrayFilterGroup> {
    public ByteArrayFilterGroupList() {
        super(new TrieSearch.Bytes());
    }

    /**
     * The first group that is on and has a pattern in the component's proto
     * buffer, or null. The buffer is not encoded when every group is off.
     */
    public ByteArrayFilterGroup find(LithoComponent component) {
        for (ByteArrayFilterGroup group : this) {
            if (group.isEnabled()) return find(component.buffer());
        }
        return null;
    }

    /** True if a group that is on has a pattern in the component's proto buffer. */
    public boolean matches(LithoComponent component) {
        return find(component) != null;
    }
}
