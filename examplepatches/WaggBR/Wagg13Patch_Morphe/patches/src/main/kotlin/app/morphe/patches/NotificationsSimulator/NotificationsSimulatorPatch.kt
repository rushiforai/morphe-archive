package app.morphe.patches.notificationssimulator


import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import java.io.File

private const val TARGET_VERSION = "1.11.1"
private const val TELEGRAM_URL = "https://t.me/wagg13mods"
private const val CHANNEL_LABEL = "Channel Wagg13 Mods"

private val NOTIFICATIONS_SIMULATOR_COMPATIBILITY = Compatibility(
    name = "Notifications Simulator",
    packageName = "com.xinesoft.notifications",
    targets = listOf(AppTarget(version = TARGET_VERSION)),
)

/** Localiza o bundle principal (o hash no nome muda a cada versão do app). */
private fun findBundle(assetsDir: File): File =
    assetsDir.listFiles { f -> f.isFile && f.name.startsWith("index-") && f.name.endsWith(".js") }
        ?.maxByOrNull { it.length() }
        ?: error("Bundle index-*.js não encontrado em ${assetsDir.path}")

/** Aplica a regex exigindo exatamente 1 ocorrência, para não "passar em branco" numa versão diferente. */
private fun File.replaceExactlyOnce(regex: Regex, transform: (MatchResult) -> String, what: String) {
    val js = readText(Charsets.UTF_8)
    val count = regex.findAll(js).count()
    if (count != 1) error("[$what] esperava 1 ocorrência, encontrou $count (versão do app diferente?)")
    writeText(regex.replace(js, transform), Charsets.UTF_8)
}

// Seletor do Redux: w0 = wi(HC, e => e.hasPremium)
// Todo o app (banner AdMob, diálogo de vídeo premiado em Programar/Favoritar) lê esse seletor.
private val PREMIUM_SELECTOR = Regex("""(\w+)=>\1\.hasPremium(?=\))""")

// Cabeçalho: <Stack row><Typography title/><LanguageMenu/></Stack>
private val HEADER_TITLE = Regex(
    """(\w+)\.jsxs\((\w+),\{direction:"row",height:56,px:"20px",alignItems:"center",children:\[""" +
        """\1\.jsx\((\w+),\{variant:"body1",fontWeight:500,flexGrow:1,children:(\w+)\("Layout\.titleText"\)\}\)"""
)

@Suppress("unused")
val removeAdsPatch = resourcePatch(
    name = "Remove ads and video blocking",
    description = "Removes banners and rewarded video ads when scheduling or favoriting.",
    default = true,
) {
    compatibleWith(NOTIFICATIONS_SIMULATOR_COMPATIBILITY)

    execute {
        val bundle = findBundle(get("assets/public/assets"))

        bundle.replaceExactlyOnce(
            PREMIUM_SELECTOR,
            { m -> "${m.groupValues[1]}=>!0" },
            "hasPremium",
        )

        bundle.replaceExactlyOnce(
            HEADER_TITLE,
            { m ->
                val (p, stack, text, t) = m.destructured
                """$p.jsxs($stack,{direction:"row",height:56,px:"20px",alignItems:"center",children:[""" +
                    """$p.jsxs($stack,{flexGrow:1,children:[""" +
                    """$p.jsx($text,{variant:"body1",fontWeight:500,lineHeight:1.2,children:$t("Layout.titleText")}),""" +
                    """$p.jsx($text,{variant:"caption",sx:{cursor:"pointer",lineHeight:1.2,textDecoration:"underline"},""" +
                    """onClick:()=>{try{window.open("$TELEGRAM_URL","_blank")}catch(_){}},children:"$CHANNEL_LABEL"})]}),"""
            },
            "header title",
        )
    }
}
