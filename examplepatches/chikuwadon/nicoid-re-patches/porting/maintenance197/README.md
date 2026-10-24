The canonical implementations are shipped in `porting/helpers-v1.9.3.zip` and
`patches/src/main/resources/nicoid/helpers.mpe`. Gradle uses the reviewed
snapshot for these helper families. This directory retains the maintenance Java
source for the updated portrait timeline and Cast session controls.

The portrait timeline inherits the native controller's auto-hide visibility.
The always-visible preference still detaches it from that container. Original
layout parameters are retained for restoration and landscape transitions.

Cast controls reuse the sender's existing comment results and service commands.
Both comment double-tap paths and comment following use the Cast clock while
viewing the current Cast video. They retain their original local-player path
otherwise. Fixed Cast quality is optional and requests one video/audio pair
from session creation; automatic mode retains adaptive variants. The chosen
resolution is a ceiling over formats available to the current account/video.
No extra comment fetches, receiver reload loop, or polling timer is introduced.

`porting/tests/issues218/rebuild.py` reconstructs this change over the published
v1.9.7 bundle using ECJ, D8, baksmali and smali, plus compile JARs extracted from
an applied APK. `--tools` supplies these tools and the API 36 android-all JAR;
`--java` points to Java 21. `--base`, `--applied-dir`, `--work`, and `--output`
select inputs and output. This does not change the version or publish anything.

`porting/tests/issues218/run.py` runs the new tests on Android API 28, 34, and 36
using Robolectric 4.17 dependencies (`--deps`) and offline platform JARs in
`--tools`. Pass `--applied-dir`, `--apk`, `--work`, and optionally `--java`.
The classes under test must be extracted from the APK after applying the MPP.
`verify_payload.py` checks unchanged resources and native payload hook wiring.
A successful host test does not establish physical phone/TV playback behavior.
