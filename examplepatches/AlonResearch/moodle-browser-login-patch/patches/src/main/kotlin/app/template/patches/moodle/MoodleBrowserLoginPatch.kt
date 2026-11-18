package app.template.patches.moodle

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch

private data class Edit(val before: String, val after: String)

// Use Moodle's existing Angular button and SSO handler. No DOM polling, credential
// interception, cookie copying, or replacement of the site's regular login mode.
private val edits = mapOf(
    "assets/www/29870.ac7792e084efe277.js" to listOf(
        Edit(
            "e.isBrowserSSO=p.CoreLoginHelper.isSSOLoginNeeded(e.siteCheck.code)",
            "e.isBrowserSSO=p.CoreLoginHelper.isSSOLoginNeeded(e.siteCheck.code)",
        ),
        Edit(
            "R.vxM(e.showLoginForm&&!e.isBrowserSSO?6:e.isBrowserSSO?7:-1),R.R7${'$'}(2)",
            "R.vxM(e.showLoginForm&&!e.isBrowserSSO?6:-1),R.R7${'$'}(),R.vxM(e.siteCheck?7:-1),R.R7${'$'}()",
        ),
        Edit(
            "\"form\",16)(7,CoreLoginCredentialsPage_Conditional_18_Conditional_7_Template",
            "\"form\",16),R.nVh(7,CoreLoginCredentialsPage_Conditional_18_Conditional_7_Template",
        ),
        // The extra independent conditional needs its own Angular binding slot.
        Edit("CoreLoginCredentialsPage_Conditional_18_Template,10,6", "CoreLoginCredentialsPage_Conditional_18_Template,10,7"),
        Edit("R.bMT(2,2,\"core.login.loginbutton\")", "\"Log in through browser\""),
        Edit(
            "p.CoreLoginHelper.openBrowserForSSOLogin(o.siteCheck.siteUrl,o.siteCheck.code,",
            "p.CoreLoginHelper.openBrowserForSSOLogin(o.siteCheck.siteUrl,2,",
        ),
    ),
    "assets/www/9122.f5a00099cdd6fc7d.js" to listOf(
        Edit(
            "e.isBrowserSSO=_.CoreLoginHelper.isSSOLoginNeeded(e.siteConfig.typeoflogin)",
            "e.isBrowserSSO=_.CoreLoginHelper.isSSOLoginNeeded(e.siteConfig.typeoflogin)",
        ),
        Edit("T.vxM(e.isBrowserSSO?1:-1)", "T.vxM(e.siteConfig?1:-1)"),
        Edit("T.bMT(2,2,\"core.login.loginbutton\")", "\"Log in through browser\""),
        Edit(
            "_.CoreLoginHelper.openBrowserForSSOLogin(this.site.getURL(),this.siteConfig.typeoflogin,",
            "_.CoreLoginHelper.openBrowserForSSOLogin(this.site.getURL(),2,",
        ),
    ),
)

private val moodle521 = Compatibility(
    name = "Moodle",
    packageName = "com.moodle.moodlemobile",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFF9800,
    targets = listOf(AppTarget(version = "5.2.1", versionCodes = null)),
)

@Suppress("unused")
val browserLoginPatch = rawResourcePatch(
    name = "Add browser login option",
    description = "Add a system-browser login button to first login and reconnect while preserving the site's normal login options.",
    default = true,
) {
    compatibleWith(moodle521)

    execute {
        // Validate every anchor before changing either resource. Unsupported or
        // already patched APKs must fail rather than produce a partial patch.
        val rewritten = edits.mapValues { (path, replacements) ->
            var contents = get(path).readText(Charsets.UTF_8)
            replacements.forEach { edit ->
                val occurrences = Regex(Regex.escape(edit.before)).findAll(contents).count()
                check(occurrences == 1) {
                    "Unsupported Moodle 5.2.1 resource: expected one anchor in $path, found $occurrences. APK was left unchanged."
                }
                contents = contents.replace(edit.before, edit.after)
            }
            contents
        }
        rewritten.forEach { (path, contents) ->
            get(path).writeText(contents, Charsets.UTF_8)
        }
    }
}
