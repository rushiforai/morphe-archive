package app.tikkamasalla.stremio.oneahead.demux;

/** Positional reads of a remote file. One call is at most one body fetched over the network. */
public interface RangeSource {
    /** Reads up to len bytes at pos. Returns the count read; 0 means the file ends at or before pos. */
    int read(long pos, byte[] dst, int off, int len) throws DemuxException;

    /** Total file size, or -1 until the first read has told us. */
    long length();

    /** Body bytes received so far. */
    long bytesFetched();

    /** HTTP requests issued so far, redirect hops included. */
    int requests();
}
