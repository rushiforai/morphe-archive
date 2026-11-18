pluginManagement { repositories { gradlePluginPortal(); mavenCentral(); google() } }
dependencyResolutionManagement { repositories { mavenCentral(); google() } }
rootProject.name = "swiftkey-clean-patches"
include(":patches", ":extensions:swiftkey", ":catalog")
