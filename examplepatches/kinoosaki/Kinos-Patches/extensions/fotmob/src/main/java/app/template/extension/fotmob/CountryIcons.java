package app.template.extension.fotmob;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.OptionIcons;

/**
 * The flags in the "Hidden countries" picker (icons only: they are never saved and never decide
 * what is hidden). FotMob keys a country by its FIFA three-letter code, which often differs from
 * ISO 3166-1 alpha-3 (GER, NED, SUI, POR, CRO, DEN, RSA, KSA, UAE, CHI, URU, PAR, ALG, ANG, BUL,
 * ...), so the flag comes from a FIFA -> ISO alpha-2 table, not from the code.
 *
 * <p>The table covers every seed code (CountrySeeds) and KOS, built 2026-11-03 by matching each
 * code against Sofascore's country list (which carries the FIFA/IOC code next to the ISO one) and
 * ISO alpha-3, and checked by hand where neither knew it: EQG Equatorial Guinea GQ, KVX/KOS Kosovo
 * XK, PLE Palestine PS, TAH Tahiti PF (French Polynesia). Special cases: ENG, SCO and WAL get the
 * England, Scotland and Wales flags, NIR the United Kingdom's, INT a globe and INT-2 (club
 * competitions) a trophy. ANT (Netherlands Antilles, dissolved 2010) has no flag of its own and
 * gets none, like any unknown code.
 *
 * <p>Images (2026-11-03): every country code also names FotMob's own national-team crest-flag,
 * {@value #FLAG_URL} with the code in lower case in place of {@code %s} (the picture the app shows
 * next to a country; checked 200 image/png for eng, ger, nir, kvx and ant, so ANT gets an image even
 * without an emoji). INT and INT-2 are not countries and have none; the picker swaps the image in for
 * the emoji once loaded.
 */
final class CountryIcons implements HevalSettings.OptionImageProvider {
    static final CountryIcons INSTANCE = new CountryIcons();

    static final String FLAG_URL = "https://images.fotmob.com/image_resources/logo/teamlogo/%s.png";

    /** "FIFA:ISO" pairs, space separated. */
    private static final String FIFA_TO_ISO = ""
            + "AFG:AF ALB:AL ALG:DZ ASA:AS AND:AD ANG:AO AIA:AI ATG:AG ARG:AR ARM:AM ARU:AW AUS:AU "
            + "AUT:AT AZE:AZ BAH:BS BHR:BH BAN:BD BRB:BB BLR:BY BEL:BE BLZ:BZ BEN:BJ BER:BM BHU:BT "
            + "BOL:BO BIH:BA BOT:BW BRA:BR VGB:VG BRU:BN BUL:BG BFA:BF BDI:BI CAM:KH CMR:CM CAN:CA "
            + "CPV:CV CAY:KY CHA:TD CHI:CL CHN:CN TPE:TW COL:CO COM:KM CGO:CG COD:CD COK:CK CRC:CR "
            + "CIV:CI CRO:HR CUB:CU CYP:CY CZE:CZ DEN:DK DJI:DJ DMA:DM DOM:DO ECU:EC EGY:EG SLV:SV "
            + "EQG:GQ ERI:ER EST:EE ETH:ET FRO:FO FIJ:FJ FIN:FI FRA:FR GAB:GA GAM:GM GEO:GE GER:DE "
            + "GHA:GH GIB:GI GLP:GP GRE:GR GRL:GL GRN:GD GUM:GU GUA:GT GUI:GN GNB:GW GUY:GY HAI:HT "
            + "HON:HN HKG:HK HUN:HU ISL:IS IND:IN IDN:ID IRN:IR IRQ:IQ ISR:IL ITA:IT JAM:JM JPN:JP "
            + "JOR:JO KAZ:KZ KEN:KE KVX:XK PRK:KP KIR:KI KOR:KR KUW:KW KGZ:KG LAO:LA LVA:LV LIB:LB "
            + "LES:LS LBR:LR LBY:LY LIE:LI LTU:LT LUX:LU MAC:MO MKD:MK MAD:MG MWI:MW MAS:MY MDV:MV "
            + "MLI:ML MLT:MT MTN:MR MRI:MU MEX:MX MDA:MD MGL:MN MNE:ME MSR:MS MAR:MA MON:MC MOZ:MZ "
            + "MYA:MM NAM:NA NEP:NP NED:NL NCL:NC NZL:NZ NCA:NI NIG:NE NGA:NG NIR:GB NOR:NO "
            + "NRU:NR OMA:OM PAK:PK PLE:PS PAN:PA PNG:PG PAR:PY PER:PE PHI:PH PLW:PW POL:PL POR:PT "
            + "PUR:PR QAT:QA IRL:IE ROU:RO RUS:RU RWA:RW SKN:KN LCA:LC VIN:VC SAM:WS SMR:SM STP:ST "
            + "KSA:SA SEN:SN SRB:RS SEY:SC SLE:SL SIN:SG SVK:SK SVN:SI SOL:SB SOM:SO RSA:ZA ESP:ES "
            + "SRI:LK SUD:SD SUR:SR SWZ:SZ SWE:SE SUI:CH SYR:SY TAH:PF TJK:TJ TAN:TZ THA:TH TLS:TL "
            + "TOG:TG TGA:TO TRI:TT TUN:TN TUR:TR TKM:TM TCA:TC UGA:UG UKR:UA UAE:AE USA:US URU:UY "
            + "VIR:VI UZB:UZ VAN:VU VEN:VE VIE:VN YEM:YE ZAM:ZM ZIM:ZW CUW:CW MTQ:MQ KOS:XK";

    private static final Map<String, String> ISO = new HashMap<>(256);

    static {
        for (String pair : FIFA_TO_ISO.split(" ")) {
            int colon = pair.indexOf(':');
            if (colon > 0) ISO.put(pair.substring(0, colon), pair.substring(colon + 1));
        }
    }

    @Override
    public String iconFor(String key) {
        return icon(key);
    }

    @Override
    public String imageUrlFor(String key) {
        return imageUrl(key);
    }

    /**
     * FotMob's image of a country code (2 to 4 letters A-Z or digits, any case), else null; INT and
     * INT-2 have none (the hyphen already rules INT-2 out).
     */
    static String imageUrl(String key) {
        if (key == null || key.length() < 2 || key.length() > 4 || key.equalsIgnoreCase(CountrySeeds.INTERNATIONAL)) return null;
        String code = key.toLowerCase(Locale.ROOT);
        for (int i = 0; i < code.length(); i++) {
            char c = code.charAt(i);
            if ((c < 'a' || c > 'z') && (c < '0' || c > '9')) return null;
        }
        return FLAG_URL.replace("%s", code);
    }

    static String icon(String key) {
        if (key == null) return null;
        switch (key) {
            case CountrySeeds.INTERNATIONAL:
                return OptionIcons.GLOBE;
            case CountrySeeds.INTERNATIONAL_CLUBS:
                return OptionIcons.TROPHY;
            default:
                break;
        }
        String code = key.toUpperCase(Locale.ROOT);
        switch (code) {
            case "ENG":
                return OptionIcons.ENGLAND;
            case "SCO":
                return OptionIcons.SCOTLAND;
            case "WAL":
                return OptionIcons.WALES;
            default:
                return OptionIcons.countryFlag(ISO.get(code));
        }
    }

    private CountryIcons() {
    }
}
