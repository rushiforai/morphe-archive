package app.twrailway.patches.settings

import app.morphe.patcher.Fingerprint

/**
 * `FlutterLoader.ensureInitializationComplete(Context, String[] args)` of the Flutter embedding.
 * It runs once before the Flutter engine starts, and builds the engine's arguments from `args`.
 */
internal object FlutterLoaderEnsureInitializationCompleteFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "[Ljava/lang/String;"),
    strings = listOf("FlutterLoader#ensureInitializationComplete"),
)

/**
 * `DartMessenger.handleMessageFromDart(String channel, ByteBuffer message, int replyId, long messageData)`
 * of the Flutter embedding, which receives every platform channel message Dart sends.
 */
internal object DartMessengerHandleMessageFromDartFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/nio/ByteBuffer;", "I", "J"),
    strings = listOf("Received message from Dart over channel '"),
)
