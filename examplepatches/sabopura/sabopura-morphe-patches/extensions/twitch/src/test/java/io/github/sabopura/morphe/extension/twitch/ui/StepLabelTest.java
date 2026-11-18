package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;

import java.util.Locale;

import org.junit.After;
import org.junit.Test;

/** TalkBack reaches a slider's step buttons on their own, so each has to name the value it changes. */
public class StepLabelTest {
    private final Locale before = Locale.getDefault();

    @After
    public void restore() {
        Locale.setDefault(before);
    }

    @Test
    public void englishNamesTheValue() {
        Locale.setDefault(Locale.ENGLISH);
        assertEquals("Decrease text size", Ui.stepLabel("Text size", false));
        assertEquals("Increase vibration length", Ui.stepLabel("Vibration length", true));
    }

    @Test
    public void japaneseNamesTheValue() {
        Locale.setDefault(Locale.JAPANESE);
        assertEquals("文字サイズを1下げる", Ui.stepLabel("文字サイズ", false));
        assertEquals("振動の長さを1上げる", Ui.stepLabel("振動の長さ", true));
    }
}
