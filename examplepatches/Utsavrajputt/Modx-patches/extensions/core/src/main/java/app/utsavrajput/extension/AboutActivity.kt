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

        val screen = UiUtils.screen(this, "About")

        screen.content.addView(
            android.widget.TextView(this).apply {
                text = "Modx-Patches\n\nCustom patches for MX Player.\nBuilt by Utsav Rajput."
                setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
                textSize = 14f
            },
        )

        setContentView(screen.root)
    }
}
