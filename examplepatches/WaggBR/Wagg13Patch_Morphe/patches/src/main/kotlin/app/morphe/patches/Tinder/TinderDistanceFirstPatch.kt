package app.morphe.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `Ldon;->l(List<Limw>, Lrhw;, Lerw;, Function1)`: transforma as páginas Tappy do card
 * (uma `Limw` por foto) nos slides (`Li5y`). É aqui que passa o card do swipe; o método
 * `profile/usecase/b->t` que a primeira versão do patch usava nunca roda nesse card.
 */
private object TappyPagesBuilderFingerprint : Fingerprint(
    definingClass = "Ldon;",
    name = "l",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(
        "Ljava/util/List;",
        "Lrhw;",
        "Lerw;",
        "Lkotlin/jvm/functions/Function1;",
    ),
)

private const val ORDER_HELPER = "Lapp/morphe/extension/tinder/patches/TinderDistanceOrder;"

@Suppress("unused")
val tinderDistanceFirstPatch = bytecodePatch(
    name = "Tinder Distance First",
    description = "Shows profile distance before Bio and Interests.",
) {
    compatibleWith(TinderCompatibility.TINDER)
    extendWith("extensions/extension.mpe")

    execute {
        // O método tem .registers 15 e 5 parâmetros, então p0 = this, p1 = List<Limw> e
        // p2 = Lrhw (traz o TappySource). O helper devolve uma cópia reordenada, sem mexer
        // na lista original (ela é compartilhada com outros consumidores do card), e o
        // resultado substitui p1 antes de qualquer outra leitura. Só p1 é escrito:
        // v0/p0 continuam intactos para o `iget-object v0, p0, Ldon;->c` logo abaixo.
        TappyPagesBuilderFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $ORDER_HELPER->rotateEssentialsFirst(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
