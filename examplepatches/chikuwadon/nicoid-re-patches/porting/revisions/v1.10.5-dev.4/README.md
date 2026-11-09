# v1.10.5-dev.4 — popup crash and public mylist tab titles

Development-only regression build based on v1.10.5-dev.3. No official release.

- Fix Android 16 VerifyError on popup launch caused by using an undefined v1 register in the injected native onTouch branch.
- Keep the v1.10.5-dev.3 drag, tap, double tap and pinch behavior.
- Public mylist tabs now adopt their actual async-loaded title rather than retaining a generic 'nicoid Re' placeholder.
- Long titles are stored in full, and the existing 180dp, single-line, end-ellipsized tab UI remains unchanged.
- Preserve user-renamed tabs, other tab types and stale async title results.
- Verify the assembled title callback and popup branch; add dedicated public-mylist title tests.

Real Android device confirmation is required for popup playback and live mylist title update.
