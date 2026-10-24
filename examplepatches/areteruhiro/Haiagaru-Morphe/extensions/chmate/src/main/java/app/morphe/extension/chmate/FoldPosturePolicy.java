package app.morphe.extension.chmate;

/** Unknown is deliberate: a wide screen is not evidence of folding hardware. */
final class FoldPosturePolicy {
    static Boolean tablet(boolean foldingFeature, boolean verifiedFoldable, boolean multiWindow) {
        if (foldingFeature) return true;
        // A hinge can lie outside a split window. Do not misclassify that as a closed cover.
        if (!verifiedFoldable || multiWindow) return null;
        return false;
    }
    private FoldPosturePolicy() { }
}
