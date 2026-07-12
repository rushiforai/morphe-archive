package app.utsavrajput.extension

import android.app.Activity
import android.graphics.Color
import android.os.Bundle

/**
 * "About" tab screen. Built entirely in code - no XML layout / R.layout
 * reference. See UiUtils.kt for why.
 */
class AboutActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val scaffold = UiUtils.scaffold(this)
        val scroll = scaffold.scroll
        val content = scaffold.content

        content.addView(UiUtils.heading(this, "About", sizeSp = 28f))

        content.addView(
            android.widget.TextView(this).apply {
                text = "Modx-Patches\n\nCustom patches for MX Player.\nBuilt by Utsav Rajput."
                setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
                textSize = 14f
            },
        )

        setContentView(scroll)
    }
}
