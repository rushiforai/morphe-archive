package dev.jason.gboardpatches.extension.ocr;

import java.util.Arrays;

public enum GboardOcrEngine {
    LATIN(
            "latin",
            "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile",
            "en",
            "play-services-mlkit-text-recognition",
            "text-recognition",
            "optional-module-text-latin",
            "com.google.android.gms.vision.ocr",
            "com.google.mlkit.dynamite.text.latin",
            new String[]{"vision.ocr"},
            1),
    CHINESE(
            "chinese",
            "taser_tflite_gocrchinese_and_latin_mbv2_aksara_layout_gcn_mobile",
            "zh",
            "play-services-mlkit-text-recognition-chinese",
            "text-recognition-chinese",
            "optional-module-text-chinese",
            "com.google.android.gms.mlkit_ocr_chinese",
            "com.google.mlkit.dynamite.text.chinese",
            new String[]{"mlkit.ocr.common", "mlkit.ocr.chinese"},
            2),
    JAPANESE(
            "japanese",
            "taser_tflite_gocrjapanese_and_latin_mbv2_aksara_layout_gcn_mobile",
            "ja",
            "play-services-mlkit-text-recognition-japanese",
            "text-recognition-japanese",
            "optional-module-text-japanese",
            "com.google.android.gms.mlkit_ocr_japanese",
            "com.google.mlkit.dynamite.text.japanese",
            new String[]{"mlkit.ocr.japanese"},
            4),
    KOREAN(
            "korean",
            "taser_tflite_gocrkorean_and_latin_mbv2_aksara_layout_gcn_mobile",
            "ko",
            "play-services-mlkit-text-recognition-korean",
            "text-recognition-korean",
            "optional-module-text-korean",
            "com.google.android.gms.mlkit_ocr_korean",
            "com.google.mlkit.dynamite.text.korean",
            new String[]{"mlkit.ocr.korean"},
            5),
    DEVANAGARI(
            "devanagari",
            "taser_tflite_gocrdevanagari_and_latin_mbv2_aksara_layout_gcn_mobile",
            "hi",
            "play-services-mlkit-text-recognition-devanagari",
            "text-recognition-devanagari",
            "optional-module-text-devanagari",
            "com.google.android.gms.mlkit_ocr_devanagari",
            "com.google.mlkit.dynamite.text.devanagari",
            new String[]{"mlkit.ocr.devanagari"},
            3);

    private final String settingsValue;
    private final String configLabel;
    private final String languageHint;
    private final String thinLoggingLibraryName;
    private final String thickLoggingLibraryName;
    private final String optionalModuleName;
    private final String thinModuleId;
    private final String thickModuleId;
    private final String[] requestFeatureNames;
    private final int languageOption;

    GboardOcrEngine(String settingsValue, String configLabel, String languageHint,
            String thinLoggingLibraryName, String thickLoggingLibraryName,
            String optionalModuleName, String thinModuleId, String thickModuleId,
            String[] requestFeatureNames, int languageOption) {
        this.settingsValue = settingsValue;
        this.configLabel = configLabel;
        this.languageHint = languageHint;
        this.thinLoggingLibraryName = thinLoggingLibraryName;
        this.thickLoggingLibraryName = thickLoggingLibraryName;
        this.optionalModuleName = optionalModuleName;
        this.thinModuleId = thinModuleId;
        this.thickModuleId = thickModuleId;
        this.requestFeatureNames = requestFeatureNames.clone();
        this.languageOption = languageOption;
    }

    public String getSettingsValue() {
        return settingsValue;
    }

    public String getConfigLabel() {
        return configLabel;
    }

    public String getLanguageHint() {
        return languageHint;
    }

    public String getLoggingLibraryName(boolean thickClient) {
        return thickClient ? thickLoggingLibraryName : thinLoggingLibraryName;
    }

    public String getOptionalModuleName() {
        return optionalModuleName;
    }

    public String getModuleId(boolean thickClient) {
        return thickClient ? thickModuleId : thinModuleId;
    }

    public String getThinModuleId() {
        return thinModuleId;
    }

    public String getThickModuleId() {
        return thickModuleId;
    }

    public String[] getRequestFeatureNames() {
        return requestFeatureNames.clone();
    }

    public int getLanguageOption() {
        return languageOption;
    }

    public boolean usesPayloadAwareThinInit() {
        return this != LATIN;
    }

    public static GboardOcrEngine fromValue(String value) {
        return Arrays.stream(values())
                .filter(engine -> engine.settingsValue.equals(value))
                .findFirst()
                .orElse(LATIN);
    }
}
