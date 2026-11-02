# agent tools

Helpers for inspecting the Facebook APK without baksmali/apktool (no network needed).
Needs only Java 21 and `work/morphe-desktop.jar` (it bundles dexlib2).

## Dex.java - dex inspector
Run as a single-file program (works even when only a JRE with `jdk.compiler` is installed, no `javac` needed):
```
J=work/morphe-desktop.jar
java -cp $J agent-tools/Dex.java classes2.dex class 'LX/2GO;'            # fields + methods
java -cp $J agent-tools/Dex.java classes2.dex dis 'LX/2GO;' A06          # disassembly (opcodes, registers incl. invoke args, field/method/string refs)
java -cp $J agent-tools/Dex.java classes2.dex strref 'regex'             # methods referencing a matching string
java -cp $J agent-tools/Dex.java classes2.dex callers 'LX/3Pg;' A00      # classes with a method calling this one (searches ONE dex file)
```
Extract the dex files first: `unzip facebook.apk 'classes*.dex' -d dexdir`. The APK has ~21 dex files and a class lives in exactly one,
so loop over `dexdir/classes*.dex` for `callers` / `strref` (and to find which file holds a class).

Notes:
- Class names are the Redex-obfuscated ones (`LX/2GO;`), same as jadx shows `C2GO`.
- Output is a plain disassembly, not smali: check register counts (`regs=`) before injecting smali.
- `callers` only matches the exact method name; use `<init>` for constructors.

## arsc.py - resource id lookup
```
python3 agent-tools/arsc.py resources.arsc 7f0a2044 7f0a2041
```
Maps `0x7fTTEEEE` ids to (type, name). In this build id NAMES are stripped (`(name removed)`), so this only confirms the type.
Layout XMLs in `res/` don't reference the main-tab view ids (couldn't locate the tab-bar layout statically), so for view-structure
questions prefer logging the live view tree from the extension (`adb logcat -s MarketplaceOnly`).
