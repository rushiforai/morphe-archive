extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.aimal.extension"
}

// No dependencies on purpose. Everything in this extension is built from
// android.* framework classes and reflection, so the merged dex stays small
// and does not have to line up with whichever support library versions a
// target app happens to ship.
