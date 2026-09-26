# The Nothing X K1 token

The Nothing X app (`com.nothing.smartcenter`) pairs a Nothing or CMF watch with the phone.
The watch and the app share a 32-character hexadecimal key, the K1 token.
The app uses it to authenticate the Bluetooth link.

Gadgetbridge needs the same token for the first-generation CMF Watch Pro (D395).
That model cannot negotiate its key during pairing, so the key has to come from the official Nothing X app.
Later models negotiate the key themselves.
The older CMF Watch app that printed the token to logcat is discontinued.
The first generation is the one case where the token has to come out of Nothing X.

## Why file scanning does not work on 3.8.0

Nothing X is a Flutter app.
The bind flow and the K1 handling are Dart code inside `libapp.so`, so no app dex method carries the token logic.

The app persists the K1 through the `flutter_secure_storage` plugin.
On Android, that plugin stores values in EncryptedSharedPreferences under the Android Keystore, so the token is encrypted at rest.
Scanning the app's log file, databases, prefs and cache finds nothing on 3.8.0.

The value is only readable inside the app process, at the plugin boundary:

- the write method receives the plaintext value before the plugin encrypts it;
- the read method holds the decrypted value right before it returns it.

## Hook points

The patch hooks three methods.
The fingerprints were verified against Nothing X 3.8.0, and the patch fails instead of writing a broken APK when a method is missing.

| Class and method                                                                                          | Injection                                                                                                                                                                |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Lcom/nothing/base/view/BaseApplication;->onCreate()V`                                                    | `invoke-static { p0 }, Lapp/morphe/extension/nothingx/patches/ShowK1TokensPatch;->showK1Tokens(Landroid/content/Context;)V` at index 0 <!-- keywatch:ignore --> |
| `Lcom/it_nomads/fluttersecurestorage/FlutterSecureStorage;->write(Ljava/lang/String;Ljava/lang/String;)V` | `invoke-static {p1, p2}, Lapp/morphe/extension/nothingx/patches/ShowK1TokensPatch;->onKeychainEntry(Ljava/lang/String;Ljava/lang/String;)V` at index 0 <!-- keywatch:ignore --> |
| `Lcom/it_nomads/fluttersecurestorage/FlutterSecureStorage;->read(Ljava/lang/String;)Ljava/lang/String;`   | `invoke-static {p1, vN}, Lapp/morphe/extension/nothingx/patches/ShowK1TokensPatch;->onKeychainEntry(Ljava/lang/String;Ljava/lang/String;)V` before every `return-object` <!-- keywatch:ignore --> |

In the read hook, `p1` is the key and `vN` is the register that holds the decrypted value at the return.
Every return is patched, and the later returns are patched first so the earlier instruction indices stay valid.

## Candidate filter

`onKeychainEntry` keeps a value only when it is exactly 32 or 64 hexadecimal characters.
The storage keys are obfuscated by the plugin, so the key name carries no signal.

A 64-character value is r3 (the first 32 characters) plus K1 (the last 32 characters), the same layout as the `r3+k1` line in the app's own log.
The extension takes the last 32 characters and lowercases the result.

The keychain hook masks every value it logs, so no full token appears in logcat from the hook.
Each key is logged once per process, under the `Morpheus` tag:

```text
keychain entry: <key> = <first six characters>… (len <n>)
keychain entry: <key> = <first six characters>… (len <n>) HEX32!
keychain entry: <key> = <first six characters>… (len <n>) HEX64!
```

`HEX32!` or `HEX64!` marks an entry that holds an exact 32- or 64-character hex run.

## The older log and database scan

The extension keeps the scan of the app's log files and databases for versions that write the token in plaintext.

- It reads `/data/data/com.nothing.smartcenter/files/log`, matches `k1:` and `r3+k1:` lines, and prefers a token seen in the `watchbind` flow over one from a reconnect.
- If the logs hold no token, it reads the app's databases for a 32-character hex value, skipping Firebase, cache and chat databases.

The strict scan logs `scan finished, <n> token(s)` and then `#<n>: <TOKEN>` for each token it found, so a token found in the files can also be read from logcat.

## How to verify

1. Install the patched Nothing X app.
2. Run `adb logcat -s Morpheus` in a terminal.
3. Log in and bind the watch.
4. Watch for a `keychain entry` line with `HEX32!` or `HEX64!`.
   The "K1 Token(s) Found" dialog appears on top of the app.
5. Tap a token card to copy the token.
   The card shows the token in upper case.
   "Don't show again" disables the dialog; clear the app data to bring it back.
6. On a version that writes the token to its files, the log also shows `scan finished, <n> token(s)` and `#<n>: <TOKEN>`.

A fresh install shows no dialog until the bind flow has run, because the token does not exist yet.

Gadgetbridge authenticates to the first-generation CMF Watch Pro with the captured token.
This was confirmed on a real device.

## Provenance

The patch was written first as a ReVanced patch by Pa1NarK (pixincreate) in commit [421cb289](https://github.com/ReVanced/revanced-patches/commit/421cb2899ef5c0f100fb8007bae8b89137d0e41c), "feat(Nothing X): Add `Show K1 token(s)` patch (#6490)", 2026-01-22, co-authored by oSumAtrIX. <!-- keywatch:ignore -->
This repository carries the Morphe port of it.
The same patch is published here under CC0 1.0 Universal, like the rest of this repository.
