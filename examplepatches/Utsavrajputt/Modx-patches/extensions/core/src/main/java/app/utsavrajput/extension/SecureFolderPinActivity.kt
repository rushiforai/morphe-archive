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
 * PIN gate for the Secure Folder vault. Built entirely in code - no XML
 * layout / R.layout reference (see UiUtils.kt for why).
 */
class SecureFolderPinActivity : Activity() {

    private val prefs by lazy { getSharedPreferences("modx_secure_folder", MODE_PRIVATE) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val root = UiUtils.rootColumn(this, centered = true)

        val title = TextView(this).apply {
            text = "Enter PIN"
            setTextColor(Color.WHITE)
            textSize = 20f
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.bottomMargin = 16
            layoutParams = params
        }
        root.addView(title)

        val pinInput = EditText(this).apply {
            inputType = InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD
            gravity = android.view.Gravity.CENTER
            setTextColor(Color.WHITE)
            hint = "PIN"
            layoutParams = LinearLayout.LayoutParams(200, LinearLayout.LayoutParams.WRAP_CONTENT)
        }
        root.addView(pinInput)

        val hasPin = prefs.contains(KEY_PIN_HASH)
        title.text = if (hasPin) "Enter PIN" else "Set a new PIN"

        val submit = Button(this).apply {
            text = "Continue"
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.topMargin = 16
            layoutParams = params
            setOnClickListener {
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
        root.addView(submit)

        setContentView(root)
    }

    private fun openVault() {
        startActivity(Intent(this, SecureFolderActivity::class.java))
        finish()
    }

    private fun sha256(text: String): String {
        val bytes = MessageDigest.getInstance("SHA-256").digest(text.toByteArray())
        val builder = StringBuilder()
        for (i in bytes.indices) {
            val hex = Integer.toHexString(bytes[i].toInt() and 0xFF)
            if (hex.length == 1) builder.append('0')
            builder.append(hex)
        }
        return builder.toString()
    }

    companion object {
        private const val KEY_PIN_HASH = "pin_hash"
    }
}
