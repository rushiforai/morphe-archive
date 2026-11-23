package nl.johninnl.eclipse.app;

import android.content.Context;

/**
 * Stand-in for the merged media library session implementation. The classic browse tree is hooked
 * into its children method, and the queue node's children-changed is delivered through it.
 */
public class j16 {
    /** The app's car callback class (media ids, item builders, search). */
    public final cm7 e = null;

    /** The application context (the playback service). */
    public final Context f = null;

    /** The Media3 controller registry; its {@code e} lists the connected controllers. */
    public final d66 g = null;

    /** Deliver {@code task} to one controller, with the sequence number the controller expects. */
    public final void f(o36 controller, m46 task) { }

    /** The legacy library service (null before it is created); its {@code A} lists the legacy browsers. */
    public final c16 h() { return null; }
}
