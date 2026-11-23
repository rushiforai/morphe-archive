## Gboard Pro v2.0.2 (Beta Dynamic Colors)

### What's New & Highlights

1. **Appearance Section: Exact Demo Screenshot Palettes**:
   - Calibrated each selectable theme palette to match its corresponding demo screenshot:
     - **Blush Lilac**: Soft pastel lilac window background (`#F7EFFA`), pastel pill container (`#EBD7FA`), and deep royal violet accents (`#542983`). Matched to demo screenshot.
     - **Cotton Candy**: Delicate powder rose pink background (`#FDE7E9`), candy pink pill container (`#F6B0CA`), and vivid raspberry magenta accents (`#B80058`). Matched to demo screenshot.
     - **Sunset Peach**: Warm peach background (`#FDE8E7`), apricot coral container (`#FD987C`), and burnt orange terracotta accents (`#D35A2D`). Matched to demo screenshot.
     - **Fresh Mint**: Pale sage mint background (`#EFF5F5`), pastel mint container (`#D4FAEF`), and rich pine teal accents (`#046665`). Matched to demo screenshot.
     - **Default**: Material You dynamic wallpaper-based system Monet palette.

2. **Notification Permission & First-Run Setup Integration**:
   - Added `android.permission.POST_NOTIFICATIONS` for Android 13+ (API 33+).
   - Automatically prompts for notification permission during the initial opening and setup wizard process.
   - Configured dedicated high-priority notification channel for release updates.

3. **Background Automatic Update Engine (Every 8 Hours)**:
   - When "Check for updates automatically" is enabled, an AlarmManager backend job automatically polls GitHub releases every 8 hours.
   - Works persistently even when the app is completely closed.
   - Immediately alerts the user via system notifications when a new update is released.

4. **Dual Clipboard Retention System with Mutual Exclusion**:
   - Restored standard retention slider to original options:
     - 1 hour
     - 24 hours
     - 7 days
     - 30 days
     - Never (Unlimited)
   - Added new custom hourly slider below:
     - 1 hour, 2 hours, 3 hours, 6 hours, 12 hours, 18 hours, 24 hours
   - Interactive Mutual Exclusion:
     - Using one slider instantly deactivates and turns OFF the other.
     - Tapping any inactive slider instantly wakes it up, turns it ON, and deactivates the other.

5. **About Section Redesign (Material 3 Expressive)**:
   - Completely redesigned About section to harmonize with the Material 3 Expressive aesthetic.
   - Features app branding banner with dynamic v2.0.2 version pill.
   - Integrated maintainer profile cards for Arafath Rahman (@smartworldarafath).
   - System details, high refresh rate indicators, and open-source licensing information.
