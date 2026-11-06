# Compatibility Intelligence

This layer improves **compatibility analysis only**. It does not change WhatsApp patch behavior.

## Design adopted from related projects

The project now combines four useful ideas:

1. **Runtime-hook projects:** keep discovery/mapping separate from feature behavior.
2. **Dynamic-mapping projects:** prefer multiple independent signals instead of trusting one obfuscated symbol.
3. **Morphe sources:** keep one permanent repository source while each published bundle remains versioned.
4. **WhatsApp-specific patch projects:** explicitly scope compatibility to known WhatsApp builds and keep unknown builds experimental.

## What the analyzer measures

For each frozen patch source it records:

- literal string anchors;
- declared return-type constraints;
- parameter hints;
- structural checks;
- direct type references;
- broad class scans;
- a compatibility-risk classification.

The analysis is intentionally conservative. A high-risk classification means "more likely to break after a WhatsApp update", not "unsafe" and not "broken".

## Promotion model

A WhatsApp version moves through:

`untested -> build-validated -> patch-validated -> device-validated -> stable`

No state is promoted automatically from source similarity alone.

## Fail-closed policy

When a new WhatsApp build changes or removes signals:

- do not guess a new target;
- do not silently broaden a fingerprint;
- do not mutate patch behavior automatically;
- keep the build experimental until APK/device evidence exists.

## Development channel

Compatibility-analysis changes are developed on `dev`.

Stable Morphe users keep the same source:

`https://github.com/BOPBOP-glitch/WhatsApp-share`

The main branch remains the stable source channel.
