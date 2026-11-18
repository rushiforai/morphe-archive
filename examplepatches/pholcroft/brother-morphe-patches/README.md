# Faster print previews for Brother printers

**Speed up print previews by remembering your printer's details instead of asking for them every time.** The first preview may be slower while the app learns; later previews will open much faster. No printer address or snapshot to enter.

This is an unofficial, experimental Morphe patch for **Brother Print Service Plugin 1.17.0**. It has been tested on a Google Pixel 9 with a Brother HL-L8260CDW. Other Brother printers may benefit, but have not yet been verified.

## Get started

1. In Morphe, open **Sources**, tap **+**, and add the repository URL:
   `https://github.com/pholcroft/brother-morphe-patches`

   Alternatively, open [Add this source in Morphe](https://morphe.software/add-source?github=pholcroft/brother-morphe-patches) on your Android device. Morphe will ask before adding it.
2. Select the original Brother Print Service Plugin 1.17.0 APK and apply **Faster print previews**.
3. Install the patched APK and open a print preview. Subsequent previews can reuse saved responses.

The first preview may still be slow while responses are learned. The patched APK may have a different signing key from your existing installation; replacing that installation may require uninstalling it, which can delete its settings and data. Keep a way to restore the original app.

### Try pre-release updates

Stable updates come from the `main` branch. To try future experimental builds, enable **Pre-release patches** on this source's card in Morphe. New changes are tested on `dev` before an approved stable release. If you originally added a raw URL containing `refs/heads/main`, add the repository URL above as the source instead so Morphe can switch channels. There may not always be a newer pre-release available.

## Settings

Open Android's printing settings, then Brother Print Service Plugin's settings. Under **Faster Print Previews Mod**, you can turn the cache on or off, or choose **Manage saved printer data** to clear a printer or all saved printers. Turning the cache off leaves saved data intact and uses normal requests.

On the saved-data page, the printer's reported description is shown when available, alongside its address. Use the information icon at the bottom right to read how the fix works. Open the three-dot menu to inspect activity history, measure without the cache or clear the printer’s saved data. The activity history page also lets you delete that printer’s recorded bursts and replay results while keeping its saved responses. It can export the retained activity and replay details as JSON for investigation. The export may include printer addresses, identifiers and response values; review it before sharing. It excludes SNMP community strings. **Clear all saved printers** is at the bottom of the page; clearing asks for confirmation.

Clearing removes the saved responses and communication comparison times; it does not turn the cache off. With caching enabled, live replies may be learned and reused immediately, even during the next preview. To measure a fully uncached preview, switch caching off first. Diagnostic recordings are separate: use **Clear recording** in Diagnostics to remove previous events before a comparison.

Each printer card shows the latest observed SNMP activity burst, an estimated total request time without the cache, and estimated request time avoided. Those estimates add individual request times, not elapsed preview time. Three seconds without observed requests separates bursts, so one preview or background polling may create multiple bursts. To test a burst against the printer, choose **Measure without cache** from the printer menu. The mod first checks the printer's saved hardware address, then replays the latest captured single-object SNMP GETs in the order observed by the hook and shows the time and any differences from saved responses. The check and replay do not update cached responses. The progress display counts completed requests. Replay sends them sequentially without reproducing the original gaps, so its elapsed time is a measured request replay, not a direct measurement of preview time saved. Requests that originally had no timeout use a three-second timeout during replay so an unresponsive printer cannot leave the test waiting indefinitely. Only supported GETs intercepted by the cache hook are included; discovery, multi-object requests and other protocols are not. The hook order can differ from network order when requests overlap. Activity sequences and responses are stored on the device, with up to 20 bursts per printer. Replay credentials are kept only in memory; after the service restarts, it must observe matching printer communication again before it can replay. A burst that could not be captured completely will not be replayed. Differences can include ordinary changes to status and counters; they are not all necessarily important.

If the settings controls do not appear, refresh the Morphe source and repatch the original APK. Version numbers were reset from 1.5.x to 0.2.x while the project remains experimental.

### Advanced diagnostics

Under **Manage saved printer data → Advanced: record printer requests**, you can start an optional diagnostic recording, open a preview, then return to stop recording and inspect or export the results as CSV. It shows supported single-object SNMP GETs seen by the cache hook, whether the answer came from the cache or printer, the result, response value and elapsed hook time. Byte strings use Base64, which is encoding, not encryption. Recording is off by default, held in memory until the app process exits, and limited to the most recent 2,000 events. Nothing is sent automatically.

CSV exports may contain printer IP addresses, identifiers and response data. Review them before sharing. The recorder does not capture discovery, other protocols, every failure or print-job data; hook times are not tap-to-preview timings. For full network investigation, use the [PCAPdroid guide](CAPTURING-PRINTER-TRAFFIC.md).

Each CSV row describes an individual recorded request and its burst sequence where available.

Export filenames include the local date and time. **How to share diagnostics** explains what to review and offers separate buttons for the guide and GitHub issues; it never submits a report automatically.

## How it works and limitations

The patch saves supported individual SNMP GET responses per verified printer and request context in the app's private storage and reuses them. Timeouts, unsupported response types, multi-object requests, discovery broadcasts and other traffic follow the original path. The cache can contain stale status or capability information, so the service may show incorrect paper, toner or availability information. Clear a printer's saved data to relearn it.

The cache checks a valid printer hardware (MAC) address through the service's normal SNMP requests and can carry saved responses to a new IP when the same hardware is seen there. The printer card marks an observed address change; this does not prove whether DHCP assigned it. Until an address is verified, requests go to the printer. Printers that do not provide a usable MAC through this request will use normal requests and may not benefit from caching. The identity verification is held briefly in memory and checked again when the service requests the hardware address; it is not a continuously monitored guarantee that an IP was never reassigned between checks. Cached response values have no automatic expiry.

Read the [technical analysis and packet timelines](TECHNICAL-ANALYSIS.md) for the measurements, proposed improvements and evidence limits. The public source contains no APK, packet capture, private snapshot or private printer address.

## Help improve support for more printers

Have another Brother model or one with extra features? A short recording of the print service's network traffic can help us understand its requests and improve the cache. Follow the [PCAPdroid capture and contribution guide](CAPTURING-PRINTER-TRAFFIC.md), including the privacy checks before sharing.

## Development

Build with `./gradlew buildAndroid`, Java 17+, Android SDK 36 and access to Morphe's GitHub Packages dependencies. Tests under `tests/` use simulated Brother classes and contain no proprietary APK code.

When publishing a new bundle, also run `./gradlew :patches:buildAndroid :patches:generatePatchesList` and publish the generated root `patches-list.json` alongside the matching bundle and metadata. The Morphe community index uses this file to discover the supported app and patch.

See [RELEASING.md](RELEASING.md) for the pre-release and stable publishing procedure.

Licensed under GPL-3.0; see LICENSE and NOTICE.

