# 2dehands

**Privacy-patches:** advertenties, optionele tracking en toestemmingsformulieren voor precies dit originele bestand. Accountgebruik, inkomende pushmeldingen en betalen worden na stabiele publicatie gevalideerd.

**Appversie:** 16.19.0 · **Build:** 633464 · **Origineel bestand:** XAPK

[Download originele app](https://buzzheavier.com/p3t8spl0cswx){ .md-button .md-button--primary }

## Ondersteunde originele bestanden

Gebruik de complete aangeleverde `2dehands-be-16-19-0.xapk`, pakket `be.tweedehands.m`.
Deze bevat de basis, de module Meldingen, ARM64/ARMv7 en schermdichtheidssplits.
De onderzochte variant vereist Android 12L of nieuwer. Andere builds worden geweigerd.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Hide ads** | Aan | Verwijdert display-/native advertenties, Admarkt-zoekertjes, gemarkeerde betaalde plaatsen en promotiekaarten. Gewone zoekertjes en wettelijke meldingen blijven. |
| **Disable tracking** | Aan | Omvat advertenties en ThreatMetrix; stopt de onderzochte optionele SDK-metingen, weergaveregistratie, oproeptracking en consentpaginameting. |
| **Disable ThreatMetrix** | Aan | Stopt apparaat-/beveiligingsprofilering en de bijbehorende sessieheaders. |
| **Skip consent screens** | Aan | Omvat tracking uitschakelen; laat de echte SDK alles weigeren voordat opstartformulieren worden opgebouwd en sluit handmatige privacyschermen. |

## Advertentie- en trackingdiensten

De patches omvatten de onderzochte Horizon-integraties met Adjust/Criteo, Meta,
Braze, Datadog, Firebase-metingen, UserZoom, Gemius/CIM, optionele Adyen-events
en Sourcepoint-paginametingen. Functionele consentconfiguratie en echte
weigeringsverzoeken blijven. De bibliotheken blijven in het pakket.

Marktplaatsfuncties, afbeeldingen, inloggen, betalen en functionele meldingen
communiceren nog met hun aanbieders. De patches maken deze diensten niet
anoniem en wissen geen bestaande geschiedenis bij de aanbieders.

## Voor gebruik

Selecteer de hele XAPK zodat Meldingen wordt meegeleverd. Alle vier patches staan
standaard aan. ThreatMetrix blokkeren kan beschermde account-/betaalfuncties
beïnvloeden. Braze-marketingmeldingen worden uitgeschakeld. De Firebase-
compatibiliteit gebruikt alleen de originele uitgeversvingerafdruk; er wordt
geen geslaagd account- of betaalresultaat nagebootst.

Anoniem bladeren wordt gecontroleerd op Android 16. Accountgebruik, inkomende pushmeldingen en betalen moeten
afzonderlijk van anoniem bladeren worden gevalideerd.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
