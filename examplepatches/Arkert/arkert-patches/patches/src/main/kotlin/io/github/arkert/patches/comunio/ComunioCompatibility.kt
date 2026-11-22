
package io.github.arkert.patches.comunio

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val comunioCompatibility = Compatibility(
    name = "Comunio",
    packageName = "de.herrenabend_sport_verein.comuniodroid",
    targets = listOf(
        AppTarget(
            version = "1.12.86"
        )
    )
)
