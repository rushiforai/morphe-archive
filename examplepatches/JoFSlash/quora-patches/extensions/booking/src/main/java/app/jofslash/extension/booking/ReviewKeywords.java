package app.jofslash.extension.booking;

/**
 * Review check keyword lists for the languages other than English (English lives in
 * {@link Strings}). Each language has the same six rows as the English lists:
 *
 * <ol>
 *   <li>tier 1, "Scam / money taken";</li>
 *   <li>tier 2, "Extra charges / hidden fees";</li>
 *   <li>tier 2, "Asked to pay outside Booking";</li>
 *   <li>tier 2, "Not as described";</li>
 *   <li>tier 2, "Booking not honoured";</li>
 *   <li>negations: phrases cut out of the text before matching, so that "no hidden fees" doesn't
 *       count as "hidden fees".</li>
 * </ol>
 *
 * Text and keywords are normalised the same way before matching (see {@link ReviewMatcher}):
 * lower case, diacritics stripped, ß to ss, ł to l, ae/oe/ue folded to a/o/u (so German "ü", "ue"
 * and a bare "u" all match) and every run of punctuation or white space turned into one space.
 * So a keyword can be written with or without diacritics, and a keyword that starts or ends with
 * a space only matches at a word boundary (" podvod " matches "Podvod!" but not "podvodná").
 *
 * Matching is substring matching, so a stem like "oszuk" catches oszukali / oszukani /
 * oszukańczy. Stems were checked against common innocent words in all eight languages (the
 * lists are merged, so a stem must be safe in every language). Deliberately left out, because
 * they hit innocent text:
 *
 * <ul>
 *   <li>Slovak/Czech bare "podvod": "podvodná masáž" / "podvodní" is an underwater massage in
 *       spa hotels, so only the noun forms at a word boundary and "podvodník" are used; Czech
 *       "podved" also hits "podvědomí" (subconscious); genitive "skrytých poplatkov / poplatků"
 *       is almost always "bez skrytých poplatkov" (no hidden fees).</li>
 *   <li>German bare "betrug": also the past tense of "betragen" ("der Preis betrug 200 Euro");
 *       "versteckten Kosten" is nearly always "keine versteckten Kosten"; "Ortstaxe" / city tax
 *       is a normal, legal Vienna charge; bare "bar bezahlen" also hits "an der Bar bezahlen".</li>
 *   <li>Polish "ukrytych opłat" (genitive, used after "bez" / "żadnych"); "anulowali" alone also
 *       hits "anulowaliśmy" (we cancelled).</li>
 *   <li>Hungarian bare "csaló": hits "csalódás" / "csalódott" (disappointed), so only whole
 *       words; bare "becsap": "becsapódott az ajtó" (the door slammed); "csalóka" (deceptive)
 *       is kept out of tier 1; "nem létező" alone is also "nem létező wifi".</li>
 *   <li>Italian "truff": hits English "truffle"; "non rimborsabile" is the non-refundable rate,
 *       so only "rimborsat-" past forms; "ripagato" means "worth it"; "frode" is also a
 *       Norwegian first name (hosts get named); "più del previsto" is also "liked it more than
 *       expected".</li>
 *   <li>French "non rembours-" / "remboursable" (non-refundable rate), "volé" (also "volet",
 *       shutters), "deux fois plus/moins cher" (twice as expensive / half price).</li>
 *   <li>Spanish "timo" inside "último", "ladri" inside "ladrillo", "estaf-" inside "estafeta"
 *       (only "estafa" is used), "sin reembolso" (the non-refundable rate).</li>
 *   <li>Everywhere: "we cancelled the booking" forms, so only "they cancelled" forms are used;
 *       bare "doesn't exist"; bare "police" (police called for noise); "stole our hearts"-style
 *       idioms are cut out as negations.</li>
 * </ul>
 */
final class ReviewKeywords {
    private ReviewKeywords() {
    }

    /** Each head followed by each tail (callers include the space). */
    private static String[] x(String[] heads, String... tails) {
        String[] out = new String[heads.length * tails.length];
        int n = 0;
        for (String head : heads) {
            for (String tail : tails) {
                out[n++] = head + tail;
            }
        }
        return out;
    }

    private static String[] a(String... items) {
        return items;
    }

    /** Flattens strings and string arrays into one row. */
    private static String[] k(Object... parts) {
        java.util.ArrayList<String> out = new java.util.ArrayList<>();
        for (Object part : parts) {
            if (part instanceof String) {
                out.add((String) part);
            } else {
                for (String s : (String[]) part) out.add(s);
            }
        }
        return out.toArray(new String[0]);
    }

    // ---------------------------------------------------------------------------------------
    // Slovak
    static final String[][] SK = {
            // Tier 1: scam / money taken
            k(" podvod ", " podvodu ", " podvodom ", " podvody ", " podvodov ",
                    "podvodník", "podvodníc", "podviedli", "podviedol", "podviedla",
                    "okrad", "zlodejina", " zlodeji ", "ukradli", "ukradol",
                    x(a("nevrátili", "nevrátili nám", "nevrátili mi", "nevrátil nám", "nevrátil mi"),
                            " peniaze", " ani cent", " ani euro"),
                    "peniaze nám nevrátili", "peniaze mi nevrátili", "peniaze nevrátili",
                    "peniaze sme nedostali späť", "peniaze sme nikdy nedostali",
                    "nedostali sme peniaze späť", "nedostali sme späť peniaze",
                    "odmietli vrátiť peniaze", "odmietli nám vrátiť peniaze",
                    "čakáme na peniaze", "čakám na peniaze",
                    "žiadna refundácia", "odmietli refundáciu", "nedostali sme refundáciu",
                    "strhli dvakrát", "dvakrát strhli", "strhli 2x", "účtovali dvakrát",
                    "zaplatili sme dvakrát", "zaplatiť dvakrát", "platiť dvakrát",
                    "zaplatiť znova", "zaplatiť znovu", "zaplatiť ešte raz",
                    "strhli bez", "strhli nám bez", "strhli mi bez",
                    "neoprávnená platba", "neoprávnenú platbu", "neoprávnene strhli",
                    "neoprávnene stiahli",
                    "vyžadovali hotovosť", "vyžadovali platbu v hotovosti", "trvali na hotovosti",
                    "trvali na platbe v hotovosti", "nútili nás zaplatiť", "donútili nás zaplatiť",
                    x(a("rezervácia", "ubytovanie", "apartmán", "hotel", "izba"), " neexist"),
                    "neexistujúce ubytovanie", "neexistujúci apartmán", "falošný inzerát",
                    "falošná ponuka", "falošné ubytovanie", "trestné oznámenie",
                    "nahlásili sme to na políc", "nahlásili sme na políc"),
            // Extra charges / hidden fees
            k(x(a("skryté", "skrytý", "dodatočné", "dodatočný", "extra"), " poplat"),
                    "účtovali navyše", "účtovali nám navyše", "účtovali viac", "účtovali nám viac",
                    "museli sme doplatiť", "chceli doplatiť", "chceli od nás doplatiť",
                    x(a("nevrátili", "nevrátili nám", "nevrátili mi", "zadržali", "ponechali si",
                            "nechali si"), " záloh", " kauci", " depozit")),
            // Asked to pay outside Booking
            k("iba v hotovosti", "len v hotovosti", "iba hotovosť", "len hotovosť",
                    "zaplatiť v hotovosti", "platiť v hotovosti", "platba v hotovosti",
                    "bankovým prevodom", "bankový prevod", "prevodom na účet", "mimo booking"),
            // Not as described
            k(x(a("nezodpovedá", "nezodpovedal", "nezodpovedala", "nezodpovedalo",
                            "nezodpovedali", "nezodpovedajú"),
                            " popis", " fotk", " fotograf", " realit", " inzerát", " ponuk"),
                    "nevyzerá ako na fotk", "nevyzeralo ako na fotk", "nevyzerala ako na fotk",
                    "vôbec nie ako na fotk", "nič spoločné s fotk", "nič spoločné s popis",
                    "klamliv", "klamav", "zavádzajúc"),
            // Booking not honoured
            k(x(a("zrušili", "zrušil", "zrušila"),
                            " rezervác", " nám rezervác", " mi rezervác", " našu rezervác",
                            " moju rezervác"),
                    "nemali našu rezerváciu", "nemali žiadnu rezerváciu", "nemali rezerváciu",
                    "rezervácia nebola v systéme", "rezerváciu nenašli", "nenašli našu rezerváciu",
                    "nenašli rezerváciu",
                    x(a("poslali nás", "presunuli nás", "presťahovali nás", "ubytovali nás"),
                            " do iného hotel", " do iného ubytovan", " do iného apartmán",
                            " v inom hoteli", " v inom ubytovaní"),
                    "nemali pre nás izbu", "nemali pre nás voľnú izbu",
                    "izba nebola k dispozícii"),
            // Negations
            k("žiadne skryté", "žiadny skrytý", "žiadne dodatočné", "žiadne extra poplat",
                    "nie je to podvod", "žiadny podvod", "dvakrát viac", "dvakrát drahšie",
                    "dvakrát toľko",
                    x(a("ukradol", "ukradla", "ukradli", "ukradlo"),
                            " nám srdce", " srdce", " naše srdce", " moje srdce")),
    };

    // ---------------------------------------------------------------------------------------
    // Czech
    static final String[][] CS = {
            k(" podvod ", " podvodu ", " podvodem ", " podvody ", "podvodník", "podvodníc",
                    "podvedl", "podvedli", "podvedla", "podvedení",
                    "okrad", "zlodějina", " zloději ", "ukradl",
                    x(a("nevrátili", "nevrátili nám", "nevrátili mi", "nevrátil nám", "nevrátil mi"),
                            " peníze", " ani korunu"),
                    "peníze nám nevrátili", "peníze mi nevrátili", "peníze nevrátili",
                    "peníze jsme nedostali zpět", "peníze jsme nikdy nedostali",
                    "nedostali jsme peníze zpět", "nedostali jsme zpět peníze",
                    "odmítli vrátit peníze", "odmítli nám vrátit peníze",
                    "čekáme na peníze", "čekám na peníze",
                    "žádná refundace", "odmítli refundaci", "nedostali jsme refundaci",
                    "strhli dvakrát", "dvakrát strhli", "strhli 2x", "účtovali dvakrát",
                    "zaplatili jsme dvakrát", "zaplatit dvakrát", "platit dvakrát",
                    "zaplatit znovu", "zaplatit znova", "zaplatit ještě jednou",
                    "strhli bez", "strhli nám bez", "strhli mi bez",
                    "neoprávněná platba", "neoprávněnou platbu", "neoprávněně strhli",
                    "neoprávněně stáhli",
                    "vyžadovali hotovost", "požadovali hotovost", "požadovali platbu v hotovosti",
                    "trvali na hotovosti", "nutili nás zaplatit", "donutili nás zaplatit",
                    x(a("rezervace", "ubytování", "apartmán", "hotel", "pokoj"), " neexist"),
                    "neexistující ubytování", "neexistující apartmán", "falešný inzerát",
                    "falešná nabídka", "falešné ubytování", "trestní oznámení",
                    "nahlásili jsme to na polic", "nahlásili jsme na polic"),
            k(x(a("skryté", "skrytý", "dodatečné", "dodatečný", "extra"), " poplat"),
                    "účtovali víc", "účtovali více", "účtovali nám víc", "účtovali nám více",
                    "účtovali navíc", "účtovali nám navíc",
                    "museli jsme doplatit", "chtěli doplatit", "chtěli po nás doplatit",
                    x(a("nevrátili", "nevrátili nám", "nevrátili mi", "zadrželi", "nechali si"),
                            " zálohu", " kauci", " depozit")),
            k("pouze v hotovosti", "jen v hotovosti", "pouze hotovost", "jen hotovost",
                    "zaplatit v hotovosti", "platit v hotovosti", "platba v hotovosti",
                    "bankovním převodem", "bankovní převod", "převodem na účet", "mimo booking"),
            k(x(a("neodpovídá", "neodpovídal", "neodpovídala", "neodpovídalo", "neodpovídaly",
                            "neodpovídají"),
                            " popis", " fotk", " fotograf", " realit", " skutečnost", " inzerát",
                            " nabíd"),
                    "nevypadá jako na fotk", "nevypadalo jako na fotk", "nevypadal jako na fotk",
                    "vůbec ne jako na fotk", "nic společného s fotk", "nic společného s popis",
                    "klamav", "zavádějíc"),
            k(x(a("zrušili", "zrušil", "zrušila"),
                            " rezervac", " nám rezervac", " mi rezervac", " naši rezervac",
                            " moji rezervac"),
                    "neměli naši rezervaci", "neměli žádnou rezervaci", "neměli rezervaci",
                    "rezervace nebyla v systému", "nenašli naši rezervaci", "nenašli rezervaci",
                    "rezervaci nenašli",
                    x(a("poslali nás", "přesunuli nás", "přestěhovali nás", "ubytovali nás"),
                            " do jiného hotel", " do jiného ubytován", " do jiného apartmán",
                            " v jiném hotelu", " v jiném ubytování"),
                    "neměli pro nás pokoj", "neměli pro nás volný pokoj",
                    "pokoj nebyl k dispozici"),
            k("žádné skryté", "žádný skrytý", "žádné dodatečné", "žádné extra poplat",
                    "není to podvod", "žádný podvod", "dvakrát víc", "dvakrát více",
                    "dvakrát dražší", "dvakrát tolik",
                    x(a("ukradl", "ukradla", "ukradli", "ukradlo"),
                            " nám srdce", " srdce", " naše srdce", " moje srdce")),
    };

    // ---------------------------------------------------------------------------------------
    // German
    static final String[][] DE = {
            k("betrüger", "betrogen", "betrugsmasche", "betrugsfall", "abzock", "abgezockt",
                    " nepp ", "gauner", "bestohlen", "gestohlen", "geklaut",
                    "geld nicht zurück", "geld nie zurück", "kein geld zurück",
                    "geld bis heute nicht", "geld nicht erstattet", "geld nicht zurückerstattet",
                    "nicht erstattet", "nicht zurückerstattet", "nie erstattet",
                    "keine erstattung", "keine rückerstattung", "erstattung verweigert",
                    "rückerstattung verweigert", "verweigert die erstattung",
                    "verweigert die rückerstattung", "weigert sich das geld",
                    "weigerte sich das geld", "immer noch auf unser geld",
                    "immer noch auf mein geld", "bis heute auf unser geld",
                    "doppelt abgebucht", "zweimal abgebucht", "doppelt belastet",
                    "zweimal belastet", "doppelt berechnet", "zweimal berechnet",
                    "doppelt bezahlt", "zweimal bezahlt",
                    x(a("nochmal", "nochmals", "noch einmal", "erneut"), " bezahlen", " zahlen"),
                    x(a("ohne zustimmung", "ohne erlaubnis", "ohne genehmigung", "ohne rücksprache",
                            "ohne rückfrage", "unberechtigt", "unerlaubt"),
                            " abgebucht", " belastet"),
                    "unberechtigte abbuchung", "unerlaubte abbuchung", "unautorisierte abbuchung",
                    "bargeld verlangt", "verlangten bargeld", "verlangte bargeld",
                    "barzahlung verlangt", "bestanden auf barzahlung", "bestand auf barzahlung",
                    "zur zahlung gezwungen", "gezwungen zu zahlen", "gezwungen zu bezahlen",
                    x(a("unterkunft", "wohnung", "ferienwohnung", "hotel", "apartment", "buchung",
                            "reservierung"), " existiert nicht", " existierte nicht",
                            " gab es nicht"),
                    "fake inserat", "gefälschtes inserat", "gefälschte anzeige", "falsches inserat",
                    "anzeige erstattet", "anzeige bei der polizei", "polizei eingeschaltet",
                    "bei der polizei angezeigt", "polizeilich angezeigt", "strafanzeige"),
            k("versteckte kosten", "versteckte gebühr", "zusätzliche kosten",
                    "zusätzliche gebühr", "zusatzgebühr", "extrakosten", "extra kosten",
                    "extragebühr", "extra gebühr", "mehr berechnet", "zu viel berechnet",
                    "zuviel berechnet", "zu viel verlangt", "zuviel verlangt",
                    "nachträglich berechnet", "nachträglich abgebucht", "nachberechnet",
                    "kaution nicht zurück", "kaution einbehalten", "kaution behalten",
                    "kaution nicht erstattet", "kaution wurde nicht", "kaution wurde einbehalten",
                    "kaution wurde behalten"),
            k(" nur bar ", "nur in bar", "nur barzahlung", "nur bargeld", "nur cash",
                    "in bar bezahlen", "in bar zahlen", "per überweisung", "banküberweisung",
                    "vorab überweisen", "im voraus überweisen", "außerhalb von booking",
                    "außerhalb booking", "außerhalb der plattform", "an booking vorbei"),
            k("nicht wie beschrieben", "nicht wie auf den bildern", "nicht wie auf den fotos",
                    "nicht wie im inserat",
                    x(a("entspricht nicht", "entsprach nicht", "entsprechen nicht",
                            "entsprachen nicht"),
                            " der beschreibung", " den bildern", " den fotos", " dem inserat",
                            " der realität", " den angaben", " der anzeige"),
                    "nichts mit den bildern", "nichts mit den fotos", "nichts mit der beschreibung",
                    "irreführend", "falsche angaben", "geschönte bilder", "geschönte fotos",
                    "bilder geschönt", "fotos geschönt", "bilder täuschen", "fotos täuschen"),
            k(x(a("vom hotel", "vom vermieter", "vom gastgeber", "vom host", "vom eigentümer",
                            "vom besitzer", "von der unterkunft"), " storniert"),
                    x(a("hat unsere", "hat meine", "hat die"),
                            " buchung storniert", " reservierung storniert", " buchung gecancelt"),
                    "überbucht", "keine reservierung vorhanden", "keine buchung vorhanden",
                    "buchung nicht gefunden", "reservierung nicht gefunden",
                    "fanden unsere buchung nicht", "fanden unsere reservierung nicht",
                    "hatten unsere buchung nicht", "hatten unsere reservierung nicht",
                    x(a("in ein anderes hotel", "in eine andere unterkunft", "in ein anderes haus"),
                            " geschickt", " verlegt", " umquartiert", " umgebucht"),
                    "ausquartiert", "kein zimmer für uns", "kein zimmer mehr für uns",
                    "zimmer war nicht verfügbar"),
            k("keine versteckte", "keine zusätzliche", "ohne versteckte", "ohne zusätzliche",
                    "keine extrakosten", "keine extra kosten", "keine abzocke", "kein betrug",
                    "herz gestohlen", "herzen gestohlen"),
    };

    // ---------------------------------------------------------------------------------------
    // Polish
    static final String[][] PL = {
            k("oszust", "oszuśc", "oszuk", "naciągacz", "naciągnęli", "naciągnięci", "naciągają",
                    "złodziejstw", " złodzieje ", "okrad", "ukradli", "ukradziono", "skradziono",
                    x(a("nie zwrócili", "nie zwrócono", "nie oddali", "nie oddano"),
                            " pieniędzy", " nam pieniędzy", " mi pieniędzy", " kasy"),
                    x(a("nie otrzymaliśmy", "nie dostaliśmy", "nie otrzymałem", "nie otrzymałam",
                            "nie dostałem", "nie dostałam"), " zwrotu"),
                    "odmówili zwrotu", "odmowa zwrotu", "brak zwrotu pieniędzy",
                    "pieniędzy nie zwrócono", "pieniędzy nie oddano",
                    "pieniądze nie zostały zwrócone", "nadal czekamy na zwrot",
                    "nadal czekam na zwrot", "wciąż czekamy na zwrot", "wciąż czekam na zwrot",
                    x(a("pobrali", "pobrano", "obciążyli", "obciążono", "zapłaciliśmy", "zapłacić",
                            "płacić"), " dwa razy", " dwukrotnie", " podwójnie"),
                    "dwukrotnie pobrali", "dwukrotnie pobrano", "podwójnie pobrali",
                    "dwukrotnie obciążono", "zapłacić ponownie", "zapłacić jeszcze raz",
                    "zapłacić drugi raz", "płacić drugi raz", "płacić ponownie",
                    "pobrali bez zgody", "pobrano bez zgody", "pobrali z karty bez",
                    "pobrano z karty bez", "obciążyli kartę bez", "nieautoryzowan",
                    "zażądali gotówki", "żądali gotówki", "wymagali gotówki",
                    "domagali się gotówki", "zmusili do zapłaty", "zmusili nas do zapłaty",
                    "zmuszeni do zapłaty",
                    x(a("rezerwacja", "obiekt", "hotel", "apartament", "mieszkanie", "oferta"),
                            " nie istni"),
                    "nieistniejąc", "fałszywa oferta", "fałszywe ogłoszenie", "fałszywy obiekt",
                    "zgłosiliśmy na policj", "zgłosiliśmy sprawę na policj", "zgłoszenie na policj",
                    "zawiadomienie na policj", "zawiadomiliśmy policj",
                    "zawiadomienie o przestępstw"),
            k("ukryte opłat", "ukryta opłat", "ukryte koszt", "ukryty koszt",
                    "dodatkowe opłaty", "dodatkowa opłata", "dodatkowe koszty", "dodatkowy koszt",
                    "doliczyli", "doliczono", "zawyżon", "pobrali więcej", "policzyli więcej",
                    "policzyli nam więcej", "kazali dopłacić", "musieliśmy dopłacić",
                    "trzeba było dopłacić",
                    x(a("nie zwrócili", "nie oddali", "nie zwrócono", "nie oddano", "zatrzymali"),
                            " kaucj", " nam kaucj", " depozyt"),
                    "kaucja nie została zwrócona"),
            k("tylko gotówk", "tylko za gotówk", "tylko w gotówce", "płatność gotówk",
                    "płacić gotówk", "przelewem", "przelew na konto", "przelewu na konto",
                    "poza booking", "poza platform"),
            k(x(a("niezgodne", "niezgodny", "niezgodna", "niezgodnie"),
                            " z opisem", " ze zdjęciami", " z ogłoszeniem", " z rzeczywistością"),
                    "nie tak jak na zdjęciach", "nie jak na zdjęciach", "inaczej niż na zdjęciach",
                    "inny niż na zdjęciach", "inne niż na zdjęciach", "nic wspólnego ze zdjęciami",
                    "nic wspólnego z opisem",
                    x(a("nie odpowiada", "nie odpowiadał", "nie odpowiadała", "nie odpowiadało",
                            "nie odpowiadają", "nie odpowiadały"),
                            " opisowi", " zdjęciom", " rzeczywistości"),
                    x(a("wprowadza", "wprowadzają", "wprowadzające", "wprowadzający",
                            "wprowadzająca", "wprowadzili", "wprowadził"), " w błąd")),
            k(x(a("anulowali", "anulowano", "odwołali", "odwołano"),
                            " rezerwacj", " nam rezerwacj", " moją rezerwacj", " naszą rezerwacj"),
                    "nadkomplet", "nie mieli naszej rezerwacji", "nie mieli rezerwacji",
                    "nie było naszej rezerwacji", "brak rezerwacji w systemie",
                    "nie znaleźli naszej rezerwacji", "nie znaleziono rezerwacji",
                    "rezerwacji nie było",
                    x(a("przenieśli nas", "przeniesiono nas", "odesłali nas", "odesłano nas",
                            "wysłali nas", "wysłano nas", "przekwaterowali nas",
                            "przekwaterowano nas"),
                            " do innego hotelu", " do innego obiektu", " do innego apartamentu"),
                    "nie mieli dla nas pokoju", "nie było dla nas pokoju"),
            k("bez ukrytych", "żadnych ukrytych", "bez dodatkowych", "żadnych dodatkowych",
                    "nie ma dodatkowych", "to nie oszustwo", "żadne oszustwo",
                    "dwa razy więcej", "dwa razy drożej", "dwa razy taniej"),
    };

    // ---------------------------------------------------------------------------------------
    // Hungarian
    static final String[][] HU = {
            k("átverés", "átvert", "átvern", "csalás", " csaló ", " csalók ", " csalót ",
                    " csalókat ", " csalókkal ", "becsaptak minket", "minket becsaptak",
                    "becsaptak bennünket", "lehúzás", "lehúztak minket", "minket lehúztak",
                    "meglop", "ellop",
                    "nem kaptuk vissza a pénz", "a pénzt nem kaptuk vissza",
                    "a pénzünket nem kaptuk vissza", "nem kaptam vissza a pénz",
                    "nem adták vissza a pénz", "a pénzt nem adták vissza",
                    "nem fizették vissza", "nem fizetik vissza", "nem térítették vissza",
                    "nem térítik vissza", "nincs visszatérítés", "nem kaptunk visszatérítés",
                    "megtagadták a visszatérítés", "visszatérítést megtagadták",
                    x(a("kétszer", "duplán"), " vonták le", " vontak le", " terheltek",
                            " terhelték", " fizettünk", " kellett fizetni", " kellett kifizetni"),
                    "újra kellett fizet", "újra fizetnünk", "még egyszer kellett fizet",
                    "még egyszer fizetnünk", "nélkül levon", "nélkül terhel",
                    "készpénzt követel", "ragaszkodtak a készpénz", "fizetésre kényszerít",
                    "fizetni kényszerít",
                    x(a("a szállás", "a szálloda", "a foglalás", "az apartman", "a lakás"),
                            " nem létezik", " nem létezett"),
                    "nem létező szállás", "nem létező apartman", "nem létező szálloda",
                    "nem létező foglalás", "hamis hirdetés", "hamis ajánlat", "feljelent"),
            k("rejtett költség", "rejtett díj", "extra díj", "extra költség", "plusz díj",
                    "plusz költség", "pluszban kellett fizet", "pluszt kellett fizet",
                    "többet számláz", "többet számoltak fel", "többet kértek",
                    "utólag felszámol", "utólag levon", "túlszámláz",
                    "kauciót nem adták vissza", "kauciót nem kaptuk vissza",
                    "nem adták vissza a kaució", "nem kaptuk vissza a kaució",
                    "visszatartották a kaució", "megtartották a kaució"),
            k("csak készpénz", "készpénzben kellett fizet", "készpénzzel kellett fizet",
                    "készpénzt kértek", "átutal", "bookingon kívül", "booking megkerülés"),
            k(x(a("nem felel meg", "nem felelt meg", "nem felelnek meg", "nem feleltek meg",
                            "nem egyezik", "nem egyezett", "nem egyeznek"),
                            " a leírás", " a képek", " a hirdetés", " a valóság", " a fotók"),
                    "nem olyan mint a képeken", "nem olyan volt mint a képeken",
                    "nem úgy néz ki mint a képeken", "nem úgy nézett ki mint a képeken",
                    "más mint a képeken", "köszönőviszonyban sincs", "félrevezet", "megtéveszt"),
            k(x(a("lemondták a", "lemondta a", "törölték a", "törölte a"), " foglalás"),
                    "túlfoglal", "nem találták a foglalás", "nem volt meg a foglalás",
                    "nem volt nyoma a foglalás",
                    x(a("másik szállodába", "másik szállásra", "másik szálláshelyre",
                            "másik apartmanba"),
                            " küldtek", " tettek át", " helyeztek át", " vittek át"),
                    "nem volt szoba számunkra", "nem volt szobájuk számunkra"),
            k("nincs rejtett", "nincsenek rejtett", "nincs extra", "nincs plusz",
                    "rejtett költségek nélkül", "rejtett díjak nélkül", "nem átverés",
                    "nem csalás", "kétszer annyi", "kétszer drágább", "ellopta a szív",
                    "ellopták a szív"),
    };

    // ---------------------------------------------------------------------------------------
    // Italian
    static final String[][] IT = {
            k("truffa", "truffat", "truffator", "truffaldin", "fregatura", "fregat",
                    "imbrogli", "raggir", " ladri ", " ladro ", "derubat", " rubat",
                    x(a("non ci hanno", "non mi hanno", "non hanno", "mai"), " rimborsat",
                            " restituito i soldi", " restituito il denaro", " restituito l importo",
                            " ridato i soldi"),
                    "nessun rimborso", "rifiutato il rimborso", "negato il rimborso",
                    "rimborso negato", "rimborso rifiutato", "rimborso mai",
                    x(a("rifiutati", "rifiutato", "rifiutata", "rifiutate"),
                            " di rimborsar", " di restituir"),
                    "soldi mai restituiti", "soldi non restituiti", "soldi mai rimborsat",
                    "ancora in attesa del rimborso", "aspettiamo ancora il rimborso",
                    "aspetto ancora il rimborso",
                    x(a("addebitato", "addebitati", "addebitata", "addebitate", "prelevato",
                            "prelevati", "pagato", "pagati", "pagare", "addebitare"),
                            " due volte", " 2 volte"),
                    "addebito doppio", "doppio addebito", "doppio pagamento", "pagare di nuovo",
                    "pagare nuovamente", "pagare una seconda volta",
                    "addebito non autorizzat", "addebiti non autorizzat",
                    "pagamento non autorizzat",
                    x(a("addebitato", "addebitati", "prelevato", "prelevati"),
                            " senza autorizzazione", " senza consenso", " senza il nostro consenso",
                            " senza preavviso"),
                    "preteso contanti", "preteso il pagamento in contanti", "pretendevano contanti",
                    "pretendevano il pagamento in contanti", "obbligati a pagare",
                    "costretti a pagare",
                    x(a("la struttura", "l appartamento", "l hotel", "la prenotazione", "la casa",
                            "l alloggio"), " non esiste", " non esisteva"),
                    "prenotazione inesistente", "struttura inesistente", "appartamento inesistente",
                    "annuncio falso", "annuncio fasullo", "falso annuncio", "sporto denuncia",
                    "denuncia ai carabinieri", "denuncia alla polizia", "denunciato alla polizia",
                    "denunciati alla polizia", "fatto denuncia"),
            k("costi nascosti", "costo nascosto", "spese nascoste", "tariffe nascoste",
                    "costi aggiuntivi", "costo aggiuntivo", "costi extra", "costo extra",
                    "spese extra", "spese aggiuntive", "addebito extra", "addebiti extra",
                    "fatto pagare di più", "fatto pagare in più", "addebitato di più",
                    "addebitato in più",
                    "cauzione non restituita", "non hanno restituito la cauzione",
                    "non ci hanno restituito la cauzione", "trattenuto la cauzione",
                    "cauzione trattenuta", "tenuto la cauzione"),
            k("solo contanti", "solo in contanti", "solo cash", "pagamento in contanti",
                    "pagare in contanti", "bonifico", "fuori da booking", "fuori booking",
                    "al di fuori di booking", "al di fuori della piattaforma"),
            k(x(a("non corrisponde", "non corrispondeva", "non corrispondono",
                            "non corrispondevano"),
                            " alla descrizione", " alle foto", " alle immagini", " alla realtà",
                            " all annuncio", " a quanto descritto"),
                    x(a("diverso", "diversa", "diversi", "diverse"),
                            " dalle foto", " dalla descrizione", " dalle immagini",
                            " dall annuncio"),
                    x(a("niente a che vedere", "nulla a che vedere", "niente a che fare",
                            "nulla a che fare"),
                            " con le foto", " con la descrizione", " con le immagini",
                            " con l annuncio"),
                    "non come nelle foto", "non come in foto", "ingannevol", "fuorviant",
                    "foto ritoccate"),
            k(x(a("hanno cancellato", "ha cancellato", "hanno annullato", "ha annullato"),
                            " la prenotazione", " la nostra prenotazione", " la mia prenotazione"),
                    x(a("prenotazione cancellata", "prenotazione annullata"),
                            " dalla struttura", " dall hotel", " dal proprietario", " dall host"),
                    "non risultava la prenotazione", "non risultava la nostra prenotazione",
                    "la prenotazione non risultava", "nessuna prenotazione a nostro nome",
                    "non trovavano la prenotazione", "non trovavano la nostra prenotazione",
                    "non avevano la nostra prenotazione", "non avevano la prenotazione",
                    x(a("mandati", "spostati", "trasferiti", "dirottati", "sistemati",
                            "ricollocati"),
                            " in un altro hotel", " in un altra struttura", " in un altro albergo",
                            " in un altro appartamento"),
                    "non c era una camera per noi", "non avevano una camera per noi",
                    "non avevano camere per noi"),
            k("senza costi", "nessun costo", "nessuna spesa", "nessun addebito",
                    "non ci sono costi", "nessuna truffa", "non è una truffa",
                    "due volte più", "due volte meno", "rubato il cuore", "rubato il nostro cuore"),
    };

    // ---------------------------------------------------------------------------------------
    // French
    static final String[][] FR = {
            k("arnaqu", "escroc", "escroquer", "voleur",
                    "nous ont volé", "on nous a volé", "ont volé notre", "ont volé mon",
                    "ont volé ma", "pas remboursé", "jamais remboursé", "pas été remboursé",
                    "aucun remboursement", "pas de remboursement", "refusé de rembourser",
                    "refusé le remboursement", "refusent de rembourser", "refusé de nous rembourser",
                    "pas rendu l argent", "jamais rendu l argent", "pas rendu notre argent",
                    "pas rendu mon argent", "attendons toujours le remboursement",
                    "attends toujours le remboursement", "attendons toujours notre argent",
                    "attends toujours mon argent",
                    x(a("débité", "débités", "prélevé", "prélevés", "facturé", "facturés", "payé",
                            "payer", "encaissé"), " deux fois", " 2 fois"),
                    "double prélèvement", "double débit", "double facturation",
                    "payer à nouveau", "payer de nouveau", "repayer", "payer une deuxième fois",
                    "payer une seconde fois",
                    "débit non autoris", "prélèvement non autoris", "paiement non autoris",
                    "transaction non autoris",
                    x(a("débité", "prélevé", "facturé"),
                            " sans autorisation", " sans notre accord", " sans mon accord",
                            " sans prévenir"),
                    x(a("exigé", "exigeait", "exigeaient", "exigent"),
                            " du liquide", " des espèces", " le paiement en espèces",
                            " un paiement en espèces", " du cash", " le paiement en liquide"),
                    "obligé à payer", "obligés à payer", "obligés de payer", "forcé à payer",
                    "forcés à payer", "forcés de payer", "contraints de payer",
                    "contraint de payer",
                    x(a("le logement", "l hôtel", "l appartement", "la réservation", "la location",
                            "l hébergement", "l annonce"), " n existe pas", " n existait pas"),
                    "logement inexistant", "réservation inexistante", "appartement inexistant",
                    "fausse annonce", "porté plainte", "porter plainte", "déposé plainte",
                    "déposer plainte", "déposé une plainte", "plainte à la police",
                    "plainte auprès de la police", "plainte au commissariat"),
            k("frais cachés", "frais supplémentaires", "frais additionnels", "frais en plus",
                    "frais imprévus", "supplément caché", "surfactur", "facturé en plus",
                    "facturés en plus", "facturé plus cher",
                    "caution non rendue", "caution non restituée", "caution pas rendue",
                    "caution jamais rendue", "pas rendu la caution", "jamais rendu la caution",
                    "gardé la caution", "conservé la caution", "retenu la caution",
                    "gardé notre caution"),
            k("paiement en espèces", "payer en espèces", "en espèces uniquement",
                    "uniquement en espèces", "seulement en espèces", "qu en espèces",
                    "qu en liquide", "paiement en liquide", "payer en liquide",
                    "cash uniquement", "uniquement cash", "virement", "en dehors de booking",
                    "hors booking", "en dehors de la plateforme"),
            k(x(a("pas conforme", "non conforme", "ne correspond pas", "ne correspondait pas",
                            "ne correspondent pas", "ne correspondaient pas", "rien à voir"),
                            " à la description", " aux photos", " à l annonce", " avec les photos",
                            " avec la description", " avec l annonce", " à la réalité"),
                    "pas comme sur les photos", "pas du tout comme sur les photos",
                    "publicité mensongère", "mensonger", "trompeu", "photos retouchées",
                    "photos truquées"),
            k(x(a("ont annulé"), " notre réservation", " ma réservation", " la réservation"),
                    x(a("annulé", "annulée"),
                            " par l hôtel", " par le propriétaire", " par l hôte",
                            " par l établissement", " par le logeur"),
                    "surbook", "pas de réservation à notre nom", "aucune réservation à notre nom",
                    "réservation introuvable", "pas trouvé notre réservation",
                    "pas trouvé la réservation", "n avaient pas notre réservation",
                    "aucune trace de notre réservation", "aucune trace de la réservation",
                    x(a("envoyés", "envoyé", "envoyée", "relogés", "relogé", "relogée", "déplacés",
                            "transférés"),
                            " dans un autre hôtel", " dans un autre logement",
                            " dans un autre établissement", " dans un autre appartement"),
                    "délogé"),
            k("pas de frais", "aucun frais", "sans frais", "pas d arnaque", "aucune arnaque",
                    "pas une arnaque", "deux fois moins", "deux fois plus", "2 fois moins",
                    "2 fois plus", "volé mon cœur", "volé notre cœur", "volé nos cœurs"),
    };

    // ---------------------------------------------------------------------------------------
    // Spanish
    static final String[][] ES = {
            k("estafa", " timo ", " timaron", " timado", "nos robaron", "robado", "ladrones",
                    x(a("no nos devolvieron", "no me devolvieron", "no devolvieron",
                            "nunca nos devolvieron", "nunca devolvieron", "nunca me devolvieron"),
                            " el dinero", " nuestro dinero", " mi dinero", " nada", " el importe",
                            " la plata"),
                    "no nos reembolsaron", "no me reembolsaron", "no reembolsaron",
                    "nunca reembolsaron", "nunca nos reembolsaron", "ningún reembolso",
                    "no hubo reembolso", "se negaron a devolver", "se negaron a reembolsar",
                    "se niegan a devolver", "se niegan a reembolsar", "negaron el reembolso",
                    "seguimos esperando el reembolso", "sigo esperando el reembolso",
                    "seguimos esperando el dinero", "sigo esperando mi dinero",
                    x(a("cobraron", "cobrado", "cobro", "cargaron", "cargado", "pagamos", "pagar",
                            "pagado"), " dos veces", " 2 veces"),
                    "cobro doble", "doble cobro", "cargo doble", "doble cargo", "cobraron doble",
                    "pagar de nuevo", "volver a pagar", "pagar otra vez", "pagarlo otra vez",
                    "pagar nuevamente",
                    x(a("cobro", "cobros", "cargo", "cargos", "pago", "pagos"), " no autorizad"),
                    x(a("cobraron", "cargaron"),
                            " sin autorización", " sin permiso", " sin consentimiento"),
                    "exigieron efectivo", "exigieron el pago en efectivo", "exigían efectivo",
                    "exigían el pago en efectivo", "exigió efectivo", "obligaron a pagar",
                    "obligados a pagar",
                    x(a("el alojamiento", "el apartamento", "el hotel", "la reserva", "el piso",
                            "la casa", "el anuncio"), " no existe", " no existía"),
                    "alojamiento inexistente", "reserva inexistente", "apartamento inexistente",
                    "anuncio falso", "oferta falsa", "denuncia a la policía",
                    "denuncia en la policía", "denuncia ante la policía", "pusimos una denuncia",
                    "pusimos denuncia", "pusimos la denuncia", "interpusimos una denuncia"),
            k(x(a("costes", "costos", "cargos", "gastos", "tasas", "cobros"),
                            " ocultos", " ocultas", " adicionales", " extra"),
                    x(a("coste", "costo", "cargo", "gasto", "cobro"),
                            " oculto", " adicional", " extra"),
                    "cobraron de más", "cobrado de más", "cobro de más", "cobrar de más",
                    "nos cobraron más", "cobraron un extra", "cobraron extra",
                    "fianza no devuelta", "no nos devolvieron la fianza", "no devolvieron la fianza",
                    "se quedaron con la fianza", "se quedaron la fianza", "retuvieron la fianza",
                    "no devolvieron el depósito", "se quedaron con el depósito"),
            k("solo efectivo", "solo en efectivo", "solo aceptan efectivo", "pago en efectivo",
                    "pagar en efectivo", "solo cash", "transferencia bancaria", "por transferencia",
                    "fuera de booking", "fuera de la plataforma"),
            k(x(a("no corresponde", "no se corresponde", "no correspondía",
                            "no se correspondía", "no coincide", "no coincidía", "nada que ver"),
                            " con las fotos", " con la descripción", " con las imágenes",
                            " con el anuncio", " con lo anunciado", " a la descripción",
                            " a las fotos", " con la realidad"),
                    x(a("no es", "no era", "nada"), " como en las foto", " como en la foto"),
                    "no se parece a las fotos", "no se parecía a las fotos",
                    "no se parece en nada a las fotos", "engaños", "fotos retocadas",
                    "nos engañaron"),
            k(x(a("cancelaron", "anularon"), " la reserva", " nuestra reserva", " mi reserva"),
                    "sobreventa", "no tenían nuestra reserva", "no tenían la reserva",
                    "no tenían ninguna reserva", "no encontraban la reserva",
                    "no encontraban nuestra reserva", "no constaba la reserva",
                    "no constaba nuestra reserva", "no aparecía la reserva",
                    "no aparecía nuestra reserva", "la reserva no aparecía",
                    "la reserva no constaba",
                    x(a("nos mandaron", "nos enviaron", "nos reubicaron", "nos trasladaron",
                            "nos llevaron", "nos derivaron", "nos alojaron"),
                            " a otro hotel", " en otro hotel", " a otro alojamiento",
                            " en otro alojamiento", " a otro apartamento"),
                    "no había habitación para nosotros", "no tenían habitación para nosotros"),
            k("sin costes", "sin costos", "sin cargos", "sin gastos", "ningún cargo",
                    "ningún coste", "ningún costo", "no es una estafa", "nada de estafa",
                    "dos veces más", "dos veces menos", "robado el corazón", "robaron el corazón",
                    "robó el corazón", "robado nuestro corazón"),
    };

    /** All the non-English languages, in the order listed in the UI. */
    static final String[][][] ALL = {SK, CS, DE, PL, HU, IT, FR, ES};
}
