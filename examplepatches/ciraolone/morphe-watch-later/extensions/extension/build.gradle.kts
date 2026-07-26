// Configurazione dell'estensione: il codice Java che viene fuso dentro YouTube.
// Oltre al normale build Android serve la generazione delle classi protobuf a partire dai file
// .proto in src/main/proto — sono quelle che permettono di leggere e riscrivere le voci della
// barra di navigazione. Si usa la variante "lite" di protobuf perche' e' quella che YouTube
// stessa usa: con la variante completa le classi generate non sarebbero compatibili.

plugins {
    alias(libs.plugins.protobuf)
}

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.ciraolone.extension"
}

dependencies {
    implementation(libs.protobuf.javalite)
}

protobuf {
    protoc {
        artifact = libs.protobuf.protoc.get().toString()
    }
    generateProtoTasks {
        all().forEach { task ->
            task.builtins {
                create("java") {
                    option("lite")
                }
            }
        }
    }
}
