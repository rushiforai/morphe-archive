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
    "LMk/a\$a;" to "ae299b731af4d6aa132986a4e7c367f0a8f27630ed7b52b3052523e2b3d3ef98",
    "LMk/a\$b;" to "359e1dbcc8adf35978472df00d159fc5ab87480819d859722755480fe47784b9",
    "LMk/a;" to "ac0cda36b4052f57af1a4d36fc8c2c6885882386b1253e5b92b9de6c6bd9d94f",

    "LIo/a;" to "47cd7173bef8bb7e801497b91ffd69cc8e78120eb608318d954e3d447a689d25",
    "Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;" to "4e35a485d16c998a46263cda9f7d15817814b236e7e9d11fecbd82686d061016",
    "Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;" to "1bbf25f2f3fa04357289d006d846cc3214920a200b7a24aa991dfed7380e4856",

    "Ljn/k;" to "1034829a4cc2b97ff67fd37659ab26ba01a502c9a7ad345d5f8a5eb49f6e2dbf",
    "Landroidx/recyclerview/widget/RecyclerView\$a;" to "cb3f71292ae526a2fc94c9321e4cda03fb05d9cd6c317fa1ceaff7f2f88daaa2",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Action;" to "a26d1913376dd3492f28db5e6b5b73590d840b8bfd0240fe7a91ea84f82d49a5",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/AlternativeBlockContent;" to "1b5b315a9fb668429e1a5be1f8d443019d9e0e59125c9cf528c85ae48fa4a572",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Bag;" to "61f18d377a732d0abdbdf341f0e862829b51821a4697f097faa5ccb6ed1edad3",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;" to "5edcde917d6245ca62d5fb81787c97f9212500f6a2ef57ca8a6d823c64d68c59",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Block\$LayoutBlock;" to "8d7bb84e13da6c206177de3054f8b3f4f39a2a824c8b7762e781fae93c818115",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/BlockTemplateId;" to "a900e1f8852a4bde305cfc968a7a30310ae3061b599d5bb6bccf5d990f0876b2",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/BlockTheme;" to "4c764ffd1a871e3e2489bd1e4237ed419894424c5a5008be54fe5a0a08853988",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Item;" to "cdf857fc455fb7cf5adcc6d3bf7f75098b5f880ad6b18e7047d9a3c909a5c447",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/ItemPagination;" to "0128511382d80108a09d7287fda65222e543214f5aceab556f8e0389de3fb14e",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/LayoutBlockContent;" to "297d282dd3797323d9e94eb6e4781296672216d5708b743885612647b40a5514",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target;" to "64f127816c3871c7ff60df14a2d7f56efe4a414a216a1db7bf326d641ce60086",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock;" to "d2f646dbc92b77913fddd11cbfca3a1d6509d8e5e36d70c3668a36d5f65f8173",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock\$RequireSubscriptionLock;" to "c896060c0b5007ffe8db46b13cc4395e7fa08f8239a6f9e056281451f884bc91",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$OptionalTargetLock;" to "04677b557747c19ee255c0bd709d6082089874d1b3ef04b6f8a1947f337a2e6e",
    "Lcom/bedrockstreaming/component/layout/domain/core/model/Title;" to "5388dcd4db92755bbe44292d5ee2af1e9fa4a6eb0d0866cf4f6f4c63b2403cd1",
    "Ld8/a;" to "8e6ea79d8eed0f7c76406e1f189dfdbf4a8441d73e85297d8f5e3ddf7dae934b",
    "Lw4/W1;" to "27f5374929c5048207f345c1a1f0dbb14d9e4fa67f10a4c86ad686505737835b",
    "Le8/a;" to "c66c1d38bb4dbcaa04cdd4894c4c30d9041b5d7171995d0fa7a8514dd12ba331",
    "Lj8/Q;" to "2c77a5b3c3d2a07c1116cc3766fa4bf0a612383fa68e2e88dc5fa149ad1ecf41",
    "Lw4/A1\$b;" to "8566d15191f00415c2835b716d136bb901874dac24a276f35901516d3fb6df1e",
    "Lw4/A1\$c;" to "67ff018331844fc27b28b39f5c169129d91d30443eb58d90416e1e7a8ac075c1",
    "Lw4/A1\$e;" to "04631679cccf5769899db76d25adb9ce59168c03f3f38fff7f647c8c23511ac0",
    "Lw4/A1;" to "6e6c9b030f82889442fd63c6cf09cc1abecabadb83658f6c566270bd80f1c31d",
    "Lw4/H1;" to "2f348b55cdd127a5eb143efd53f8fdb9d8a7719db1a57803439851d38db3e60a",
    "Lw4/H;" to "9c14aeb963de8e639ec5bb88346cec97f24670c252defe653779139f0e354ee9",
    "Lw4/W1\$a;" to "4c5aa3d238e25c08ad1e6fc4d6fad21a9f1ee7df3a95469e0698033a6f830f67",
    "Lw4/W1\$a\$a;" to "e737be74a0f5cdd20823b556444fe97b9fc916f9ce40571dbea0d2d72302a0df",
    "Lw4/W1\$a\$c;" to "12f846c2f95e4fb9eaf177507e56cc02d0552cd0ae85364325e71d50be491d2a",
    "Lw4/W1\$a\$d;" to "2da2866eede7a74fdc50058ecd7a5e6b47d5aecca59ddfd4dd12665260e3f4ea",
    "Lw4/W1\$b\$a;" to "07cfc8e214213cef1fd5daf428c796cddad8608b5a6c8ec8b4615af2d6f04895",
    "Lw4/W1\$b\$b;" to "ded3884b0b535889d47b1541876a4dc5e071ba6b64dd668e10afa1af1386b3de",
    "Lw4/W1\$b\$c;" to "9099811d29266ff29334103284137b309ed1a04abf2aabc2d1aa2f6b9a46324d",
    "Lw4/X1;" to "8e8e7e4193141b66b80df3e2547c5f01b4e863fff0353f81ee91b722729aa318",
    "Lw4/h0;" to "eee4f63eee496494835af92998ec9a4b2658bb92b2c7fa2c0ac4ac1e7027b103",
    "Lw4/o0;" to "68e647495840023a0550be398665b24466346209c041bbdd3f51f11bccf89325",
    // 1.118.0 splits the 1.117.0 merged jq/g helper owner; the cancellation
    // completion check U(Object) consumed by FilteredSource now lives here.
    "LM5/h;" to "b3284c9efcb47ee3cd27c95c4f929a08ac801aad2bf2df2afef802d8b461c63f",
    "LPk/t;" to "e9565a863e7364f952f297d7a1f9d3f508ad2faba64f4911855f1024186a7e44",
    "Ldv/j;" to "dd9930d57f9e611f3e46cdd9c5a79f12d6ba8f1a749060d0c219050b63db8a3e",
    "Ldv/d;" to "a940d68cb455929dffd8ee86bb9f04122501c0ae11c7e78316ab86717961eaec",
    "Lfv/a;" to "e721a56c19a315ea9fe1bf37966e059d55f556b43bad354c84e4c0efea5dfa20",
    "Lfv/c;" to "c7c7dcb05bfb06b2aa5a5a98569079a91d0ef0674c88645b801d39a4d36fb32f",
    "LFv/x;" to "03aa88a81137970827234ae7e61de675d519eb1119e7c13e522b9a6474748d02",
    "Lnv/a;" to "b9f6c702e8fd53c5aba6d241702f92f5f992363e93d57210da0c2859b92476c3",
    "LZu/M;" to "ae60dae3492704a6f60e24e318ecdacb7c30353cdcd5e8a9fe0ed290b3061df7",
    "Ldv/k;" to "44e750094ae38235ce12c176f2bf090d39d1bb964c75651d761ef900a070afdc",
    "Lev/a;" to "5142359dd0b92c0de22050d53590ff66bca1ae0d8c20676a41e07032277a8305",
    "Ld0/q1;" to "5348f2f54e31f30c6d64da0e5957aa9ab92e3066a274f2b5ef0e7939a5525444",
    "Ld0/q0;" to "4d01bf93f50ca5c96d4caffa008af6fcf9008ae0a7f9f50fd72a35f29998c219",
    "Landroidx/recyclerview/widget/RecyclerView\$b;" to "4bb10e61c67a6a029470c0a60ec7c66df857fbf238355a25257c5e9a3c5d850d",
    "Lw4/C;" to "19611d22830b0df6aac8cf034091265bf4aaeb1f810ddcd3cc286d9a2169b1be",
    "Lw4/s0;" to "68eb6dd84dad8e5ff9ee4db7de528c133d44c38a59d9f74dfebff67854daf3ed",
    "Lw4/s0\$b;" to "4b2c6c010bcf26190c2a6a7563ab526ac74f23503659fbbbe1ea1abdb8135f9c",
    "Lx4/c;" to "057fd8939767326e9da7934a6bac54ba263d781cb4be6cf161d82ea77c3364bd",
    "Lcom/bedrockstreaming/tornado/compose/block/belly/BellyBlockFactory;" to "b91321755d6412ab42962ecbb0661f3078760f274952ed9e5dcea49705bc6489",
    "Lcom/bedrockstreaming/tornado/compose/block/grid/GridBlockFactory;" to "6c310f5db74d0e93778abe5778bf41f0f397503501a25dc0acedb22808a26080",
    "Lcom/bedrockstreaming/tornado/compose/block/grid/PaginatedGridBlockFactory;" to "6b8112d44ba5398398b5c4bf376fe616195648906b9312cad254de2a405d0dae",
    "Lcom/bedrockstreaming/tornado/compose/block/list/HorizontalListBlockFactory;" to "caa3e629ee8a4e9a0f6dc88fa23e852e3062118580a9c230f333e52e866da410",
    "Lhl/l;" to "db4e5a831b6ce08ea29d291771a390ee036b72949cb6e191e80d78fe8a15c603",

    )

context(context: BytecodePatchContext)
internal fun unavailableTargets() = run {
    unavailableClasses.forEach { (owner, expected) ->
        check(unavailableClassDigest(context.mutableClassDefBy(owner)) == expected) { "Changed Videoland availability ABI: $owner" }
    }
    val block = "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;"
    val legacy = exact("Ld8/a;", "<init>(${block}Lw4/A1;I)V", 5, 7)
    val compose = exact("Lf8/a;", "<init>(${block}LIv/j;I)V", 5, 9)
    val factory = exact("Lj8/Q;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 22, 55)
    val row = exact("LPk/t;", "c()I", 2, 2)
    listOf(legacy to "16b4e0c1fc345099e4a735fbbef986d3bdcc8b4e837155b4c00e2675dad3fc1e",
        compose to "82046a1210a332263e392707b0f4bee60c0cb8460cdbd8619f17bac7e103b621",
        factory to "5cc35faf7bc3ae8ebca25133f081cfe8e745459c88690cd85cab31342582aa2d",
        row to "b977c4650734b6680561ba88afa10c3f921fc3c09033b76560776019f298591f")
        .forEach { (method, hash) -> check(subscriptionMethodDigest(method) == hash) { "Changed availability hook: ${method.definingClass}" } }
    val renders = unavailableRenderHooks.map { hook ->
        exact(hook.owner, hook.signature, hook.registers, hook.count).also {
            check(subscriptionMethodDigest(it) == hook.digest) { "Changed availability rendering hook: ${hook.owner}" }
        }
    }
    val action = exact("Ljn/k;", "c(Lcom/bedrockstreaming/component/layout/domain/core/model/Action;Ljn/e;)Ljn/f;", 9, 82)
    check(subscriptionMethodDigest(action) == "0777a5ddda0d477d93d0a818021dd43c782713f67858ce609cb191a50f339fdd")
    val cover = exact("LIo/a;", "o(Ljava/util/List;)V", 4, 19)
    check(subscriptionMethodDigest(cover) == "b390ece322e3ac719507d9a63d56a33304d2d686cd740247cc6578d8beb73e6f")
    val notification = exact("LMk/a\$b;", "a()V", 4, 17)
    check(subscriptionMethodDigest(notification) == "a2055a0e71e7ff8ac4e5ada25e0406666a0553fcef63bbeebdbea654ff89315f")
    listOf(legacy, compose, factory, row) + renders + action + cover + notification
}

internal data class UnavailableRenderHook(val owner: String, val signature: String, val registers: Int,
    val count: Int, val digest: String, val insertion: Int, val exit: Int,
    val block: Int, val paging: Int, val scratch: Int)
internal val unavailableRenderHooks = listOf(
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/list/HorizontalListBlockFactory;", "a(Lfl/d;Lu0/r;Ld0/n;I)V", 25, 107, "e7fa9086264e955ba3c8d07aa29781139d038ebe452c87fc8f17b934ba3eadf4", 63, 95, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/grid/GridBlockFactory;", "a(Lfl/d;Lu0/r;Ld0/n;I)V", 26, 108, "f59f69778e5211d34f00feb4676a85a276df303bd94ee77a061acae38d89c7f7", 63, 96, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/belly/BellyBlockFactory;", "a(Lfl/d;Lu0/r;Ld0/n;I)V", 23, 104, "344819b057c3147fd9584120b07370896a58005b947f202687c1f889ab55bf2e", 63, 92, 3, 5, 0),
    UnavailableRenderHook("Lcom/bedrockstreaming/tornado/compose/block/grid/PaginatedGridBlockFactory;", "a(Lfl/d;Lu0/r;Ld0/n;I)V", 26, 193, "2f6a9ad0b408c3623cbd683b275b2de64b71f09323b587623b59c9d6ef680b3e", 147, 178, 1, 2, 0),
    UnavailableRenderHook("Lhl/l;", "b(Lf8/a;Lcom/bedrockstreaming/tornado/compose/renderer/TemplateRenderer;Ljava/util/Map;Lzl/D;ZLu0/r;LK/F;Lhl/e;Lnv/e;Lnv/f;Lnv/e;Lnv/e;Ld0/n;I)V", 36, 357, "1878ef093e2b82183c0c7cef186bed48d18bff29e55dce5a3a79a462acf5a5b5", 213, 337, 0, 7, 9),
)
