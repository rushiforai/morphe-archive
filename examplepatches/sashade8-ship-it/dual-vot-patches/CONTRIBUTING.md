# Contributing

Thanks for helping improve Dual VoT Patches.

## Before opening an issue

- Reproduce the problem with the latest release.
- Check whether it also happens with the official Morphe Patches source.
- Search open and closed issues.
- Remove tokens, cookies, OAuth data, e-mail addresses, and other private data
  from logs and screenshots.

## Bug reports

Include:

- YouTube version;
- Dual VoT bundle version;
- selected translation engine;
- video URL, if the problem is video-specific;
- exact reproduction steps and error text;
- relevant Morphe debug logs.

## Pull requests

Create changes from the `dev` branch. Keep unrelated changes separate and
preserve all copyright and license notices in adapted code. Run:

```shell
./gradlew :patches:buildAndroid --no-daemon
```

Describe the behavior before and after the change and list the YouTube versions
you tested.

General Morphe bugs and features should be reported to the upstream project.
