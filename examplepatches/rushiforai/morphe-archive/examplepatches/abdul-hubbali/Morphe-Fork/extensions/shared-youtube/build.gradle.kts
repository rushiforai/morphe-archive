dependencies {
    implementation(project(":extensions:shared-youtube:library"))
}

extension {
    name = "extensions/shared-youtube.mpe"
}

android {
    buildTypes {
        release {
            // 'libj2v8.so' is already included in the patch.
            ndk {
                abiFilters.add("")
            }
        }
    }
}
