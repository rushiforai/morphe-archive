# nicoid Re v2.1.1 release implementation

This directory contains the release staging source for the user-verified v2.1.1-dev.12 candidate. The scoped Java helpers and Smali overlays preserve the reviewed behavior; only the public version and bundle identity change for v2.1.1. The pinned v2.1.0 Media3 payload and approved input hashes remain immutable.

Build the Gradle MPP for v2.1.1 first, then stage the verified release using `.github/scripts/stage-v2.1.1-mpp.sh` from the approved manual workflow on main. Do not publish an unstaged Gradle bundle.
