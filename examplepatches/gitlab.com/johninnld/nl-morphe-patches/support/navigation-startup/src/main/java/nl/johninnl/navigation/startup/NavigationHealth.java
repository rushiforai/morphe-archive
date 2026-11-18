package nl.johninnl.navigation.startup;

/** Shared, user-facing health labels for Maps and Vela. Symbols never replace the explanation. */
public final class NavigationHealth {
    private NavigationHealth() {}
    private static String text(boolean dutch,String nl,String en){return dutch?nl:en;}

    public static String warnings(String provider,String state,boolean events,boolean complete,String engine,boolean dutch){
        String title=text(dutch,"Waarschuwingen: ","Warnings: ");
        switch(state){
            case "ready":
                if(!events)return "✕ "+title+text(dutch,"niet verbonden met ","not connected to ")+provider;
                return (complete?"✓ ":"! ")+title+text(dutch,"verbonden met ","connected to ")+provider
                    +(complete?"":text(dutch," · sommige typen ontbreken"," · some warning types unavailable"));
            case "connecting":return "… "+title+text(dutch,"verbinden met ","connecting to ")+provider;
            case "disconnected":return "! "+title+text(dutch,"verbinding verbroken · opnieuw verbinden","connection lost · reconnecting");
            case "legacy":case "incompatible":return "! "+title+text(dutch,"werk de patches van ","update the patches for ")+provider;
            default:
                boolean connecting=engine.equals("connecting")||engine.equals("checking")||engine.equals("starting")||engine.equals("reconnecting")||engine.equals("running");
                return (connecting?"… ":"○ ")+title+text(dutch,"niet verbonden met ","not connected to ")+provider;
        }
    }

    public static String service(String provider,String state,boolean dutch){
        switch(state){
            case "running":return "✓ "+provider+text(dutch," is actief voor navigatie"," is running for navigation");
            case "starting":return "… "+provider+text(dutch," wordt gestart"," is starting");
            case "permission_required":return "! "+text(dutch,"Geef ","Give ")+provider+text(dutch," toegang tot je locatie"," access to your location");
            case "disabled":return "! "+text(dutch,"Schakel gegevens delen in bij ","Enable data sharing in ")+provider;
            case "paused":return "○ "+provider+text(dutch," wacht tot de kaart wordt gebruikt"," is paused until the map is in use");
            case "unavailable":case "incompatible":return "! "+text(dutch,"Werk de patches van ","Update the patches for ")+provider;
            case "not_authorized":return "✕ "+provider+text(dutch," staat deze verbinding niet toe"," does not allow this connection");
            case "start_blocked":return "✕ "+text(dutch,"Android blokkeert het starten van ","Android blocked startup of ")+provider;
            case "error":return "✕ "+provider+text(dutch," kon niet starten · nieuwe poging volgt"," could not start · retrying");
            case "off":return "○ "+provider+text(dutch," is niet gestart"," is not running");
            default:return "… "+text(dutch,"Verbinding met ","Checking connection to ")+provider+text(dutch," controleren","");
        }
    }

    public static String data(String provider,String receiver,boolean fresh,boolean missingValues,boolean dutch){
        if(!fresh)return "! "+text(dutch,"Geen recente gegevens van ","No recent data from ")+provider
            +" · "+receiver+text(dutch," gebruikt eigen gegevens"," is using its own data");
        return "✓ "+text(dutch,"Gegevens van ","Receiving data from ")+provider+text(dutch," ontvangen","")
            +(missingValues?"\n"+receiver+text(dutch," vult ontbrekende waarden aan waar beschikbaar"," supplies missing values when available"):"");
    }
}
