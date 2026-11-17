package app.hushmessenger.extension;

import android.app.Application;
import android.content.Context;

/**
 * Names Messenger builds from its own package, kept right for a copy that runs under another one. Clone install picks
 * the new name while patching and writes it straight into the code, so these stand in for a rename by any other patch,
 * where the name isn't known until the copy runs.
 */
public final class CloneCompat {
    /** The package Messenger ships under, which every name below is built from. */
    static final String MESSENGER = "com.facebook.orca";
    private static final String DEDUP = ".ClientMessagePushDedupInfoProvider";
    private static final String RUNNING = running();
    /** The provider Messenger hands attachments through, named after whichever copy is running. */
    public static final String ATTACHMENTS = own(MESSENGER + ".tam-attachment");
    /** The provider a copy keeps its muted chats and friendships in. Writing to another copy's is refused by Android. */
    public static final String PUSH_DEDUP = own(MESSENGER + DEDUP);
    public static final String MUTED_CHATS = own("content://" + MESSENGER + DEDUP + "/mutestatus");
    public static final String FRIENDSHIPS = own("content://" + MESSENGER + DEDUP + "/userfriendship");

    private CloneCompat() {}

    /** [name] with Messenger's own package swapped for the one this copy runs under. */
    static String own(String name) {
        return swap(name, RUNNING);
    }

    static String swap(String name, String running) {
        try {
            return running.equals(MESSENGER) ? name : name.replace(MESSENGER, running);
        } catch (Throwable error) {
            return name;
        }
    }

    private static String running() {
        try {
            return packageOf(Settings.appContext, Application.getProcessName());
        } catch (Throwable error) {
            return MESSENGER;
        }
    }

    /**
     * The package this copy runs under. Messenger builds its providers before its Application, so there's no context
     * yet for the earliest of these names: the process name stands in, which is the package itself in the main process
     * and the package plus a colon and a name in the others.
     */
    static String packageOf(Context app, String process) {
        if (app != null) return app.getPackageName();
        if (process == null || process.isEmpty()) return MESSENGER;
        int colon = process.indexOf(':');
        return colon < 0 ? process : process.substring(0, colon);
    }
}
