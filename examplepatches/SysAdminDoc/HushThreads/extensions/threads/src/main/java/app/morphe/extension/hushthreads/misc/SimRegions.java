/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * The country, network code and carrier of each region follow Hushfeed's SIM presets
 * (https://github.com/SysAdminDoc/hushfeed, GPL-3.0).
 */
package app.morphe.extension.hushthreads.misc;

import androidx.annotation.Nullable;

import java.util.Locale;

import app.morphe.extension.shared.settings.StringSetting;

/**
 * The regions Spoof SIM region can answer with: a country's code, a network code of one of its
 * carriers (the MCC and MNC Android reports together) and that carrier's name. Each is a real
 * carrier of that country, so the three agree with each other the way a real SIM's do.
 */
public final class SimRegions {
    private SimRegions() { }

    /**
     * The region Spoof SIM region answers with, by its country code. It isn't a switch, and
     * {@link app.morphe.extension.hushthreads.settings.Settings} holds only switches, so it's kept
     * here the way a save's choices are. Threads reads the SIM as it starts, so a change waits for
     * a restart.
     */
    public static final StringSetting REGION = new StringSetting("hushthreads_sim_region", "us", true);

    /** One region: what Android would report for a SIM of [carrier] in [iso]. */
    public static final class Region {
        /** The country's ISO 3166 code, lower case as TelephonyManager reports it. */
        public final String iso;
        /** The MCC and MNC together, five or six digits. */
        public final String mccMnc;
        public final String carrier;

        Region(String iso, String mccMnc, String carrier) {
            this.iso = iso;
            this.mccMnc = mccMnc;
            this.carrier = carrier;
        }

        /** The country's name in [language], which Android already knows. */
        public String displayName(Locale language) {
            return new Locale("", iso.toUpperCase(Locale.ROOT)).getDisplayCountry(language);
        }
    }

    public static final Region[] REGIONS = {
            new Region("us", "310260", "T-Mobile"),
            new Region("gb", "23430", "EE"),
            new Region("ca", "302720", "Rogers"),
            new Region("de", "26201", "Telekom.de"),
            new Region("fr", "20801", "Orange"),
            new Region("it", "22201", "TIM"),
            new Region("es", "21407", "Movistar"),
            new Region("nl", "20408", "KPN"),
            new Region("pl", "26003", "Orange"),
            new Region("pt", "26806", "MEO"),
            new Region("be", "20601", "Proximus"),
            new Region("ch", "22801", "Swisscom"),
            new Region("at", "23201", "A1"),
            new Region("se", "24001", "Telia"),
            new Region("no", "24201", "Telenor"),
            new Region("dk", "23801", "TDC"),
            new Region("fi", "24405", "Elisa"),
            new Region("ie", "27201", "Vodafone"),
            new Region("gr", "20201", "Cosmote"),
            new Region("ro", "22610", "Orange"),
            new Region("cz", "23001", "T-Mobile"),
            new Region("hu", "21630", "Magyar Telekom"),
            new Region("bg", "28401", "A1 BG"),
            new Region("rs", "22003", "mt:s"),
            new Region("hr", "21901", "HT HR"),
            new Region("ua", "25503", "Kyivstar"),
            new Region("ru", "25001", "MTS"),
            new Region("tr", "28601", "Turkcell"),
            new Region("ae", "42402", "Etisalat"),
            new Region("sa", "42001", "stc"),
            new Region("qa", "42701", "Ooredoo"),
            new Region("kw", "41902", "Zain"),
            new Region("bh", "42602", "Zain"),
            new Region("om", "42202", "Omantel"),
            new Region("jo", "41601", "Zain"),
            new Region("iq", "41820", "Zain"),
            new Region("lb", "41501", "Alfa"),
            new Region("il", "42501", "Partner"),
            new Region("eg", "60202", "Vodafone"),
            new Region("ma", "60401", "Maroc Telecom"),
            new Region("dz", "60301", "Mobilis"),
            new Region("tn", "60502", "Tunisie Telecom"),
            new Region("in", "405840", "Jio"),
            new Region("pk", "41001", "Jazz"),
            new Region("bd", "47001", "Grameenphone"),
            new Region("lk", "41302", "Dialog"),
            new Region("np", "42902", "Ncell"),
            new Region("id", "51010", "Telkomsel"),
            new Region("ph", "51503", "Smart"),
            new Region("th", "52003", "AIS"),
            new Region("vn", "45204", "Viettel"),
            new Region("my", "50212", "Maxis"),
            new Region("sg", "52501", "Singtel"),
            new Region("hk", "45400", "CSL"),
            new Region("tw", "46692", "Chunghwa Telecom"),
            new Region("jp", "44010", "NTT DOCOMO"),
            new Region("kr", "45005", "SK Telecom"),
            new Region("au", "50501", "Telstra"),
            new Region("nz", "53005", "Spark"),
            new Region("br", "72410", "Vivo"),
            new Region("mx", "334020", "Telcel"),
            new Region("ar", "722310", "Claro"),
            new Region("co", "732101", "Claro"),
            new Region("cl", "73001", "Entel"),
            new Region("pe", "71610", "Claro"),
            new Region("za", "65501", "Vodacom"),
            new Region("ng", "62130", "MTN"),
            new Region("ke", "63902", "Safaricom"),
            new Region("gh", "62001", "MTN"),
    };

    /** The region stored as [iso], or null when there's none by that code. */
    @Nullable
    public static Region find(@Nullable String iso) {
        if (iso == null) return null;
        String code = iso.trim().toLowerCase(Locale.ROOT);
        for (Region region : REGIONS) {
            if (region.iso.equals(code)) return region;
        }
        return null;
    }
}
