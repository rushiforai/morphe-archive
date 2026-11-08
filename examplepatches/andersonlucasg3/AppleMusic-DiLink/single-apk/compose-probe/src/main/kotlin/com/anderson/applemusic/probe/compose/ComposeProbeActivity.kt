package com.anderson.applemusic.probe.compose

import android.content.ComponentName
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log

import android.media.MediaMetadata
import android.media.browse.MediaBrowser
import android.media.session.MediaController
import android.media.session.PlaybackState
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.focusable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicText
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.key.Key
import androidx.compose.ui.input.key.KeyEventType
import androidx.compose.ui.input.key.key
import androidx.compose.ui.input.key.onKeyEvent
import androidx.compose.ui.input.key.type
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Spike (single-apk, Phase B): a Compose UI that touches **no app resource** — no R.*, no
 * drawable/string/theme of our own, system font (`FontFamily.Default`), icons drawn with
 * Canvas. It is compiled as its own APK only to obtain the dex files, which are placed
 * *before* the engine dexes inside the Apple Music APK (see
 * single-apk/build-single-apk-compose.ps1).
 *
 * The screen shows 3 local items and a button. The button binds the framework MediaBrowser to
 * the engine's MediaPlaybackService (same package/UID, same process), subscribes to
 * `__AUTO_ROOT__` and lists the children (Início / Rádio / Biblioteca).
 */
@Suppress("DEPRECATION")
class ComposeProbeActivity : ComponentActivity() {

    private val main = Handler(Looper.getMainLooper())
    private var browser: MediaBrowser? = null
    private var controller: MediaController? = null

    private var connected by mutableStateOf(false)
    private var status by mutableStateOf("Compose ok · sem recursos do app")
    private var sessionLine by mutableStateOf("sessão: —")
    private val engineItems = mutableStateListOf<EngineItem>()

    private val localItems = listOf(
        LocalItem("Início", 0),
        LocalItem("Rádio", 1),
        LocalItem("Biblioteca", 2),
    )

    override fun onCreate(state: Bundle?) {
        // Framework theme only (same as the module manifest): no app resource is read.
        setTheme(android.R.style.Theme_Material_NoActionBar)
        super.onCreate(state)
        Log.i(TAG, "onCreate pkg=$packageName pid=${android.os.Process.myPid()} compose=1")
        setContent { ProbeScreen() }
    }

    // --- Compose UI ------------------------------------------------------------------

    @Composable
    private fun ProbeScreen() {
        val focus = FocusRequester()
        LaunchedEffect(Unit) {
            runCatching { focus.requestFocus() }
            Log.i(TAG, "compose composed, button focused")
        }

        Column(
            Modifier.fillMaxSize().background(BG).padding(48.dp),
            verticalArrangement = Arrangement.spacedBy(18.dp)
        ) {
            BasicText(
                "single-apk · Compose probe",
                style = TextStyle(color = Color.White, fontSize = 30.sp,
                    fontWeight = FontWeight.Bold, fontFamily = FontFamily.Default)
            )
            BasicText(
                status,
                style = TextStyle(color = ACCENT, fontSize = 16.sp, fontFamily = FontFamily.Default)
            )
            BasicText(
                "itens locais (desenhados, sem R.*)",
                style = TextStyle(color = MUTED, fontSize = 13.sp, fontFamily = FontFamily.Default)
            )
            localItems.forEach { item ->
                Row(verticalAlignment = Alignment.CenterVertically) {
                    ItemIcon(item.kind, ACCENT)
                    BasicText(
                        item.title,
                        modifier = Modifier.padding(start = 16.dp),
                        style = TextStyle(color = Color.White, fontSize = 20.sp,
                            fontFamily = FontFamily.Default)
                    )
                }
            }

            Box(
                Modifier
                    .clip(RoundedCornerShape(12.dp))
                    .background(ACCENT)
                    .focusRequester(focus)
                    .focusable()
                    .onKeyEvent { event ->
                        if (event.type == KeyEventType.KeyUp &&
                            (event.key == Key.DirectionCenter || event.key == Key.Enter)
                        ) {
                            connect(); true
                        } else {
                            false
                        }
                    }
                    .clickable { connect() }
                    .padding(horizontal = 28.dp, vertical = 14.dp)
            ) {
                BasicText(
                    if (connected) "Reconectar / atualizar browse"
                    else "Conectar ao MediaPlaybackService",
                    style = TextStyle(color = Color.White, fontSize = 18.sp,
                        fontWeight = FontWeight.SemiBold, fontFamily = FontFamily.Default)
                )
            }

            BasicText(
                "engine browse:",
                style = TextStyle(color = MUTED, fontSize = 13.sp, fontFamily = FontFamily.Default)
            )
            if (engineItems.isEmpty()) {
                BasicText(
                    "— (toque/OK no botão)",
                    style = TextStyle(color = Color(0xFF6B6B76), fontSize = 16.sp,
                        fontFamily = FontFamily.Default)
                )
            } else {
                engineItems.forEach { item ->
                    Row(Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
                        BasicText(
                            "• " + item.title,
                            style = TextStyle(color = Color.White, fontSize = 20.sp,
                                fontFamily = FontFamily.Default)
                        )
                        BasicText(
                            "  [" + (if (item.browsable) "browsable" else "item") + "]",
                            modifier = Modifier.padding(start = 8.dp),
                            style = TextStyle(color = MUTED, fontSize = 13.sp,
                                fontFamily = FontFamily.Default)
                        )
                    }
                }
            }

            BasicText(
                sessionLine,
                style = TextStyle(color = MUTED, fontSize = 14.sp, fontFamily = FontFamily.Default)
            )
            BasicText(
                "font=FontFamily.Default · icons=Canvas · theme=android:Theme.Material.NoActionBar",
                style = TextStyle(color = Color(0xFF4A4A52), fontSize = 11.sp,
                    fontFamily = FontFamily.Default)
            )
        }
    }

    @Composable
    private fun ItemIcon(kind: Int, tint: Color) {
        Canvas(Modifier.size(26.dp)) {
            val stroke = Stroke(width = 2.dp.toPx())
            when (kind) {
                0 -> { // Início: casa (triângulo + base)
                    val roof = Path()
                    roof.moveTo(size.width * 0.50f, size.height * 0.06f)
                    roof.lineTo(size.width * 0.96f, size.height * 0.52f)
                    roof.lineTo(size.width * 0.04f, size.height * 0.52f)
                    roof.close()
                    drawPath(roof, tint)
                    drawRect(
                        tint,
                        topLeft = Offset(size.width * 0.22f, size.height * 0.52f),
                        size = Size(size.width * 0.56f, size.height * 0.42f)
                    )
                }
                1 -> { // Rádio: arcos + ponto
                    val c = Offset(size.width / 2f, size.height * 0.70f)
                    drawCircle(tint, radius = size.minDimension * 0.10f, center = c)
                    drawArc(tint, -140f, 100f, false,
                        topLeft = Offset(c.x - size.width * 0.34f, c.y - size.width * 0.34f),
                        size = Size(size.width * 0.68f, size.width * 0.68f), style = stroke)
                    drawArc(tint, -140f, 100f, false,
                        topLeft = Offset(c.x - size.width * 0.19f, c.y - size.width * 0.19f),
                        size = Size(size.width * 0.38f, size.width * 0.38f), style = stroke)
                }
                else -> { // Biblioteca: três barras
                    val w = size.width * 0.12f
                    val gap = size.width * 0.13f
                    val top = size.height * 0.16f
                    val h = size.height * 0.68f
                    var x = size.width * 0.18f
                    repeat(3) {
                        drawRect(tint, topLeft = Offset(x, top), size = Size(w, h))
                        x += w + gap
                    }
                }
            }
        }
    }

    // --- engine bridge (framework MediaBrowser, same package/UID) ----------------------

    private fun connect() {
        if (browser != null) {
            status = "já conectado · re-inscrevendo em $AUTO_ROOT"
            Log.i(TAG, "already connected, resubscribe")
            subscribe(AUTO_ROOT)
            return
        }
        status = "conectando ao MediaPlaybackService…"
        Log.i(TAG, "connect service=$SERVICE")
        val created = MediaBrowser(this, ComponentName(PKG, SERVICE), connectionCallback, null)
        browser = created
        created.connect()
    }

    private val connectionCallback = object : MediaBrowser.ConnectionCallback() {
        override fun onConnected() {
            Log.i(TAG, "MediaBrowser connected, root=${browser?.root}")
            connected = true
            status = "conectado · root=${browser?.root}"
            attachController()
            subscribe(AUTO_ROOT)
        }

        override fun onConnectionFailed() {
            Log.e(TAG, "MediaBrowser connection FAILED")
            status = "MediaBrowser FALHOU: $SERVICE inacessível"
        }

        override fun onConnectionSuspended() {
            Log.w(TAG, "MediaBrowser connection suspended")
        }
    }

    private val subscriptionCallback = object : MediaBrowser.SubscriptionCallback() {
        override fun onChildrenLoaded(parentId: String, children: List<MediaBrowser.MediaItem>) {
            onChildren(parentId, children)
        }

        // Media3 (the engine's service) delivers through the Bundle overload.
        override fun onChildrenLoaded(
            parentId: String,
            children: List<MediaBrowser.MediaItem>,
            options: Bundle
        ) {
            onChildren(parentId, children)
        }

        override fun onError(parentId: String) {
            Log.e(TAG, "subscribe error parent=$parentId")
        }
    }

    private fun subscribe(parentId: String) {
        Log.i(TAG, "subscribe $parentId")
        browser?.subscribe(parentId, Bundle(), subscriptionCallback)
    }

    private fun onChildren(parentId: String, children: List<MediaBrowser.MediaItem>) {
        val summary = children.joinToString("; ") { item ->
            val d = item.description
            val title = d?.title?.toString() ?: "?"
            title + (if (item.isBrowsable) " [browsable]" else "") +
                (if (item.isPlayable) " [playable]" else "")
        }
        Log.i(TAG, "children parent=$parentId count=${children.size} -> $summary")

        if (parentId == AUTO_ROOT) {
            engineItems.clear()
            children.forEach { item ->
                val title = item.description?.title?.toString() ?: "?"
                engineItems.add(EngineItem(title, item.isBrowsable))
            }
            status = "__AUTO_ROOT__ = ${children.size} filhos"
        }
    }

    private fun attachController() {
        val token = browser?.sessionToken ?: return
        val created = MediaController(this, token)
        created.registerCallback(object : MediaController.Callback() {
            override fun onPlaybackStateChanged(state: PlaybackState?) {
                Log.i(TAG, "playbackState=${state?.state ?: -1}")
                refreshSession()
            }

            override fun onMetadataChanged(metadata: MediaMetadata?) {
                Log.i(TAG, "metadata title=${metadata?.getString(MediaMetadata.METADATA_KEY_TITLE)}")
                refreshSession()
            }
        }, main)
        controller = created
        refreshSession()
    }

    private fun refreshSession() {
        val st = controller?.playbackState
        val md = controller?.metadata
        val title = md?.getString(MediaMetadata.METADATA_KEY_TITLE)
        val artist = md?.getString(MediaMetadata.METADATA_KEY_ARTIST)
        sessionLine = buildString {
            append("sessão: state=").append(st?.state ?: -1)
            if (title != null) append("  ").append(title)
            if (artist != null) append(" / ").append(artist)
        }
        Log.i(TAG, sessionLine)
    }

    override fun onDestroy() {
        Log.i(TAG, "onDestroy")
        controller = null
        browser?.disconnect()
        browser = null
        super.onDestroy()
    }

    private data class LocalItem(val title: String, val kind: Int)
    private data class EngineItem(val title: String, val browsable: Boolean)

    private companion object {
        const val TAG = "ComposeProbe"
        const val PKG = "com.apple.android.music"
        const val SERVICE = "$PKG.player.MediaPlaybackService"
        const val AUTO_ROOT = "__AUTO_ROOT__"

        val BG = Color(0xFF121216)
        val ACCENT = Color(0xFFFF375F)
        val MUTED = Color(0xFFB0B0BC)
    }
}

