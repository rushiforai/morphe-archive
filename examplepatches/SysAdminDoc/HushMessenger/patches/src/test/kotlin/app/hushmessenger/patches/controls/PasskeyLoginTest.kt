package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** Play services' provider keeps its own name in every build, since the library loads a provider by the name it's given. */
internal const val PLAY_SERVICES_PROVIDER = PASSKEY_PLAY_SERVICES
internal const val SYNTHETIC_PASSKEY_PLAY_SERVICES = "$PLAY_SERVICES_PROVIDER->$PASSKEY_AVAILABILITY()Z"
internal const val SYNTHETIC_PASSKEY_FRAMEWORK = "LX/S30;->$PASSKEY_AVAILABILITY()Z"
private const val PROVIDER_INTERFACE = "LX/Sl1;"
private const val CREDENTIAL_MANAGER = "Landroid/credentials/CredentialManager;"
private const val GET_CREDENTIAL = "onGetCredential(Landroid/content/Context;Ljava/lang/Object;Landroid/os/CancellationSignal;)V"

/** Android's own provider: it has a credential manager to talk to from the version that added one. */
private val FRAMEWORK_BODY = """
    iget-object v0, p0, LX/S30;->A00:$CREDENTIAL_MANAGER
    if-eqz v0, :none
    const/4 v0, 0x1
    return v0
    :none
    const/4 v0, 0x0
    return v0
""".trimIndent()

/** Play services' provider: it asks Google Play services whether the version it needs is on the phone. */
private val PLAY_SERVICES_BODY = """
    const v0, 0xdc0e445
    invoke-virtual {p0, v0}, $PLAY_SERVICES_PROVIDER->$PASSKEY_AVAILABILITY(I)Z
    move-result v0
    return v0
""".trimIndent()

private fun availability(id: String, body: String, registers: Int = 2, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, registers, flags)

private fun getCredential(type: String) = fixtureMethod("$type->$GET_CREDENTIAL", "return-void", 5)

private fun provider(
    check: MutableMethod,
    interfaces: List<String> = listOf(PROVIDER_INTERFACE),
    gets: Boolean = true,
    fields: List<ImmutableField> = emptyList(),
): MutableClass {
    val type = check.definingClass
    return fixtureClass(type, listOfNotNull(check, if (gets) getCredential(type) else null), interfaces = interfaces, extraFields = fields)
}

private fun framework(
    body: String = FRAMEWORK_BODY,
    id: String = SYNTHETIC_PASSKEY_FRAMEWORK,
    registers: Int = 2,
    flags: Int = AccessFlags.PUBLIC.value,
    interfaces: List<String> = listOf(PROVIDER_INTERFACE),
    gets: Boolean = true,
) = provider(availability(id, body, registers, flags), interfaces, gets,
    listOf(ImmutableField(id.substringBefore("->"), "A00", CREDENTIAL_MANAGER, AccessFlags.PUBLIC.value, null, null, null)))

private fun playServices(
    body: String = PLAY_SERVICES_BODY,
    registers: Int = 3,
    flags: Int = AccessFlags.PUBLIC.value,
    interfaces: List<String> = listOf(PROVIDER_INTERFACE),
    gets: Boolean = true,
) = provider(availability(SYNTHETIC_PASSKEY_PLAY_SERVICES, body, registers, flags), interfaces, gets)

/**
 * The credential library's two providers as Messenger carries them. The interface itself holds no code, so it isn't one
 * of them and isn't in the fixture.
 */
internal fun passkeyLoginFixture(
    providers: List<MutableClass> = listOf(framework(), playServices()),
): List<MutableClass> = providers

class PasskeyLoginTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(PASSKEY_LOGIN).map { it.hookId() }.toSet()

    @Test fun everyProviderOfTheCredentialLibraryIsFound() {
        assertEquals(setOf(SYNTHETIC_PASSKEY_FRAMEWORK, SYNTHETIC_PASSKEY_PLAY_SERVICES), found(passkeyLoginFixture()))
        validateControls(mirroredControls(passkeyLoginFixture()), setOf(PASSKEY_LOGIN))
    }

    @Test fun everyProfileHooksPlayServicesProviderAndTheFrameworksOwn() {
        for (profile in listOf(SYNTHETIC_PROFILE) + controlProfiles.values.distinct()) {
            val hooks = profile.hooks.getValue(PASSKEY_LOGIN)
            assertEquals(2, hooks.size, "$hooks")
            assertTrue(SYNTHETIC_PASSKEY_PLAY_SERVICES in hooks, "$hooks")
            val own = hooks.single { it != SYNTHETIC_PASSKEY_PLAY_SERVICES }
            assertTrue(own.endsWith("->$PASSKEY_AVAILABILITY()Z"), own)
            activeProfile = profile
            validateControls(mirroredControls(passkeyLoginFixture(listOf(framework(id = own), playServices()))), setOf(PASSKEY_LOGIN))
        }
    }

    // The switch says the sign-in has no passkey to offer. A provider it doesn't answer for would make that untrue, so a
    // build without Play services' provider, or whose providers aren't exactly the ones behind the shared interface,
    // gets no hook at all.
    @Test fun aProviderTheSwitchWouldntAnswerForLeavesTheControlUnapplied() {
        val cases = mapOf(
            "no providers" to emptyList(),
            "only the framework's own provider" to listOf(framework()),
            "a provider whose question takes an argument" to listOf(framework(),
                provider(availability("$PLAY_SERVICES_PROVIDER->$PASSKEY_AVAILABILITY(I)Z", "const/4 v0, 0x1\nreturn v0", registers = 3))),
            "a provider that hands nothing back" to listOf(framework(), playServices(gets = false)),
            "a provider whose question is static" to listOf(framework(), playServices(body = "const/4 v0, 0x1\nreturn v0", flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "a third implementer behind the same interface" to passkeyLoginFixture() +
                fixtureClass("LX/Zzp;", listOf(getCredential("LX/Zzp;")), interfaces = listOf(PROVIDER_INTERFACE)),
            "providers that share no interface" to listOf(framework(), playServices(interfaces = listOf("LX/Sl2;"))),
            "providers that share two interfaces" to listOf(
                framework(interfaces = listOf(PROVIDER_INTERFACE, "Ljava/lang/Runnable;")),
                playServices(interfaces = listOf(PROVIDER_INTERFACE, "Ljava/lang/Runnable;")),
            ),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(PASSKEY_LOGIN)) }
        }
    }

    @Test fun eachProviderAnswersNoBeforeItAsksAnything() {
        for (check in listOf(availability(SYNTHETIC_PASSKEY_FRAMEWORK, FRAMEWORK_BODY),
            availability(SYNTHETIC_PASSKEY_PLAY_SERVICES, PLAY_SERVICES_BODY, registers = 3))) {
            val before = check.implementation!!.instructions.toList()
            injectControl(PASSKEY_LOGIN, mapOf(PASSKEY_LOGIN to listOf(check)))
            val code = check.implementation!!.instructions.toList()
            assertEquals(Opcode.INVOKE_STATIC, code[0].opcode)
            assertEquals("$SETTINGS->skipPasskeySignIn()Z", (code[0] as ReferenceInstruction).reference.toString())
            assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
            assertEquals(Opcode.IF_EQZ, code[2].opcode)
            assertEquals(5, code.branchTarget(2))
            // On, the provider answers no without touching the credential manager or Play services.
            assertEquals(Opcode.CONST_4, code[3].opcode)
            assertEquals(0, (code[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, code[4].opcode)
            assertEquals((code[3] as OneRegisterInstruction).registerA, (code[4] as OneRegisterInstruction).registerA)
            // Off, Pause and safe mode run the provider's own check, unchanged.
            assertEquals(before, code.drop(5))
        }
    }

    @Test fun anUnusableCheckRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // One register is exactly the provider itself, so v0 would be the provider.
            "no free register" to availability(SYNTHETIC_PASSKEY_FRAMEWORK, "iget-object p0, p0, LX/S30;->A00:$CREDENTIAL_MANAGER\nconst/4 p0, 0x0\nreturn p0", registers = 1),
            "a jump back to the start" to availability(SYNTHETIC_PASSKEY_FRAMEWORK,
                FRAMEWORK_BODY.replace("iget-object", ":again\niget-object").replace("if-eqz v0, :none", "if-eqz v0, :again")),
            "another method" to fixtureMethod("LX/S30;->isAvailableOnDevice(I)Z", "const/4 v0, 0x1\nreturn v0", 3),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.implementation!!.instructions.toList()
            assertFailsWith<PatchException>(case) { injectControl(PASSKEY_LOGIN, mapOf(PASSKEY_LOGIN to listOf(bad))) }
            assertEquals(badBefore, bad.implementation!!.instructions.toList(), case)
        }
    }

    @Test fun everySupportedBuildAnswersNoFromEveryProviderItCarries() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findPasskeyLogin(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(PASSKEY_LOGIN), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(PASSKEY_LOGIN to hooks), setOf(PASSKEY_LOGIN))
            assertEquals(2, hooks.size, code)
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.implementation!!.instructions.toList()
                method.injectPasskeyLogin()
                val code0 = method.implementation!!.instructions.toList()
                assertEquals("$SETTINGS->skipPasskeySignIn()Z", (code0[0] as ReferenceInstruction).reference.toString(), code)
                assertEquals(Opcode.RETURN, code0[4].opcode, code)
                assertEquals(before, code0.drop(5), code)
            }
        }
    }
}
