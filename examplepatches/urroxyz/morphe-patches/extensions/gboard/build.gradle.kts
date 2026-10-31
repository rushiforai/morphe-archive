extension { name = "extensions/gboard.mpe" }
android { namespace = "xyz.urro.gboard" }
configurations.configureEach { exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib") }
