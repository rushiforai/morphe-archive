package app.diskwala.patches.ad

// This file is intentionally left as documentation for alternative resource-level ad hiding.
// If bytecode stubbing is not desired, you can use a rawResourcePatch to delete ad assets:
//
// val hideAdResourcesPatch = rawResourcePatch(
//     name = "Hide ad resources",
//     description = "Deletes ad drawables and assets.",
//     default = false
// ) {
//     compatibleWith(COMPATIBILITY_DISKWALA)
//     execute {
//         // Examples - uncomment to enable
//         // delete("assets/iads/index.js")
//         // delete("assets/ad-viewer/omsdk-v1.js")
//         // delete("res/drawable/bigo_ad_*.xml")
//     }
// }
