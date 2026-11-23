package patches.deezer

import org.junit.Assert.assertEquals
import org.junit.Test

class Api9ResourcePathsTest {
    @Test fun valuesFilesUseSeparateCanonicalTypedPathsInEveryLocale() {
        val filenames = mapOf("string" to "strings.xml", "attr" to "attrs.xml", "array" to "arrays.xml",
            "color" to "colors.xml", "dimen" to "dimens.xml", "drawable" to "drawables.xml", "id" to "ids.xml",
            "integer" to "integers.xml", "style" to "styles.xml")
        for (folder in listOf("values", "values-af", "values-night-v8")) {
            for ((type, filename) in filenames) {
                val path = "res/$folder/$filename"
                assertEquals("$type must use a typed file without rewriting original values", "res/$folder/$type.xml",
                    api9ResourceDestination(path))
            }
        }
    }

    @Test fun fileResourcesKeepTheirNamespacedFilenames() {
        assertEquals("res/drawable/morphe_deezer_auto_notification.xml",
            api9ResourceDestination("res/drawable/notification.xml"))
    }

    @Test fun themeReferencesRetainTheirAttributeType() {
        val names = mapOf(("attr" to "carColorPrimary") to "morphe_deezer_auto_carColorPrimary")
        assertEquals("?android:attr/textAppearanceButton",
            api9RewriteReferences("?android:textAppearanceButton", names))
        assertEquals("?android:attr/textAppearanceButton",
            api9RewriteReferences("?android:attr/textAppearanceButton", names))
        assertEquals("?attr/morphe_deezer_auto_carColorPrimary",
            api9RewriteReferences("?carColorPrimary", names))
    }
}
