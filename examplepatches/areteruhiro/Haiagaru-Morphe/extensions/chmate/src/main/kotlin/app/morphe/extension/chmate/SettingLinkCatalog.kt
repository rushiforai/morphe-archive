package app.morphe.extension.chmate
import android.app.Activity
import android.widget.*

/** Use the same rows and real listeners as the settings screen; never invent preference keys. */
object SettingLinkCatalog {
 @JvmStatic fun category(activity: Activity, category: String): List<SettingLinkEntry> {
  val root = Haiagaru.settingsCategory(activity, category)
  return flattenedSettingsRows(root, includeHidden = true).mapNotNull { row ->
   val control = row.control
   if (control !is CompoundButton && control !is Button && control !is EditText && control !is Spinner && !control.hasOnClickListeners()) return@mapNotNull null
   var label = row.label.lineSequence().firstOrNull().orEmpty().trim()
   if (control is Button && control !is CompoundButton) label = label.substringBefore('：').substringBefore(": ").trim()
   if (label.isBlank() || label.length > 160 || label == "設定リンクを作成") return@mapNotNull null
   SettingLinkEntry(category, label, control)
  }
 }
}
