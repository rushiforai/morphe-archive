# Gboard

**Appversie:** 18.8.0.1022711984-beta-arm64-v8a · **Build:** 176124766 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de armeabi-v7a-APK (build 176124765) of arm64-v8a-APK (build 176124766) van Google voor precies deze release; de versionName van elke build eindigt op zijn eigen ABI. Android 8.0+ volstaat: zowel de minAPI26- als de minAPI32-variant van elke build werkt.

[Lees hoe je elke Gboard-patch gebruikt en test](../guides/gboard.md) · [Frosted Glass zichtbaar maken](../guides/gboard.md#frosted-glass)

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Enable Inline Autofill Suggestions** | Aan | Schakelt Gboard's Android-ontvanger voor inline automatisch invullen in, zodat een wachtwoordmanager zoals Bitwarden aanmeldsuggesties in het toetsenbord kan tonen. Vereist Android 11+, een actieve provider voor automatisch invullen en diens inline-weergave. Werkt via de Bitwarden-client bij gebruik van Vaultwarden. |
| **Smart Compose** | Aan | Toont **Tekstcorrectie → Smart Compose** en schakelt de client-side functie voor tekstaanvulling in. De taal-, model- en appvoorwaarden van Google blijven gelden. Staat los van wachtwoorden invullen. |
| **Parakeet voice typing** | Aan | Voegt **Parakeet-spraakinvoer** toe aan Gboard-instellingen → Spraakinvoer. Zodra je daar een model downloadt en het aanzet, zet de microfoontoets spraak op de telefoon zelf om in tekst met NVIDIA Parakeet, in plaats van met de spraakherkenning van Google. Elke zin wordt herkend in de taal waarin je hem uitspreekt, dus Nederlands en Engels werken in hetzelfde dictaat zonder te wisselen. Zolang er geen model klaarstaat, gebruikt Gboard gewoon de spraakinvoer van Google. De gepatchte Gboard krijgt het Parakeet-app-icoon. |
| **Rambler voice typing** | Aan | Voegt Rambler van Google toe aan Gboard-instellingen → Spraakinvoer, als keuze naast Parakeet (de standaard-spraakinvoer van Gboard). Kies je **Rambler**, dan stuurt de microfoontoets je spraak naar de servers van Google. Die maken er afgewerkte tekst van en voeren gesproken bewerkingen uit, zoals "verwijder de laatste zin". Parakeet blijft de standaardkeuze. |
| **Rambler personal dictionary** | Aan | Voegt **Spraakwoordenboek** toe aan Gboard-instellingen → Spraakinvoer, met de eigen **lijst met spraakcorrecties** van Gboard: namen en woorden die je toevoegt, importeert of exporteert. Rambler krijgt ze bij elk dictaat mee en schrijft ze daardoor goed. Werkt alleen samen met Rambler voice typing. |
| **Rambler contact names** | Aan | Vult de lijst met spraakcorrecties met de namen uit je contacten zodra je **Contactnamen** onder Spraakwoordenboek aanzet. Namen die je verwijdert, komen niet terug; nieuwe contacten komen erbij zodra Rambler weer start. Werkt alleen samen met Rambler personal dictionary en toegang tot je contacten. |
| **Rambler custom instructions** | Aan | Voegt **Eigen instructies** toe aan Gboard-instellingen → Spraakinvoer → Rambler. Je tekst komt bij de eigen instructies van Rambler en vervangt ze niet: Rambler krijgt hem bij elk dictaat mee en volgt hem alleen voor de stijl, zoals spelling, interpunctie, woordkeus en toon. Werkt alleen samen met Rambler voice typing. |
| **Rambler cursor-aware editing** | Aan | Rambler ziet ook de tekst na de cursor, zodat gesproken bewerkingen de hele tekst bereiken en dicteren midden in een tekst aansluit. Met geselecteerde tekst gaat alleen de selectie mee, zodat een gesproken bewerking zoals "maak dit formeler" daarop werkt; het resultaat wordt daarna weer geselecteerd voor de volgende bewerking. Werkt alleen samen met Rambler voice typing. |
| **Rambler app context** | Aan | Rambler krijgt ook de naam van de app waarin je dicteert en de hinttekst van het veld, zodat de toon past bij een chat, e-mail of zoekopdracht en eigen instructies van de app kunnen afhangen. Google weet dan in welke app je typt. Werkt alleen samen met Rambler voice typing. |
| **Rambler stop after silence** | Aan | Rambler stopt vanzelf na 3 seconden zonder spraak en houdt de tekst, net als wanneer je op ✓ tikt. Pas de tijd aan (3, 5, 8 of 10 seconden) of zet het uit onder Gboard-instellingen → Spraakinvoer → Rambler → **Stoppen na stilte**. Werkt alleen samen met Rambler voice typing. |
| **Parakeet personal dictionary** | Aan | Laat Parakeet de namen en woorden uit de lijst met spraakcorrecties van het **Spraakwoordenboek** goed schrijven, ook de contactnamen die daar staan. Parakeet geeft ze voorrang tijdens het luisteren en verbetert een woord dat erop lijkt alleen als een tweede keer luisteren dat bevestigt. Vraagt een download van 2 MB aan spellinggegevens onder Parakeet-spraakinvoer. Werkt alleen samen met Parakeet voice typing en Rambler personal dictionary. |
| **Change package name** | Aan | Installeert de gepatchte Gboard onder een eigen pakketnaam (standaard app.morphe.android.inputmethod.latin), zodat hij naast de standaard-Gboard staat die op de meeste telefoons is ingebouwd. Je standaard-Gboard, de instellingen en het woordenboek blijven onaangeroerd; kies het gepatchte toetsenbord in de toetsenbordinstellingen van Android. |
| **Custom branding** | Aan | Gebruikt standaard **Gboard Parakeet/Rambler** als naam en het Parakeet-pictogram. Pas beide desgewenst aan in de patchopties van Morphe. |
| **Add Gboard Signature Bypass** | Aan | Laat de gepatchte, opnieuw ondertekende Gboard de onderdelen gebruiken die de handtekening van de app controleren, zoals Thema's; zonder deze patch stopt dat met een waarschuwing over een onbekend certificaat. |
| **Rounded Keyboard Panel** | Aan | Kiest welke hoeken van het toetsenbordpaneel afgerond zijn en stelt de straal boven en onder apart in, bij elk actief thema. |
| **Frosted Glass** | Aan | Voegt live vervaging van de achtergrond achter het toetsenbord toe, met transparantie uit het thema of eigen waarden voor achtergrond en toetsen, en de mogelijkheid het effect door te trekken naar de navigatiebalk. Vervaging vereist Android 12 of nieuwer. |
| **Custom Theme** | Aan | Voegt ZIP-thema-import toe aan het themascherm van Gboard zelf en een galerij met kant-en-klare themapakketten die op verzoek worden gedownload en op checksum gecontroleerd. Voegt de INTERNET-machtiging toe. |
| **G Logo on Spacebar** | Aan | Toont een ingebouwd pictogram of je eigen PNG, WebP of JPEG op de spatiebalk, in eigen kleuren of één kleur, met instelbare grootte. |
| **Key Shape Selection** | Aan | Zet de eigen optie Toetsvorm van Gboard aan in themadetails, zodat de toetsen van een thema hun vorm houden in plaats van vierkant te worden. |
| **AMOLED dark keyboard** | Aan | Maakt de donkere toetsenbordachtergrond zuiver zwart in plaats van het grijs van Google, ook in het dynamische thema dat je achtergrond volgt; de lichte modus houdt het lichte toetsenbord. Er is geen aparte tegel: kies Dynamische kleur in het themascherm van Gboard — zie [AMOLED-donker toetsenbord](#amoled-donker-toetsenbord). |
| **Enable OCR / Scan Text** | Aan | Voegt Gboard's Scan Text-camera toe: richt de camera op tekst en de tekst wordt herkend en op je cursor ingevoegd. De patch levert zijn eigen OCR-engine mee, omdat Play Services de download weigert aan een opnieuw ondertekende Gboard. Alleen Latijnse tekst. Je kunt in de Gboard-instellingen ook een bestaande schermafbeelding of foto kiezen en de tekst daarvan naar het klembord laten kopiëren. |
| **AI Writing Tools** | Aan | Maakt de Google-functies voor herschrijven en toon beschikbaar bij geselecteerde tekst waar ondersteund. Proofread / Auto Fix valt buiten deze port. |
| **Clipboard Enhancements** | Aan | Bepaalt hoe lang gekopieerde fragmenten bewaard blijven, hoeveel er worden bewaard, hoeveel voorbeeldregels een kaart toont en of kaarten een aftelling, aanmaaktijd, volgnummer en kolomaantal tonen. |
| **Web Clipboard** | Aan | Host een klein Web Clipboard-portaal op de telefoon, zodat een desktopbrowser op hetzelfde lokale netwerk clipboardtekst met Gboard kan uitwisselen. Het portaal is beveiligd met een koppelcode en is bereikbaar via een Quick Settings-tegel. |
| **Toolbar Editing Buttons** | Aan | Voegt Alles selecteren, Kopiëren, Knippen en Plakken toe aan het Gboard-menu, zodat je ze naar de bovenste werkbalk kunt slepen en in ondersteunde toetsenbordtalen en editors kunt gebruiken. |
| **Cursor trackpad mode** | Aan | Houd de spatiebalk lang ingedrukt om de cursor nauwkeuriger te verplaatsen met een trackpad en de vergrendelmodus te gebruiken. |
| **Incognito Mode Toggle** | Aan | Voegt een incognito-schakelaar toe aan de Access Point-werkbalk en laat je kiezen of het clipboard en spraakinvoer beschikbaar blijven terwijl incognito actief is. Dit regelt de incognito-status van Gboard zelf; het is geen netwerkbrede anti-trackingfunctie. |
| **Simple Calculator** | Aan | Typ een rekenkundige expressie in een tekstveld en zie een scrollbare vergelijking met het antwoord in de suggestieregel van Gboard, klaar om in te voegen. |
| **Advanced voice typing (NGA)** | Aan | Schakelt de geavanceerde dicteerfuncties van Google in en levert het passende dicteeronderdeel voor beide architecturen mee. Beschikbaarheid hangt af van de herkenningscontroles van Gboard. |
| **Use Bluetooth microphone** | Aan | Toont Gboard's eigen schakelaar Voice typing → **Use Bluetooth microphone**, die standaard verborgen is, zodat dicteren van een gekoppelde headset kan opnemen. De routering blijft Gboard's eigen keuze. |
| **Rambler toolbar & revert extras (18.8)** | Aan | Voegt de overflow-knop toe aan de zwevende Rambler-werkbalk, houdt herschreven tekst bij het terugdraaien van het volledige transcript naar de opgeschoonde tekst, en geeft bewerkingsgeschiedenis door op het Jetson Lite-pad. |
| **Rambler automatic retry (18.8)** | Aan | Laat Rambler na een geschikte herkenningsfout opnieuw proberen met het geluid van de huidige dicteerbeurt. Het geluid kan opnieuw naar Google gaan. |
| **Hidden flags (18.8)** | Aan | Drie interne 18.8-flags via Gboard's eigen override-opslag: app-specifieke woordweging, de app-specifieke suggestiebalk en de vierkante genormaliseerde zoekradius. Zie [Verborgen flags](#verborgen-flags-188). |
| **Beta features (18.8)** | Aan | Schakelt vijf functies voor het klembord, het zwevende toetsenbord, Emoji2 en het verwijderen van suggesties in. Per functie instelbaar via **Patches → More settings → Beta features**. Zie [Beta-functies](#beta-functies-188). |

Enable Inline Autofill Suggestions, Smart Compose, Clipboard Enhancements, Web Clipboard, Toolbar Editing Buttons, Cursor trackpad mode, Incognito Mode Toggle, Simple Calculator, Rounded Keyboard Panel, Frosted Glass, Custom Theme, G Logo on Spacebar en Key Shape Selection zijn overgenomen van het GPLv3-project [Gboard Patches](https://github.com/jasonwu1994/Gboard-patches) en bijgewerkt voor Gboard 18.8.0.


### Advanced voice typing (NGA)
De patch schakelt geavanceerde dicteerfuncties in en bevat het passende dicteeronderdeel. Gboard controleert nog steeds of de herkenner met je taal kan starten. De kiezer heeft twee ingangen, **Rambler** en **Standaard** (Parakeet als de patch en het model klaar zijn). Zie [instellen en testen](../guides/gboard.md#advanced-voice-typing-nga).

### Use Bluetooth microphone
Standaard zet `enable_use_bluetooth_setting` op false, waardoor de rij nooit verschijnt. Deze patch toont Gboard's schakelaar **Voice typing → Use Bluetooth microphone**; die schakelaar bepaalt daarna of opnames van de headset komen.

- Twee verschillende dingen: de patch maakt de rij zichtbaar; de standaardschakelaar zet de routering aan.
- Gboard past zijn eigen regels toe (Android-versie, voorkeur voor draad/USB, auto-apparaten kunnen worden uitgesloten). Een gekoppelde headset bewijst niets — dicteer met telefoon en headset bij verschillende geluiden.

### Rambler-werkbalk en terugdraai-extras (18.8)
Drie functies die beschikbaar komen wanneer de extra patch is toegepast:

- **Overflow-menu** op de zwevende Rambler-werkbalk, waar de secundaire acties staan.
- **Herschreven tekst bewaren bij terugdraaien**: bij het terugdraaien van het volledige transcript naar de opgeschoonde tekst blijft de herschreven versie staan.
- **Lite-bewerkingsgeschiedenis**: geeft bewerkingsgeschiedenis door aan een Jetson Lite-verzoek; heeft alleen effect als het Lite-pad actief is.

### Verborgen flags (18.8)
Drie flags die Gboard voor interne builds bewaart, via Gboard's **eigen override-opslag**, zodat ze op het draaiende toetsenbord werken:

- **App-specifieke woordweging** (`enable_dcontext_biasing`)
- **App-specifieke suggestiebalk** (`enable_dcontext_suggestion_bar`)
- **Vierkante genormaliseerde zoekradius** (`square_normalized_search_radius`)

Het scherm openen schrijft niets. Een schakelaar die je omzet wordt als expliciet Aan of Uit vastgelegd en na een herstart opnieuw toegepast; de geselecteerde flags staan standaard aan en een bewuste Uit-keuze blijft behouden. Elke schrijfactie wordt teruggelezen en een fout verschijnt als `Hidden flag switch did not take`.

### AMOLED-donker toetsenbord
Deze patch heeft geen eigen tegel in de themakiezer van Gboard; hij herkleurt het donkere palet dat
het dynamische thema gebruikt.

1. Zorg dat **AMOLED dark keyboard** is aangevinkt wanneer je in Morphe Manager patcht. Zo niet, patch
   opnieuw met de optie aan en installeer de update.
2. Open in de gepatchte Gboard **Instellingen → Thema**, kies **Dynamische kleur** en tik op
   **Toepassen**.
3. Zet het donkere thema van Android aan en open het toetsenbord opnieuw in een tekstveld.

**Waar je op let:** de achtergrond achter en tussen de toetsen is zuiver zwart (`#000000`).
Toetsvlakken mogen grijs of getint blijven. Zet Android voor een snelle A/B-test terug op licht en
open het toetsenbord opnieuw — hetzelfde thema keert terug naar zijn lichte palet.

AMOLED geldt automatisch voor het donkere palet.

## Beta-functies (18.8)

Gboard 18.8 bevat vijf afgewerkte functies die Google voor een opnieuw ondertekende build uit laat staan. **Beta features (18.8)** zet ze samen aan, achter één schakelaar: Gboard-instellingen → **Patch settings** → **More settings** → **Beta features** (de patchinstellingen zijn Engelstalig). De schakelaar staat aan zodra je de patch toepast; zet hem uit en herstart Gboard om het gedrag van Google terug te krijgen. Geen van de vijf vraagt een account, een download of een server.

| Functie | Waar je het ziet | Hoe je het gebruikt |
| --- | --- | --- |
| Snelplak-chip | Suggestieregel boven het toetsenbord | Kopieer tekst en open een tekstveld: naast de klembord-suggestie staat een tweede chip die met één tik plakt |
| Klembord-chip op het zwevende toetsenbord | Suggestieregel van het zwevende toetsenbord | Kopieer tekst en ga naar het zwevende toetsenbord: het klemborditem verschijnt daar nu ook |
| Onzichtbaar formaat wijzigen | Randen van het zwevende toetsenbord | Sleep net binnen de linker- of rechterrand om het zwevende toetsenbord breder of smaller te maken; er is geen zichtbaar handvat |
| Emoji2-weergave | Emoji-kiezer | Niets om in te drukken: emoji worden door de Emoji2-stack van het systeem getekend in plaats van door de oudere provider van Gboard |
| Bevestiging bij wegvegen | Suggestieregel | Sleep een suggestie uit de balk: het bevestigingsballonnetje gebruikt de nieuwere indeling |

### Snelplak-chip

Gekopieerde tekst toont normaal één klembord-chip, en daarop tikken opent het klembordpaneel. Met de bèta-schakelaar aan krijgt een stuk platte tekst er een **plak**-chip bij: één tik voegt de tekst op de cursor in zonder het paneel te openen.

- Alleen platte tekst krijgt de extra chip; afbeeldingen en opgemaakte inhoud houden de gewone chip.
- De chip volgt het bovenste item van het klembord, net als de gewone suggestie.
- Vereist dat klembordsuggesties aanstaan (Gboard-instellingen → Klembord), precies zoals de gewone chip.

### Klembord-chip op het zwevende toetsenbord

Het zwevende toetsenbord heeft zijn eigen suggestieregel, en de gewone Gboard weigert daar klemborditems. Met de bèta-schakelaar aan verschijnt de klembord-chip ook in de zwevende regel, zodat je kunt plakken terwijl het toetsenbord zweeft.

- Vereist **Klembord**-suggesties in de Gboard-instellingen en het zwevende toetsenbord.
- Op het vaste toetsenbord verandert er niets.

### Onzichtbaar formaat wijzigen van het zwevende toetsenbord

Het zwevende toetsenbord kun je van formaat laten veranderen door een onzichtbare strook net binnen de linker- of rechterrand te slepen. Er is geen greep of handvat, dus de functie is makkelijk te missen: sleep van de rand naar binnen of naar buiten en het toetsenbord volgt.

- Alleen de zwevende indeling wijzigt; de gesplitste en vaste indeling blijven gelijk.
- De maat blijft onthouden zolang het toetsenbord zweeft.

### Emoji2-weergave

Dit wisselt de emoji-provider van Gboard van de eigen implementatie naar de Emoji2-stack van het systeem. Er is geen zichtbare schakelaar: actuele emoji worden goed getekend en de kiezer werkt zoals voorheen. Het is de minst zichtbare van de vijf en veilig om aan te laten.

### Bevestiging bij wegvegen

Als je een suggestie of een aangeleerd woord uit de suggestiebalk sleept, vraagt Gboard om bevestiging. De bèta-schakelaar kiest de nieuwere indeling van dat ballonnetje. Sleep je nooit suggesties weg, dan merk je er niets van.

### Cursor na een Rambler-bewerking

Deze zit niet achter de bèta-schakelaar: met **Rambler voice typing** laat Rambler de cursor **achter de tekst die het net heeft aangepast** in plaats van aan het einde van het veld. Dicteer een bewerking midden in een tekst en typ daarna verder waar je was.

### Als iets niet verschijnt

- Herstart Gboard na het omzetten van de schakelaar; Android houdt het oude toetsenbordproces soms in leven.
- `adb logcat | grep GboardPatches` laat zien waarom een bèta-functie niet start. Als het werkt, wordt er niets gelogd.
- De vijf functies zijn geverifieerd als patch op de 18.8.0-beta, nog niet op een telefoon bevestigd. De twee klembord-chips vragen ook de eigen klembordinstelling van Gboard aan, en de chips op het zwevende toetsenbord vragen dat het toetsenbord zweeft.

## Een model kiezen

| Model | Download | Het beste voor |
| --- | --- | --- |
| Parakeet Ultra (aanbevolen) | ongeveer 630 MB | Door Moondream verder getrainde Parakeet TDT v3. Nauwkeuriger, vooral bij achtergrondgeluid. |
| Parakeet TDT 0.6B v3 | ongeveer 670 MB | Het oorspronkelijke model van NVIDIA, zoals het sherpa-onnx-project het publiceert. |

Beide modellen verstaan 25 Europese talen, waaronder Nederlands, Engels, Duits, Frans en Spaans, en kiezen per zin zelf de taal. Leestekens en hoofdletters komen er automatisch bij. Bij de eerste download worden ook de spraakruntime en spraakdetectie opgehaald (ongeveer 40 MB). Elk bestand wordt met een vaste controlesom gecontroleerd voordat het wordt gebruikt. Daarna werkt spraakinvoer offline en verlaat je geluid de telefoon niet.

## Dicteren

Tik op de microfoontoets en praat. De tekst verschijnt terwijl je praat en staat vast zodra je pauzeert. Het dictaat stopt na vijf seconden stilte of als je opnieuw op de microfoontoets tikt. Gboard vraagt de eerste keer zoals gewoonlijk om toegang tot de microfoon.

## Rambler voice typing

Rambler is de eigen spraakinvoer van Google met Gemini. Rambler schrijft niet elk woord letterlijk uit, maar maakt van wat je zegt afgewerkte tekst en voert gesproken correcties uit. Google zet Rambler alleen aan op een deel van de Pixel-telefoons; deze patch biedt het ook op andere telefoons aan.

Open na het patchen Gboard-instellingen → Spraakinvoer en kies **Rambler** of **Parakeet**. Parakeet is de standaard-spraakinvoer van Gboard, door de Parakeet-patch hernoemd, en blijft gekozen tot je dat zelf verandert. Zonder Parakeet-model gebruikt die keuze de standaardherkenning van Google.

- Rambler heeft een internetverbinding nodig en stuurt je spraak naar Google. Google beperkt hoeveel je per dag kunt dicteren.
- Parakeet regelt alleen de keuze Parakeet. Kan Rambler Google niet bereiken, dan valt Gboard terug op zijn eigen standaardherkenning van Google, niet op Parakeet.
- Of de servers van Google Rambler accepteren op een telefoon buiten hun uitrol, beslist Google. Op een OnePlus-telefoon met deze patches werkt het, ook in het Nederlands en met gesproken correcties.

### Spraakwoordenboek

Met **Rambler personal dictionary** toont Gboard-instellingen → Spraakinvoer het onderdeel **Spraakwoordenboek**, boven de keuze tussen Rambler en Parakeet. Daarin staat de eigen **lijst met spraakcorrecties** van Gboard: Rambler krijgt deze woorden bij elk dictaat mee en schrijft namen en ongewone woorden daardoor goed.

- Open **Lijst met spraakcorrecties**, dan het menu, en kies **Importeren** om woorden toe te voegen: typ of plak namen, gescheiden door komma's of nieuwe regels. **Exporteren** deelt de lijst als tekst.
- Selecteer woorden om ze te verwijderen, of maak de lijst leeg met **Alle gecorrigeerde woorden wissen** op het scherm Spraakwoordenboek. Gboard vraagt eerst om bevestiging.
- **Contactnamen** vraagt Gboard om toegang tot je contacten. Met **Rambler contact names** komen de namen uit je contacten daarna in de lijst zodra Rambler start, en nieuwe contacten later ook. Namen die je verwijdert, blijven weg. Contacten zonder naam, alleen een e-mailadres of een telefoonnummer worden overgeslagen.
- Het eigen persoonlijke woordenboek van Gboard onder Instellingen → Woordenboek blijft alleen voor typen, zoals Gboard op dat scherm meldt.

### Parakeet met de lijst met spraakcorrecties

Met **Parakeet personal dictionary** gebruikt Parakeet hetzelfde Spraakwoordenboek, op de telefoon zelf. Het staat aan onder Gboard-instellingen → Spraakinvoer → Parakeet-spraakinvoer → **Spraakwoordenboek gebruiken**; tik daar op **Spellinggegevens downloaden** als het model al eerder gedownload was (ongeveer 2 MB: de Parakeet-tokenizer van NVIDIA en lijsten met de 50.000 meest gebruikte Nederlandse en Engelse woorden). Je woorden verlaten de telefoon niet.

- Tijdens het dicteren geeft Parakeet voorrang aan de namen en woorden uit de lijst, zodat "Codenberg" Codeberg wordt en "Koolsingel" Coolsingel.
- Staat er in een afgeronde zin nog een woord dat op een vermelding lijkt, dan luistert Parakeet nog een keer naar hetzelfde geluid, met alleen die vermelding in gedachten. De correctie blijft alleen staan als die tweede keer de vermelding ook schrijft; anders blijft de zin zoals hij eerst gehoord is.
- Namen die ook een heel gewoon woord zijn, zoals Vos, Bakker of Visser, krijgen geen voorrang: aan het geluid is de naam niet van het woord te onderscheiden. Gewone woorden worden nooit vervangen.
- De lijst wordt gelezen als een dictaat begint. Is de lijst veranderd, dan laadt het model één keer opnieuw aan het begin van het volgende dictaat. Met een lijst gebruikt elke herkenning beam search; in een test op een computer duurde dat ongeveer 15% langer. Zonder lijst verandert er niets.
- Met **Rambler contact names** komen contactnamen ook in de lijst als een Parakeet-dictaat begint, zodat je Rambler daarvoor niet eerst hoeft te gebruiken.

### Eigen instructies

Met **Rambler custom instructions** toont Gboard-instellingen → Spraakinvoer → Rambler het onderdeel **Eigen instructies**. Tik erop, typ je regels en tik op OK. Rambler krijgt die tekst daarna bij elk dictaat mee.

- Je tekst komt **bij** de eigen instructies van Rambler en vervangt ze niet. De regels van Google gaan voor: Gboard verpakt je tekst in een vaste tekst van Google, die hem beperkt tot hoe gedicteerde tekst wordt geschreven (spelling, grammatica, taalgebruik, woordkeus, opmaak, interpunctie, hoofdletters en toon) en tot de tekst die je net hebt gedicteerd of bewerkt.
- Schrijf stijlregels, geen opdrachten. "Schrijf elk getal in cijfers." werkt; "Antwoord in het Engels" of "Vat samen wat ik zeg" worden bewust genegeerd.
- Een regel mag afhangen van een woord of situatie, zoals "Als ik 'nieuwe alinea' zeg, begin een nieuwe alinea." Rambler past hem alleen toe als daaraan is voldaan.
- Er is één tekstveld: nieuwe tekst opslaan vervangt je vorige instructies. Laat het leeg om niets mee te sturen.
- Snel controleren: sla "Schrijf elk getal in cijfers." op, kies Rambler en dicteer "ik heb drie appels". Met de instructie verschijnt "ik heb 3 appels".

### Cursorbewust bewerken

Standaard ziet Rambler alleen de tekst **voor** de cursor. Met **Rambler cursor-aware editing** ziet Rambler ook de tekst erna, en wordt een selectie het doel van een gesproken bewerking.

- **Overal in de tekst bewerken:** zet de cursor ergens neer, zelfs helemaal aan het begin, en zeg wat er moet veranderen: "verander dinsdag in woensdag", "verwijder de laatste zin", "maak de tweede zin korter". Rambler zoekt de woorden in het hele veld, niet alleen voor de cursor.
- **Midden in de tekst dicteren:** zet de cursor tussen twee zinnen en dicteer. Rambler ziet wat erna komt, zodat hoofdletters, interpunctie en spaties aansluiten.
- **Alleen een selectie bewerken:** selecteer een zin of alinea en zeg een bewerking, zoals "maak dit formeler" of "maak dit korter". Alleen de selectie gaat mee en verandert; de rest van het veld blijft zoals het is.
- **Doorgaan met bewerken:** na een gesproken bewerking blijft de gewijzigde tekst geselecteerd, zodat je meteen de volgende bewerking kunt zeggen ("korter", "voeg een uitroepteken toe"). Tik ergens anders om de selectie op te heffen.
- Rambler krijgt zo meer van het veld mee: de tekst na de cursor (tot ongeveer 2000 tekens aan elke kant), of alleen je selectie als je iets hebt geselecteerd.

### App-context

Met **Rambler app context** vertelt elk dictaat Rambler ook in welke app je bent: de naam en het pakket van de app, het soort veld (zoals e-mailadres of zoekveld) en de hinttekst van het veld (maximaal 100 tekens). Rambler gebruikt dat om de stijl van de app te volgen, en eigen instructies kunnen ernaar verwijzen.

- Regels per app werken: bijvoorbeeld "Alleen in WhatsApp: eindig elk bericht met 👍." of "Schrijf in Gmail volledige zinnen met een aanhef."
- Google weet dan in welke app je typt. Rambler krijgt je spraak en de tekst rond de cursor al; zet deze patch uit als je de app-naam niet ook wilt delen.

### Stoppen na stilte

Rambler van Google blijft luisteren tot je op ✓ of ✕ tikt, met een limiet van vijf minuten per dictaat. Met **Rambler stop after silence** stopt hij vanzelf zodra je niet meer praat, net als Parakeet, en houdt hij de tekst, alsof je op ✓ tikt.

- Standaard is dat na 3 seconden. Pas het aan onder Gboard-instellingen → Spraakinvoer → Rambler → **Stoppen na stilte**: 3, 5, 8 of 10 seconden, of **Uit** voor het gedrag van Google.
- Spraak wordt herkend aan het eigen spraakniveau van Gboard, gemeten ten opzichte van het achtergrondgeluid om je heen. Constant geluid houdt Rambler niet aan het luisteren; een plotseling hard geluid kan het even rekken.
- Elke sessie wordt in logcat vastgelegd onder `MorpheRamblerSilence` (de gekozen tijd, hoeveel spraak er was en waarom hij stopte), nooit met wat je zei.

## Voor gebruik

- Een telefoon met 64-bit ARM is nodig. Houd tijdens het downloaden ongeveer 1,4 GB vrij; het geïnstalleerde model neemt ongeveer 650 MB in beslag.
- Tijdens het dicteren gebruikt het model ongeveer 700 MB geheugen. Na vijf minuten zonder gebruik wordt het weer vrijgegeven, dus de eerste zin na een pauze duurt even iets langer.
- Met Change package name aan is de gepatchte Gboard een aparte app met eigen instellingen: zet hem aan via Android-instellingen → Toetsenbord en kies hem daarna. Zonder die patch kan hij niet worden geïnstalleerd op telefoons waarop Gboard is ingebouwd. Functies die afhangen van de eigen app-handtekening van Google werken in de gepatchte versie mogelijk niet; Parakeet heeft ze niet nodig.
- De 26 Gboard-patches (plus de Beta features-patch) zijn gecontroleerd op bouwen en toepassen op deze 18.8.0-beta, op beide ABI's. Toepassen is niet hetzelfde als elke functie op een toestel testen.
- Gecontroleerd op een Android 14-emulator: de instelling, de download en Nederlands, Engels en gemengd Nederlands-Engels dicteren in een tekstveld, plus stilte en achtergrondgeluid zonder losse tekst. Dicteren op een telefoon is nog niet bevestigd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
