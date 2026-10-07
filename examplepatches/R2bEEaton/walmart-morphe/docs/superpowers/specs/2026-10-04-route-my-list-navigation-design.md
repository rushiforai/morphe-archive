# Route My List navigation and progress design

## Goal

Improve the native Walmart Route My List screen so shoppers can follow a list in order:

- show Walmart's live blue-dot route from the shopper to the current stop when Compass is active;
- show faint straight-line connectors between the remaining list stops as a fallback/context layer;
- move the carousel to the next unchecked item when an item is checked off.

The patch must not calculate paths around shelving, infer a floor plan, or replace Walmart's
location/navigation service.

## Behavior

### Live navigation

The selected carousel item is the current route stop. When Walmart's native Compass service
reports both a live blue-dot state and an active route line, the map retains Walmart's own route
from the shopper's position to that selected item. The patch only exposes and selects the stop;
Walmart continues to decide whether live navigation is available.

### Remaining-stop connectors

The remaining unchecked pins are connected in the existing route order with a faint blue
straight-line overlay. The line is visual guidance only, not a claim that it is walkable around
shelves. It must be drawn through Walmart's map-coordinate/custom-route layer, so it stays aligned
during zoom, pan, floor changes, and pin rendering.

If map coordinates or the native custom-route capability are unavailable for a store, the overlay
is omitted. Existing pins and any available live blue-dot route remain usable.

### Progression

The native checkbox action remains the source of truth. Once its state update marks the selected
item checked, the carousel selects the first later unchecked item, wrapping to the first unchecked
item if necessary. If none remain, no new item is selected and the native completed state is left
in control. The connector overlay recalculates from the new active stop and excludes checked pins.

## Components and data flow

1. **Route state adapter** reads the native multi-item fragment's resolved carousel/pin state and
   current selection. It never creates a second list of check-off state.
2. **Compass adapter** selects the current native item and delegates blue-dot routing to the
   existing Compass route-line API. It is a no-op when that service is unavailable.
3. **Connector renderer** waits for the map bridge's pin-coordinate callback (`PINS_XY_RENDERED`)
   and submits the ordered unchecked coordinates through the native custom-route channel. It
   clears/rebuilds the overlay when selection, completion, floor, or map readiness changes.
4. **Progress observer** reacts after the native checkbox state mutation, advances the carousel,
   and asks the two renderers to refresh.

## Error handling and compatibility

- Every reflective call is capability-checked and fails closed: a missing/renamed native API means
  no added line or navigation control, never a broken map screen.
- A `CUSTOM_ROUTE_ERROR`, missing coordinates, multi-floor discontinuity, or map reload clears the
  connector overlay and preserves native pins and Compass behavior.
- No DOM injection or fixed Android screen overlay is used because either would drift when the map
  pans or zooms and would be brittle across stores/devices.
- Existing flash-price control, carousel photos/sections, native map lifecycle, and feedback-prompt
  removal remain unchanged.

## Verification

- Compile the extension and bytecode patch.
- Package/apply the patch against Walmart 26.38 and install to the connected device.
- Verify Route My List opens with pins and no crash.
- In a Compass-capable store session, verify the native blue-dot route targets the selected item.
- Check an item and verify the carousel selects the next unchecked item and completed items no
  longer participate in the connector overlay.
- Verify that unavailable live navigation or coordinates leaves the normal pin map usable.
