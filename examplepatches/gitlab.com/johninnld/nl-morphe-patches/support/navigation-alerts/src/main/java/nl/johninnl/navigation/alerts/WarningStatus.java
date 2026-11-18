package nl.johninnl.navigation.alerts;
/** Product status separates output readiness from a running provider or connected events. */
public final class WarningStatus {
    private WarningStatus(){}
    public static String output(WarningAudioOwner.Mode requested,WarningAudioOwner.Mode effective,String app,boolean nl){
        String name=effective==WarningAudioOwner.Mode.VOICE?(nl?"Spraak":"Voice"):effective==WarningAudioOwner.Mode.TONE?(nl?"Toon":"Tone"):(nl?"Stil":"Silent");
        if(requested!=effective)return name+" · "+app+(effective==WarningAudioOwner.Mode.SILENT?(nl?" is gedempt":" is muted"):(nl?" staat op alleen meldingen":" is in alerts-only mode"));
        return name;
    }
    public static String label(String status,boolean nl){
        if(status.startsWith("BUSY:")){
            String pkg=status.substring(5),name=pkg.equals("app.vela")?"Vela":pkg.contains(".maps")?"Google Maps":pkg;
            return (nl?"Waarschuwingen afgehandeld door ":"Alerts handled by ")+name;
        }
        switch(status){
            case "READY":return nl?"Audio gereed":"Audio ready";
            case "STARTED":return nl?"Waarschuwing wordt afgespeeld":"Warning playing";
            case "QUEUED":return nl?"Waarschuwing wacht op audio":"Warning waiting for audio";
            case "CONTEXT_UNVERIFIED":return nl?"Wacht op de routepositie voor deze waarschuwing":"Waiting to verify this warning on your route";
            case "OFF_ROUTE":return nl?"Waarschuwing ligt buiten uw route":"Warning is outside your route";
            case "PASSED":return nl?"Waarschuwingspunt al gepasseerd":"Warning point already passed";
            case "COMPLETED":return nl?"Waarschuwing afgespeeld":"Warning playback completed";
            case "USER_MUTED":return nl?"Waarschuwingsaudio gedempt":"Warning audio muted";
            case "COVERAGE_INCOMPLETE":return nl?"Bronwaarschuwingen nog onvolledig":"Provider warning coverage incomplete";
            case "SPEAKER_UNAVAILABLE":return nl?"Waarschuwingsaudio niet beschikbaar":"Warning audio unavailable";
            case "INCOMPATIBLE":return nl?"Werk de bronpatch bij voor deze functie":"Update the provider patch for this feature";
            case "BUSY":return nl?"Audio bij een andere kaartapp":"Audio handled by another map";
            case "AUDIO_UNCERTAIN":case "OUTPUT_ACTIVE":return nl?"Wacht op bevestiging dat vorige audio is gestopt":"Waiting for previous audio to stop";
            case "STORAGE_FAILED":return nl?"Audiostatus kon niet veilig worden opgeslagen":"Audio state could not be saved";
            case "LEGACY_RECEIVER_ACTIVE":return nl?"Werk de andere ontvangende kaartapp bij":"Update the other receiving map";
            case "OVERFLOW":return nl?"Te veel waarschuwingen; audio beperkt":"Too many warnings; audio limited";
            case "PAUSED":case "OFF":return nl?"Waarschuwingsaudio gepauzeerd":"Warning audio paused";
            case "UNOWNED":return nl?"Geen gereedstaande audio-ontvanger":"No ready warning audio receiver";
            case "ALREADY_HANDLED":return nl?"Waarschuwing al verwerkt":"Warning already handled";
            case "EXPIRED":return nl?"Waarschuwing verlopen":"Warning expired";
            case "USER_FILTERED":return nl?"Waarschuwing uitgefilterd":"Warning filtered by your choices";
            default:return nl?"Waarschuwingsaudio onderbroken":"Warning audio interrupted";
        }
    }
}
