import com.android.apksig.ApkVerifier
import java.io.File
import java.security.MessageDigest

fun main() {
    val apkFile = File("tantan-tribe-extracted/com.tantantribe.tribe.apk")
    
    val verifier = ApkVerifier.Builder(apkFile).build()
    val result = verifier.verify()
    
    if (result.isVerified) {
        println("APK is verified")
        val signers = result.signers
        for (signer in signers) {
            val cert = signer.certificate
            val digest = MessageDigest.getInstance("SHA-256")
            val hash = digest.digest(cert.encoded)
            val hexHash = hash.joinToString("") { "%02x".format(it) }
            println("SHA-256: $hexHash")
        }
    } else {
        println("APK verification failed")
        result.errors.forEach { println("Error: $it") }
    }
}
