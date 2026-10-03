# Twitch 31.3.1 EmoteUrlUtil signatures

Source artifact:
- APKM SHA-256: 90894052705fd717f5ddb24d02f84ea3752e65600939bc3419695c613ff90fa9
- base.apk SHA-256: d231764122a8fcacdf244b6a279968780950bf4f250bc044c7700f44602be5f5
- APKM contains base.apk plus arm64-v8a/armeabi-v7a and DPI splits.

Class:
`tv.twitch.android.util.EmoteUrlUtil`
DEX location: `classes2.dex`

Declared methods observed in the target class:

| Access | Name | Signature |
|---|---|---|
| static final | a | `(Landroid/content/Context;)F` |
| static synchronized | b | `(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;` |
| static final | c | `(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;` |
| constructor | <init> | `()V` |
| static initializer | <clinit> | `()V` |

There is **no** method named `generateEmoteUrl` in this class in Twitch 31.3.1.

## Method c

`c(Context, String): String` constructs the native Twitch emote URL.

Observed constants/instructions include:

`https://static-cdn.jtvnw.net/emoticons/v1/`

followed by the supplied String argument, then `/`, then a Float size value obtained through `a(Context):float`.

This is the correct native URL-generation hook for the 31.3.1 target.

## Implication for Kizu

The picker URL patch must hook:

`EmoteUrlUtil.c(Context, String): String`

and call:

`EmotePickerBridge.getEmoteUrl(String): String`

using the String parameter (`p1` for this static two-parameter method).

If the bridge returns null, execution must fall through to Twitch's original URL construction.

Do not use:
- `generateEmoteUrl(String,float)`
- `generateEmoteUrl(String,...)`
- `AnimatedEmotesUrlUtil`

for Twitch 31.3.1.
