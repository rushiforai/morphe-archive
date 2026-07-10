package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.text.InputType
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import java.security.MessageDigest

/**
 * PIN gate for the Secure Folder vault. The vault itself is app-private
 * internal storage (getFilesDir()/secure_vault) - already inaccessible to
 * other apps and to USB/file-manager browsing without root, since it lives
 * inside the host app's private data directory. The PIN is an extra local
 * lock on top of that, not full-disk encryption; note this if you want a
 * stronger guarantee later (e.g. encrypt file bytes with a key derived
 * from the PIN using Android Keystore).
 */
class SecureFolderPinActivity : Activity() {

    private val prefs by lazy { getSharedPreferences("modx_secure_folder", MODE_PRIVATE) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_secure_folder_pin)

        val pinInput = findViewById<EditText>(R.id.secure_pin_input)
        pinInput.inputType = InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD

        val hasPin = prefs.contains(KEY_PIN_HASH)
        val title = findViewById<TextView>(R.id.secure_pin_title)
        title.text = if (hasPin) "Enter PIN" else "Set a new PIN"

        findViewById<Button>(R.id.secure_pin_submit).setOnClickListener {
            val pin = pinInput.text.toString()
            if (pin.length < 4) {
                title.text = "PIN must be at least 4 digits"
                return@setOnClickListener
            }
            val hash = sha256(pin)

            if (!hasPin) {
                prefs.edit().putString(KEY_PIN_HASH, hash).apply()
                openVault()
            } else if (hash == prefs.getString(KEY_PIN_HASH, null)) {
                openVault()
            } else {
                title.text = "Wrong PIN, try again"
                pinInput.text.clear()
            }
        }
    }

    private fun openVault() {
        startActivity(Intent(this, SecureFolderActivity::class.java))
        finish()
    }

    private fun sha256(text: String): String {
        val bytes = MessageDigest.getInstance("SHA-256").digest(text.toByteArray())
        return bytes.joinToString("") { "%02x".format(it) }
    }

    companion object {
        private const val KEY_PIN_HASH = "pin_hash"
    }
}
