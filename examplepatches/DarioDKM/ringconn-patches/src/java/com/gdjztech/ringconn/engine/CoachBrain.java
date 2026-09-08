package com.gdjztech.ringconn.engine;

import org.json.JSONObject;
import java.util.Locale;

public class CoachBrain {

    // Athletenprofil Dario (Athlete-ID: i557347)
    public static final String ATHLETE_NAME = "Dario";
    public static final String ATHLETE_ID = "i557347";
    public static final float DEFAULT_WEIGHT_KG = 66.0f;
    public static final int DEFAULT_FTP_WATTS = 301;
    public static final float WONHALDE_20M_BEST_WATTS = 316.4f; // 4.79 W/kg

    // Trainingsbereiche (FTP 301 W)
    public static int getZ1Ceiling(int ftp) { return (int) (ftp * 0.55f); } // < 165 W
    public static int[] getZ2Range(int ftp) { return new int[]{(int)(ftp * 0.55f), (int)(ftp * 0.74f)}; } // 165 - 222 W
    public static int[] getZ3Range(int ftp) { return new int[]{(int)(ftp * 0.75f), (int)(ftp * 0.90f)}; } // 225 - 270 W
    public static int[] getSweetSpotRange(int ftp) { return new int[]{(int)(ftp * 0.88f), (int)(ftp * 0.94f)}; } // 265 - 283 W
    public static int[] getZ4Range(int ftp) { return new int[]{(int)(ftp * 0.90f), (int)(ftp * 1.05f)}; } // 270 - 316 W
    public static int[] getZ5Range(int ftp) { return new int[]{(int)(ftp * 1.05f), (int)(ftp * 1.20f)}; } // 316 - 361 W

    public static class EvaluationResult {
        public String readinessLabel = "Optimal";
        public int readinessScore = 85;
        public String clearance = "Freigabe: 100% Go";
        public String corridor = "Z4 Schwelle: 270 bis 316 W";
        public String prescription = "Volle muskuläre und autonome Frische. Bereit für Z4 Schwellenblöcke oder lange Durability Ausfahrten.";
        public boolean tsbVeto = false;
        public boolean infectionWarning = false;
        public float ctl = 0f;
        public float atl = 0f;
        public float tsb = 0f;
        public int blockWeek = 2;
        public boolean isDeload = false;
        public String periodizationText = "Woche 2 von 4: Progressive Aufbauphase.";
        public String veganFueling = "60 bis 90 g/h Kohlenhydrate über Maltodextrin und Datteln auf dem Rad.";

        public JSONObject toJson() {
            JSONObject obj = new JSONObject();
            try {
                obj.put("athleteName", ATHLETE_NAME);
                obj.put("ftp", DEFAULT_FTP_WATTS);
                obj.put("weightKg", DEFAULT_WEIGHT_KG);
                obj.put("readinessLabel", readinessLabel);
                obj.put("readinessScore", readinessScore);
                obj.put("clearance", clearance);
                obj.put("corridor", corridor);
                obj.put("prescription", prescription);
                obj.put("tsbVeto", tsbVeto);
                obj.put("infectionWarning", infectionWarning);
                obj.put("ctl", ctl);
                obj.put("atl", atl);
                obj.put("tsb", tsb);
                obj.put("blockWeek", blockWeek);
                obj.put("isDeload", isDeload);
                obj.put("periodizationText", periodizationText);
                obj.put("veganFueling", veganFueling);
                
                JSONObject zones = new JSONObject();
                zones.put("z1_ceil", getZ1Ceiling(DEFAULT_FTP_WATTS));
                int[] z2 = getZ2Range(DEFAULT_FTP_WATTS);
                zones.put("z2_min", z2[0]); zones.put("z2_max", z2[1]);
                int[] z3 = getZ3Range(DEFAULT_FTP_WATTS);
                zones.put("z3_min", z3[0]); zones.put("z3_max", z3[1]);
                int[] ss = getSweetSpotRange(DEFAULT_FTP_WATTS);
                zones.put("ss_min", ss[0]); zones.put("ss_max", ss[1]);
                int[] z4 = getZ4Range(DEFAULT_FTP_WATTS);
                zones.put("z4_min", z4[0]); zones.put("z4_max", z4[1]);
                int[] z5 = getZ5Range(DEFAULT_FTP_WATTS);
                zones.put("z5_min", z5[0]); zones.put("z5_max", z5[1]);
                obj.put("zones", zones);
            } catch (Exception ignored) {}
            return obj;
        }
    }

    public static EvaluationResult evaluate(
            int restingHr,
            int hrv,
            float tempOffset,
            Float ctl,
            Float atl,
            Float tsb,
            String plannedWorkoutName
    ) {
        EvaluationResult res = new EvaluationResult();
        int ftp = DEFAULT_FTP_WATTS;
        int z1Ceil = getZ1Ceiling(ftp);
        int[] z2 = getZ2Range(ftp);
        int[] ss = getSweetSpotRange(ftp);
        int[] z4 = getZ4Range(ftp);

        if (ctl != null) res.ctl = ctl;
        if (atl != null) res.atl = atl;
        if (tsb != null) res.tsb = tsb;

        // 1. Infektionsprüfung über Hauttemperatur und HRV
        if (tempOffset >= 0.55f && hrv > 0 && hrv < 45) {
            res.infectionWarning = true;
            res.readinessLabel = "Infektionsverdacht";
            res.readinessScore = 25;
            res.clearance = "Coach-Veto: Akuter Infektionsverdacht";
            res.corridor = "Z1 Rekom: unter " + z1Ceil + " W (Ruhetag angeraten)";
            res.prescription = "Akute Warnung aktiv wegen erhöhter Temperatur (+" + tempOffset + " °C) und HRV Einbruch (" + hrv + " ms). Alle intensiven Einheiten zwingend streichen. Maximal 45 Minuten Z1 Rekompensation oder kompletter Ruhetag.";
            return res;
        }

        // 2. TSB Leitplanke (< -25 Punkte)
        if (tsb != null && tsb < -25.0f) {
            res.tsbVeto = true;
            res.readinessLabel = "Erschöpfung (TSB " + String.format(Locale.US, "%.1f", tsb) + ")";
            res.readinessScore = 38;
            res.clearance = "Coach-Veto: TSB Leitplanke greift";
            res.corridor = "Z1 Rekom: unter " + z1Ceil + " W (Entlastungspflicht)";
            res.prescription = "Leitplanke greift: TSB liegt bei " + String.format(Locale.US, "%.1f", tsb) + " Punkten unter dem Grenzwert von minus 25. Akute Erschöpfung erfordert aktive Entlastung. Keine Schwellenblöcke fahren.";
            return res;
        }

        // 3. Autonome Readiness Einstufung
        int score = 80;
        if (restingHr > 0 && restingHr <= 48) score += 10;
        else if (restingHr > 54) score -= 15;

        if (hrv >= 65) score += 10;
        else if (hrv > 0 && hrv < 48) score -= 15;

        score = Math.max(20, Math.min(100, score));
        res.readinessScore = score;

        if (score >= 82) {
            res.readinessLabel = "Optimal";
            res.clearance = "Freigabe: 100% Go";
            res.corridor = "Z4 Schwelle: " + z4[0] + " bis " + z4[1] + " W";
            res.prescription = "Volle muskuläre und autonome Frische. Bereit für Z4 Schwellenblöcke (3x 12 bis 15 min bei 285 bis 305 W) oder lange Durability Ausfahrten über 2.000 kJ.";
        } else if (score >= 65) {
            res.readinessLabel = "Gut";
            res.clearance = "Freigabe: Sweet Spot / Z4";
            res.corridor = "Sweet Spot: " + ss[0] + " bis " + ss[1] + " W";
            res.prescription = "Gute Trainingsbereitschaft für Sweet Spot Blöcke (265 bis 283 W) oder stetige Grundlagenkilometer im oberen Z2 Bereich.";
        } else if (score >= 45) {
            res.readinessLabel = "Vorermüdet";
            res.clearance = "Vorermüdung beachten";
            res.corridor = "Z2 Grundlage: " + z2[0] + " bis " + z2[1] + " W";
            res.prescription = "Vorermüdung vorhanden. Schwellenintervalle meiden und Belastung diszipliniert auf extensive Grundlage Z2 deckeln.";
        } else {
            res.readinessLabel = "Erholungsbedarf";
            res.clearance = "Erholungsbedarf aktiv";
            res.corridor = "Z1 Rekom: unter " + z1Ceil + " W";
            res.prescription = "Hohe vegetative oder muskuläre Erschöpfung. Training pausieren oder maximal 45 Minuten lockeres Z1 Rollen.";
        }

        // 4. Geplante Einheit aus Intervals berücksichtigen
        if (plannedWorkoutName != null && !plannedWorkoutName.trim().isEmpty()) {
            boolean isLight = plannedWorkoutName.contains("Z2") ||
                    plannedWorkoutName.contains("Grundlage") ||
                    plannedWorkoutName.contains("Voraktivierung") ||
                    plannedWorkoutName.contains("Recovery");
            if (isLight) {
                res.clearance = "Freigabe: Voraktivierung";
                res.corridor = "Z2 Grundlagenbereich: " + z2[0] + " bis " + z2[1] + " W";
                res.prescription = "Geplante Einheit '" + plannedWorkoutName + "' ist physiologisch freigegeben. Beine im Z2 Bereich locker halten und Kadenz ohne Laktatbildung drehen.";
            }
        }

        // 5. Periodisierungs-Status (4-Wochen Rhythmus)
        int week = 2; // Standard-Aufbauwoche
        res.blockWeek = week;
        res.isDeload = false;
        res.periodizationText = "Woche " + week + " von 4: Progressive Aufbauphase. CTL Zielzuwachs: +3 bis +5 Punkte pro Woche.";

        // 6. Vegane Ernährungsleitlinie
        res.veganFueling = "Vegane Kohlenhydratzufuhr (6 bis 8 g/kg = ca. 400 bis 530 g): Auf dem Rad 60 bis 90 g/h über Maltodextrin und Datteln. Nach der Fahrt Reis mit Linsen oder Kichererbsen.";

        return res;
    }
}
