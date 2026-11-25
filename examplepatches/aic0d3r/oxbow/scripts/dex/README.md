# dex tools

Single-file Java tools for checking a patched APK the way the patcher sees it. They run straight
from source with the Morphe CLI jar (which carries dexlib2); no build step:

```sh
CP="tools/morphe-desktop-*.jar:$HOME/Android/Sdk/platforms/android-36/android.jar"
java -cp "$CP" scripts/dex/<Tool>.java <args>
```

| Tool | Answers |
|---|---|
| `DexCheck <apk> ['Lcom/feurstagram/extension/Config;->cooldownLeft(Ljava/lang/String;JJI)J' …]` | Does every reference from Instagram's code into the extension resolve, does every call pass the registers its descriptor needs, and are the named new members really in the shipped dex (a stale extension in the bundle fails this)? |
| `HookInventory <apk>` | Every Instagram method that references the extension, with each call's position: `@0/2398:Download.addMenuItem`, `@last:…`, `:f:<field>` for fields. The list to read after "all patches applied". |
| `SwitchKeys <apk> '<class;>' '<method>' <strings…>` | Whether each string's `hashCode()` is a case of one of that method's switches: how to tell which JSON field names a parser still reads when the names themselves are gone from the code. |
| `DumpMethod <apk> '<class;>' '<method>' [from] [to]` | A method's instructions with registers, references and literals. |

"Applied" has meant nothing here before (dead stores, wrong overloads, dropped registers), so a
port is done when `DexCheck` reports no problems, `HookInventory` shows each hook where its patch
meant it, and the phone agrees.
