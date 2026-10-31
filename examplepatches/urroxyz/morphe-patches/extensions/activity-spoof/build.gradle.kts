extension { name = "extensions/activity-spoof.mpe" }
android { namespace = "xyz.urro.activityspoof" }
configurations.configureEach { exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib") }
