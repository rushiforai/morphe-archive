package app.morphe.extension.syncforreddit.redirects;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.text.InputType;
import android.util.TypedValue;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;

/**
 * Asking for a client certificate, wherever one is wanted.
 *
 * <p>Two things want one — a proxy that asks for mTLS, and a Rimgo instance somebody has put
 * behind it — and they want exactly the same thing, so it is asked for in one place. Both the
 * route's own screen and an alert on the front page of the settings open this, which is what
 * lets an alert take the reader to the thing that needs doing rather than to the screen near it.
 *
 * <p><b>What it is kept in never travels in a backup.</b> A certificate and its password are
 * private settings of ours, in a file Sync has never heard of; Sync's Backup walks its own
 * settings and cannot write them out. What does travel is a mark saying that one was attached —
 * no more than that — which is the whole reason a restored copy can say that something is
 * missing rather than quietly behaving as though it had never been set up.
 */
public final class CertificateDialog {
    /** How far a typed field is held off the edges of its dialog, before the screen's density. */
    private static final int AN_EDGE = 20;

    /** How tall a field for more than one line is. Never taller: see {@code heldToAFewLines}. */
    private static final int MANY_LINES = 4;

    /** Where one certificate is kept, and what it is for. */
    public interface Holder {
        /** @return What it is for, in a few words: a host, or the proxy. */
        String name();

        /** @return The line that says who it would be given to. */
        String whoItGoesTo();

        /** @return Whether the certificate itself is here. */
        boolean isSet();

        /** @return Whether one was attached at some point, which a backup carries. */
        boolean wasSet();

        void set(String pasted, String password);

        /** Takes the certificate away, and the mark saying there was one. */
        void clear();
    }

    private CertificateDialog() {}

    /** @return Where a Rimgo instance's own certificate is kept. */
    public static Holder forInstance(String instance) {
        return new Holder() {
            @Override
            public String name() {
                return hostOf(instance);
            }

            @Override
            public String whoItGoesTo() {
                return "Offered to " + hostOf(instance) + " and to no other instance.";
            }

            @Override
            public boolean isSet() {
                return RedirectSettings.hasCertificate(instance);
            }

            @Override
            public boolean wasSet() {
                return RedirectSettings.wasCertified(instance);
            }

            @Override
            public void set(String pasted, String password) {
                RedirectSettings.setCertificateFor(instance, pasted, password);
            }

            @Override
            public void clear() {
                RedirectSettings.clearCertificateFor(instance);
            }
        };
    }

    /** @return Where the proxy's certificate is kept. */
    public static Holder forTheProxy() {
        return new Holder() {
            @Override
            public String name() {
                return "the proxy";
            }

            @Override
            public String whoItGoesTo() {
                return "Offered to the proxy that is set, and to nothing else.";
            }

            @Override
            public boolean isSet() {
                return RedirectSettings.isSet(RedirectSettings.PROXY_CERTIFICATE);
            }

            @Override
            public boolean wasSet() {
                return RedirectSettings.proxyWasCertified();
            }

            @Override
            public void set(String pasted, String password) {
                RedirectSettings.setTheProxyCertificate(pasted, password);
            }

            @Override
            public void clear() {
                RedirectSettings.clearTheProxyCertificate();
            }
        };
    }

    /**
     * Puts the dialog up.
     *
     * @param afterwards What to run once something has changed, for whatever is showing the
     *                   state of it. May be null.
     */
    public static void ask(Context context, Holder holder, @Nullable Runnable afterwards) {
        try {
            int edge = Math.round(AN_EDGE * context.getResources().getDisplayMetrics().density);

            LinearLayout box = new LinearLayout(context);
            box.setOrientation(LinearLayout.VERTICAL);
            box.setPadding(edge, edge / 2, edge, 0);

            TextView why = small(context, holder.whoItGoesTo());
            TextView note = small(context, holder.wasSet() && !holder.isSet()
                    ? "This had a certificate, which a backup does not carry. Choose the file "
                            + "again, or paste it in."
                    : "Choose a file, or paste it in.");

            EditText pasted = new EditText(context);
            pasted.setHint("A PKCS#12 as base64, or the PEM blocks");
            pasted.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            // A certificate read out of a file is four thousand characters, and a field with no
            // maximum grows to all of them: it then fills the dialog, a swipe over it scrolls
            // the field rather than the dialog, and the password below becomes unreachable.
            pasted.setMinLines(MANY_LINES);
            pasted.setMaxLines(MANY_LINES);
            pasted.setVerticalScrollBarEnabled(true);

            EditText password = new EditText(context);
            password.setHint("Certificate password, if it has one");
            password.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_VARIATION_PASSWORD);
            password.setSingleLine(true);

            box.addView(why);
            box.addView(note);
            box.addView(chooseAFile(context, pasted, note));
            box.addView(pasted);
            box.addView(password);

            ScrollView scrolling = new ScrollView(context);
            scrolling.addView(box);

            AlertDialog.Builder asking = new AlertDialog.Builder(context)
                    .setTitle("Client certificate")
                    .setView(scrolling)
                    .setPositiveButton("Save", (dialog, which) -> {
                        String said = pasted.getText().toString().trim();
                        if (said.isEmpty()) {
                            return;
                        }
                        holder.set(said, password.getText().toString());
                        if (afterwards != null) {
                            afterwards.run();
                        }
                    })
                    .setNegativeButton("Cancel", null);

            // Clearing takes the mark away as well, which is what stops a restored copy going
            // on asking for a certificate the reader has decided not to use any more.
            if (holder.isSet() || holder.wasSet()) {
                asking.setNeutralButton(holder.isSet() ? "Clear" : "Forget", (dialog, which) -> {
                    holder.clear();
                    if (afterwards != null) {
                        afterwards.run();
                    }
                });
            }
            asking.show();
        } catch (Exception ex) {
            Logger.printInfo(() -> "certificate: could not ask for one: " + ex);
        }
    }

    /** A button that reads a certificate out of a file the reader chooses. */
    private static Button chooseAFile(Context context, EditText into, TextView note) {
        Button choosing = new Button(context);
        choosing.setText("Choose a file…");
        choosing.setOnClickListener(tapped -> {
            boolean opened = PickAFile.ask(context, (name, contents) -> {
                into.setText(contents);
                into.setSelection(0);
                note.setText("Read from " + name + ". Save to attach it.");
            });
            if (!opened) {
                note.setText("Nothing on this device could be asked for a file; paste it in.");
            }
        });
        return choosing;
    }

    private static TextView small(Context context, String said) {
        TextView line = new TextView(context);
        line.setText(said);
        line.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        line.setTextColor(Color.GRAY);
        return line;
    }

    static String hostOf(String instance) {
        int scheme = instance.indexOf("://");
        return scheme < 0 ? instance : instance.substring(scheme + 3);
    }
}
