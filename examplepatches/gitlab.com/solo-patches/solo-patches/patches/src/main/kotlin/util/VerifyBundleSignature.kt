package util

import app.morphe.patcher.patch.PatchBundleSignature
import java.io.File

fun main(args: Array<String>) {
    require(args.size == 2) { "Usage: VerifyBundleSignature <bundle.mpp> <public-key-file>" }
    val signer = PatchBundleSignature.verify(File(args[0]))
    require(signer != null && signer == File(args[1]).readText().trim()) {
        "Bundle signature is missing or does not match the published key"
    }
    println("PASS: bundle signature verifies against the published key")
}
