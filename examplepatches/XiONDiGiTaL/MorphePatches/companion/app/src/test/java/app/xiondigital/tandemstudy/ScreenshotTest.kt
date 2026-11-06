package app.xiondigital.tandemstudy

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.graphics.Bitmap
import android.graphics.Canvas
import android.os.Looper
import android.view.View
import androidx.compose.ui.test.hasSetTextAction
import androidx.compose.ui.test.junit4.createAndroidComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.compose.ui.test.performTextInput
import androidx.test.core.app.ApplicationProvider
import androidx.test.ext.junit.runners.AndroidJUnit4
import app.xiondigital.tandemstudy.data.Db
import app.xiondigital.tandemstudy.data.ServiceLocator
import app.xiondigital.tandemstudy.ui.MainActivity
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExternalResource
import org.junit.runner.RunWith
import org.robolectric.annotation.Config
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.GraphicsMode
import java.io.File
import java.io.FileOutputStream
import java.time.Duration

/**
 * Regenerates the PNGs in `companion/screenshots` by rendering the real screens with seeded data.
 *
 * Run with: `cd companion && ./gradlew :app:testDebugUnitTest --tests "*ScreenshotTest"`
 */
@RunWith(AndroidJUnit4::class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = [34], qualifiers = "w411dp-h891dp-xxhdpi")
class ScreenshotTest {

    @get:Rule(order = 0)
    val seed = SeedRule()

    @get:Rule(order = 1)
    val compose = createAndroidComposeRule<MainActivity>()

    @Test
    fun captureScreens() {
        settle()
        capture("words")

        compose.onNodeWithText("Stats").performClick()
        settle()
        capture("stats")

        compose.onNodeWithText("Search").performClick()
        settle()
        compose.onNode(hasSetTextAction()).performTextInput("casa")
        // Robolectric's main looper runs on virtual time, so the screen's 250 ms search debounce only
        // completes when the shadow clock is advanced explicitly.
        repeat(8) {
            compose.mainClock.advanceTimeBy(250)
            shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(250))
            compose.waitForIdle()
            Thread.sleep(120)
        }
        capture("search")

        compose.onNodeWithText("Review").performClick()
        settle()
        capture("review")
    }

    private fun settle() {
        compose.waitForIdle()
        Thread.sleep(700)
        compose.waitForIdle()
    }

    private fun capture(name: String) {
        var bitmap: Bitmap? = null
        compose.runOnUiThread {
            val view: View = compose.activity.window.decorView
            if (view.width == 0 || view.height == 0) {
                val width = View.MeasureSpec.makeMeasureSpec(1233, View.MeasureSpec.EXACTLY)
                val height = View.MeasureSpec.makeMeasureSpec(2673, View.MeasureSpec.EXACTLY)
                view.measure(width, height)
                view.layout(0, 0, view.measuredWidth, view.measuredHeight)
            }
            val shot = Bitmap.createBitmap(view.width, view.height, Bitmap.Config.ARGB_8888)
            view.draw(Canvas(shot))
            bitmap = shot
        }

        val source = bitmap ?: error("Could not capture $name")
        val scaled = Bitmap.createScaledBitmap(source, 720, source.height * 720 / source.width, true)
        val directory = File("../screenshots").apply { mkdirs() }
        FileOutputStream(File(directory, "$name.png")).use { out ->
            scaled.compress(Bitmap.CompressFormat.PNG, 100, out)
        }
        println("wrote ${File(directory, "$name.png").absolutePath}")
    }
}

/** Seeds a plausible export so the screens have something to show. */
class SeedRule : ExternalResource() {

    override fun before() {
        val context = ApplicationProvider.getApplicationContext<Context>()
        ServiceLocator.init(context)
        val db = Db(context).writableDatabase
        db.beginTransaction()
        try {
            seed(db)
            db.setTransactionSuccessful()
        } finally {
            db.endTransaction()
        }
    }

    private fun seed(db: SQLiteDatabase) {
        val now = System.currentTimeMillis()
        val day = 86_400_000L

        val conversations = listOf(1L to "Marta", 2L to "Kenji", 3L to "Lucía")
        for ((id, name) in conversations) {
            db.execSQL(
                "INSERT INTO conversations (id, remote_key, partner, last_at) VALUES (?, ?, ?, ?)",
                arrayOf<Any>(id, name.lowercase(), name, now - id * day),
            )
        }

        val script = listOf(
            Triple(1L, 0, "¿Has visto la casa nueva? Es muy grande y tiene un jardín enorme."),
            Triple(1L, 1, "Todavía no, pero me gustaría verla este fin de semana."),
            Triple(1L, 0, "Perfecto, podemos quedar el sábado por la mañana."),
            Triple(1L, 1, "Me parece bien, aunque tengo que trabajar hasta las diez."),
            Triple(1L, 0, "Sin problema, entonces quedamos a las once en la plaza."),
            Triple(1L, 1, "Vale, llevo la cámara para hacer fotos del jardín."),
            Triple(2L, 0, "Yesterday I finally finished the book you recommended."),
            Triple(2L, 1, "Really? What did you think about the ending?"),
            Triple(2L, 0, "It was surprising, the author left everything open."),
            Triple(2L, 1, "That is exactly why I liked it, nothing is explained."),
            Triple(2L, 0, "I want to read another book by the same author."),
            Triple(3L, 0, "He empezado a estudiar alemán otra vez, esta vez en serio."),
            Triple(3L, 1, "¡Qué bien! El alemán es difícil pero muy interesante."),
            Triple(3L, 0, "La gramática me cuesta mucho, sobre todo los casos."),
            Triple(3L, 1, "Poco a poco, lo importante es practicar cada día."),
        )

        val dayOffsets = listOf(0L, 0L, 0L, 0L, 1L, 1L, 1L, 2L, 2L, 3L, 3L, 6L, 6L, 6L, 9L)
        script.forEachIndexed { index, (conversation, mine, body) ->
            val at = now - dayOffsets[index] * day - (index % 7) * 37L * 60_000L
            db.execSQL(
                "INSERT INTO messages (conversation_id, msg_key, sender, is_mine, body, at) " +
                    "VALUES (?, ?, ?, ?, ?, ?)",
                arrayOf<Any>(
                    conversation,
                    "seed-$conversation-$index",
                    if (mine == 1) "me" else "partner",
                    mine,
                    body,
                    at,
                ),
            )
        }

        val words = listOf(
            "casa" to (14 to "es"), "jardín" to (9 to "es"), "grande" to (7 to "es"),
            "trabajar" to (6 to "es"), "cámara" to (5 to "es"), "sábado" to (5 to "es"),
            "plaza" to (4 to "es"), "mañana" to (4 to "es"), "gramática" to (4 to "es"),
            "practicar" to (3 to "es"), "difícil" to (3 to "es"), "interesante" to (3 to "es"),
            "empezado" to (2 to "es"), "estudiar" to (2 to "es"), "alemán" to (2 to "es"),
            "libro" to (8 to "en"), "author" to (6 to "en"), "ending" to (5 to "en"),
            "surprising" to (4 to "en"), "recommended" to (3 to "en"), "explained" to (3 to "en"),
            "finally" to (2 to "en"), "exactly" to (2 to "en"), "another" to (2 to "en"),
        )

        words.forEachIndexed { index, (word, pair) ->
            val (hits, lang) = pair
            val due = now + (index % 5 - 2) * day / 2
            db.execSQL(
                "INSERT INTO vocabulary (word, lang, hits, first_seen, last_seen, due_at, " +
                    "interval_days, ease, known) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0)",
                arrayOf<Any>(word, lang, hits, now - 20 * day, now - day, due, index % 4, 2.5),
            )
        }

        db.execSQL(
            "INSERT OR REPLACE INTO meta (key, value) VALUES ('language', 'es')",
        )
    }
}
