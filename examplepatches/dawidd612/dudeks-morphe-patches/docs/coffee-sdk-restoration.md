# Coffee Singular network callback

Coffee 1.24.0 (1397) contains Singular 12.6.1, identified by its original
`Constants.<clinit>` values `Singular/v12.6.1` and
`Singular/SDK-v12.6.1.PROD`. On 2026-09-30 the published 1.33.0 build reached
gameplay on a clean Android 15 emulator but crashed on two subsequent launches.
Both native traces point at `libpairipcore.so+0x32b58`; the Java caller is
`BroadcastReceivers$NetworkChange.onReceive`, through `VMRunner.invoke`.
The emulator's ARM translation layer aborted with `Cannot process signal 11`.
This is separate from Manager's input ZIP/space errors.

The replacement restores this one callback from the same SDK version. It logs
the action, checks actual connectivity, and schedules the existing SDK worker
when connected. That original worker calls `ApiManager.wakeUp()`. The game's
receiver constructor, instance state and worker remain intact. Authentication,
billing and save handling are not replaced by this callback.

## Source and regeneration

The [vendor's integration documentation](https://support.singular.net/hc/en-us/articles/360037581952-Android-SDK-Basic-Integration)
identifies its Maven repository. The exact source is
`https://maven.singular.net/com/singular/sdk/singular_sdk/12.6.1/singular_sdk-12.6.1.aar`.

- AAR SHA-256: `9e40dd56fdb042ccb606ace1d4023fcb602fffab3f4710ee05aa0a510af11fcb`
- Embedded classes.jar: `90a241c99b3e9970a2160ffd74e8712dcf76d0af4ae1f2bcddfc974dab50506c`
- D8 output: `7daa43df691aded2fc382e92a3bd4e2f19196f1754e3c9c87193e94fbe1e11a9`

Extract `classes.jar` from that AAR. Convert with Android build-tools 36.0.0 D8,
`--min-api 23 --lib <platforms/android-36/android.jar> --output <directory>`.
Run `scripts/AddCoffeeNetworkReceiver.java` with Morphe Desktop 1.17.0's all-JAR
on the Java classpath. Its three arguments are the previous `sdk-receivers.dex`
(from v1.33.0), the converted Singular `classes.dex`, and the new output path.
Only `onReceive` is added to the existing receiver resource; its final hash is
recorded in `patches/src/main/resources/coffeebusiness/1.24.0/sha256.json`.
All referenced SDK methods and fields were checked against the original Coffee
DEX before building. Runtime verification is recorded in the project context.
