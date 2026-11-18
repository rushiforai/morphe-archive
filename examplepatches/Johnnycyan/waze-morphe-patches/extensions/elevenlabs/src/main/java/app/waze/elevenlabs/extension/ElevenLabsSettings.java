package app.waze.elevenlabs.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.text.InputType;
import android.view.ContextThemeWrapper;
import android.util.TypedValue;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import java.io.File;
import java.util.List;
import java.util.Locale;

/** Stored configuration and the settings dialog opened from Waze's settings. */
final class ElevenLabsSettings {
    private static final String PREFS = "elevenlabs_voice";
    static final String DEFAULT_MODEL = "eleven_v4_turbo";
    private static final String SAMPLE = "In two hundred meters, turn left onto Main Street.";

    private ElevenLabsSettings() {}

    /** Immutable snapshot, so one utterance never mixes old and new settings. */
    static final class Config {
        final boolean enabled;
        final String apiKey, voiceId, voiceName, modelId;
        final float stability, similarity, speed;

        Config(boolean enabled, String apiKey, String voiceId, String voiceName, String modelId,
                float stability, float similarity, float speed) {
            this.enabled = enabled; this.apiKey = apiKey; this.voiceId = voiceId; this.voiceName = voiceName;
            this.modelId = modelId; this.stability = stability; this.similarity = similarity; this.speed = speed;
        }

        boolean usable() { return enabled && !apiKey.isEmpty() && !voiceId.isEmpty(); }
    }

    static Config load(Context context) {
        SharedPreferences p = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String model = p.getString("model_id", "");
        return new Config(p.getBoolean("enabled", false), p.getString("api_key", ""), p.getString("voice_id", ""),
                p.getString("voice_name", ""), model.isEmpty() ? DEFAULT_MODEL : model,
                p.getFloat("stability", 0.5f), p.getFloat("similarity", 0.75f), p.getFloat("speed", 1.0f));
    }

    private static void save(Context context, Config c) {
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putBoolean("enabled", c.enabled).putString("api_key", c.apiKey)
                .putString("voice_id", c.voiceId).putString("voice_name", c.voiceName)
                .putString("model_id", c.modelId).putFloat("stability", c.stability)
                .putFloat("similarity", c.similarity).putFloat("speed", c.speed).apply();
    }

    static String summary(Context context) {
        Config c = load(context);
        if (!c.enabled) return "Off";
        if (c.apiKey.isEmpty() || c.voiceId.isEmpty()) return "On, needs an API key and voice";
        return "On · " + (c.voiceName.isEmpty() ? c.voiceId : c.voiceName);
    }

    /** Opens the settings dialog. [note] explains what the host app needs for ElevenLabs to speak. */
    static AlertDialog show(Activity activity, String note, Runnable onSaved) {
        // Our own settings activity is translucent and unthemed; give its dialog the system look.
        Context ui = activity instanceof ElevenLabsActivity
                ? new ContextThemeWrapper(activity, android.R.style.Theme_DeviceDefault_DayNight) : activity;
        Config current = load(activity);
        int pad = dp(activity, 20);
        LinearLayout form = new LinearLayout(ui);
        form.setOrientation(LinearLayout.VERTICAL);
        form.setPadding(pad, dp(activity, 8), pad, 0);

        CheckBox enabled = new CheckBox(ui);
        enabled.setText("Use ElevenLabs for navigation voice");
        enabled.setChecked(current.enabled);
        form.addView(enabled);
        form.addView(note(ui, note));

        EditText apiKey = field(ui, form, "API key", current.apiKey,
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        EditText voiceId = field(ui, form, "Voice ID", current.voiceId, InputType.TYPE_CLASS_TEXT);
        final String[] voiceName = {current.voiceName};
        Button pickVoice = button(ui, form, "Choose from my voices");
        EditText modelId = field(ui, form, "Model ID", current.modelId, InputType.TYPE_CLASS_TEXT);
        Button pickModel = button(ui, form, "Choose model");

        SeekBar stability = slider(ui, form, "Stability", 0, 100, Math.round(current.stability * 100), v -> v + "%");
        SeekBar similarity = slider(ui, form, "Similarity", 0, 100, Math.round(current.similarity * 100), v -> v + "%");
        SeekBar speed = slider(ui, form, "Speed", 70, 120, Math.round(current.speed * 100),
                v -> String.format(Locale.ROOT, "%.2f×", v / 100f));

        TextView status = note(ui, "Last result: " + ElevenLabsBridge.status());
        Button test = button(ui, form, "Test voice");
        Button clear = button(ui, form, "Clear audio cache (" + megabytes(ElevenLabsClient.cacheSize(activity.getCacheDir())) + ")");
        form.addView(status);

        // The stored name belongs to the ID it was picked with; a hand-typed ID has no name.
        final String[] namedId = {current.voiceId};
        FormConfig formConfig = () -> {
            String id = voiceId.getText().toString().trim();
            String model = modelId.getText().toString().trim();
            return new Config(enabled.isChecked(), apiKey.getText().toString().trim(), id,
                    id.equals(namedId[0]) ? voiceName[0] : "", model.isEmpty() ? DEFAULT_MODEL : model,
                    stability.getProgress() / 100f, similarity.getProgress() / 100f,
                    (speed.getProgress() + 70) / 100f);
        };

        pickVoice.setOnClickListener(v -> choose(activity, ui, status, "Choose a voice",
                () -> ElevenLabsClient.voices(apiKey.getText().toString().trim()), choice -> {
                    voiceId.setText(choice.id);
                    namedId[0] = choice.id;
                    voiceName[0] = choice.name;
                }));
        pickModel.setOnClickListener(v -> choose(activity, ui, status, "Choose a model",
                () -> ElevenLabsClient.models(apiKey.getText().toString().trim()), choice -> modelId.setText(choice.id)));
        test.setOnClickListener(v -> {
            Config config = formConfig.get();
            if (config.apiKey.isEmpty() || config.voiceId.isEmpty()) {
                status.setText("Enter an API key and a voice ID first");
                return;
            }
            status.setText("Synthesizing…");
            ElevenLabsBridge.background(() -> {
                try {
                    File audio = ElevenLabsClient.speech(activity.getCacheDir(), config, SAMPLE);
                    activity.runOnUiThread(() -> {
                        status.setText("Playing sample");
                        playSample(audio, status);
                    });
                } catch (Exception error) {
                    activity.runOnUiThread(() -> status.setText(message(error)));
                }
            });
        });
        clear.setOnClickListener(v -> {
            ElevenLabsBridge.background(() -> {
                ElevenLabsClient.clearCache(activity.getCacheDir());
                activity.runOnUiThread(() -> clear.setText("Clear audio cache (0.0 MB)"));
            });
        });

        ScrollView scroll = new ScrollView(ui);
        scroll.addView(form);
        return new AlertDialog.Builder(ui)
                .setTitle("ElevenLabs voice")
                .setView(scroll)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Save", (dialog, which) -> {
                    save(activity, formConfig.get());
                    ElevenLabsBridge.cancel();
                    if (onSaved != null) onSaved.run();
                })
                .show();
    }

    interface FormConfig { Config get(); }
    interface Loader { List<ElevenLabsClient.Choice> load() throws Exception; }
    interface Picked { void picked(ElevenLabsClient.Choice choice); }
    interface Label { String of(int value); }

    private static void choose(Activity activity, Context ui, TextView status, String title, Loader loader, Picked picked) {
        status.setText("Loading…");
        ElevenLabsBridge.background(() -> {
            try {
                List<ElevenLabsClient.Choice> choices = loader.load();
                activity.runOnUiThread(() -> {
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    if (choices.isEmpty()) { status.setText("Nothing to choose from"); return; }
                    status.setText("Loaded " + choices.size());
                    String[] names = new String[choices.size()];
                    for (int i = 0; i < names.length; i++) names[i] = choices.get(i).name;
                    new AlertDialog.Builder(ui).setTitle(title)
                            .setItems(names, (d, which) -> picked.picked(choices.get(which)))
                            .setNegativeButton("Cancel", null).show();
                });
            } catch (Exception error) {
                activity.runOnUiThread(() -> status.setText(message(error)));
            }
        });
    }

    private static void playSample(File audio, TextView status) {
        MediaPlayer player = new MediaPlayer();
        try {
            player.setDataSource(audio.getAbsolutePath());
            player.setOnCompletionListener(MediaPlayer::release);
            player.prepare();
            player.start();
        } catch (Exception error) {
            player.release();
            status.setText("Cannot play sample: " + error.getMessage());
        }
    }

    static String message(Exception error) {
        if (error instanceof ElevenLabsClient.ApiException) return error.getMessage();
        if (error instanceof java.net.UnknownHostException) return "No internet connection";
        if (error instanceof java.net.SocketTimeoutException) return "ElevenLabs timed out";
        return error.getClass().getSimpleName() + (error.getMessage() == null ? "" : ": " + error.getMessage());
    }

    private static EditText field(Context ui, LinearLayout form, String label, String value, int type) {
        form.addView(label(ui, label));
        EditText edit = new EditText(ui);
        edit.setSingleLine(true);
        edit.setInputType(type);
        edit.setText(value);
        form.addView(edit);
        return edit;
    }

    private static Button button(Context ui, LinearLayout form, String text) {
        Button button = new Button(ui);
        button.setText(text);
        button.setAllCaps(false);
        form.addView(button);
        return button;
    }

    private static SeekBar slider(Context ui, LinearLayout form, String name, int min, int max, int value, Label label) {
        TextView title = label(ui, "");
        form.addView(title);
        SeekBar bar = new SeekBar(ui);
        bar.setMax(max - min);
        bar.setProgress(Math.max(0, Math.min(max - min, value - min)));
        title.setText(name + ": " + label.of(bar.getProgress() + min));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar s, int progress, boolean user) { title.setText(name + ": " + label.of(progress + min)); }
            public void onStartTrackingTouch(SeekBar s) {}
            public void onStopTrackingTouch(SeekBar s) {}
        });
        form.addView(bar);
        return bar;
    }

    private static TextView label(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setPadding(0, dp(context, 12), 0, 0);
        return view;
    }

    private static TextView note(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setAlpha(0.75f);
        view.setPadding(0, dp(context, 6), 0, dp(context, 6));
        return view;
    }

    private static String megabytes(long bytes) {
        return String.format(Locale.ROOT, "%.1f MB", bytes / 1048576.0);
    }

    static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
