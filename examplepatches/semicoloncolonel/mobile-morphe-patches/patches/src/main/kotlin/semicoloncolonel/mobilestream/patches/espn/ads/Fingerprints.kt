/*
 * Ported from ajstrick81's ESPN Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/espn
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.espn.ads


internal const val AD_DISABLED_FIELD = "isAdDisabled"

// ESPN plays video through Disney's DMP SGAI plugin, the same as the TV app.
// com.disney.dmp.sgai.InterstitialManager reads one boolean, isAdDisabled,
// before it schedules an interstitial, a live break, or a VOD mid-roll
// (processInterstitialTag, processBreakTag twice, scheduleVodMidRoll,
// groupVodInsertionPoints). The field is written once, in the constructor
// that takes the full argument list. The synthetic default-args constructor
// only forwards to it, so the match requires the iput itself.
//
// The phone builds 8.27.0 and 8.29.0 keep the com.disney.dmp.sgai names
// unobfuscated. 8.30.0 renames them, so SkipAdsPatch finds the field from the
// constructor's " isAdDisabled:" log line instead of by name.
