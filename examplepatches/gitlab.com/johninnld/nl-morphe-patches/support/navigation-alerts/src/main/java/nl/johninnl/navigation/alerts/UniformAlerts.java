package nl.johninnl.navigation.alerts;

import android.os.Bundle;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * One alert language for every provider and receiver (owner decision, 11 November 2026).
 *
 * <p>Provider side ({@link WarningEndpoint}): an alert the provider shows but does not announce is announced
 * once per warning and stage (ahead / inside an average-speed control), so Waze and Flitsmeister alerts are
 * announced at the same moments. A provider announcement right after ours is not repeated.
 *
 * <p>Receiver side ({@link WarningScheduler}): the spoken text is our own phrase for the alert type, in the
 * receiving app's language (English, Dutch, German, French, Spanish, Italian or Portuguese, else English),
 * and the alert sound is the Flitsmeister sound for that type, read from the installed Flitsmeister app.
 */
public final class UniformAlerts {
    private UniformAlerts() {}
    public static final String[] LANGUAGES = {"en", "nl", "de", "fr", "es", "it", "pt"};
    /** A provider repeat later than this is a real repeat; earlier it duplicates our announcement. */
    static final long SAME_ANNOUNCEMENT_MS = 60_000;
    /** One report split into several (Waze lane closures, grouped reports): one announcement per type. */
    static final long SAME_TYPE_MS = 30_000;
    /** Flitsmeister may clear and re-show its control warning mid-zone; its stages are not announced again. */
    static final long ZONE_STAGE_MEMORY_MS = 15 * 60_000;
    static final java.util.Set<String> CHATTY = new java.util.HashSet<>(java.util.Arrays.asList("jam", "roadworks", "road_closed",
            "lane_closed", "hazard", "accident", "stopped_vehicle", "poor_road", "slippery", "animals"));
    static final long SYNTHETIC_INDEX_BASE = 1_000_000_000L;
    static final int POINT_TRIGGER_M = 800, ZONE_TRIGGER_M = 1000, JAM_TRIGGER_M = 1500;
    /** On in every app; protocol tests that check the providers' own wording switch it off. */
    public static volatile boolean enabled = true;

    // ---------------------------------------------------------------- phrases

    /**
     * Flitsmeister's own spoken wording (English, Dutch, German, French and Spanish string resources of
     * Flitsmeister 15.1.1; "Caution, %s" plus its alert name). Flitsmeister ships no Italian or Portuguese
     * alert text, so those two are translated here in the same style. Flitsmeister speaks no distance.
     */
    private static final Map<String, String[]> PHRASES = new LinkedHashMap<>();
    private static void phrase(String key, String en, String nl, String de, String fr, String es, String it, String pt) {
        PHRASES.put(key, new String[]{en, nl, de, fr, es, it, pt});
    }
    static {
        phrase("camera", "Speed cam", "Flitspaal", "Fester Blitzer", "Radar fixe", "Radar fijo", "Autovelox fisso", "Radar fixo");
        phrase("mobile_check", "Caution, speed trap", "Let op, flitser", "Achtung, Blitzer", "Attention, radar", "Atención, radar",
                "Attenzione, autovelox", "Atenção, radar");
        phrase("police", "Caution, police control", "Let op, controle", "Achtung, Kontrolle", "Attention, contrôle de police",
                "Atención, control", "Attenzione, controllo di polizia", "Atenção, operação stop");
        phrase("hotspot", "Speed trap hotspot", "Populaire flitslocatie", "Beliebter Blitzerstandort", "Localisation de radar populaire",
                "Lugar frecuentado por radares móviles", "Luogo frequente di autovelox", "Local frequente de radares");
        phrase("traffic_camera", "You are approaching a traffic camera", "Je nadert een verkeerscamera", "Sie nähern sich einer Verkehrskamera",
                "Vous vous approchez d'une caméra de circulation", "Te acercas a una cámara de tráfico",
                "Ti stai avvicinando a una telecamera del traffico", "Está a aproximar-se de uma câmara de trânsito");
        phrase("average_ahead", "Caution, average speed check", "Let op, trajectcontrole", "Achtung, Streckenkontrolle",
                "Attention, contrôle de trajet", "Atención, control de velocidad de tramo", "Attenzione, Tutor",
                "Atenção, controlo de velocidade média");
        phrase("average_start", "Average speed check", "Trajectcontrole", "Streckenkontrolle", "Contrôle de trajet",
                "Control de velocidad de tramo", "Tutor", "Controlo de velocidade média");
        phrase("average_exceeded", "You're driving too fast", "Je rijdt te hard!", "Du fährst zu schnell!", "Vous roulez trop vite !",
                "¡Vas demasiado rápido!", "Stai andando troppo veloce!", "Está a conduzir depressa demais!");
        phrase("jam", "Caution, traffic jam", "Let op, file", "Achtung, Stau", "Attention, embouteillage", "Atención, atasco",
                "Attenzione, coda", "Atenção, trânsito parado");
        phrase("roadworks", "Caution, road works", "Let op, werkzaamheden", "Achtung, Baustelle", "Attention, travaux", "Atención, obras",
                "Attenzione, lavori in corso", "Atenção, obras");
        phrase("road_closed", "Caution, road closed", "Let op, weg afgesloten", "Achtung, Straße gesperrt", "Attention, route fermée",
                "Atención, carretera cortada", "Attenzione, strada chiusa", "Atenção, estrada cortada");
        phrase("accident", "Caution, accident", "Let op, ongeval", "Achtung, Unfall", "Attention, accident", "Atención, accidente",
                "Attenzione, incidente", "Atenção, acidente");
        phrase("stopped_vehicle", "Caution, stationary vehicle", "Let op, stilstaand voertuig", "Achtung, liegengebliebenes Fahrzeug",
                "Attention, véhicule à l'arrêt", "Atención, vehículo detenido", "Attenzione, veicolo fermo", "Atenção, veículo parado");
        phrase("hazard", "Caution, incident", "Let op, incident", "Achtung, Ereignis", "Attention, incident", "Atención, incidente",
                "Attenzione, pericolo", "Atenção, perigo");
        phrase("poor_road", "Caution, poor road conditions", "Let op, slecht wegdek", "Achtung, schlechter Straßenbelag",
                "Attention, chaussée en mauvais état", "Atención, carretera en mal estado", "Attenzione, strada dissestata",
                "Atenção, piso em mau estado");
        phrase("slippery", "Caution, slippery road", "Let op, slipgevaar", "Achtung, Rutschgefahr", "Attention, chaussée glissante",
                "Atención, riesgo de deslizamiento", "Attenzione, strada scivolosa", "Atenção, piso escorregadio");
        phrase("emergency", "Caution, emergency vehicle", "Let op, hulpvoertuig", "Achtung, Einsatzfahrzeug", "Attention, véhicule d'urgence",
                "Atención, vehículo de emergencia", "Attenzione, veicolo di soccorso", "Atenção, veículo de emergência");
        phrase("wrong_way", "Wrong-way driver nearby! Keep right!", "Spookrijder in de buurt! Blijf rechts rijden!",
                "Geisterfahrer in der Nähe! Fahre weiter auf der rechten Seite!", "Conducteur fantôme à proximité! Restez sur la droite!",
                "¡Hay un conductor suicida cerca! ¡Manténte pegado a la derecha!", "Veicolo contromano nelle vicinanze! Tieni la destra!",
                "Condutor em contramão nas proximidades! Mantenha-se à direita!");
        phrase("level_crossing", "You are approaching a dangerous level crossing", "Je nadert een onoverzichtelijke spoorwegovergang",
                "Du näherst dich einem unübersichtlichen Bahnübergang.", "Vous vous approchez d'un passage à niveau où la visibilité est insuffisante",
                "Te estás acercando a un paso a nivel con poca visibilidad", "Ti stai avvicinando a un passaggio a livello con scarsa visibilità",
                "Está a aproximar-se de uma passagem de nível com pouca visibilidade");
        phrase("animals", "Caution, animal on the road", "Let op, dier op de weg", "Achtung, Tier auf der Straße", "Attention, animal sur la route",
                "Atención, animal en la carretera", "Attenzione, animale sulla strada", "Atenção, animal na estrada");
        phrase("bridge", "Caution, bridge open", "Let op, brug open", "Achtung, Brücke geöffnet", "Attention, pont ouvert", "Atención, puente abierto",
                "Attenzione, ponte aperto", "Atenção, ponte aberta");
        phrase("lane_closed", "Caution, lane closed", "Let op, rijstrook dicht", "Achtung, Fahrstreifen gesperrt", "Attention, voie fermée",
                "Atención, carril cerrado", "Attenzione, corsia chiusa", "Atenção, faixa fechada");
    }
    /** Flitsmeister speaks no maximum-speed text; this notice keeps a short one. */
    private static final String[] LIMIT = {"Speed limit %d", "Maximumsnelheid %d", "Höchstgeschwindigkeit %d",
            "Vitesse limitée à %d", "Límite de velocidad %d", "Limite di velocità %d", "Limite de velocidade %d"};

    static int index(String language) {
        String code = language == null ? "" : language.toLowerCase(Locale.ROOT);
        int dash = code.indexOf('-'); if (dash > 0) code = code.substring(0, dash);
        for (int i = 0; i < LANGUAGES.length; i++) if (LANGUAGES[i].equals(code)) return i;
        return 0;
    }
    /** The receiving app's own language when it is one of ours, else English. */
    public static String language() {
        Locale locale = appLocale();
        int i = index(locale.getLanguage());
        return LANGUAGES[i].equals(locale.getLanguage()) ? locale.toLanguageTag() : "en-GB";
    }
    /** The app's own language (per-app setting) from its resources; Maps does not move Locale.getDefault(). */
    static Locale appLocale() {
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app instanceof android.content.Context) {
                android.os.LocaleList list = ((android.content.Context) app).getResources().getConfiguration().getLocales();
                if (!list.isEmpty()) return list.get(0);
            }
        } catch (ReflectiveOperationException | RuntimeException unavailable) { /* fall back */ }
        return Locale.getDefault();
    }

    /** Phrase key for the alert, or null when we have none and the provider's own text stays. */
    static String key(WarningEvent e) {
        String type = e.nativeType == null ? "" : e.nativeType, sub = e.nativeSubtype == null ? "" : e.nativeSubtype;
        String category = e.category == null ? "" : e.category;
        if (type.equals("AVERAGE_SPEED_WARNING")) return "average_exceeded";
        if (type.equals("POLICEHOTSPOT") || type.equals("POLICE_HOTSPOT")) return "hotspot";
        if (category.equals("police_control") || type.equals("POLICE"))
            return sub.equals("POLICE_TYPE_MOBILE_CAMERA") ? "mobile_check" : "police";
        switch (IndicatorContract.kind(e)) {
            case AVERAGE_SPEED: return inside(e) ? "average_start" : "average_ahead";
            case SPEED_TRAP: return "mobile_check";
            case SPEED_TRAP_HOTSPOT: return "hotspot";
            case SPEED_CAMERA: return "camera";
            case TRAFFIC_CAMERA: return "traffic_camera";
            case TRAFFIC_JAM: return "jam";
            case ROADWORKS: return "roadworks";
            case POOR_ROAD: return sub.contains("SLIPPERY") || sub.contains("ICE") || sub.contains("SNOW") || sub.contains("OIL") ? "slippery" : "poor_road";
            case EMERGENCY: return "emergency";
            case WRONG_WAY: return "wrong_way";
            case LEVEL_CROSSING: return "level_crossing";
            case ANIMALS: return "animals";
            case BRIDGE: return "bridge";
            case MATRIX: return "lane_closed";
            case MAXIMUM_SPEED: case SPEED_130: return "limit";
            case INCIDENT:
                if (type.equals("CLOSURE") || type.equals("ROAD_CLOSED") || category.equals("closure")) return "road_closed";
                // Speed bumps, curves, school zones and similar features keep the provider's own words.
                if (category.equals("road_feature")) return null;
                if (type.equals("ACCIDENT") || category.equals("crash") || sub.startsWith("ACCIDENT")) return "accident";
                if (sub.contains("ON_SHOULDER") || sub.contains("CAR_STOPPED") || sub.contains("STATIONARY") || sub.equals("BROKEN_DOWN_VEHICLE")) return "stopped_vehicle";
                return "hazard";
            default: return null; // border crossing and traffic-light advice: no spoken text in Flitsmeister either
        }
    }
    /**
     * Inside an average-speed control only on positive evidence: a distance measured inside it, an active
     * segment, or Waze's in-zone state. Flitsmeister marks its own zone announcement "enter" while the car is
     * still approaching, so that phase alone is not entry.
     */
    static boolean inside(WarningEvent e) {
        Object kind = e.fields().get("native_distance_kind");
        if ("to_segment".equals(kind)) return false;
        return e.phase == WarningEvent.Phase.ACTIVE || "remaining_in_segment".equals(kind)
                || "InZone".equals(e.fields().get("native_zone_state"));
    }
    /** Our phrase for the alert in the given language, or null when the alert has no phrase. */
    public static String phrase(WarningEvent e, String language) {
        String key = key(e);
        if (key == null) return null;
        int i = index(language);
        if (key.equals("limit")) {
            Object raw = e.fields().get("road_speed_limit_kmh");
            int value = raw instanceof Number ? (int) Math.round(((Number) raw).doubleValue())
                    : IndicatorContract.kind(e) == IndicatorContract.Kind.SPEED_130 ? 130 : -1;
            return value > 0 && value <= 300 ? String.format(Locale.ROOT, LIMIT[i], value) : null;
        }
        return PHRASES.get(key)[i];
    }

    // ---------------------------------------------------------------- sounds

    /** Flitsmeister's own sound choice per alert type (Flitsmeister 15.1.1 sound selector), from its installed app. */
    static final Map<String, String> SOUNDS = new HashMap<>();
    static void defaultSounds() {
        SOUNDS.clear();
        SOUNDS.put("camera", "flitser.m4a"); SOUNDS.put("mobile_check", "flitser.m4a");
        SOUNDS.put("police", "subtle_beep.mp3"); SOUNDS.put("hotspot", "populaire_flitslocatie.m4a");
        SOUNDS.put("traffic_camera", "informatie_notificatie.m4a");
        SOUNDS.put("average_ahead", "veiligheid_notificatie_1.m4a"); SOUNDS.put("average_start", "trajectcontrole_start.m4a");
        SOUNDS.put("average_exceeded", "snelheid_verlagen.m4a"); SOUNDS.put("limit", "snelheid_verlagen.m4a");
        SOUNDS.put("jam", "veiligheid_notificatie_2.m4a");
        SOUNDS.put("roadworks", "vertraging_notificatie.m4a"); SOUNDS.put("road_closed", "vertraging_notificatie.m4a");
        SOUNDS.put("accident", "veiligheid_notificatie_2.m4a"); SOUNDS.put("stopped_vehicle", "veiligheid_notificatie_2.m4a");
        SOUNDS.put("hazard", "veiligheid_notificatie_2.m4a");
        SOUNDS.put("wrong_way", "spookrijder.m4a"); SOUNDS.put("emergency", "hulpvoertuigen.m4a");
        for (String key : new String[]{"poor_road", "slippery", "animals", "level_crossing", "bridge", "lane_closed"})
            SOUNDS.put(key, "veiligheid_notificatie_1.m4a");
    }
    static { defaultSounds(); }

    public static String sound(WarningEvent e) {
        String key = key(e);
        return key == null ? null : SOUNDS.get(key);
    }


    // ---------------------------------------------------------------- receiver

    /** The payload a receiver speaks: our phrase, its own language and the uniform sound. */
    public static WarningEvent localize(WarningEvent e) { return localize(e, language()); }
    static WarningEvent localize(WarningEvent e, String language) {
        if (!enabled || e == null || e.operation == WarningEvent.Operation.CLEAR || Boolean.TRUE.equals(e.fields().get("is_preview"))) return e;
        String text = phrase(e, language);
        if (text == null) return e;
        Map<String, Object> values = new LinkedHashMap<>(e.fields());
        values.put("message", text); values.put("language_tag", language); values.put("message_origin", "template");
        values.put("uniform_alert", true);
        String sound = sound(e);
        if (sound != null) values.put("native_sound", sound); else values.remove("native_sound");
        try { return new WarningEvent(values, Math.max(e.issuedAt, e.observedAt), e.encodedBytes); }
        catch (IllegalArgumentException invalid) { return e; }
    }

    // ---------------------------------------------------------------- provider

    /** Provider-side announcement decisions, one instance per {@link WarningEndpoint}. */
    static final class Announcer {
        private final Map<String, Long> announced = new LinkedHashMap<>(); // warning id -> last announcement
        private final Map<String, Long> stages = new LinkedHashMap<>();    // warning id + stage -> announced at
        private final Map<String, Long> types = new HashMap<>();           // phrase key -> last announcement

        /** Any announcement that reached the journal, the provider's own or ours. */
        void announced(WarningEvent e, long now) {
            if (!enabled || e.operation != WarningEvent.Operation.ANNOUNCE) return;
            String key = key(e);
            if (key != null) types.put(key, now);
        }

        /**
         * True when a provider announcement is shown but not spoken: it repeats ours from moments ago, or it
         * is another report of an incident type already announced within 30 s (Waze reports one lane
         * closure or jam as several). Cameras, traps, police and zones are always the provider's decision.
         */
        boolean suppress(WarningEvent e, long now) {
            if (!enabled || e.operation != WarningEvent.Operation.ANNOUNCE) return false;
            Long ours = announced.get("synthetic:" + e.warningId);
            String key = key(e);
            Long sameType = key == null ? null : types.get(key);
            boolean suppress = ours != null && now - ours < SAME_ANNOUNCEMENT_MS
                    || key != null && CHATTY.contains(key) && sameType != null && now - sameType < SAME_TYPE_MS;
            if (!suppress) remember(e.warningId, now);
            return suppress;
        }
        /** A cleared alert may be announced again when it returns; a control keeps its stages for 15 minutes. */
        void cleared(String id) {
            announced.remove(id); announced.remove("synthetic:" + id);
            stages.keySet().removeIf(k -> k.startsWith(id + "|") && !zoneStages.contains(k));
        }
        private final java.util.Set<String> zoneStages = new java.util.HashSet<>();
        /** An announcement for a shown alert the provider has not announced, or null. */
        Bundle decide(WarningEvent e, long now) {
            if (!enabled) return null;
            if (e.operation != WarningEvent.Operation.UPSERT || e.phase == WarningEvent.Phase.EXIT) return null;
            if (e.category.equals("display_only") || Boolean.TRUE.equals(e.fields().get("native_visual_only"))
                    || Boolean.TRUE.equals(e.fields().get("is_preview"))) return null;
            String key = key(e);
            if (key == null || key.equals("limit") || key.equals("border") || key.equals("traffic_light") || key.equals("average_exceeded")) return null;
            boolean zone = key.startsWith("average_");
            String stage = zone && inside(e) ? "inside" : "ahead";
            // Entering a control is its own announcement, even shortly after the one ahead of it.
            Long last = announced.get(e.warningId);
            if (last != null && now - last < SAME_ANNOUNCEMENT_MS && stage.equals("ahead")) return null;
            Long stagedAt = stages.get(e.warningId + "|" + stage);
            if (stagedAt != null && (!zone || now - stagedAt < ZONE_STAGE_MEMORY_MS)) return null;
            Long sameType = types.get(key);
            if (!zone && sameType != null && now - sameType < SAME_TYPE_MS) return null;
            if (!(zone && inside(e))) {
                Integer d = e.distanceMeters;
                int trigger = e.triggerMeters != null && e.triggerMeters > 0 ? e.triggerMeters
                        : zone ? ZONE_TRIGGER_M : key.equals("jam") ? JAM_TRIGGER_M : POINT_TRIGGER_M;
                if (d != null && d > trigger) return null;
            }
            if (now - e.issuedAt > 5000) return null;
            Bundle b = WarningCodec.encode(e);
            for (String k : new String[]{"protocol_version", "provider_session", "sequence", "issued_elapsed_ms", "announce_until_elapsed_ms"}) b.remove(k);
            b.putString("operation", "ANNOUNCE");
            b.putLong("announcement_index", SYNTHETIC_INDEX_BASE + e.announcementIndex * 2 + (stage.equals("inside") ? 1 : 0));
            String text = phrase(e, e.languageTag.isEmpty() ? "en" : e.languageTag);
            b.putString("message", text == null ? PHRASES.get("hazard")[0] : text);
            if (e.languageTag.isEmpty()) b.putString("language_tag", "en-GB");
            b.putString("message_origin", "template");
            b.putString("announcement_origin", "uniform_alert");
            b.remove("native_sound");
            stages.put(e.warningId + "|" + stage, now); types.put(key, now);
            if (zone) zoneStages.add(e.warningId + "|" + stage);
            remember("synthetic:" + e.warningId, now);
            remember(e.warningId, now);
            return b;
        }
        private void remember(String id, long now) {
            announced.put(id, now);
            if (announced.size() > 512) { String eldest = announced.keySet().iterator().next(); announced.remove(eldest); }
            if (stages.size() > 1024) { String eldest = stages.keySet().iterator().next(); stages.remove(eldest); }
        }
    }
}
