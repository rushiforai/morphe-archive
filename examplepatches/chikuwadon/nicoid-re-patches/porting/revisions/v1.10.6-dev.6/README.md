# v1.10.6-dev.6 — In-place ranking sort and settings descriptions

Development-only; main and official releases are unchanged.

- A ranking period change now updates the current tab's URL and subtitle and refreshes its existing list, without creating another Activity, tab or Fragment
- Preserve the existing tab ID, tab order, tab bar, current Fragment and preferences
- Reuse the normal Refresh192 list refresh and reset the previous period's rows and scroll position; when the loader is already busy, wait until that request finishes before updating
- Keep the former Activity transition path only as a fallback when the active ranking fragment cannot be identified
- Explain the left tab-list and right + controls and selected visibility in the combined "Tab bar buttons" preference
- Preserve the dev.5 ranking duplicate prevention, vertical tab list, restored tab behavior, popup touch and legacy compatibility
- Static integration checks and MPP correctness checks included; actual Android 9/14/16 device validation is outstanding
