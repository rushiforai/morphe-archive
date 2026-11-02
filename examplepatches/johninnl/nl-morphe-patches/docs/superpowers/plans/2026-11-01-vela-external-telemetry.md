# Vela native telemetry integration through Morphe

**Goal:** Add persistent De-Waze/Flitsmeister provider settings and native speed/limit/average-zone/advance road-warning UI on Vela phone and Android Auto, preserving native fallback and conditional Flock behavior.

**Delivery:** Extend the Morphe patch bundle. The supplied APK is the mutation target; Vela source tag v0.5.2621 (94a83b86) is read-only reference. Specs: docs/superpowers/specs/2026-11-01-vela-external-telemetry.md. Work in the isolated vela-telemetry checkout, not the dirty repository root or the Vela checkout.

## Tasks and verification

- [x] Identify supplied artifact/package/certificate and exact source tag. Record input hashes in ignored .analysis/inputs.json; decompile actual APK separately from source reference.
- [x] Implement and test Android-free peer telemetry parser/state: selected provider, independent field/session/sequence ages, strict valid/unknown/stale handling, native fallback, Flock suspension while either provider advertises fresh usable data. Test stationary zero, source switching, disconnect, malformed/replayed data and heartbeat freshness before Android adapters.
- [x] Extend shared broadcasts/providers with upcoming average-zone and road-alert data (camera, police/mobile, crash/hazard/closure/jam and Flock where advertised). Use native repositories/candidate reports; preserve old actions/fields. Test active/approach separation and original TTL semantics. Waze alerter repository and FM AppNotificationBus are background producers.
- [x] Add Vela receiver/controller with authenticated sender checks where framework supports them, preferences, snapshot requests, reactive native Compose state and voice binding. No network requests or alternate GPS location source.
- [x] Bind native phone settings helpers and speed card. Add native selectable/toggle rows and source status. Override only displayed/current warning speed and limit. Extend the speed card with native labels/progress/advance warnings. Respect Vela styles/units/voice options. No floating companion overlay.
- [x] Bind native Android Auto settings and drawing surface. Add a native provider sub-screen to avoid overflowing the existing settings list. Feed current/max speed and draw zone/warning information inside the host safe area, in both active navigation and drive mode. Validate actual template and renderer behavior.
- [x] Add guarded Morphe APK compatibility/resource/native DEX patch, original-input constraints and exact JNI/Compose bindings. Avoid adding calls/parameters to MapScreen; typed reactive-state field substitutions can preserve its instruction count. Do not package copies of host Compose, Kotlin or car runtime classes.
- [ ] Validate pure model and extension tests, exact original/patched DEX contracts, full supplied APK application/rebuild and ART startup. Use actual provider APK broadcasts and mock drive on owned emulator for phone and Android Auto surfaces. Capture day/night, metric/imperial, source selection/fallback, both-provider Flock suppression/restoration and pre-warning timing. Physical driving remains separately reported.
- [ ] Add bilingual app docs, contract/limitations and reproducible native probe/check artifacts. Review changes, publish dev and verify its signed bundle; promote authorized completed patches to main without disturbing unrelated root work. Automated release owns versions and generated catalogs.

## Established native bindings (actual 0.5.2621 artifact; verify exact DEX before mutation)

- App init: Lapp/vela/VelaApp;->onCreate()V.
- Phone speed card: Lq72;->x0(Ljava/lang/Float;Ljava/lang/Double;ZLlg2;Le50;I)V. Original f is m/s, Double limit km/h. Observe host Snapshot state after Composer restart-group entry; substitute scalar inputs there. Child content class s42 (lambda) contains current/max row and unit labels. Work through child card, not MapScreen.
- Navigation settings content: Loi;->a(Object,Object,Object)Object, discriminator 5, anchored by settings_speed_display resource followed by c54.a and ez3.i. Inject only in that native settings branch, inside its existing SettingsGroup.
- Native settings helpers: Lez3;->e(String,Le50;,I)V title; f(String,Z,Lr11;,Llg2;,Le50;,I,I)V selectable row; i(String,Z,Function1,String,Llg2;,Lu11;,Le50;,I,I)V toggle; c(String,Le50;,I)V hint; b(I,Le50;)V divider. r11.invoke() is Function0; kotlin.jvm.functions.Function1.invoke(Object) retained. Unit singleton Ler4;->a.
- Native mutable Snapshot state: Lu13;(Object,Lu34;), getValue()/setValue(Object); Lfe2;->O(Object,Lu34;)Lu13;, structural policy Lba4;->g. Use host state so updates invalidate native composition without bundling Compose.
- Flock map state: Lpw0;->a:Lu13; (pref flock_cameras_on). Route alert state Ltw0;->a:Lu13; (flock_route_alert_on). Data store Lqw0; queries a(List,D)List and bounding-box query, plus refresh coroutine. Preserve saved prefs and settings display; apply transient effective state only to runtime consumers. Exclude app initialization and holder setters from substitutions.
- Car renderer: Lcw; implements SurfaceCallback. g(Canvas)V draws speed; q:D is speed m/s, r:Double is limit km/h; u()Rect is safeArea; h/i are surface dimensions; a is CarContext. Native draw code failed normal JADX, use direct DEX/smali/simple mode before editing.
- Car settings: Lhw;->k()Lse4; builds ListTemplate; list builder Lji1; has ArrayList a, a()ItemList. Screen base Lnt3; holds f:CarContext (Landroidx/car/app/i;), j() invalidates, i() returns ScreenManager (Lpt3;), manager c(Lnt3;) pushes a screen. Generate a tiny subclass for the provider settings page, delegating template creation to extension helper.
- Native car row builder Lmq3;: c(String) title, a(CharSequence) subtitle, b()Row, f:OnClickListener, e:Toggle, h:browsable. Template builder Lqv1; uses d:CarText,e:Action,b:ItemList,c:sections,a()ListTemplate.
- Voice guide Lwy4; constructor(Context), j(String,Z,Z)V is speak(text,interrupt,ignoreMute). Field n is muted. Bind actual instance; use native speak with ignoreMute=false and preserve native opt-in/mute controls.

## Reference files

Actual JADX: repository-root .analysis/vela-telemetry/jadx/sources. Source reference: this checkout .analysis/vela-source (exported exact tag). FM actual source: repository-root .analysis/flitsmeister-broadcasts/jadx/sources; Waze bridge/native protocol: this checkout extensions/waze and support/navigation. Provided shorter APKM filenames hash-identical to earlier researched packages.

## Validation status

See `docs/vela/validation.json` for completed emulator/native-callback checks and explicit physical-host/steady-Waze-fixture limits. Current phone and car/media captures use native rendering. Release publication remains pending until dev and main artifacts are verified.
