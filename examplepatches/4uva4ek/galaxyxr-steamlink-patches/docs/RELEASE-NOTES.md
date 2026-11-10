Restores two omitted 4uva4ek patches, bringing the independent source to eight public features.

- **Galaxy XR SteamVR driver (galaxyxr)**: original HMD/controller identities, vendor resource paths and configurable grip offsets. Requires the PC-side Galaxy XR VRLink Setup. Default off.
- **OpenXR CPU and GPU BOOST (experimental)**: original OpenXR performance-hint layer. Default off.
- Both support exact beta **2.0.24/5002527** and retain 5001712, 5001812, 5001968, 5002244, 5002363 and 5002395.
- The original six controller patches retain their defaults and options.
- The driver patch directly edits config assets, without pulling in upstream Device identity or launch patches. Unknown packages/builds remain inert. Both assets are validated before either is written.
- Source timestamp formatting retains the Unnamed fix.

Host patching is verified separately from gameplay. No fresh beta gameplay, driver connection or BOOST performance measurement is claimed. Update the existing source in Morphe; no new repository is needed.
