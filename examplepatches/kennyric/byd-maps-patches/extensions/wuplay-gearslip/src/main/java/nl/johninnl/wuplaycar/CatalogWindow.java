package nl.johninnl.wuplaycar;
import java.util.*;
/** Keep car-sized windows separate from the native add-on batch cursor. */
public final class CatalogWindow<T> {
    private static final int SIZE=30;
    private final List<T> batch;private final int start,nextRemote;
    public CatalogWindow(List<T> batch,int nextRemote){this(Collections.unmodifiableList(new ArrayList<>(batch)),0,nextRemote);}
    private CatalogWindow(List<T> batch,int start,int nextRemote){this.batch=batch;this.start=start;this.nextRemote=nextRemote;}
    public List<T> items(){return batch.subList(start,Math.min(start+SIZE,batch.size()));}
    public CatalogWindow<T> nextLocal(){return start+SIZE<batch.size()?new CatalogWindow<>(batch,start+SIZE,nextRemote):null;}
    public int remoteCursor(){return start+SIZE>=batch.size()?nextRemote:-1;}
}
