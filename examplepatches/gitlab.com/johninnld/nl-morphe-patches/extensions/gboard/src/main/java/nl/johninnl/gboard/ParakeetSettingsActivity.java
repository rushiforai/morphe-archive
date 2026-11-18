package nl.johninnl.gboard;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** Gboard settings → Voice typing → Parakeet voice typing. */
public final class ParakeetSettingsActivity extends Activity {
    private static final int REQUEST_MIC = 41;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final List<RadioButton> modelButtons = new ArrayList<>();
    private boolean dutch;
    private Switch enable;
    private TextView status;
    private ProgressBar progress;
    private Button download;
    private Button cancel;
    private Button delete;
    private Button microphone;
    private Switch dictionary;
    private TextView dictionaryStatus;
    private Button dictionaryDownload;
    private boolean binding;

    private final Runnable refresher = new Runnable() {
        @Override
        public void run() {
            refresh();
            handler.postDelayed(this, 500);
        }
    };

    @Override
    protected void onCreate(Bundle state) {
        setTheme(Build.VERSION.SDK_INT >= 29
                ? android.R.style.Theme_DeviceDefault_DayNight
                : android.R.style.Theme_DeviceDefault_Light);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(state);
        dutch = "nl".equals(Locale.getDefault().getLanguage());
        setTitle(t("Parakeet voice typing", "Parakeet-spraakinvoer"));

        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(20);
        column.setPadding(pad, pad, pad, pad);

        column.addView(text(t("Parakeet voice typing", "Parakeet-spraakinvoer"), 24, true));
        column.addView(text(t(
                "Gboard's microphone key uses NVIDIA Parakeet on this phone instead of Google's speech recognition. "
                        + "Every sentence is recognised in the language you speak it in, so Dutch and English (and 23 more "
                        + "European languages) work without switching. After the download, nothing leaves the phone.",
                "De microfoontoets van Gboard gebruikt NVIDIA Parakeet op deze telefoon in plaats van de "
                        + "spraakherkenning van Google. Elke zin wordt herkend in de taal waarin je hem uitspreekt, dus "
                        + "Nederlands en Engels (en 23 andere Europese talen) werken zonder wisselen. Na het downloaden "
                        + "verlaat er niets de telefoon."), 15, false));

        enable = new Switch(this);
        enable.setText(t("Use Parakeet for voice typing", "Parakeet gebruiken voor spraakinvoer"));
        enable.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        enable.setPadding(0, dp(16), 0, dp(8));
        enable.setOnCheckedChangeListener((CompoundButton button, boolean on) -> {
            if (binding) return;
            ParakeetStore.setEnabled(this, on);
            if (!on) ParakeetEngine.release();
            refresh();
        });
        column.addView(enable);

        microphone = button(t("Allow microphone", "Microfoon toestaan"));
        microphone.setOnClickListener(v -> requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO}, REQUEST_MIC));
        column.addView(microphone);

        column.addView(heading(t("Speech model", "Spraakmodel")));
        RadioGroup group = new RadioGroup(this);
        for (ParakeetCatalog.Model model : ParakeetCatalog.MODELS) {
            RadioButton radio = new RadioButton(this);
            radio.setId(View.generateViewId());
            radio.setTag(model);
            radio.setPadding(dp(8), dp(10), 0, dp(10));
            radio.setOnClickListener(v -> {
                ParakeetStore.selectModel(this, model);
                ParakeetEngine.release();
                refresh();
            });
            modelButtons.add(radio);
            group.addView(radio);
        }
        column.addView(group);

        progress = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        progress.setMax(1000);
        column.addView(progress, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(24)));
        status = text("", 14, false);
        column.addView(status);

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.START);
        download = button(t("Download", "Downloaden"));
        download.setOnClickListener(v -> ParakeetDownloader.start(this, ParakeetStore.selectedModel(this)));
        cancel = button(t("Stop", "Stoppen"));
        cancel.setOnClickListener(v -> ParakeetDownloader.cancel());
        delete = button(t("Delete", "Verwijderen"));
        delete.setOnClickListener(v -> {
            ParakeetCatalog.Model model = ParakeetStore.selectedModel(this);
            ParakeetEngine.release();
            ParakeetStore.deleteModel(this, model);
            refresh();
        });
        actions.addView(download);
        actions.addView(cancel);
        actions.addView(delete);
        column.addView(actions);

        if (ParakeetDictionary.available()) addDictionarySection(column);

        column.addView(text(t(
                "The download comes from Hugging Face and the sherpa-onnx release on GitHub, and is checked against "
                        + "fixed checksums. Wi-Fi recommended. It keeps going when you leave this screen.",
                "De download komt van Hugging Face en de sherpa-onnx-release op GitHub en wordt gecontroleerd met "
                        + "vaste controlesommen. Wifi aanbevolen. Hij gaat door als je dit scherm verlaat."), 13, false));
        column.addView(text(t(
                "Parakeet Ultra by Moondream and Parakeet TDT v3 by NVIDIA, licensed CC BY 4.0. "
                        + "Runs on sherpa-onnx and ONNX Runtime (Apache 2.0 and MIT).",
                "Parakeet Ultra van Moondream en Parakeet TDT v3 van NVIDIA, licentie CC BY 4.0. "
                        + "Draait op sherpa-onnx en ONNX Runtime (Apache 2.0 en MIT)."), 12, false));
        if (ParakeetDictionary.available()) {
            column.addView(text(t(
                    "Spelling data: NVIDIA's Parakeet tokenizer (CC BY 4.0) and Hermit Dave's FrequencyWords lists "
                            + "from OpenSubtitles (CC BY-SA 4.0).",
                    "Spellinggegevens: de Parakeet-tokenizer van NVIDIA (CC BY 4.0) en de FrequencyWords-lijsten van "
                            + "Hermit Dave uit OpenSubtitles (CC BY-SA 4.0)."), 12, false));
        }

        ScrollView scroll = new ScrollView(this);
        scroll.addView(column);
        scroll.setOnApplyWindowInsetsListener((View view, WindowInsets insets) -> {
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });
        setContentView(scroll);
        refresh();
    }

    private void addDictionarySection(LinearLayout column) {
        column.addView(heading(t("Voice dictionary", "Spraakwoordenboek")));
        column.addView(text(t(
                "Parakeet spells the names and words from the Voice dictionary (Gboard settings → Voice typing → "
                        + "Voice dictionary), including contact names added there. It favours them while listening, "
                        + "and corrects a word that sounds like one of them only when a second listen agrees. "
                        + "Names that are also ordinary words, such as Visser, are left as heard.",
                "Parakeet schrijft de namen en woorden uit het Spraakwoordenboek (Gboard-instellingen → Spraakinvoer "
                        + "→ Spraakwoordenboek) goed, ook de contactnamen die daar staan. Het geeft ze voorrang "
                        + "tijdens het luisteren en verbetert een woord dat op een ervan lijkt alleen als een tweede keer "
                        + "luisteren dat bevestigt. Namen die ook een gewoon woord zijn, zoals Visser, blijven zoals ze "
                        + "gehoord zijn."), 15, false));
        dictionary = new Switch(this);
        dictionary.setText(t("Use the Voice dictionary", "Spraakwoordenboek gebruiken"));
        dictionary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        dictionary.setPadding(0, dp(12), 0, dp(4));
        dictionary.setOnCheckedChangeListener((CompoundButton button, boolean on) -> {
            if (binding) return;
            ParakeetDictionary.setEnabled(this, on);
            ParakeetEngine.release();
            refresh();
        });
        column.addView(dictionary);
        dictionaryStatus = text("", 14, false);
        column.addView(dictionaryStatus);
        dictionaryDownload = button(t("Download spelling data", "Spellinggegevens downloaden"));
        dictionaryDownload.setOnClickListener(v -> ParakeetDownloader.startDictionary(this));
        column.addView(dictionaryDownload);
    }

    private void refreshDictionary(ParakeetDownloader.Status job, boolean running) {
        if (dictionary == null) return;
        boolean on = ParakeetDictionary.enabled(this);
        boolean data = ParakeetDictionary.dataInstalled(this);
        binding = true;
        dictionary.setChecked(on);
        binding = false;
        dictionaryDownload.setVisibility(on && !data && !running ? View.VISIBLE : View.GONE);
        String message;
        if (!on) {
            message = t("Off: Parakeet writes what it hears.", "Uit: Parakeet schrijft op wat het hoort.");
        } else if (running && ParakeetDownloader.DICTIONARY_JOB.equals(job.modelId)) {
            message = t("Downloading spelling data…", "Spellinggegevens downloaden…");
        } else if (!data) {
            String failed = job.phase == ParakeetDownloader.FAILED && ParakeetDownloader.DICTIONARY_JOB.equals(job.modelId)
                    ? t("Download failed: ", "Downloaden mislukt: ") + job.error + ". " : "";
            message = failed + t("Needs about ", "Heeft ongeveer ") + Math.max(1, (ParakeetDictionary.missingDataBytes(this) + (1 << 19)) >> 20)
                    + t(" MB of spelling data from Hugging Face and GitHub.", " MB aan spellinggegevens van Hugging Face en GitHub nodig.");
        } else {
            int count = ParakeetDictionary.lastWordCount(this);
            message = count < 0
                    ? t("Ready. The list is read the next time you dictate.", "Klaar. De lijst wordt gelezen als je weer dicteert.")
                    : t("Ready. Last read: ", "Klaar. Laatst gelezen: ") + count + t(" names and words.", " namen en woorden.");
        }
        dictionaryStatus.setText(message);
    }

    @Override
    protected void onResume() {
        super.onResume();
        handler.post(refresher);
    }

    @Override
    protected void onPause() {
        handler.removeCallbacks(refresher);
        super.onPause();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        refresh();
    }

    private void refresh() {
        ParakeetCatalog.Model selected = ParakeetStore.selectedModel(this);
        ParakeetDownloader.Status job = ParakeetDownloader.status();
        boolean running = job.phase == ParakeetDownloader.RUNNING;
        boolean runtime = ParakeetStore.runtimeInstalled(this);
        boolean installed = runtime && ParakeetStore.modelInstalled(this, selected);
        boolean arm64 = ParakeetStore.supportsArm64();
        boolean mic = checkSelfPermission(Manifest.permission.RECORD_AUDIO) == PackageManager.PERMISSION_GRANTED;

        binding = true;
        for (RadioButton radio : modelButtons) {
            ParakeetCatalog.Model model = (ParakeetCatalog.Model) radio.getTag();
            String state;
            if (running && model.id.equals(job.modelId)) {
                state = t("Downloading", "Bezig met downloaden");
            } else if (ParakeetStore.modelInstalled(this, model)) {
                state = t("Downloaded", "Gedownload");
            } else {
                state = t("Not downloaded", "Niet gedownload");
            }
            radio.setText((dutch ? model.titleNl : model.titleEn) + " · " + state + "\n"
                    + (dutch ? model.summaryNl : model.summaryEn));
            radio.setChecked(model.id.equals(selected.id));
            radio.setEnabled(!running);
        }
        enable.setChecked(ParakeetStore.enabled(this) && installed);
        enable.setEnabled(installed && arm64);
        binding = false;

        microphone.setVisibility(mic ? View.GONE : View.VISIBLE);
        download.setVisibility(!installed && !running && arm64 ? View.VISIBLE : View.GONE);
        cancel.setVisibility(running ? View.VISIBLE : View.GONE);
        delete.setVisibility(!running && ParakeetStore.installedBytes(this, selected) > 0 ? View.VISIBLE : View.GONE);
        progress.setVisibility(running ? View.VISIBLE : View.GONE);
        if (running && job.total > 0) progress.setProgress((int) (job.done * 1000 / job.total));

        String message;
        if (!arm64) {
            message = t("This phone is not supported (64-bit ARM is required).",
                    "Deze telefoon wordt niet ondersteund (64-bit ARM is nodig).");
        } else if (running) {
            message = t("Downloading ", "Downloaden ") + mb(job.done) + " / " + mb(job.total);
        } else if (job.phase == ParakeetDownloader.FAILED && selected.id.equals(job.modelId) && !installed) {
            message = t("Download failed: ", "Downloaden mislukt: ") + job.error
                    + t(". Tap Download to continue where it stopped.", ". Tik op Downloaden om verder te gaan waar hij stopte.");
        } else if (installed && ParakeetStore.enabled(this)) {
            message = mic ? t("Ready. Tap the microphone key in Gboard and start talking.",
                    "Klaar. Tik op de microfoontoets in Gboard en begin te praten.")
                    : t("Allow the microphone to start.", "Sta de microfoon toe om te beginnen.");
        } else if (installed) {
            message = t("Downloaded. Switch on Parakeet above.", "Gedownload. Zet Parakeet hierboven aan.");
        } else {
            long size = ParakeetStore.missingBytes(this, selected);
            message = t("Download needed: about ", "Download nodig: ongeveer ") + mb(size)
                    + t(". Until then Gboard uses Google's voice typing.", ". Tot die tijd gebruikt Gboard de spraakinvoer van Google.");
        }
        status.setText(message);
        refreshDictionary(job, running);
    }

    private String t(String en, String nl) {
        return dutch ? nl : en;
    }

    private static String mb(long bytes) {
        return (bytes >> 20) + " MB";
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private TextView text(String value, int sp, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setPadding(0, dp(6), 0, dp(6));
        TypedArray colors = obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        view.setTextColor(colors.getColorStateList(0));
        colors.recycle();
        return view;
    }

    private TextView heading(String value) {
        TextView view = text(value, 17, true);
        view.setPadding(0, dp(20), 0, dp(4));
        return view;
    }

    private Button button(String label) {
        Button button = new Button(this);
        button.setText(label);
        button.setAllCaps(false);
        return button;
    }
}
