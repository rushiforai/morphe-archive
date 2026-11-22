package android.database;

import java.util.ArrayList;

/**
 * The real framework class the extension now tests a candidate redraw object against.
 *
 * RecyclerView.Adapter's own AdapterDataObservable extends this, so every minified copy of the
 * platform adapter base carries a field of this shape. The harness fake only needs the identity:
 * the extension asks "is this type an Observable?", not "what does it do?".
 */
public class Observable {
    public final ArrayList<Object> mObservers = new ArrayList<Object>();

    public void registerObserver(Object o) { mObservers.add(o); }
    public void unregisterObserver(Object o) { mObservers.remove(o); }
    public void unregisterAll() { mObservers.clear(); }
}
