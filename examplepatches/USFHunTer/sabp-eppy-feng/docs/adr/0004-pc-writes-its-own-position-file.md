---
status: accepted (not built yet)
---

# The PC writes its own position file; every device offers the most recently played other position

The PC (Audiobookshelf plus the PC read-along helper) joins the phone and tablet in the synced library folder (ADR 0002). It saves its playback position in its own small file in the book folder (`position.pc.json`: audio file name, seconds into it, last-played time) and only ever reads SABP's `position.sabp.dat`. The Sync between devices patch learns to read the PC's file too. With two other positions to choose from, each device offers the one most recently played, still only when it's more than 30 s from here and never without asking.

## Considered Options

- **The PC writes `position.sabp.dat`.** No phone change, but it's SABP's Java-serialised `BookDataBackup`; a file written from outside that SABP can't read would break the position import of a book new to a device.
- **The phone reads Audiobookshelf's progress over the network.** Adds network code to eppy, which ADR 0002 avoids.
- **The PC only reads other positions (one-way).** No helper needed for positions, but the phone and tablet would never see where the PC left off.

## Consequences

- Choosing the most recent of two positions compares last-played times written by different devices' clocks, which ADR 0002 avoided. Devices on normal network time are close enough for a feature that only offers.
- The PC's "where I am" is Audiobookshelf's own progress; the helper writes `position.pc.json` from it when the PC pauses (and every 2 minutes while playing, like SABP).
