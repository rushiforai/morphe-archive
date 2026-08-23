package dev.jason.gboardpatches.tools.bindings

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path

object TargetBindingGenerator {
    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 2) { "Expected profile input and Kotlin output paths" }
        val profile = Path.of(args[0])
        val output = Path.of(args[1])
        val projection = TargetBindingCompiler.compile(Files.readString(profile, StandardCharsets.UTF_8))
        Files.createDirectories(output.parent)
        Files.writeString(output, projection.kotlinSource, StandardCharsets.UTF_8)
    }
}
