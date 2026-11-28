package app.morphe.extension.sabp.ui;

import android.content.Intent;
import android.net.Uri;
import android.text.InputType;
import android.text.format.DateUtils;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.OtherDevicePosition;
import app.morphe.extension.sabp.SyncthingStatus;

/**
 * Settings → Sync between devices ("Sync between devices" patch). Syncthing pairs the devices and copies the library
 * folder (docs/adr/0002); this page shows what the playing book's folder holds, checks now, and opens Syncthing.
 */
public final class SyncPage extends Page {
    public static final String KEY = "sync";
    /** Syncthing-Fork, then the original (discontinued) app. Listed in the manifest's queries by the patch. */
    public static final String[] SYNCTHING = {"com.github.catfriend1.syncthingandroid", "com.nutomic.syncthingandroid"};

    private TextView status;

    public SyncPage(Host host) {
        super(host, KEY, null, "Sync between devices", true);
        build();
    }

    private void build() {
        body.removeAllViews();
        sectionTitle("This book");
        LinearLayout book = card();
        status = note(book, "Looking in the book's folder…");
        book.addView(linkRow(EppyIcon.SYNC, "Check the other device", "Look for a newer position now, and jump there if there is one", v -> {
            Ui.haptic(v, t);
            host.checkOtherDeviceNow();
        }));
        refreshStatus();

        sectionTitle("Pairing and copying");
        LinearLayout st = card();
        String found = installedSyncthing(c);
        note(st, found == null ? "Syncthing: not installed on this device."
                : "Syncthing: installed (" + (found.equals(SYNCTHING[0]) ? "Syncthing-Fork" : "the original app, no longer updated") + ").");
        note(st, "Syncthing pairs your phone and tablet and copies the library folder between them on your home Wi-Fi. "
                + "eppy then offers the other device's position when you open a book. Set it up once on both devices:\n"
                + "1. Install Syncthing-Fork.\n"
                + "2. In its settings turn off Global discovery, Relaying and NAT traversal (home Wi-Fi only).\n"
                + "3. Add the other device: scan the QR code shown under its device ID.\n"
                + "4. Share your audiobooks folder with it, and add the ignore pattern  *Smart AudioBook Player Statistics\n"
                + "To send a change at once, pause playback: SABP saves the position and Syncthing sends it within seconds.");
        String installed = found;
        if (installed != null) {
            st.addView(linkRow(EppyIcon.OPEN_IN_NEW, "Open Syncthing", "Pair devices, share the folder, see sync status", v -> {
                Intent i = c.getPackageManager().getLaunchIntentForPackage(installed);
                if (i != null) c.startActivity(i);
            }));
        } else {
            st.addView(linkRow(EppyIcon.DOWNLOAD, "Get Syncthing-Fork", "Free and open source, from Google Play or F-Droid", v -> openStore()));
        }
        if (installed != null) pairedWith();
    }

    // ---- what Syncthing is paired with (its REST API on 127.0.0.1, with the user's API key) --------------------

    private void pairedWith() {
        sectionTitle("Paired with");
        LinearLayout box = card();
        if (SyncthingStatus.key(c).isEmpty()) {
            note(box, "To see here which device Syncthing is paired with and whether your books are up to date, give eppy "
                    + "Syncthing's API key. In Syncthing: ⋮ → Web GUI → Actions → Settings → GUI → API Key; copy it and paste it "
                    + "below. eppy only uses it to ask Syncthing on this device (127.0.0.1); it isn't included in settings backups.");
            EditText key = new EditText(c);
            key.setHint("Syncthing API key");
            key.setSingleLine(true);
            key.setTextColor(t.onSurface);
            key.setHintTextColor(t.onSurfaceVariant);
            key.setBackground(Ui.rounded(t.surfaceContainerHigh, Ui.dp(c, 16)));
            key.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), 0);
            key.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
            LinearLayout.LayoutParams kl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 52));
            kl.setMargins(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 4));
            box.addView(key, kl);
            box.addView(linkRow(EppyIcon.LOCK_OPEN, "Connect", "Ask Syncthing which devices it's paired with", v -> {
                String k = key.getText().toString().trim();
                if (k.isEmpty()) {
                    Toast.makeText(c, "Paste the API key first", Toast.LENGTH_SHORT).show();
                    return;
                }
                SyncthingStatus.setKey(c, k);
                build();
            }));
            return;
        }
        TextView msg = note(box, "Asking Syncthing…");
        LinearLayout lines = Ui.column(c);
        box.addView(lines);
        box.addView(linkRow(EppyIcon.REFRESH, "Refresh", null, v -> build()));
        box.addView(linkRow(EppyIcon.LOCK, "Change the API key", "For example after reinstalling Syncthing", v -> {
            SyncthingStatus.setKey(c, "");
            build();
        }));
        String folderUri = host.player().book() != null ? host.player().book().folderUri : null;
        new Thread(() -> {
            SyncthingStatus.Status s = SyncthingStatus.fetch(c);
            msg.post(() -> show(s, folderUri, msg, lines));
        }, "eppy-syncthing").start();
    }

    private void show(SyncthingStatus.Status s, String folderUri, TextView msg, LinearLayout lines) {
        if (s.error != null) {
            msg.setText(s.error);
            return;
        }
        StringBuilder b = new StringBuilder();
        String me = null;
        int paired = 0;
        for (SyncthingStatus.Device d : s.devices) {
            if (d.self) {
                me = d.name;
                continue;
            }
            paired++;
            b.append("• ").append(d.name).append(": ").append(d.connected ? "connected now"
                    : d.lastSeen > 0 ? "last seen " + DateUtils.getRelativeTimeSpanString(d.lastSeen, System.currentTimeMillis(), DateUtils.MINUTE_IN_MILLIS)
                    : "never connected").append('\n');
        }
        msg.setText(paired == 0 ? "This device" + (me != null ? " (" + me + ")" : "") + " isn't paired with any device yet. "
                + "Open Syncthing and add your other device."
                : "This device" + (me != null ? " (" + me + ")" : "") + " is paired with:");
        if (paired > 0) note(lines, b.toString().trim());
        SyncthingStatus.Folder bookFolder = folderUri != null ? SyncthingStatus.folderOf(s, folderUri) : null;
        StringBuilder f = new StringBuilder();
        if (folderUri != null && bookFolder == null) f.append("This book's folder isn't inside any folder Syncthing shares.\n");
        for (SyncthingStatus.Folder x : s.folders) {
            f.append(x == bookFolder ? "This book is in " : "Folder ").append('"').append(x.label).append("\": ")
                    .append(SyncthingStatus.folderState(x));
            if (x.devices.isEmpty()) f.append(" · not shared with any device");
            else {
                f.append(" · shared with ");
                for (int i = 0; i < x.devices.size(); i++) f.append(i > 0 ? ", " : "").append(s.deviceName(x.devices.get(i)));
            }
            f.append('\n');
        }
        if (s.folders.isEmpty()) f.append("Syncthing shares no folders yet. Share your audiobooks folder with the other device.");
        note(lines, f.toString().trim());
    }

    /** The installed Syncthing app's package, or null. */
    public static String installedSyncthing(android.content.Context c) {
        for (String p : SYNCTHING) if (c.getPackageManager().getLaunchIntentForPackage(p) != null) return p;
        return null;
    }

    private void openStore() {
        String id = SYNCTHING[0];
        try {
            c.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + id)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (Throwable noStore) {
            try {
                c.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://f-droid.org/packages/" + id + "/")).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            } catch (Throwable t2) {
                Toast.makeText(c, "Search for Syncthing-Fork in your app store", Toast.LENGTH_LONG).show();
            }
        }
    }

    private void refreshStatus() {
        EppyPlayer p = host.player();
        EppyBook b = p.book();
        if (b == null) {
            status.setText("Start a book to see what its folder holds.");
            return;
        }
        String folder = b.folderUri;
        Long savedHere = OtherDevicePosition.savedHere(c, folder);
        new Thread(() -> {
            OtherDevicePosition there = OtherDevicePosition.read(c, folder);
            String s;
            if (there == null) {
                s = "No saved position in this book's folder yet. SABP saves one when you pause.";
            } else {
                EppyBook.FileItem f = b.file(there.fileName);
                long at = (f != null && f.start >= 0 ? f.start : 0) + there.seconds;
                String when = DateUtils.getRelativeTimeSpanString(there.lastPlayed, System.currentTimeMillis(), DateUtils.MINUTE_IN_MILLIS).toString();
                boolean mine = savedHere != null && savedHere == there.lastPlayed;
                s = "Saved position in the book's folder: " + Ui.time(at * 1000) + ", " + when
                        + (mine ? ", saved by this device."
                        : there.device != null ? ", saved by the " + there.device + ": check the other device to jump there."
                        : savedHere == null ? "." : ", from the other device: check the other device to jump there.");
            }
            status.post(() -> status.setText(s));
        }, "eppy-sync").start();
    }
}
