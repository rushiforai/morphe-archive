extension { name = "extensions/nuvio-metadata-addon.mpe" }
android { namespace = "software.santodan.extension.nuviometadata" }
dependencies {
    compileOnly(project(":nuvio-contracts"))
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}
