package app.venus.patches

import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest
import java.nio.ByteBuffer
import java.nio.ByteOrder

/** Exact, inspected HBC98 functions. No eval, runtime hook, remote loader or settings dependency. */
internal object HbcPrivacy {
    const val ORIGINAL_SHA256 = "0f2e1735fc0ed5d7f7068aaae8cfb603987a346584b3eea0fd8790df38e2a8b2"
    data class Target(val id: Int, val name: String, val offset: Int, val size: Int,
                      val header: String, val sha256: String, val promise: Boolean, val expandedHeaderHash: String)
    private fun toHex(bytes: ByteArray): String {
        val hex = "0123456789abcdef"
        val out = CharArray(bytes.size * 2)
        for (i in 0 until bytes.size) {
            val v = bytes[i].toInt() and 255
            out[i * 2] = hex[v ushr 4]
            out[i * 2 + 1] = hex[v and 15]
        }
        return String(out)
    }
    fun digest(bytes: ByteArray, algorithm: String = "SHA-256") =
        toHex(MessageDigest.getInstance(algorithm).digest(bytes))
    fun hex(value: String): ByteArray {
        val len = value.length / 2
        val out = ByteArray(len)
        for (i in 0 until len) {
            val hi = Character.digit(value[i * 2], 16)
            val lo = Character.digit(value[i * 2 + 1], 16)
            out[i] = ((hi shl 4) or lo).toByte()
        }
        return out
    }
    fun verifyOriginal(bytes: ByteArray) {
        require(digest(bytes) == ORIGINAL_SHA256) {
            "Unsupported Discord JavaScript bundle; use the original 350.8 - Stable APKM"
        }
    }
    /** Same check, streamed: never holds the 55 MB bundle in memory on the patching device. */
    fun verifyOriginal(file: File) {
        require(streamDigest(file, "SHA-256", file.length()) == ORIGINAL_SHA256) {
            "Unsupported Discord JavaScript bundle; use the original 350.8 - Stable APKM"
        }
    }
    private fun streamDigest(file: File, algorithm: String, length: Long): String =
        toHex(streamDigestBytes(file, algorithm, length))
    private fun streamDigestBytes(file: File, algorithm: String, length: Long): ByteArray {
        val digest = MessageDigest.getInstance(algorithm)
        file.inputStream().use { input ->
            val buffer = ByteArray(1 shl 20)
            var left = length
            while (left > 0) {
                val read = input.read(buffer, 0, minOf(buffer.size.toLong(), left).toInt())
                if (read < 0) break
                digest.update(buffer, 0, read)
                left -= read
            }
        }
        return digest.digest()
    }

    // HBC98 opcodes (Hermes 250829098 BytecodeList.def) and the pinned bundle's string IDs.
    const val OP_NEW_OBJECT = 4; const val OP_GET_GLOBAL = 61; const val OP_GET_BY_ID = 69; const val OP_TRY_GET_BY_ID = 72
    const val OP_CALL1 = 108; const val OP_CALL2 = 110; const val OP_RET = 118
    const val OP_LOAD_PARAM = 137; const val OP_LOAD_CONST_STRING = 144; const val OP_LOAD_UNDEFINED = 147; const val OP_LOAD_FALSE = 150
    /** String table IDs of "Promise", "resolve" and "" in the pinned 350.8 bundle. */
    const val PROMISE_ID = 29; const val RESOLVE_ID = 29738; const val EMPTY_STRING_ID = 255
    private fun bytes(vararg values: Int) = ByteArray(values.size) { values[it].toByte() }
    // GetGlobalObject r6; TryGetById r7,r6,cache0,Promise; GetById r8,r7,cache1,resolve; Call1 r6,r8,r7; Ret r6.
    // r6+ are GC-visible pointer-capable registers in all inspected Promise targets;
    // r0..r5 can be reserved number/non-pointer registers in Hermes V1.
    // Keep the Promise contract of track()/drain()/send(); do not return undefined to .then() callers.
    val resolvedPromise = bytes(OP_GET_GLOBAL, 6, OP_TRY_GET_BY_ID, 7, 6, 0, PROMISE_ID and 255, PROMISE_ID ushr 8,
        OP_GET_BY_ID, 8, 7, 1, RESOLVE_ID and 255, RESOLVE_ID ushr 8, OP_CALL1, 6, 8, 7, OP_RET, 6)
    // Match Sentry's own empty-envelope branch: Promise.resolve({}), not an undefined response.
    // NewObject is opcode 4. 1.3.6 and earlier wrote 9 (NewFastArray), which made the rest of the stub misdecode.
    val resolvedEmptyObject = bytes(OP_GET_GLOBAL, 6, OP_TRY_GET_BY_ID, 7, 6, 0, PROMISE_ID and 255, PROMISE_ID ushr 8,
        OP_GET_BY_ID, 8, 7, 1, RESOLVE_ID and 255, RESOLVE_ID ushr 8, OP_NEW_OBJECT, 9, OP_CALL2, 6, 8, 7, 9, OP_RET, 6)
    val returnFalse = bytes(OP_LOAD_FALSE, 6, OP_RET, 6)
    val returnEmptyObject = bytes(OP_NEW_OBJECT, 6, OP_RET, 6)
    val returnEmptyString = bytes(OP_LOAD_CONST_STRING, 6, EMPTY_STRING_ID and 255, EMPTY_STRING_ID ushr 8, OP_RET, 6)
    // LoadConstUndefined r6; LoadParam r7, 2; Call1 r6, r7, r6; Ret r6 (invokes callback parameter directly).
    val callParam2 = bytes(OP_LOAD_UNDEFINED, 6, OP_LOAD_PARAM, 7, 2, OP_CALL1, 6, 7, 6, OP_RET, 6)
    val returnUndefined = bytes(OP_LOAD_UNDEFINED, 6, OP_RET, 6) // LoadConstUndefined r6; Ret r6.
    private val falseTargets = setOf("shouldCollectMetrics", "isTracing", "shouldRun", "isZoomedExperimentEnabled",
        "isJankScreenReportingEnabled", "isNavigationTTIEnabled", "recordComponentSpan",
        "isClickstreamEnabled", "clickstreamExperimentEnabled")
    private val emptyObjectTargets = setOf("expandEventProperties", "getLocation", "getReadyPayloadByteSizeAnalytics")
    private val emptyStringTargets = setOf("captureException", "captureCrash")
    fun stub(target: Target) = when {
        target.name in falseTargets -> returnFalse
        target.name in emptyObjectTargets -> returnEmptyObject
        target.name in emptyStringTargets -> returnEmptyString
        target.name == "timeRequire" -> callParam2
        !target.promise -> when (target.name) {
            "startRecordingAnalyticsEvents" -> bytes(OP_LOAD_UNDEFINED, 1, OP_RET, 1)
            "trackCrash" -> bytes(OP_LOAD_UNDEFINED, 8, OP_RET, 8)
            "recordLateComponentLayout" -> bytes(OP_LOAD_FALSE, 7, OP_RET, 7)
            else -> returnUndefined
        }
        target.name == "send" -> resolvedEmptyObject
        else -> resolvedPromise
    }
    // Hermes shares one body between functions with identical bytecode. Every target here owns its body:
    // trackAppUIViewed2 shared createThread_'s (forum posts, #93), trackHeartbeat shared poll-vote and
    // stage-join code, and the module-2 Set.add and Date.now() closures shared other modules' helpers.
    val analytics = listOf(
        Target(35581, "increment", 30147218, 96, "cca61c0000c0000000000020", "59f1a4030ec100019686ea20f7fc75c6043c990d79e24cc02a1249269de4f778", false, "dba1f63c70f37f46c7be14fcc46618cff42224bcbcf717f637fa0a34012481ec"),
        Target(35582, "distribution", 30147314, 114, "f8a61c0000c0000000000020", "5d0d2cb65176bfe8ef92d529c04c05ff11618dd065c2af4e842379ea3610b300", false, "ac75c8f26a484b45360f476135af93122a2056da2c8f9e9e7281206e89e82bda"),
        Target(35583, "_flush", 30147428, 183, "24a71c0000c0000000000020", "79c29bbcea98876a41923c847d1087ebb947836c3d1c759fef73c0ef9c7f14b6", false, "c318e9d37284f8d8f22338e9c71f51e6cb01b03aad18f553d4bb4486d83e33f9"),
        Target(24188, "track", 28815724, 288, "700a150000c0000000000020", "644c450d65e3932401e688fa2e75468cba555bf910bc835842cd179716c3cefd", true, "897bdb1ef6f23285d5802f827cc4372d19c75d908429ab60c7fcf137f1add4b1"),
        Target(85418, "track", 43385757, 544, "e01d3e0000c0000000000020", "a1eedbf7191d885d3332c05e2057d15bc130721c4f627495621506fc1b3be788", true, "86a1b57e2fd1bb428f0c27af69261a69f03027beab43f2f0ee2d97521cc529ad"),
        Target(85422, "drainEventsQueue", 43386453, 249, "8c1e3e0000c0000000000020", "b698ad78772e681bad63c1f04db79bb876b559ab0c877a1c4745651b8e4d0011", true, "abedc192c38755259e28555616abc8c21e9d62bc4bd46fe7ae31c0460b22bd10"),
        Target(85423, "submitEventsImmediately", 43386702, 251, "b81e3e0000c0000000000020", "135803803fba06a6e4bc0714d72ae75adf7c0f906130cb7fa9010e704d47d152", true, "3863cc6614485938fea18fc88fc6784773ff4a56bd0b09978e82f58690f73d14"),
        Target(85424, "flushQueuedEvents", 43386953, 267, "e41e3e0000c0000000000020", "f141bf19f46cb8c52747ea0026ee897b28ecc9d8df46af52cdb3ab4fb72bddc6", true, "a35499249fdd220c621ebfaf072e1eb63564e1966f375a3a6b11f16ce255dc3f"),
        Target(85425, "sendTelemetryEvent", 43387220, 347, "101f3e0000c0000000000020", "d3445b22cedfdf75f5df3ff7dce52f3fb7034ca89444096578b2fbf99e020c5f", true, "17e489a8a9ed1abca5b974b445d7f5398d8e2f6afd537d81b56b7475b21b3ca2"),
        Target(85421, "scheduleDrain", 43386301, 152, "601e3e0000c0000000000020", "12da215e9bd8e682999395689ff2e0f6a81a3e9d077c2b3a6051889e46631112", false, "24ff3e9934f921a24cb1946d5aed37542249a4dd2fc9b0147d4d5554b55a9bb4"),
        Target(24191, "startRecordingAnalyticsEvents", 28816048, 13, "f00a150000c0000000000020", "645fedb3791434b0327d0906ba36e9092b6011627c08db439b28a0b7415f2037", false, "37e46bdb001425866bcaaf32ad73eca626cf028007393e6ebdd73813b14a82ff"),
        Target(24123, "addBreadcrumb", 28813961, 84, "88ff140000c0000000000020", "1bb2ae30428f6018a639d8423102678de7b488265125541a2259e830bb3a722d", false, "5d1988472022690f1bbaa9d992ae62471185704c23e9d61e6bdea8aeec5cf2be"),
        Target(24124, "expandEventProperties", 28814045, 712, "b4ff140000c0000000000020", "d7c7dfe8d59461be1f32fd9e8637c6951dddcc56db74f136c0069acdada753ef", false, "18c0aeae4b7549a3c551085d7010185344d1a0c80b9e3baa2fb93f51dd1bf021"),
        Target(24125, "debugLogEvent", 28814757, 79, "e0ff140000c0000000000020", "f96a83e4d1b24eb94713cc158c44a214289e0488c6522780f831671b30b05d33", false, "93b9ab0a30c614cddeb4a594d28ff1714de14e9762f3b6920ed142662e1ba7d5"),
        Target(24196, "trackNetworkAction", 28816155, 131, "c00b150000c0000000000020", "dec2261c24075c09c55ac6cafa715d662e4b0e226a7fda2c8a31fac113b50fb4", false, "0dd623226d369353f13c762200980405d2faa6befa1b3bea3d19fa22afe56804"),
        Target(24199, "setCurrentImpression", 28816320, 52, "180c150000c0000000000020", "529ecc2f93582fbe28dc6df1bf8df7b687ce17c47997300da8ee7730f54c7c50", false, "1f80b1dfef98de3680371d111577817d727a5e5762faae45f5c623154a712506"),
        Target(24200, "cleanupImpression", 28816372, 52, "440c150000c0000000000020", "716a4fa499ab1691be4226a7a188020c5770cec5f412bf3ce27692481a6a7d5a", false, "4bd2a9edb2ede2fef03f9de1c279301f6fda4c0a6615c3c0a1dc62e9c58fb70f"),
        Target(24201, "setDebugTrackedData", 28816424, 59, "700c150000c0000000000020", "a1157df804db2cf4db60589c0427e994e6abdc85e7940646bab4a71de724a62b", false, "1e566ed9378ffb594814b9ed3eddf9abc953b28df7d66279d99efa17487f2060"),
        Target(24202, "getLocation", 28816483, 51, "9c0c150000c0000000000020", "eca87ac72ee3e2ea9eafaf56bfe07d57d7de1f173d278c3e8ad830c2f6521afc", false, "640eb296b76f0500f2c5ee577bbbaf85f78e05635ccd672497d5596392d7932e"),
        Target(41734, "_trackHeartbeat", 31099198, 61, "dccd200000c0000000000020", "df1ccf63eddc95d1f2aa215417887fc26327edc4a246214d511c863a4e18844d", false, "8ed4ffcf42962a02f80ce20c770fb2a17f1d2db42d6980424034f56aca0690b2"),
        Target(41754, "isClickstreamEnabled", 31101420, 115, "44d1200000c0000000000020", "645c917249a06b5466f314703015dd2a484abeb4742640596e5e2869ff2c5d5e", false, "e26a665cfc17a2caeb88a7152efe96aed48252e8210cedbcddbbb63583e03880"),
        Target(41757, "clickstreamExperimentEnabled", 31101931, 35, "d8d1200000c0000000000020", "d0d65c42f946e3f17c0e8a281dbd9c0be58fd2f299832e8424626e5ddf6ed221", false, "2e89420c97832d6b40a083c286a4615c89df2232f8c0318c39ab9b45d9aee292"),
        Target(49336, "trackImpression", 32530591, 398, "bce4250000c0000000000020", "f50ab4baf2bf0555f4664c491dafce0c0080741c376cf2327cc349a8dc741dfe", false, "3efee175a90d27f7d60d3f04d97f6754ad50351d962686be24dc3639f399ebf4"),
        Target(49337, "useTrackImpression", 32530989, 382, "e8e4250000c0000000000020", "ec42659952276c540bf1fc5ef7a93956f627f69bb3d0626afccc422e77d37272", false, "668adfa51cef023e838530c6d6c476db9b08d3dd1f382beb39ace5d52e2691d2"),
        Target(49338, "useTrackImpression", 32531371, 131, "14e5250000c0000000000020", "37560496146a1c4c223991f08b34498dc56c2527e6442d2f067cc9c6ab999588", false, "ef9e1f13af8e45526d8dfb561367de37cb7ebc4a37fc0e97da9a06614b79d1d1"),
        Target(59315, "trackSearchOpened", 35372403, 206, "0ca72c0000c0000000000020", "2d1c49434f6eca66d3ea28ba80251a3079e9156681db417c0a28c9fa6c8a6465", false, "3680c55abd5481719834cbd13ba69573e5d09e389f490047b683710680a15d52"),
        Target(59316, "trackSearchStarted", 35372609, 324, "38a72c0000c0000000000020", "492be2bb7580a273b3a2fadf81e368d7a1311149a70321c16a7f7237aa695947", false, "f5e2f27d3737873b97d874bc8a1e0fdf666dfae9460e0271a448ab943f4bb3a8"),
        Target(59317, "trackSearchResultClicked", 35372933, 431, "64a72c0000c0000000000020", "43a80def0aeade469b4706d63dbfdf56d14324a96ecfb70d65df329a49ce6778", false, "cc937bcbef486548bc84e59c5cb314a7b63be756c24b963e50f535f109d11b6e"),
        Target(59318, "trackSearchResultReturned", 35373364, 415, "90a72c0000c0000000000020", "6fbdda5cae732637da6583ac67d32f1ffe105e46123d956c5b8fe2bbfe243bb5", false, "7821b660afc9e02cd9addb81d261c2e8be48f940b00d5ac268693f7f2f089f38"),
        Target(59319, "trackSearchEmptyResult", 35373779, 302, "bca72c0000c0000000000020", "d248fc7a6225d12836c432bf2a9e7041ae788294b8a087ac9eac14166d9c6557", false, "9ae466d0e06261e2f59cc3df0d234cbe0b57bfdb1379f02eb54ef19dff801f93"),
        Target(59320, "trackSearchEmptyMessageResult", 35374081, 302, "e8a72c0000c0000000000020", "9752292c36c6d1666ea4838ce066e80a277858138133d0dd83c86e192f4fbe02", false, "8280d7cc30c1e710d311576bb99f5e3c0d9f373bd0f3f6d6080b1baa215b4a0f"),
        Target(59321, "trackSearchClosed", 35374383, 73, "14a82c0000c0000000000020", "aec41e0a7498a5ab56acde3b2e87f6be8f0c781e39f4823024c3b7bb17b98ebc", false, "5eadc6edb10d506fd6d394d227083b2949c9221f7e3cd95c6a0e3736ac6bad95"),
        Target(59322, "trackSearchIndexing", 35374456, 181, "40a82c0000c0000000000020", "2687afafca6f83530c2e2e7751a39661a02b70483d30369e6ebf589b222b483b", false, "8697c2c6e40e9d85567551a64656356f95912650226abd5e63c141be3a622527"),
        Target(59323, "trackSearchHistoryClicked", 35374637, 194, "6ca82c0000c0000000000020", "7b069351771a3e1f8bd8651e40779b1652eb1c7c2ab288d035c3e8a90cd355d0", false, "b678e91e703ae8300796ef4d868a84fe17956a4a13a0ed4f0af1b3ca723f3731"),
        Target(59324, "trackSuggestedSearchClicked", 35374831, 176, "98a82c0000c0000000000020", "888b497dc82fe29fdafc956a3dcc1e165456d5946f18d3118bf43bd729f8164b", false, "a4579340eff57756a712775e6df2d3ec03c941090e33dfcf22b6c5b599c250cd"),
        Target(59325, "trackSearchFilterAdd", 35375007, 298, "c4a82c0000c0000000000020", "1f2e9d1659a4181e3ff8d60ca9dc6c77d9ec36678afc667161608e449cd87b2a", false, "a3a0d6f6919084ad129e64f273573c503ce376ad89dc3e76c31a5d389f673363"),
        Target(59326, "trackSearchFilterRemove", 35375305, 299, "f0a82c0000c0000000000020", "e8211714b0d705cf679c5cbc83d2b4965c409ee3d33b5816e2b8f4e12124e7d0", false, "f9790817444a8e1c4a0c67a9bc33aa68719eb382d95a238525e712977eafcec2"),
        Target(59327, "trackSearchTabSelected", 35375604, 161, "1ca92c0000c0000000000020", "96d1a171e8bab57405c06926102d5d1a6822770f952081532566dba743a3b1b4", false, "55453c4e4900fa4e599f211403ed50ce0346e38b3e7e2cc953df12b4dc5bda62"),
        Target(65609, "logReadyPayloadReceived", 37378748, 509, "dcde300000c0000000000020", "e0bdb8cda6e71fb354b0ae4dc9cab41eb2cd0a173b8f728ae8a5d4da29f917da", false, "e458e18860b375df17f90efc4df9705e2b8d47b0663d3b02978a89f0fb2e63a0"),
        Target(65611, "getReadyPayloadByteSizeAnalytics", 37379358, 892, "44df300000c0000000000020", "d1be6bdf916e548492abfdb73b69916f73409ad28c6563626a94a01e01015fb6", false, "3bad2e42a54aca77149ba19c6ae53c0fe639dc22b48d100ab15d72d4f9a8ebfe"),
        Target(65612, "logGatewayConnected", 37380250, 150, "70df300000c0000000000020", "28fe16fcad2a9002be8dc2c6a8247b6e8f6dcc0c39c4e8a86f266702b2053012", false, "391ff72dcc8e28080601adcd9bcc465f3256ed75f9ec9508b23971c24cbafc41"),
        Target(65614, "logResumeAnalytics", 37380467, 323, "c8df300000c0000000000020", "6abb4ffa901f22c819a4422a575cf3c02c7b6c7ceedd1fc350827feadc11694c", false, "a736532fa1b3d4ef8e5fc76bf793ccd99b6f5f173e1ac43103bfaf5c6920a4f4"),
        Target(77285, "componentDidMount", 41352283, 405, "dcbd380000c0000000000020", "f698e1ae6501e4ff9be56c12d2dcf3c18f5f02a6059c16cf70f898b1c4b23e2e", false, "5fe5d29beffe013d5cd07f1c78ebf6c60854c743c5d067a6a56fe627cadcb000"),
        Target(77286, "componentDidUpdate", 41352688, 1503, "08be380000c0000000000020", "5e0fb1747d535c5bf16e4d4c7b1b936715f7932d1594bec7f5f5de26c8389e13", false, "4172e98df5c5792062e7c38be3530b3b8d73d2df480b1aad69ecb696a949dec3"),
        Target(77288, "_trackWithMetadata", 41354241, 163, "60be380000c0000000000020", "5da792b83e95663dacde2e049567e7ab18b4526334da0e514653e78ca5b55c98", false, "fa7b744fc030945998c32b12537b0874d925bcb796ddd660858a90cdf4b4dfcd"),
        Target(79192, "_initialize", 42196619, 103, "80063a0000c0000000000020", "920faa07db61b19c1578cabe8cdd9da0d9974bf554013d6d4b3af5a90cb72c82", false, "171dbf5737e7f0d1ca03859621badd9a6599c1c6a2fd6fc0dea59f6a86d4bfb4"),
        Target(79194, "_trackStartSpeaking", 42196777, 238, "d8063a0000c0000000000020", "948f2223130478ad8acd222b2146e858c5770d4fef2487c6eda34671e23dba6e", false, "484d1bb4f60beff3689492c45018fa95003f9dbf19a579e8d93b55ee39178277"),
        Target(79195, "_trackStartListening", 42197015, 237, "04073a0000c0000000000020", "4e8619d97ef87b7aae816b382fcfd2459c64bc5471d8d331bf419acb2b6ccb2d", false, "5f895338b7fc2a102121d3d49b5d0765b6fdd81850b411ad570a5f8adbd4c2f3"),
    )
    val telemetry = listOf(
        Target(20592, "shouldCollectMetrics", 28325486, 86, "e490120000c0000000000020", "ae4becefe5a2c01dc06bd2ca6b07ba3282695d39b5c1bbc53edc564d10584255", false, "ce01fb3129cc013e055481967962f5e7acc6f86609b3a07f86e02b9d333824c7"),
        Target(81287, "installWebsocketTelemetryHook", 42894121, 183, "bc6f3b0000c0000000000020", "82ed08dce723c018f86cc2e1daf9b19e763fab65e9df247bbae9a870f3cb2775", false, "f8f0b3f263495e659e81da93688f2b38b689b8cd902711817f1ee313b8e8a773"),
        Target(26164, "append", 29146609, 88, "c85d160000c0000000000020", "c892e3d72349e9baab89ce234746d630a6b99364bb9773008bc3055849026da3", false, "b62c2bb2b4b7646012ed6a33dc3d7c1713e9da6d56a194c774a678270d5961fe"),
        Target(26167, "append", 29146759, 52, "4c5e160000c0000000000020", "5abf9daa33895948aa2a57d9344be2f36cfe2f43316633236cb8a27f319484a7", false, "d51193feb00dcc2074d4ce1aba7f817c4b3beafca0438f0e4a7ff22368041184"),
        Target(18895, "isTracing", 28078665, 79, "e86a110000c0000000000020", "0fdf55cd8af5da6431ebc7a6c138184eb915f6ddfba1de2e753c6b48f3f6e944", false, "c1397c2c8f99fddee8535aba3e89110d003a50a2545bb6930b9ec364def5d1a3"),
        Target(24069, "_initialize", 28808416, 183, "00f6140000c0000000000020", "d45352694dfbe49ceb8397d5be2bab331187e26b9714636ba20dd3ee8b98820e", false, "f36606be33f8761f68e73e80be4de014fe06c84145f1c11022ce16018834a944"),
        Target(26142, "shouldRun", 29145530, 34, "145a160000c0000000000020", "5eef3c12d384d85144a029dfdc1f9b09696b0f2e7c77f5e78a5b80d53e3e5d29", false, "a6084728d3fd0522cd45fc3f439bf2ddc7a1462ed68178ea7aac747182b83863"),
        Target(26147, "isZoomedExperimentEnabled", 29145647, 35, "e45a160000c0000000000020", "05e277763761fd5241417adb0d56fe552cf99c0c56712692bdcd1e4b25a7cafb", false, "3af39b18b9546abd9add2e71d8921aa82c3324394c9d024334183690e04f708a"),
        Target(26153, "start", 29145908, 102, "e45b160000c0000000000020", "f031b4d7ddb5f19180ac55b4048d2e794e66bcc68535079968cc4b4396f9d9f9", false, "15c5dc16f1af019d7e31090ebca5da6ed86b18a8a9516bce3d850333a02584c1"),
        Target(26159, "_kick", 29146305, 119, "ec5c160000c0000000000020", "d4156dfbb0b68083646b0f6b0b03b1920d09dbd86d8683b69f8715607a3aa3db", true, "b17f51a677a76fd6cfa5bb7402efab7a497f62b51a7648739d7cec2cb46e105c"),
        Target(41773, "_trackAppUIViewed", 31103839, 61, "8cd4200000c0000000000020", "8e04bece52864d7724d2841d8a34fdbf726fb8ac1a5e8780faefe3b0e7d2f4e0", false, "c80316e35e345f1c99f007ce3fa05f280cc433b2711f897c4cfcfc9bd85b642a"),
        Target(41777, "trackAppOpened", 31104083, 185, "48d5200000c0000000000020", "1c5d7d5f26544b13369c0d7818ae06575c54db5da283a20cd03eef5cacb6e3c6", false, "d49ec3e157ca97ac38ee73656a0d9d96fa7af86573041df27721f6d6e467b9e2"),
        Target(41778, "trackAppUIViewed", 31104268, 106, "74d5200000c0000000000020", "088811fca2227d6f1f652ad58b10ec6340f05f1b13ca0fc92a2acba9ec7f91ac", false, "119a6e69f8b1de20477b98fc81ecca14c0c076f44a640f29cbc0f2c83ca6111e"),
        Target(41780, "trackAppLaunchCompleted", 31104374, 120, "c8d5200000c0000000000020", "6e7149bf14c96e67c0a89f96ad20f855e954e126a01e379ae2d75cc6d328a9e4", false, "1ee1c5a9c3af1f77f03c00030d7673d4b21708ec8f765576674141f45e754ffc"),
        Target(41922, "timeRequire", 31116072, 274, "2cef200000c0000000000020", "f095c8fbbdb04efadbe1e19e805c62897977ad19adf382ad3aa7713ce4408f47", false, "53439beb90bf53eb7b785e23228b169b47af6af7ac5bc38204e72d3863eb2e71"),
        Target(43200, "ttiRecorded", 31253718, 51, "50cd210000c0000000000020", "fe5686690c98cbf661e70072be13ae9baac2fda39d2de6b2a235eda0a6b5a790", false, "8290d7f0627ea2b72439328515074989f0a12cbf81a281c8ad698703043d9f94"),
        Target(43202, "trackAndroidArtProfileSnapshot", 31253830, 44, "a8cd210000c0000000000020", "897199e81f2d80aac848da525ee0fb216546ab592ec43c671840cac7828f7b20", false, "ce57bd8e083fa28d694b23286a9c65eae9ad6004b0e30179374096eae55d24ce"),
        Target(68623, "_initialize", 38046022, 30, "30e8320000c0000000000020", "c68efd2ffe67155dad123bb2c6be13b5adfff1787f7aaab62449cb2e91be69eb", false, "6b277430f3b643c26f9fd2a44113952380c89294d86c1ae006569fa67bd315fb"),
        Target(73591, "isJankScreenReportingEnabled", 39699583, 62, "783e360000c0000000000020", "43e5687bffd779d99db9d600c0cb23bbbe767820c79e24f2acf5afc01d21cd83", false, "0ffb4fbafadd76ff7c9455ac77b739461a399c76df16175d361a73a78d2093b3"),
        Target(75541, "isNavigationTTIEnabled", 40528840, 76, "108f370000c0000000000020", "5490f5f789350c5da12069410299d65c59b32873379e7c4ae94f569c73560e2e", false, "1a2ee9578cac8c0d8027fef6e801f04a57b5eecb2c86dcc3580e43c455626202"),
        Target(57478, "beginNavigation", 34739732, 352, "0c6a2b0000c0000000000020", "32efe655a833af610d86889fc1818895dcd9d2035de23966016d84ed846ff3c4", false, "9d7a9df1213854dbaf8b985992b0ea280e6f75bfc1948c84a849394819cb6d90"),
        Target(57479, "recordComponentSpan", 34740084, 486, "386a2b0000c0000000000020", "7fea70566aee65b75b2cf63fed51256347608fccc9a6bf10d4ba378ba170ada9", false, "9d81cd63db5825ec5efd7de5d2fa134febb9af1ab75a434269de9b66e6a1c3f9"),
        Target(57487, "recordLateComponentLayout", 34741328, 246, "986b2b0000c0000000000020", "a2fb94401fc7f5c7e0300be62b6232febf4238c8ea38b30bf21709e1ee02e87a", false, "4d989dbb0241b6f806ab4a75a2c05d6a06d6482f8284a126df4acd4cbc317a86"),
        Target(57491, "flush", 34741940, 236, "486c2b0000c0000000000020", "3aa59f8564237f45b929e50fa078a249dc887d7c38fb91ca5278db784f140d26", false, "40688c2311cabba92ce77a9952229f9fe06416d4689f62508eaecf56983c0d6c"),
        Target(78993, "trackHttpRequest", 42170907, 220, "44e4390000c0000000000020", "8ef3d70e3a6c5c1c3a26f633f721f11ca9d31998c63bb1735cc337508af98cb6", false, "130277faea7798e211bf307bfbef7a53bff994209123be2876dd5b31af507849"),
        Target(79477, "_initialize", 42258537, 71, "bc373a0000c0000000000020", "55a0e2def7767d669fbc72369a656de24192c9bfa74a983c354c13cc46e31b8f", false, "a96197e7a6c234978421d842140c75fdf36e1c1bb0722afb676a99cb286ef0fa"),
        Target(79480, "deliverPendingSessions", 42258756, 122, "40383a0000c0000000000020", "145593d64b8ab8d0ea3a10f25abf1a1c13114fdb5859dc5dd74be7f0d7f62a5d", false, "a9bba6ada5a71ca5e0364f9f4686307fcb26ecaad1d3af5f89531702d74d4ff1"),
        Target(79482, "attach", 42258898, 120, "98383a0000c0000000000020", "1ceaf10a317bfe6efce32f217313bbe11b966caf9cc9b0b7fbbb230052ae0371", false, "edec5a76457452a837bc2d687f66a2c5a294068a7c583c0893fea52e696882f6"),
        Target(79483, "handleDispatch", 42259018, 196, "c4383a0000c0000000000020", "94258429a1ccb1a1b105e0430260ea8fc8d54ca44cae700a00be2b24d1696d56", false, "8fb05f76c9aa1005d8a80158759cb5290917c7fb9013973e623dc9f0ced1580b"),
        Target(79484, "handleStateSettled", 42259214, 198, "f0383a0000c0000000000020", "8150fd561184efe5c98b6069b0b59d5ad38d80bf6f0f31c0c48d9586a338b4ce", false, "a1f3c63d6b4af8fdaa945b60e3b28bab162b8d84fb392dd8c71024f478b414f8"),
        Target(79491, "handleAppStateUpdate", 42260511, 119, "243a3a0000c0000000000020", "05b4612d947e126f07c6ed1d31bd36de22e71d717462929aaeb9b250daf537e2", false, "88a96bf963561b90a9cc3a0c7f1af5f88a31dcaa86074496bc6af2dc05eb3bd9"),
        Target(79492, "handleConnectionOpenSupplemental", 42260630, 37, "503a3a0000c0000000000020", "728097bb131d1d7759edd99a2959ae6ebe57fbcf60835c1b975be9f16305d90b", false, "72e9d8b8da891089d52d10feb52f98d39cef8b6138ae3a9e75a04fd6f2ff3657"),
        Target(79493, "scheduleReport", 42260667, 69, "7c3a3a0000c0000000000020", "7efcdba1bd581b6c83a2ea6cb92e0d03dc765c01a73e2256c042653e0eca5207", false, "46a6cf716df177140966c6ca9052eafecc2ecb00da3b64f22791e981cf2a7d69"),
        Target(79494, "sendReport", 42260736, 232, "a83a3a0000c0000000000020", "e8cfb309c2a261725036f2ed07013054a9bde53cdcdfb3af41a02e4cf9c1b204", false, "a2037b65fafe98cf797031ea017e455e55028c9e384718ffae814547b4524671"),
        Target(81187, "handleChannelSelect", 42857652, 337, "c45d3b0000c0000000000020", "a2419c67503394d87f227ab0e71b81362a6b47a87e52d856e357ac550404e69b", false, "d623bd3431f7a91eeace43d8cf342909fc2530ea62e7b1c17fd197d92aa2bf55"),
        Target(81327, "flushDelayLogs", 42900565, 164, "d8763b0000c0000000000020", "50d8f61aea6d9b3d3d2ea761317ec4c78fbbfaa6fbdc1b13425787ecc894571c", false, "5f8eb3397535e64120db57390e144e0755c8675f4299dad76fa26c3e0ea58aca"),
        Target(81328, "onTimersDelayCallback", 42900729, 247, "04773b0000c0000000000020", "f86acadbcc54fef82d36591bee1ed0dfdaa5ec69fd602236bc87c9fb1820d7b9", false, "251bb000b44d56eec80dbb6f26fcf7bb264a38adc12b36ae936cc5d166cf79d4"),
        Target(81329, "setupLibdiscoreTimersMonitor", 42900976, 39, "30773b0000c0000000000020", "d822e2b911f08a110a612e30c6a8821dfac31b0a17fa4d5301ac1fb48da640dc", false, "3e1fc37d49e4c252ed24d7346d466c4b586a29a64eab41ad42b120907deac070"),
    )
    val crash = listOf(
        Target(83562, "send", 43169236, 180, "60eb3c0000c0000000000020", "75e2f38e51d53922bc78954ce9438b491ad7a7d56cdacce3967e317bebc34dc9", true, "0a9f52997eda6c524ac9cb500c6bd7bf2f353e2b7142feb95e52cabd69c2de8d"),
        Target(108009, "send", 45013693, 181, "70da4c0000c0000000000020", "d3e7dca38dcccedd08dd56e73878f17ec52f567640f31494025f14cbaa894a20", true, "17dc96d03473f1b5008ca6f1bdfc48ba36186849eae979c760ee24a9834a3be8"),
        Target(24066, "initSentry", 28808151, 43, "7cf5140000c0000000000020", "c2abf4d8577e3e6fd8565d9c7f2c807fa423b3fbac0ca3574bb34703a624cb00", false, "2e4dedbb10513a1c58aaffc6d2fb4f708610961de4ecf8317cb58d0184110d27"),
        Target(21053, "addSentryBreadcrumb", 28363166, 97, "04e8120000c0000000000020", "2316ccd97166a2af3eb86f22486bdbf88b39d02a70869523c9e82665e4e4a249", false, "a13e6908f4821fe4ee4151f50fba575dc52f06b9dba3db37b01fe25e6a1b3f92"),
        Target(24047, "setUser", 28804824, 104, "28f2140000c0000000000020", "5fb0f18b50797accd8aeb4ca950785a562010e68b4b94d3ac28aeccb314c5543", false, "3bb5d48389858afcfca6b2e3510ab5c4704a4ff2dc56b0fefa9ec2da0d4b089e"),
        Target(24048, "clearUser", 28804928, 78, "54f2140000c0000000000020", "b6895246b43536d428de86c77b19127f30d886bbd6954dad9426bc69c5af7be4", false, "8eebc1cd4e67dfca94e2ce1b55a3559ca7678e1206be45c5fd9a8d2cbf75005c"),
        Target(24049, "setTags", 28805006, 48, "80f2140000c0000000000020", "5b36b8565d98325ca146b992c80821d9fe2f953a394891cfec50048641f10eb3", false, "10bd60faee38d164bd70bb9e5a9815fc3175d36d73cc0d075d3f58e18bd2a828"),
        Target(24050, "setExtra", 28805054, 48, "acf2140000c0000000000020", "b1ef9e8d5cfadeeee9698c0e19e2e122f0700d874e3239a51ebeac34a2f12659", false, "0a8f6765986646931104457184f2290d03fae0c1866d04e335ecf3b24484dbb9"),
        Target(24051, "captureException", 28805102, 87, "d8f2140000c0000000000020", "c891108ed52393d3ca8a97048adec3dde7029b7f31515db3cd2fbbc068895b91", false, "d148dd726b6c04fb05da9bd27cb237d6c2967fd20a2c9433aa471b324a680a6d"),
        Target(24052, "captureCrash", 28805189, 158, "04f3140000c0000000000020", "9fb6197537baaaf6d255ceb65f60c0aed86f50925c9f85071cd1a4fe8536b0a4", false, "4906e8d25ef18ec2db08f78e7aa2b21b61794d918571d89f50ae24a52bf89c40"),
        Target(24053, "captureMessage", 28805347, 90, "30f3140000c0000000000020", "ae08e970d3704d1a12e14781293befdb56a34026db8297ac8dacb626272db93f", false, "67af53b7c459cb15b3827ebdb1d5d21867431de1d0be7e9002fa7b3068595461"),
        Target(24054, "addFeatureFlag", 28805437, 106, "5cf3140000c0000000000020", "386aa332cfb299c9b8a55610efc1b4334e87a10e7d37137561b237aa48ede865", false, "2856b351cf6b72377db507d487dfbaff8e180199c51078c4a58dc9723231f838"),
        Target(24055, "addBreadcrumb", 28805543, 54, "88f3140000c0000000000020", "b09163a3256cf6ed4c96662d2cdca7df9b1ea9bf02d5694bf08a3eb59188ca20", false, "b3dacfb92acc8aa617ce63d7eb7df21e38bc0a42c16f4a79665bf623ecd93bfa"),
        Target(24060, "getLastCrashReport", 28805812, 35, "74f4140000c0000000000020", "e16d574dd871549934503bfc9e422768fa83bdffb3435d7d1c4b0a57e888f532", true, "287f4f9783bc784f66f6eb49308f9b6aa18dc98429cc126a815844b57ee65415"),
        Target(24065, "trackCrash", 28806880, 1271, "50f5140000c0000000000020", "8e301289dbeda31aeda10fc8c660b80e60c0b7526eaf85033979e499c7e8960f", false, "4322e377ce53233e2e0489affe9340bc36c4ccd08b7cf6384bbe093de71bd429"),
        Target(81330, "init", 42901015, 23, "5c773b0000c0000000000020", "3dd1779b693157251d85d80385065a6e2673e380474bfa8ded7b3cf761db72ea", false, "9e47a2de80d60b408d01a9dbdd4b4b1981d9ecb5509bc618a20926d3eef976ca"),
    )

    fun rewrite(bytes: ByteArray, targets: List<Target>): ByteArray {
        require(bytes.size >= 148) { "Truncated Hermes asset" }
        val header = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        require(header.getInt(8) == 98 && header.getInt(32) == bytes.size) { "Invalid HBC98 file header" }
        val inputFooter = MessageDigest.getInstance("SHA-1").apply { update(bytes, 0, bytes.size - 20) }.digest()
        require(inputFooter.contentEquals(bytes.copyOfRange(bytes.size - 20, bytes.size))) { "Invalid HBC footer" }
        // Validate all targets before changing anything; allow previously selected *other* privacy groups.
        for (target in targets) {
            require(bytes.copyOfRange(128 + target.id * 12, 140 + target.id * 12)
                .contentEquals(hex(target.header))) { "HBC header changed: ${target.name} #${target.id}" }
            val small = 128 + target.id * 12
            val expanded = (((header.getInt(small + 4) ushr 14) and 255) shl 24) or (header.getInt(small) and 0x1ffffff)
            require(digest(bytes.copyOfRange(expanded, expanded + 40)) == target.expandedHeaderHash) {
                "HBC expanded header changed: ${target.name} #${target.id}"
            }
            require(digest(bytes.copyOfRange(target.offset, target.offset + target.size)) == target.sha256) {
                "HBC body changed: ${target.name} #${target.id}"
            }
        }
        val result = bytes.copyOf()
        for (target in targets) {
            val stub = stub(target)
            require(stub.size <= target.size)
            // Unreachable (opcode 0) padding removes the old body and leaves valid instruction boundaries.
            result.fill(0, target.offset, target.offset + target.size)
            stub.copyInto(result, target.offset)
        }
        // Same length/tables/debug maps; only selected function bodies and the mandatory footer change.
        val footer = MessageDigest.getInstance("SHA-1").apply { update(result, 0, result.size - 20) }.digest()
        footer.copyInto(result, result.size - 20)
        return result
    }
    /**
     * Identical result to [rewrite], applied in place: validates every target first, then only
     * the selected function bodies and the SHA-1 footer are written. Streams the footer hashes
     * instead of loading and copying the whole bundle once per selected privacy group.
     */
    fun apply(file: File, targets: List<Target>) {
        RandomAccessFile(file, "rw").use { raf ->
            val length = raf.length()
            require(length >= 148) { "Truncated Hermes asset" }
            fun read(offset: Long, size: Int) = ByteArray(size).also { raf.seek(offset); raf.readFully(it) }
            val header = ByteBuffer.wrap(read(0, 128)).order(ByteOrder.LITTLE_ENDIAN)
            require(header.getInt(8) == 98 && header.getInt(32).toLong() == length) { "Invalid HBC98 file header" }
            require(streamDigestBytes(file, "SHA-1", length - 20).contentEquals(read(length - 20, 20))) {
                "Invalid HBC footer"
            }
            for (target in targets) {
                val compact = read(128L + target.id * 12L, 12)
                require(compact.contentEquals(hex(target.header))) { "HBC header changed: ${target.name} #${target.id}" }
                val words = ByteBuffer.wrap(compact).order(ByteOrder.LITTLE_ENDIAN)
                val expanded = (((words.getInt(4) ushr 14) and 255) shl 24) or (words.getInt(0) and 0x1ffffff)
                require(digest(read(expanded.toLong(), 40)) == target.expandedHeaderHash) {
                    "HBC expanded header changed: ${target.name} #${target.id}"
                }
                require(digest(read(target.offset.toLong(), target.size)) == target.sha256) {
                    "HBC body changed: ${target.name} #${target.id}"
                }
            }
            for (target in targets) {
                val stub = stub(target)
                require(stub.size <= target.size)
                val body = ByteArray(target.size)
                stub.copyInto(body)
                raf.seek(target.offset.toLong())
                raf.write(body)
            }
            // Same-process writes are visible to the streamed read; no flush to disk needed.
            val footer = streamDigestBytes(file, "SHA-1", length - 20)
            raf.seek(length - 20)
            raf.write(footer)
        }
    }
}
