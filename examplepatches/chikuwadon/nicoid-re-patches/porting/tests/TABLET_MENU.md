# Tablet landscape playback menu

The pager used to set the menu callback only when instantiating a new fragment.
An existing fragment retrieved from FragmentManager skipped that initialization.
The menu's onCreateView calls the callback's cache-state method before adding
background playback, popup playback and other buttons. A missing callback aborts
the remainder of menu creation. Rebind the current adapter callback before
attaching a restored menu. Other fragment types and newly created menus retain
their existing routes.

Local structural check after applying the patch and decoding the APK:

    python3 porting/tests/test_tablet_menu.py PATH_TO_DECODED_APK

Device/AVD acceptance checks (not performed by the structural check):

1. Use a tablet AVD with smallest width at least 720dp. Open a video in landscape.
2. Select Menu; verify popup playback, background playback, speed and cache actions
   are visible and the list scrolls to its last action.
3. Start popup playback and background playback separately; verify they operate.
4. Return to normal playback, rotate portrait/landscape several times, switch tabs,
   leave and return to the activity; repeat steps 2–3.
5. Repeat on a phone layout and with light/dark themes and Material You on/off.

A phone configured to 720dp minimum width can exercise the app's tablet resource
selection as an additional check. Record and restore its original minimum width.
It does not verify device-specific tablet behavior. For Issue confirmation, record
the AVD model, Android version, patch version and a video of the above steps;
request confirmation on the reporter's tablet through the user's own reply.

## Playback overlay in split tablet mode

Landscape alone does not imply fullscreen. The compact title row must only be
used for phone landscape or explicit fullscreen. Tablet split mode hides the
title bar; moving controls into it hides all top actions. FullscreenControls
now distinguishes the player tablet flag and explicit fullscreen flag, and
refreshes after i(int) has finished changing the player layout.

Check 834×1194 in landscape with tablet display mode selected, tap the video
to reveal controls, and verify speed, quality, popup, repeat, comment and
fullscreen actions. Rotate and enter/exit fullscreen, then repeat in all themes.
This is a device acceptance check; APK application alone does not verify it.

Tablet controls use 44dp height with 55dp slots; central playback uses 88dp.
Phone and popup sizes are unchanged.

Article-existence metadata on the reported video's watch response returned false
for all tags, including tags with known articles. Because the flag is unreliable,
TagDictionary removes the obsolete indicator. Search and long-press actions remain.
