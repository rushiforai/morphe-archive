package semicoloncolonel.mobilestream.patches.appletv.tv

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants

// Apple TV Android TV 17.0.2. Every "Coming ..." label for an upcoming title
// or episode comes from ProductNode.comingSoonData (app.js), which reads only
// the item's comingSoonDate ("2026-11-11", a UTC date) and shows a weekday
// ("This Wednesday") or a date. A release at 4:00 PM Pacific on Tuesday is
// midnight UTC on Wednesday, so it shows as Wednesday.
//
// The item also carries its exact releaseDate (milliseconds), directly or in
// canonicalMetadata. When that time falls on the comingSoonDate in UTC, the
// label shows its day and time in the device's time zone instead, such as
// "Coming Tuesday at 4:00 PM PST", or "Coming Nov 21 at 4:00 PM PST" more than
// a week out. Otherwise the app's own label is kept. Labels are English.
//
// Over-the-air updates are turned off (see AppZip), so a downloaded diff
// cannot undo the change. The phone app has no app.zip; its own Show release
// times patch covers it.

private fun releaseTimeScript(hours24: Boolean) = """(function(e){try{
if(!e||e.comingSoonCustomText)return null;
var c=e.comingSoonDate,r=e.releaseDate;
if(typeof r!=="number"&&e.canonicalMetadata)r=e.canonicalMetadata.releaseDate;
if(typeof r!=="number"||typeof c!=="string"||c.split("-").length!==3)return null;
if(r<1e12)r*=1000;
var p=function(n){return(n<10?"0":"")+n};
var u=new Date(r);
if(u.getUTCFullYear()+"-"+p(u.getUTCMonth()+1)+"-"+p(u.getUTCDate())!==c)return null;
if(r<Date.now()-864e5)return null;
var D=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
var M=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var h=u.getHours(),m=u.getMinutes();
var t=${hours24}?p(h)+":"+p(m):((h%12)||12)+":"+p(m)+(h<12?" AM":" PM");
var z=(String(u).match(/\(([^)]+)\)/)||[])[1];
if(z&&z.indexOf(" ")>0)z=z.split(" ").map(function(w){return w.charAt(0)}).join("");
if(!z){var o=-u.getTimezoneOffset(),a=Math.abs(o);z="UTC"+(o<0?"-":"+")+Math.floor(a/60)+(a%60?":"+p(a%60):"")}
var n=new Date(),days=Math.round((new Date(u.getFullYear(),u.getMonth(),u.getDate())-new Date(n.getFullYear(),n.getMonth(),n.getDate()))/864e5);
var day=days<=0?"Today":days<7?D[u.getDay()]:M[u.getMonth()]+" "+u.getDate();
return{isDateKnown:!0,isWeekdayFormat:!0,when:day+" at "+t+" "+z};
}catch(x){return null}})"""
    .replace("\n", "")

private const val COMING_SOON_DATA = "static comingSoonData(e){if(null==e?void 0:e.comingSoonCustomText)"

@Suppress("unused")
val releaseTimesTvPatch = resourcePatch(
    name = "Show release times (Android TV)",
    description = "Shows the day and time in your time zone when an upcoming episode or title is released.",
) {
    compatibleWith(Constants.TV_COMPATIBILITY)

    val timeFormat by stringOption(
        key = "timeFormat",
        default = "12",
        values = mapOf("12-hour" to "12", "24-hour" to "24"),
        title = "Time format",
        description = "Shows times in 12-hour or 24-hour format.",
        required = true,
    ) { it == "12" || it == "24" }

    execute {
        val script = releaseTimeScript(timeFormat == "24")
        editAppZip(
            listOf(
                DISABLE_OTA,
                AppZipEdit(
                    "app.js",
                    COMING_SOON_DATA,
                    "static comingSoonData(e){var __mspT=$script(e);if(__mspT)return __mspT;" +
                        COMING_SOON_DATA.removePrefix("static comingSoonData(e){"),
                ),
            ),
        )
    }
}
