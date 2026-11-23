package app.template.extension.aare;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.ContactsContract;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.telecom.TelecomManager;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * AARE's own voice assistant, for the steering-wheel voice button and the rail's microphone: it
 * listens on the car screen (a card over the map), understands a set of driving commands in
 * Italian and English, runs them with AARE's car tools (the ones AARE gives assistants such as
 * Lapin) and answers aloud. Anything else goes to the phone's assistant (Google), on the phone.
 *
 * Commands: navigate ("portami a…"), music (pausa, avanti, indietro, riprendi), messages ("leggi i
 * messaggi", "rispondi a Marco che…"), calls ("chiama Anna"), open an app ("apri Spotify"), the
 * time and date, the trip ("quanto manca?"), the phone's battery, dark or light screen.
 *
 * Runs on the main thread; works on AARE's objects through reflection, like VoiceReply.
 */
@SuppressWarnings("unused")
public final class AareAssistant {
    private static final String TAG = "AareAssistant";
    private static final Handler main = new Handler(Looper.getMainLooper());

    private enum State { IDLE, COMMAND, CONFIRM, DICTATE }

    private static WeakReference<Object> runtime = new WeakReference<>(null);
    private static State state = State.IDLE;
    private static Runnable onYes;
    private static Consumer<String> onDictated;
    private static String dictationTitle = "";

    private static SpeechRecognizer recognizer;
    /** After an immediate error: the network recognizer and the phone's language tag, once. */
    private static boolean fallbackRecognizer;
    private static boolean retried;
    private static boolean lastYesNo;
    private static CarMic.Handle carMic;
    private static AudioFocusRequest focus;
    private static Object card;
    private static long cardSeq;

    private AareAssistant() {
    }

    // region Hook

    /**
     * Called at the start of CarRuntime.assistant() (voice button, rail microphone): returns true
     * when AARE's assistant takes over, false to let AARE open the chosen assistant.
     */
    public static boolean onAssistant(Object carRuntime) {
        try {
            Context context = (Context) carRuntime.getClass().getMethod("getContext").invoke(carRuntime);
            if (!PatchSettings.isEnabled(context, PatchSettings.AARE_ASSISTANT)) return false;
            runtime = new WeakReference<>(carRuntime);
            if (state != State.IDLE) {
                // A second press while listening stops.
                finish(null);
                return true;
            }
            listenForCommand();
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "assistant", t);
            return false;
        }
    }

    // endregion

    // region Conversation

    private static void listenForCommand() {
        state = State.COMMAND;
        showCard(tr("Listening…", "Ti ascolto…", "Ich höre…"), action(tr("Cancel", "Annulla", "Abbrechen"), () -> finish(null)));
        listen(false);
    }

    private static void onCommand(String heard) {
        if (heard == null || heard.trim().isEmpty()) {
            finish(tr("I didn't catch that.", "Non ho capito.", "Das habe ich nicht verstanden."));
            return;
        }
        showCard(capitalize(heard.trim()));
        try {
            handle(heard.trim());
        } catch (Throwable t) {
            Log.w(TAG, "command", t);
            finish(tr("Something went wrong.", "Qualcosa è andato storto.", "Etwas ist schiefgelaufen."));
        }
    }

    /** Asks a yes/no question; [yes] runs on a spoken yes or the "Yes" button. */
    private static void confirm(String question, Runnable yes) {
        state = State.CONFIRM;
        onYes = yes;
        showCard(question,
                action(tr("Yes", "Sì", "Ja"), AareAssistant::confirmed),
                action(tr("No", "No", "Nein"), () -> finish(tr("OK.", "Va bene.", "In Ordnung."))));
        say(question, () -> {
            if (state == State.CONFIRM) listen(true);
        });
    }

    private static void confirmed() {
        if (state != State.CONFIRM || onYes == null) return;
        Runnable r = onYes;
        onYes = null;
        stopListening();
        state = State.IDLE;
        r.run();
    }

    /** Asks for free text (a message), then hands it to [then]. */
    private static void dictate(String title, String question, Consumer<String> then) {
        state = State.DICTATE;
        dictationTitle = title;
        onDictated = then;
        showCard(title + ": " + tr("speak now…", "parla ora…", "sprich jetzt…"), action(tr("Cancel", "Annulla", "Abbrechen"), () -> finish(null)));
        say(question, () -> {
            if (state == State.DICTATE) listen(false);
        });
    }

    /** Ends the conversation: says [answer] (if any) and leaves it on the card a few seconds. */
    private static void finish(String answer) {
        stopListening();
        state = State.IDLE;
        onYes = null;
        onDictated = null;
        if (answer == null) {
            removeCard();
            return;
        }
        showCard(answer);
        final Object shown = card;
        say(answer, () -> main.postDelayed(() -> {
            if (card == shown && state == State.IDLE) removeCard();
        }, 4000));
    }

    // endregion

    // region Understanding

    private static final String ARTICLES = "(?:a|ad|al|allo|alla|ai|agli|alle|all|in|nel|nello|nella|da|dal|dallo|dalla|verso|per|fino a|to|the|"
            + "nach|zu|zum|zur|ins|in die|in den|an den|an die|bis|bis zum|bis zur)";

    private static final Pattern REPLY_WITH_TEXT = Pattern.compile(
            "^(?:rispondi|rispondere|scrivi|scrivere|manda un messaggio|invia un messaggio|reply|answer|text|message|send a message|"
                    + "antworte|antworten|schreib|schreibe|schicke|sende)"
                    + "(?: a| ad| to| an)? (.+?)(?: che | dicendo | dicendogli | dicendole | di | that | saying | dass | das )(.+)$");
    private static final Pattern REPLY = Pattern.compile(
            "^(?:rispondi|rispondere|scrivi|scrivere|manda un messaggio|invia un messaggio|reply|answer|text|message|send a message|"
                    + "antworte|antworten|schreib|schreibe|schicke|sende)"
                    + "(?: a| ad| to| an)? (.+)$");
    /** German "ruf Anna an". */
    private static final Pattern CALL_DE = Pattern.compile("^(?:ruf|rufe)(?: bitte)? (.+) an$");
    private static final Pattern CALL = Pattern.compile("^(?:chiama|chiamare|telefona|telefonare|call|phone|ring|anrufen|telefoniere mit)(?: a| ad| to)? (.+)$");
    private static final Pattern NAVIGATE = Pattern.compile(
            "^(?:portami|accompagnami|guidami|naviga|navigare|navigazione|vai|andiamo|andare|indicazioni|percorso|"
                    + "take me|navigate|drive|go|directions|get me|"
                    + "bring mich|navigiere|navigation|fahr|fahre|fahren|route|wegbeschreibung|fuhre mich)(?: verso| fino| per| to)?(?: " + ARTICLES + ")? (.+)$");
    private static final Pattern OPEN = Pattern.compile("^(?:apri|aprire|mostra|mostrami|fammi vedere|open|show|offne|zeig|zeige)(?: me| mir)?(?: il| lo| la| l| i| gli| le| the| die| den| das)? (.+)$");

    private static void handle(String heard) throws Exception {
        String text = plain(heard);
        Matcher m;

        if (matchesAny(text, "annulla", "niente", "lascia stare", "lascia perdere", "nulla", "cancel", "never mind", "nothing",
                "abbrechen", "vergiss es", "nichts", "egal")) {
            finish(tr("OK.", "Va bene.", "In Ordnung."));
            return;
        }

        // Trip and time first: "prossima svolta" isn't the next song.
        if (containsAny(text, "quanto manca", "quando arrivo", "a che ora arrivo", "arrivo previsto", "prossima svolta",
                "how long", "when do we arrive", "when will we arrive", "next turn", "eta",
                "wie lange noch", "wann komme ich an", "wann kommen wir an", "ankunft", "nachste abbiegung", "wie weit noch")) {
            tripStatus();
            return;
        }
        if (containsAny(text, "che ore sono", "che ora e", "che ora sono", "what time", "the time", "wie spat", "wie viel uhr", "uhrzeit")) {
            finish(tr("It's ", "Sono le ", "Es ist ") + DateFormat.getTimeInstance(DateFormat.SHORT, locale()).format(new Date()) + ".");
            return;
        }
        if (containsAny(text, "che giorno", "che data", "quanti ne abbiamo", "what day", "what date", "the date",
                "welcher tag", "welches datum", "der wievielte", "datum")) {
            finish(capitalize(DateFormat.getDateInstance(DateFormat.FULL, locale()).format(new Date())) + ".");
            return;
        }
        if (containsAny(text, "batteria", "battery", "akku", "batterie")) {
            batteryStatus();
            return;
        }

        if ((m = REPLY_WITH_TEXT.matcher(text)).matches()) {
            replyTo(m.group(1), original(heard, m.group(2)));
            return;
        }
        if (containsAny(text, "messaggi", "messaggio", "messages", "message", "nachrichten", "nachricht") && !text.startsWith("rispondi")
                && !text.startsWith("scrivi") && !text.startsWith("reply") && !text.startsWith("antworte")
                && !text.startsWith("schreib")) {
            readMessages();
            return;
        }
        if ((m = REPLY.matcher(text)).matches()) {
            // "Schreib Marco ich komme später", "scrivi a Marco arrivo tardi": the name, then the message.
            String[] words = m.group(1).split(" ");
            if (words.length >= 3) {
                String rest = m.group(1).substring(words[0].length() + 1);
                replyTo(words[0], original(heard, rest));
            } else {
                replyTo(m.group(1), null);
            }
            return;
        }
        if ((m = CALL_DE.matcher(text)).matches() || (m = CALL.matcher(text)).matches()) {
            call(m.group(1).replaceFirst("^(?:il|lo|la|l|mio|mia|my|the|meine|meinen|die|den) ", ""));
            return;
        }

        String media = mediaAction(text);
        if (media != null) {
            JSONObject r = tool("car_media", new JSONObject().put("action", media));
            finish(r.optBoolean("ok") ? null : error(r));
            if (r.optBoolean("ok")) removeCard();
            return;
        }

        if (containsAny(text, "modalita notte", "tema scuro", "schermo scuro", "modalita scura", "dark mode", "night mode",
                "nachtmodus", "dunkelmodus", "dunkler modus")) {
            display("dark");
            return;
        }
        if (containsAny(text, "modalita giorno", "tema chiaro", "schermo chiaro", "modalita chiara", "light mode", "day mode",
                "tagmodus", "heller modus")) {
            display("light");
            return;
        }
        if (matchesAny(text, "home", "mappa", "schermata principale", "pagina iniziale", "torna alla mappa", "map", "home screen",
                "karte", "startseite", "zur karte")) {
            open("home");
            return;
        }

        if ((m = NAVIGATE.matcher(text)).matches()) {
            navigate(original(heard, m.group(1)));
            return;
        }
        if ((m = OPEN.matcher(text)).matches()) {
            open(m.group(1));
            return;
        }

        askGoogle(heard);
    }

    private static String mediaAction(String text) {
        if (text.split(" ").length > 5) return null;
        if (containsAny(text, "pausa", "metti in pausa", "ferma la musica", "stop musica", "silenzio", "pause", "stop the music",
                "musik aus", "musik stoppen", "anhalten") || matchesAny(text, "stop", "ferma", "stopp")) return "pause";
        if (containsAny(text, "prossima", "successiva", "canzone dopo", "salta", "next", "skip", "nachster", "nachstes", "nachste",
                "uberspringen") || matchesAny(text, "avanti", "weiter")) return "next";
        if (containsAny(text, "precedente", "canzone prima", "previous", "go back", "vorheriger", "vorheriges", "vorherige")
                || matchesAny(text, "indietro", "back", "zuruck")) return "previous";
        if (containsAny(text, "riprendi", "continua", "riproduci", "metti la musica", "fai partire", "musica", "play", "resume", "music",
                "abspielen", "spiel", "spiele", "musik", "fortsetzen")) return "play";
        return null;
    }

    // endregion

    // region Actions

    private static void navigate(String destination) throws Exception {
        JSONObject r = tool("car_navigate", new JSONObject().put("destination", destination));
        finish(r.optBoolean("ok") ? tr("Looking for " + destination + ".", "Cerco " + destination + ".", "Ich suche " + destination + ".") : error(r));
    }

    private static void open(String what) throws Exception {
        JSONObject r = tool("car_open", new JSONObject().put("what", what));
        if (r.optBoolean("ok")) finish(null);
        else finish(tr("I can't find " + what + " in the car.", "Non trovo " + what + " in auto.", "Ich finde " + what + " nicht im Auto."));
    }

    private static void display(String mode) throws Exception {
        JSONObject r = tool("car_display", new JSONObject().put("mode", mode));
        finish(r.optBoolean("ok") ? null : error(r));
    }

    private static void tripStatus() throws Exception {
        JSONObject s = tool("car_status", new JSONObject());
        JSONObject nav = s.optJSONObject("navigation");
        if (nav == null) {
            finish(tr("No navigation is running.", "Nessuna navigazione in corso.", "Keine Navigation aktiv."));
            return;
        }
        StringBuilder b = new StringBuilder();
        String next = nav.optString("next");
        String trip = nav.optString("trip");
        if (!next.isEmpty()) b.append(next).append(". ");
        if (!trip.isEmpty()) b.append(trip).append('.');
        finish(b.length() > 0 ? b.toString() : tr("Navigation is running.", "La navigazione è in corso.", "Die Navigation läuft."));
    }

    private static void batteryStatus() throws Exception {
        JSONObject phone = tool("car_status", new JSONObject()).optJSONObject("phone");
        if (phone == null) {
            finish(tr("I can't read the battery.", "Non riesco a leggere la batteria.", "Ich kann den Akku nicht lesen."));
            return;
        }
        int pct = phone.optInt("battery_percent", -1);
        boolean charging = phone.optBoolean("charging");
        finish(tr("The phone is at " + pct + "%" + (charging ? ", charging." : "."), "Il telefono è al " + pct + "%" + (charging ? ", in carica." : "."), "Das Telefon hat " + pct + "%" + (charging ? ", lädt." : ".")));
    }

    private static void readMessages() throws Exception {
        JSONObject r = tool("car_messages", new JSONObject());
        if (r.has("error")) {
            finish(error(r));
            return;
        }
        JSONArray list = r.optJSONArray("conversations");
        if (list == null || list.length() == 0) {
            finish(tr("No new messages.", "Nessun messaggio nuovo.", "Keine neuen Nachrichten."));
            return;
        }
        StringBuilder b = new StringBuilder();
        int n = Math.min(3, list.length());
        for (int i = 0; i < n; i++) {
            JSONObject c = list.getJSONObject(i);
            JSONArray msgs = c.optJSONArray("messages");
            String last = msgs != null && msgs.length() > 0 ? msgs.optString(msgs.length() - 1) : "";
            b.append(c.optString("conversation")).append(", ").append(c.optString("app")).append(": ")
                    .append(stripSender(last, c.optString("conversation"))).append(". ");
        }
        JSONObject first = list.getJSONObject(0);
        String who = first.optString("conversation");
        showCard(b.toString().trim());
        String intro = list.length() == 1 ? "" : tr(list.length() + " conversations. ", list.length() + " conversazioni. ", list.length() + " Unterhaltungen. ");
        if (first.optBoolean("can_reply")) {
            say(intro + b, () -> {
                if (state == State.IDLE || state == State.COMMAND) {
                    confirm(tr("Reply to " + who + "?", "Vuoi rispondere a " + who + "?", "Möchtest du " + who + " antworten?"), () -> replyTo(who, null));
                }
            });
            state = State.IDLE;
        } else {
            finish(intro + b);
        }
    }

    private static void replyTo(String who, String message) {
        if (message == null || message.trim().isEmpty()) {
            dictate(who, tr("What should I write to " + who + "?", "Cosa vuoi scrivere a " + who + "?", "Was möchtest du " + who + " schreiben?"),
                    text -> replyTo(who, text));
            return;
        }
        String m = capitalize(message.trim());
        confirm(tr("To " + who + ": " + m + ". Send it?", "A " + who + ": " + m + ". Lo invio?", "An " + who + ": " + m + ". Senden?"), () -> {
            try {
                JSONObject r = tool("car_reply", new JSONObject().put("conversation", who).put("message", m));
                finish(r.optBoolean("ok") ? tr("Sent.", "Inviato.", "Gesendet.") : error(r));
            } catch (Throwable t) {
                Log.w(TAG, "reply", t);
                finish(tr("The message could not be sent.", "Non sono riuscito a inviare il messaggio.", "Die Nachricht konnte nicht gesendet werden."));
            }
        });
    }

    private static void call(String who) {
        Context context = context();
        if (context == null) return;
        if (context.checkSelfPermission(Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED
                || context.checkSelfPermission(Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
            finish(tr("Allow AARE contacts and calls first.", "Prima concedi ad AARE contatti e telefono.", "Erlaube AARE zuerst Kontakte und Telefon."));
            return;
        }
        Map<String, String> found = new LinkedHashMap<>();
        String[] projection = {ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME, ContactsContract.CommonDataKinds.Phone.NUMBER,
                ContactsContract.CommonDataKinds.Phone.IS_PRIMARY};
        try (Cursor c = context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, projection,
                ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME + " LIKE ?", new String[]{"%" + who + "%"},
                ContactsContract.CommonDataKinds.Phone.IS_PRIMARY + " DESC")) {
            while (c != null && c.moveToNext()) {
                String name = c.getString(0);
                if (!found.containsKey(name)) found.put(name, c.getString(1));
            }
        } catch (Throwable t) {
            Log.w(TAG, "contacts", t);
        }
        if (found.isEmpty()) {
            finish(tr("I can't find " + who + " in your contacts.", "Non trovo " + who + " nei contatti.", "Ich finde " + who + " nicht in den Kontakten."));
            return;
        }
        String name = null;
        for (String n : found.keySet()) if (plain(n).equals(plain(who))) name = n;
        if (name == null && found.size() > 1) {
            List<String> names = new ArrayList<>(found.keySet());
            finish(tr("Which one? ", "Quale? ", "Welche? ") + String.join(", ", names.subList(0, Math.min(3, names.size()))) + ".");
            return;
        }
        if (name == null) name = found.keySet().iterator().next();
        final String contact = name;
        final String number = found.get(name);
        confirm(tr("Call " + contact + "?", "Chiamo " + contact + "?", "Soll ich " + contact + " anrufen?"), () -> {
            try {
                TelecomManager telecom = context.getSystemService(TelecomManager.class);
                telecom.placeCall(Uri.fromParts("tel", number, null), new Bundle());
                finish(null);
            } catch (Throwable t) {
                Log.w(TAG, "call", t);
                finish(tr("I couldn't start the call.", "Non sono riuscito a chiamare.", "Der Anruf hat nicht geklappt."));
            }
        });
    }

    /** Anything else: the phone's own assistant (Google), on the phone; the answer is heard in the car. */
    private static void askGoogle(String heard) {
        Context context = context();
        try {
            Class<?> assistants = Class.forName("net.prototux.aare.host.Assistants", false, AareAssistant.class.getClassLoader());
            Object a = assistants.getField("INSTANCE").get(null);
            String pkg = (String) assistants.getMethod("phoneDefault", Context.class).invoke(a, context);
            if (pkg != null && (Boolean) assistants.getMethod("startOnPhone", Context.class, String.class).invoke(a, context, pkg)) {
                finish(tr("Ask the phone's assistant: it's listening on the phone.", "Chiedilo all'assistente del telefono: ti ascolta sul telefono.", "Frag den Assistenten des Telefons: er hört auf dem Telefon zu."));
                return;
            }
        } catch (Throwable t) {
            Log.w(TAG, "phone assistant", t);
        }
        finish(tr("I can't do that yet.", "Questo non lo so ancora fare.", "Das kann ich noch nicht."));
    }

    // endregion

    // region Car tools

    private static JSONObject tool(String name, JSONObject args) throws Exception {
        Object r = runtime.get();
        if (r == null) return new JSONObject().put("ok", false).put("error", "no car");
        Class<?> tools = Class.forName("net.prototux.aare.host.CarTools", false, AareAssistant.class.getClassLoader());
        Object instance = tools.getField("INSTANCE").get(null);
        Method run = tools.getMethod("run", r.getClass(), String.class, JSONObject.class);
        return (JSONObject) run.invoke(instance, r, name, args);
    }

    private static String error(JSONObject r) {
        String e = r.optString("error");
        if (e.contains("no navigation app")) return tr("There's no navigation app in the car.", "Non c'è un navigatore in auto.", "Im Auto gibt es keine Navigations-App.");
        if (e.contains("notification access")) return tr("AARE needs notification access.", "AARE ha bisogno dell'accesso alle notifiche.", "AARE braucht Zugriff auf die Benachrichtigungen.");
        if (e.contains("doesn't allow replies")) return tr("That app doesn't allow replies.", "Quell'app non permette di rispondere.", "Diese App erlaubt keine Antworten.");
        if (e.startsWith("no conversation") || e.contains("no conversation")) return tr("I can't find that conversation among the messages.", "Non trovo quella conversazione tra i messaggi.", "Ich finde diese Unterhaltung nicht.");
        return tr("That didn't work.", "Non ha funzionato.", "Das hat nicht geklappt.");
    }

    // endregion

    // region Speech recognition

    private static void listen(boolean yesNo) {
        Context context = context();
        if (context == null) return;
        try {
            if (recognizer == null) {
                boolean onDevice = !fallbackRecognizer && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                        && SpeechRecognizer.isOnDeviceRecognitionAvailable(context);
                recognizer = onDevice ? SpeechRecognizer.createOnDeviceSpeechRecognizer(context)
                        : SpeechRecognizer.createSpeechRecognizer(context);
            }
            final State expected = state;
            recognizer.setRecognitionListener(new Listener(expected));
            Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
                    .putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
                    .putExtra(RecognizerIntent.EXTRA_LANGUAGE, fallbackRecognizer && "auto".equals(PatchSettings.assistantLanguage())
                            ? Locale.getDefault().toLanguageTag() : locale().toLanguageTag())
                    .putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true)
                    .putExtra(RecognizerIntent.EXTRA_PREFER_OFFLINE, true)
                    .putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1);
            if (expected == State.DICTATE) {
                intent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_COMPLETE_SILENCE_LENGTH_MILLIS, 2000L)
                        .putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS, 2000L);
            }
            requestFocus(context);
            closeCarMic();
            if (CarMic.enabled(context) && !fallbackRecognizer) {
                carMic = CarMic.attach(runtime.get(), intent, yesNo ? 1000 : state == State.DICTATE ? 2000 : 1500);
            }
            lastYesNo = yesNo;
            recognizer.startListening(intent);
        } catch (Throwable t) {
            Log.w(TAG, "listen", t);
            releaseFocus();
            finish(tr("Voice input isn't available.", "Il riconoscimento vocale non è disponibile.", "Spracherkennung ist nicht verfügbar."));
        }
    }

    private static void stopListening() {
        try {
            if (recognizer != null) recognizer.cancel();
        } catch (Throwable ignored) {
        }
        releaseFocus();
    }

    private static void closeCarMic() {
        if (carMic != null) {
            carMic.close();
            carMic = null;
        }
    }

    private static final class Listener implements RecognitionListener {
        private final State expected;

        Listener(State expected) {
            this.expected = expected;
        }

        @Override
        public void onReadyForSpeech(Bundle params) {
        }

        @Override
        public void onBeginningOfSpeech() {
        }

        @Override
        public void onRmsChanged(float rmsdB) {
        }

        @Override
        public void onBufferReceived(byte[] buffer) {
        }

        @Override
        public void onEndOfSpeech() {
        }

        @Override
        public void onError(int error) {
            releaseFocus();
            if (state != expected) return;
            Log.i(TAG, "recognition error " + error);
            // Busy, client, server or language errors right away: once more with the other recognizer
            // (on-device / Google's), without the car's microphone.
            boolean early = error == SpeechRecognizer.ERROR_CLIENT || error == SpeechRecognizer.ERROR_RECOGNIZER_BUSY
                    || error == SpeechRecognizer.ERROR_SERVER || error == 11 /* server disconnected */
                    || error == 12 /* language not supported */ || error == 13 /* language unavailable */
                    || error == SpeechRecognizer.ERROR_AUDIO || error == SpeechRecognizer.ERROR_NO_MATCH;
            if (early && !retried) {
                retried = true;
                fallbackRecognizer = !fallbackRecognizer;
                try {
                    if (recognizer != null) recognizer.destroy();
                } catch (Throwable ignored) {
                }
                recognizer = null;
                main.postDelayed(() -> {
                    if (state == expected) listen(lastYesNo);
                }, 300);
                return;
            }
            retried = false;
            if (expected == State.CONFIRM) return; // the Yes and No buttons stay
            finish(error == SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS
                    ? tr("Allow AARE to use the microphone.", "Concedi ad AARE il microfono.", "Erlaube AARE das Mikrofon.")
                    : error == SpeechRecognizer.ERROR_NO_MATCH || error == SpeechRecognizer.ERROR_SPEECH_TIMEOUT
                    ? tr("I didn't catch that (" + error + ").", "Non ho capito (" + error + ").",
                    "Das habe ich nicht verstanden (" + error + ").")
                    : tr("Voice input error " + error + ".", "Errore del riconoscimento vocale " + error + ".",
                    "Fehler der Spracherkennung " + error + "."));
        }

        @Override
        public void onResults(Bundle results) {
            releaseFocus();
            retried = false;
            if (state != expected) return;
            String text = first(results);
            switch (expected) {
                case COMMAND:
                    state = State.IDLE;
                    onCommand(text);
                    break;
                case CONFIRM:
                    Boolean answer = VoiceReply.yesOrNo(text);
                    if (Boolean.TRUE.equals(answer)) confirmed();
                    else if (Boolean.FALSE.equals(answer)) finish(tr("OK.", "Va bene.", "In Ordnung."));
                    break;
                case DICTATE:
                    Consumer<String> then = onDictated;
                    onDictated = null;
                    state = State.IDLE;
                    if (text == null || text.trim().isEmpty() || then == null) finish(tr("I didn't catch that.", "Non ho capito.", "Das habe ich nicht verstanden."));
                    else then.accept(text.trim());
                    break;
                default:
                    break;
            }
        }

        @Override
        public void onPartialResults(Bundle partial) {
            if (state != expected || expected == State.CONFIRM) return;
            if (cardClosed()) {
                finish(null);
                return;
            }
            String text = first(partial);
            if (text == null || text.trim().isEmpty()) return;
            String shown = capitalize(text.trim()) + " …";
            if (expected == State.DICTATE) shown = dictationTitle + ": " + shown;
            showCard(shown, action(tr("Cancel", "Annulla", "Abbrechen"), () -> finish(null)));
        }

        @Override
        public void onEvent(int eventType, Bundle params) {
        }

        private static String first(Bundle b) {
            if (b == null) return null;
            ArrayList<String> list = b.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
            return list == null || list.isEmpty() ? null : list.get(0);
        }
    }

    /** Pauses the music while the assistant listens. */
    private static void requestFocus(Context context) {
        if (focus != null) return;
        AudioManager audio = context.getSystemService(AudioManager.class);
        if (audio == null) return;
        focus = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE)
                .setAudioAttributes(new AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ASSISTANT)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                        .build())
                .build();
        audio.requestAudioFocus(focus);
    }

    private static void releaseFocus() {
        closeCarMic();
        if (focus == null) return;
        Context context = context();
        AudioManager audio = context == null ? null : context.getSystemService(AudioManager.class);
        if (audio != null) audio.abandonAudioFocusRequest(focus);
        focus = null;
    }

    // endregion

    // region Card on the car screen (same mechanism as VoiceReply's)

    private static Pair<String, Function0<Unit>> action(String label, Runnable run) {
        return new Pair<>(label, () -> {
            main.post(run);
            return Unit.INSTANCE;
        });
    }

    @SafeVarargs
    private static void showCard(String text, Pair<String, Function0<Unit>>... actions) {
        try {
            List<Object> notices = notices();
            if (notices == null) return;
            Object old = card;
            String key = old != null && notices.contains(old) ? (String) call(old, "getKey") : "aare-assistant-" + (++cardSeq);
            Class<?> noticeClass = Class.forName("net.prototux.aare.ui.car.CarNotice", false, AareAssistant.class.getClassLoader());
            Constructor<?> make = noticeClass.getConstructor(String.class, String.class, String.class, Bitmap.class,
                    List.class, long.class, boolean.class);
            Object n = make.newInstance(key, tr("Assistant", "Assistente", "Assistent"), text, null, Arrays.asList(actions),
                    System.currentTimeMillis(), false);
            VoiceReply.sticky.add(n);
            int at = old == null ? -1 : notices.indexOf(old);
            if (at >= 0) notices.set(at, n);
            else notices.add(0, n);
            if (old != null) VoiceReply.sticky.remove(old);
            card = n;
        } catch (Throwable t) {
            Log.w(TAG, "showCard", t);
        }
    }

    private static void removeCard() {
        Object old = card;
        card = null;
        if (old == null) return;
        VoiceReply.sticky.remove(old);
        try {
            List<Object> notices = notices();
            if (notices != null) notices.remove(old);
        } catch (Throwable t) {
            Log.w(TAG, "removeCard", t);
        }
    }

    private static boolean cardClosed() {
        List<Object> notices = notices();
        return card == null || notices == null || !notices.contains(card);
    }

    @SuppressWarnings("unchecked")
    private static List<Object> notices() {
        Object r = runtime.get();
        if (r == null) return null;
        try {
            return (List<Object>) call(call(r, "getUi"), "getNotices");
        } catch (Throwable t) {
            return null;
        }
    }

    // endregion

    // region Helpers

    private static Object call(Object target, String method) throws Exception {
        return target.getClass().getMethod(method).invoke(target);
    }

    private static Context context() {
        try {
            Object r = runtime.get();
            return r == null ? null : (Context) call(r, "getContext");
        } catch (Throwable t) {
            return null;
        }
    }

    private static void say(String text, Runnable then) {
        Context c = context();
        if (c == null) {
            if (then != null) then.run();
            return;
        }
        VoiceNotes.Player.get(c).say(text, then, locale());
    }

    /** Lower case, no accents, no punctuation: for matching. */
    static String plain(String s) {
        return Normalizer.normalize(s.toLowerCase(Locale.ROOT).replace("ß", "ss"), Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .replaceAll("[^a-z0-9 ]", " ")
                .replaceAll("\\s+", " ")
                .trim();
    }

    /** The words of [heard] that [plainPart] (the end of plain(heard)) covers, with their accents and capitals. */
    private static String original(String heard, String plainPart) {
        String[] words = heard.trim().split("\\s+");
        int wanted = plainPart.isEmpty() ? 0 : plainPart.split(" ").length;
        int covered = 0;
        int start = words.length;
        // From the end, whole original words, each worth as many plain words as it gives ("all'ospedale" = 2).
        while (start > 0 && covered < wanted) {
            start--;
            String p = plain(words[start]);
            covered += p.isEmpty() ? 0 : p.split(" ").length;
        }
        if (covered != wanted) return plainPart;
        StringBuilder b = new StringBuilder();
        for (int k = start; k < words.length; k++) b.append(k > start ? " " : "").append(words[k]);
        String out = b.toString().replaceAll("^[\\p{Punct}&&[^']]+|[\\p{Punct}]+$", "");
        // "all'ospedale": the article belongs to the command, not to the place.
        if (start < words.length && plain(words[start]).contains(" ")) {
            int apostrophe = out.indexOf('\'');
            String before = apostrophe > 0 ? plain(out.substring(0, apostrophe)) : "";
            if (before.matches("l|all|dell|nell|sull|dall|un|d")) out = out.substring(apostrophe + 1);
        }
        return out.isEmpty() ? plainPart : out;
    }

    private static boolean containsAny(String text, String... parts) {
        String padded = " " + text + " ";
        for (String p : parts) if (padded.contains(" " + p + " ")) return true;
        return false;
    }

    private static boolean matchesAny(String text, String... options) {
        for (String o : options) if (text.equals(o)) return true;
        return false;
    }

    private static String stripSender(String line, String conversation) {
        int colon = line.indexOf(": ");
        return colon > 0 && colon < 40 ? line.substring(colon + 2) : line;
    }

    private static String capitalize(String s) {
        return s.isEmpty() ? s : s.substring(0, 1).toUpperCase(Locale.getDefault()) + s.substring(1);
    }

    /** The assistant's language: the one chosen in Settings, else the phone's (it, de or en). */
    static String lang() {
        String chosen = PatchSettings.assistantLanguage();
        if (!"auto".equals(chosen)) return chosen;
        String l = Locale.getDefault().getLanguage();
        return "it".equals(l) || "de".equals(l) ? l : "en";
    }

    static Locale locale() {
        switch (lang()) {
            case "it":
                return Locale.ITALY;
            case "de":
                return "de".equals(Locale.getDefault().getLanguage()) ? Locale.getDefault() : Locale.GERMANY;
            default:
                return "en".equals(Locale.getDefault().getLanguage()) ? Locale.getDefault() : Locale.US;
        }
    }

    private static String tr(String english, String italian, String german) {
        switch (lang()) {
            case "it":
                return italian;
            case "de":
                return german;
            default:
                return english;
        }
    }

    // endregion
}
