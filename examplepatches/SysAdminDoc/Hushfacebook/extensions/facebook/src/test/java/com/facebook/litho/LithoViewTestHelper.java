package com.facebook.litho;

/** Stands in for Litho's test helper, whose name and viewToString Redex keeps. */
public final class LithoViewTestHelper {
    private LithoViewTestHelper() {
    }

    public static String viewToString(BaseMountingView view) {
        return view.description;
    }
}
