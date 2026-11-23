# Deezer Google sign-in and clean release selection

The owner validated Google sign-in and the Android Auto API 9 surface after
using Deezer's standard `deezer.android.app` package. Two installed Deezer
entries had also caused confusion when opening the car surface. These are
owner-reported phone results. The owner subsequently confirmed the clean bundle
worked and requested that all eleven remaining patches be enabled by default.

Remove Deezer's `Side-by-side installation` patch and its implementation/tests.
Remove the temporary `Trace Google sign-in (temporary diagnostic)` patch,
Gadget resource input and loader. Retain the eleven functional Deezer patches,
including Google sign-in and the original OAuth identity
metadata verified against the supported APK's signing certificate.

The bounded phone Gadget capture observed a genuine authorization activity
result (`RESULT_OK`) carrying Google status 10, followed by Deezer's native
failure handler. The local MicroG-RE 7.3.2 source resolves the authorization
service caller through the spoofing package helper, while its consent activity
checks the real calling activity's package. This explains the failure of the
renamed installation. The standard package avoids that mismatch. A proposed
MicroG source correction was retained only in local research evidence; its
checkout was restored and no replacement MicroG build was installed.

Google sign-in through the Deezer website also worked for the owner. No
Workspace administrator policy change was required for the successful phone
test. Diagnostic hooks preserved original results and recorded callback stages
and numeric status codes, without recording credentials or tokens.
