package app.venus.patches

import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest
import java.nio.ByteBuffer
import java.nio.ByteOrder

/** Exact, inspected HBC98 functions. No eval, runtime hook, remote loader or settings dependency. */
internal object HbcPrivacy {
    const val ORIGINAL_SHA256 = "13f83cc34d48bf2002e0754cf2cea486b4e1be6b2d09b545584bd8cf0177fc73"
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
            "Unsupported Discord JavaScript bundle; use the original 351.11 - Stable APKM"
        }
    }
    /** Same check, streamed: never holds the 55 MB bundle in memory on the patching device. */
    fun verifyOriginal(file: File) {
        require(streamDigest(file, "SHA-256", file.length()) == ORIGINAL_SHA256) {
            "Unsupported Discord JavaScript bundle; use the original 351.11 - Stable APKM"
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
    /** String table IDs of "Promise", "resolve" and "" in the pinned 351.11 bundle. */
    const val PROMISE_ID = 30; const val RESOLVE_ID = 19990; const val EMPTY_STRING_ID = 255
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
        Target(36109, "increment", 30380377, 96, "4cfa230000c0000000000020", "cbaaeb31a5a672bcf5bee80f12fcc92029428a3d533697366f924fa424e9e069", false, "8633832d55700dbc59c2a2bc49c0009d87beef107bc3582d5b10caed2637b5b3"),
        Target(36110, "distribution", 30380473, 114, "78fa230000c0000000000020", "fe7daa4ab941fd18afc4189b338930f0008838cfdcd0d5950eb3960279016ccb", false, "9ab746fc289b008b614ac2ece509ec380be8a2cd471bcdf525564aba367cb63d"),
        Target(36111, "_flush", 30380587, 183, "a4fa230000c0000000000020", "c6d5dd57d125da5fb1939da9803a87d1d36e6cf286a28ef4382a179214182b17", false, "8306ab68458a8333ff5ecac673c2f068babdb052cf37fe327e6ae6732a92b5f2"),
        Target(24603, "track", 29037250, 288, "944a1c0000c0000000000020", "72985440a752d512896f39a89c9e6373e9681cb28a1a644ff2ad17980eeacd38", true, "270222ed1ef6a30a5e7f46056273b7e82e951239cf39f604479a41cfc82bf509"),
        Target(86596, "track", 43779379, 544, "b0e2450000c0000000000020", "14b3bc84c045dd07f21791dbd57e02f30faf2c6f1b2c41f9e39bc572e338a49b", true, "6d9dcd3023636507061578a49557800e97392727f7af7ed5ca23059a3851dd0b"),
        Target(86600, "drainEventsQueue", 43780075, 249, "5ce3450000c0000000000020", "eadb46b661cd224e65cf73c8c676e1f3ffe19bad82266f17451cb9b74f498876", true, "755309ee3746b228cc8e0c671b6763e3975f0fcc859deff4a4ce87f0de7b2f6e"),
        Target(86601, "submitEventsImmediately", 43780324, 251, "88e3450000c0000000000020", "f9db3cdfd1f4dec77a53cc6262534ac446e7264fb78971441f49583628b49218", true, "4556422d74db4ff95c974934e6b7f1c5a5defb1294db45e3c2723fb1b6bf312c"),
        Target(86602, "flushQueuedEvents", 43780575, 267, "b4e3450000c0000000000020", "90fb0c170a2417d5cd1cf4b5e529d4465f627c9fda5b5ee09b97f47de564a990", true, "a90834f7998080135f7a2409d5bdf18430821e3391234446158b2b122921c8b3"),
        Target(86603, "sendTelemetryEvent", 43780842, 347, "e0e3450000c0000000000020", "e47310d129c8d4c0cfb3c18c4ae28e7cfd3087bb1705a76c3c2d186457e0603f", true, "2faebfec80380f8490d3ed0df23237b54c6169af1d8268bb60c59ab91f92ff3e"),
        Target(86599, "scheduleDrain", 43779923, 152, "30e3450000c0000000000020", "2c2e699e2f352c9e88ed5452cf347499e29e649a27ba495f5385608edba28f32", false, "c0429b6a5cdc98c168783e2b06b6484de98db6e1817b81290644a947fe413368"),
        Target(24606, "startRecordingAnalyticsEvents", 29037574, 13, "144b1c0000c0000000000020", "645fedb3791434b0327d0906ba36e9092b6011627c08db439b28a0b7415f2037", false, "d2db9a30cf5773cdedae05f7def196857c4db225ce5a4175ac8f9ebf783a1d03"),
        Target(24538, "addBreadcrumb", 29035487, 84, "ac3f1c0000c0000000000020", "f80aa0cd69af4c47d013f951e826e0ac1aefc928f798f37f03e45c2b67d92c36", false, "cb8a9eef3fafa4dbda55056cdb57d3c3ae1c5aa41f48d3d3f7b9c73955eeaa6d"),
        Target(24539, "expandEventProperties", 29035571, 712, "d83f1c0000c0000000000020", "4451ee87e54bc5a9d59c9e689ba3a30f45cd60479eb0c8d20092b18a14097e17", false, "dbe2b3ee2ca86cc4345b44b6d297632db31f2a550e1cf1c049f4d46343a28987"),
        Target(24540, "debugLogEvent", 29036283, 79, "04401c0000c0000000000020", "08a1efa386ddc546218f55d9131bc163ce65cc2594a9ae37d77be551161e6a49", false, "f4b3244a9d60b4022587cd34cd2d2cf1f0af737c0efb78d8a537a8ab38999d21"),
        Target(24611, "trackNetworkAction", 29037681, 135, "e44b1c0000c0000000000020", "59a886da94c2a443dfb9d2e201825d4ae5b1c25281b0433ad44e10f5b3caf151", false, "8ca1f8e4c0efdd3604703d1d79c46d4d36b4660730ca6c1378f73bac614e90b6"),
        Target(24614, "setCurrentImpression", 29037850, 52, "3c4c1c0000c0000000000020", "e32cb674243229c791851950ec8217fb677d5cbd55ea43fdd729f7e3a62d136a", false, "2db22e70fa46e090e44133aed6dbfc294425372679b70ca76c8729f977a7b038"),
        Target(24615, "cleanupImpression", 29037902, 52, "684c1c0000c0000000000020", "699fd5507e98a88a9b5abb724a5861714bf585de1e7563705651eea5e748e990", false, "a9766dbdaa1ec0faf5d5109293688efa9ee4be77a9fa0980d70231fe6c72ce80"),
        Target(24616, "setDebugTrackedData", 29037954, 59, "944c1c0000c0000000000020", "76fe1c53c6a5dea016796d507e618c7bc0ca63d688f84edf012ce9426350fa40", false, "74f6d02490d55f23b188be8009c31037d8941016e4abd78a70c581ac1c36d329"),
        Target(24617, "getLocation", 29038013, 51, "c04c1c0000c0000000000020", "3cee7abe7b14d5f7e5948b0315524181f16da953069bf136222306a376bc49ef", false, "387afa8bc3aa877243af17e179beca97ae7103dcbb76b6e069cc14c22fedd127"),
        Target(42449, "_trackHeartbeat", 31348172, 61, "ec41280000c0000000000020", "dbefd7c3bca7f07ac509164bdcc4826b2712f9d2620f8a593de31ff7280376d9", false, "bf47563fbb727e2b4012959175e0da8a640b163200ccac8c2db864b3faf85c3b"),
        Target(42469, "isClickstreamEnabled", 31350394, 115, "5445280000c0000000000020", "19307dea335fa8ef65daad5f0ec7436ca6613d6bed820446107992f490418f43", false, "99f293efe32e02e87390f2052e62387bc4208e924a8cf47a985fbc0bac4642c5"),
        Target(42472, "clickstreamExperimentEnabled", 31350905, 35, "e845280000c0000000000020", "44524b8c7440f6a2b1e3517e5dabde22ee166a5b742c9960be60b8af91c489e6", false, "5be5a66534304b5b7973f0b59915a4861d9382783a3a5c21208e26262e18d632"),
        Target(50084, "trackImpression", 32788581, 398, "ac5e2d0000c0000000000020", "8eeae74ed3ee398d214aaec1b5be294fc7ee87dfe9ad8effe731504e1d8fe044", false, "c44e2585ee55b062d2052f71f69d2838e451717d8e4a884c14a526f6adeb694d"),
        Target(50085, "useTrackImpression", 32788979, 382, "d85e2d0000c0000000000020", "a395ff99fb1f210e9e5e25fd3a1cec6ce89f4a5d8bae55314070229f041db9bc", false, "158d383128687e663df26b11cbac9bd7725149ae0ef017929ac4ef3a46ff71e2"),
        Target(50086, "useTrackImpression", 32789361, 131, "045f2d0000c0000000000020", "dcffdf90e82a071bb20b4408952634be2230d4f7ae75a5b45d628ec8441e19f0", false, "65fffa18e01ec475d305a81d756686f25dbedaf64a35c7358f23cd38b1cc57f6"),
        Target(63072, "trackSearchOpened", 36404784, 206, "2c25360000c0000000000020", "64ed3daae5ac3235976e7cf09d0c1fb37829389d717d23d11e6216edbf3166e7", false, "1317e1ad204435e4c1499a26d5ddf8b775b9ee6dd41ed7f19544fb83bef5b051"),
        Target(63073, "trackSearchStarted", 36404990, 324, "5825360000c0000000000020", "31186244fd3d7fda7f881b3053f2d3d6d28782863f89adcbdf9e07de73e835fa", false, "ef0512e19d5f21f093e7d8f0c44b0031677a1be30509d7cca336e0ef42ca02ca"),
        Target(63074, "trackSearchResultClicked", 36405314, 431, "8425360000c0000000000020", "f03a0e1796bab53a885f7fee5468f8ab1109bb48641b960128ac32d18cae809b", false, "ef28fcf01fadc95f5883b60e05cd0dbeace8338a86ded45e92d2b64d189a6fd5"),
        Target(63075, "trackSearchResultReturned", 36405745, 415, "b025360000c0000000000020", "6fee6602f7e27c07fc8177e9e635f6b2d23f0be4545bf9cbcbfeffe242464bba", false, "8310e3ff41a3121f21f0de4c02b02872c85c65df69a37f46c302c7b511c7626f"),
        Target(63076, "trackSearchEmptyResult", 36406160, 302, "dc25360000c0000000000020", "b6dee58c5a197433729066f9ed6945de4fdd287c8105f761b496cf12838df5fd", false, "1a0ff2bb51866b4c5b7ddfb36df8eeba1c84f9962d4da18799d5b8b5651db63c"),
        Target(63077, "trackSearchEmptyMessageResult", 36406462, 302, "0826360000c0000000000020", "cfee50c1d3cb65264a7335bea461f5fffb3a08d0cf4fa23b339bb4d831fe9387", false, "88842953e18a9fd72e2b72d8bc1eabdc4d16d56cddd90d14f400eb90252dcfd0"),
        Target(63078, "trackSearchClosed", 36406764, 73, "3426360000c0000000000020", "2e586cfa104789d18365ae9f894966bf67382112aaa22a73d3cdc4172e7e57bf", false, "554cd2f2f04e37c314f6557675077fd675edee64c0d6bf6d79801fd4efa21ae7"),
        Target(63079, "trackSearchIndexing", 36406837, 181, "6026360000c0000000000020", "3f70f6d1aa8544f9a22bdae3201d24970d72138053ec59ea5d05a258c5e4c00b", false, "230d4a546c0be8424fd706fa82d32c1cf655ba4fad932bb717972ce11d2b98e4"),
        Target(63080, "trackSearchHistoryClicked", 36407018, 194, "8c26360000c0000000000020", "dd2c9f6bc07ea97cba454456e1ca55d4f69353e6216da2673e08b7d36e0f5914", false, "a23b59af97efdb02724994adf1957a2530342f1f5ea4a0bba47c5ea9881c04e4"),
        Target(63081, "trackSuggestedSearchClicked", 36407212, 176, "b826360000c0000000000020", "42525b341972918fe07deb0ddd0177587cdf4e3eeacbdc0e75da29f7962f081b", false, "33838a97ea7792b04d5e5b0edaf82c15ff12901137a2deb64f7b6a9c18b017d2"),
        Target(63082, "trackSearchFilterAdd", 36407388, 298, "e426360000c0000000000020", "d49839d0629c5c54615fac04f14e9eb232a701e3f70b81d4eab72ee1f2c09fc0", false, "03eeb39a2c5ef3bebd0d7f01c2969c9743e773ee50bab505eed619be3819981d"),
        Target(63083, "trackSearchFilterRemove", 36407686, 299, "1027360000c0000000000020", "2560bbe4eb5127f6c15dc31dfb4e57c0b6593d5e838b32f426ed34c41c96919d", false, "394f3c33859c47627bc0b0675171fca76b294e34f81acc1d8d65dbdcb792685a"),
        Target(63084, "trackSearchTabSelected", 36407985, 161, "3c27360000c0000000000020", "8d69d01c7d41d5027f041bb9f0829c524d588e4c9949c5dd6b86bcf759061a93", false, "705a56f5c393b66a87a4aabe71ce27277482a7be096f0471a1491f68a2130373"),
        Target(68010, "logReadyPayloadReceived", 38307992, 509, "e878390000c0000000000020", "e011493d1bccee6ad03e2718beba2350619de01ede09dc8915e3319be17c82cb", false, "0adcc6b00a4fc5e871e95443c54df1d82b5904e43d1a3fcfbdbe5456f96a17e0"),
        Target(68012, "getReadyPayloadByteSizeAnalytics", 38308602, 892, "5079390000c0000000000020", "64914ad8aa34a06d630c4496a6a7d38e6b8046368df14f2013a70908e8377c94", false, "50fbc391e804d055da735649b5e48d865f99c43f9ac3dd71417f273c0456d616"),
        Target(68013, "logGatewayConnected", 38309494, 150, "7c79390000c0000000000020", "2a697382c7104ca91ebd87997585dd85da3b1b12454daf20c739012ff46c8d16", false, "73e82a372b9ac040051fab6dabb6197423ad18f828852387d34c34fe4ae3cdae"),
        Target(68015, "logResumeAnalytics", 38309711, 323, "d479390000c0000000000020", "efab877dca0e867b9ac669d2e117ac9c06308d3cd99e49dc86f98284d0ff8f6c", false, "bbeabd4c3acabe83d289a304c8f28825d0e53600eda4f28e2e40e425ad12feca"),
        Target(78388, "componentDidMount", 41728691, 405, "b875400000c0000000000020", "0d16f39fa297c111edce89fbb2ee43d06d50c941f8954f2f7f1b4d15aac90455", false, "1dc7be04980ef384b8d093cafbae4064996adb8a33c82fc1a74ff1e8eec7368c"),
        Target(78389, "componentDidUpdate", 41729096, 1503, "e475400000c0000000000020", "794c7a520a0ef3f3211c0197644ae9d7814d7e5d57a8ec6c4623eb6571762e9c", false, "a5f6a207ad1a2aea357be023fe2e10cf2becabaa957499fdea4e306a9bdbdc47"),
        Target(78391, "_trackWithMetadata", 41730649, 163, "3c76400000c0000000000020", "909f075fac9867f91f5a20e32dcfc4e5b29ebb1b3e3648ce65c7f4050df3f4a2", false, "a880df5ea9809b3292c42dc425d0ecc19a45f945324127120b27b465096f902c"),
        Target(80334, "_initialize", 42584235, 103, "20c5410000c0000000000020", "53e2ddb0bfc5311b7e5867063fc761a64a4b132c9de23d99c52b0110000d9dd5", false, "a2f413be6d9cecb817348aebd9cbc144949b47ff54b5d53c9c53d67a76f4410c"),
        Target(80336, "_trackStartSpeaking", 42584393, 238, "78c5410000c0000000000020", "6c6dcb293ddfdeeb5387e8050d43fd6a8e7fc2c6e9c0b2ffc882f1ed4a19d688", false, "65cacaea577811e3741aefcd26e464c1c5c953c54f94ef44372128fe614f3f23"),
        Target(80337, "_trackStartListening", 42584631, 237, "a4c5410000c0000000000020", "21ce0101f73feb31d23684d00336d225b9d1238efcd66aa7066ae078672afd94", false, "5e8b19fcfdc58ea86db50342d22219548779010d57ca409e8bdb9324bc4d5d36"),
    )
    val telemetry = listOf(
        Target(20991, "shouldCollectMetrics", 28543630, 86, "74ce190000c0000000000020", "2136b7f290ed87b48b66a7f9c8065f02e517c91e0420c4ab1bb99399ed2814e7", false, "3cfdf12f71aa3a1f564da388aed0665de2e1991e4bcf477cf4a30fd2bb70df69"),
        Target(82451, "installWebsocketTelemetryHook", 43285339, 183, "4832430000c0000000000020", "ceebaea2f6d169b40f430d22c996e26d2868b14684589118116a2bc2adbab72e", false, "67eb5600b1c6e75342e0c286bebca50671733a0b7b126fd192b7e5c81621347f"),
        Target(26581, "append", 29369165, 88, "509e1d0000c0000000000020", "85ef018b98bf720d8ad14d7e46d128785b89e6ca88719f8ddb16e0d0544a3a77", false, "adc1ac28a9b298c92b6137c6ffb5d2ec7d6e293ed41970d1af24b0b082baf990"),
        Target(26584, "append", 29369315, 52, "d49e1d0000c0000000000020", "8b56b2c51f925fd1012a507bc9b18142b0841d4a11caa3cda0e980777fbb59bc", false, "627643e9c3dae084367ba5869c02a45af62b1d764d969ae57534c1971882dc36"),
        Target(19294, "isTracing", 28296529, 79, "78a8180000c0000000000020", "090a129b0578f067052826ee377cff8593412df150936dd9b95eacbf4d0dcc8b", false, "88d5d4375dc0382150c4f02ff19fdc8710fe51c98dab8619c96a6c5a75ffa69a"),
        Target(24484, "_initialize", 29029942, 183, "24361c0000c0000000000020", "37a155edd16873ad3bdebb47a31ed5e872a74e5b496dcfc5995dbc6d12b22f51", false, "e61051eb38801752dd50fa6fb0bbda63f914930d14c54221fdd522b9815f82b1"),
        Target(26559, "shouldRun", 29368086, 34, "9c9a1d0000c0000000000020", "82ca9da807a4023dd8afe6f8c099855d4a5c1dfc2a09af31f646029da09cbf1d", false, "9c4843e80d3fbb8f68d0b5700ba49fa660d629e4100779a88273a5510d42e09f"),
        Target(26564, "isZoomedExperimentEnabled", 29368203, 35, "6c9b1d0000c0000000000020", "7f2edee606f9feacc0bf65f964c80f502071272b7816a4e5ecbadf61af75329b", false, "4bbff65ba077be2d447bf8b45276a871d3c83803ad6d1919ba523a382697aff5"),
        Target(26570, "start", 29368464, 102, "6c9c1d0000c0000000000020", "a58aef343b163feb468d461565ec2e49704f78861b7f215cf5fb6a687dd4834f", false, "2615713cff6ba1b096077c93df014888b12f9c3c3d70b9d1321942ef4d153662"),
        Target(26576, "_kick", 29368861, 119, "749d1d0000c0000000000020", "bd9f4f087cf3ef3eb40345ef5fb3e581d67618237321a0e1b878b931df303d66", true, "889d7e895846d1d9ab0cf22488586c8abf52fa5e9d4462bef89f3da7784252b9"),
        Target(42488, "_trackAppUIViewed", 31352813, 61, "9c48280000c0000000000020", "c9ff6c4483ee780910c37c5d08783c6a61e773de26fdfff97f20357b2ca35f16", false, "965455441f1026750d2d06804b8e50c3670d0b08091383dbd2afc6a0b7c680a7"),
        Target(42492, "trackAppOpened", 31353057, 185, "5849280000c0000000000020", "7b282aefef9ff5dd79ee18293257bc7e9d418eabeaae48a352fb00f45cddcfd4", false, "b58940a92dc1f060c85b9d3dcf6d23e95f139b3f29ff6c0f68e5520818b3d55a"),
        Target(42493, "trackAppUIViewed", 31353242, 106, "8449280000c0000000000020", "c1d862a97fa5c7c069aaa9c0eb582d10e57dfdf1a5617103b3e8eaa5feceb444", false, "36661e28f76b8de9d4510b0146df6a8cab9ebdb0d58d347f72d48cb0adaab605"),
        Target(42495, "trackAppLaunchCompleted", 31353348, 120, "d849280000c0000000000020", "686fec152b633317ba0fae3d1c39023c0cb29712c75a9df788c9dc07deca1993", false, "ff48762531738ef7e7eab67504ee2d65da2f4a95371e889924f981d06963d568"),
        Target(42637, "timeRequire", 31365071, 274, "3c63280000c0000000000020", "6ea1c3350364061ef19b57bc84a41e4ec7a2a9509facac2de78925feac7ec660", false, "e2f8a5e0706795fcb214ce4013055ef2c708f60023bad0eaf8577968d83569a3"),
        Target(43915, "ttiRecorded", 31503169, 51, "6441290000c0000000000020", "878612be48303891aff48acc545e0f70c240d26c53bf0c82fe7a1262f094a039", false, "0a4d20cb0b5c2b5fb45290a3a215db056df6a7aff4fbd5a691f134c7c718f245"),
        Target(43917, "trackAndroidArtProfileSnapshot", 31503281, 44, "bc41290000c0000000000020", "e447a88815c4d719e2e7b55de233a9350e14b29a1f33ce4323837c3f2385e947", false, "105aea8282d316dde76bf57ca936a8343fe4c89101028930d025332bae1d6399"),
        Target(71035, "_initialize", 38963944, 30, "08843b0000c0000000000020", "76327bf25435becf1e02e1afdc08552f7831d18271c429d838546665491c39ef", false, "b76e5d787bfd446c199c2b66d0c182f4d7d4e5cd3844b9a40139022cb4a4f045"),
        Target(75857, "isJankScreenReportingEnabled", 40577944, 62, "78c13e0000c0000000000020", "dbb17a452b1a504b8375a1f635b4294af739fd2a4cbb65eb4dcd5e8fc8868e5c", false, "17d79d819d55c88c02367cf4098d433549935746abaab7d86dc84b93e8cf7c52"),
        Target(77651, "isNavigationTTIEnabled", 41349252, 76, "98f63f0000c0000000000020", "ed7552ec06291439e805d045d1520c1b91ecb86df2cca8feb8f97ecf298762d8", false, "220ae10533d3c9f654f09625df0fb66228b3a70bb8db34b726cae793176d5d84"),
        Target(61861, "beginNavigation", 35980078, 352, "e054350000c0000000000020", "d1ec4ecc796bb18ef5fd701941f2c50cdf223a6717f3d5be22bca0ef4eb8fb5e", false, "d0591bc0db8f88c19404c05d38ffc158cced08fe7fb78dc01ec64f676f10b3f3"),
        Target(61862, "recordComponentSpan", 35980430, 486, "0c55350000c0000000000020", "04a36507365083b63a91587957a503409d17aac9c69827632894222351726eb5", false, "5ebdb84b6ba1174efe35e862c28041652a79d8d9c9a1174d77586b66f55dc28c"),
        Target(61870, "recordLateComponentLayout", 35981674, 246, "6c56350000c0000000000020", "ede209ffe7abe71fec48ca3f5f3dd64c007fd26efd9ba58edb3517595fbe7bce", false, "e15b781758ea86a8ccac98e1948ac8381dba869e278c48a0a1c188712c2af7d8"),
        Target(61874, "flush", 35982286, 236, "1c57350000c0000000000020", "ac6e46de32d5fadbacab5d1ea1473c9e8d097f2304fbb46c3dea57c90741a4d2", false, "8c17e2fa8b204dd676711c98c0475c56c92618f5f5c88da557a0d20a3a1c869e"),
        Target(80134, "trackHttpRequest", 42558494, 220, "b8a2410000c0000000000020", "24de0a86c4f65a8fa2592da9055f176228c9ca3018abfe15095b111ffb239da1", false, "48d62d8cfa416a1e7c766cce37b17687d0e52ca28c51fcaffabf649918bb87e5"),
        Target(80619, "_initialize", 42646180, 71, "5cf6410000c0000000000020", "160d5e7e65f5e0157e9cc282edbd1a7be243b0aa1cdfee0d8bb37795e26a46b2", false, "f3beae3df6e7797b4b29eecb85eed50a337f7f7ebe0888bd148c06d9dc6666d1"),
        Target(80622, "deliverPendingSessions", 42646399, 122, "e0f6410000c0000000000020", "594f58c25e081f9c5329bd2fb9ab80b2307fe624bc228282aa67cf3c41163a61", false, "71e8b8046696b461e49b5a2960d01414b2b579231533f8b2c5aea247bb55f1b0"),
        Target(80624, "attach", 42646541, 120, "38f7410000c0000000000020", "1d79490bff3c19baea6cf0090ba3b284ffc733832c39a86109c15cf2746ef6f3", false, "7eb5628a39606123f3179a0cc9e7193ce5c7eb647279b403dae661bab67a4f45"),
        Target(80625, "handleDispatch", 42646661, 192, "64f7410000c0000000000020", "18bf7f3096b22d31cf7466877083ee6613dd93324c9875dab484ed197101d96f", false, "5525fefd67b7f2b729ea7217e7bb8481829f0b35ee25f0baadc0946995ecafa4"),
        Target(80626, "handleStateSettled", 42646853, 188, "90f7410000c0000000000020", "1945715ecd6a555abd60848daad904e58259fc4e557446606635b6f8a8a66128", false, "029c6ae096f85b98ee4a75a978f583def9b3df4e03fe81194d505cb82017c261"),
        Target(80633, "handleAppStateUpdate", 42648140, 119, "c4f8410000c0000000000020", "db54711cd4ace47752227fa0f80ffa7beca403c0f940d4d3382bb1cc8911306a", false, "b7fdae0dcd0670c780fe5a1b1dc8759f2b0072c713f9df0aba3f069418cc109b"),
        Target(80634, "handleConnectionOpenSupplemental", 42648259, 37, "f0f8410000c0000000000020", "1272cffcec3cb532e037c15f090184a692600d65f8e2fce521b0c54b06537b7b", false, "1a4d56016fe0a74ff2164a3246d9ef0c7b6efbd38692659b1ceef607fbb869c9"),
        Target(80635, "scheduleReport", 42648296, 69, "1cf9410000c0000000000020", "547009a24c906f2a138800ad76b7b91deed3e06d715145b199a09dafe1a184af", false, "c53a4e32556ab33c561d01d54af5068b98ef10749caf3fd19d4886bf79a3be3b"),
        Target(80636, "sendReport", 42648365, 211, "48f9410000c0000000000020", "15eec18ae3ac77aaae7c7fe366bde9405f5a78032500d5dbb2b93b1ed01afda3", false, "e106f0219ba271f1008b335b005bebd3fa8e45d34b9ace055078d953930f8297"),
        Target(82345, "handleChannelSelect", 43248295, 337, "481f430000c0000000000020", "5fcab027c19ba5c2c8683728d9a7fcab53a28262b9cdd607c983c3a0b9cfb605", false, "d959d4d9a77fd88c91e80b48008fbf2c575471c060a6714152f03b33b6c80f9c"),
        Target(82491, "flushDelayLogs", 43291781, 164, "6439430000c0000000000020", "5616befa78a63a95df8684e4d9412042457c8a58082638105647bfafcedfc493", false, "cdb0214cd892989879ffe0954bff145c2469ae7359a29a698d5213bf56dbf195"),
        Target(82492, "onTimersDelayCallback", 43291945, 247, "9039430000c0000000000020", "d4ad74aa620481672538f87a6556bc2d4d1463fb77c324f109746b56947755c2", false, "279546d13445b6f2a0ccd1d500e40e01adc6cfc903b4b7535de660df20415ca6"),
        Target(82493, "setupLibdiscoreTimersMonitor", 43292192, 39, "bc39430000c0000000000020", "e4212c1faf4aad025d609d30e0300cde5e77dc8fb182d7a2582c9eba96cc95ad", false, "131d0ee1d9ed3d49cc1c41f062b5cd9a11f97dde2f3b793cf98c48b231545fcf"),
    )
    val crash = listOf(
        Target(84727, "send", 43560401, 180, "18ae440000c0000000000020", "4c16a8f7edcd0aacc60cf5c6734c9ef06da5d1c52a50a915387a7d4eab501be0", true, "28635aceb1313c129dc3bff70bf29ba6c2f867a49d97f8c0d20d089b4381ad55"),
        Target(113271, "send", 45746897, 181, "d054570000c0000000000020", "cbef70bf8659f425769ed381eda915ce03d6b3a261661891e29fb2df14b82850", true, "0cd1d75dd1d03d3eb1b0cea9737749860546df8446b40a61c688dae2ebd4be44"),
        Target(24481, "initSentry", 29029677, 43, "a0351c0000c0000000000020", "1cf57f4bcbb176532ab1831e6b4c98ab81c801adaf3170cb72524213a1de113d", false, "6f46ceece426eab3b254d0e87c8757243db388baf9acee059ed6f222c4751921"),
        Target(21453, "addSentryBreadcrumb", 28581624, 97, "c0251a0000c0000000000020", "3762e32123c5a861f46d02dd4e3a4423c99436fa5ffb5ce73de3836b03fa258a", false, "6872296938f17785544ce2d4949b1b2c2caedb371dee318c9129e500af33b43a"),
        Target(24462, "setUser", 29026346, 104, "4c321c0000c0000000000020", "ca624f17371fa88b9b675bff483d5ccc082396b42336e518cb5ef44a10b3e84e", false, "52c14ae3c8e6e09e1ff2591f50f502389f2de8512a95c2de1a0993cab721406c"),
        Target(24463, "clearUser", 29026450, 78, "78321c0000c0000000000020", "ada39ad49571fb7e0931c3c10bc910c3af39fac099cfc483cbf4320b8b2b7828", false, "f8194a6ceba0e0e5370a11d4ede2c82d9626bd5cb12d837690d9d99e296e53fd"),
        Target(24464, "setTags", 29026528, 48, "a4321c0000c0000000000020", "abf60f2bb3046ae794ab86fc6bfc27577d55b36e46cb9b12fbfb01ffc9824528", false, "ea1839b7ed9691ad884cda157f0db84b6c30ce2e502eb0f32976e0d1ca4cf5ac"),
        Target(24465, "setExtra", 29026576, 48, "d0321c0000c0000000000020", "1858bec17adb41f33665dab8ef95b39d8add926cb787eff9deb2075bc36b4c88", false, "32ba78fa8242adb139da3467ca5b2111c05efe042bffdc0eca8cb80600032a8d"),
        Target(24466, "captureException", 29026624, 87, "fc321c0000c0000000000020", "2663c9d14dfcae7fcf831718db738c4db356a105e64a007a3052c32a56d0948c", false, "6a9a2e146f82283f7d56f795bda1f9b9159b3db052ab82d65e1f286d3b8b9846"),
        Target(24467, "captureCrash", 29026711, 162, "28331c0000c0000000000020", "a7e4452fa8001fbf394a6e0506c6229ac182dd2e49535574044958dfe7d896f2", false, "72873e2c53cbde9e71e6c29010f1ce67d3764730c4c49a3c9e725459d78dd040"),
        Target(24468, "captureMessage", 29026873, 90, "54331c0000c0000000000020", "3039c994bccb2ddb149870507713a9b7463ff45277468827538cb58f27a6ee44", false, "5b981c9ff471968e0a9ac4b3fe4904416c5600d463b9e40d69d17fed9648fb17"),
        Target(24469, "addFeatureFlag", 29026963, 106, "80331c0000c0000000000020", "9f7a2dfe85b0714d71c8105757eb9d1d61212197f4d6ad4c56df73a7ad87240a", false, "cb9cb9b357186ce9a95aa556676345f7dd9a2603e6b140c08d9d91dfb41f3feb"),
        Target(24470, "addBreadcrumb", 29027069, 54, "ac331c0000c0000000000020", "0a1d443d26927c6c49776606e92da1748ffce6fedff46a77e02e5b00776bedec", false, "5be7399e5c7bc3ec7bc1ffd34773634f9a299672d86f0e3cd079e0b2a28f9344"),
        Target(24475, "getLastCrashReport", 29027338, 35, "98341c0000c0000000000020", "7edb0e2095fc0075e76e2fe2b858531917fc4811f4faeeddf4195fe9a81b6498", true, "69647383fe9bafbdd6f743cbfb22fb68821bd6cae870a3020f9a51ba85bd4a2a"),
        Target(24480, "trackCrash", 29028406, 1271, "74351c0000c0000000000020", "aa9ee0c6229362d0027401f6da9aa8a95bd2f3342f6d86c9bad43abca251351e", false, "7e4a9de7bf11e70f3cce7fa37dd1cad3299e481f152d6b25ff9d4996f367888f"),
        Target(82494, "init", 43292231, 23, "e839430000c0000000000020", "2fae34460cfc713ae1c7302310b8687806d80f169695797a0b5d286a03a132ce", false, "9143c2f01ed72d97602af25d82a174c6c78e876159cbfbb97e0b05d8aed83ad2"),
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
