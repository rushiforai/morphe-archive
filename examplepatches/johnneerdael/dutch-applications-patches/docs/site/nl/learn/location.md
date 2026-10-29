# Locatie: een weervraag en een bewegingsregistratie

Als je het weer voor morgen in Groningen opvraagt, vertelt dat een server welke plaats je hebt gekozen. Het bewijst niet dat je daar bent. Steeds opnieuw de actuele GPS-coördinaten van je telefoon uploaden geeft andere informatie. Samen met tijdstippen, snelheden en rijrichtingen kunnen die coördinaten je beweging veel nauwkeuriger beschrijven.

## Stel deze vragen bij een locatieveld

- Heb je zelf een plaats gekozen of heeft de app de locatie van je telefoon gelezen?
- Gaat het om een plaatsnaam, afgeronde positie of precieze coördinaten?
- Verstuurt de app de waarde één keer op jouw verzoek, of herhaaldelijk op de achtergrond?
- Hoort er een blijvende installatie-, sessie- of accountcode bij?
- Is het doel een voorspelling, navigatie, waarschuwing, analyse of marketing?

## Wat wij vonden

In de onderzochte code van [Buienradar](../apps/buienradar.md) zit een upload op de achtergrond met breedtegraad, lengtegraad en de Swrve-gebruikerscode. De standaardtrackingpatch laat dit werken. Een afzonderlijke optie stopt de upload en schakelt ook de weerwaarschuwingen uit.

In de onderzochte code van [Flitsmeister](../apps/flitsmeister.md) verzamelt het FCD-onderdeel GPS-gegevens in bundels, met tijdstippen, snelheid, rijrichting en sessiecodes. De trackingpatch voorkomt dat dit onderdeel start en stopt de timer en de upload. De live locatie-uitwisseling voor CITS-verkeerswaarschuwingen blijft werken. De app-pagina beschrijft die verschillende functies afzonderlijk.

Deze bevindingen gelden voor de onderdelen die in de app-onderzoeken zijn bekeken. Alleen toestemming voor locatie vertelt niet welke van deze velden een app verstuurt.

## Wat kan na het patchen blijven bestaan?

Voor kaarten en routes kunnen verzoeken met locatiegegevens nodig zijn. Voor weerwaarschuwingen kan de app meldingen moeten registreren en gekozen plaatsen moeten doorgeven. Een server ziet normaal ook het IP-adres van de verbinding die hem bereikt. Diensten die blijven werken, kunnen dus gegevens blijven ontvangen nadat je optionele analyse hebt uitgeschakeld.

Op de app-pagina lees je welke gegevensuitwisseling blijft bestaan en van welke verzoeken het doel nog niet zeker is. Ga er op basis van de patchnaam niet van uit dat locatiegegevens nooit je telefoon verlaten. [Bewijs en grenzen](../reference/methodology.md).
