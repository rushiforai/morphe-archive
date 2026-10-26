package app.xposed.extension;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

/**
 * Country name to flag resolution. The tables are generated from X-Posed's
 * COUNTRY_FLAGS and COUNTRY_ALIASES (MIT, https://github.com/xaitax/x-account-location-device).
 * Localized names (X answers in the app language) fall back to the platform's ISO list.
 */
final class Countries {
    /** Shown for locations without a flag, such as X's regional labels. */
    static final String UNKNOWN_FLAG = "🌍";

    /** X's regional labels and X-Posed's globe for each (its REGION_DATA). */
    private static final String[][] REGIONS = {
            {"Africa", "🌍"}, {"Asia", "🌏"}, {"Australasia", "🌏"}, {"Caribbean", "🌎"},
            {"Central Asia", "🌏"}, {"East Asia", "🌏"}, {"East Asia & Pacific", "🌏"},
            {"Eastern Europe (Non-EU)", "🌍"}, {"Europe", "🌍"}, {"North Africa", "🌍"},
            {"North America", "🌎"}, {"Oceania", "🌏"}, {"South America", "🌎"},
            {"South Asia", "🌏"}, {"Southeast Asia", "🌏"}, {"West Asia", "🌍"},
    };

    private static final Pattern MARKS = Pattern.compile("\\p{M}");
    private static final Pattern SPACES = Pattern.compile("\\s+");
    private static final int MEMO_LIMIT = 2000;
    private static final Map<String, String> CANONICAL = new ConcurrentHashMap<>();
    private static final Map<String, String> FLAG_MEMO = new ConcurrentHashMap<>();

    private static final Map<String, String> FLAGS = new HashMap<>();
    private static final Map<String, String> REGION_FLAGS = new HashMap<>();
    private static final Map<String, String> ALIASES = new HashMap<>();
    private static Map<String, String> localizedFlags;

    static {
        f("afghanistan", "\ud83c\udde6\ud83c\uddeb");
        f("albania", "\ud83c\udde6\ud83c\uddf1");
        f("algeria", "\ud83c\udde9\ud83c\uddff");
        f("andorra", "\ud83c\udde6\ud83c\udde9");
        f("angola", "\ud83c\udde6\ud83c\uddf4");
        f("antigua and barbuda", "\ud83c\udde6\ud83c\uddec");
        f("argentina", "\ud83c\udde6\ud83c\uddf7");
        f("armenia", "\ud83c\udde6\ud83c\uddf2");
        f("australia", "\ud83c\udde6\ud83c\uddfa");
        f("austria", "\ud83c\udde6\ud83c\uddf9");
        f("azerbaijan", "\ud83c\udde6\ud83c\uddff");
        f("bahamas", "\ud83c\udde7\ud83c\uddf8");
        f("bahrain", "\ud83c\udde7\ud83c\udded");
        f("bangladesh", "\ud83c\udde7\ud83c\udde9");
        f("barbados", "\ud83c\udde7\ud83c\udde7");
        f("belarus", "\ud83c\udde7\ud83c\uddfe");
        f("belgium", "\ud83c\udde7\ud83c\uddea");
        f("belize", "\ud83c\udde7\ud83c\uddff");
        f("benin", "\ud83c\udde7\ud83c\uddef");
        f("bhutan", "\ud83c\udde7\ud83c\uddf9");
        f("bolivia", "\ud83c\udde7\ud83c\uddf4");
        f("bosnia and herzegovina", "\ud83c\udde7\ud83c\udde6");
        f("bosnia", "\ud83c\udde7\ud83c\udde6");
        f("botswana", "\ud83c\udde7\ud83c\uddfc");
        f("brazil", "\ud83c\udde7\ud83c\uddf7");
        f("brunei", "\ud83c\udde7\ud83c\uddf3");
        f("bulgaria", "\ud83c\udde7\ud83c\uddec");
        f("burkina faso", "\ud83c\udde7\ud83c\uddeb");
        f("burundi", "\ud83c\udde7\ud83c\uddee");
        f("cambodia", "\ud83c\uddf0\ud83c\udded");
        f("cameroon", "\ud83c\udde8\ud83c\uddf2");
        f("canada", "\ud83c\udde8\ud83c\udde6");
        f("cape verde", "\ud83c\udde8\ud83c\uddfb");
        f("central african republic", "\ud83c\udde8\ud83c\uddeb");
        f("chad", "\ud83c\uddf9\ud83c\udde9");
        f("chile", "\ud83c\udde8\ud83c\uddf1");
        f("china", "\ud83c\udde8\ud83c\uddf3");
        f("colombia", "\ud83c\udde8\ud83c\uddf4");
        f("comoros", "\ud83c\uddf0\ud83c\uddf2");
        f("congo", "\ud83c\udde8\ud83c\uddec");
        f("costa rica", "\ud83c\udde8\ud83c\uddf7");
        f("croatia", "\ud83c\udded\ud83c\uddf7");
        f("cuba", "\ud83c\udde8\ud83c\uddfa");
        f("cyprus", "\ud83c\udde8\ud83c\uddfe");
        f("czech republic", "\ud83c\udde8\ud83c\uddff");
        f("czechia", "\ud83c\udde8\ud83c\uddff");
        f("democratic republic of the congo", "\ud83c\udde8\ud83c\udde9");
        f("denmark", "\ud83c\udde9\ud83c\uddf0");
        f("djibouti", "\ud83c\udde9\ud83c\uddef");
        f("dominica", "\ud83c\udde9\ud83c\uddf2");
        f("dominican republic", "\ud83c\udde9\ud83c\uddf4");
        f("east timor", "\ud83c\uddf9\ud83c\uddf1");
        f("ecuador", "\ud83c\uddea\ud83c\udde8");
        f("egypt", "\ud83c\uddea\ud83c\uddec");
        f("el salvador", "\ud83c\uddf8\ud83c\uddfb");
        f("england", "\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f");
        f("equatorial guinea", "\ud83c\uddec\ud83c\uddf6");
        f("eritrea", "\ud83c\uddea\ud83c\uddf7");
        f("estonia", "\ud83c\uddea\ud83c\uddea");
        f("eswatini", "\ud83c\uddf8\ud83c\uddff");
        f("ethiopia", "\ud83c\uddea\ud83c\uddf9");
        f("europe", "\ud83c\uddea\ud83c\uddfa");
        f("european union", "\ud83c\uddea\ud83c\uddfa");
        f("fiji", "\ud83c\uddeb\ud83c\uddef");
        f("finland", "\ud83c\uddeb\ud83c\uddee");
        f("france", "\ud83c\uddeb\ud83c\uddf7");
        f("gabon", "\ud83c\uddec\ud83c\udde6");
        f("gambia", "\ud83c\uddec\ud83c\uddf2");
        f("georgia", "\ud83c\uddec\ud83c\uddea");
        f("germany", "\ud83c\udde9\ud83c\uddea");
        f("ghana", "\ud83c\uddec\ud83c\udded");
        f("greece", "\ud83c\uddec\ud83c\uddf7");
        f("grenada", "\ud83c\uddec\ud83c\udde9");
        f("guatemala", "\ud83c\uddec\ud83c\uddf9");
        f("guinea", "\ud83c\uddec\ud83c\uddf3");
        f("guinea-bissau", "\ud83c\uddec\ud83c\uddfc");
        f("guyana", "\ud83c\uddec\ud83c\uddfe");
        f("haiti", "\ud83c\udded\ud83c\uddf9");
        f("honduras", "\ud83c\udded\ud83c\uddf3");
        f("hong kong", "\ud83c\udded\ud83c\uddf0");
        f("hungary", "\ud83c\udded\ud83c\uddfa");
        f("iceland", "\ud83c\uddee\ud83c\uddf8");
        f("india", "\ud83c\uddee\ud83c\uddf3");
        f("indonesia", "\ud83c\uddee\ud83c\udde9");
        f("iran", "\ud83c\uddee\ud83c\uddf7");
        f("iraq", "\ud83c\uddee\ud83c\uddf6");
        f("ireland", "\ud83c\uddee\ud83c\uddea");
        f("israel", "\ud83c\uddee\ud83c\uddf1");
        f("italy", "\ud83c\uddee\ud83c\uddf9");
        f("ivory coast", "\ud83c\udde8\ud83c\uddee");
        f("jamaica", "\ud83c\uddef\ud83c\uddf2");
        f("japan", "\ud83c\uddef\ud83c\uddf5");
        f("jordan", "\ud83c\uddef\ud83c\uddf4");
        f("kazakhstan", "\ud83c\uddf0\ud83c\uddff");
        f("kenya", "\ud83c\uddf0\ud83c\uddea");
        f("kiribati", "\ud83c\uddf0\ud83c\uddee");
        f("korea", "\ud83c\uddf0\ud83c\uddf7");
        f("kosovo", "\ud83c\uddfd\ud83c\uddf0");
        f("kuwait", "\ud83c\uddf0\ud83c\uddfc");
        f("kyrgyzstan", "\ud83c\uddf0\ud83c\uddec");
        f("laos", "\ud83c\uddf1\ud83c\udde6");
        f("latvia", "\ud83c\uddf1\ud83c\uddfb");
        f("lebanon", "\ud83c\uddf1\ud83c\udde7");
        f("lesotho", "\ud83c\uddf1\ud83c\uddf8");
        f("liberia", "\ud83c\uddf1\ud83c\uddf7");
        f("libya", "\ud83c\uddf1\ud83c\uddfe");
        f("liechtenstein", "\ud83c\uddf1\ud83c\uddee");
        f("lithuania", "\ud83c\uddf1\ud83c\uddf9");
        f("luxembourg", "\ud83c\uddf1\ud83c\uddfa");
        f("macao", "\ud83c\uddf2\ud83c\uddf4");
        f("macau", "\ud83c\uddf2\ud83c\uddf4");
        f("madagascar", "\ud83c\uddf2\ud83c\uddec");
        f("malawi", "\ud83c\uddf2\ud83c\uddfc");
        f("malaysia", "\ud83c\uddf2\ud83c\uddfe");
        f("maldives", "\ud83c\uddf2\ud83c\uddfb");
        f("mali", "\ud83c\uddf2\ud83c\uddf1");
        f("malta", "\ud83c\uddf2\ud83c\uddf9");
        f("marshall islands", "\ud83c\uddf2\ud83c\udded");
        f("mauritania", "\ud83c\uddf2\ud83c\uddf7");
        f("mauritius", "\ud83c\uddf2\ud83c\uddfa");
        f("mexico", "\ud83c\uddf2\ud83c\uddfd");
        f("micronesia", "\ud83c\uddeb\ud83c\uddf2");
        f("moldova", "\ud83c\uddf2\ud83c\udde9");
        f("monaco", "\ud83c\uddf2\ud83c\udde8");
        f("mongolia", "\ud83c\uddf2\ud83c\uddf3");
        f("montenegro", "\ud83c\uddf2\ud83c\uddea");
        f("morocco", "\ud83c\uddf2\ud83c\udde6");
        f("mozambique", "\ud83c\uddf2\ud83c\uddff");
        f("myanmar", "\ud83c\uddf2\ud83c\uddf2");
        f("burma", "\ud83c\uddf2\ud83c\uddf2");
        f("namibia", "\ud83c\uddf3\ud83c\udde6");
        f("nauru", "\ud83c\uddf3\ud83c\uddf7");
        f("nepal", "\ud83c\uddf3\ud83c\uddf5");
        f("netherlands", "\ud83c\uddf3\ud83c\uddf1");
        f("new zealand", "\ud83c\uddf3\ud83c\uddff");
        f("nicaragua", "\ud83c\uddf3\ud83c\uddee");
        f("niger", "\ud83c\uddf3\ud83c\uddea");
        f("nigeria", "\ud83c\uddf3\ud83c\uddec");
        f("north korea", "\ud83c\uddf0\ud83c\uddf5");
        f("north macedonia", "\ud83c\uddf2\ud83c\uddf0");
        f("macedonia", "\ud83c\uddf2\ud83c\uddf0");
        f("norway", "\ud83c\uddf3\ud83c\uddf4");
        f("oman", "\ud83c\uddf4\ud83c\uddf2");
        f("pakistan", "\ud83c\uddf5\ud83c\uddf0");
        f("palau", "\ud83c\uddf5\ud83c\uddfc");
        f("palestine", "\ud83c\uddf5\ud83c\uddf8");
        f("panama", "\ud83c\uddf5\ud83c\udde6");
        f("papua new guinea", "\ud83c\uddf5\ud83c\uddec");
        f("paraguay", "\ud83c\uddf5\ud83c\uddfe");
        f("peru", "\ud83c\uddf5\ud83c\uddea");
        f("philippines", "\ud83c\uddf5\ud83c\udded");
        f("poland", "\ud83c\uddf5\ud83c\uddf1");
        f("portugal", "\ud83c\uddf5\ud83c\uddf9");
        f("puerto rico", "\ud83c\uddf5\ud83c\uddf7");
        f("qatar", "\ud83c\uddf6\ud83c\udde6");
        f("romania", "\ud83c\uddf7\ud83c\uddf4");
        f("russia", "\ud83c\uddf7\ud83c\uddfa");
        f("russian federation", "\ud83c\uddf7\ud83c\uddfa");
        f("rwanda", "\ud83c\uddf7\ud83c\uddfc");
        f("saint kitts and nevis", "\ud83c\uddf0\ud83c\uddf3");
        f("saint lucia", "\ud83c\uddf1\ud83c\udde8");
        f("saint vincent and the grenadines", "\ud83c\uddfb\ud83c\udde8");
        f("samoa", "\ud83c\uddfc\ud83c\uddf8");
        f("san marino", "\ud83c\uddf8\ud83c\uddf2");
        f("sao tome and principe", "\ud83c\uddf8\ud83c\uddf9");
        f("saudi arabia", "\ud83c\uddf8\ud83c\udde6");
        f("scotland", "\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc73\udb40\udc63\udb40\udc74\udb40\udc7f");
        f("senegal", "\ud83c\uddf8\ud83c\uddf3");
        f("serbia", "\ud83c\uddf7\ud83c\uddf8");
        f("seychelles", "\ud83c\uddf8\ud83c\udde8");
        f("sierra leone", "\ud83c\uddf8\ud83c\uddf1");
        f("singapore", "\ud83c\uddf8\ud83c\uddec");
        f("slovakia", "\ud83c\uddf8\ud83c\uddf0");
        f("slovenia", "\ud83c\uddf8\ud83c\uddee");
        f("solomon islands", "\ud83c\uddf8\ud83c\udde7");
        f("somalia", "\ud83c\uddf8\ud83c\uddf4");
        f("south africa", "\ud83c\uddff\ud83c\udde6");
        f("south korea", "\ud83c\uddf0\ud83c\uddf7");
        f("south sudan", "\ud83c\uddf8\ud83c\uddf8");
        f("spain", "\ud83c\uddea\ud83c\uddf8");
        f("sri lanka", "\ud83c\uddf1\ud83c\uddf0");
        f("sudan", "\ud83c\uddf8\ud83c\udde9");
        f("suriname", "\ud83c\uddf8\ud83c\uddf7");
        f("sweden", "\ud83c\uddf8\ud83c\uddea");
        f("switzerland", "\ud83c\udde8\ud83c\udded");
        f("syria", "\ud83c\uddf8\ud83c\uddfe");
        f("taiwan", "\ud83c\uddf9\ud83c\uddfc");
        f("tajikistan", "\ud83c\uddf9\ud83c\uddef");
        f("tanzania", "\ud83c\uddf9\ud83c\uddff");
        f("thailand", "\ud83c\uddf9\ud83c\udded");
        f("timor-leste", "\ud83c\uddf9\ud83c\uddf1");
        f("togo", "\ud83c\uddf9\ud83c\uddec");
        f("tonga", "\ud83c\uddf9\ud83c\uddf4");
        f("trinidad and tobago", "\ud83c\uddf9\ud83c\uddf9");
        f("tunisia", "\ud83c\uddf9\ud83c\uddf3");
        f("turkey", "\ud83c\uddf9\ud83c\uddf7");
        f("türkiye", "\ud83c\uddf9\ud83c\uddf7");
        f("turkmenistan", "\ud83c\uddf9\ud83c\uddf2");
        f("tuvalu", "\ud83c\uddf9\ud83c\uddfb");
        f("uganda", "\ud83c\uddfa\ud83c\uddec");
        f("ukraine", "\ud83c\uddfa\ud83c\udde6");
        f("united arab emirates", "\ud83c\udde6\ud83c\uddea");
        f("uae", "\ud83c\udde6\ud83c\uddea");
        f("united kingdom", "\ud83c\uddec\ud83c\udde7");
        f("uk", "\ud83c\uddec\ud83c\udde7");
        f("great britain", "\ud83c\uddec\ud83c\udde7");
        f("britain", "\ud83c\uddec\ud83c\udde7");
        f("united states", "\ud83c\uddfa\ud83c\uddf8");
        f("usa", "\ud83c\uddfa\ud83c\uddf8");
        f("us", "\ud83c\uddfa\ud83c\uddf8");
        f("uruguay", "\ud83c\uddfa\ud83c\uddfe");
        f("uzbekistan", "\ud83c\uddfa\ud83c\uddff");
        f("vanuatu", "\ud83c\uddfb\ud83c\uddfa");
        f("vatican city", "\ud83c\uddfb\ud83c\udde6");
        f("venezuela", "\ud83c\uddfb\ud83c\uddea");
        f("vietnam", "\ud83c\uddfb\ud83c\uddf3");
        f("viet nam", "\ud83c\uddfb\ud83c\uddf3");
        f("wales", "\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc77\udb40\udc6c\udb40\udc73\udb40\udc7f");
        f("yemen", "\ud83c\uddfe\ud83c\uddea");
        f("zambia", "\ud83c\uddff\ud83c\uddf2");
        f("zimbabwe", "\ud83c\uddff\ud83c\uddfc");
        f("aland islands", "\ud83c\udde6\ud83c\uddfd");
        f("american samoa", "\ud83c\udde6\ud83c\uddf8");
        f("anguilla", "\ud83c\udde6\ud83c\uddee");
        f("aruba", "\ud83c\udde6\ud83c\uddfc");
        f("bermuda", "\ud83c\udde7\ud83c\uddf2");
        f("bonaire", "\ud83c\udde7\ud83c\uddf6");
        f("british virgin islands", "\ud83c\uddfb\ud83c\uddec");
        f("cayman islands", "\ud83c\uddf0\ud83c\uddfe");
        f("christmas island", "\ud83c\udde8\ud83c\uddfd");
        f("cook islands", "\ud83c\udde8\ud83c\uddf0");
        f("curaçao", "\ud83c\udde8\ud83c\uddfc");
        f("curacao", "\ud83c\udde8\ud83c\uddfc");
        f("falkland islands", "\ud83c\uddeb\ud83c\uddf0");
        f("faroe islands", "\ud83c\uddeb\ud83c\uddf4");
        f("french guiana", "\ud83c\uddec\ud83c\uddeb");
        f("french polynesia", "\ud83c\uddf5\ud83c\uddeb");
        f("gibraltar", "\ud83c\uddec\ud83c\uddee");
        f("greenland", "\ud83c\uddec\ud83c\uddf1");
        f("guadeloupe", "\ud83c\uddec\ud83c\uddf5");
        f("guam", "\ud83c\uddec\ud83c\uddfa");
        f("guernsey", "\ud83c\uddec\ud83c\uddec");
        f("isle of man", "\ud83c\uddee\ud83c\uddf2");
        f("jersey", "\ud83c\uddef\ud83c\uddea");
        f("martinique", "\ud83c\uddf2\ud83c\uddf6");
        f("mayotte", "\ud83c\uddfe\ud83c\uddf9");
        f("montserrat", "\ud83c\uddf2\ud83c\uddf8");
        f("new caledonia", "\ud83c\uddf3\ud83c\udde8");
        f("norfolk island", "\ud83c\uddf3\ud83c\uddeb");
        f("northern mariana islands", "\ud83c\uddf2\ud83c\uddf5");
        f("niue", "\ud83c\uddf3\ud83c\uddfa");
        f("réunion", "\ud83c\uddf7\ud83c\uddea");
        f("reunion", "\ud83c\uddf7\ud83c\uddea");
        f("saint barthelemy", "\ud83c\udde7\ud83c\uddf1");
        f("saint helena", "\ud83c\uddf8\ud83c\udded");
        f("saint martin", "\ud83c\uddf2\ud83c\uddeb");
        f("saint pierre and miquelon", "\ud83c\uddf5\ud83c\uddf2");
        f("sint maarten", "\ud83c\uddf8\ud83c\uddfd");
        f("svalbard", "\ud83c\uddf8\ud83c\uddef");
        f("tokelau", "\ud83c\uddf9\ud83c\uddf0");
        f("turks and caicos islands", "\ud83c\uddf9\ud83c\udde8");
        f("us virgin islands", "\ud83c\uddfb\ud83c\uddee");
        f("wallis and futuna", "\ud83c\uddfc\ud83c\uddeb");
        f("western sahara", "\ud83c\uddea\ud83c\udded");
        f("antarctica", "\ud83c\udde6\ud83c\uddf6");
        f("bouvet island", "\ud83c\udde7\ud83c\uddfb");
        f("british indian ocean territory", "\ud83c\uddee\ud83c\uddf4");
        f("cocos (keeling) islands", "\ud83c\udde8\ud83c\udde8");
        f("french southern territories", "\ud83c\uddf9\ud83c\uddeb");
        f("heard island and mcdonald islands", "\ud83c\udded\ud83c\uddf2");
        f("pitcairn", "\ud83c\uddf5\ud83c\uddf3");
        f("south georgia and the south sandwich islands", "\ud83c\uddec\ud83c\uddf8");
        f("united states minor outlying islands", "\ud83c\uddfa\ud83c\uddf2");

        a("cabo verde", "cape verde");
        a("u.s. virgin islands", "us virgin islands");
        a("united states virgin islands", "us virgin islands");
        a("swaziland", "eswatini");
        a("republic of the congo", "congo");
        a("congo-brazzaville", "congo");
        a("dr congo", "democratic republic of the congo");
        a("congo-kinshasa", "democratic republic of the congo");
        a("republic of korea", "south korea");
        a("democratic people's republic of korea", "north korea");
        a("republic of moldova", "moldova");
        a("holy see", "vatican city");
        a("brunei darussalam", "brunei");
        a("federated states of micronesia", "micronesia");
        a("micronesia (federated states of)", "micronesia");
        a("united republic of tanzania", "tanzania");
        a("state of palestine", "palestine");
        a("united states of america", "united states");
        a("svalbard and jan mayen", "svalbard");
        a("svalbard and jan mayen islands", "svalbard");
        a("saint martin (french part)", "saint martin");
        a("sint maarten (dutch part)", "sint maarten");
        a("wallis and futuna islands", "wallis and futuna");
        a("naoero", "nauru");
        a("bolivia (plurinational state of)", "bolivia");
        a("iran (islamic republic of)", "iran");
        a("netherlands (kingdom of the)", "netherlands");
        a("venezuela (bolivarian republic of)", "venezuela");
        a("falkland islands (malvinas)", "falkland islands");
        a("china, hong kong special administrative region", "hong kong");
        a("china, macao special administrative region", "macao");
        a("united kingdom of great britain and northern ireland", "united kingdom");
        a("bonaire, sint eustatius and saba", "bonaire");
        a("bosnia", "bosnia and herzegovina");
        a("britain", "united kingdom");
        a("burma", "myanmar");
        a("cote d'ivoire", "ivory coast");
        a("curacao", "curaçao");
        a("czechia", "czech republic");
        a("east timor", "timor-leste");
        a("great britain", "united kingdom");
        a("korea", "south korea");
        a("lao people's democratic republic", "laos");
        a("macau", "macao");
        a("macedonia", "north macedonia");
        a("reunion", "réunion");
        a("russian federation", "russia");
        a("syrian arab republic", "syria");
        a("türkiye", "turkey");
        a("uae", "united arab emirates");
        a("uk", "united kingdom");
        a("us", "united states");
        a("usa", "united states");
        a("viet nam", "vietnam");
        for (String[] region : REGIONS) REGION_FLAGS.put(key(region[0]), region[1]);
    }

    private Countries() {
    }

    /** Every country once under its canonical name, then X's regions, for the filter picker. */
    static List<String> pickerNames() {
        Set<String> canonical = new TreeSet<>();
        for (String k : FLAGS.keySet()) canonical.add(ALIASES.containsKey(k) ? ALIASES.get(k) : k);
        List<String> names = new ArrayList<>();
        for (String k : canonical) names.add(titleCase(k));
        for (String[] region : REGIONS) names.add(region[0]);
        return names;
    }

    /** Same capitalisation as X-Posed's formatCountryName(). */
    private static String titleCase(String name) {
        StringBuilder sb = new StringBuilder(name.length());
        for (String word : name.split(" ")) {
            if (sb.length() > 0) sb.append(' ');
            if (!word.isEmpty()) sb.append(Character.toUpperCase(word.charAt(0))).append(word.substring(1));
        }
        return sb.toString();
    }

    private static void f(String name, String flag) {
        FLAGS.put(key(name), flag);
    }

    private static void a(String alias, String canonical) {
        ALIASES.put(key(alias), key(canonical));
    }

    /** Lookup key: lowercase, accents stripped, typographic apostrophes and spaces normalized. */
    private static String key(String name) {
        String s = Normalizer.normalize(name.trim(), Normalizer.Form.NFKD);
        s = MARKS.matcher(s).replaceAll("")
                .replace('‘', '\'').replace('’', '\'').replace('ʼ', '\'');
        return SPACES.matcher(s).replaceAll(" ").toLowerCase(Locale.ROOT);
    }

    /** Key that matches every spelling of a location, for comparing filters. Memoized: there are few locations. */
    static String canonicalKey(String location) {
        String cached = CANONICAL.get(location);
        if (cached != null) return cached;
        String k = key(location);
        String canonical = ALIASES.get(k);
        String result = canonical != null ? canonical : k;
        if (CANONICAL.size() < MEMO_LIMIT) CANONICAL.put(location, result);
        return result;
    }

    /** True when the name is one of the English spellings X-Posed knows. */
    static boolean isKnownEnglish(String location) {
        if (location == null) return false;
        String k = key(location);
        String canonical = ALIASES.get(k);
        return FLAGS.containsKey(canonical != null ? canonical : k);
    }

    /** The flag emoji for a location, or null when there is none (regions, unknown names). */
    static String flagFor(String location) {
        if (location == null) return null;
        String cached = FLAG_MEMO.get(location);
        if (cached != null) return cached.isEmpty() ? null : cached;
        String k = key(location);
        String canonical = ALIASES.get(k);
        String flag = FLAGS.get(canonical != null ? canonical : k);
        if (flag == null) flag = REGION_FLAGS.get(k);
        if (flag == null) flag = localized().get(k);
        if (FLAG_MEMO.size() < MEMO_LIMIT) FLAG_MEMO.put(location, flag == null ? "" : flag);
        return flag;
    }

    private static synchronized Map<String, String> localized() {
        if (localizedFlags == null) {
            Map<String, String> map = new HashMap<>();
            Locale display = Locale.getDefault();
            for (String code : Locale.getISOCountries()) {
                Locale country = new Locale("", code);
                String flag = regionalIndicators(code);
                map.put(key(country.getDisplayCountry(display)), flag);
                map.put(key(country.getDisplayCountry(Locale.ENGLISH)), flag);
            }
            localizedFlags = map;
        }
        return localizedFlags;
    }

    private static String regionalIndicators(String isoCode) {
        StringBuilder sb = new StringBuilder(4);
        for (int i = 0; i < isoCode.length(); i++) {
            sb.appendCodePoint(0x1F1E6 + (isoCode.charAt(i) - 'A'));
        }
        return sb.toString();
    }
}
