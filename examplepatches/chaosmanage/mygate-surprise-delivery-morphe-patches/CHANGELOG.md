## v1.3.2 — 2026-11-23

- For `UnknownHostException` resolving `ack.mygate.in`, try two IP addresses verified as serving that same MyGate hostname through HTTPS.
- Use Android system DNS first; the static IPs are only a fallback and can become stale.
- Preserve normal TLS hostname and certificate verification; no extra DNS provider, proxy, or relay.
- One tap still starts a separate approval request; rapid taps remain queued.
- This is a transport fallback, not a guarantee of server approval.

## v1.3.1 — 2026-11-23

- Fix Android Manager reporting 0 patches: include the patch implementation as `classes.dex` in released `.mpp`.
- Add automated validation to catch Android bundles missing patch code.
- Retain one separate approval attempt per widget tap.

## v1.3.0 — 2026-11-23

- Every tap now represents a distinct approval request, including rapid taps.
- Queue taps received while another request is in flight, and submit them in order after each response.
- Do not impose an active-approval cooldown.
- This does not override MyGate backend rejection or guarantee a successful response to a second request.

