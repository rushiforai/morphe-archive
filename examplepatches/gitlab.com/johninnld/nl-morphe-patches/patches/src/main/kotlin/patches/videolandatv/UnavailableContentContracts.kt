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
    "LXk/a\$a;" to "f5eafdde863dff8a1c9b86478778a055bbc75095669dee63e0486ad651d0177e",
    "LXk/a\$b;" to "8bfbc578ece747940073d4b95d91f2adbf02ec1af6d1be74dd7251b6e1957ab7",
    "LXk/a;" to "24e208c4eba778ccf57c8afd233148c522a7a2d38e0e1ada84be852e5ac9c362",

    "LWo/a;" to "07b30ea4db7615cec468450022d5caa1a7e1028d59e4ac1caaaec452846a4083",
    "Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;" to "34830308008634425ef53f4078d061ca687f2791316e7de6a7fc25dd2cea8098",
    "Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;" to "c34a4522dcb68b117fad7bc6978bbaaa2bd2386f66820f5bc26b231127388889",

    "Lvn/k;" to "349e3509555e34eb2224cf34be30b84a48ec76f68ff20ddbcfe09b63306f37c6",
    "Landroidx/recyclerview/widget/RecyclerView\$a;" to "cb3f71292ae526a2fc94c9321e4cda03fb05d9cd6c317fa1ceaff7f2f88daaa2",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Action;" to "a26d1913376dd3492f28db5e6b5b73590d840b8bfd0240fe7a91ea84f82d49a5",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/AlternativeBlockContent;" to "1298506a3cf2e21eff5fc70f39dbce224f43771d5f6e13ea4b59a2c4008b1279",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Bag;" to "a23f03a67fb3009891a51f203c9c281f1cf8f8c5e571f126e51e108e28bc4645",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;" to "9a27bb1611e5620541e97b5bcdc28b727c9e4c5da09d31087a0cfffdfa71b229",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Block\$LayoutBlock;" to "89c854756b9b40fda679c467326f434ffdf90de01d5fdc5a2167827cb851caa3",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/BlockTemplateId;" to "e224e23a4ffd1141933cb910aa8709f97a014a44deed664fcdf8785797e0c845",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/BlockTheme;" to "4c764ffd1a871e3e2489bd1e4237ed419894424c5a5008be54fe5a0a08853988",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Item;" to "63c1434c64574523d153f20458aaea5c4bf583971f0d4f73b5b69bf394d2044c",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/ItemPagination;" to "f0418c52b1efbdcf3f6a03b2e511a4f94492af364dd1f9ca7f8a007e46cb1476",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/LayoutBlockContent;" to "fcb77e282d453e92820fc4ad4af45c41a23e71112472107782db1e4ae374c857",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target;" to "64f127816c3871c7ff60df14a2d7f56efe4a414a216a1db7bf326d641ce60086",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock;" to "d2f646dbc92b77913fddd11cbfca3a1d6509d8e5e36d70c3668a36d5f65f8173",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock\$RequireSubscriptionLock;" to "c896060c0b5007ffe8db46b13cc4395e7fa08f8239a6f9e056281451f884bc91",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$OptionalTargetLock;" to "04677b557747c19ee255c0bd709d6082089874d1b3ef04b6f8a1947f337a2e6e",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Title;" to "ef989e9e8e6916d0a957c62a420d56d21ebe6ce3942e4439a651fb505d9fe712",
    "Lf8/a;" to "b6beb1c8aaad165d8e78b7a4e6dbe5420fc15de894e34d3c1b16acd6779ccad9",
    "Ly4/V1;" to "b575489197046dca3264c3d412a0c06f482991475fd567ec586520ffa1e8ed36",
    "Lg8/a;" to "f6881e1a62ee8b4b40de1518ebc18c160debb80295b72fbdcb2c84f2f76f9169",
    "Ll8/Q;" to "4de7eccdfcca1040c20818961f1392014d70683f5a909761bf49e69b4fd6591f",
    "Ly4/A1\$b;" to "8d00699fbe842f6a55fe0d5a504238aba933be469e9b6922fe12260d0d44af54",
    "Ly4/A1\$c;" to "9178a9b097e552cdc06d7846a7b8b247b5044eef3d8eb2a83a15d14e860f2393",
    "Ly4/A1\$e;" to "f034b5d7e303f17855709cfad17f4af387b794ad7cebd1089d9e3bc45ce10162",
    "Ly4/A1;" to "0a0ac3b508bbfbebef374dad2c0e2dadd5915163ffe8a427778b15c77914dfc7",
    "Ly4/H1;" to "85b63675e43a4bd53318887e5f8ca38fd1588f756181d75a4594d0e83fdc43ba",
    "Ly4/G;" to "6221739f76e9d72ad869ceb7d8c575c7e99b932ec4d394b5b6cfd05c80cf6198",
    "Ly4/V1\$a;" to "b8fda819b4951751f04a5e834c47d3ce6da2e44ff292eb9cc2abdb6330eae42c",
    "Ly4/V1\$a\$a;" to "855169e82a2fdb484a6058f375807762ba2e72192f74ef024b467c2c707c6aed",
    "Ly4/V1\$a\$c;" to "92a628104065ad2b15ef517da5c61c766000bcd277a1ac347a348f9037c578de",
    "Ly4/V1\$a\$d;" to "e863b2d42001c1c22dcfbdff4b6e35b58bbc3bd1392321143db4da349a5d57a8",
    "Ly4/V1\$b\$a;" to "373f6b5a1a75112ad25704790300b6352fb5923ad9de3b31681b6369119b7dd6",
    "Ly4/V1\$b\$b;" to "795b6e029ac2a8adb43efcbf326dfe5931c4e60ed3b3ca574148f0e7c58ef9c1",
    "Ly4/V1\$b\$c;" to "8a8e048995a343d083e5a04ffe850eb9977037d5fcf18185800010bd9ff2f5c7",
    "Ly4/W1;" to "cc7191edbaec2e18f5b0bc5cfb2d8278456873b1e7d1b669421ce75c477d3c44",
    "Ly4/g0;" to "f519a05a612b625c04c623c75103325951deefafd6a0920915c7dc90c168e0ef",
    "Ly4/n0;" to "af55eca8d111931f74e0fda568e34a3e569f4ade186e53a9a589938674198269",
    "Llb/B;" to "a339a152cc2fdc5f41b769406813f86a137285a4feaa72df49b80c13abb68be3",
    "Lal/s;" to "446eedbfd7cdf2246d12099c9be5d972cc937b0c12bdbbf2cc1d7220e5e1d458",
    "Lrv/i;" to "b88898a7436f2faec4c196646664bdcfdc088fb5f70f3ffafb93bc2d8efcd6d8",
    "Lrv/d;" to "3d7b7cd20ce90bbc87434d4890de5a4b2b0f95a0f58fe855a9fb5dd6d94ce96a",
    "Ltv/a;" to "a5510d437f38117decf13c7e6150d0cf64015e6bfab38e141de36223c250caed",
    "Ltv/c;" to "2733ef94a6ddfa8efd2f8942415e98b7a5bac92cda4eb229b636acd62a8c480d",
    "LTv/x;" to "62043f723dcf0c10e3706e2daf1a8ade07393945b50a311360958803d490f7fe",
    "LBv/a;" to "4e79282ca3a181928a7840538bedc3e962fd8ef5364e80a3b40b6bfd713904fd",
    "Lnv/M;" to "946035d4a8f09529e3753f8fcffeeaaa0c4393f6415fda681a84cb9b9d6a7739",
    "Lrv/j;" to "7cf42eea9076bfaf1db27d94f9787490bee9f61d4746e192f973a094e869d4ff",
    "Lsv/a;" to "2104979108de49d545761548b59a1963591da278900c0fbd3dd7e174d4351e17",
    "Ld0/t1;" to "5877f6ae9ebd311d9d3915d667fcf135c634ddbd46fd94bbb3653fc48354411c",
    "Ld0/s0;" to "7affe9fd76a4f7844ce7135f06c7c237273a0b0680e2d350b54d6c8411a3f751",
    "Landroidx/recyclerview/widget/RecyclerView\$b;" to "4bb10e61c67a6a029470c0a60ec7c66df857fbf238355a25257c5e9a3c5d850d",
    "Ly4/B;" to "ecb4d7275d9a1fc3c39d98d8ef85757487c20fe1902f32c0945502723466040e",
    "Ly4/s0;" to "b305e5c37bd294a2003476c31e805ae4f7e264b8c442d20d9c40a1ab013fb2e6",
    "Ly4/s0\$b;" to "e46f781e8f928108f26f14bd3496c4bfaec66b789c9d466728eff354ff33bb15",
    "Lz4/c;" to "b28e4d2c52ef863d1bef9a6f312167296b7df684b657c80b6db430bce4082a42",
    "Lcom/bedrockstreaming/tornado/compose/block/belly/BellyBlockFactory;" to "bc067f1a2c2ac4a436e242d4570994ee51543fc199c5af316bfa413c42925da8",
    "Lcom/bedrockstreaming/tornado/compose/block/grid/GridBlockFactory;" to "e7e0c2f9cebbbd4acefab373ad08ccedd2eb47de0bcd7c80783d055ad3918e17",
    "Lcom/bedrockstreaming/tornado/compose/block/grid/PaginatedGridBlockFactory;" to "bf5167c1b729303c4ebffebee9cb6798dc0cb9b7f0aee12b8c445f9694cc2f40",
    "Lcom/bedrockstreaming/tornado/compose/block/list/HorizontalListBlockFactory;" to "3e4bda77717cbb661623a7cec1f88b04789a2a4af0d5cb7afb380c1f3291bddf",
    "Lsl/k;" to "e2107b32361c51f6680aa38a4c9a3bb0ea51a449aa00ff75acdda7090725c7ac",

    )

context(context: BytecodePatchContext)
internal fun unavailableTargets() = run {
    unavailableClasses.forEach { (owner, expected) ->
        check(unavailableClassDigest(context.mutableClassDefBy(owner)) == expected) { "Changed Videoland availability ABI: $owner" }
    }
    val block = "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;"
    val legacy = exact("Lf8/a;", "<init>(${block}Ly4/A1;I)V", 5, 7)
    val compose = exact("Lh8/a;", "<init>(${block}LWv/j;I)V", 5, 9)
    val factory = exact("Ll8/Q;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 22, 55)
    val row = exact("Lal/s;", "c()I", 2, 2)
    listOf(legacy to "7d918a68e94f33d640de7a6ead3a503855d483271c7fa3484a59eadcd2ac7ce0",
        compose to "78ce27012252d26ea24f146a2516fc1cdbaf3aa06d5a235afbf5ccadc4e21581",
        factory to "158b243c28711e23ecbbca30daf231031485109baab42bd6690cf9966f2fbfbe",
        row to "b977c4650734b6680561ba88afa10c3f921fc3c09033b76560776019f298591f")
        .forEach { (method, hash) -> check(subscriptionMethodDigest(method) == hash) { "Changed availability hook: ${method.definingClass}" } }
    val renders = unavailableRenderHooks.map { hook ->
        exact(hook.owner, hook.signature, hook.registers, hook.count).also {
            check(subscriptionMethodDigest(it) == hook.digest) { "Changed availability rendering hook: ${hook.owner}" }
        }
    }
    val action = exact("Lvn/k;", "c(Lcom/bedrockstreaming/component/layout/domain/core/model/Action;Lvn/e;)Lvn/f;", 9, 82)
    check(subscriptionMethodDigest(action) == "1e5231747bf3845ae1baeadf0376cbf80ffa3cb8c3ff7b7ef889aa5be19d6ca3")
    val cover = exact("LWo/a;", "C(Ljava/util/List;)V", 4, 19)
    check(subscriptionMethodDigest(cover) == "f85e9cc4678a98d80681ffdf6d9a9dcc85005ed0b36bc862dcd557c40948e807")
    val notification = exact("LXk/a\$b;", "a()V", 4, 17)
    check(subscriptionMethodDigest(notification) == "0c818b569c050a4f4d4dbd560e9a84befb8925535eb76c8682ebcaafe9ab82fe")
    listOf(legacy, compose, factory, row) + renders + action + cover + notification
}

internal data class UnavailableRenderHook(val owner: String, val signature: String, val registers: Int,
    val count: Int, val digest: String, val insertion: Int, val exit: Int,
    val block: Int, val paging: Int, val scratch: Int)
internal const val nestedGridRenderer = "Lsl/k;"
internal val unavailableRenderHooks = listOf(
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/list/HorizontalListBlockFactory;", "a(Lql/c;Lu0/r;Ld0/o;I)V", 25, 107, "4a96d704dfb28c150db6c849b4aaf8c6a38cc0d3305b508e81582c66e42df61c", 63, 95, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/grid/GridBlockFactory;", "a(Lql/c;Lu0/r;Ld0/o;I)V", 26, 108, "e4d67f57f766fd0deb5fb1aa16be41b54a584eb0959d1f32c691de7d7aebe064", 63, 96, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/belly/BellyBlockFactory;", "a(Lql/c;Lu0/r;Ld0/o;I)V", 23, 104, "f08e7d530636b4b12722248e6f54d3ed65f64fad1ab53d0d2378dfea8abc33cf", 63, 92, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/grid/PaginatedGridBlockFactory;", "a(Lql/c;Lu0/r;Ld0/o;I)V", 26, 193, "3ccca3fb5289b3d3c07e79da741ea18551280df6477c1322fcb1e011525b9afc", 143, 178, 6, 2, 3),
    UnavailableRenderHook(nestedGridRenderer, "b(Lh8/a;Lcom/bedrockstreaming/tornado/compose/renderer/TemplateRenderer;Ljava/util/Map;LKl/G;ZLu0/r;Lcom/bedrockstreaming/component/layout/domain/core/model/Title;LK/F;Lsl/d;LBv/e;LBv/f;LBv/e;LBv/e;Ld0/o;II)V", 50, 504, "c2f6864abca271ebedf181a3f625d2f9ab156fcfb75d654085fb46c20fdf8406", 258, 480, 7, 16, 3),
)
