package app.morphe.extension.swiftkey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/** Private activity reached through a native SwiftKey settings preference. */
public final class ToolbarSettingsActivity extends Activity {
    private final LinkedHashMap<Integer, Item> catalog = new LinkedHashMap<>();
    private List<Integer> selected;
    private boolean enabled;
    private boolean dark;
    private int textColor;
    private int mutedColor;
    private int cardColor;
    private LinearLayout rows;
    private TextView count;
    private Switch toggle;
    private SharedPreferences preferences;

    static final class Item {
        final int id;
        final String label;
        final int icon;
        Item(int id, String label, int icon) { this.id = id; this.label = label; this.icon = icon; }
    }

    @Override public void onCreate(Bundle state) {
        dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
            == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(state);
        preferences = ToolbarHooks.prefs(this);
        selected = ToolbarSelection.parse(state == null ? preferences.getString("order", "2,4,0")
            : state.getString("order", "2,4,0"));
        if (selected.isEmpty()) selected.add(0);
        enabled = state == null ? preferences.getBoolean("enabled", false) : state.getBoolean("enabled");
        loadCatalog();
        textColor = dark ? Color.rgb(237, 242, 245) : Color.rgb(26, 37, 44);
        mutedColor = dark ? Color.rgb(167, 182, 191) : Color.rgb(88, 106, 116);
        cardColor = dark ? Color.rgb(29, 39, 47) : Color.rgb(238, 244, 246);
        buildScreen();
    }

    @Override public void onSaveInstanceState(Bundle state) {
        state.putString("order", ToolbarSelection.encode(selected));
        state.putBoolean("enabled", enabled);
        super.onSaveInstanceState(state);
    }

    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }
    private LinearLayout column() {
        LinearLayout view = new LinearLayout(this);
        view.setOrientation(LinearLayout.VERTICAL);
        return view;
    }
    private TextView text(String label, int size, boolean strong) {
        TextView view = new TextView(this);
        view.setText(label); view.setTextSize(size); view.setTextColor(textColor);
        if (strong) view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        view.setPadding(0, dp(8), 0, dp(8));
        return view;
    }
    private Button button(String label, View.OnClickListener click) {
        Button button = new Button(this); button.setText(label); button.setAllCaps(false);
        button.setMinHeight(dp(48)); button.setOnClickListener(click);
        return button;
    }

    private void buildScreen() {
        LinearLayout root = column();
        root.setBackgroundColor(dark ? Color.rgb(16, 24, 31) : Color.WHITE);
        root.setPadding(dp(20), 0, dp(20), 0);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(dp(20) + insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                dp(20) + insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        LinearLayout header = new LinearLayout(this); header.setGravity(Gravity.CENTER_VERTICAL);
        Button back = button("‹", view -> finish()); back.setContentDescription("Voltar");
        header.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        header.addView(text("Atalhos da barra", 21, true), new LinearLayout.LayoutParams(0, -2, 1));
        root.addView(header);

        ScrollView scroll = new ScrollView(this); scroll.setFillViewport(true);
        LinearLayout body = column();
        TextView intro = text("Selecione apenas os itens que deseja mostrar. Você pode deixar menos de seis atalhos.", 15, false);
        intro.setTextColor(mutedColor); body.addView(intro);
        toggle = new Switch(this); toggle.setText("Usar minha toolbar"); toggle.setTextSize(17);
        toggle.setTextColor(textColor); toggle.setMinHeight(dp(56)); toggle.setChecked(enabled);
        toggle.setOnCheckedChangeListener((button, checked) -> enabled = checked);
        body.addView(toggle);
        count = text("", 14, true); body.addView(count);
        TextView help = text("Use as setas para ordenar. Itens ocultos ou sem espaço continuam em Mais opções.", 14, false);
        help.setTextColor(mutedColor); body.addView(help);
        rows = column(); body.addView(rows);
        TextView fixed = text("Mais opções permanece acessível. Mantenha pelo menos um atalho selecionado.", 13, false);
        fixed.setTextColor(mutedColor); body.addView(fixed);
        scroll.addView(body); root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        LinearLayout footer = column();
        footer.addView(button("Salvar alterações", view -> save()));
        footer.addView(button("Restaurar padrão do SwiftKey", view -> new AlertDialog.Builder(this)
            .setTitle("Restaurar toolbar?")
            .setMessage("O SwiftKey volta a controlar os atalhos e a ordem da barra.")
            .setNegativeButton("Cancelar", null)
            .setPositiveButton("Restaurar", (dialog, which) -> {
                preferences.edit().remove("order").putBoolean("enabled", false).apply();
                ToolbarHooks.refresh(); finish();
            }).show()));
        root.addView(footer); setContentView(root); root.requestApplyInsets();
        renderRows();
    }

    private void renderRows() {
        rows.removeAllViews();
        count.setText(selected.size() + (selected.size() == 1 ? " atalho + Mais opções" : " atalhos + Mais opções"));
        rows.addView(text("Na sua toolbar", 16, true));
        for (int i = 0; i < selected.size(); i++) {
            Item item = catalog.get(selected.get(i));
            if (item != null) rows.addView(itemRow(item, i));
        }
        rows.addView(text("Outros atalhos", 16, true));
        for (Item item : catalog.values()) if (!selected.contains(item.id)) rows.addView(itemRow(item, -1));
    }

    private LinearLayout itemRow(Item item, int position) {
        LinearLayout row = new LinearLayout(this); row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackgroundColor(cardColor);
        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(-1, -2);
        rowParams.bottomMargin = dp(6); row.setLayoutParams(rowParams);
        CheckBox check = new CheckBox(this); check.setChecked(position >= 0);
        check.setContentDescription((position >= 0 ? "Ocultar " : "Mostrar ") + item.label);
        row.addView(check, new LinearLayout.LayoutParams(dp(48), dp(56)));
        ImageView icon = new ImageView(this);
        try { if (item.icon != 0) icon.setImageResource(item.icon); }
        catch (android.content.res.Resources.NotFoundException ignored) { /* Old descriptor after an app update. */ }
        icon.setColorFilter(textColor); icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(icon, new LinearLayout.LayoutParams(dp(24), dp(24)));
        TextView label = text(item.label, 15, false); label.setPadding(dp(10), dp(8), dp(4), dp(8));
        row.addView(label, new LinearLayout.LayoutParams(0, -2, 1));
        label.setOnClickListener(view -> check.performClick());
        check.setOnCheckedChangeListener((button, checked) -> {
            if (checked) { if (!selected.contains(item.id)) selected.add(item.id); }
            else {
                if (selected.size() == 1) {
                    check.setChecked(true);
                    Toast.makeText(this, "Mantenha pelo menos um atalho.", Toast.LENGTH_SHORT).show();
                    return;
                }
                selected.remove(Integer.valueOf(item.id));
            }
            toggle.setChecked(true); renderRows();
        });
        if (position >= 0) {
            Button up = button("↑", view -> move(position, -1));
            up.setContentDescription("Mover " + item.label + " para antes"); up.setEnabled(position > 0);
            Button down = button("↓", view -> move(position, 1));
            down.setContentDescription("Mover " + item.label + " para depois"); down.setEnabled(position < selected.size() - 1);
            row.addView(up, new LinearLayout.LayoutParams(dp(48), dp(48)));
            row.addView(down, new LinearLayout.LayoutParams(dp(48), dp(48)));
        }
        return row;
    }

    private void move(int position, int offset) {
        int target = position + offset;
        if (target < 0 || target >= selected.size()) return;
        Integer id = selected.remove(position); selected.add(target, id);
        toggle.setChecked(true); renderRows();
    }
    private void save() {
        preferences.edit().putString("order", ToolbarSelection.encode(selected)).putBoolean("enabled", enabled).apply();
        ToolbarHooks.refresh(); Toast.makeText(this, "Toolbar salva", Toast.LENGTH_SHORT).show(); finish();
    }

    private void loadCatalog() {
        // Fallbacks make the editor usable before the keyboard is opened once.
        add(0, "Configurações", "ic_settings"); add(1, "Temas", "ic_themes");
        add(2, "Área de transferência", "ic_clipboard"); add(3, "Emoji", "ic_emoji_tab");
        add(4, "GIF", "ic_gif_unselected"); add(5, "Figurinhas", "ic_stickers");
        add(10, "Tradutor", "ic_translator"); add(14, "Idiomas e layouts", "ic_layouts");
        add(15, "Redimensionar", "ic_resize"); add(17, "Dicas", "ic_info_outline");
        add(20, "Modos", "ic_mode_switcher"); add(21, "Anônimo", "ic_incognito_unselected");
        add(22, "Autocorreção", "ic_autocorrect_unselected"); add(23, "Conta", "ic_account");
        add(25, "Digitação por voz", "ic_voice_typing"); add(29, "Copilot", "ic_copilot_unselected");
        add(36, "Editor", "ic_editor_unselected"); add(37, "Criador de imagens", "ic_bing_image_create");
        add(40, "Compartilhar", "ic_share"); add(43, "Trocar idioma", "ic_home_languages");
        add(44, "Mídia", "ic_sticker_sparkle"); add(45, "Rewards", "reward"); add(47, "Busca", "ic_search");
        try {
            JSONArray saved = new JSONArray(preferences.getString("catalog", "[]"));
            for (int i = 0; i < saved.length(); i++) {
                JSONObject item = saved.getJSONObject(i);
                int id = item.getInt("id");
                if (id != ToolbarSelection.MORE) catalog.put(id, new Item(id, item.getString("label"), item.optInt("icon")));
            }
        } catch (org.json.JSONException ignored) { /* Use native resource fallbacks. */ }
        // Keep an unknown saved entry visible so the user can remove it.
        for (int id : selected) if (!catalog.containsKey(id)) catalog.put(id, new Item(id, "Atalho " + id, 0));
    }
    private void add(int id, String label, String icon) {
        catalog.put(id, new Item(id, label, getResources().getIdentifier(icon, "drawable", getPackageName())));
    }
}
