package nl.johninnl.gboard;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Pinned downloads: every URL names an immutable commit or release, with exact size and SHA-256. */
public final class ParakeetCatalog {
    private ParakeetCatalog() {}

    /** One downloadable file. */
    public static final class Asset {
        public final String name;
        public final String url;
        public final long size;
        public final String sha256;

        Asset(String name, String url, long size, String sha256) {
            this.name = name;
            this.url = url;
            this.size = size;
            this.sha256 = sha256;
        }
    }

    /** A sherpa-onnx nemo_transducer bundle. */
    public static final class Model {
        public final String id;
        public final String titleEn;
        public final String titleNl;
        public final String summaryEn;
        public final String summaryNl;
        public final List<Asset> files;

        Model(String id, String titleEn, String titleNl, String summaryEn, String summaryNl, Asset... files) {
            this.id = id;
            this.titleEn = titleEn;
            this.titleNl = titleNl;
            this.summaryEn = summaryEn;
            this.summaryNl = summaryNl;
            this.files = Collections.unmodifiableList(Arrays.asList(files));
        }

        public long totalBytes() {
            long total = 0;
            for (Asset file : files) total += file.size;
            return total;
        }

        Asset file(String name) {
            for (Asset file : files) if (file.name.equals(name)) return file;
            throw new IllegalArgumentException(name);
        }
    }

    public static final String ENCODER = "encoder.int8.onnx";
    public static final String DECODER = "decoder.int8.onnx";
    public static final String JOINER = "joiner.int8.onnx";
    public static final String TOKENS = "tokens.txt";

    // Parakeet TDT v3's tokenizer; Ultra keeps it byte for byte.
    private static final String V3_TOKENS_SHA256 = "d58544679ea4bc6ac563d1f545eb7d474bd6cfa467f0a6e2c1dc1c7d37e3c35d";
    private static final long V3_TOKENS_SIZE = 93_939L;

    private static Asset hf(String repo, String commit, String name, long size, String sha256) {
        return new Asset(name, "https://huggingface.co/" + repo + "/resolve/" + commit + "/" + name, size, sha256);
    }

    private static final String ULTRA_REPO = "mldecode/parakeet-ultra-onnx-int8";
    private static final String ULTRA_COMMIT = "3282a6e32885b431c1543d58c7710e6e3412eac0";

    /** Moondream's post-trained Parakeet TDT v3 (moondream/parakeet-ultra), int8 sherpa-onnx export. */
    public static final Model ULTRA = new Model(
            "parakeet-ultra-int8",
            "Parakeet Ultra (recommended)",
            "Parakeet Ultra (aanbevolen)",
            "Moondream's further-trained Parakeet TDT v3. 25 European languages including Dutch and English, "
                    + "detected automatically for every sentence. Best in background noise. About 630 MB.",
            "Door Moondream verder getrainde Parakeet TDT v3. 25 Europese talen, waaronder Nederlands en Engels, "
                    + "per zin automatisch herkend. Het beste bij achtergrondgeluid. Ongeveer 630 MB.",
            hf(ULTRA_REPO, ULTRA_COMMIT, ENCODER, 611_879_344L, "181382735a719c75076d13658dc4418de4b566aef39935ca0f8f55da16928f4e"),
            hf(ULTRA_REPO, ULTRA_COMMIT, DECODER, 12_257_685L, "0ba8ace2de04bb2d9a6b20ed2d67138c23df4a385f268438df0ff200502de77a"),
            hf(ULTRA_REPO, ULTRA_COMMIT, JOINER, 5_281_747L, "20ae4350c2484ba607d94f08ef25ae3ead762d8aaf70753758ffcc504e255ebb"),
            hf(ULTRA_REPO, ULTRA_COMMIT, TOKENS, V3_TOKENS_SIZE, V3_TOKENS_SHA256));

    private static final String V3_REPO = "csukuangfj/sherpa-onnx-nemo-parakeet-tdt-0.6b-v3-int8";
    private static final String V3_COMMIT = "2bda32ec70b097a55adaa07d9a7173915b43cc78";

    /** NVIDIA Parakeet TDT 0.6B v3, int8 export published by the sherpa-onnx project. */
    public static final Model V3 = new Model(
            "parakeet-tdt-0.6b-v3-int8",
            "Parakeet TDT 0.6B v3",
            "Parakeet TDT 0.6B v3",
            "NVIDIA's original multilingual model as published by sherpa-onnx. Same 25 languages with "
                    + "automatic detection. About 670 MB.",
            "Het oorspronkelijke meertalige model van NVIDIA, zoals sherpa-onnx het publiceert. Dezelfde "
                    + "25 talen met automatische herkenning. Ongeveer 670 MB.",
            hf(V3_REPO, V3_COMMIT, ENCODER, 652_184_281L, "acfc2b4456377e15d04f0243af540b7fe7c992f8d898d751cf134c3a55fd2247"),
            hf(V3_REPO, V3_COMMIT, DECODER, 11_845_275L, "179e50c43d1a9de79c8a24149a2f9bac6eb5981823f2a2ed88d655b24248db4e"),
            hf(V3_REPO, V3_COMMIT, JOINER, 6_355_277L, "3164c13fc2821009440d20fcb5fdc78bff28b4db2f8d0f0b329101719c0948b3"),
            hf(V3_REPO, V3_COMMIT, TOKENS, V3_TOKENS_SIZE, V3_TOKENS_SHA256));

    public static final List<Model> MODELS = Collections.unmodifiableList(Arrays.asList(ULTRA, V3));

    public static Model model(String id) {
        for (Model model : MODELS) if (model.id.equals(id)) return model;
        return ULTRA;
    }

    /** sherpa-onnx's Android runtime (ONNX Runtime linked in statically); only its arm64 library is kept. */
    public static final String RUNTIME_VERSION = "1.13.3";
    public static final Asset RUNTIME_ARCHIVE = new Asset(
            "sherpa-onnx-static-link-onnxruntime-1.13.3.aar",
            "https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.13.3/sherpa-onnx-static-link-onnxruntime-1.13.3.aar",
            38_398_784L,
            "9f065fe6f2cab09fd48eaa580097293e077637ad53a5e89c5c58a36509386ac7");
    public static final String RUNTIME_ENTRY = "jni/arm64-v8a/libsherpa-onnx-jni.so";
    public static final String RUNTIME_LIBRARY = "libsherpa-onnx-jni.so";
    public static final long RUNTIME_LIBRARY_SIZE = 22_393_072L;
    public static final String RUNTIME_LIBRARY_SHA256 = "554bba6a6d37f2bdc36dd83418cde3dbb94fbe3eec1e859f941fe5a6a6b8ec86";

    /** Silero VAD v5 as published by the sherpa-onnx maintainer; tells speech from silence and noise. */
    public static final Asset VAD_MODEL = hf("csukuangfj/vad", "fba88cd2e921609e7675c3aaf51e0b9b295da4bc",
            "silero_vad_v5.onnx", 2_313_101L, "6b99cbfd39246b6706f98ec13c7c50c6b299181f2474fa05cbc8046acc274396");

    /** Version of the spelling data folder; change it together with the files below. */
    public static final String DICTIONARY_DATA_VERSION = "1";

    /**
     * NVIDIA's tokenizer for Parakeet TDT v3, which Ultra keeps unchanged (its vocabulary matches our
     * tokens.txt piece for piece). Used to spell voice-correction-list entries in Parakeet's pieces.
     */
    public static final Asset TOKENIZER = hf("nvidia/parakeet-tdt-0.6b-v3", "541d1f99c6b0c3cd0b11a95167540bb8edefd82b",
            "tokenizer.json", 1_159_960L, "bd321b096832a3f270bd3b2a88823957920f1a5c5ada71114a26ea729d0cbe91");

    private static Asset frequencyWords(String language, long size, String sha256) {
        String name = language + "_50k.txt";
        return new Asset(name, "https://raw.githubusercontent.com/hermitdave/FrequencyWords/"
                + "525f9b560de45753a5ea01069454e72e9aa541c6/content/2018/" + language + "/" + name, size, sha256);
    }

    /** The 50,000 most frequent Dutch and English subtitle words, so ordinary words are never corrected. */
    public static final Asset COMMON_DUTCH = frequencyWords("nl", 650_762L,
            "099bd0c27b514d54284360ad9ce2b4ef7b6903b22e848b67ab10f6aa2adb4baa");
    public static final Asset COMMON_ENGLISH = frequencyWords("en", 622_749L,
            "5351ff405b1126ef555791dd4d9798a48e3e9a501a9fc481a9da957752cfb458");

    /** Everything the voice correction list needs besides the speech model. */
    public static final List<Asset> DICTIONARY_FILES =
            Collections.unmodifiableList(Arrays.asList(TOKENIZER, COMMON_DUTCH, COMMON_ENGLISH));

    public static long dictionaryBytes() {
        long total = 0;
        for (Asset file : DICTIONARY_FILES) total += file.size;
        return total;
    }
}
