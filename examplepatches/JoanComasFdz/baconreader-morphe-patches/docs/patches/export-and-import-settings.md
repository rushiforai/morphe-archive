<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: ExportAndImportSettingsTests -->

# Export and import settings

Your settings in a YAML file, to restore them on another phone or after reinstalling BaconReader.

- The patches' settings get a "Backup" section with "Export settings" and "Import settings".
- "Export settings" asks where to save the file, `baconreader-settings-<date>.yaml`, with BaconReader's own settings,
  the patches' settings and the accounts' colors, and says "Settings exported to <file>".
- "Import settings" asks for the file, then "Import settings?", with how many settings it has. "Import and restart"
  replaces your settings with the file's and restarts BaconReader: a setting the file doesn't list goes back to its
  default.
- A file exported with the Reseam patches imports with the Morphe patches, and the other way round.

No settings.

**Limits**:
- Accounts and logins aren't in the file: log in again after importing it. Nor is what BaconReader keeps about the
  phone, such as the folder it saves media to.
- The file only has the settings of the patches you installed, and an import skips those of the patches you didn't.
- A file that isn't from "Export settings" isn't imported. One edited by hand is, as long as it keeps its layout; a
  line that can't be read shows "Could not import the settings" with its number.
