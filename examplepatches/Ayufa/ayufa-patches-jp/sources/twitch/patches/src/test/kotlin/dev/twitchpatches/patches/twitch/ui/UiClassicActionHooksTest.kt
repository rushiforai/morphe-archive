package dev.twitchpatches.patches.twitch.ui

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import org.junit.Assert.*
import org.junit.Test

class UiClassicActionHooksTest {
    @Test fun identityContractAcceptsAbstractMethodsWithoutAnImplementation() {
        val concrete = nativeReloadMethod("Lfixture/Bits;", "id", emptyList(), "Ljava/lang/String;", 1,
            "const-string p0, \"bits_button_chat\"\nreturn-object p0")
        val base = ImmutableMethod("Lfixture/Button;", "id", emptyList(), "Ljava/lang/String;",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, emptySet(), emptySet(), null)
        assertNull(base.implementation)
        assertSame(base, resolveClassicButtonIdentity(concrete, listOf(base)))
        assertThrows(Exception::class.java) { resolveClassicButtonIdentity(concrete, emptyList()) }
        assertThrows(Exception::class.java) { resolveClassicButtonIdentity(concrete, listOf(base, base)) }
    }
}
