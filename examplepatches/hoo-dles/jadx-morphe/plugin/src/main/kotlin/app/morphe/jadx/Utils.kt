package app.morphe.jadx

import java.io.File
import java.nio.ByteBuffer
import java.nio.channels.FileChannel
import java.nio.file.StandardOpenOption
import java.security.MessageDigest

// returns hex string of SHA-1
fun hashFile(file: File): String {
    val digest = MessageDigest.getInstance("SHA-1")

    FileChannel.open(file.toPath(), StandardOpenOption.READ).use { channel ->
        val buffer = ByteBuffer.allocateDirect(64 * 1024)
        while (channel.read(buffer) > 0) {
            buffer.flip()
            digest.update(buffer)
            buffer.clear()
        }
    }

    return digest.digest().toHexString()
}