# Local AI met Gboard gebruiken

Local AI voegt een optionele lokale route toe voor schrijfhulp, beeldtekst en dicteren. De afzonderlijke app Local Model Host beheert de modellen, zodat Gboard en andere integrerende apps ze delen. Voor installatie en inferentie zijn Play Store, AICore, een Google-account en Google Play-services niet nodig.

De standaardinstallatie behoudt de oorspronkelijke Gboard-backends.

## Gboard-telemetrie blokkeren

Pas **Block Gboard telemetry** toe in Morphe om de gevonden Clearcut-uploads, clienttelemetrie via Play-services en Tenor-deelrapporten te stoppen. De patch verbergt de standaardoptie Translate en blokkeert de cloudrequest ervan. **AI Translate** blijft beschikbaar met Local AI. GIF-zoeken, downloads, LAN-tools, companion-updates en handmatige feedback behouden netwerktoegang. Zie [private installatie en gegevensstromen](gboard-privacy.md).

Deze patch wijzigt de gekozen spraakherkenner niet. Kies en controleer gedeelde spraak afzonderlijk in Local AI.

## De companion installeren

1. Pas **AI Writing Tools**, **Enable OCR / Scan Text** en voor gedeeld dicteren **Parakeet voice typing** toe in Morphe. Behoud bij updates dezelfde pakketnaam en ondertekeningssleutel.
2. Open **Patches → AI & Voice → Local AI** in het gepatchte Gboard. Kies **Get Local Model Host** of **Update Local Model Host**. Gboard downloadt en verifieert de vastgelegde ondertekende APK voordat Androids installatievenster opent.
3. Sta installatie vanuit Gboard toe als Android dat vraagt. Behoud bij updates de gegevens van de bestaande companion.
4. Open **Model setup**. Kies Gemma 4 E2B of het optionele E4B-profiel als jouw hardware dat aangeboden krijgt. Download het gekozen model en schakel Local AI en tekst-/beeldverwerking in. Zet beeldondersteuning aan voor beeldtaken.
5. Wacht tot het tekst-/beeldmodel **Ready** meldt. Ga terug naar Gboard en zet **Use Local AI** aan.

De huidige companion vereist **Android 11 of nieuwer en 64-bits ARM**. E4B heeft meer geheugen nodig dan E2B. Een selecteerbaar model is geen garantie dat het onder de huidige omstandigheden kan laden. De instellingen onderscheiden downloaden, verifiëren, laden, Gereed en een geheugenpauze.

Gebruik voor installatie zonder Gboard het [companion-project](https://gitlab.com/johninnld/local-model-host) en de [geverifieerde installatieprocedure](../developers/local-ai/install.md).

Als netwerktoegang voor Gboard aanstaat, controleert Local AI bij het openen van de instellingen of er een nieuwere officiële Host is. Kies **Update Local Model Host** wanneer een update beschikbaar is. Gboard verifieert het pakket, de versie, de SHA-256 en de ondertekenaar voordat Android om een installatiebevestiging vraagt.

Deze Gboard-bundel gebruikt **Local Model Host v0.1.145** voor de eerste installatie. De Host laat geïnstalleerde apps standaard toe. Bij **App access** kun je apps toestaan of blokkeren. Als een beperkte instelling Gboard blokkeert, pas die keuze aan in de Host en open Local AI opnieuw. [Host-release en ontwikkelaarsbestanden](https://gitlab.com/johninnld/local-model-host/-/releases/v0.1.145).

## Schrijven in het toetsenbordthema

Open **Writing Tools** via de werkbalk. Lokale acties volgen het toegepaste toetsenbordthema. Probeer Proofread, Rephrase of Professional op een korte tekst, controleer het voorbeeld en pas toe of annuleer. Behoud het gewone ongedaan maken van de editor.

Waar aangeboden zijn er ook verkorten, samenvatten, antwoorden, stijlvoorbeelden en een opgeslagen instructie. Een antwoord heeft aangeleverde gesprekscontext nodig; een andere app wordt niet automatisch uitgelezen. Gebruik **Read this screen** expliciet en bevestig Androids schermopnametoestemming. Apps die opname blokkeren kunnen zo niet worden gelezen. Er wordt geen bericht namens jou verstuurd.

**AI Translate** gebruikt de doeltaal onder **Writing preferences → Translation language**. Kies die eerst. Experimentele Smart Compose en inline grammatica hebben eigen schakelaars onder Writing preferences; controleer suggesties nog steeds. De keuzelijst bevat alle 38 basistalen; de brontaal wordt uit je tekst afgeleid. Dit zijn beschikbare doeltalen, geen claim dat de vertaalkwaliteit voor iedere taal is geverifieerd.

| Actie | Zo gebruik je die |
| --- | --- |
| **Proofread** | Typ of selecteer tekst in een invoerveld. Open **Writing Tools → Proofread**, controleer de correcties en tik op **Apply**. |
| **Rephrase**, **Professional** en andere zichtbare stijlen | Open **Writing Tools**, kies een stijl en controleer het voorstel. Met **Cancel** behoud je je concept. |
| **AI Translate** | Stel eerst **Translation language** in. Open **AI Translate** via de werkbalk bij je concept. Controleer de doeltaal en het voorbeeld voordat je het toepast. |
| **AI Instruction** | Bewaar onder **Writing preferences** een instructie zoals “Behoud de datums en maak er één zin van”. Open **AI Instruction** via de werkbalk en controleer de bewerking. |
| **Suggest Changes** | Open de actie bij een concept. Kies een voorgestelde instructie om een voorbeeld te maken. Daarna kies je zelf of je het toepast. |
| **AI Reply** | Open de actie in een gesprek met een invoerveld, geef toestemming voor de schermopname, controleer de schermafbeelding en kies **Read this screen**. Controleer het antwoord voordat je het invoegt. |
| **My Style** | Open de actie wanneer schrijfvoorbeelden zichtbaar zijn, bevestig de opname en kies **Read this screen**. Controleer het resultaat voordat je het toepast. |
| **Smart Compose** | Zet de experimentele schakelaar aan onder **Writing preferences**. Typ een deel van een zin en controleer een eventuele aanvulling. |
| **Inline grammar** | Kies op Android 12 of nieuwer de gepatchte Gboard als Android-spellingcontrole en zet **Inline grammar** aan onder **Writing preferences**. Gemma controleert ondersteunde tekstvelden op het toestel. Tik op een blauwe onderstreping om een correctie te bekijken en te kiezen. |
| **Voice Edit** | Stel zowel gedeelde lokale spraak als het tekstmodel in. Open dan **Voice Edit** en volg de opnamestappen hieronder. |

## Tekst uit een afbeelding lezen

Selecteer Local AI en wacht tot het tekst- en beeldmodel van de host **Ready** meldt. Open een invoerveld en tik in de Gboard-werkbalk op **Scan Text**. Kies **Choose an image** voor een bestaande foto of schermafbeelding, of tik op de ontspanknop om een nieuw beeld vast te leggen. Controleer het resultaat. Selecteer de gewenste tekst en tik op **Insert** om die in het actieve veld te plaatsen.

De lokale beeldroute geeft gegenereerde herkende tekst terug. Controleer namen en getallen. Dit is iets anders dan barcode-/QR-scannen en levert geen OCR-woordvakken of zekerheidscores. De bestaande Google/gebundelde OCR-route heeft eigen instellingen wanneer Local AI niet geselecteerd is.

## Lokaal dicteren instellen

Open **Voice typing → Local AI voice typing → Open or install Local AI**. Kies en download een spraakprofiel onder **Local AI → Speech recognition**, schakel spraak in en wacht op Ready. Zet daarna **Use shared local speech** in Gboard aan.

| Keuze | Wat controleren |
| --- | --- |
| Parakeet TDT v3 of Ultra | Opgegeven talen en download van het geselecteerde profiel |
| Nemotron Streaming | Taal- en gereedheidsgegevens van het streamingprofiel |
| Whisper Tiny | De meegeleverde integratie gebruikt een Engelse prefix |

Downloads staan in de companion, niet afzonderlijk in Gboard. Tekst-/beeldverwerking mag uit staan als je alleen spraak wilt. Microfoon- en invoeginterface blijven die van Gboard. Geselecteerde lokale spraak meldt een ontbrekend model of geheugenpauze en schakelt niet stilzwijgend naar Google.

**Voice Edit** neemt een opdracht op in het toetsenbord. Open een concept, kies **Voice Edit → Record instruction** en spreek zodra het toetsenbord aangeeft dat het luistert. Het geselecteerde spraakmodel zet de opdracht om in tekst. Gemma gebruikt die opdracht en het concept om een bewerking voor te stellen. Controleer het resultaat en tik op **Apply** of **Cancel**.

Vanaf Local Model Host v0.1.145 kan Parakeet Ultra contactnamen meewegen. Selecteer Ultra in de Host, zet **Contactnamen gebruiken** aan onder **Local AI voice typing** in Gboard en geef toegang tot je contacten. Gboard geeft namen lokaal door per dicteerbeurt. Google en Rambler hebben eigen instellingen voor hun spraakwoordenboek.

## Geheugen, opslag en privacy

**Always ready** houdt een voorgrondmelding actief en verkort koud starten. On-demand bespaart belading tussen taken. Android kan een proces nog steeds opruimen en echte geheugendruk kan laden pauzeren. Een client-app kan jouw Stop niet opheffen.

Alleen geselecteerde beheerde modeldownloads blijven bewaard. Een wissel verwijdert de vorige beheerde download nadat actief gebruik is afgelopen. Originele importbestanden in Downloads beheer je zelf.

Het schrijfbeleid heeft een basisset van 38 talen. Extra talen blijven beschikbaar met een duidelijke waarschuwing over experimentele kwaliteit; kwaliteit en snelheid verschillen per taak en model. Spraak- en stemproviders hebben eigen taallijsten.

Tekst-, beeld- en spraakinferentie blijven op het toestel. Voor APK- en modelinstellingen zijn downloads nodig. Search tools gebruiken het netwerk alleen als jij ze aanzet en de client-app ze toestaat. Controleer iedere gegenereerde bewerking vóór toepassing.

[Alle Gboard-patches](gboard.md) · [Integratie voor ontwikkelaars](../developers/local-ai/index.md)

## Een mislukte lokale actie onderzoeken

**Suggest Changes** geeft bewerkingsinstructies waaruit je kiest; je tekst wordt niet meteen herschreven. “No editing changes were suggested” is een geldig resultaat. Een onleesbaar antwoordformaat wordt apart van de modelstatus gemeld.

Reply en My Style vragen eerst toestemming voor één schermopname en tonen daarna **Read this screen** vóór de lokale analyse. Android kan na de toestemmingsdialoog of afbeeldingskiezer de invoerverbinding opnieuw maken. Het voorbeeld moet bij dezelfde app, hetzelfde veld en de ongewijzigde tekst horen. **Apply/Insert** controleert opnieuw een actuele momentopname. Een gewijzigd invoerveld of gewijzigde tekst annuleert een laat resultaat.

Schakel voor een bruikbaar foutrapport de optionele logtags in, reproduceer het probleem eenmaal en schakel ze weer uit:

```sh
adb shell setprop log.tag.LocalModelHost DEBUG
adb shell setprop log.tag.GboardLocalAi DEBUG
adb logcat -v threadtime -s LocalModelHost:D GboardLocalAi:D '*:S'
# Stop logcat met Ctrl-C en schakel de logging uit.
adb shell setprop log.tag.LocalModelHost INFO
adb shell setprop log.tag.GboardLocalAi INFO
```

De hosttag vereist een versie van de companion met verzoekdiagnostiek. De logs bevatten de bewerking, correlatie-ID, afbeeldingsstappen, tijden en foutcodes; niet je tekst, prompt, afbeeldingsinhoud of sleutels. Publiceer geen volledige apparaatlogs: vermeld de relevante foutcode en stappen.
