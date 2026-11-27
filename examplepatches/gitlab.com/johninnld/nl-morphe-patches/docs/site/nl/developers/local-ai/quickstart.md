# Een correctieactie toevoegen

Deze tutorial voegt één optionele actie toe aan een Android-editor. [Installeer en verifieer eerst de provider](install.md). Het volledige voorbeeld `Proofreader.java` staat in de [ontwikkelaarsdocumentatie van de companion](https://gitlab.com/johninnld/local-model-host) en in het offline documentatiescherm.

## Verbinden en onderhandelen

Gebruik `ModelHostClient.connect(context, listener)` op de hoofdthread. De listener ontvangt `HostStatus` en `HostCapabilities` na onderhandeling. Vereis vóór het aanbieden van de actie `status.isReady()` en `capabilities.supports("proofread")`.

Open de sessie op een werkthread:

```java
HostSession session = client.openSession(
    new SessionOptions("My editor", "en", 2048)
);
```

`client` is jouw verbonden `ModelHostClient`. Koppel de sessie aan de levensduur van de editor. Synchrone Binder-aanroepen voor detectie, status en sessies horen niet op de UI-thread; verbindingscallbacks gebruiken de ingestelde callback-executor.

## Een kleine taak indienen

```java
RequestHandle active = session.submitText(
    TaskRequests.proofread("She dont have the order yet."),
    json -> {
        try {
            JSONObject event = new JSONObject(json);
            if (!event.optBoolean("terminal")) return;
            if ("ok".equals(event.optString("status"))) {
                showPreview(event.getString("text"));
            } else {
                showError(event.optString("code", "INFERENCE_FAILED"));
            }
        } catch (Exception invalid) {
            showError("PROTOCOL_ERROR");
        }
    }
);
```

Importeer de SDK-klassen en `org.json.JSONObject`. `showPreview` en `showError` zijn UI-functies van jouw app. Voer UI-werk op de hoofdthread uit wanneer een andere callback-executor is gekozen. De host levert de correctie-instructie; jouw app hoeft die niet na te bouwen.

## De gebruikersbewerking behouden

Bewaar vóór verzending de oorspronkelijke tekst, selectie en documentrevisie. Controleer vóór weergave of toepassing dat dezelfde editor en revisie actief zijn. Negeer verouderde resultaten na typen, cursorbeweging of navigatie. Annulering kan met voltooiing samenvallen en vervangt deze controle niet.

Toon een voorbeeld en gebruik de gewone vervang-/ongedaan-makenfunctie van de editor. Een gestreamd deel is voorlopig. Een succesvol eindresultaat bevat de volledige definitieve tekst; voeg het niet nogmaals toe aan verzamelde delen.

## De actie beëindigen

Gebruik `active.cancel()` wanneer de actie niet meer relevant is. Sluit sessie en client bij het einde van hun UI-levensduur. Maak openstaande bewerkingen ongeldig bij verbreking en verbind bewust opnieuw; speel een oude bewerking niet automatisch in een nieuw veld af.

Toon afzonderlijke toestanden voor verbinden, ontbrekend model, laden, geheugenpauze, Stop, fout en Gereed. Controleer gegenereerde wijzigingen, vooral namen, getallen en ontkenningen.

Volgende stappen: [taakvoorbeelden](tasks.md) en [spraak integreren](speech.md).
