package me.dyskal.ytmrpc;

import android.app.Dialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.preference.SwitchPreference;
import android.text.InputType;
import android.util.AttributeSet;
import android.util.Pair;
import android.widget.EditText;
import android.widget.Toast;

/** Binds Morphe's themed preference rows to this add-on's private runtime settings. */
@SuppressWarnings({"deprecation", "unused"})
public final class DiscordPreferences extends Preference {
    private EditTextPreference applicationId;
    private ListPreference headline;
    private SwitchPreference sharing;
    private Preference connect, cancel, disconnect;
    private boolean bound;
    private final Runnable refresh = this::render;

    public DiscordPreferences(Context context, AttributeSet attrs) {
        super(context, attrs);
        setPersistent(false); setSelectable(false);
        DiscordRpcPatch.initialize(context.getApplicationContext());
    }

    @Override protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        // Run after the full preference hierarchy has been inflated and attached by Morphe.
        new Handler(Looper.getMainLooper()).post(this::bind);
    }

    private void bind() {
        if (bound) { render(); return; }
        PreferenceManager manager = getPreferenceManager();
        if (manager == null) return;
        applicationId = (EditTextPreference) manager.findPreference("dyskal_discord_application_id");
        headline = (ListPreference) manager.findPreference("dyskal_discord_headline");
        sharing = (SwitchPreference) manager.findPreference("dyskal_discord_enabled");
        connect = manager.findPreference("dyskal_discord_connect");
        cancel = manager.findPreference("dyskal_discord_cancel");
        disconnect = manager.findPreference("dyskal_discord_disconnect");
        Preference about = manager.findPreference("dyskal_discord_about");
        if (applicationId == null || headline == null || sharing == null || connect == null
                || cancel == null || disconnect == null || about == null) {
            setSummary("Discord preference rows are missing; reapply the official Settings and Discord patches together"); return;
        }
        applicationId.getEditText().setInputType(InputType.TYPE_CLASS_NUMBER);
        applicationId.getEditText().setSingleLine(true);
        applicationId.setOnPreferenceChangeListener((preference, value) -> {
            String id = value == null ? "" : value.toString().trim();
            if (!DiscordRpcPatch.setApplicationId(id)) {
                Toast.makeText(getContext(), "Enter a valid 17–20 digit application ID", Toast.LENGTH_SHORT).show();
            }
            return false; // The controller persists it and emits an update; do not write to Morphe's shared preference file.
        });
        headline.setEntries(new String[]{"Artist", "YouTube Music"});
        headline.setEntryValues(new String[]{"artist", "application"});
        headline.setOnPreferenceChangeListener((preference, value) -> {
            DiscordRpcPatch.setArtistHeadline("artist".equals(value)); return false;
        });
        sharing.setOnPreferenceChangeListener((preference, value) -> {
            DiscordRpcPatch.setSharingEnabled(Boolean.TRUE.equals(value)); return false;
        });
        connect.setOnPreferenceClickListener(preference -> {
            DiscordRpcPatch.authorize(getContext(), DiscordRpcPatch.getApplicationId()); render(); return true;
        });
        cancel.setOnPreferenceClickListener(preference -> { DiscordRpcPatch.cancelAuthorization(); render(); return true; });
        disconnect.setOnPreferenceClickListener(preference -> { DiscordRpcPatch.disconnect(getContext().getApplicationContext()); render(); return true; });
        about.setOnPreferenceClickListener(preference -> { showAbout(); return true; });
        bound = true;
        DiscordRpcPatch.addSettingsListener(refresh);
        render();
    }

    private void render() {
        if (!bound) return;
        boolean busy = DiscordRpcPatch.isAuthorizing();
        applicationId.setText(DiscordRpcPatch.getApplicationId());
        applicationId.setSummary(DiscordRpcPatch.getApplicationId());
        applicationId.setEnabled(!busy);
        headline.setValue(DiscordRpcPatch.usesArtistHeadline() ? "artist" : "application");
        headline.setSummary(DiscordRpcPatch.usesArtistHeadline() ? "Artist" : "YouTube Music");
        sharing.setChecked(DiscordRpcPatch.isSharingEnabled());
        sharing.setEnabled(DiscordRpcPatch.isAuthorized() && !busy);
        connect.setEnabled(!busy);
        connect.setTitle(DiscordRpcPatch.isAuthorized() ? "Reconnect" : "Connect with Discord");
        cancel.setEnabled(busy);
        disconnect.setEnabled(DiscordRpcPatch.isAuthorized() || busy);
        setSummary(DiscordRpcPatch.status());
    }

    private void showAbout() {
        String text;
        try (var input = getContext().getAssets().open("dyskal_discord_notices.txt")) {
            text = Http.readLimited(input, 262_144);
        } catch (Exception error) {
            DiscordDiagnostics.failure("Read notices", error);
            text = "Notices unavailable. Source: https://github.com/Dyskal/morphe-yt-music-discord-rpc";
        }
        try {
            // Reuse the host's dialog, including its rounded buttons and current theme.
            // Reflection keeps the official extension compile-only and avoids bundling duplicate Morphe classes.
            Class<?> dialogs = Class.forName("app.morphe.extension.shared.ui.CustomDialog", true, getContext().getClassLoader());
            Pair<?, ?> result = (Pair<?, ?>) dialogs.getMethod("create", Context.class, CharSequence.class,
                    CharSequence.class, EditText.class, CharSequence.class, Runnable.class, Runnable.class,
                    CharSequence.class, Runnable.class, boolean.class)
                    .invoke(null, getContext(), "Dyskal Discord RPC — About", text, null,
                            getContext().getString(android.R.string.ok), (Runnable) () -> {}, null, null, null, true);
            ((Dialog) result.first).show();
        } catch (Exception error) {
            DiscordDiagnostics.failure("Open Morphe notices dialog", error);
            Toast.makeText(getContext(), "Could not open Morphe's notices dialog", Toast.LENGTH_SHORT).show();
        }
    }
}
