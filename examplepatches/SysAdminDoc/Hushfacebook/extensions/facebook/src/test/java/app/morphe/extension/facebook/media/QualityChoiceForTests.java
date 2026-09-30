/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

/** What tests outside this package need of Default playback quality: one new video's first choice. */
public final class QualityChoiceForTests {
    private QualityChoiceForTests() {
    }

    /** One evaluator: the label waiting for its first choice, and its tracks' labels. */
    private static final class Evaluator {
        String preselected;
        final Object[] formats = {"240p", "720p", "1080p"};
    }

    /**
     * Builds an evaluator with the patch in the build and Up to 720p chosen, then makes its first
     * choice. True when that choice is the chosen quality rather than Facebook's own, which is the
     * switch changing what Facebook would have done.
     */
    public static boolean playsTheChosenQuality() {
        Boolean before = QualityChoice.inBuildForTests;
        PlaybackQuality chosen = QualityChoice.qualityForTests;
        QualityChoice.Evaluator access = QualityChoice.access;
        QualityChoice.inBuildForTests = Boolean.TRUE;
        QualityChoice.qualityForTests = PlaybackQuality.P720;
        QualityChoice.access = new QualityChoice.Evaluator() {
            @Override
            public String preselected(Object evaluator) {
                return ((Evaluator) evaluator).preselected;
            }

            @Override
            public void preselect(Object evaluator, String label) {
                ((Evaluator) evaluator).preselected = label;
            }

            @Override
            public Object[] formats(Object evaluator) {
                return ((Evaluator) evaluator).formats;
            }

            @Override
            public String label(Object format) {
                return (String) format;
            }
        };
        try {
            Evaluator evaluator = new Evaluator();
            QualityChoice.evaluatorBuilt(evaluator);
            return evaluator.preselected != null
                    && "720p".equals(QualityChoice.customQuality(evaluator, evaluator.preselected));
        } finally {
            QualityChoice.inBuildForTests = before;
            QualityChoice.qualityForTests = chosen;
            QualityChoice.access = access;
            QualityChoice.forget();
        }
    }
}
