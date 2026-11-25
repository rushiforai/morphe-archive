# Gboard

**Appversie:** 18.6.3.1002251336-release-arm64-v8a · **Build:** 176071766 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de armeabi-v7a-APK (build 176071765) of arm64-v8a-APK (build 176071766) van Google voor precies deze release; de versionName van elke build eindigt op zijn eigen ABI. Android 8.0+ volstaat: zowel de minAPI26- als de minAPI32-variant van elke build werkt.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
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
| **Custom branding** | Uit | Verandert de appnaam in de launcher, de toetsenbordlijst van Android en de app-informatie, en het app-icoon (standaard Parakeet, het originele Gboard-icoon of vijf andere ontwerpen), zodat je het gepatchte toetsenbord makkelijk onderscheidt van de standaardversie. |
| **Add Gboard Signature Bypass** | Aan | Laat de gepatchte, opnieuw ondertekende Gboard de onderdelen gebruiken die de handtekening van de app controleren, zoals Thema's; zonder deze patch stopt dat met een waarschuwing over een onbekend certificaat. |
| **Rounded Keyboard Panel** | Aan | Kiest welke hoeken van het toetsenbordpaneel afgerond zijn en stelt de straal boven en onder apart in, bij elk actief thema. |
| **Frosted Glass** | Aan | Voegt live vervaging van de achtergrond achter het toetsenbord toe, met transparantie uit het thema of eigen waarden voor achtergrond en toetsen, en de mogelijkheid het effect door te trekken naar de navigatiebalk. Vervaging vereist Android 12 of nieuwer. |
| **Custom Theme** | Aan | Voegt ZIP-thema-import toe aan het themascherm van Gboard zelf en een galerij met kant-en-klare themapakketten die op verzoek worden gedownload en op checksum gecontroleerd. Voegt de INTERNET-machtiging toe. |
| **G Logo on Spacebar** | Aan | Toont een ingebouwd pictogram of je eigen PNG, WebP of JPEG op de spatiebalk, in eigen kleuren of één kleur, met instelbare grootte. |
| **Key Shape Selection** | Aan | Zet de eigen optie Toetsvorm van Gboard aan in themadetails, zodat de toetsen van een thema hun vorm houden in plaats van vierkant te worden. |
| **AMOLED dark keyboard** | Uit | Maakt de donkere toetsenbordachtergrond zuiver zwart in plaats van het grijs van Google, ook in het dynamische thema dat je achtergrond volgt; de lichte modus houdt het lichte toetsenbord. Experimenteel: bevestigd op een emulator, nog niet op een telefoon. |
| **Enable OCR / Scan Text** | Aan | Voegt Gboard's Scan Text-camera toe: richt de camera op tekst en de tekst wordt herkend en op je cursor ingevoegd. De patch levert zijn eigen OCR-engine mee, omdat Play Services de download weigert aan een opnieuw ondertekende Gboard. Alleen Latijnse tekst. Je kunt in de Gboard-instellingen ook een bestaande schermafbeelding of foto kiezen en de tekst daarvan naar het klembord laten kopiëren. |
| **AI Writing Tools** | Aan | Zet Gboard's Writing tools aan op geselecteerde tekst: proeflezen op spelling, grammatica en leestekens, herschrijven en een toon kiezen. Google's eigen client doet het werk; op Pixel-toestellen kan dat op het toestel zelf, elders via Google's server. Werkt in elke taal en met elk toetsenbord. |
| **Clipboard Enhancements** | Aan | Bepaalt hoe lang gekopieerde fragmenten bewaard blijven, hoeveel er worden bewaard, hoeveel voorbeeldregels een kaart toont en of kaarten een aftelling, aanmaaktijd, volgnummer en kolomaantal tonen. |
| **Web Clipboard** | Aan | Host een klein Web Clipboard-portaal op de telefoon, zodat een desktopbrowser op hetzelfde lokale netwerk clipboardtekst met Gboard kan uitwisselen. Het portaal is beveiligd met een koppelcode en is bereikbaar via een Quick Settings-tegel. |
| **Toolbar Editing Buttons** | Aan | Voegt Alles selecteren, Kopiëren, Knippen en Plakken toe aan het Gboard-menu, zodat je ze naar de bovenste werkbalk kunt slepen en in ondersteunde toetsenbordtalen en editors kunt gebruiken. |
| **Cursor trackpad mode** | Aan | Houd de spatiebalk lang ingedrukt om de cursor nauwkeuriger te verplaatsen met een trackpad en de vergrendelmodus te gebruiken. |
| **Incognito Mode Toggle** | Aan | Voegt een incognito-schakelaar toe aan de Access Point-werkbalk en laat je kiezen of het clipboard en spraakinvoer beschikbaar blijven terwijl incognito actief is. Dit regelt de incognito-status van Gboard zelf; het is geen netwerkbrede anti-trackingfunctie. |
| **Simple Calculator** | Aan | Typ een rekenkundige expressie in een tekstveld en zie een scrollbare vergelijking met het antwoord in de suggestieregel van Gboard, klaar om in te voegen. |

Clipboard Enhancements, Web Clipboard, Toolbar Editing Buttons, Cursor trackpad mode, Incognito Mode Toggle, Simple Calculator, Rounded Keyboard Panel, Frosted Glass, Custom Theme, G Logo on Spacebar en Key Shape Selection zijn overgenomen van het GPLv3-project [Gboard Patches](https://github.com/jasonwu1994/Gboard-patches) en bijgewerkt voor Gboard 18.6.3.

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
- De zeventien Gboard-patches zijn gecontroleerd op bouwen en toepassen op deze 18.6.3-build. Toepassen is niet hetzelfde als elke functie op een toestel testen.
- Gecontroleerd op een Android 14-emulator: de instelling, de download en Nederlands, Engels en gemengd Nederlands-Engels dicteren in een tekstveld, plus stilte en achtergrondgeluid zonder losse tekst. Dicteren op een telefoon is nog niet bevestigd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
