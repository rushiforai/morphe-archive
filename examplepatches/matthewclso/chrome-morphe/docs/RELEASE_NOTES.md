Chrome Morphe 0.5.1 for Chrome 153.0.8010.53 (801005304), ARM64.

- Fix the crash when sharing a page. Black mode no longer substitutes Drawable calls for Android Icon calls.
- Center the tab name and X on the same horizontal centerline, keeping the original glyph and font sizes.
- Fix stale or missing tab favicons after navigation, delayed icon updates and tab restoration. Use Chrome’s local favicon database and native URL/profile checks.
- Bring the selected tab into view after returning from address entry.
- Remove the divider that reappeared during long-press menus. Preserve native toolbar capture and scrolling behavior.
- Keep the address bar black while scrolling, including its composited background and address field.

In Morphe Manager, select **Chrome customization**. Keep **MicroG sign-in** and **Android autofill** selected if you already use them, and use the same signing key when updating. The picker remains optional under **Chrome Settings → Morphe settings → Tab picker** and requires **True bottom address bar**.

Device acceptance is limited to Galaxy S26 / Android 16 / 4 KB pages. Releases contain patches, not Chrome or MicroG APKs. See docs/TESTING.md for device results and repeatable fixtures.
