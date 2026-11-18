pluginManagement { repositories { gradlePluginPortal(); mavenCentral(); google() } }
dependencyResolutionManagement { repositories { mavenCentral(); google() } }
rootProject.name = "swiftkey-clipboard-patches"
include(":patches", ":extensions:swiftkey", ":catalog")
