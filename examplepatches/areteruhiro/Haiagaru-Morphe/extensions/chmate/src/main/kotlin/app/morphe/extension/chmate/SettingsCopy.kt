package app.morphe.extension.chmate

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.view.ViewGroup
import android.widget.Toast
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.staticCompositionLocalOf

internal val LocalSettingCopyPath = staticCompositionLocalOf { emptyList<String>() }

@Composable
internal fun SettingCopyScope(path: List<String>, content: @Composable () -> Unit) =
    CompositionLocalProvider(LocalSettingCopyPath provides path, content = content)

/** Copies labels only. Entered values, API keys and authentication data are excluded. */
object SettingsCopy {
    @JvmStatic
    fun hierarchy(title: String, root: ViewGroup): String = outline(title, settingsRows(root))

    internal fun outline(title: String, rows: List<BoundSetting>): String = buildString {
        append(title)
        fun visit(items: List<BoundSetting>, depth: Int) {
            items.forEach { row ->
                if (row.label.isNotBlank()) append("\n").append("  ".repeat(depth)).append(row.label)
                row.children?.let { visit(it, depth + 1) }
            }
        }
        visit(rows, 1)
    }

    @JvmStatic
    fun copy(context: Context, text: String) {
        val clipboard = context.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager ?: return
        clipboard.setPrimaryClip(ClipData.newPlainText("Haiagaru設定", text))
        Toast.makeText(context, "設定の文言・階層をコピーしました", Toast.LENGTH_SHORT).show()
    }

}
