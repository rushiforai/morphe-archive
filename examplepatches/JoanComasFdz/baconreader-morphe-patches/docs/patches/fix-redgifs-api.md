<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixRedgifsApiTests -->

# Fix Redgifs API

RedGIFs videos play again.

- RedGIFs stopped accepting the way BaconReader signed in to it, so every RedGIFs video failed. The patch gets the
  short-lived pass RedGIFs now asks for instead.
- Videos keep playing after the phone joins another network, such as from Wi-Fi to mobile data: when RedGIFs refuses
  the old pass, the patch gets a new one and asks again.

No settings.
