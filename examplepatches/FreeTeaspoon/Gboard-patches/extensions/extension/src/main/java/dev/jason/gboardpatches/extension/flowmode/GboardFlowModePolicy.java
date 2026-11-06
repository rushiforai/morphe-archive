package dev.jason.gboardpatches.extension.flowmode;

public final class GboardFlowModePolicy {
    public static final String ENABLE_LLM_PC_FLAG = "enable_llm_pc";
    public static final String ENABLE_FLOW_MODE_FLAG = "enable_llm_pc_flow_mode";
    public static final String SUPPORTED_LANGUAGE_TAGS_FLAG =
            "llm_pc_supported_language_tags";
    public static final String ALL_KEYBOARDS_VALUE = "*";
    public static final int STOCK_TYPING_PULSE_KEY_CODE = -10043;

    private GboardFlowModePolicy() {
    }

    public static boolean isTargetFlagName(String flagName) {
        return ENABLE_LLM_PC_FLAG.equals(flagName)
                || ENABLE_FLOW_MODE_FLAG.equals(flagName)
                || SUPPORTED_LANGUAGE_TAGS_FLAG.equals(flagName);
    }

    public static Object maybeForceFlagValue(
            String flagName,
            Object stockResult,
            boolean enabled) {
        if (!enabled || flagName == null) {
            return stockResult;
        }
        if (ENABLE_LLM_PC_FLAG.equals(flagName)
                || ENABLE_FLOW_MODE_FLAG.equals(flagName)) {
            return stockResult instanceof Boolean ? Boolean.TRUE : stockResult;
        }
        if (SUPPORTED_LANGUAGE_TAGS_FLAG.equals(flagName)) {
            return stockResult instanceof String ? ALL_KEYBOARDS_VALUE : stockResult;
        }
        return stockResult;
    }

    public static int mapKeyCode(int keyCode, boolean enabled) {
        if (!enabled || keyCode <= 0) {
            return keyCode;
        }
        switch (keyCode) {
            case 55:
            case 56:
            case 59:
            case 60:
            case 62:
            case 66:
            case 67:
                return keyCode;
            default:
                return STOCK_TYPING_PULSE_KEY_CODE;
        }
    }
}
