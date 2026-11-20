/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4764
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.patches;

/** Implemented by the app's media header class when the Mobile Web bridge is available. */
public interface MediaHttpHeader {
    String patch_getName();
}
