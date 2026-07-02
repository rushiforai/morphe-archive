# Reddit share-link patches

These patches rewrite Reddit share links to `https://redlib.kareem.one` and strip tracking query parameters from copied/shared URLs.

## Change Reddit share domain

`Change Reddit share domain` rewrites Reddit share URL string literals from `reddit.com`, `www.reddit.com`, and `redd.it` templates to `https://redlib.kareem.one` equivalents.

Covered templates include:

- Subreddit and user profile URL prefixes.
- Post and comment permalink templates with `{link_id}`, `{title}`, and `{comment}` placeholders.
- Short-link templates such as `https://redd.it/{link_id}`.
- `https://reddit.com%s` formatted share URLs.

The patch fails fast if none of the expected literals were rewritten.

## Sanitize Reddit share links

`Sanitize Reddit share links` has two layers:

1. For the previously validated Reddit `2026.13.0` formatter path, it short-circuits:

   ```smali
   Lvu3/f;->a(Lhc3/x;Lcom/reddit/sharing/SharingNavigator$ShareTrigger;Ljava/lang/String;Z)Ljava/lang/String;
   ```

   with:

   ```smali
   return-object p2
   ```

2. For newer Reddit builds where that formatter moved, including `2026.17.0`, it hooks outgoing share sinks:

   - `Intent.putExtra("android.intent.extra.TEXT", String)`
   - `Intent.putExtra("android.intent.extra.TEXT", CharSequence)`
   - legacy `android.text.ClipboardManager#setText(...)`
   - `ClipData.newPlainText(...)`
   - `android.content.ClipboardManager#setPrimaryClip(...)`

Those sink hooks call `RedditShareLinksPatch` in the extension dex to rewrite `reddit.com`, `www.reddit.com`, and `redd.it` hosts and strip query strings from `redlib.kareem.one` links.

## Verification checklist

1. Patch a Reddit APKM matching the compatibility entry.
2. Share or copy a post/comment link and verify the host is `redlib.kareem.one`.
3. Verify the shared link does not include Reddit tracking query parameters such as `utm_source` or `utm_medium`.
4. Open the shared URL externally and confirm the path still resolves to the expected post, comment, subreddit, or user page.
5. If a copied link still uses Reddit hosts, search for a new share/clipboard sink before broadening app-wide string replacement.
