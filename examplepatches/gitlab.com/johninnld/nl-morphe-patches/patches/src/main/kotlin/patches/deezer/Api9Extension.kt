package patches.deezer

import patches.shared.CarAppExtension
import patches.shared.carAppExtension

internal typealias Api9Extension = CarAppExtension

/** R8 consumer keep rules retain some dependency names. Relocate those definitions AND
 * every reference before merging; external compat token classes are deliberately absent
 * from this map and continue to use Deezer's real Parcelable ABI across the host boundary. */
internal fun api9Extension(): Api9Extension = carAppExtension(
    resource = "/extensions/deezer-auto.mpe",
    label = "Deezer",
    ownNamespace = "Lnl/johninnl/deezer/auto/",
)
