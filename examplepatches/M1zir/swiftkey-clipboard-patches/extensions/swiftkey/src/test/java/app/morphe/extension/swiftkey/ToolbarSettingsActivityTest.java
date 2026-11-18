package app.morphe.extension.swiftkey;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 35)
public class ToolbarSettingsActivityTest {
    private SharedPreferences prefs;
    @Before public void setup() {
        Application app = RuntimeEnvironment.getApplication();
        prefs = app.getSharedPreferences(ToolbarHooks.PREFS, Context.MODE_PRIVATE);
        prefs.edit().clear().putString("order", "2,4,0").apply();
    }
    private List<View> flatten(View view) {
        List<View> result = new ArrayList<>(); result.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) result.addAll(flatten(group.getChildAt(i)));
        }
        return result;
    }
    private View find(ToolbarSettingsActivity activity, String label) {
        return flatten(activity.findViewById(android.R.id.content)).stream()
            .filter(view -> view instanceof TextView && label.contentEquals(((TextView) view).getText()))
            .findFirst().orElseThrow();
    }
    @Test public void editorSavesUserSelectionInsideAppPreferences() {
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            ToolbarSettingsActivity activity = controller.get();
            CheckBox check = (CheckBox) flatten(activity.findViewById(android.R.id.content)).stream()
                .filter(view -> view instanceof CheckBox && "Ocultar GIF".contentEquals(view.getContentDescription()))
                .findFirst().orElseThrow();
            check.performClick();
            find(activity, "Salvar alterações").performClick();
            assertEquals("2,0", prefs.getString("order", "")); assertTrue(prefs.getBoolean("enabled", false));
        }
    }
    @Test public void selectionIsDraftUntilSaved() {
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            find(controller.get(), "Temas").performClick();
            assertEquals("2,4,0", prefs.getString("order", ""));
        }
    }
    @Test public void reorderingPersistsInTheChosenOrder() {
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            ToolbarSettingsActivity activity = controller.get();
            flatten(activity.findViewById(android.R.id.content)).stream()
                .filter(view -> "Mover Configurações para antes".equals(view.getContentDescription()))
                .findFirst().orElseThrow().performClick();
            find(activity, "Salvar alterações").performClick();
            assertEquals("2,0,4", prefs.getString("order", ""));
        }
    }
    @Test public void cannotRemoveLastShortcut() {
        prefs.edit().putString("order", "2").apply();
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            ToolbarSettingsActivity activity = controller.get();
            flatten(activity.findViewById(android.R.id.content)).stream()
                .filter(view -> "Ocultar Área de transferência".equals(view.getContentDescription()))
                .findFirst().orElseThrow().performClick();
            find(activity, "Salvar alterações").performClick();
            assertEquals("2", prefs.getString("order", ""));
        }
    }
    @Test public void restoringNativeToolbarRequiresExplicitConfirmation() {
        prefs.edit().putBoolean("enabled", true).apply();
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            find(controller.get(), "Restaurar padrão do SwiftKey").performClick();
            assertTrue(prefs.getBoolean("enabled", false));
            ShadowAlertDialog.getLatestAlertDialog().getButton(android.app.AlertDialog.BUTTON_POSITIVE).performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertFalse(prefs.getBoolean("enabled", true)); assertFalse(prefs.contains("order"));
        }
    }
    @Test public void nativeScreenMeasuresOnNarrowDisplay() {
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            View root = controller.get().findViewById(android.R.id.content);
            root.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 320, 640);
            Button save = (Button) find(controller.get(), "Salvar alterações");
            assertTrue(save.getMeasuredWidth() > 0); assertTrue(save.getMeasuredHeight() >= 48);
            assertTrue(save.getBottom() <= 640);
        }
    }
    @Test public void stockReorderEntryOpensVariableCountEditor() {
        Application app = RuntimeEnvironment.getApplication();
        View entry = new View(app);
        boolean[] originalOpened = {false};
        ToolbarHooks.bindEditor(entry, clicked -> originalOpened[0] = true);
        entry.performClick();
        Intent intent = org.robolectric.Shadows.shadowOf(app).getNextStartedActivity();
        assertNotNull(intent);
        assertEquals(ToolbarSettingsActivity.class.getName(), intent.getComponent().getClassName());
        assertTrue((intent.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertFalse(originalOpened[0]);
    }
    @Test public void userCanReduceSixNativeShortcutsToTwoWithoutRefilling() {
        prefs.edit().putString("order", "29,44,2,10,47,4").putBoolean("enabled", false).apply();
        try (var controller = Robolectric.buildActivity(ToolbarSettingsActivity.class).setup()) {
            ToolbarSettingsActivity activity = controller.get();
            for (String label : List.of("Copilot", "Mídia", "Tradutor", "Busca")) {
                flatten(activity.findViewById(android.R.id.content)).stream()
                    .filter(view -> ("Ocultar " + label).equals(view.getContentDescription()))
                    .findFirst().orElseThrow().performClick();
            }
            find(activity, "2 atalhos + Mais opções");
            find(activity, "Salvar alterações").performClick();
            assertEquals("2,4", prefs.getString("order", ""));
            assertTrue(prefs.getBoolean("enabled", false));
            java.util.LinkedHashMap<Integer, String> available = new java.util.LinkedHashMap<>();
            for (int id : List.of(29, 44, 2, 10, 47, 4, 16)) available.put(id, String.valueOf(id));
            assertEquals(List.of("2", "4", "16"), ToolbarSelection.choose(available,
                ToolbarSelection.parse(prefs.getString("order", "")), 7));
        }
    }
}
