/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.autoadvance

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** The story viewer, which Redex leaves under its own name. */
internal const val STORY_VIEWER = "Linstagram/features/stories/fragment/ReelViewerFragment;"

/**
 * The story viewer's handler for a story item that's done, the one that moves on to the next. It
 * implements a listener method taking the item as an Object, so the compiler made it a bridge.
 * The viewer has two such bridges taking one Object on 449, and both cast it to a ReelItem first;
 * this one holds "userSession", the other doesn't.
 */
internal object StoryItemDoneFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("userSession"),
    custom = { method, classDef ->
        classDef.type == STORY_VIEWER && AccessFlags.BRIDGE.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
    },
)
