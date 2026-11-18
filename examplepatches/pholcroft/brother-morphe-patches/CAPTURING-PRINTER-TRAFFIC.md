# Help improve printer support with PCAPdroid

If you have a different Brother printer—especially one with features such as extra trays, finishing options or other capabilities—a capture of its print-service traffic can help show what the service asks and what the printer returns. A comparison with the cache enabled can also help identify what the patch does and doesn't speed up.

You can contribute a capture from the original service, the patched service, or both. **Please use your own printer and network, and review the privacy section before sharing anything.** No physical print is needed for the basic preview test.

## Alternative: record diagnostics in the patched app

The patch includes a lightweight recorder. Open Android printing settings → Brother Print Service Plugin → **Manage saved printer data → Diagnostics**. Start recording, open a print preview, then return to stop recording. Refresh the list to inspect recent events, and use **Export CSV** to choose where to save the recording. The sharing help explains the next steps; it doesn't upload anything for you.

The recorder shows supported individual SNMP GETs handled by the patch, their results and response values, source (cache or printer), and elapsed hook time. It does not cover discovery broadcasts, other protocols, all failures, print jobs or the original unpatched app. Data is kept in memory until the app process exits, with a 2,000-event limit. A CSV can include printer IP addresses, identifiers and responses; Base64 byte strings are not encrypted. Review it before sharing. For traffic outside the recorder's coverage, follow the PCAPdroid steps below.

Clearing saved printer data does not clear the diagnostic recording, and freshly received replies can be cached immediately if caching is enabled. For an uncached comparison, clear the diagnostic recording, switch the cache off in the main settings, then record a fresh preview.

The saved-data screen shows the latest observed activity burst, an estimate of uncached request time, and estimated request time avoided. The CSV includes the same measurement components. A burst ends after three seconds without an observed individual GET. Background activity may be recorded, and one preview can contain multiple bursts. The estimates add request durations and do not represent elapsed preview time; requests may overlap, response times vary, and cache overhead is ignored. Clearing the saved printer data also clears its timing information.

## What you'll need

- An Android phone or tablet connected to the same network as the printer.
- Brother Print Service Plugin and a harmless test document, such as a blank page with the words “print test”.
- [PCAPdroid](https://github.com/emanuele-f/PCAPdroid), an Android network capture app. Its [quick-start guide](https://emanuele-f.github.io/PCAPdroid/quick_start.html) has screenshots if its layout has changed.
- Optionally, the Morphe-patched service for a before-and-after comparison.

PCAPdroid's normal capture uses Android's local VPN facility and doesn't require root. You may need to disconnect another VPN while recording. The SNMP communication observed in the original investigation was not TLS-encrypted, so **no TLS decryption, certificate installation, certificate-pinning bypass or decryption add-on is needed for that traffic**. Other printer models or protocols may use encryption; leave encrypted traffic as-is rather than trying to bypass protection for this guide.

## Set up the capture

1. Open PCAPdroid. On the **Status** tab, find **App Filter** and select **Brother Print Service Plugin** (`com.brother.printservice`). This limits the capture to that app's traffic; the app you print *from* may have separate traffic that won't be included.
2. In the dump/export mode selector on the same screen, choose **PCAP File**. The default **No Dump** mode only shows connections in PCAPdroid and does not save a packet capture.
3. Tap **Start** (the play button). Choose a file name and location if prompted, and accept Android's VPN confirmation. PCAPdroid will continue recording in the background.
4. Open your harmless test document and choose **Print**. If needed, select your Brother printer. Wait for the preview to appear and the available print options to finish loading. **Don't press the final Print button, Cancel, or anything else in the print screen.**
5. Switch straight back to PCAPdroid and tap **Stop**. This keeps the capture focused on loading the preview and options. Once recording has stopped, you can close the print screen. Keep or share the resulting `.pcap` file. You can also export a connections `.csv` if you find it useful, but please include the PCAP: a connection summary alone doesn't contain the same packet details and timing.

Use a short capture for one test. The app filter may exclude traffic belonging to other processes, and a VPN-mode capture only sees traffic routed through the phone; it is not a complete capture of everything on the LAN. Menu names may differ between PCAPdroid versions. See its [dump mode instructions](https://emanuele-f.github.io/PCAPdroid/dump_modes.html#23-pcap-file) for more detail.

## Useful comparison: no cache, learning and warmed cache

These separate captures are optional, but keeping them distinct makes it easier to understand what changed. Use the same phone, printer, document, network and print options where possible. Note whether the printer was asleep or awake and whether preview actually appeared.

If the cache controls aren't visible, refresh the Morphe source and repatch the original APK. You can still capture the original app's traffic without these controls.

1. **Normal requests:** With the patched service installed, open Android printing settings → Brother Print Service Plugin settings → **Faster Print Previews Mod**, and turn the cache off. Capture one preview as described above and label the file `cache-off.pcap`. This uses the patched service's normal request path; it is not necessarily identical to capturing the original unmodified app. If you're using the original app instead, label it `original.pcap`.
2. **Learning:** Turn the cache on. In **Manage saved printer data**, use the three-dot menu on the test printer and choose **Clear saved data** if you are happy to remove its saved responses. This makes the next use start without that printer's saved cache; it does not reset the printer. Capture a preview and label it `cache-learning.pcap`. The first preview may still be slow.
3. **Warm cache:** Without clearing the saved data, record another preview and label it `cache-warm.pcap`. New or unsupported requests may still go to the printer.

Clear only data you're happy to relearn. Turning the cache off does not itself delete saved responses. If comparing the original and patched apps, note that different signing keys can prevent installing one over the other; uninstalling an app may remove its settings and data. Don't uninstall anything unless you're comfortable restoring it.

For a user-visible speed comparison, an optional screen recording can show the tap on **Print** through to the completed preview. Repeat each condition a few times if practical and note which file corresponds to each run. Packet-capture duration by itself is **not** the same as time to preview.

## Review before sharing

PCAP files can contain more than they appear to in the connections list. Depending on the traffic and document, they may include printer model and serial number, MAC and IP addresses, hostnames, network details, SNMP community strings, printer status or configuration, usernames, and potentially document or print-job content. The exact contents vary. A harmless document and an app filter reduce the amount collected, but don't guarantee anonymity.

Inspect the capture yourself with a tool such as [Wireshark](https://www.wireshark.org/) if you're comfortable doing so. Remove or anonymise information you don't want public, while preserving enough packet structure and timing for analysis. Redaction can affect what can be diagnosed. **Do not upload a raw capture publicly if you aren't comfortable with everything it may contain.** A ZIP archive only packages the capture; it does not anonymise or protect it. If you're unsure, open an issue describing the printer and ask how best to share before attaching a file. Do not include passwords, SNMP community strings, private documents or certificate/decryption keys in an issue.

## Submit your findings

Open an issue in the [project's GitHub issue tracker](https://github.com/pholcroft/brother-morphe-patches/issues/new). Issues and their attachments in this public repository are publicly accessible. If you decide a capture is safe to publish, attach the PCAP; if GitHub doesn't accept that file type, put it in a ZIP and attach the ZIP instead. GitHub's [attachment guide](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/attaching-files) explains supported formats and size limits.

Please include:

- Printer model and any relevant features, such as an additional tray, duplexer, finisher or stapler.
- Phone model, Android version, Brother Print Service Plugin version and patch version; say whether the app was original or patched.
- Which files are original/cache-off, learning and warm-cache; whether the printer was awake or asleep; and what you did in each capture.
- Whether the preview loaded, roughly how long it took or a separately measured time, and any errors or missing print options.
- Any optional screenshots or screen recording, after reviewing them for personal information.

If you prefer not to share a capture publicly, a description of the model, features and observed behaviour is still useful. Please don't post sensitive data while waiting for a response.

To test a recorded burst without changing saved responses, open the saved printer card menu and select **Measure without cache**. The mod checks the printer hardware address and then replays the latest captured single-object SNMP GET requests in the order observed by the hook (which can differ from network order if requests overlap). The result shows the replay duration and offers a view of differences against cached values. Changes can include ordinary state or counters. The check and replay bypass cache learning. Requests originally configured without a timeout use a three-second timeout during replay. They include only requests observed by the cache hook, not discovery, multi-object requests or other traffic. The captured sequence and active replay are held in memory while the service process runs; if none is available or it was incomplete, open another preview first. The saved-data screen separately estimates request time avoided; that sum is not elapsed preview time.

