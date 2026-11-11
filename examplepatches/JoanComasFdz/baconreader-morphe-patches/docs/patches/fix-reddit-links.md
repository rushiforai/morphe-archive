<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixRedditLinksTests -->

# Fix Reddit links

Share links, video links and other Reddit links open in BaconReader instead of its browser.

- Share links (`/r/<sub>/s/<code>`, `/u/<user>/s/<code>`) open the post they lead to. A share link Reddit can't resolve
  opens in the browser, as before.
- Links to a post without its subreddit (`/comments/<post>`) and to a gallery (`/gallery/<post>`) open the post.
- A post on a user's profile (`/user/<user>/comments/<post>`) opens as the post, not as the profile.
- A video's link (`v.redd.it/<video>`) opens the post it was posted in, or plays the video when Reddit has no post for
  it. BaconReader looked the post up through an address Reddit now refuses.
- The gallery or video a post links to still opens in BaconReader's media viewer from the post's thumbnail, the link
  in its header or the Slide Show View.
- A Reddit link in a post, comment or message opens in BaconReader even with BaconReader's "Open links inside app" off.

No settings.
