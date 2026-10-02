import os
from pathlib import Path
import re
import shutil

ROOT = Path("uyu")
DONOR = Path("hooman")

settings_dst = ROOT / "extensions/twitch/src/main/java/io/github/bakwudo/uyu/extension/settings"
settings_dst.mkdir(parents=True, exist_ok=True)

stream_proxy = ROOT / "extensions/twitch/src/main/java/io/github/bakwudo/uyu/extension/ads/StreamProxy.java"
proxy_text = stream_proxy.read_text()
old = 'String proxy = Settings.ADS_PROXY_URL.get().trim();\n        if (proxy.isEmpty()) return usherUri;'
new = 'String proxy = Settings.ADS_PROXY_URL.get().trim();\n        if (proxy.isEmpty()) proxy = "https://eu2.luminous.dev/live/{channel}?allow_source=true&allow_audio_only=true";'
if old not in proxy_text:
    raise RuntimeError("Could not locate Uyu StreamProxy default")
stream_proxy.write_text(proxy_text.replace(old, new, 1))
(settings_dst / "Settings.java").write_text(Path("twitch-build/Settings.java").read_text())
(settings_dst / "UyuSettingsFragment.java").write_text(Path("twitch-build/UyuSettingsFragment.java").read_text())
(settings_dst / "PrivacySupport.java").write_text(Path("twitch-build/PrivacySupport.java").read_text())

enhancement_dst = ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/enhancement"
enhancement_dst.mkdir(parents=True, exist_ok=True)
(enhancement_dst / "EnhancementPatch.kt").write_text(Path("twitch-build/EnhancementPatch.kt").read_text())

emote_patch_dst = ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/emotes"
emote_patch_dst.mkdir(parents=True, exist_ok=True)
(emote_patch_dst / "Fingerprints.kt").write_text(Path("twitch-build/EmoteFingerprints.kt").read_text())
(emote_patch_dst / "ThirdPartyEmotesPatch.kt").write_text(Path("twitch-build/ThirdPartyEmotesPatch.kt").read_text())
(emote_patch_dst / "EmotePickerUrlPatch.kt").write_text(Path("twitch-build/EmotePickerUrlPatch.kt").read_text())
(emote_patch_dst / "EmoteAutocompletePatch.kt").write_text(Path("twitch-build/EmoteAutocompletePatch.kt").read_text())

privacy_patch_dst = ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/privacy"
privacy_patch_dst.mkdir(parents=True, exist_ok=True)
(privacy_patch_dst / "PrivacyPatch.kt").write_text(Path("twitch-build/PrivacyPatch.kt").read_text())

donor_emotes = DONOR / "extensions/twitch/src/main/java/app/morphe/extension/twitch/emotes"
emote_ext_dst = ROOT / "extensions/twitch/src/main/java/app/morphe/extension/twitch/emotes"
if emote_ext_dst.exists():
    shutil.rmtree(emote_ext_dst)
shutil.copytree(donor_emotes, emote_ext_dst)

catalog = emote_ext_dst / "EmoteCatalog.java"
s = catalog.read_text()

_old_7tv_loader = """    private void loadChannelSevenTv(Context context, String channelId, ChannelState channel) {
        boolean updated = false;
        try {
            LoadedValue<JSONObject> response = loadOptionalJson(
                    context,
                    "7tv-channel-" + channelId,
                    "https://7tv.io/v3/users/twitch/" + channelId
            );
            Map<String, Emote> loaded = new LinkedHashMap<>();
            JSONObject set = response.value.optJSONObject("emote_set");
            if (set != null) {
                parseSevenTv(set, loaded);
            }
            channel.sevenTv.publish(loaded, response.fresh);
            updated = true;
        } catch (Exception ignored) {
            channel.sevenTv.failed();
        } finally {
            channel.sevenTv.loading.set(false);
        }
        if (updated) {
            onUpdated.accept(channelId);
        }
    }"""
_new_7tv_loader = """    private void loadChannelSevenTv(Context context, String channelId, ChannelState channel) {
        boolean updated = false;
        try {
            LoadedValue<JSONObject> user = loadOptionalJson(
                    context,
                    "7tv-user-" + channelId,
                    "https://7tv.io/v3/users/twitch/" + channelId
            );
            JSONObject userObject = user.value;

            // 7TV may expose only emote_set_id in the Twitch-user response.
            // Keep compatibility with older responses that embedded emote_set.
            JSONObject embeddedSet = userObject.optJSONObject("emote_set");
            String setId = userObject.optString("emote_set_id", "");
            if (setId.isEmpty() && embeddedSet != null) {
                setId = embeddedSet.optString("id", "");
            }

            Map<String, Emote> loaded = new LinkedHashMap<>();
            boolean fresh = user.fresh;
            if (embeddedSet != null) {
                parseSevenTv(embeddedSet, loaded);
            } else if (!setId.isEmpty()) {
                LoadedValue<JSONObject> set = loadOptionalJson(
                        context,
                        "7tv-emote-set-" + setId,
                        "https://7tv.io/v3/emote-sets/" + setId
                );
                parseSevenTv(set.value, loaded);
                fresh = user.fresh && set.fresh;
            }

            channel.sevenTv.publish(loaded, fresh);
            updated = true;
        } catch (Exception ignored) {
            channel.sevenTv.failed();
        } finally {
            channel.sevenTv.loading.set(false);
        }
        if (updated) {
            onUpdated.accept(channelId);
        }
    }"""
if _old_7tv_loader not in s:
    raise RuntimeError("7TV loader block changed; cannot apply current API compatibility fix safely.")
s = s.replace(_old_7tv_loader, _new_7tv_loader, 1)
old_bttv = """    private static void parseBetterTtvArray(JSONArray emotes, Map<String, Emote> target) {
        if (emotes == null) {
            return;
        }
        for (int index = 0; index < emotes.length(); index++) {
            JSONObject item = emotes.optJSONObject(index);
            if (item == null) {
                continue;
            }
            String id = item.optString("id", "");
            String name = item.optString("code", "");
            if (id.isEmpty() || name.isEmpty()) {
                continue;
            }
            target.put(name, new Emote(
                    name,
                    "https://cdn.betterttv.net/emote/" + id + "/2x.webp",
                    item.optBoolean("animated", false)
            ));
        }
    }"""

new_bttv = """    private static void parseBetterTtvArray(JSONArray emotes, Map<String, Emote> target) {
        if (emotes == null) {
            return;
        }
        for (int index = 0; index < emotes.length(); index++) {
            JSONObject item = emotes.optJSONObject(index);
            if (item == null) {
                continue;
            }
            String id = item.optString("id", "");
            String name = item.optString("code", "");
            if (id.isEmpty() || name.isEmpty()) {
                continue;
            }
            boolean isAnimated = "gif".equalsIgnoreCase(item.optString("imageType", "png"));
            String ext = isAnimated ? "gif" : "webp";
            target.put(name, new Emote(
                    name,
                    "https://cdn.betterttv.net/emote/" + id + "/2x." + ext,
                    isAnimated
            ));
        }
    }"""
s = s.replace(old_bttv, new_bttv)

s = s.replace(
    "    private final ProviderState globalBetterTtv = new ProviderState();",
    "    private final ProviderState globalBetterTtv = new ProviderState();\n    private final ProviderState globalFfz = new ProviderState();",
)
s = s.replace(
    "import android.content.Context;\n",
    "import android.content.Context;\n\nimport io.github.bakwudo.uyu.extension.settings.Settings;\nimport io.github.bakwudo.uyu.extension.Utils;\n",
)
s = s.replace(
    "        schedule(globalSevenTv, now, () -> loadGlobalSevenTv(applicationContext));\n"
    "        schedule(globalBetterTtv, now, () -> loadGlobalBetterTtv(applicationContext));",
    "        if (Settings.EMOTES_7TV.get()) {\n"
    "            schedule(globalSevenTv, now, () -> loadGlobalSevenTv(applicationContext));\n"
    "        }\n"
    "        if (Settings.EMOTES_BTTV.get()) {\n"
    "            schedule(globalBetterTtv, now, () -> loadGlobalBetterTtv(applicationContext));\n"
    "        }\n"
    "        if (Settings.EMOTES_FFZ.get()) {\n"
    "            schedule(globalFfz, now, () -> loadGlobalFfz(applicationContext));\n"
    "        }",
)
s = s.replace(
    "        schedule(channel.sevenTv, now, () -> loadChannelSevenTv(applicationContext, channelId, channel));\n"
    "        schedule(channel.betterTtv, now,\n"
    "                () -> loadChannelBetterTtv(applicationContext, channelId, channel));",
    "        if (Settings.EMOTES_7TV.get()) {\n"
    "            schedule(channel.sevenTv, now, () -> loadChannelSevenTv(applicationContext, channelId, channel));\n"
    "        }\n"
    "        if (Settings.EMOTES_BTTV.get()) {\n"
    "            schedule(channel.betterTtv, now,\n"
    "                    () -> loadChannelBetterTtv(applicationContext, channelId, channel));\n"
    "        }\n"
    "        if (Settings.EMOTES_FFZ.get()) {\n"
    "            schedule(channel.ffz, now, () -> loadChannelFfz(applicationContext, channelId, channel));\n"
    "        }",
)
s, count = re.subn(
    r"    Emote find\(String channelId, String name\) \{.*?\n    \}\n\n    private void schedule",
    """    Emote find(String channelId, String name) {
        boolean sevenTv = Settings.EMOTES_7TV.get();
        boolean betterTtv = Settings.EMOTES_BTTV.get();
        boolean ffz = Settings.EMOTES_FFZ.get();

        if (channelId != null) {
            ChannelState channel = getChannel(channelId, false);
            if (channel != null) {
                if (sevenTv) {
                    Emote emote = channel.sevenTv.emotes.get(name);
                    if (emote != null) return emote;
                }
                if (betterTtv) {
                    Emote emote = channel.betterTtv.emotes.get(name);
                    if (emote != null) return emote;
                }
                if (ffz) {
                    Emote emote = channel.ffz.emotes.get(name);
                    if (emote != null) return emote;
                }
            }
        }

        if (sevenTv) {
            Emote emote = globalSevenTv.emotes.get(name);
            if (emote != null) return emote;
        }
        if (betterTtv) {
            Emote emote = globalBetterTtv.emotes.get(name);
            if (emote != null) return emote;
        }
        return ffz ? globalFfz.emotes.get(name) : null;
    }

    private void schedule""",
    s,
    count=1,
    flags=re.S,
)
if count != 1:
    raise RuntimeError("Could not patch EmoteCatalog.find")

s = s.replace(
    "    private static final class ChannelState {\n        final ProviderState sevenTv = new ProviderState();\n        final ProviderState betterTtv = new ProviderState();\n    }",
    "    private static final class ChannelState {\n        final ProviderState sevenTv = new ProviderState();\n        final ProviderState betterTtv = new ProviderState();\n        final ProviderState ffz = new ProviderState();\n    }",
    1,
)

s = s.replace(
    "    private void schedule",
    """    private void loadGlobalFfz(Context context) {
        boolean updated = false;
        try {
            LoadedValue<JSONArray> response = loadJsonArray(
                    context,
                    "ffz-global",
                    "https://api.betterttv.net/3/cached/frankerfacez/emotes/global"
            );
            Map<String, Emote> loaded = new LinkedHashMap<>();
            parseFfzArray(response.value, loaded);
            globalFfz.publish(loaded, response.fresh);
            updated = true;
        } catch (Exception ignored) {
            globalFfz.failed();
        } finally {
            globalFfz.loading.set(false);
        }
        if (updated) onUpdated.accept(null);
    }

    private void loadChannelFfz(Context context, String channelId, ChannelState channel) {
        boolean updated = false;
        try {
            LoadedValue<JSONArray> response = loadOptionalJsonArray(
                    context,
                    "ffz-channel-" + channelId,
                    "https://api.betterttv.net/3/cached/frankerfacez/users/twitch/" + channelId
            );
            Map<String, Emote> loaded = new LinkedHashMap<>();
            parseFfzArray(response.value, loaded);
            channel.ffz.publish(loaded, response.fresh);
            updated = true;
        } catch (Exception ignored) {
            channel.ffz.failed();
        } finally {
            channel.ffz.loading.set(false);
        }
        if (updated) onUpdated.accept(channelId);
    }

    static final class Heartbeat implements Runnable {
        private static final java.util.Set<android.widget.TextView> VIEWS =
                java.util.Collections.synchronizedSet(
                        java.util.Collections.newSetFromMap(new java.util.WeakHashMap<android.widget.TextView, Boolean>()));
        private static android.os.Handler handler;

        static void attach(android.widget.TextView view) {
            VIEWS.add(view);
            if (handler == null) {
                handler = new android.os.Handler(view.getContext().getMainLooper());
                handler.post(new Heartbeat());
            }
        }

        @Override
        public void run() {
            synchronized (VIEWS) {
                for (android.widget.TextView view : VIEWS) {
                    CharSequence text = view.getText();
                    if (view.isAttachedToWindow() && text instanceof android.text.Spanned) {
                        android.text.Spanned spanned = (android.text.Spanned) text;
                        CenteredImageSpan[] spans =
                                spanned.getSpans(0, spanned.length(), CenteredImageSpan.class);
                        boolean animated = false;
                        for (CenteredImageSpan span : spans) {
                            android.graphics.drawable.Drawable d = span.getDrawable();
                            if (d instanceof android.graphics.drawable.Animatable) {
                                d.invalidateSelf();
                                animated = true;
                            }
                        }
                        if (animated) view.invalidate();
                    }
                }
            }
            handler.postDelayed(this, 50);
        }
    }

    private void schedule""",
    1,
)

s = s.replace(
    "    private static LoadedValue<JSONObject> loadJson(Context context, String cacheKey, String url)",
    """    private static void parseFfzArray(JSONArray emotes, Map<String, Emote> target) {
        if (emotes == null) return;
        for (int index = 0; index < emotes.length(); index++) {
            JSONObject item = emotes.optJSONObject(index);
            if (item == null) continue;
            String name = item.optString("code", "");
            JSONObject images = item.optJSONObject("images");
            if (name.isEmpty() || images == null) continue;
            String url = images.optString("2x", "");
            if (url.isEmpty()) url = images.optString("1x", "");
            if (url.isEmpty()) url = images.optString("4x", "");
            if (url.isEmpty()) continue;
            boolean animated = "gif".equalsIgnoreCase(item.optString("imageType", ""));
            target.put(name, new Emote(name, url, animated));
        }
    }

    private static LoadedValue<JSONArray> loadOptionalJsonArray(
            Context context,
            String cacheKey,
            String url
    ) throws IOException, JSONException {
        LoadedValue<String> text = loadText(context, cacheKey, url, true);
        try {
            return new LoadedValue<>(new JSONArray(text.value), text.fresh);
        } catch (JSONException failure) {
            deleteCachedText(context, cacheKey);
            throw failure;
        }
    }

    private static LoadedValue<JSONObject> loadJson(Context context, String cacheKey, String url)""",
    1,
)

catalog.write_text(s)
emote = emote_ext_dst / "Emote.java"
s = emote.read_text()
old_emote = """final class Emote {
    final String name;
    final String url;
    final boolean animated;

    Emote(String name, String url, boolean animated) {
        this.name = name;
        this.url = url;
        this.animated = animated;
    }
}"""
new_emote = """final class Emote {
    final String name;
    final String url;
    final boolean animated;
    final boolean zeroWidth;

    Emote(String name, String url, boolean animated) {
        this(name, url, animated, false);
    }

    Emote(String name, String url, boolean animated, boolean zeroWidth) {
        this.name = name;
        this.url = url;
        this.animated = animated;
        this.zeroWidth = zeroWidth;
    }
}"""
if old_emote not in s:
    raise RuntimeError("Emote.java donor shape changed.")
s = s.replace(old_emote, new_emote, 1)
emote.write_text(s)

catalog = emote_ext_dst / "EmoteCatalog.java"
s = catalog.read_text()
old_seven = 'target.put(name, new Emote(name, url, data != null && data.optBoolean("animated", false)));'
new_seven = 'target.put(name, new Emote(name, url, data != null && data.optBoolean("animated", false),\n                    (item.optInt("flags", 0) & (1 << 8)) != 0));'
if old_seven not in s:
    raise RuntimeError("SevenTV emote parse line changed.")
s = s.replace(old_seven, new_seven, 1)
catalog.write_text(s)


loader = emote_ext_dst / "EmoteImageLoader.java"
s = loader.read_text()
s = s.replace(
    "import android.os.Build;\n",
    "import android.os.Build;\n\nimport io.github.bakwudo.uyu.extension.settings.Settings;\n",
    1,
)


old_create_drawable = """    Drawable createDrawable(Resources resources, Emote emote) {
        ImageData data = memory.get(emote.url);
        if (data == null) {
            return null;
        }
        if (data.drawableState != null) {
            return data.drawableState.newDrawable(resources);
        }
        return data.bitmap == null ? null : new BitmapDrawable(resources, data.bitmap);
    }"""

new_create_drawable = """    Drawable createDrawable(Resources resources, Emote emote) {
        ImageData data = memory.get(emote.url);
        if (data == null) {
            return null;
        }

        if (data.animatedSource && !Settings.EMOTES_ANIMATED.get() &&
                data.sourceBytes != null) {
            try {
                Bitmap bitmap = decodeBitmap(data.sourceBytes, data.targetDimension);
                return bitmap == null ? null : new BitmapDrawable(resources, bitmap);
            } catch (Exception ignored) {
            }
        }

        if (data.animatedSource && data.sourceBytes != null &&
                Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            try {
                Drawable decoded = ImageDecoder.decodeDrawable(
                        ImageDecoder.createSource(ByteBuffer.wrap(data.sourceBytes)),
                        (decoder, info, source) -> configureDecoder(
                                decoder, info, data.targetDimension
                        )
                );
                if (decoded instanceof android.graphics.drawable.Animatable) {
                    ((android.graphics.drawable.Animatable) decoded).start();
                }
                return decoded;
            } catch (Exception ignored) {
            }
        }

        if (data.drawableState != null) {
            return data.drawableState.newDrawable(resources);
        }
        return data.bitmap == null ? null : new BitmapDrawable(resources, data.bitmap);
    }"""

if old_create_drawable not in s:
    raise RuntimeError("Donor createDrawable block changed; cannot apply safely.")
s = s.replace(old_create_drawable, new_create_drawable, 1)

old_decode = """    private static ImageData decode(byte[] bytes, boolean animated, int targetDimension)
            throws IOException {
        if (animated && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            Drawable decoded;
            try {
                decoded = ImageDecoder.decodeDrawable(
                        ImageDecoder.createSource(ByteBuffer.wrap(bytes)),
                        (decoder, info, source) -> configureDecoder(decoder, info, targetDimension)
                );
            } catch (IllegalArgumentException failure) {
                throw new IOException("Invalid animated emote dimensions", failure);
            }
            Drawable.ConstantState state = decoded.getConstantState();
            if (state != null) {
                int width = Math.max(1, decoded.getIntrinsicWidth());
                int height = Math.max(1, decoded.getIntrinsicHeight());
                long estimate = (long) width * height * 4L * 4L;
                return new ImageData(null, state, saturatedInt(estimate));
            }
        }

        Bitmap bitmap = decodeBitmap(bytes, targetDimension);
        if (bitmap == null) {
            throw new IOException("Unable to decode emote image");
        }
        return new ImageData(bitmap, null, bitmap.getByteCount());
    }"""

new_decode = """    private static boolean isWebp(byte[] bytes) {
        if (bytes.length < 12) return false;
        return bytes[0] == 'R' && bytes[1] == 'I' && bytes[2] == 'F' && bytes[3] == 'F' &&
               bytes[8] == 'W' && bytes[9] == 'E' && bytes[10] == 'B' && bytes[11] == 'P';
    }

    private static boolean isGif(byte[] bytes) {
        if (bytes.length < 6) return false;
        return (bytes[0] == 'G' && bytes[1] == 'I' && bytes[2] == 'F' && bytes[3] == '8' &&
               (bytes[4] == '7' || bytes[4] == '9') && bytes[5] == 'a');
    }

    private static ImageData decode(byte[] bytes, boolean animated, int targetDimension)
            throws IOException {
        boolean forceAnimated = isWebp(bytes) || isGif(bytes);
        if ((animated || forceAnimated) && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            Drawable decoded;
            try {
                decoded = ImageDecoder.decodeDrawable(
                        ImageDecoder.createSource(ByteBuffer.wrap(bytes)),
                        (decoder, info, source) -> configureDecoder(decoder, info, targetDimension)
                );
            } catch (IllegalArgumentException failure) {
                throw new IOException("Invalid animated emote dimensions", failure);
            }
            Drawable.ConstantState state = decoded.getConstantState();
            int width = Math.max(1, decoded.getIntrinsicWidth());
            int height = Math.max(1, decoded.getIntrinsicHeight());
            long estimate = (long) width * height * 4L * 4L + bytes.length;

            return new ImageData(
                    null,
                    state,
                    bytes,
                    true,
                    targetDimension,
                    saturatedInt(estimate)
            );
        }

        Bitmap bitmap = decodeBitmap(bytes, targetDimension);
        if (bitmap == null) {
            throw new IOException("Unable to decode emote image");
        }
        return new ImageData(
                bitmap,
                null,
                null,
                false,
                targetDimension,
                bitmap.getByteCount()
        );
    }"""

s = s.replace(old_decode, new_decode)

old_image_data = """    private static final class ImageData {
        final Bitmap bitmap;
        final Drawable.ConstantState drawableState;
        final int costBytes;

        ImageData(Bitmap bitmap, Drawable.ConstantState drawableState, int costBytes) {
            this.bitmap = bitmap;
            this.drawableState = drawableState;
            this.costBytes = costBytes;
        }
    }"""

new_image_data = """    private static final class ImageData {
        final Bitmap bitmap;
        final Drawable.ConstantState drawableState;
        final byte[] sourceBytes;
        final boolean animatedSource;
        final int targetDimension;
        final int costBytes;

        ImageData(
                Bitmap bitmap,
                Drawable.ConstantState drawableState,
                byte[] sourceBytes,
                boolean animatedSource,
                int targetDimension,
                int costBytes
        ) {
            this.bitmap = bitmap;
            this.drawableState = drawableState;
            this.sourceBytes = sourceBytes;
            this.animatedSource = animatedSource;
            this.targetDimension = targetDimension;
            this.costBytes = costBytes;
        }
    }"""

if old_image_data not in s:
    raise RuntimeError("Current ImageData block changed; cannot apply safely.")
s = s.replace(old_image_data, new_image_data, 1)
loader.write_text(s)

span = emote_ext_dst / "CenteredImageSpan.java"
s = span.read_text()
old_span_ctor = """    private final Drawable drawable;
    private final Paint.FontMetricsInt paintMetrics = new Paint.FontMetricsInt();

    CenteredImageSpan(TextView textView, Drawable drawable) {
        super(ALIGN_BOTTOM);
        this.drawable = drawable;"""
new_span_ctor = """    private final Drawable drawable;
    private final boolean zeroWidth;
    private final Paint.FontMetricsInt paintMetrics = new Paint.FontMetricsInt();

    CenteredImageSpan(TextView textView, Drawable drawable) {
        this(textView, drawable, false);
    }

    CenteredImageSpan(TextView textView, Drawable drawable, boolean zeroWidth) {
        super(ALIGN_BOTTOM);
        this.drawable = drawable;
        this.zeroWidth = zeroWidth;"""
if old_span_ctor not in s:
    raise RuntimeError("CenteredImageSpan donor shape changed.")
s = s.replace(old_span_ctor, new_span_ctor, 1)
s = s.replace("        return bounds.width();", "        return zeroWidth ? 0 : bounds.width();", 1)
span.write_text(s)

support = emote_ext_dst / "EmoteSupport.java"
s = support.read_text()
if "import android.content.Context;" not in s:
    s = s.replace(
        "import android.text.Spannable;\n",
        "import android.content.Context;\nimport android.text.Spannable;\n",
        1,
    )
if "import io.github.bakwudo.uyu.extension.settings.Settings;" not in s:
    s = s.replace(
        "import android.widget.TextView;\n",
        "import android.widget.TextView;\n\nimport io.github.bakwudo.uyu.extension.settings.Settings;\nimport io.github.bakwudo.uyu.extension.Utils;\n",
        1,
    )
needle = "    public static void bind(TextView textView, String sourceChannelId) {"
if needle not in s:
    raise RuntimeError("Could not locate EmoteSupport.bind")
s = s.replace(
    needle,
    """    public static void bind(TextView textView) {
        bind(textView, null);
    }

    public static void bind(TextView textView, String sourceChannelId) {""",
    1,
)
needle = "    private static void bindInternal(TextView textView, String sourceChannelId) {\n"
if needle not in s:
    raise RuntimeError("Could not locate EmoteSupport.bindInternal")
s = s.replace(
    needle,
    needle +
    "        if (!Settings.EMOTES_7TV.get() && !Settings.EMOTES_BTTV.get() && !Settings.EMOTES_FFZ.get()) {\n"
    "            forget(textView);\n"
    "            return;\n"
    "        }\n"
    "        EmoteCatalog.Heartbeat.attach(textView);\n",
    1,
)
# Expose the active channel and catalog data to the native Twitch picker.
picker_channel_marker = "    public static void onChannelChanged(String channelId, String channelName) {"
if picker_channel_marker not in s:
    raise RuntimeError("EmoteSupport channel hook marker changed; cannot add picker accessors safely.")
picker_support = """    public static String getCurrentChannelId() {
        return lastRoomId;
    }

    public static java.util.List<Emote> getAllForChannel(String channelId) {
        try {
            Context context = Utils.getContext();
            if (context != null && channelId != null) {
                CATALOG.ensureLoaded(context, channelId);
            }
            return CATALOG.getAllForChannel(channelId);
        } catch (Throwable ignored) {
            return java.util.Collections.emptyList();
        }
    }

"""
if "public static java.util.List<Emote> getAllForChannel" not in s:
    s = s.replace(picker_channel_marker, picker_support + picker_channel_marker, 1)

channel_block_old = """            if (normalized != null) {
                lastRoomId = normalized;
            }
"""
channel_block_new = """            if (normalized != null) {
                lastRoomId = normalized;
                Context context = Utils.getContext();
                if (context != null) {
                    CATALOG.ensureLoaded(context, normalized);
                }
            }
"""
if channel_block_old not in s:
    raise RuntimeError("EmoteSupport channel normalization block changed.")
s = s.replace(channel_block_old, channel_block_new, 1)

init_old = """    public static void init(Context context) {
        appContext = context.getApplicationContext();
    }
"""
init_new = """    public static void init(Context context) {
        appContext = context.getApplicationContext();
        try {
            CATALOG.ensureLoaded(appContext, lastRoomId);
        } catch (Throwable ignored) {
        }
    }
"""
if init_old in s:
    s = s.replace(init_old, init_new, 1)

s = s.replace(
    "                    new CenteredImageSpan(textView, drawable),",
    """                    new CenteredImageSpan(
                            textView,
                            drawable,
                            emote.zeroWidth && Settings.EMOTES_ZERO_WIDTH.get()
                    ),""",
    1,
)

support.write_text(s)

proguard = ROOT / "extensions/proguard-rules.pro"
s = proguard.read_text()
if "-keep class app.morphe.extension.twitch.emotes.** { *; }" not in s:
    s += "\n# Kizu third-party emote renderer (adapted from hoomans-morphe-patches).\n"
    s += "-keep class app.morphe.extension.twitch.emotes.** { *; }\n"
if "-keep class io.github.bakwudo.uyu.extension.settings.** { *; }" not in s:
    s += "\n# Kizu settings classes.\n"
    s += "-keep class io.github.bakwudo.uyu.extension.settings.** { *; }\n"
proguard.write_text(s)

# Keep Uyu's tested channel-points and danmaku modules. Kizu exposes their
# existing runtime settings in its own settings screen.

p = settings_dst / "SettingsPatch.java"
s = p.read_text().replace(
    'public static final String TITLE = "uyu";',
    'public static final String TITLE = "Kizu";',
)
p.write_text(s)

p = settings_dst / "Setting.java"
s = p.read_text().replace(
    'public static final String PREFERENCES_NAME = "uyu_settings";',
    'public static final String PREFERENCES_NAME = "kizu_settings";',
)
p.write_text(s)

internal_patches = [
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/ads/BlockAdsPatch.kt",
     "blockAdsPatch"),
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/appearance/HidePromotionsPatch.kt",
     "hidePromotionsPatch"),
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/login/FixLoginPatch.kt",
     "fixLoginPatch"),
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/notifications/FixNotificationsPatch.kt",
     "fixNotificationsPatch"),
]
for path, symbol in internal_patches:
    s = path.read_text()
    pattern = rf'@Suppress\("unused"\)\nval {symbol} = bytecodePatch\(.*?\n\) \{{\n    compatibleWith'
    replacement = f'internal val {symbol} = bytecodePatch {{\n    compatibleWith'
    s, count = re.subn(pattern, replacement, s, count=1, flags=re.S)
    if count != 1:
        raise RuntimeError(f"Could not internalize {symbol}")
    path.write_text(s)

# Hide Uyu's standalone Twitch features from Morphe's public patch list.
# They remain available to the bundled implementation, but are not exposed as
# separate Morphe selections; Twitch Enhancement is the sole public Twitch patch.
for path, symbol in [
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/channelpoints/AutoClaimChannelPointsPatch.kt",
     "autoClaimChannelPointsPatch"),
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/danmaku/DanmakuCommentsPatch.kt",
     "danmakuCommentsPatch"),
    (ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/separateapp/SeparateAppPatch.kt",
     "separateAppPatch"),
]:
    text = path.read_text()
    needle = f'val {symbol} ='
    if needle not in text:
        raise RuntimeError(f"Could not locate public patch {symbol}")
    text = text.replace(needle, f'internal val {symbol} =', 1)
    path.write_text(text)

# --- Emote picker (global third-party emotes in the native picker) -----------

(emote_patch_dst / "EmotePickerFingerprints.kt").write_text(
    Path("twitch-build/EmotePickerFingerprints.kt").read_text()
)
(emote_patch_dst / "EmotePickerPatch.kt").write_text(
    Path("twitch-build/EmotePickerPatch.kt").read_text()
)
(emote_ext_dst / "EmotePickerBridge.java").write_text(
    Path("twitch-build/EmotePickerBridge.java").read_text()
)

_picker_catalog = emote_ext_dst / "EmoteCatalog.java"
_ps = _picker_catalog.read_text()
if "getAllForChannel" not in _ps:
    _needle = "    private void schedule"
    if _needle not in _ps:
        raise RuntimeError("EmoteCatalog: could not find schedule() to inject picker accessor.")
    _accessor = """    public java.util.List<Emote> getAllForChannel(String channelId) {
        java.util.LinkedHashMap<String, Emote> unique = new java.util.LinkedHashMap<>();

        if (channelId != null) {
            ChannelState channel = getChannel(channelId, false);
            if (channel != null) {
                if (Settings.EMOTES_7TV.get()) {
                    for (Emote emote : channel.sevenTv.emotes.values()) {
                        if (!unique.containsKey(emote.name)) unique.put(emote.name, emote);
                    }
                }
                if (Settings.EMOTES_BTTV.get()) {
                    for (Emote emote : channel.betterTtv.emotes.values()) {
                        if (!unique.containsKey(emote.name)) unique.put(emote.name, emote);
                    }
                }
                if (Settings.EMOTES_FFZ.get()) {
                    for (Emote emote : channel.ffz.emotes.values()) {
                        if (!unique.containsKey(emote.name)) unique.put(emote.name, emote);
                    }
                }
            }
        }

        if (Settings.EMOTES_7TV.get()) {
            for (Emote emote : globalSevenTv.emotes.values()) {
                if (!unique.containsKey(emote.name)) unique.put(emote.name, emote);
            }
        }
        if (Settings.EMOTES_BTTV.get()) {
            for (Emote emote : globalBetterTtv.emotes.values()) {
                if (!unique.containsKey(emote.name)) unique.put(emote.name, emote);
            }
        }
        if (Settings.EMOTES_FFZ.get()) {
            for (Emote emote : globalFfz.emotes.values()) {
                if (!unique.containsKey(emote.name)) unique.put(emote.name, emote);
            }
        }
        return new java.util.ArrayList<>(unique.values());
    }

    private void schedule"""
    _ps = _ps.replace(_needle, _accessor, 1)
    _picker_catalog.write_text(_ps)

_enh = ROOT / "patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/enhancement/EnhancementPatch.kt"
_es = _enh.read_text()

# Keep all third-party emote patch stages enabled together.
_import_anchor = "import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotesPatch\n"
_imports = (
    "import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerPatch\n"
    "import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerUrlPatch\n"
    "import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmoteAutocompletePatch\n"
)
if "import io.github.bakwudo.uyu.patches.twitch.emotes.thirdPartyEmotePickerPatch\n" not in _es:
    _es = _es.replace(_import_anchor, _imports + _import_anchor, 1)

_dep_anchor = "        thirdPartyEmotesPatch,\n"
_deps = (
    "        thirdPartyEmotePickerPatch,\n"
    "        thirdPartyEmotePickerUrlPatch,\n"
    "        thirdPartyEmoteAutocompletePatch,\n"
)
if "        thirdPartyEmotePickerPatch,\n" not in _es:
    _es = _es.replace(_dep_anchor, _dep_anchor + _deps, 1)

_enh.write_text(_es)

_pp = ROOT / "extensions/proguard-rules.pro"
_px = _pp.read_text()
if "-keep class app.morphe.extension.twitch.emotes.EmotePickerBridge" not in _px:
    _px += "\n-keep class app.morphe.extension.twitch.emotes.EmotePickerBridge { *; }\n"
    _pp.write_text(_px)

# Project / bundle identity.
p = ROOT / "settings.gradle.kts"
p.write_text(p.read_text().replace('rootProject.name = "uyu"', 'rootProject.name = "kizu"'))

p = ROOT / "patches/build.gradle.kts"
s = p.read_text()
s = s.replace('group = "io.github.bakwudo.uyu"', 'group = "io.github.k8r8to.kizu"')
s = 'version = "' + os.environ.get("KIZU_VERSION", "0.3.0") + '"\n\n' + re.sub(r'^version = ".*?"\n\n', '', s)
s = s.replace('name = "uyu"', 'name = "Kizu"')
s = s.replace(
    'description = "Patches for Twitch: channel points auto claim, Niconico-style scrolling comments and ad blocking."',
    'description = "Kizu enhancements for the Android Twitch app, based on uyu and hooman-morphe-patches."',
)
s = s.replace('source = "git@github.com:bakwudo/uyu.git"',
              'source = "https://github.com/K8R8TO/boost-randnsfw-patch"')
s = s.replace('author = "bakwudo"', 'author = "K8R8TO"')
s = s.replace('contact = "https://github.com/bakwudo/uyu/issues"',
              'contact = "https://github.com/K8R8TO/boost-randnsfw-patch/issues"')
s = s.replace('website = "https://github.com/bakwudo/uyu"',
              'website = "https://github.com/K8R8TO/boost-randnsfw-patch"')
s += """
tasks.withType<org.gradle.jvm.tasks.Jar>().configureEach {
    archiveBaseName.set("kizu")
}
"""
p.write_text(s)
