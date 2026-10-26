# Documentation

| Page | What it is |
|---|---|
| [twitch.md](twitch.md) | Twitch 31.7.0: coverage, what each patch hooks and sends, declined features, how it was verified and what wasn't. |
| [kick.md](kick.md) | Kick 40.32.5: the React Native/Hermes analysis, the implemented patch set, the Expo updates handling and the verification contracts. |
| [rumble.md](rumble.md) | Rumble 3.21.0: each patch's hooks, how code is found in the obfuscated app, build and test steps, validation notes. |
| [development.md](development.md) | The workspace: setup, layout, commands, writing and testing a patch, moving to a new app version, releases, dependencies. |

The app pages record, for each patch, how its hook was found and what was and wasn't tested, in
detail. They are the place to look when an app
updates and a fingerprint stops matching. [CONTRIBUTING.md](../CONTRIBUTING.md) has the rules
for adding to them.
