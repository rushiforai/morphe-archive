extension { name = "extensions/videoland-profile.mpe" }
android { namespace = "nl.johninnl.patches.videoland.profile" }

configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }
