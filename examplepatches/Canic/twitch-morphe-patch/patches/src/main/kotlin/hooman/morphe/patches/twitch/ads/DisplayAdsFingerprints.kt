package hooman.morphe.patches.twitch.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// The parser that turns an ad-edge HTTP response into the app's ad-result union (aq.a(Result, Z)zp in
// Twitch 30.5.0). It returns one of the zp subtypes: a display ad (tp), no-ad (sp), or an error (vp/wp).
// Every display/banner/in-feed ad the app shows comes through here first. R8 renames the class, so pin
// it by two error strings only this parser builds, plus its (Result, boolean) -> nq shape. Forcing it
// to return the no-ad singleton makes the whole display-ad pipeline see "nothing to show".
object DisplayAdResponseParserFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf(
            "failed to parse display ad response: ",
            "could not parse content type: ",
        ),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "a",
    returnType = "Lzp;",
    parameters = listOf("Lretrofit2/adapter/rxjava2/Result;", "Z"),
)
