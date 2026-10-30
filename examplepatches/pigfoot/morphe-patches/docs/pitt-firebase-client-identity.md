# PiTT Firebase Auth Android-client identity

## Observed cause

During the sign-in investigation, the Firebase stage reported an Android-client
restriction (`ANDROID_CLIENT_BLOCKED`) after the MicroG Google account-selection
flow. This differs from both Google's earlier status 10 and PiTT sponsored expiry.
The developer's console allowlists are not available for inspection.

The original Auth transport `zzacv.zza(URLConnection)` sends `X-Android-Package`
from `zzado.zzb()` and `X-Android-Cert` from `zzado.zza()`. The producer derives
these from the installed package and signing certificate. Re-signing preserves
PiTT's package/Firebase configuration but changes that certificate. MicroG's
identity metadata affects its own Google authorization request, not this separate
Firebase SDK HTTP request. Installations/Remote Config sites are different code.

## Scoped correction

The existing Google sign-in adapter pins both the Auth transport and producer.
Immediately before the unique `X-Android-Cert` setRequestProperty call, insert
one constant for the original app certificate SHA-1 in the existing value register,
using the original SDK's uppercase hex representation. The next header overwrites
that register as before. Android's actual installed signer remains unchanged.

Keep all original getters/instructions, the package header, API key, original
client audience, request URL/body, TLS, App Check and real token validation. Do
not change Remote Config, Installations, push or global package/signature APIs.
The header correction itself adds no method/register/class/helper or separate
patch option; dependency guidance is a separate helper on the explicit click path.
The user reported successful login after this correction, then requested closeout.

## Regression guards

Reject wrong owner, missing/duplicate header, mismatched getter/call/register shape,
wrong register lifetime, existing override/reapplication and missing/modified
pinned classes. Check everything before attaching a changed method. Independently
remove only the added constant to recover the original complete method graph,
including branches and exception handlers. Retain tests for nearby headers,
malformed sites, repeated application and unrelated clients.

The temporary error classifier used to identify the rejection is no longer shipped;
the header correction remains. Real Google/Firebase/PiTT authentication is not
replaced by a fixed success result. For the maintained installation and selection
rules, see the [PiTT contract](pitt-implementation.md).

## Google-account workflow follow-up

The maintained user-facing policy is **PiTT Google account sign-in**, selected by
default but optional and independent of local sponsored features. Its explicit
login-click MicroG guidance does not change this Firebase correction, the
original Google audience or real token verification. This compatibility/usability
follow-up is a patch-release correction to v0.4.0; no Firebase project, API key or
backend migration is involved. See the [adapter contract](pitt-gmscore-study.md)
for provider reuse and installation guidance.
