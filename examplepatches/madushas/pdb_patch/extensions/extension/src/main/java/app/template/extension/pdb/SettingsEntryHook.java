package app.template.extension.pdb;

import app.template.extension.BuildConfig;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.TextView;

/**
 * Wires the "Pdb Extras" section injected into the top of Pdb's Settings screen.
 *
 * <p>The section is a label + card with two native {@code ActionCell} rows in
 * {@code res/layout/fragment_app_setting.xml}:
 * <ul>
 *   <li>{@code morphe_extras_entry} — opens the full-screen {@link PdbExtrasActivity}.</li>
 *   (removed: {@code morphe_dev_entry} — the native dev screen, not useful
 *       ({@code pdb.app.tweak.TweaksActivity}, normally behind a 4-tap gesture).</li>
 * </ul>
 *
 * <p>The patch calls {@link #wire} from the settings fragment's
 * {@code onViewCreated(View, Bundle)} (matched by signature, so obfuscated method and
 * class names do not matter). Everything is guarded: a missing row or id is a no-op.
 */
public final class SettingsEntryHook {

    public static final String ENTRY_ID = "morphe_extras_entry";
    
    private SettingsEntryHook() {}

    /** Called from the settings fragment's {@code onViewCreated(View, Bundle)}. */
    public static void wire(View root) {
        try {
            if (root == null) return;
            Context ctx = root.getContext();
            if (ctx == null) return;

            wireExtras(root, ctx);
        } catch (Throwable ignored) {
        }
    }

    private static void wireExtras(View root, Context ctx) {
        View entry = find(root, ctx, ENTRY_ID);
        if (entry == null) return;
        setRowText(entry, "Pdb Extras \u2014 settings & unlocks  \u00b7  v"
            + BuildConfig.EXTRAS_VERSION);
        entry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                open(v, PdbExtrasActivity.class.getName());
            }
        });
    }

    private static void setRowText(View row, CharSequence text) {
        try {
            row.getClass().getMethod("setActionText", CharSequence.class).invoke(row, text);
            return;
        } catch (Throwable ignored) {
        }
        try {
            row.getClass().getMethod("l", String.class, boolean.class)
                .invoke(row, text.toString(), false);
            return;
        } catch (Throwable ignored) {
        }
        if (row instanceof TextView) ((TextView) row).setText(text);
    }

    private static View find(View root, Context ctx, String idName) {
        try {
            int id = ctx.getResources().getIdentifier(idName, "id", ctx.getPackageName());
            if (id == 0) return null;
            return root.findViewById(id);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void open(View v, String className) {
        try {
            Context c = v.getContext();
            Intent intent = new Intent();
            intent.setClassName(c.getPackageName(), className);
            c.startActivity(intent);
        } catch (Throwable ignored) {
        }
    }
}
