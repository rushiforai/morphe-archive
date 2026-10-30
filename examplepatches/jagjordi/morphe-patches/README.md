# jagjordi Patches

Patches for use with Morphe. The bundle contains four Flightradar24 patches, one CalTopo
patch and one universal patch.

## About

### Unlock Business Premium

Derived from the "Unlock Business Premium" patch in
[rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) (GPLv3) with one
change: the app's "is free user" helper is forced to false, so the unlock also applies when no
Flightradar24 account is logged in. Upstream, that helper returned true for a missing login
before the patched tier logic ran, which left the promo popups and the aircraft detail locks in
place for logged-out users.

### Open data for premium fields

The Flightradar24 server withholds several aircraft panel values from non-subscribers, so a
client unlock alone leaves them empty. This patch fills them from open sources and never
replaces a value the server did send:

- Extended Mode S rows (indicated and true airspeed, Mach, outside air temperature, GPS
  altitude, wind), squawk and vertical speed come from the
  [adsb.lol](https://api.adsb.lol) public API, with
  [opendata.adsb.fi](https://opendata.adsb.fi) as a fallback. Both aggregate the same ADS-B
  broadcasts Flightradar24 receives. Results are cached for 30 seconds per aircraft and
  requests are spaced at least one second apart to respect adsb.lol's rate limit.
- Serial number (MSN) and aircraft age come from the
  [OpenSky Network aircraft database](https://opensky-network.org/datasets/metadata/aircraftDatabase.csv),
  with build years from [tar1090-db](https://github.com/wiedehopf/tar1090-db). Coverage is
  about 85 percent for serial numbers and lower for build dates; recent deliveries can be
  missing, in which case the row stays N/A.
- Country of registration is derived from the ICAO 24-bit address block of the transponder.
- The flight information region row uses the
  [VATSpy Data Project](https://github.com/vatsimnetwork/vatspy-data-project) boundaries and a
  point-in-polygon lookup on the device.

The aircraft table (about 15 MB compressed), the FIR boundaries and the country block table
are downloaded once a month from the `open-data` prerelease of this repository and stored in
the app's private files directory. The bundle is rebuilt weekly by the "Open data bundle"
workflow from `open-data/build_data.py`.

### Open weather radar

The app draws weather layers from a commercial tile provider using credentials that
Flightradar24 only issues to subscribers, so the layers stay blank after a client unlock. This
patch serves the precipitation radar layers (global, North American and Australian) from
[RainViewer](https://www.rainviewer.com/api.html)'s public radar tiles whenever the app has
no weather credentials. RainViewer's free tier is for personal use. Satellite cloud, forecast
wind, icing, turbulence, significant weather and lightning have no free tile source and are
left unchanged.

### Unlock Desktop features

CalTopo renders its map UI in a WebView served by a request handler embedded in the app, and
every client enforced gate reads the account tier from one place: the feature group resolved
for the signed in account. That id normally comes from the server or is derived from the
subscription plan, and a missing account resolves to the free tier. The patch resolves the
account to the Desktop tier on the device, which enables offline layer downloads for every
tier, the 3D view, travel plan statistics, custom icons, parcel measurement and elevation in
exports. It works with or without a signed in account. Tiles for the restricted layers
(MapBox Satellite, Sentinel, MODIS, GOES, parcels, weather stations, aircraft) and the
packaged offline downloads are produced by caltopo.com, which applies its own account check
to signed requests, so those remain subject to the server.

### Bookmarks without account

Flightradar24 keeps bookmarks on its server and signs every bookmark request with the
account's login token, so the stock app refuses to bookmark anything until an account is
created. This patch keeps the bookmarks on the device when no account is signed in: the
bookmark star on the flight and airport panels, the Bookmarks tab of the pull down menu,
and the add, edit and sort screens all work as with an account. Bookmarked aircraft and
flights are looked up on the public Flightradar24 search endpoint on every refresh, which
provides the current flight, callsign, aircraft type and route while the aircraft is
flying; airport names, codes and time zones come from the airport list the app downloads.
Arrival times are not available without the server. With an account signed in the server
bookmarks are used as before, and bookmarks saved while logged out stay on the device.

### Bypass private DNS

Universal patch. It installs a DNS-over-HTTPS resolver into every OkHttp client the app
creates, querying a public resolver directly by IP address (Google or Cloudflare), so
hostnames that the phone's private DNS blocks still resolve. It was written for Komoot, whose
map tiles come from a host that ad-blocking DNS services refuse, but it applies to any app that
bundles OkHttp with its class names intact. If the resolver returns nothing, the system
resolver is used as a fallback.

### Options

`mapsApiKey` (Unlock Business Premium, optional): a Google Maps Android API key injected into
the app manifest. Only set it if the map renders blank after patching. Left empty, the
original key is kept.

`openDataBaseUrl` (Open data for premium fields): base URL serving `aircraft.db.gz`,
`firs.json.gz` and `countries.json`. Defaults to the `open-data` prerelease of this repository.

`adsbApiUrl` (Open data for premium fields): base URL of a readsb style v2 API, queried as
`<url><hex>`. Defaults to api.adsb.lol.

`radarIndexUrl` (Open weather radar): RainViewer weather maps index.

`featureGroupId` (Unlock Desktop features): CalTopo feature group id to resolve the account
to. Defaults to `desktop`, the highest personal tier; `pro`, `mobile` and `team-small` are
offered as alternatives.

`dohServer` (Bypass private DNS): IP address of the DNS-over-HTTPS resolver. Defaults to
8.8.8.8, with 8.8.4.4, 1.1.1.1 and 1.0.0.1 offered as alternatives.

### How to use these patches

Add this source in Morphe Manager: https://morphe.software/add-source?github=jagjordi/morphe-patches

Automated builds for a non-rooted device are published by
[ShrirajHegde/Morphe-Builds](https://github.com/ShrirajHegde/Morphe-Builds).

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.28.0](https://github.com/jagjordi/morphe-patches/releases/tag/v1.28.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Flightradar24&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 11.12.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bookmarks without account](#bookmarks-without-account) | Stores bookmarks on the device when no Flightradar24 account is signed in, so aircraft, flights, airports and locations can be bookmarked without creating an account. Flight details for bookmarked aircraft and flights come from the public Flightradar24 search endpoint. With an account signed in the server bookmarks are used as before. |  |
| [Open data for premium fields](#open-data-for-premium-fields) | Fills the aircraft panel fields that the Flightradar24 server withholds from non-subscribers using open data: extended Mode S values (IAS, TAS, Mach, outside air temperature, GPS altitude and wind) from the adsb.lol and adsb.fi public APIs, serial number and aircraft age from the OpenSky Network aircraft database, and the flight information region from VATSpy boundaries. The aircraft and FIR data are downloaded once a month from a GitHub release. Values the server does send are never replaced. | • Open data bundle URL<br>• ADS-B aggregator URL |
| [Open weather radar](#open-weather-radar) | Draws the precipitation radar layers (global, North American and Australian) from RainViewer's public radar tiles when Flightradar24 does not issue weather credentials to the account. Layers that have no open source (satellite cloud, forecast wind, icing, turbulence and lightning) are left as they are. | • Radar index URL |
| [Unlock Business Premium](#unlock-business-premium) | Unlocks Business-tier features in Flightradar24: ad-free experience, weather layers, ATC routes, 3D view, flight history playback, unlimited saved locations and the country of registration. Works with or without a Flightradar24 account. Serial number and aircraft age stay locked because the server never sends them to non-subscribers. | • Google Maps API key |

</details>

<details open>
<summary>📦 CalTopo&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.30.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Desktop features](#unlock-desktop-features) | Resolves the CalTopo account to the Desktop feature tier on the device, which enables the client gated features: offline layer downloads for every tier, the 3D view, travel plan statistics, custom icons, parcel measurement and elevation in exports. Works with or without a signed in account. Restricted layer tiles and packaged offline downloads are still produced by the CalTopo server, which applies its own account check. | • Feature tier |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass private DNS](#bypass-private-dns) | Resolves the app's OkHttp requests with DNS over HTTPS sent directly to a public resolver by IP address, so hosts blocked by the phone's private DNS (for example map tile servers on an ad-blocking resolver) still load. Applies to any app that bundles OkHttp with its class names intact. | • DNS over HTTPS resolver |

</details>

<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid` with `GITHUB_ACTOR` and `GITHUB_TOKEN` set so Gradle can read the
  Morphe package registry.
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`.
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.
- Rebuild the open data bundle with `python3 open-data/build_data.py --out-dir dist --cache-dir cache`.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

jagjordi Patches are licensed under the [GNU General Public License v3.0](LICENSE).
