package app.cesbar.patches.minesweeperthecleanone

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility


val removePermissionsPatch = resourcePatch (
    name = "Disable Internet and Telemetry",
    description = "Disable Internet and Telemetry by removing all non-necessary permissions from the manifest"
){
    compatibleWith(*Constants.COMPATIBILITY)

execute {
        val manifestFile = get("AndroidManifest.xml")
        var manifestContent = manifestFile.readText()

        val toRemove = listOf(
            """(?s)<uses-permission[^>]*android:name="android\.permission\.INTERNET"[^>]*/>""",
            """(?s)<uses-permission[^>]*android:name="android\.permission\.ACCESS_ADSERVICES_TOPICS"[^>]*/>""",
            """(?s)<uses-permission[^>]*android:name="android\.permission\.ACCESS_ADSERVICES_AD_ID"[^>]*/>""",
            """(?s)<uses-permission[^>]*android:name="android\.permission\.ACCESS_ADSERVICES_ATTRIBUTION"[^>]*/>""",
            """(?s)<uses-library[^>]*android:name="android\.ext\.adservices"[^>]*/>""",
            """(?s)<receiver[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementReceiver"[^>]*/>""",
            """(?s)<service[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementService"[^>]*/>""",
            """(?s)<service[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementJobService"[^>]*/>""",
            """(?s)<service[^>]*android:name="com\.google\.android\.datatransport\.[^>]*"(?:>.*?</service>|[^>]*/>)""",
            """(?s)<receiver[^>]*android:name="com\.google\.android\.datatransport\.[^>]*"(?:>.*?</receiver>|[^>]*/>)""",
            """(?s)<meta-data[^>]*android:name="com\.google\.android\.gms\.version"[^>]*/>""",
            """(?s)<meta-data[^>]*android:name="com\.google\.android\.gms\.ads\.APPLICATION_ID"[^>]*/>""",
            """(?s)<activity[^>]*android:name="com\.google\.android\.libraries\.ads\.mobile\.sdk\.common\.AdActivity"[^>]*/>""",
            """(?s)<activity[^>]*android:name="com\.google\.android\.gms\.common\.api\.GoogleApiActivity"[^>]*/>""",
            """(?s)<meta-data[^>]*android:name="com\.google\.android\.play\.billingclient\.version"[^>]*/>""",
            """(?s)<activity[^>]*android:name="com\.android\.billingclient\.api\.ProxyBillingActivity"[^>]*/>""",
            """(?s)<activity[^>]*android:name="com\.android\.billingclient\.api\.ProxyBillingActivityV2"[^>]*/>""",
            """(?s)<activity[^>]*android:name="com\.google\.android\.play\.core\.common\.PlayCoreDialogWrapperActivity"[^>]*/>""",
            """(?s)<uses-permission[^>]*android:name="com\.android\.vending\.BILLING"[^>]*/>""",
            """(?s)<uses-permission[^>]*android:name="com\.google\.android\.gms\.permission\.AD_ID"[^>]*/>""",
            """(?s)<uses-permission[^>]*android:name="com\.google\.android\.finsky\.permission\.BIND_GET_INSTALL_REFERRER_SERVICE"[^>]*/>""",
            """(?s)<activity[^>]*android:name="com\.facebook\.ads\.AudienceNetworkActivity"[^>]*/>""",
            """(?s)<provider[^>]*android:name="com\.facebook\.ads\.AudienceNetworkContentProvider"[^>]*/>""",
            """(?s)<receiver[^>]*android:name="androidx\.profileinstaller\.ProfileInstallReceiver"[^>]*(?:>.*?</receiver>|/>)""",
            """(?s)<meta-data[^>]*android:name="androidx\.profileinstaller\.ProfileInstallerInitializer"[^>]*/>""",
            """(?s)<receiver[^>]*android:name="androidx\.work\.impl\.diagnostics\.DiagnosticsReceiver"[^>]*(?:>.*?</receiver>|/>)""",
            """(?s)<package[^>]*android:name="com\.facebook\.katana"[^>]*/>""",
            """(?s)<intent>\s*<action[^>]*android:name="android\.intent\.action\.VIEW"[^>]*/>\s*<category[^>]*android:name="android\.intent\.category\.BROWSABLE"[^>]*/>\s*<data[^>]*android:scheme="https"[^>]*/>\s*</intent>""",
            """(?s)<intent>\s*<action[^>]*android:name="android\.support\.customtabs\.action\.CustomTabsService"[^>]*/>\s*</intent>""",
            """(?s)<intent>\s*<action[^>]*android:name="android\.intent\.action\.VIEW"[^>]*/>\s*<data[^>]*android:scheme="sms"[^>]*/>\s*</intent>""",
            """(?s)<intent>\s*<action[^>]*android:name="android\.intent\.action\.DIAL"[^>]*/>\s*<data[^>]*android:path="tel:"[^>]*/>\s*</intent>""",
            """(?s)<intent>\s*<action[^>]*android:name="com\.android\.vending\.billing\.InAppBillingService\.BIND"[^>]*/>\s*</intent>""",
            """(?s)<intent>\s*<action[^>]*android:name="com\.google\.android\.apps\.play\.billingtestcompanion\.BillingOverrideService\.BIND"[^>]*/>\s*</intent>"""
        )

        toRemove.forEach { block ->
            val regex = Regex(block, RegexOption.DOT_MATCHES_ALL)
            manifestContent = manifestContent.replace(regex, "")
        }
        
        manifestFile.writeText(manifestContent)
    }
}