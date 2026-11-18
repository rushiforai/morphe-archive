# Maps 26.44 warning voice port

## Problem and scope

GitLab main skips warning-voice binding for Maps 26.44.06.1006895251. The
receiver can display provider data, but its guidance coordinator retains the
previous application's component accessor and native speech types. It cannot
reserve a native guidance gap for a warning. The feature branch ports that
existing path; it does not change the approved pills or provider eligibility.

The independent car-startup corrections were built and checked against the
original APK at `3ec81c9a4f93a4da77e20f83e20ab86b87e6506b`. Their signed local
review bundle is `1.53.4+review.3ec81c9a4f93`, SHA-256
`131112db70858c08392e5424884fdb2c03d87d72e9675fdd5f6cd572eb640c46`.
It is copied to phone Downloads but is not installed: phone inputs stopped
when another editing session became active. No head-unit retry has run.

## Shipped-code bindings

The supplied original 26.44 base DEX is unchanged in the native Morphe-merged
input, SHA-256 `3ec1854b5c90d1d949c1be6e7a6ac488384d99149f3c25b29c9c025113dbee61`.
The merged archive is a derived input, not an independently Google-signed APK.
Original archive/base signer receipts are retained privately.

| Boundary | Reviewed 26.44 contract |
| --- | --- |
| Application component | Inherited `nsm.rS()` delegates to `nsn.n()` / `cqwl.rS()` and returns the cached `njz`. Never call the protected `e()` factory. |
| Speech queue provider | `njz.jd()` assigns factory selector472 to `hU:cqya`; `njy.i()` constructs `bmxs`. |
| Native gap | `bmxs.j` is the serial executor; `p` and `q` hold active/pending `bnad` jobs. |
| Native output mode | `bmxs.f:bmzi`; `bmzi.c():bnbf` retains UNMUTED/MINIMAL/MUTED. Native eligibility remains unchanged. |
| Prepared callback | `bmyo.b(Object)`, selector2. Job is `callback.a` → `bmzy.a`; player is `callback.b`. Other selectors retain their original paths. |
| Final dispatch | Instruction366 / code-unit741 invokes `bnau.d(bnas)` with `{v1,v3}`. The preceding `bnad.w:bnas` load supplies job `v0`, so the fence receives `{v0,v1,v3}`. |
| Focus request | `bmyh.g(bnbc,int)`, instruction59 / code-unit117, retains the original AudioManager result and exception. |
| Native completion | `bmzz.a(bnau)` observes resource release before original queue completion. Cancellation retains `bnad.s`, player `l()` and job `e(bnau)`. |
| Current route | Guard `bmon` fields directly: `c:bmnv`, `e:blvb`, `o:ycx`; use native `u(ycx)` regeneration and `v()` teardown. |
| Directed geometry | `blvb.b:ycj` → `ycj.k:bjpp`; `g()` point count, `n(int):bjpk`, latitude `b()`, longitude `d()`. |

Player release categories remain MediaPlayer `bmzd`, leaf wrapper `bnam`,
composite `bmza`, silence timer `bmzb`, no-op `bnah`, and haptic/wearable `bnaq`.
The direct player-interface inventory found no additional category. Unknown
players still fail closed. Native haptic/sentinel behavior is not cancelled by
the ordinary release observer.

The port pins51 original method bodies:46 reviewed native speech/route methods
plus five component/provider accessors and factories. Field types and the
concrete application hierarchy are checked separately. The old original-input
unit test still expected42 despite46 stored contracts; its expected coverage
is updated with the current port. Exact register, instruction, access-flag and
body hashes come from the original DEX before patching.

## Preserved behavior

Ordinary warnings wait for a real native gap; urgent preemption still requires
a regenerable current route. No hold extends the warning's source deadline.
An asynchronous prepared player reaching a reserved hold is released before
the original never-played completion path advances the native queue. Genuine
unheld dispatch, callbacks, exceptions, mute policy and source warning authority
remain native. Regeneration reads the current step rather than replaying a
captured instruction. Directed route relevance is restored through the current
native geometry, not a synthetic route.

## Evidence and remaining gates

Private compact static evidence is under `.analysis/maps-voice-queue-130`,
`.analysis/maps-voice-players-131`, `.analysis/maps-voice-di-132` and
`.analysis/maps-voice-port-133`. These are shipped-artifact observations, not
runtime speech proof. Representative REA method evidence:
`ev_3a9f36f0de2ecd932b719c3df7d5fa02ffe8858ba272f9ce49c4801c38ec3c84`
(prepared dispatch),
`ev_6ac6fa95763410e4145db01048942139abb45f3a1ffb7df3a9e5420a28f9d187`
(native mode), and
`ev_5408e8796390120fb44c2e8eb906b5f760002c42abb91b9980fade3f1fcda388`
(current-step regeneration). The compact records retain the original hashes.

Required checkpoint: current original-APK speech and system-TTS unit gates,
canonical Android/Python checks, actual Morphe patch application and emitted
DEX inspection, signed bundle verification and terminal storage cleanup. Reuse
unchanged release-policy, Medium, documentation and approved design evidence.
No phone/emulator acceptance is implied by passing these offline gates.

Still required after installation: real AA/DHU startup and rendering at1280×480,
genuine provider warning speech and source timing during GPS-only playback,
route relevance and zone lifecycle, other aspect ratios, input/scrolling and
reconnect. Keep the full active acceptance objective open until those outcomes
have current screenshots/logs and the exercised packages are identified.
