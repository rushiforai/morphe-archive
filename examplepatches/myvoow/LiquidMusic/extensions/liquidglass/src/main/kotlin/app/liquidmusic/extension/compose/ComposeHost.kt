/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.extension.compose

import android.content.Context
import android.content.ContextWrapper
import android.content.res.Configuration
import android.content.res.Resources
import android.util.DisplayMetrics
import android.view.View
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.platform.ViewCompositionStrategy
import androidx.compose.ui.platform.createLifecycleAwareWindowRecomposer
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry
import androidx.lifecycle.setViewTreeLifecycleOwner
import androidx.savedstate.SavedStateRegistry
import androidx.savedstate.SavedStateRegistryController
import androidx.savedstate.SavedStateRegistryOwner
import androidx.savedstate.setViewTreeSavedStateRegistryOwner

/**
 * Hosts Jetpack Compose inside Apple Music.
 *
 * The extension brings its own copy of Compose, renamed at build time so it never meets the copy
 * Apple Music contains. That copy does not know Apple's activity, so a ComposeView made here gets
 * its own lifecycle and saved state owners, and a context whose resources answer for the
 * resources of the extension, which are not part of the app.
 */
internal object ComposeHost {

    /** Package id given to the resources of the extension (see extensions/liquidglass/build.gradle.kts). */
    private const val EXTENSION_PACKAGE_ID = 0x7e

    fun createView(context: Context): ComposeView {
        val view = ComposeView(ExtensionResourcesContext(context))
        val owner = OverlayOwner()
        view.setViewTreeLifecycleOwner(owner)
        view.setViewTreeSavedStateRegistryOwner(owner)
        // By default Compose shares one recomposer per window, created from the lifecycle found
        // on the root view: Apple registered its own there, which this copy of Compose cannot
        // see. The view gets a recomposer of its own instead, driven by its own lifecycle.
        view.setParentCompositionContext(
            view.createLifecycleAwareWindowRecomposer(lifecycle = owner.lifecycle)
        )
        view.setViewCompositionStrategy(ViewCompositionStrategy.DisposeOnDetachedFromWindow)
        view.addOnAttachStateChangeListener(object : View.OnAttachStateChangeListener {
            override fun onViewAttachedToWindow(v: View) = owner.resume()
            override fun onViewDetachedFromWindow(v: View) = owner.stop()
        })
        return view
    }

    /** A lifecycle that follows the window attachment of the view. */
    private class OverlayOwner : LifecycleOwner, SavedStateRegistryOwner {
        private val registry = LifecycleRegistry(this)
        private val controller = SavedStateRegistryController.create(this)

        override val lifecycle: Lifecycle get() = registry
        override val savedStateRegistry: SavedStateRegistry get() = controller.savedStateRegistry

        init {
            controller.performAttach()
            controller.performRestore(null)
            registry.currentState = Lifecycle.State.CREATED
        }

        fun resume() {
            registry.currentState = Lifecycle.State.RESUMED
        }

        fun stop() {
            registry.currentState = Lifecycle.State.CREATED
        }
    }

    /**
     * Compose reads a few strings of its own (accessibility labels) by resource id. The ids of the
     * extension use a package id of their own, absent from Apple Music: they get an empty string
     * instead of an exception. Every other resource comes from the app, as usual.
     */
    private class ExtensionResourcesContext(base: Context) : ContextWrapper(base) {
        private var resources: SafeResources? = null

        override fun getResources(): Resources {
            val base = baseContext.resources
            val current = resources
            if (current != null && current.base === base) return current
            return SafeResources(base).also { resources = it }
        }
    }

    @Suppress("DEPRECATION")
    private class SafeResources(val base: Resources) :
        Resources(base.assets, base.displayMetrics, base.configuration) {

        private fun isExtension(id: Int) = id ushr 24 == EXTENSION_PACKAGE_ID

        override fun getConfiguration(): Configuration = base.configuration
        override fun getDisplayMetrics(): DisplayMetrics = base.displayMetrics

        override fun getText(id: Int): CharSequence = if (isExtension(id)) "" else base.getText(id)
        override fun getText(id: Int, def: CharSequence?): CharSequence? =
            if (isExtension(id)) def else base.getText(id, def)

        override fun getString(id: Int): String = if (isExtension(id)) "" else base.getString(id)
        override fun getString(id: Int, vararg formatArgs: Any?): String =
            if (isExtension(id)) "" else base.getString(id, *formatArgs)

        override fun getQuantityText(id: Int, quantity: Int): CharSequence =
            if (isExtension(id)) "" else base.getQuantityText(id, quantity)

        override fun getQuantityString(id: Int, quantity: Int): String =
            if (isExtension(id)) "" else base.getQuantityString(id, quantity)

        override fun getQuantityString(id: Int, quantity: Int, vararg formatArgs: Any?): String =
            if (isExtension(id)) "" else base.getQuantityString(id, quantity, *formatArgs)

        override fun getStringArray(id: Int): Array<String> =
            if (isExtension(id)) emptyArray() else base.getStringArray(id)

        override fun getTextArray(id: Int): Array<CharSequence> =
            if (isExtension(id)) emptyArray() else base.getTextArray(id)
    }
}
