package patches.videolandatv

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.security.MessageDigest
import patches.atv.exact

/** Freeze both runtime declarations and the native implementations they invoke. */
internal fun unavailableClassDigest(type: ClassDef): String {
    val text = buildString {
        append(type.type).append('/').append(type.accessFlags).append('/').append(type.superclass).append('/').append(type.interfaces.sorted()).append('\n')
        type.fields.sortedBy { it.name + ":" + it.type }.forEach {
            append(it.name).append(':').append(it.type).append('/').append(it.accessFlags).append('/').append(it.initialValue).append('\n')
        }
        type.methods.sortedBy { it.name + it.parameterTypes.joinToString("") + it.returnType }.forEach {
            append(it.name).append('(').append(it.parameterTypes.joinToString("")).append(')').append(it.returnType).append('/').append(it.accessFlags).append('/')
            append(if (it.implementation == null) "abstract" else subscriptionMethodDigest(it)).append('\n')
        }
    }
    return MessageDigest.getInstance("SHA-256").digest(text.toByteArray(Charsets.UTF_8))
        .joinToString("") { "%02x".format(it.toInt() and 255) }
}

// Populated from the publisher base DEX; source and independent graph contracts
// identify the exact inspected build. All checks run before any hook mutation.
internal val unavailableClasses = mapOf(
    "LNk/a\$a;" to "24366a111ed6021da47962686da2b6eca62bcee7e6a98b626a09275d268fd780",
    "LNk/a\$b;" to "5bad0453e05f7f4438f0f072d859093756047a1d8c7ac92bbe7c49a4bb6c4c47",
    "LNk/a;" to "4d2bb0a34236b3a33fcdd94bbc9104fb5e42acec6dc8bbef0310e168d98b7633",

    "LEo/a;" to "5730af1f7bfb9ac30eb805022be511c1ecb52d1676b9885f233e421d9b69a96f",
    "Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;" to "bdcbfb6ba578b7cd80057ff7127a41549367cc03c01bc8ac8decd7a35cf766fd",
    "Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;" to "b9742ebd49ef922745a953af52982a552db193117568f801a55d9b57875c4fdb",

    "Lkn/k;" to "17640e22cec803efdf4d90f0ece8f5993928f87fea14ce841779b03fadc2bfe2",
    "Landroidx/recyclerview/widget/RecyclerView\$a;" to "cb3f71292ae526a2fc94c9321e4cda03fb05d9cd6c317fa1ceaff7f2f88daaa2",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Action;" to "a26d1913376dd3492f28db5e6b5b73590d840b8bfd0240fe7a91ea84f82d49a5",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/AlternativeBlockContent;" to "0f4899d1f30009fb08c9d0150cb9234acf1852e59fa3b3190ce6c45a57bf7186",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Bag;" to "ff2228b8f33ab047e89a86571159450f1fc224b0268f7ba2999d31af06db876a",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;" to "7fbc6086b0f760cdc278a0cd5195ed9dde16319d39ff97e082136b93cdd4e162",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Block\$LayoutBlock;" to "edcb7757507511ab6a316087ea52b75ed98080f5ec918db7746ba21c50551d86",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/BlockTemplateId;" to "5e282c9a3668dcfb92c796737096c1d500889c5823f29b60f05b5aba858178f7",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/BlockTheme;" to "4c764ffd1a871e3e2489bd1e4237ed419894424c5a5008be54fe5a0a08853988",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Item;" to "02612ef2e45f686fc750082cf6d1055e438b9dd479fa72b50a3c6db46418a6d1",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/ItemPagination;" to "8c39baa712bc7090ed99bbb439867a43cd7639be3a74ef4668c8825741ba41c9",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/LayoutBlockContent;" to "12522039a1eac21f991db067043da1b4dc5ef0b6e2dcbd1e5eba168c5e5a8660",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target;" to "64f127816c3871c7ff60df14a2d7f56efe4a414a216a1db7bf326d641ce60086",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock;" to "d2f646dbc92b77913fddd11cbfca3a1d6509d8e5e36d70c3668a36d5f65f8173",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock\$RequireSubscriptionLock;" to "c896060c0b5007ffe8db46b13cc4395e7fa08f8239a6f9e056281451f884bc91",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$OptionalTargetLock;" to "04677b557747c19ee255c0bd709d6082089874d1b3ef04b6f8a1947f337a2e6e",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Title;" to "e1c5566c322103cb9e703eac1719ef56a26e005d8614ed0879f22cf00541e513",
    "Ld8/a;" to "a1163dc5306b890b715009a0864e2a2e5bc89a04fd13729100ad0a320d687558",
    "Lw4/W1;" to "dca8921001b0f78e5facc7cae6a7976f0c0b5c07eeeda04867b7b4577684be06",
    "Le8/a;" to "5555e3e0fc60bc2e262ea2203fd66af264919f63a555bbee48796790d66d516e",
    "Lj8/Q;" to "b473c9aa4bf8b883f34e532238f44d78285f151373ea92520456236b5002eec8",
    "Lw4/A1\$b;" to "be575572145a14de5a8d1726b604deac13aa06dfa5535c6355d4004a0c578556",
    "Lw4/A1\$c;" to "67ff018331844fc27b28b39f5c169129d91d30443eb58d90416e1e7a8ac075c1",
    "Lw4/A1\$e;" to "04631679cccf5769899db76d25adb9ce59168c03f3f38fff7f647c8c23511ac0",
    "Lw4/A1;" to "ef5aeeacc386963e55a4a699dc12684478c70f2a40c02fe31664c7cb049fedf1",
    "Lw4/H1;" to "2bbf05c4f53b7fbc022458b9355279209cc2c1c2f3fcb823271f311b3536f223",
    "Lw4/H;" to "75cf43218827694b3559d2068306f79bb65f48b26ae0b3418a5e329bef58dc61",
    "Lw4/W1\$a;" to "4c5aa3d238e25c08ad1e6fc4d6fad21a9f1ee7df3a95469e0698033a6f830f67",
    "Lw4/W1\$a\$a;" to "e737be74a0f5cdd20823b556444fe97b9fc916f9ce40571dbea0d2d72302a0df",
    "Lw4/W1\$a\$c;" to "12f846c2f95e4fb9eaf177507e56cc02d0552cd0ae85364325e71d50be491d2a",
    "Lw4/W1\$a\$d;" to "2da2866eede7a74fdc50058ecd7a5e6b47d5aecca59ddfd4dd12665260e3f4ea",
    "Lw4/W1\$b\$a;" to "576152ad8cb2c80f2821b2fc9cc0ff976d15a71baf6a5edf984da4305770583b",
    "Lw4/W1\$b\$b;" to "ded3884b0b535889d47b1541876a4dc5e071ba6b64dd668e10afa1af1386b3de",
    "Lw4/W1\$b\$c;" to "a45e75d15c87fa33594188fd076d3b6c92ee9402b9e19f3d2021407705facbae",
    "Lw4/X1;" to "5f1c1b49dbbf78e465baa2f27c638bc8a1370c554ef38bf653160550706788f8",
    "Lw4/h0;" to "494c0698fd5a81961d8cfdd8b47173c0ca0da16880e27f40335e55370f753653",
    "Lw4/o0;" to "2b97b5e254652aa2b5aac8e5b1c7939846683dc4827f45ccbc07f762297a3b86",
    "Ljq/g;" to "2eab55161f6e742b80fde7b19ef18a9be6c5cd836f0df6ca852991b9e77e55f6",
    "LQk/t;" to "aa096e4e86a50351731fb3eaead5d7e4daa1c3ad615a1e33d34f0d74f35568e3",
    "LZu/i;" to "4423c88a540313025f1d68a6a57dc3a3240c7f942f30a1ce9c4de26c09439baa",
    "LZu/d;" to "88861b6272949911e1956639db5b592a7f81dc11091fd9c67696dad330779ea7",
    "Lbv/a;" to "6ab43b5805bba1b93f62b3d86b5cc571f6107d6d9fe7fe2eb3a55786a5dc334f",
    "Lbv/c;" to "933b01bbb9638408dd39aad0796a87edb298f3d140a2300a1b79a85bed22b03f",
    "LBv/x;" to "3a53cc3f1d29401b1f028f2d33ba7f8837561260fb3fe6ac1c7449665eb60b42",
    "Ljv/a;" to "f1b419b941d534c4b96702aec047ee9b8b0f72585b0cf2ac4f525d63e8c5e448",
    "LVu/M;" to "d9ff92b762f6533558b5e204403e1e6fd4e48cfb6b28e36784484bba35ca7eff",
    "LZu/j;" to "3a9625096929abe2ccce3c79c66cbbd6a67cacb63988dc035b308a45c9800f4b",
    "Lav/a;" to "858c17ef6867deaab469d11f222807dade7a81962d42813fdad7ba0ed7c15a31",
    "Ld0/q1;" to "5348f2f54e31f30c6d64da0e5957aa9ab92e3066a274f2b5ef0e7939a5525444",
    "Ld0/q0;" to "4d01bf93f50ca5c96d4caffa008af6fcf9008ae0a7f9f50fd72a35f29998c219",
    "Landroidx/recyclerview/widget/RecyclerView\$b;" to "4bb10e61c67a6a029470c0a60ec7c66df857fbf238355a25257c5e9a3c5d850d",
    "Lw4/C;" to "19611d22830b0df6aac8cf034091265bf4aaeb1f810ddcd3cc286d9a2169b1be",
    "Lw4/s0;" to "68eb6dd84dad8e5ff9ee4db7de528c133d44c38a59d9f74dfebff67854daf3ed",
    "Lw4/s0\$b;" to "f33a66380aec95e9488ae5cf4e811c77858b2a337a7b1de6c4900f511ac6bd9f",
    "Lx4/c;" to "80a82d711e6ace3b7e512c8e9d632bb54db238549bad0484d5e6316164b4bcde",
    "Lcom/bedrockstreaming/tornado/compose/block/belly/BellyBlockFactory;" to "e3decc5c2c3e510a0f8d138d1a28ea1c59fc6a5efaef473fda1364e335ad9d19",
    "Lcom/bedrockstreaming/tornado/compose/block/grid/GridBlockFactory;" to "8ee0c6984d049522bc207983bb8e38d917e7613eaa9d94aa6442d55661b7c44f",
    "Lcom/bedrockstreaming/tornado/compose/block/grid/PaginatedGridBlockFactory;" to "026e47831a69c379c86db3a220f5f9967445137af1510691faac50a3c63143e7",
    "Lcom/bedrockstreaming/tornado/compose/block/list/HorizontalListBlockFactory;" to "68af5b10f88da3b45068fa748ce108458fdecbfa7a987a21391f2070c1915d35",
    "Lil/l;" to "d47121be777304958650939074b6d726b9ddd847616b55e24659e79cd440a111",

)

context(context: BytecodePatchContext)
internal fun unavailableTargets() = run {
    unavailableClasses.forEach { (owner, expected) ->
        check(unavailableClassDigest(context.mutableClassDefBy(owner)) == expected) { "Changed Videoland availability ABI: $owner" }
    }
    val block = "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;"
    val legacy = exact("Ld8/a;", "<init>(${block}Lw4/A1;I)V", 5, 7)
    val compose = exact("Lf8/a;", "<init>(${block}LEv/j;I)V", 5, 9)
    val factory = exact("Lj8/Q;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 22, 55)
    val row = exact("LQk/t;", "c()I", 2, 2)
    listOf(legacy to "16b4e0c1fc345099e4a735fbbef986d3bdcc8b4e837155b4c00e2675dad3fc1e",
        compose to "c2eeb2b5b6126eb870cbe42babab7f3bc125fab49401733887c23426fccfb18e",
        factory to "a30e6394d183a4f947301834bf64d28176907d61eb8302ddd58d795327b4fe50",
        row to "b977c4650734b6680561ba88afa10c3f921fc3c09033b76560776019f298591f")
        .forEach { (method, hash) -> check(subscriptionMethodDigest(method) == hash) { "Changed availability hook: ${method.definingClass}" } }
    val renders = unavailableRenderHooks.map { hook ->
        exact(hook.owner, hook.signature, hook.registers, hook.count).also {
            check(subscriptionMethodDigest(it) == hook.digest) { "Changed availability rendering hook: ${hook.owner}" }
        }
    }
    val action = exact("Lkn/k;", "c(Lcom/bedrockstreaming/component/layout/domain/core/model/Action;Lkn/e;)Lkn/f;", 9, 82)
    check(subscriptionMethodDigest(action) == "485f8310d6d93e91f368a7fe1c82bb0f57bf8e0b3067aa0f53e2cd99daf9006f")
    val cover = exact("LEo/a;", "r(Ljava/util/List;)V", 4, 19)
    check(subscriptionMethodDigest(cover) == "9551340bb95b08aa7344b6e0fefe2bb84d24101db4e39995c4a218d76bb35f3c")
    val notification = exact("LNk/a\$b;", "a()V", 4, 17)
    check(subscriptionMethodDigest(notification) == "e7745edd3ac8e36ac885db36b3e06ffee96bd1634b297999f8bd875bdb126449")
    listOf(legacy, compose, factory, row) + renders + action + cover + notification
}

internal data class UnavailableRenderHook(val owner: String, val signature: String, val registers: Int,
    val count: Int, val digest: String, val insertion: Int, val exit: Int,
    val block: Int, val paging: Int, val scratch: Int)
internal val unavailableRenderHooks = listOf(
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/list/HorizontalListBlockFactory;", "a(Lgl/c;Lu0/r;Ld0/n;I)V", 25, 107, "1da0a63f3f0373b280eb6b72c8bc9710b9d89db2e0402e831259a3920110db9b", 63, 95, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/grid/GridBlockFactory;", "a(Lgl/c;Lu0/r;Ld0/n;I)V", 26, 108, "69bc8d0bac352c5cd0aafd0bf6509fa4c942766c5c1abb5ccf8c34330777280f", 63, 96, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/belly/BellyBlockFactory;", "a(Lgl/c;Lu0/r;Ld0/n;I)V", 23, 104, "6f1a8e7df8558e38bd35602d59769550d4cf51e784481c709e3e07ba8fbbb2cb", 63, 92, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/grid/PaginatedGridBlockFactory;", "a(Lgl/c;Lu0/r;Ld0/n;I)V", 26, 193, "2640cf3c02e272e0f15a6779f2419a42693ee3e4d42d9bf4d47b94247a4e0f2b", 147, 178, 1, 2, 0),
    UnavailableRenderHook("Lil/l;", "b(Lf8/a;Lcom/bedrockstreaming/tornado/compose/renderer/TemplateRenderer;Ljava/util/Map;LAl/T;ZLu0/r;LK/F;Lil/e;Ljv/e;Ljv/f;Ljv/e;Ljv/e;Ld0/n;I)V", 36, 357, "4eea37d99cbef6f929170c07fc5702517c84088894a7f61592f619e5cb29b274", 213, 337, 0, 7, 9),
)
