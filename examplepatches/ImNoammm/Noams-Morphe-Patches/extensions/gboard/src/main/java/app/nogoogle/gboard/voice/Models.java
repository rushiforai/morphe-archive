package app.nogoogle.gboard.voice;

import app.nogoogle.gboard.NoGoogleSettings;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/** Finds model files the user placed in <external files>/models/{whisper,translate,llm}. */
public final class Models {
    private Models() {
    }

    public static File whisperDir() {
        File d = new File(NoGoogleSettings.modelsDir(), "whisper");
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        return d;
    }

    /** LLM translation models (Hy-MT .gguf). */
    public static File llmDir() {
        File d = new File(NoGoogleSettings.modelsDir(), "llm");
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        return d;
    }

    /** Silero voice-activity model (models/vad/*silero*.bin), or null. */
    public static File vadModel() {
        File d = new File(NoGoogleSettings.modelsDir(), "vad");
        File[] files = d.listFiles((dir, name) -> name.endsWith(".bin") && name.contains("silero"));
        if (files == null || files.length == 0) return null;
        Arrays.sort(files); // newest version last
        return files[files.length - 1];
    }

    public static File translateDir() {
        File d = new File(NoGoogleSettings.modelsDir(), "translate");
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        return d;
    }

    public static List<File> whisperModels() {
        File[] files = whisperDir().listFiles((dir, name) -> name.endsWith(".bin"));
        List<File> out = new ArrayList<>();
        if (files != null) out.addAll(Arrays.asList(files));
        out.sort((a, b) -> Long.compare(b.length(), a.length()));
        return out;
    }

    /** Fine-tuned for dynamic audio context (FUTO ACFT): accurate when only the audio is encoded. */
    public static boolean isAcft(File f) {
        return f != null && f.getName().toLowerCase(Locale.ROOT).contains("acft");
    }

    static boolean isEnglishOnly(File f) {
        return f.getName().toLowerCase(Locale.ROOT).matches(".*\\.en[-_.].*|.*\\.en\\.bin");
    }

    private static int rank(File f) {
        String n = f.getName().toLowerCase(Locale.ROOT);
        if (n.contains("large")) return 5;
        if (n.contains("medium")) return 4;
        if (n.contains("small")) return 3;
        if (n.contains("base")) return 2;
        if (n.contains("tiny")) return 1;
        return 0;
    }

    private static File byName(String name) {
        if (name == null || name.isEmpty() || "auto".equals(name) || "none".equals(name)) return null;
        File f = new File(whisperDir(), name);
        return f.isFile() ? f : null;
    }

    /** Most accurate multilingual model (or the user's choice); ACFT wins a tie (much faster). */
    public static File mainModel() {
        File chosen = byName(NoGoogleSettings.str(NoGoogleSettings.VOICE_MODEL));
        if (chosen != null) return chosen;
        File best = null;
        for (File f : whisperModels()) {
            if (isEnglishOnly(f)) continue;
            if (best == null || rank(f) > rank(best) || (rank(f) == rank(best) && isAcft(f) && !isAcft(best))) {
                best = f;
            }
        }
        return best;
    }

}
