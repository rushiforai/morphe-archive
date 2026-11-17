/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.interaction.jam.ProtoAbi
import app.morphe.patches.music.interaction.jam.decode
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Test

class SmartShuffleActivityDispatcherTest {
    private val versions = listOf("915", "940", "945")

    private class Fixture(version: String) {
        val activity = "Lfixture/v$version/MusicActivity;"
        private val peerType = "Lfixture/v$version/Peer;"
        private val providerType = "Lfixture/v$version/Provider;"
        private val dispatcherType = "Lfixture/v$version/Dispatcher;"
        val root = "Lfixture/v$version/Root;"
        private val suffix = versionsSuffix(version)

        val peer = ImmutableFieldReference(activity, "peer$suffix", peerType)
        val provider = ImmutableFieldReference(peerType, "provider$suffix", providerType)
        val getter = ImmutableMethodReference(providerType, "get$suffix", emptyList(), "Ljava/lang/Object;")
        val dispatch = ImmutableMethodReference(dispatcherType, "send$suffix", listOf(root), "V")
        val nativeDispatch = ImmutableMethodReference(
            "Lfixture/v$version/ConcreteDispatcher;", dispatch.name, listOf(root), "V",
        )
        val route = SmartActivityDispatcherRoute(peer, provider, getter, dispatch)
        val proto = ProtoAbi(
            root,
            ImmutableFieldReference(root, "default$suffix", root),
            ImmutableMethodReference(
                root, "parse$suffix",
                listOf(root, "[B", "Lcom/google/protobuf/ExtensionRegistryLite;"), "Ljava/lang/Object;",
            ),
        )

        fun nativeMethod(
            name: String = "native$suffix",
            providerField: FieldReference = provider,
            providerGetter: MethodReference = getter,
            rootDispatch: MethodReference = dispatch,
            repeatDispatch: Boolean = false,
        ): MutableMethod = ImmutableMethod(
            activity, name,
            listOf(activity, root).map { ImmutableMethodParameter(it, null, null) },
            "V", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null, null, MutableMethodImplementation(8),
        ).toMutable().apply {
            val arguments = if (rootDispatch.parameterTypes.size == 2) "v2, v4, v5" else "v2, v4"
            val result = if (rootDispatch.returnType == "V") "" else "move-result v5"
            val repeat = if (repeatDispatch) "invoke-interface {$arguments}, $rootDispatch\n$result" else ""

            addInstructionsWithLabels(0, """
                iget-object v0, p0, $peer
                iget-object v1, v0, $providerField
                invoke-interface {v1}, $providerGetter
                move-result-object v2
                check-cast v2, $dispatcherType
                invoke-static {}, $root->newBuilder()Lfixture/RootBuilder;
                move-result-object v3
                invoke-virtual {v3, p1}, Lfixture/RootBuilder;->mergeFrom($root)Lfixture/RootBuilder;
                move-result-object v3
                invoke-virtual {v3}, Lfixture/RootBuilder;->build()$root
                move-result-object v4
                const/4 v5, 0x0
                invoke-interface {$arguments}, $rootDispatch
                $result
                $repeat
                return-void
            """)
        }

        fun activityClass(vararg methods: MutableMethod): ClassDef = ImmutableClassDef(
            activity, AccessFlags.PUBLIC.value, "Landroid/app/Activity;", emptyList(), null, null,
            listOf(ImmutableField(activity, peer.name, peer.type, AccessFlags.PRIVATE.value, null, null, null)),
            methods.toList(),
        )

        companion object {
            private fun versionsSuffix(version: String) = when (version) {
                "915" -> "Q"
                "940" -> "j"
                else -> "Xf"
            }
        }
    }

    @Test
    fun obfuscatedRoutesUsePrivateActivityPeerAndObservedSingleRootInterfaceCall() {
        for (version in versions) {
            val fixture = Fixture(version)
            val method = fixture.nativeMethod()
            val activity = fixture.activityClass(method)
            val original = method.implementation!!.instructions.toList()
            val route = smartShuffleActivityRoute(activity, fixture.nativeDispatch)

            assertEquals(version, fixture.route, route)
            assertEquals(AccessFlags.PRIVATE.value, activity.instanceFields.single().accessFlags)
            assertNotEquals(fixture.nativeDispatch.definingClass, route.dispatch.definingClass)
            assertEquals(Opcode.CHECK_CAST, original[4].opcode)
            assertEquals(Opcode.INVOKE_INTERFACE, original[12].opcode)
            assertEquals(fixture.dispatch, original[12].getReference<MethodReference>())
            assertEquals(original, method.implementation!!.instructions.toList())
        }
    }

    @Test
    fun repeatedInvocationsAndMethodsWithSameReceiverRouteAreDeduplicated() {
        for (version in versions) {
            val fixture = Fixture(version)
            val activity = fixture.activityClass(
                fixture.nativeMethod(repeatDispatch = true),
                fixture.nativeMethod(name = "anotherNativeEntry"),
            )

            assertEquals(fixture.route, smartShuffleActivityRoute(activity, fixture.nativeDispatch))
        }
    }

    @Test
    fun similarlyNamedDispatchWithWrongRootArityOrReturnTypeIsRejected() {
        for (version in versions) {
            val fixture = Fixture(version)
            val wrongSignatures = listOf(
                ImmutableMethodReference(fixture.dispatch.definingClass, fixture.dispatch.name,
                    listOf("Lfixture/UnrelatedRoot;"), "V"),
                ImmutableMethodReference(fixture.dispatch.definingClass, fixture.dispatch.name,
                    listOf(fixture.root, "Lfixture/Context;"), "V"),
                ImmutableMethodReference(fixture.dispatch.definingClass, fixture.dispatch.name,
                    listOf(fixture.root), "Z"),
                ImmutableMethodReference(fixture.dispatch.definingClass, "unrelated",
                    listOf(fixture.root), "V"),
            )

            for (wrongDispatch in wrongSignatures) {
                assertRouteRejected(fixture, fixture.nativeMethod(rootDispatch = wrongDispatch))
            }
        }
    }

    @Test
    fun providerGetterMustReturnObjectWithoutArguments() {
        val fixture = Fixture("940")
        val wrongGetters = listOf(
            ImmutableMethodReference(fixture.getter.definingClass, fixture.getter.name,
                listOf("Ljava/lang/Object;"), "Ljava/lang/Object;"),
            ImmutableMethodReference(fixture.getter.definingClass, fixture.getter.name,
                emptyList(), fixture.dispatch.definingClass),
        )

        for (wrongGetter in wrongGetters) {
            assertRouteRejected(fixture, fixture.nativeMethod(providerGetter = wrongGetter))
        }
    }

    @Test
    fun distinctProvidersAreAmbiguousEvenWhenGetterAndDispatchAreIdentical() {
        for (version in versions) {
            val fixture = Fixture(version)
            val otherProvider = ImmutableFieldReference(
                fixture.provider.definingClass, "otherProvider", fixture.provider.type,
            )

            assertRouteRejected(
                fixture,
                fixture.nativeMethod(),
                fixture.nativeMethod(name = "otherEntry", providerField = otherProvider),
            )
        }
    }

    private fun assertRouteRejected(fixture: Fixture, vararg methods: MutableMethod) {
        try {
            smartShuffleActivityRoute(fixture.activityClass(*methods), fixture.nativeDispatch)
            fail("Expected the missing or ambiguous Activity route to be rejected")
        } catch (_: IllegalStateException) {
            // Preflight must reject this route before installing any bridge.
        }
    }

    private class Instance {
        val fields = mutableMapOf<FieldReference, Any?>()
        var provided: Any? = null
    }

    /** Executes only the getter's field reads, provider call and null branches against mutable fixture objects. */
    private fun readCurrentDispatcher(method: MutableMethod, fixture: Fixture, activity: Instance): Any? {
        val code = method.implementation!!.instructions.toList()
        val registers = arrayOfNulls<Any>(method.implementation!!.registerCount)
        registers[registers.lastIndex] = activity
        var result: Any? = null
        var index = 0
        var steps = 0

        while (index in code.indices && steps++ < code.size * 2) {
            val instruction = code[index]
            when (instruction.opcode) {
                Opcode.IGET_OBJECT -> {
                    val read = instruction as TwoRegisterInstruction
                    val receiver = registers[read.registerB] as? Instance
                        ?: error("Getter dereferenced a null peer or provider")
                    registers[read.registerA] = receiver.fields[instruction.getReference<FieldReference>()!!]
                }
                Opcode.INVOKE_INTERFACE -> {
                    assertEquals(fixture.getter, instruction.getReference<MethodReference>())
                    val invoke = instruction as FiveRegisterInstruction
                    assertEquals(1, invoke.registerCount)
                    result = (registers[invoke.registerC] as? Instance
                        ?: error("Getter invoked a null provider")).provided
                }
                Opcode.MOVE_RESULT_OBJECT -> registers[(instruction as OneRegisterInstruction).registerA] = result
                Opcode.CHECK_CAST -> assertEquals(
                    fixture.dispatch.definingClass, instruction.getReference<TypeReference>()!!.type,
                )
                Opcode.IF_EQZ -> {
                    if (registers[(instruction as OneRegisterInstruction).registerA] == null) {
                        val target = (instruction as BuilderOffsetInstruction).target.location.instruction
                        index = code.indexOf(target)
                        continue
                    }
                }
                Opcode.CONST_4 -> {
                    assertEquals(0, (instruction as NarrowLiteralInstruction).narrowLiteral)
                    registers[(instruction as OneRegisterInstruction).registerA] = null
                }
                Opcode.RETURN_OBJECT -> return registers[(instruction as OneRegisterInstruction).registerA]
                else -> error("Unexpected Activity getter instruction: ${instruction.opcode}")
            }
            index++
        }
        error("Activity getter did not return")
    }

    @Test
    fun getterReadsCurrentPeerAndProviderOnEveryCallRatherThanCapturingEither() {
        for (version in versions) {
            val fixture = Fixture(version)
            val getter = smartShuffleActivityGetter(fixture.activity, fixture.route)
            val activity = Instance()
            val firstPeer = Instance()
            val secondPeer = Instance()
            val firstProvider = Instance().apply { provided = Any() }
            val secondProvider = Instance().apply { provided = Any() }
            val thirdProvider = Instance().apply { provided = Any() }
            firstPeer.fields[fixture.provider] = firstProvider
            secondPeer.fields[fixture.provider] = secondProvider
            activity.fields[fixture.peer] = firstPeer

            assertEquals("smartCurrentDispatcher", getter.name)
            assertEquals(fixture.activity, getter.definingClass)
            assertTrue(getter.parameterTypes.isEmpty())
            assertEquals("Ljava/lang/Object;", getter.returnType)
            assertFalse(AccessFlags.STATIC.isSet(getter.accessFlags))
            assertSame(firstProvider.provided, readCurrentDispatcher(getter, fixture, activity))

            activity.fields[fixture.peer] = secondPeer
            assertSame(secondProvider.provided, readCurrentDispatcher(getter, fixture, activity))

            secondPeer.fields[fixture.provider] = thirdProvider
            assertSame(thirdProvider.provided, readCurrentDispatcher(getter, fixture, activity))

            thirdProvider.provided = Any()
            assertSame(thirdProvider.provided, readCurrentDispatcher(getter, fixture, activity))
        }
    }

    @Test
    fun getterReturnsNullForMissingPeerProviderOrProvidedDispatcher() {
        for (version in versions) {
            val fixture = Fixture(version)
            val getter = smartShuffleActivityGetter(fixture.activity, fixture.route)
            val activity = Instance()
            val peer = Instance()
            val provider = Instance()

            assertNull(readCurrentDispatcher(getter, fixture, activity))

            activity.fields[fixture.peer] = peer
            assertNull(readCurrentDispatcher(getter, fixture, activity))

            peer.fields[fixture.provider] = provider
            assertNull(readCurrentDispatcher(getter, fixture, activity))
        }
    }

    @Test
    fun gatewayDecodesRootWithoutClobberingCurrentReceiverAndCallsNativeDefaultContextEntryOnce() {
        for (version in versions) {
            val fixture = Fixture(version)
            val gateway = smartShuffleActivityDispatch(
                fixture.activity, fixture.route, fixture.proto.decode("p1", "v0"),
            )
            val code = gateway.implementation!!.instructions.toList()
            val calls = code.mapNotNull { it.getReference<MethodReference>() }
            val getterCall = code.single { it.getReference<MethodReference>()?.name == "smartCurrentDispatcher" }
            val getterIndex = code.indexOf(getterCall)
            val parserCall = code.single { it.getReference<MethodReference>() == fixture.proto.parser }
            val parserIndex = code.indexOf(parserCall)
            val dispatchCall = code.single { it.getReference<MethodReference>() == fixture.dispatch }
            val dispatchIndex = code.indexOf(dispatchCall)

            assertEquals("smartDispatch", gateway.name)
            assertEquals(fixture.activity, gateway.definingClass)
            assertEquals(listOf("[B"), gateway.parameterTypes.map(CharSequence::toString))
            assertEquals("V", gateway.returnType)
            assertEquals(6, gateway.implementation!!.registerCount)
            assertEquals(4, (getterCall as FiveRegisterInstruction).registerC)
            assertEquals(fixture.activity, getterCall.getReference<MethodReference>()!!.definingClass)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[getterIndex + 1].opcode)
            assertEquals(3, (code[getterIndex + 1] as OneRegisterInstruction).registerA)
            assertTrue(parserIndex < dispatchIndex)
            assertTrue(getterIndex < dispatchIndex)

            val parse = parserCall as FiveRegisterInstruction
            assertEquals(3, parse.registerCount)
            assertEquals(listOf(0, 5, 1), listOf(parse.registerC, parse.registerD, parse.registerE))
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[parserIndex + 1].opcode)
            assertEquals(0, (code[parserIndex + 1] as OneRegisterInstruction).registerA)
            val registryIndex = code.indexOfFirst {
                it.getReference<MethodReference>()?.name == "getGeneratedRegistry"
            }
            assertTrue(registryIndex >= 0)
            assertEquals(1, (code[registryIndex + 1] as OneRegisterInstruction).registerA)
            assertEquals(
                fixture.proto.defaultInstance,
                code.single { it.opcode == Opcode.SGET_OBJECT }.getReference<FieldReference>(),
            )
            for (instruction in code.subList(getterIndex + 2, dispatchIndex)) {
                if (instruction.opcode.setsRegister() && instruction.opcode != Opcode.CHECK_CAST) {
                    val destination = (instruction as OneRegisterInstruction).registerA
                    assertTrue("Decode clobbered the Activity or dispatcher register", destination in 0..2)
                }
            }

            val invoke = dispatchCall as FiveRegisterInstruction
            assertEquals(Opcode.INVOKE_INTERFACE, dispatchCall.opcode)
            assertEquals(2, invoke.registerCount)
            assertEquals(3, invoke.registerC)
            assertEquals(0, invoke.registerD)
            assertEquals(listOf(fixture.root), fixture.dispatch.parameterTypes.map(CharSequence::toString))
            assertEquals(1, calls.count { it == fixture.dispatch })
            assertFalse(calls.contains(fixture.nativeDispatch))
            assertEquals(4, calls.size)
            assertFalse(code.any { it.opcode == Opcode.NEW_INSTANCE || it.opcode == Opcode.IPUT_OBJECT })
        }
    }
}
