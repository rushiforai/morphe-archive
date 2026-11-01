package dev.jason.gboardpatches.extension.toprowswipe;

import dev.jason.gboardpatches.extension.toprowswipe.GboardTopRowSwipeSettings;

public final class QuickJsScriptEvaluator {
    public static final class Result {
        public final boolean success;
        public final boolean timedOut;
        public final boolean shouldCommit;
        public final String committedText;
        public final String errorMessage;

        private Result(GboardQuickJsFeature.EvaluationResult result) {
            this.success = result != null && result.success;
            this.timedOut = result != null && result.timedOut;
            this.shouldCommit = result != null && result.shouldCommit;
            this.committedText = result != null ? result.committedText : null;
            this.errorMessage = result != null ? result.errorMessage
                    : "QuickJS evaluation returned no result";
        }
    }

    private QuickJsScriptEvaluator() {
    }

    public static Result evaluate(String scriptBody, String input, long timeoutMs) {
        return evaluate(scriptBody, input, timeoutMs, "");
    }

    public static Result evaluate(String scriptBody, String input, long timeoutMs,
            String globalJavaScript) {
        return evaluate(scriptBody, input, timeoutMs, globalJavaScript,
                GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits());
    }

    public static Result evaluate(String scriptBody, String input, long timeoutMs,
            String globalJavaScript,
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits) {
        return new Result(GboardQuickJsFeature.evaluateScript(
                new GboardQuickJsFeature.QuickJsNgScriptRuntime(timeoutMs,
                        javaScriptRuntimeLimits),
                scriptBody,
                input,
                timeoutMs,
                globalJavaScript));
    }
}

