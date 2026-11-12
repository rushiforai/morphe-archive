package io.github.bryceaspringfield.morphe.extension.kick;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.InputType;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * KICK Extras' settings screen, opened from its own launcher icon (KICK has no Morphe settings screen): switches and
 * lists, saved when the screen closes. The app reads them within 2 seconds; the player's menu reads them at its
 * next opening.
 */
public final class KickSettingsActivity extends Activity {

    private final Map<String, Switch> switches = new LinkedHashMap<>();
    private final Map<String, EditText> lists = new LinkedHashMap<>();

    private static boolean es() {
        return Locale.getDefault().getLanguage().equals("es");
    }

    private static String t(String en, String es) {
        return es() ? es : en;
    }

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        SharedPreferences p = getSharedPreferences(Kick.PREFS, MODE_PRIVATE);
        int pad = (int) (16 * getResources().getDisplayMetrics().density);
        LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        col.setPadding(pad, pad, pad, pad);

        TextView title = new TextView(this);
        title.setText("KICK Extras");
        title.setTextSize(22);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        col.addView(title);

        header(col, t("Player", "Reproductor"));
        toggle(col, p, Kick.AUDIO_ONLY_OPTION, true, t("Audio only in the quality menu",
                "Solo audio en el menú de calidad"), t("Adds a choice which plays the stream's sound without its video.",
                "Añade una opción que reproduce el sonido de la emisión sin su vídeo."));

        header(col, t("Chat", "Chat"));
        toggle(col, p, Kick.HIDE_TOP_GIFTED, false, t("Hide the Top gifted shelf", "Ocultar la barra de Top regalos"),
                t("Removes the leaderboard of top gifters above the chat.", "Quita la clasificación de quienes más regalan, sobre el chat."));
        toggle(col, p, Kick.STATIC_TOP_GIFTED, false, t("Stop the Top gifted shelf rotating", "Detener la rotación de Top regalos"),
                t("Shows the shelf still, without cycling through its entries.", "Muestra la barra fija, sin pasar por sus entradas."));
        list(col, p, Kick.CHAT_HIDDEN_WORDS, t("Chat words to hide", "Palabras a ocultar en el chat"),
                t("One a line; \"quotes\" for whole words.", "Una por línea; \"comillas\" para palabras completas."));
        list(col, p, Kick.CHAT_HIDDEN_USERS, t("Chat users to hide", "Usuarios a ocultar en el chat"),
                t("One username a line.", "Un nombre de usuario por línea."));

        header(col, t("Streams and clips", "Emisiones y clips"));
        toggle(col, p, Kick.HIDE_RECORDINGS, false, t("Hide past stream recordings", "Ocultar grabaciones de emisiones pasadas"),
                t("Removes recordings of past streams (VODs) from Home, Browse, search, and channel pages; clips stay.",
                        "Quita las grabaciones de emisiones pasadas (VOD) de Inicio, Explorar, la búsqueda y los canales; los clips se quedan."));
        list(col, p, Kick.HIDDEN_WORDS, t("Title words to hide", "Palabras del título a ocultar"),
                t("Streams and clips whose title has one; one a line, \"quotes\" for whole words.",
                        "Emisiones y clips cuyo título la contiene; una por línea, \"comillas\" para palabras completas."));
        list(col, p, Kick.HIDDEN_CHANNELS, t("Channels to hide", "Canales a ocultar"),
                t("One channel name a line (the name in its link, kick.com/name).", "Un canal por línea (el nombre de su enlace, kick.com/nombre)."));
        list(col, p, Kick.HIDDEN_CATEGORIES, t("Categories to hide", "Categorías a ocultar"),
                t("One category a line, as KICK names it (e.g., Slots & Casino).", "Una categoría por línea, como la nombra KICK (p. ej., Slots & Casino)."));

        header(col, t("Other", "Otros"));
        toggle(col, p, Kick.DEBUG, false, t("Debug log", "Registro de depuración"),
                t("Writes what the extras do to the system log (tag KickExtras).", "Escribe lo que hacen los extras en el registro del sistema (etiqueta KickExtras)."));

        ScrollView scroll = new ScrollView(this);
        scroll.addView(col);
        setContentView(scroll);
    }

    private void header(LinearLayout col, String text) {
        TextView h = new TextView(this);
        h.setText(text);
        h.setTextSize(17);
        h.setTypeface(Typeface.DEFAULT_BOLD);
        h.setPadding(0, (int) (20 * getResources().getDisplayMetrics().density), 0, 4);
        col.addView(h);
    }

    private void toggle(LinearLayout col, SharedPreferences p, String key, boolean def, String label, String summary) {
        Switch s = new Switch(this);
        s.setText(label);
        s.setTextSize(16);
        s.setChecked(p.getBoolean(key, def));
        col.addView(s, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        note(col, summary);
        switches.put(key, s);
    }

    private void list(LinearLayout col, SharedPreferences p, String key, String label, String summary) {
        TextView l = new TextView(this);
        l.setText(label);
        l.setTextSize(16);
        l.setPadding(0, 12, 0, 0);
        col.addView(l);
        note(col, summary);
        EditText e = new EditText(this);
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        e.setMinLines(2);
        e.setText(p.getString(key, ""));
        col.addView(e, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        lists.put(key, e);
    }

    private void note(LinearLayout col, String text) {
        TextView n = new TextView(this);
        n.setText(text);
        n.setTextSize(13);
        n.setAlpha(0.7f);
        col.addView(n);
    }

    @Override
    protected void onPause() {
        super.onPause();
        SharedPreferences.Editor e = getSharedPreferences(Kick.PREFS, MODE_PRIVATE).edit();
        for (Map.Entry<String, Switch> s : switches.entrySet()) e.putBoolean(s.getKey(), s.getValue().isChecked());
        for (Map.Entry<String, EditText> l : lists.entrySet()) e.putString(l.getKey(), l.getValue().getText().toString().trim());
        e.apply();
    }
}
