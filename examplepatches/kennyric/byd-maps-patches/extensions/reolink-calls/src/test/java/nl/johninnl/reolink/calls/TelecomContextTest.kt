package nl.johninnl.reolink.calls

import android.content.res.Configuration
import android.os.LocaleList
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config
import java.util.Locale

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34])
class TelecomContextTest {
    @Test fun telecomRouteLabelsDoNotRequireResourcesMergedIntoTheTargetApk() {
        val original = RuntimeEnvironment.getApplication()
        val wrapped = TelecomContext(original)
        assertSame(wrapped, wrapped.applicationContext)
        assertEquals(original.packageName, wrapped.packageName)
        assertEquals("Speaker", wrapped.getString(androidx.core.telecom.R.string.callendpoint_name_speaker))
        assertEquals(original.getString(android.R.string.ok), wrapped.getString(android.R.string.ok))
    }

    @Test fun dutchRouteLabelsUseTheCurrentTargetConfiguration() {
        val original = RuntimeEnvironment.getApplication()
        val config = Configuration(original.resources.configuration)
        config.setLocales(LocaleList(Locale.forLanguageTag("nl-NL")))
        val wrapped = TelecomContext(original.createConfigurationContext(config))
        assertEquals("Telefoon", wrapped.getString(androidx.core.telecom.R.string.callendpoint_name_earpiece))
        assertEquals("Bedrade headset", wrapped.getString(androidx.core.telecom.R.string.callendpoint_name_wiredheadset))
    }
}
