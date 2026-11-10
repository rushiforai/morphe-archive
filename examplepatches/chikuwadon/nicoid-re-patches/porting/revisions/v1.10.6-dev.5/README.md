# v1.10.6-dev.5 — Tab management refinements

Development only; official release requires separate approval.

- Combine tab-list and add-button visibility into a single multiple-choice preference placed immediately below "Use multiple tabs"; both default ON and dev.4 choices migrate
- Use the same theme accent color for the fixed tab-list button and the + button
- Rename the dialog action to "Restore most recently closed tab" and keep the dialog open after closing/restoring tabs
- Share the one-step restore slot across dialog closes and tab-strip closes
- Treat ranking category+period+filters as tab identity across legacy startup and ranking-menu URL formats; different rankings remain separate; existing duplicate tabs are not deleted automatically
- Preserve dev.4's central modal, icon mapping, drag reorder, popup control/seekbar fix and all existing features
- CI regression tests for ranking identity and distributed MPP checks

- Ranking period sorting uses no Activity enter/exit slide animation; programmatic tab restore clears stale swipe state while finger-driven tab paging retains its animation
