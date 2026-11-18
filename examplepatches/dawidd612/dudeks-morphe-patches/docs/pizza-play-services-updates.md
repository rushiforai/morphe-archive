# Stock Play services update UI in MicroG mode

The supplied 5.58.0 (2301) APK retains GoogleApiAvailability notification
and dialog paths even when Games clients use MicroG. Its notification entry
posts notification10436 for ordinary availability errors and schedules a
delayed recheck for SERVICE_UPDATING. It also reports availability telemetry,
which itself uses a Google API. Both paths are independent of the previously
patched Games resolution method.

The MicroG patch now intercepts only SERVICE_VERSION_UPDATE_REQUIRED (2)
and SERVICE_UPDATING (18) in these three UI entries. Notifications return
before posting, scheduling a retry or reporting availability telemetry.
Both dialog entries call their original OnCancelListener once, when present,
then return. In particular GoogleApiActivity receives its real cancellation
and can finish, rather than becoming an empty foreground window. A null
listener is supported. No success, player, token or availability result is
invented. All other error codes enter the untouched original method body.

Real sign-in PendingIntents and SIGN_IN_REQUIRED/RESOLUTION_REQUIRED handling
remain unchanged. The change is installed only by Google Play Games via
MicroG-RE; stock-mode APKs retain all original availability UI. Availability
checks can still return real errors to the requesting SDK.

Verify the actual emitted APK with VerifyPizzaPlayServicesDex (compiled with
VerifyPizzaRewardDex and the Morphe CLI JAR). It executes each inserted guard
for errors-1 through24, null/non-null cancellation listeners, and50 repeated
update requests. It compares all original body instructions and relocated
exception handlers, and preserves every other availability, ConnectionResult
and GoogleApiActivity method. VerifyPizzaIntegrationDex calls it in both
microg and stock modes alongside existing authentication/billing checks.

The native extended-sponsor feature and all its payloads/tests are removed.
The patched native library must exactly match the existing bootstrap plus
optional funds-store output; the original sponsor limit therefore returns.
Both existing ARM64 compatibility profiles remain explicit. The user requested
normal release metadata, so5.58.0 is now marked non-experimental as5.57.3 was.

No Android device or ADB connection exists in this cloud session. This is
source-backed suppression of the inspected APK's update UI, not a reproduced
device-log attribution or an independently tested Android lifecycle matrix.
Notifications originating inside another installed package are outside this
APK's control. Preserve existing user data, signing key and authentication.
