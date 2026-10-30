# HLN 9.22.0 — independent original research

Seen: original base SHA-256 `44cf13c1b309fbeb5c67042c66cfe4c5118accbeac4f05b0999a424b1af4846f`. REA JADX 0.7.1 `inspect_android_package` evidence `ev_679d814bf9d41084dbe79b9933995e2d5462aad2d628b0f2db776432103b2f56` confirms package be.persgroep.android.news.mobilehln, version 9.22.0/versionCode 2009220000/minSdk32. APK never executed. REA package class count 28606 is its parsed inventory, not apktool's raw DEX class count. Signatures were not verified by REA.

Decode root: `build/research-20261030/decoded/be.persgroep.android.news.mobilehln`. All paths below relative to that root.

## Key previously unresolved mappings

- **Seen: Piano queued sender** `Lfef;->run()V` in smali_classes3/fef.smali:368. The runnable reads event batches and dispatches `Lfef.a(ArrayList,w07)` at 563/619. Its `Ldef` lambdas call `Lt64.b(Map)` -> Retrofit execute at def.smali:227/235 and `Lt64.a(EventDataRequest)` -> execute at336/344; t64.smali annotates cxense rep.gif/cce/push endpoints. No-op run is a concrete queue-upload boundary.
- **Seen: Piano scheduler** `Ly64;->a()V` at smali_classes3/y64.smali:117. Constructor invokes it at107; it loads `Ly64.e:Lfef` at182 and calls scheduleWithFixedDelay at190. This is the HLN replacement for AD `Lw64.a()V`. HLN `Lw64` is instead the pageview coroutine.
- **Seen: Piano pageview coroutine** `Lw64;->invokeSuspend(Object)Object` at w64.smali:107 creates PageViewEvent.Builder at144 and schedules it at232. Normal completion uses `Llbi.a` Kotlin Unit. Return that actual Unit for suppression.
- **Seen: DPG video POST** `Lu0d;->invokeSuspend(Object)Object` at u0d.smali:116 contains `/api/v1/events/video.analytics.v1` at269 and actual Unit completion at742. Return `Llbi.a`.
- **Seen: encrypted topic preferences** `Lbwd.<init>(Lro5;)V` creates `new La45(0x1d)` at bwd.smali:17-25. `La45.<init>(B)V` sparse-switch maps0x1d to lazy Lwlg path (a45.smali:169-198,256-260). It uses `Li3e(La45)` with switch index0x17 (i3e.smali:25-42); the corresponding lambda branch creates Lkaf (i3e.smali:337-358). `Lbwd.b()` loads La45.b, casts Lwlg, getValue->Lkaf, then reads USER_CHANNELS (bwd:255-290). Reuse AD helper with x35->a45,xlg->wlg,jaf->kaf and constant0x1d.
- **Seen: router physical register** static `Lr9j.b(Context,Lp9j,Intent)V` has.locals10 and 3 argument words, registerCount13. Both login invokes at r9j:334/656 use p0=v10=registerCount-3, so the AD assertion remains valid. One LoginSeductionActivity route remains at633.
- **Seen: Gemius** `Lqx2.a()V` at smali/qx2.smali:7 calls GemiusSdk.init and configures app/host/consent tracking. It is invoked by CimEventTransmitter constructor and tracking worker. `Lcom/kubusapp/analytics/cim/CimEventTransmitter;->execute(Map)V` at smali/com/kubusapp/analytics/cim/CimEventTransmitter.smali:275 constructs AudienceEvent and calls sendEvent at427. Suppress both V boundaries; VideoProduction.l three writes must also be false.

## Machine-checked contracts and shapes

- `hln-contract-observations.json`: 46/46 proposed method descriptors resolve exactly once, retaining method-body SHA-256, path and line. This proves identity and membership only, not runtime success.
- `hln-structure-observations.json`: VideoProduction.k=2 writes,l=3 writes;bj7.e=1;bwg.l=1. All three FIAM sites have one Lff6 cast and one c:boolean write.
- Topic lifecycle: OnBoardingPushNotificationActivity early k() at299; layout0x7f0d00f7 at502. Original k/l methods present.
- Region initial state: ds6.smali:984 invokes bs6 constructor using v8..v13; start+5=13 fits const/4. bs6 overload with trailing Z present. FollowablePushActivity:574 copies bs6 with v6 mask0x19 set at570.
- `hln-dto-observations.txt`: existing research dto.py rerun on current decode. 24/25 AD constructors identical; RegionPromotionTeaser needs Laee->Ldee. All48 field references pass. The known changed constructor is not a missing role.
- HLN Firebase MainApplication:3135 casts FirebaseAnalytics and3139 loads its measurement wrapper; manifest deactivated flag plus Lixj.K2 must be retained to override collection re-enable code.

## Additional privacy gaps beyond AD port

- **Seen: Amalia `/track`** `Lvz8.invokeSuspend` at smali_classes3/vz8.smali:112 posts path at240. Success is **Lk10(actual Unit)** at630-647, failures Lj10 at732-740. A raw Unit return would violate its caller contract. Lxz8.a(Lst,Lbt3) passes through this result to h0. Suppression can return a newly constructed Lk10(Llbi.a), contingent on explicit verifier/caller preservation. Existing request bases include tracker.prd.dpge.be but the exact factory's host assignment remains untraced.
- **Seen in the original / AD-style boundary:** returning an empty list from Lnq8.k alone suppresses rendered marketing output after the request. The implemented HLN controls additionally stop the request-level c/d entry points described below. Lvdh.a(ResolveRequest,Lbt3) returns inline Kotlin Result raw object at vdh:200-210; do not return Unit or an invented nullable response there. A request-level stop requires full ResolveResponse/Tracking/TemplatesResponseRaw construction and caller contract validation.
- Unknown: runtime-fetched remote flags, full premium article server response yield, actual patched network silence, audio-ad callsite, signature acceptance, user account and push behavior. No app/device runtime or install/uninstall/clear operations were performed.

## Implemented mapping and completed output verification

Implemented a dedicated patches.hln namespace with an independent exact version/build/signer guard, y64 scheduler/a45 preferences mapping, Gemius initialization/event/video stops, typed Amalia Success(Unit), request-level marketing c/d empty completions, three approved commercial cards and advertising-permission removal. Published AD sources were not changed. The original passes and all5 effects were shown RED before implementation. All five individual controls and their combined output now pass Morphe FULL, output signature and independent emitted/retained-behavior checks. The c/d candidate below is now implemented and its typed completion VM passes against actual emitted output; only device/runtime behavior remains unverified. The focused Catsure follow-up below replaces the inherited retention assumption; its narrow source delta now passes the actual tracking, consent and combined-output rechecks. No network silence claim follows from this output matrix.

## Follow-up typed-result and request-level findings

**Seen: Amalia host chain resolved.** `La09.N1` loads `La09.e:Lzs` then `Lzs.d:Lwlg` at a09:212-220 and builds `Llt` with that String at240. `Lzs.<init>` constructs its d lazy with `new Lxs(Log1,3)` at103-124. `Lxs.invoke` packed-switch3 maps pswitch_0 at333-338; that branch returns `https://tracker.prd.dpge.be` in production at163 (nonproduction tracker.npd.dpge.be at146). Vz8 uses Llt.b and path /track. Thus tracker.prd.dpge.be/track is a concrete static configuration path, effective runtime environment still unobserved.

**Seen: Amalia caller contract.** Lh0 invokes Lxz8.a(Lst,Lbt3) at6191, casts result to actual Ll10 at6211, tests Lj10/Failure at6215 and Lk10/Success at6232, then continues the ordinary event completion clock at6250. The clean no-network boundary is the higher-level **Lxz8.a(Lst,Lbt3)Object**, returning newly constructed `Lk10(Llbi.a)`; that avoids even initializing the tracker network client. This success is specifically a discarded analytics operation, not an entitlement/purchase result. Keep local player/queue and shared radio/car/account state intact. The separate Catsure response trace below establishes that the two discarded uploads can also be stopped; do not inherit the earlier AD assumption that all Catsure calls are functional.

**Seen: request-level marketing alternative.** **Lnq8.c(String,String,ContentType,String,Appearance,PreferredTemplateType,Lbt3)Object** (nq8:823) invokes Lvdh.a at1208 and returns Lnq8.k's ArrayList at1234-1252. Its only non-resume app caller **Lvj1** forwards this at421 and already returns empty Lkt5 when the feature is disabled at446. Returning a new ArrayList from c matches the existing completed empty output and prevents token lookup/network before it starts.

**Seen: different contract for Lnq8.d.** Same parameters, method d(nq8:1255) builds a cold **Lrk6 Flow**, wrapping Gj2 in Zf7 at1597-1618. The sole non-resume app caller **Lk4m** casts it to Lrk6 at2984 then calls **Lpw7.H(Lrk6,Lbt3)Object** at3000. H is first(): uses collector Fm6/AbortFlowException and throws Expected at least one element if empty. Therefore never return a List or emptyFlow from d. The mapped payload emitted through Lf5b is Lnq8.k's ArrayList. **Implemented and emitted-verified:** return `new Lq3g(new ArrayList())` from d; Lq3g is actual MutableStateFlow implementing Lrk6, constructor(Object) stores the initial non-null value, and first() immediately returns it. This typed local substitute matches the inspected sole caller and passed the actual emitted constructor/first() contract checks. Device behavior remains unverified. It does not construct ResolveResponse or mutate entitlement/auth fields. Keep k's empty output as a second boundary. Unknown: any reflective consumers not represented by static direct call search.


## Catsure queue and heartbeat follow-up

Original SHA25644cf13c1b309fbeb5c67042c66cfe4c5118accbeac4f05b0999a424b1af4846f. Static only; no app, phone or server execution. Path prefix D is build/research-20261030/decoded/be.persgroep.android.news.mobilehln. Source lines below are current apktool3.0.2 decode lines.

### Observed requests and direct response consumers

- **Heartbeat:** `Lir.a(Las2;Lbt3;)Object` (D/smali_classes3/ir.smali:29) obtains its client and executes Ler. `Ler.invokeSuspend(Object)Object` appends `/api/player/heartbeat` at er.smali:240, parses Lgs2 (CatsureHeartbeatResponse) and returns Amalia success/failure wrapper.
- **Queue:** `Lir.b(Lor;Lbt3;)Object` (ir:236) executes Lgr. `Lgr.invokeSuspend` appends `/api/queue/sync` at gr:240 and parses Lxr (AmaliaCatsureQueueSyncResponse).
- Client base: Ljs2.N1 loads Lzs.e at js2:218-226; Lzs.<init> assigns e from Lxs(environment,4) at zs:128-149. Lxs switch index4 uses its default branch and selects cat-sure.api.dpgmedia.cloud in production (xs:64-114). These are static configuration paths, not observed requests.
- Complete direct-call search finds one real caller each, both in **Lib1.invokeSuspend**. Queue case0x13 captures Lks2 and Lor, calls ir.b at ib1:3242, compares only COROUTINE_SUSPENDED, discards the result and returns actual Unit at3262. Heartbeat case0x12 captures Lxr2 and Las2, calls ir.a at3338, compares only suspension, discards the result and returns Unit at3358. fr/hr are their compiler continuation resumes, not additional application consumers. Response fields are only referenced by generated serializer/model equality/hash/toString code in this direct static search. No app-state, account, token, queue or playback mutation consumes the decoded response.

### Heartbeat boundary

**Lxr2.a(Lro;String)V** (xr2:49) checks current player/finite progress, reads Lqs.b device ID at90-109, constructs Las2 at116, creates Lib1 case0x12 at121-132 and launches it in a detached coroutine at144. It returns void with no callback/job to its callers. Actual player calls are tb1.a(Lro)V (two sites1421/2361) and kb1.invoke(Object)Object (411). Their surrounding player transition logic is independent of a return value.

A return-void prefix at xr2.a prevents payload/device-ID acquisition and detached upload while preserving caller logic. Do not remove the player/tb1/kb1 classes, shared device-ID provider, account/auth or radio APIs.

### Queue boundary and local persistence

**Ldd1.a(Lb54;)V** (dd1:155) is the actual local queue commit; the queue sync repository Lks2 has no method because its work was R8-inlined here. Do not return early from dd1.a.

1. Read local StateFlow and return immediately for the same queue (167-195).
2. Log local queue shape, then publish new queue with q3g.m at396.
3. If queue has a current item, build Catsure item list and queue sync request, fetch shared device ID at549-565, then launch detached Lib1 case0x13 at578-591.
4. At the original cond_8, read **Lb54.e:ArrayList** at597, convert editorial/manual queue entries, serialize using original Lxc1 Json and launch local persistence coroutine at1008. Its task is distinct from the Catsure task.

Implemented narrow boundary: insert a branch after the unique q3g.m publication and original currentUID/v3=3/v4=1 setup, immediately before its currentUID conditional, targeting the unique original Lb54.e persistence read. The placement retains the original local persistence coroutine selector1 and launch-default mask3. It skips only the optional Catsure block and its device-ID lookup; duplicate handling, local publication, manual-entry mapping, serialization and persistence retain their original instructions and branches. No fake network/entitlement/success response is created.

The existing original conditional already jumps directly to that persistence read when the current item is absent, which proves the local pipeline supports bypassing this block. Its coroutine launch return is unused. Remaining direct queue commit callers nd1, yc1 and il simply call dd1.a and consume no return.

### Preserve shared identity and functional operations

Lqs.b is also used outside these two analytics uploads, including **Ldr.b(String,CarAudioQueue,Lbt3)Object** (car queue flow; dr:1041). Preserve Lqs/device ID and all Ldr methods, radio/playback state and Ktor/auth header providers. No observed auth/session dependency requires the two discarded Catsure response uploads to run. This changes the earlier inherited AD assumption that all Catsure traffic must be retained; it does not prove every other Catsure/functional network route dispensable.

### Independent evidence and output validation

original-methods.json pins relevant heartbeat/local commit/response consumers/client/identity/car/persistence/queue/player methods; commit-order.json independently records the actual instruction order and unique boundaries. Original retained contracts pass and both effects were shown RED before implementation. The new verifier checks the heartbeat prefix/one queue branch, reconstructs the entire original queue graph and executes local commits for current/no-current/manual/duplicate cases, requiring no shared device-ID or detached Catsure task access and unchanged local publication/persistence. The controlled fixture established the strengthened harness, and the final actual tracking/consent/all FULL/signature/emitted rechecks now pass (`hln-catsure-validation.log`, terminal exit0). The actual emitted queue VM confirms original selector1, launchmask3, persistence-instance identity, manual-item fields and changed/unchanged/null-current behavior. The35Catsure method pins and19HLN focused tests pass. Device playback/Android Auto/background/car/server behavior remains unverified.

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-hln-validation.log`). Runtime and live-network acceptance remain unverified.
