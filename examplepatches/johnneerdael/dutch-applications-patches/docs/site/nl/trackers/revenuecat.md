# RevenueCat: waar eindigt abonnementsbeheer en begint optionele telemetrie?

## Waarom bespreken we een aankoopdienst?

RevenueCat helpt apps met abonnementen, aankoopbewijzen en gebruiksrechten. Een **entitlement** is de registratie dat een klant een betaalde functie mag gebruiken. Daarvoor moet de app klant- en aankoopgegevens uitwisselen. Zulke verzoeken zijn nodig voor de aankoopdienst; ze zijn niet allemaal optionele tracking.

De dienst ondersteunt daarnaast **klantattributen**: benoemde eigenschappen bij een klantrecord. De documentatie beschrijft eigen attributen en gereserveerde velden voor contactgegevens of identificatoren uit andere systemen. Zulke waarden kunnen analyse en gerichte aanbiedingen ondersteunen. Dat zijn productmogelijkheden, geen bewijs dat onze weerapps ieder ondersteund attribuut versturen. [RevenueCat over klantattributen](https://www.revenuecat.com/docs/customers/customer-attributes).

## Waarom zijn extra identificatoren relevant?

**Denkbeeldig voorbeeld:** bij abonnementsklant `R123` wordt ook installatie-ID `F456` uit het meetsysteem opgeslagen. Daarmee zijn de eerder gescheiden gegevens te koppelen, ook als geen van beide ID's een naam bevat. Een aankoopbewijs en een optioneel analytics-ID hebben verschillende taken; een privacywijziging hoort die afzonderlijk te onderzoeken.

Een app kan attributen lokaal klaarzetten voordat ze worden verstuurd. Een **setter** is een functie die een waarde invult. Als je alleen die functie stopt, kunnen eerder ingevulde waarden nog klaarstaan in een **uploadwachtrij** voor latere verzending. De onderzochte patches stoppen daarom soms ook het versturen van opgeslagen attributen.

## Wat vonden we in de weerapps?

[Buienalarm 4.32.0](../apps/buienalarm.md) levert een Firebase-appinstance-ID en `subscription_type`. De onderzochte SDK bevat optionele identificatorverzameling, nog niet gesynchroniseerde attributen, paywall- en advertentiegebeurtenissen en diagnostiek. **Disable tracking** stopt die optionele functies, ook het uploaden van opgeslagen attributen. De klantidentiteit, aankoopbewijzen en gebruiksrechten blijven werken, net als terugmeldingen over transacties. De exacte RevenueCat-uploadhost is niet vastgesteld. [Buienalarm-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md).

[Weeronline 3.61.0](../apps/weeronline.md) onderdrukt diagnostiek en het optionele Firebase-attribuut. De aankoopdienst verstuurt nog wel gebeurtenissen wanneer het betaalscherm (de paywall) verschijnt. SDK-bestemmingen zijn onder meer `api-diagnostics.revenuecat.com`, `api.revenuecat.com` en `api-paywalls.revenuecat.com`. Een aangetroffen adres bewijst niet dat elk adres is benaderd. [Weeronline-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [onderbouwing van bestemmingen](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

[Weerplaza 3.13.1](../apps/weerplaza.md) stopt daarnaast de onderzochte optionele attributen, het verzenden van gebeurtenissen uit de wachtrij en diagnostiek. Aankoop-API's blijven werken. [Weerplaza-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERPLAZA_TRACKING_AUDIT.md).

## Wat bewijst dit niet?

Deze controles maken geen abonnement of aankoopbewijs aan en wissen geen historische servergegevens. Ze bewijzen niet dat alle netwerkverzoeken en aankoopmetingen zijn gestopt, of hoe lang servers gegevens bewaren.

Bewijs beoordeeld op **28 oktober 2026**. Zie [identificatoren](../learn/identifiers.md) en [de methode](../reference/methodology.md).
