# Raid for JUDU

Morphe patch that brings raid.lt ticket inspector reports into the JUDU app.

[Add to Morphe](https://morphe.software/add-source?github=Vakarux12/raid-judu-patches)

Morphe can't find JUDU on its download sites and only offers a Google search. Get the 1.6.0 XAPK from
[APKPure](https://apkpure.com/judu/com.judu/download/1.6.0) instead, the arm64-v8a variant for any recent phone,
and pick that file in Morphe. The installed app does not work, Morphe only gets its base apk without the map code.

Reports show on JUDU's own map as red dots labelled with the report time, from zoom 11 in.
JUDU's map is Dart (flutter_map_vector_tiles), so the patch points the style url in libapp.so at a small
server inside the app. It serves JUDU's style plus a raid layer, and builds the raid vector tiles from raid.lt.
The dots are fetched each time the map loads its style, a map left open does not pick up new reports.

On top of the map there is a pill with the count of active reports in your city and the nearest one, red when one is
within 1 km, live every minute. Tap it for the full list sorted by distance, drag it anywhere, the spot is remembered.
It hides on screens without a map. To tell, the patch switches on Flutter's accessibility tree and looks for the
map's location button in it.

Open a stop in JUDU and if raid.lt has a report there, the pill turns red and names it until you leave the stop. Tap it, or a
report in the list, for the report the way raid.lt shows it, who voted stovi or nestovi and when, then the comments
with their photos. The patch knows which stop is open because JUDU's departures now pass through the same small
server on their way to stops.lt, raid.lt reports carry the same stops.lt stop id.

Also spoofs JUDU's Play signing cert in-app for its Google keys. Google sign-in still won't work on a re-signed build, use email login.

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Vakarux12/raid-judu-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 JUDU&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [raid.lt inspectors](#raid-lt-inspectors) | Puts raid.lt ticket inspector reports on the JUDU map and its stops, with a counter on top. Tap it for the reports with their votes and comments. |  |

</details>

<!-- PATCHES_END -->

## Building

    echo "sdk.dir=$HOME/Android/Sdk" > local.properties
    GITHUB_ACTOR=Vakarux12 GITHUB_TOKEN=$(gh auth token) ./gradlew buildAndroid
    java21 -jar morphe-cli.jar patch -p patches/build/libs/patches-*.mpp -o judu-raid.apk com.judu.xapk

## License

GPLv3
