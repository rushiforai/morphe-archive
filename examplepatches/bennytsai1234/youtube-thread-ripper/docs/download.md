# Multi-connection video download

Spoofed non-SABR clients (visionOS, Android VR Downgraded) make the app download `/videoplayback` byte ranges, one request per ~10 s segment. googlevideo limits each request, while concurrent requests for different parts of a range add up. The patch therefore splits a range into chunks, downloads them concurrently and delivers them strictly in order (`docs/adr/0002-split-ranges-over-the-apps-cronet.md`).

## Hook (YouTube 21.16.256)

The UMP media data source (`alai` in 21.16.256; found by strings `/videoplayback`, `ump`, `range`) wraps media3 `CronetDataSource`. Its open/read/close get a call into `ThreadRipper`; `-2` means "not handled, run the app's code". When handled, the hook still calls BaseDataSource transferInitializing/transferStarted/bytesTransferred so the app's bandwidth meter and ABR see the real transfer. Chunk requests use the app's own `CronetEngine` (HTTP/3), GET with `&range=`; the app's own requests are POST without body.

Not handled (left native): ranges below `min_split_kib`, unknown length, SABR (`sabr=1`, request bodies), live (`sq`, `live=1`), non-googlevideo hosts. If the first response is not 2xx (e.g. 403), the range goes back to the app so its own error handling runs.

## Request priority

With equal-priority chunks a slow first segment delayed startup (`docs/measurements.md`, Startup), so `Session` lowers the Cronet priority of each chunk with its distance from the read position: the chunk the player waits for goes first.
