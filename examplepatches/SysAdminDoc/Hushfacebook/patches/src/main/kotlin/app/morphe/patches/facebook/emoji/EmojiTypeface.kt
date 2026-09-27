/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.emoji

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/**
 * The end-to-end flag Facebook's screenshot tests set to draw the phone's emoji font instead of
 * Meta's. The emoji typeface provider reads it first thing, and no other method of the app loads it.
 */
internal const val FORCE_SYSTEM_EMOJI_FONT = "fb.e2e.force_system_emoji_font"

/** The provider's log tag, the class name Redex took away, kept as a literal in the same method. */
internal const val EMOJI_TYPEFACE_PROVIDER = "FacebookEmojiTypefaceProviderImpl"

internal const val TYPEFACE = "Landroid/graphics/Typeface;"

/**
 * Whether [method] is Facebook's emoji typeface provider: an instance method that takes nothing,
 * answers a Typeface and holds both the end-to-end flag and the provider's log tag.
 *
 * On 580 and 577 it answers a typeface read from /system/fonts/NotoColorEmoji.ttf when the flag is
 * set, and otherwise Meta's FacebookEmoji.ttf from the downloaded-font loader, or null while that
 * font isn't on the phone yet. The emoji spans of the text pipeline, the emoticon spans and the
 * pickers' emoji drawables all take their typeface from it, and it's the only method that reads
 * the holders the font is loaded into (EmojiProviderFixtureTest).
 */
internal fun isEmojiTypefaceProvider(method: Method): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() &&
        method.returnType == TYPEFACE && method.implementation != null &&
        holdsString(method, FORCE_SYSTEM_EMOJI_FONT) && holdsString(method, EMOJI_TYPEFACE_PROVIDER)
