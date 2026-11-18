# v2.1.0 reviewed Media3 source inputs

The 16 `approved-inputs.partNN` files are consecutive binary chunks of a
content-addressed `tar.gz` archive containing the `v2.1.0-dev.28` Smali
sources (7,434 helper classes and 159 original-app override classes),
the original development scripts, and the **unchanged user-reviewed dev.28 MPP**.

These are canonical source inputs for the v2.1.0 release. Do not treat a
renamed development MPP as an official release. The approved sources must be
reassembled and compared to the reviewed DEX before a release can be staged.
The only intended differences for the official helper DEX are its three
version references, all of which change from `2.1.0-dev.28` to `2.1.0`.

* Source archive SHA-256: `e6fb7401d27b0d0425ae84509c0117934e1346a4cf3b2209b9525e296962761c`
* User-reviewed MPP SHA-256: `02339ca4fdc967c763ac81c4ffe7f46d82024d01b2544d1bc0fa2216d68e673c`
* Submitted source ZIP SHA-256: `1bcf66d5c7bbb5b2fc7650dd0b0532aa97cce6b741dcde521dee3592d8a13a74`

Run the offline integrity check:

```bash
python3 porting/revisions/v2.1.0-release/verify_dev28.py
```

`verify-v2.1.0-source.yml` downloads SHA-256 pinned Smali 2.5.2 tools and
reassembles both reviewed DEX payloads, comparing canonical disassemblies.
The official stage script is **manual-release gated and main-only**, and
combines the current Gradle-built Kotlin patch with the reviewed resources
and rebuilt stable Smali. It does not alter historical release branches.

This source archive contains pre-existing generated and reverse-engineered
code; it does not by itself certify a successful APK patch on every device.
Published assets must also pass CI and application smoke tests.
