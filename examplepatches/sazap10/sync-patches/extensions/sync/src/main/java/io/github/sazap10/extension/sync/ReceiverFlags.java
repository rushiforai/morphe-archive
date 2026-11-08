package io.github.sazap10.extension.sync;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Handler;

/**
 * Replacements for {@link Context#registerReceiver} call sites.
 * <p>
 * Apps targeting API 34 must pass {@link Context#RECEIVER_EXPORTED} or
 * {@link Context#RECEIVER_NOT_EXPORTED} when registering a receiver at runtime, otherwise the
 * call throws {@link SecurityException}. The patch rewrites every call site in Sync to one of
 * these methods. Below API 33 the flags have no meaning, so the original overload is used.
 */
@SuppressWarnings("unused")
public final class ReceiverFlags {
    // Context.RECEIVER_EXPORTED and Context.RECEIVER_NOT_EXPORTED (API 33).
    private static final int EXPORTED = 0x2;
    private static final int NOT_EXPORTED = 0x4;

    private ReceiverFlags() {
    }

    private static int withVisibility(int flags, int visibility) {
        return (flags & (EXPORTED | NOT_EXPORTED)) == 0 ? flags | visibility : flags;
    }

    private static Intent register(Context context, BroadcastReceiver receiver, IntentFilter filter,
                                   int visibility) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            return context.registerReceiver(receiver, filter, visibility);
        }
        return context.registerReceiver(receiver, filter);
    }

    private static Intent register(Context context, BroadcastReceiver receiver, IntentFilter filter,
                                   int flags, int visibility) {
        // The original call already passed flags, so it only runs on API 26 or higher.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            flags = withVisibility(flags, visibility);
        }
        return context.registerReceiver(receiver, filter, flags);
    }

    private static Intent register(Context context, BroadcastReceiver receiver, IntentFilter filter,
                                   String permission, Handler scheduler, int visibility) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            return context.registerReceiver(receiver, filter, permission, scheduler, visibility);
        }
        return context.registerReceiver(receiver, filter, permission, scheduler);
    }

    private static Intent register(Context context, BroadcastReceiver receiver, IntentFilter filter,
                                   String permission, Handler scheduler, int flags, int visibility) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            flags = withVisibility(flags, visibility);
        }
        return context.registerReceiver(receiver, filter, permission, scheduler, flags);
    }

    // region Receivers that only get broadcasts from Sync itself or the system.

    public static Intent registerNotExported(Context context, BroadcastReceiver receiver,
                                             IntentFilter filter) {
        return register(context, receiver, filter, NOT_EXPORTED);
    }

    public static Intent registerNotExported(Context context, BroadcastReceiver receiver,
                                             IntentFilter filter, int flags) {
        return register(context, receiver, filter, flags, NOT_EXPORTED);
    }

    public static Intent registerNotExported(Context context, BroadcastReceiver receiver,
                                             IntentFilter filter, String permission,
                                             Handler scheduler) {
        return register(context, receiver, filter, permission, scheduler, NOT_EXPORTED);
    }

    public static Intent registerNotExported(Context context, BroadcastReceiver receiver,
                                             IntentFilter filter, String permission,
                                             Handler scheduler, int flags) {
        return register(context, receiver, filter, permission, scheduler, flags, NOT_EXPORTED);
    }

    // endregion

    // region Receivers that get broadcasts from other apps (Play Store, download manager).

    public static Intent registerExported(Context context, BroadcastReceiver receiver,
                                          IntentFilter filter) {
        return register(context, receiver, filter, EXPORTED);
    }

    public static Intent registerExported(Context context, BroadcastReceiver receiver,
                                          IntentFilter filter, int flags) {
        return register(context, receiver, filter, flags, EXPORTED);
    }

    public static Intent registerExported(Context context, BroadcastReceiver receiver,
                                          IntentFilter filter, String permission,
                                          Handler scheduler) {
        return register(context, receiver, filter, permission, scheduler, EXPORTED);
    }

    public static Intent registerExported(Context context, BroadcastReceiver receiver,
                                          IntentFilter filter, String permission,
                                          Handler scheduler, int flags) {
        return register(context, receiver, filter, permission, scheduler, flags, EXPORTED);
    }

    // endregion
}
