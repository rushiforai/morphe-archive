# contacts native regression

Compile MergedProbe.java against Android 35, package with this manifest using D8/AAPT2, sign with the same disposable test key as the target, install, then instrument io.github.pengusto.patches.contacts.tests/io.github.pengusto.patches.tests.MergedProbe. Refuses non-ranchu hardware. Only synthetic data.

Requires two visible synthetic raw contacts named Penguin Merge, first ID 5 empty email/note, second has penguin@example.invalid and Local note stays intact; both same phone. Merge switch toggled/restored. Tests use exact official 1.6.0 obfuscated model and view bindings. Original provider data is not edited.
