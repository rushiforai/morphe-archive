# Voetbal International

**Ondersteunde versie:** 5.13.52 · **Build:** 910 · **Invoer:** originele Play APKS · **Android:** 12L / API 32 of nieuwer

`nl.vi`

[Download de originele APKS](https://buzzheavier.com/93s2c0j8pw5n){ .md-button .md-button--primary }

Gebruik de complete originele Play-splitset voor deze versie. Zie [originele bestanden](../guides/downloads.md) en [installatie](../guides/install.md).

De patches vragen volledige artikelteksten op via de meegeleverde PXR-client, verwijderen de onderzochte Pro-vergrendelingen en stoppen de gevonden advertenties en optionele metingen. De echte account- en abonnementsstatus blijft behouden. De gebruiker meldde werkende Pro-inhoud en gaf op 29 oktober 2026 toestemming voor publicatie op main. De goedgekeurde build bevat het filter voor uitgeverspromoties.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Pro-artikelen | De meegeleverde route met app-header leverde volledige inhoud voor twee onderzochte Pro-artikelen. De publieke route gaf eerder een teaser en betaalmuur. | Read full articles gebruikt die ingebouwde verzoekroute en verwijdert de onderzochte betaalmuur en carrouselvergrendeling. Een bewaarde teaser volgt de bestaande herlaadroute. |
| Advertenties | We onderzochten weergaveadvertenties, tussenschermen, oudere banners en aparte advertentieroutes voor feed- en losse video's. JW ondersteunt ook advertentieplanning en plugins vanuit externe configuratie. | Hide ads stopt de onderzochte activering vóór verzoeken of weergave. Na sluiten of annuleren van een tussenscherm blijft artikelnavigatie werken. |
| Promoties van de uitgever | De publieke startpaginafeed bevatte vijf `marketingBlock`-records, waaronder de gemelde promotie voor een papieren special. | Hide ads verwijdert het ingebouwde type Marketing voordat het raster wordt opgebouwd en stopt ook de weergave van bewaarde promoties. Gewijzigde campagnetitels en bestemmingen omzeilen dit filter niet. |
| Lees- en kijkmetingen | Firebase, comScore, BlueConic en JW-speleranalytics bevatten afzonderlijke verzendroutes. Scherm-, artikel- en spelercontext en optionele identifiers kunnen worden gebruikt voor publieksmetingen en profielen. | Disable tracking blokkeert de onderzochte ingangen, identifieropvragingen, bekende bewaarde metingen en activering van JW-analytics. |
| Toestemmingsschermen | Bij starten vraagt de app een externe update voor advertentietoestemming op. Het handmatige formulier heeft een aparte ingang. | Skip consent screens stopt beide ingangen voordat formulieren verschijnen. De patch slaat geen akkoord of weigering op. De lokale leeftijdscontrole voor gokfuncties blijft bestaan. |

## Beschikbare opties

Alle vier opties staan standaard aan.

- Read full articles staat los van de privacyopties. Echte authenticatie, aankopen en abonnementsstatus blijven behouden. Headers die deze patch toevoegt, worden verwijderd bij omleidingen buiten de toegestane artikelroute.
- Hide ads onderdrukt de onderzochte weergave- en videoadvertenties en promotiekaarten van de uitgever. Artikelen, normale weergave en navigatie blijven behouden.
- Disable tracking bevat Hide ads. De optie blokkeert ook optionele identifiers, profilering en bekende routes voor bewaarde metingen.
- Skip consent screens bevat beide privacyopties. Toestemmingsformulieren verschijnen niet bij starten of handmatig heropenen. De patch slaat geen akkoord of weigering op.

[Lees wat iedere patch verandert](../reference/catalogue.md) en [welke opties van elkaar afhangen](../guides/choose-patches.md).

## Wat blijft bestaan en wat is nog onbekend

Artikelen kunnen het PRO-label behouden terwijl hun volledige tekst leesbaar is. De patches maken geen betaald account of abonnement aan. Videolicenties en andere voordelen die de server bepaalt, blijven bij de uitgever.

Accountauthenticatie, Billing, live scores, pushinfrastructuur en benodigde spelerbestanden blijven bestaan. Deze functionele diensten kunnen nog identifiers en IP-informatie uitwisselen. Onbekende transportnamen en externe webinhoud vallen buiten volledige onderdrukking van tracking. Advertenties die in de mediastream zijn verwerkt, zijn niet aantoonbaar verwijderd.

## Bewijs

Onderzocht op 29 oktober 2026: [implementatie](https://github.com/johnneerdael/dutch-applications-patches/tree/07ea928617664f5bc7e271d6d4afc80bae058e7b/patches/src/main/kotlin/patches/vi), [implementatieaudit](https://github.com/johnneerdael/dutch-applications-patches/blob/07ea928617664f5bc7e271d6d4afc80bae058e7b/docs/voetbal-international-audit.md) en [bestemmingen, gegevens en resterende diensten](https://github.com/johnneerdael/dutch-applications-patches/blob/07ea928617664f5bc7e271d6d4afc80bae058e7b/docs/privacy/voetbal-international/README.md).

Controles van originele en herbouwde APK's voeren de gewijzigde app-routes uit met expliciete grenzen voor platform en SDK's. Ze bewijzen niet het volledige gedrag op een telefoon en zijn geen ontsleutelde verkeersopname. [Zo lees je het bewijs](../reference/methodology.md).
