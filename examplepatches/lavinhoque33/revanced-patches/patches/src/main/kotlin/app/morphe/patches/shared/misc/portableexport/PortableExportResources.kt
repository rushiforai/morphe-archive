/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.patches.shared.misc.portableexport

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.copyXmlNode

internal val portableExportResources = resourcePatch {
    execute {
        copyXmlNode("shared/portableexport", "values/strings.xml", "resources")
    }
}
