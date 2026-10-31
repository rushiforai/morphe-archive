# Batch Go Back in Time

Optional Curve 5.63.0 patch. Adds a Launchpad tile, native Curve selection controls, card selection, confirmation, foreground service and progress notification. Uses Curve's authenticated transaction services and its network-only eligibility query. The server-reported age limit filters the list; server eligibility remains authoritative.

The Batch GBIT tile sits immediately before Patches and uses a dedicated transparent icon: stacked payment cards with a red rewind arrow. The asset is bundled only when Batch Go Back in Time is included. Repeated list updates keep a single Batch GBIT tile and preserve the relative order of Curve's other tiles.

The purchase list uses Curve's transaction label to identify declines. A populated decline-reason field alone does not indicate a declined purchase. Zero-value card verifications are excluded before checking the plan window or destination cards.

Every charge is sequential. An atomic file in noBackupFilesDir records account, destination, approved quote, transaction IDs and outcomes before submitting a request. A failed/uncertain mutation pauses the queue. Refresh reconciles successful server moves; unresolved outcomes cannot be retried. Closing the screen does not stop the service. Stop prevents the next submission. Process death, logout, account changes and changed quotes require review. No boot restart or automatic retry.

The notification opens its saved batch directly in the private results activity, protected by Curve's application-wide passcode lifecycle and account checks. Merchant, amount and card details are omitted from notifications. The latest result stays available until a new batch replaces it; an old notification cannot open a different batch.

After completion, leaving the screen and opening Batch GBIT from Launchpad starts a fresh purchase-selection flow. The notification still opens the saved result. Unfinished or uncertain work always reopens for review. Another signed-in account may replace a completed or archived journal without seeing its contents; unfinished or uncertain work still requires the owning account's review. Progress updates retain result rows; completed results stop automatic polling and revalidate the account when reopened. Leaving the selection screen interrupts its eligibility scan and prevents further requests; an already-dispatched native request may still finish.

The card selector uses Curve's native snapping helper and card view. Pages have bounded widths, centre on release, and use the same saved image URLs as Wallet through Curve's image loader. Scrolling clears the destination until the next card settles, so the approval button always matches the centred card and its quote. AndroidX RecyclerView 1.4.0 is compile-only because Curve already ships it.

When the patch is included in Morphe, Patches shows a **Batch Go Back in Time** switch, enabled by default. Save and reopen applies the switch atomically with the other settings. Turning it off removes the Launchpad entry and blocks new batches; an already approved batch continues, and notifications still open saved progress/results. Stop and outcome reconciliation remain available. The tile checklist and reset control sit behind the collapsible **Choose tiles to hide** button; opening or closing it does not save settings.

The service holds a partial wake lock while executing, with a 30-minute upper bound. It stops starting purchases when that bound expires and releases the lock on completion or shutdown. A request already submitted at expiry still requires outcome review. The native Curve date parser handles the REST API's UTC transaction timestamps. See [native regression checks](../tests/batch-gbit-native/README.md) and [offline queue checks](../tests/batch-gbit/README.md).

Never run financial tests against an account without explicit user authorization. Offline checks must cover partial success, changed quotes, interruption and duplicate starts. Visual and bridge checks use only the dedicated signed-out morphe_sample_api36 emulator. Build success alone does not prove live GBIT or background reliability.
