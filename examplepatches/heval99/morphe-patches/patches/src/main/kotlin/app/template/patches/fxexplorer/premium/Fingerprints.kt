package app.template.patches.fxexplorer.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// FX Explorer's Plus state is a client-side check: it reads "plus_json" + "plus_signature" from
// <package>_license SharedPreferences and verifies the signed payload, or accepts the separate
// nextapp.fx.rk licence app when its signature matches FX's own. The reader is one
// (Context) -> boolean method, so it is located by the preference key it holds (the class is
// R8-renamed, the string is not).
internal object PlusLicenseFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("plus_json")),
)
