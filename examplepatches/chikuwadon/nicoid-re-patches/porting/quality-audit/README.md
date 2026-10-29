# Quality audit verification

The local verification bundle retains version `1.9.10-dev.5`. It is based on commit
`e93f76134b6ce504b848974a36028be3498a5599` and the previously verified MPP whose SHA-256 is
`1fd7766dd855377d6550b26f3a595e02249c6904d38ea2bc0878112c4bbd3745`.
No release, CI invocation or remote Git mutation is required.

## Build

Use Java 17 and the existing development tool directory containing ECJ 3.38,
R8 8.3.37, smali/baksmali 2.5.2, dex2jar 2.4 and the Android 14 compile jar.
The script accepts a fresh staging directory, or its own previous marked staging directory.
It rebuilds the reviewed helper families, then replaces only `nicoid/helpers.mpe` in
the baseline MPP. Executor bytecode, native hooks and all resources remain unchanged.

```sh
python3 porting/quality-audit/build.py --base-mpp /absolute/base.mpp --tools /absolute/tools --work /absolute/audit-stage
```

This is the development bundle reconstruction path. It does not replace the full
Gradle project build, nor apply Morphe patches to an original APK.

## Regression checks

Supply a text file containing a colon-separated dependency classpath for Robolectric
4.13 / JUnit 4.13.2, their transitive dependencies, AndroidX monitor and Espresso
idling resource classes, plus the Android compile jar. The matching instrumented
SDK 28 and 34 runtime jars must be present in `tools/sdk`.

```sh
python3 porting/quality-audit/verify.py --base-mpp /absolute/base.mpp --tools /absolute/tools --work /absolute/audit-stage --classpath-file /absolute/dependencies-classpath.txt
```

The verifier runs the development regression suite and new lifecycle/cache/parser
checks, checks DEX call signatures and dispatch, checks payload integrity and bitmap
resource contracts, and writes `verification.json`. Device video decoding, real APK
patch application, account APIs, GPU frame timing and battery consumption require
separate verification.

## Performance comparison

Compile the canonical Java helpers from the base commit and the modified tree into
separate class directories. Use the same Android compile jar and compiler for both.
Do not run other benchmarks or builds concurrently with the paired measurements.

```sh
python3 porting/quality-audit/benchmark.py --before /absolute/base-classes --after /absolute/modified-classes --ecj /absolute/ecj.jar --output /absolute/measurements
```

Each test uses three fresh JVMs for each variant, alternates before/after, compares
checksums, and records every raw measurement. Timestamp inputs are 4096 distinct
Japanese date strings, with two warm-up passes and ten measured passes (40960
conversions, exceeding the 256-entry cache). Keyword inputs are 128 warmed titles,
128 nonmatching keywords, 20000 warm-up calls and 100000 measured calls.
Allocation figures describe cumulative allocations on the benchmark thread, not
application resident memory. These are host microbenchmarks, not Android UI metrics.
