# De Gboard-patches gebruiken

## Local AI en gedeelde spraak

[Stel de zelfstandige Local AI-companion in](local-ai.md) voor schrijfhulp in het toetsenbordthema, beeldtekst en gedeeld lokaal dicteren. Kies en download modellen in de companion; Gboard behoudt zijn eigen toetsenbordinterface. Google-backends blijven beschikbaar als expliciete keuzes.

Stel spraakinvoer in, pas het uiterlijk van het toetsenbord aan en test elke functie in een proefnotitie. Deze handleiding gaat over Gboard 18.8. Op de [Gboard-appagina](../apps/gboard.md) staan de uitgebrachte patches, ondersteunde APK’s en standaardkeuzes per uitgave.

Blijft het toetsenbord er ondoorzichtig uitzien met vervaging aan? Ga naar [Frosted Glass](#frosted-glass) voor een korte vergelijking met een transparant paneel.

## Installeren en de juiste instellingen openen

1. Kies in Morphe de originele Gboard-APK voor je toestel. Voor 18.8.0.1022711984 bèta is **arm64-v8a** build **176124766** en **armeabi-v7a** build **176124765**. Kies arm64 op een moderne 64-bits telefoon. Zowel het buildnummer als de architectuur moet kloppen.
2. Kies je patches en controleer hun opties. Morphe kan keuzes en aangepaste waarden van een eerdere patchsessie herstellen. Een nieuwe selectie toont de standaardkeuzes van de bundel die je hebt geladen.
3. Laat **Change package name** geselecteerd als je de gepatchte versie naast het originele Gboard wilt installeren. Gebruik bij een update dezelfde pakketnaam en dezelfde Morphe-ondertekeningssleutel. Volg de [installatie- en updatehandleiding](install.md).
4. Schakel het gepatchte toetsenbord in bij de Android-toetsenbordinstellingen en kies het in een tekstveld. Open de instellingen met het tandwiel van dat toetsenbord. **Patches** opent de patchinstellingen, **Spraakinvoer** kiest de spraakengine en **Thema** past Gboard-thema’s toe.

Een toegepaste patch maakt de functie beschikbaar. Soms is ook een schakelaar, download, Android-machtiging of ondersteund toestel nodig. Afhankelijk van de bundelversie kan een menu voor een ontbrekende patch verborgen of grijs zijn. Staat een item ook niet in de patchlijst van Morphe, controleer dan eerst je bundelversie. Sommige patchinstellingen hebben Engelse labels.

### Change package name

De gepatchte versie krijgt standaard de pakketnaam `app.morphe.android.inputmethod.latin`. Origineel Gboard behoudt zijn eigen instellingen, woordenboeken en appgegevens. Kijk na installatie of beide namen in de toetsenbordkiezer staan en selecteer de gepatchte versie. Een nieuwe pakketnaam geeft je weer een aparte app met eigen gegevens.

### Custom branding

Stel **App name** en **App icon** in bij de patchopties van Morphe. In het profiel waarin alle patches standaard geselecteerd zijn, heet de app **Gboard Parakeet/Rambler** en krijgt hij het meegeleverde **Parakeet**-pictogram. Oudere bundels en opgeslagen keuzes kunnen een andere naam of een ander pictogram tonen. Controleer beide in je launcher en de Android-toetsenbordkiezer. De originele schermen van Google kunnen de naam Gboard blijven gebruiken.

### Add Gboard Signature Bypass

Morphe ondertekent de opnieuw opgebouwde app met je lokale sleutel. Deze patch zorgt dat Gboard die handtekening accepteert op plekken zoals het themascherm. Laat de patch geselecteerd bij de normale gepatchte installatie. Android blijft de handtekening bij installatie controleren, en toegang tot Google-diensten hangt nog steeds af van hun eigen voorwaarden. Krijg je bij een update een fout over een andere handtekening, controleer dan de pakketnaam en gebruik de sleutel van de bestaande gepatchte app.

## Spraakinvoer instellen

| Wat je wilt | Waar je begint | Wat je kunt verwachten |
| --- | --- | --- |
| Lokaal dicteren | **Voice typing → Local AI voice typing**, daarna **Use shared local speech** | De geselecteerde hostherkenner draait op de telefoon zodra het spraakmodel Ready meldt. |
| Tekst laten afwerken en spraakbewerkingen gebruiken | **Spraakinvoer → Rambler** | Rambler stuurt je spraak naar Google en kan tekstcontext gebruiken bij het herschrijven. |
| De geavanceerde dicteerfuncties van Google | **Patches → AI & Voice → Advanced Voice Typing** | Meegeleverde herkenningsondersteuning, met de geschiktheidscontroles van Google. Er komt geen derde dicteerkeuze bij. |
| De microfoon van een headset | **Patches → AI & Voice → Use Bluetooth microphone**, daarna **Spraakinvoer → Use Bluetooth microphone** | De eerste schakelaar maakt de tweede zichtbaar. De tweede vraagt Gboard de headset te gebruiken als de routeregels dat toelaten. |

### Parakeet voice typing

Open **Voice typing → Local AI voice typing → Open or install Local AI**. Kies Parakeet TDT v3, Parakeet Ultra, Nemotron Streaming of Whisper Tiny onder **Speech recognition** in de companion. Download het profiel, schakel gedeelde spraak in en wacht op Ready. Zet daarna **Use shared local speech** in Gboard aan. Modelbestanden worden in de host beheerd en niet opnieuw voor iedere app gedownload.

Tik in een proefnotitie op de microfoon en test een opgegeven taal van het geselecteerde profiel. De meegeleverde Whisper Tiny-integratie gebruikt een Engelse prefix. Tekst-/beeldverwerking mag uit als je alleen spraak nodig hebt. Geselecteerde lokale spraak meldt ontbrekende modellen of geheugenpauzes expliciet en schakelt niet stilzwijgend naar Google. Zie [de volledige instellingen](local-ai.md#lokaal-dicteren-instellen).

### Rambler voice typing

Kies **Rambler** onder **Spraakinvoer → Dicteertype**. Dicteer een korte alinea en wacht even. Selecteer daarna één zin en vraag “make this shorter”. Rambler kan je tekst afwerken en gesproken bewerkingen uitvoeren. Bij deze route gaat je opname naar Google. Netwerkverbinding, taal en de dienst van Google bepalen de beschikbaarheid. Kies Parakeet als je de lokale engine wilt gebruiken.

### Rambler personal dictionary

Voeg onder **Spraakinvoer → Spraakwoordenboek** een ongewone naam toe aan de lijst met spraakcorrecties. Dicteer een zin met die naam in Rambler. De lijst wordt meegestuurd om namen en termen beter te herkennen. Op het scherm van de lijst kun je woorden toevoegen, verwijderen, importeren en exporteren. **Instellingen → Woordenboek** is de aparte lijst voor getypte tekst.

### Rambler contact names

Deze patch vult dezelfde lijst met spraakcorrecties aan. Zet **Contact names** aan in het spraakwoordenboek en geef Android toegang tot je contacten als je dit wilt gebruiken. Start een nieuwe dicteerbeurt en controleer of een bekende naam in de lijst staat. Namen die je verwijdert blijven verwijderd. De oude ingebouwde Parakeet-decoder kon de lijst lokaal gebruiken. Met Rambler kan de lijst naar Google gaan. Houd alleen woorden in de lijst die de actieve herkenner mag zien.

### Parakeet personal dictionary

De akoestische woordenboekintegratie van deze patch hoort bij de oude ingebouwde Parakeet-decoder. Kies voor contactnamen bij gedeelde spraak Local Model Host v0.1.145 of nieuwer, selecteer **Parakeet Ultra**, zet **Contactnamen gebruiken** aan onder **Spraakinvoer → Local AI voice typing** en geef Android toegang tot je contacten. Gboard geeft een beperkt aantal namen mee voor die dicteerbeurt. Parakeet TDT v3, Nemotron en Whisper Tiny gebruiken de gebruikelijke gedeelde spraakherkenning.

### Rambler custom instructions

Open **Spraakinvoer → Rambler → Custom instructions**. Geef een korte voorkeur op, zoals “Schrijf alle getallen in cijfers”, en dicteer “vier rode fietsen”. De instructie gaat mee met de spraakinvoer en wordt toegevoegd aan de regels van Google. De uitkomst kan daardoor variëren. Verwijder de instructie of zet de schakelaar uit om te vergelijken. Gebruik hier geen vertrouwelijke informatie.

### Rambler cursor-aware editing

Plaats de cursor tussen twee bestaande zinnen en dicteer een zin. Rambler kan ook tekst na de cursor gebruiken om de invoeging te laten aansluiten. Selecteer daarna één zin en vraag “make this more formal”. Rambler kan de selectie opsturen om te herschrijven en het resultaat opnieuw selecteren voor een volgende opdracht. Controleer de cursor en de tekst rond de selectie voordat je de bewerking overneemt.

### Rambler app context

Rambler kan de naam van de actieve app en veldinformatie zoals de hint ontvangen. Dat helpt onderscheid te maken tussen bijvoorbeeld een chat, e-mail of zoekopdracht. Probeer dezelfde onschuldige zin in twee soorten velden als je het effect wilt vergelijken. Het resultaat kan verschillen. Als deze optie actief is, ontvangt Google die app- en veldcontext.

### Rambler stop after silence

Open **Spraakinvoer → Rambler → Stop after silence**. Kies **3, 5, 8 of 10 seconden**, of zet de functie uit. Dicteer iets en wacht langer dan de ingestelde tijd. De sessie hoort te stoppen en de tekst te behouden, zoals bij het aantikken van het vinkje. Ook een lange pauze midden in een zin kan de sessie beëindigen. Kies een langere wachttijd als je regelmatig pauzeert.

### Rambler toolbar & revert extras (18.8)

Vereist **Rambler voice typing**. Zoek tijdens Rambler-dicteren naar de knop voor extra acties op de zwevende balk. Voor de terugzetfunctie dicteer je iets waarbij je zowel de afgewerkte tekst als het volledige transcript te zien krijgt. Wissel tussen beide en controleer of de herschreven tekst beschikbaar blijft. De Lite-bewerkingsgeschiedenis heeft alleen invloed als Gboard al Jetson Lite gebruikt. Een gewone Rambler-sessie is daarvoor geen test.

### Rambler automatic retry (18.8)

Als deze patch in je bundel staat, gebruik hem dan samen met **Rambler voice typing**. Rambler kan na een geschikte herkenningsfout automatisch opnieuw proberen met het geluid van de huidige dicteerbeurt. Daarbij kan het geluid opnieuw naar Google gaan. Een geslaagde normale dicteerbeurt test dit pad niet. Treedt een herkenningsfout op tijdens een proef met onschuldige tekst, kijk dan of de app zelf opnieuw begint en de tekst maar één keer invoegt. Een toestel zonder verbinding of een blijvende fout kan blijven mislukken.

### Advanced voice typing (NGA)

Open **Patches → AI & Voice → Advanced Voice Typing**, zet het aan en herstart het toetsenbord als Gboard daarom vraagt. De patch voor 18.8 bevat het bijbehorende dicteeronderdeel voor beide ondersteunde architecturen. Een geladen onderdeel kan nog steeds geen geschikte spraaksessie vinden. De herkenningsdiensten van Google, je taal en het toestel blijven van belang.

Gebruik de gewone dicteerkeuze en test met een ondersteunde taal, een zin en een geavanceerde bewerkingsopdracht. **Standard voice typing settings** onder **AI & Voice**, indien zichtbaar, beheert de Google-voorkeuren voor geavanceerde functies, interpunctie en taalwisseling. Die schakelaars voegen geen Google-spraakopdrachten toe aan Parakeet. Gebruik bij een onbeschikbare dienst gewone Google-spraakinvoer of een gereed Parakeet-model. Een taaldownload in Live Transcribe levert geen ontbrekend dicteeronderdeel van Gboard.

### Use Bluetooth microphone

1. Koppel een Bluetooth-headset met microfoon en maak verbinding.
2. Zet zo nodig de schakelaar aan onder **Patches → AI & Voice → Use Bluetooth microphone**.
3. Zet daarna de Gboard-schakelaar **Use Bluetooth microphone** aan onder **Spraakinvoer**.
4. Dicteer iets onschuldigs terwijl de telefoon op afstand van de headset ligt en vergelijk met de Gboard-schakelaar uit. Verbreek de headsetverbinding en start een nieuwe sessie om de terugval te controleren.

De routering hangt af van Android en het invoerapparaat. De Bluetooth-route van 18.8 gebruikt Android 12 of nieuwer, kan bedrade of USB-invoer voorrang geven en kan sommige autoapparaten overslaan. Een verbinding of zichtbare schakelaar bewijst nog geen opname via de headset. Test met de herkenner die je zelf gebruikt. Een aparte herkenner kan zijn eigen audio-invoer kiezen.

## Het uiterlijk van het toetsenbord

### Frosted Glass

Een ondoorzichtig toetsenbordpaneel kan de vervaging helemaal afdekken. **Follow theme** gebruikt de achtergrond van het thema. Ook een officieel thema kan ondoorzichtig blijven. Alleen **Blur strength** omhoog zetten helpt dan niet.

**Maak het effect eerst goed zichtbaar**

1. Open **Patches → Keys, Layout & Symbols → Frosted Glass** en zet **Enable live blur** aan. De patchselectie in Morphe maakt het menu beschikbaar. Deze schakelaar zet het effect aan in Gboard.
2. Kies **Background transparency → Custom**. Begin bijvoorbeeld met **Custom transparency** rond **65%** en **Blur strength** rond **60**. Hoe hoger het transparantiepercentage, hoe meer je van de app achter het paneel ziet. **0%** is ondoorzichtig. De vervagingssterkte loopt van **1 tot 100**.
3. Laat **Key transparency → Follow theme** staan bij de eerste test. Zo blijven de toetsen leesbaar terwijl het paneel de vervaging laat zien. Open een tekstveld met een kleurrijke afbeelding, een patroon of grote contrasterende tekst achter het toetsenbord. Op een egaal wit of zwart scherm is het verschil moeilijk te zien.
4. Vergelijk op hetzelfde scherm en met dezelfde transparantie: zet **Enable live blur** uit en open het toetsenbord opnieuw. Zet de optie daarna aan en open het nogmaals. Met vervaging aan horen de randen achter het paneel zachter te worden. Verlaag eventueel de transparantie of sterkte om het effect subtieler te maken.

**Nog steeds ondoorzichtig of knipperend?** Live vervaging vereist Android 12+ en een toestel dat vervaging tussen vensters ondersteunt. Test met batterijbesparing uit als Android de vervaging onderdrukt. Probeer ook een tweede app. Transparantie kan blijven werken op een toestel zonder live vervaging. Zet **Extend to navigation bar** uit bij flikkeren aan de onderrand of slecht leesbare navigatieknoppen. Test eerst met een eenvoudig Dynamic Color-thema. Een afbeelding, een bijna ondoorzichtige tint of AMOLED-zwart met **Follow theme** kan het effect verbergen.

### Rounded Keyboard Panel

Open **Patches → Keys, Layout & Symbols → Rounded Keyboard Panel**. Zet het aan, kies de hoeken die rond mogen zijn en pas de bovenste en onderste radius aan. Gebruik een contrasterende appachtergrond om de rand te zien en open het toetsenbord na elke wijziging opnieuw. Deze instelling verandert het paneel om de toetsen heen. Voor de afzonderlijke toetsen gebruik je **Key Shape Selection**.

### Custom Theme

Open **Thema** in Gboard om een geschikt ZIP-thema te importeren, of open de galerij onder **Patches → Keys, Layout & Symbols → Custom Theme**. Laat de patch voor compatibiliteit met de apphandtekening toegepast. Importeer of download een vertrouwd thema, selecteer het en tik op **Toepassen**. Galerijthema’s worden op aanvraag opgehaald. Een download verandert je thema pas wanneer je het toepast. Wordt een ZIP geweigerd, probeer dan een bekend werkend bestand en behoud intussen het vorige thema.

### Top Toolbar Item Count

Selecteer **Top Toolbar Item Count** bij het patchen in Morphe. Zet bij **Patches → Keys, Layout & Symbols → Top Toolbar Item Count** de optie **Enable** aan, stel **Count** in op 3 tot 8 en herstart Gboard wanneer daarom wordt gevraagd. Controleer de werkbalk in een normaal invoerveld. Het aantal beschikbare items hangt af van het invoerveld en de ingeschakelde functies. Stel eerst het aantal in en gebruik daarna het potlood in het werkbalkmenu om items naar de bovenste balk te slepen.

### G Logo on Spacebar

Open **Patches → Keys, Layout & Symbols → G logo**. Kies de ingebouwde G, een ander teken of een eigen PNG, WebP of JPEG. Pas formaat en kleur aan. Laat de taalnaam eerst zichtbaar tot het logo naar wens staat. Open het toetsenbord opnieuw en bekijk de spatiebalk in je eigen thema en toetsenbordtaal.

Vanaf v1.107.1 blijft het logo zichtbaar wanneer je met **G logo** ingeschakeld wisselt tussen QWERTY, Handwriting en Morse code. Dit is op een OnePlus 15 gecontroleerd. De oorspronkelijke melding staat in [issue #13](https://gitlab.com/johninnld/nl-morphe-patches/-/work_items/13).

### Key Shape Selection

Open **Thema**, selecteer een ondersteund thema en zoek **Key shape** in de details. Pas het thema toe en vergelijk afgeronde of door het thema bepaalde toetsen met vierkante toetsen. Welke vormen beschikbaar zijn hangt af van het thema. De instelling verandert individuele toetsen, los van de afronding van het buitenpaneel.

### AMOLED dark keyboard

Pas **AMOLED dark keyboard** toe in Morphe. Kies daarna in Gboard **Instellingen → Thema → Dynamic Color → Toepassen** en schakel Androids **donkere thema** in. Open een tekstveld. Het paneel achter en tussen de toetsen hoort puur zwart te zijn. De toetsen zelf en de accentkleuren kunnen grijs of gekleurd blijven. Ga terug naar het lichte Android-thema en open het toetsenbord opnieuw om het verschil te controleren. Er is geen aparte AMOLED-tegel.

## Schrijven, scannen en bewerken

### Shift + Backspace Forward Delete

Selecteer de patch in Morphe en zet de schakelaar aan bij **Patches → Toetsenbordhulpmiddelen → Shift + Backspace Forward Delete**. Start Gboard opnieuw als daarom wordt gevraagd. Plaats de cursor vlak voor een teken. Houd Shift op het scherm ingedrukt en tik op Backspace om het teken na de cursor te wissen. Backspace zonder Shift wist het teken vóór de cursor.

### Long-Press Editing Shortcuts

Stel bij **Patches → Toetsenbordhulpmiddelen → Long-Press Editing Shortcuts** de standaardpositie in op **Eerst** of **Laatst**. Elke toets kan de standaard volgen of een eigen positie krijgen. Open het toetsenbord opnieuw nadat je de instelling hebt opgeslagen. Houd A ingedrukt om alles te selecteren, Z om ongedaan te maken, C om te kopiëren, X om te knippen, V om te plakken of Y om opnieuw uit te voeren. Ongedaan maken en opnieuw uitvoeren hangen af van de teksteditor. De gebruikelijke accenten en andere opties blijven in het menu staan.

### Custom Symbols

Selecteer de patch in Morphe, schakel over naar een Engelse indeling en open **Custom Symbols** in het hulpmiddelenmenu van het toetsenbord. Kies een categorie en tik op een symbool om het in te voegen. Gboard opent zijn eigen expressiepaneel met 11 aangepaste categorieën. Wissel van categorie via de tabbladen en gebruik de toetsenbordknop om verder te typen.

### Grammar Checker

Kies op Android 12 of nieuwer de gepatchte Gboard als spellingcontrole van Android en zet **Gboard → Tekstcorrectie → Grammaticacontrole** aan. Tik in een teksteditor die Android-spellingcontrole ondersteunt op een onderstreepte tekst om vervangende suggesties te zien. De taal en beschikbaarheid van het grammaticamodel bepalen wat Gboard kan controleren. Wil je Gemma gebruiken voor dezelfde onderstreping en suggestielijst, kies dan Local AI en schakel **Inline grammar** in bij **Writing preferences**. Laat de gepatchte Gboard geselecteerd als Android-spellingcontrole.

### Enable Inline Autofill Suggestions

Pas deze patch toe in Morphe en kies de gepatchte Gboard als toetsenbord. De patch activeert Gboard's bestaande Android-module voor inline automatisch invullen. Open op Android 11 of nieuwer **Bitwarden → Instellingen → Automatisch invullen**, schakel de service in, kies Bitwarden als Android-provider en kies **Inline** bij de weergave van suggesties (oudere clients noemen dit **Use inline autofill**). Laat Gboard's **Tekstcorrectie → Suggestiestrook tonen** aan staan. Een Vaultwarden-account gebruikt dezelfde Bitwarden-clientinstellingen; Gboard maakt zelf geen verbinding met de kluisserver.

Open een ondersteund aanmeldformulier waarvoor een testlogin is opgeslagen. Boven de toetsen hoort een Bitwarden-suggestie of ontgrendelactie te verschijnen. Kies deze en controleer de ingevulde velden. Android, de app en Bitwarden bepalen nog steeds welke velden in aanmerking komen. De patch omzeilt de kluisontgrendeling en domeincontrole niet. Verschijnt er geen suggestie, vergelijk dan de popupmodus en controleer [Bitwarden's Android-instellingen](https://bitwarden.com/help/auto-fill-android/).

### Smart Compose

Dit is de upstream-patch **Inline Suggestions**, hier gepubliceerd als **Smart Compose** om verwarring met wachtwoorden invullen te voorkomen. Pas de patch toe in Morphe en schakel daarna de standaardschakelaar onder **Gboard → Tekstcorrectie → Smart Compose** in. Begin een Engelse zin in een ondersteunde app en kijk of een tekstaanvulling verschijnt. Veeg naar rechts om die in te voegen. Vergelijk met Smart Compose uitgeschakeld.

De patch opent de client-side rolloutvoorwaarde en toont de instelling. Hij levert geen taalmodel en verwijdert de overige taal-, app- en modelvoorwaarden niet. Google's [Smart Compose-uitleg](https://support.google.com/gboard/answer/7068415?co=GENIE.Platform%3DAndroid&hl=en) noemt beschikbaarheid voor Engels in de VS. Nederlandse aanvullingen zijn niet gegarandeerd. Smart Compose en inline automatisch invullen zijn onafhankelijk te selecteren.

### AI Writing Tools

Open **Patches → AI & Voice → AI Writing Tools**. De bestaande backends **GBOARD_SERVER**, **PRIVATE_INFERENCE_AICORE** en **PRIVATE_INFERENCE_ASTREA** blijven beschikbaar, met hun oorspronkelijke voorwaarden voor Google-accounts, modellen en services. Alleen het installeren van de optionele lokale provider verandert de gekozen backend niet.

#### Optionele Local AI instellen

Neem **AI Writing Tools** op bij het patchen van Gboard in Morphe. Open **Patches → AI & Voice → Local AI** en kies **Get Local Model Host** of **Update Local Model Host**. Open na de installatie via Android **Model setup**, stel een tekstmodel in en wacht op **Model ready**. Zet daarna **Use Local AI** aan in Gboard. De lokale backend meldt wanneer de host gestopt of onbeschikbaar is. [Volledige Local AI-installatie](local-ai.md#de-companion-installeren)

#### Lokaal schrijven en spraakbewerkingen

Selecteer tekst of zet de cursor in een concept en open de oorspronkelijke **Writing Tools** via de werkbalk. Probeer **Proofread**, **Rephrase** of **Professional**. Controleer het voorstel in het huidige toetsenbordthema voordat je het toepast. Als je het tekstveld of de selectie wijzigt, vervalt het lopende resultaat.

Stel **Use shared local speech** in, kies **Voice Edit** in de werkbalk, tik op de microfoon en spreek een instructie uit, bijvoorbeeld “make this friendlier”. Gboard gebruikt het spraakmodel dat je in Local Model Host hebt gekozen. Pas de bewerking toe vanuit het voorbeeld. [Lokaal dicteren instellen](local-ai.md#lokaal-dicteren-instellen)

Geef voor **AI Reply** of **My Style** toestemming in Androids schermopnamevenster en ga terug naar het oorspronkelijke gesprek. Controleer de schermafbeelding en tik op **Read this screen** om die als context te gebruiken. Voeg voor **My Style** je eigen voorbeelden of voorkeuren toe onder **Local AI → Writing preferences → Your style**. Controleer het concept voordat je op **Apply** tikt. Verstuur het zelf vanuit het gesprek wanneer je klaar bent.

#### Tekstaanvulling, grammatica en afbeeldingen

Het contextscherm heeft afzonderlijke experimentele schakelaars voor **Shared Smart Compose** en **Shared inline grammar**. Shared-tekstaanvulling gebruikt Gboard's inline-weergave als het tekstveld bruikbare cursorinformatie levert. Grammatica geeft native correcties terug met bereiken die uit de oorspronkelijke tekst worden afgeleid. Voor beide moeten native kwaliteit, snelheid en het verwerpen van verouderde resultaten nog afzonderlijk worden gevalideerd. Een zichtbare schakelaar bewijst niet dat het modelpad werkt. Gewoon typen, vegen en woordvoorspelling behouden hun native paden.

Kies bij afbeeldingsselectie onder **Scan text** de gedeelde OCR-optie en schakel vision in de provider in. De bestaande gebundelde OCR blijft beschikbaar. Shared OCR levert letterlijke tekst en verzint geen tekstvakken of betrouwbaarheidsscores. De provider vereist geen camera- of microfoontoestemming.

Na gecontroleerde installatie gebeurt de inferentie op het toestel. Het downloaden van APK en model vereist verbinding. Laden, geheugendruk en Stop blijven echte toestanden; alleen een geïnstalleerde APK betekent nog geen gebruiksklaar model.

### Enable OCR / Scan Text

Open een proefnotitie, open de Gboard-werkbalk en tik op **Scan Text**. Geef toegang tot de camera, richt die op een goed verlichte gedrukte zin en voeg het resultaat in. De meegeleverde herkenner verwerkt Latijns schrift op het toestel. Lees na op tekenfouten. Kies onder **Patches → Keyboard Tools & Shortcuts → OCR / Scan Text** de optie **Choose an image** om tekst uit een foto of schermafbeelding te kopiëren. Gedrukte tekst in Latijns schrift is geschikter dan handschrift of andere schriften.

### Toolbar Editing Buttons

Open het werkbalkmenu, zoek **Alles selecteren**, **Kopiëren**, **Knippen** en **Plakken** en sleep de gewenste knoppen naar de bovenste balk. Probeer ze in een proefnotitie met twee regels. Alles selecteren markeert de bewerkbare tekst, kopiëren laat die staan en knippen haalt de selectie weg. Plakken gebruikt het klembord. Wachtwoordvelden, alleen-lezenvelden en apps die zelf editoracties afvangen kunnen anders reageren.

### Cursor trackpad mode

Zet **Enable cursor trackpad mode** aan onder **Patches → Keyboard Tools & Shortcuts**. Houd de spatiebalk ingedrukt en schuif om de cursor te bewegen. Probeer een fout midden in een notitie van twee regels te bereiken. De optionele vergrendeling houdt de trackpadmodus actief zonder het gebaar opnieuw te starten. Sluit de trackpadmodus om weer te typen.

### Simple Calculator

Zet het aan onder **Patches → Keyboard Tools & Shortcuts → Simple Calculator**. Typ `12*(3+4)` in een gewoon tekstveld. De suggestiebalk hoort **84** te tonen. Tik op het resultaat om de berekening te vervangen. Langere berekeningen kun je verschuiven. Test in een normaal tekstveld met een zichtbare suggestiebalk.

### Incognito Mode Toggle

Open **Patches → Keyboard Tools & Shortcuts → Incognito mode**, zet **Add Incognito button** aan en kies of het klembord en spraakinvoer beschikbaar blijven. Open het balkmenu en voeg de incognitoknop toe of tik erop. Controleer de incognito-indicator en probeer het klembord en de microfoon zoals je ze hebt ingesteld. Dit verandert de modus van Gboard. Als spraakinvoer toegestaan blijft, kan een herkenner die een externe dienst gebruikt nog steeds gegevens versturen.

## Klembord en lokaal delen

### Clipboard Enhancements

Open **Patches → Clipboard**. Stel de bewaartijd, het aantal items, de voorbeeldregels, het aantal kolommen en eventuele tijd- of volgnummers in. Kopieer drie onschuldige stukjes tekst en controleer in het Gboard-klembord hoe ze verschijnen en wanneer ze verdwijnen. Een langere geschiedenis laat meer gekopieerde tekst toegankelijk op het toestel. Gebruik korte bewaartijden op gedeelde toestellen.

### Web Clipboard

Open **Patches → Clipboard → Web Clipboard** en zet **Enable Web Clipboard** aan. Laat **Require pairing code** ingeschakeld. Open op je computer het adres dat onder **Current URLs** wordt getoond. Verbind beide toestellen met hetzelfde vertrouwde wifi-netwerk en voer de koppelcode in. Kopieer aan weerszijden een proeftekst en controleer of die aankomt. Voeg de tegel **Web Clipboard** toe aan Snelle instellingen als je het portaal snel wilt starten en stoppen.

Je browser maakt via het lokale netwerk verbinding met de telefoon. Werkt het adres niet, controleer dan of beide toestellen op hetzelfde netwerk zitten, het portaal draait en het netwerk verkeer tussen toestellen toestaat. Controleer **Connected clients**, verbreek onbekende sessies en zet het portaal uit na gebruik. Vermijd gevoelige klembordtekst op een gedeeld netwerk.

## Bètafuncties en verborgen vlaggen

### Beta features (18.8)

Open **Patches → More settings → Beta features**. De hoofdschakelaar moet aanstaan om deze wijzigingen toe te passen. Zet alleen de gewenste functies aan en herstart Gboard wanneer daarom wordt gevraagd. Zet je de hoofdschakelaar uit, dan gebruikt Gboard weer zijn eigen flagwaarden en blijven je keuzes bewaard.

| Functie | Hoe je het controleert |
| --- | --- |
| Snel plakken van platte tekst | Kopieer tekst en open een bewerkbaar veld. Tik op de nieuwe klembordchip als die verschijnt. De tekst hoort met één tik te worden ingevoegd. |
| Klembordchip op het zwevende toetsenbord | Schakel klembordsuggesties in, zet het toetsenbord op **Zwevend**, kopieer tekst en kijk naar de zwevende suggestiebalk. De bestaande klembordinstelling blijft nodig. |
| Onzichtbare zone om het zwevende toetsenbord te vergroten | Sleep net binnen een zijrand van het zwevende toetsenbord om de grootte te wijzigen. Het formaatgebied is onzichtbaar. De verplaatsgreep verschuift het hele toetsenbord. |
| Emoji2-provider | Vergelijk de emojikiezer met de optie aan en uit. Welke verschillen je ziet hangt af van Android en het lettertype. Een onveranderd symbool geeft op zichzelf geen uitsluitsel. |
| Vernieuwde bevestiging bij het wegslepen van een suggestie | Sleep een ongewenste suggestie uit de balk. Kijk of de nieuwere bevestiging verschijnt. Het tekstveld moet een te verwijderen suggestie aanbieden. |

### Hidden flags (18.8)

Open **Patches → More settings → Hidden flags**. Je kunt **App-specific word biasing**, **App-specific suggestion bar** en **Square search radius** afzonderlijk instellen. Een wijziging kan in Gboard aankomen terwijl het zichtbare effect nog van modellen of het huidige invoerveld afhangt.

Gebruik voor de eerste twee opties twee gewone apps. Typ in één app herhaaldelijk hetzelfde onschuldige, ongewone woord en vergelijk de suggesties. Vergelijk voor de zoekradius dezelfde invoer met de optie aan en uit. Wijzig één vlag tegelijk, open Gboard opnieuw en controleer of je keuze behouden blijft. Zie je geen herhaalbaar verschil, noteer dan de stand van de schakelaar en laat het zichtbare effect onbevestigd.
