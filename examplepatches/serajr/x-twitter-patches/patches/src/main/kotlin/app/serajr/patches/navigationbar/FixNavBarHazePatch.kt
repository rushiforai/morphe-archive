package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val DEBUG = false

private const val TARGET_CLASS = "Lcom/x/ui/common/p2;"
private const val VISIBILITY_CLASS = "Lcom/x/ui/common/o2;"
private const val CONTENT_CLASS = "Lcom/x/ui/common/m2;"
private const val HAZE_NODE_CLASS = "Ldev/chrisbanes/haze/x;"

private const val EXTENSION_CLASS =
    "Lapp/serajr/extension/navigationbar/PersistentNavigationHaze;"

private const val GEOMETRY_LOG_TAG = "NavHazeGeometry"
private const val DRAW_LOG_TAG = "NavHazeDraw"

private fun debugNavHaze(message: String) {
    if (DEBUG) println("FixNavigationBarHaze -> $message")
}

@Suppress("unused")
val fixNavigationBarHazePatch = bytecodePatch(
    name = "Fix Navigation Bar Haze",
    description = "Phase B3 diagnostics: monitors bottom bar behavior, HazeEffect geometry, and draw paths on X 12.35!",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    extendWith("extensions/navigation.mpe")

    execute {
        var targetMethod: Method? = null
        var visibilityMethod: Method? = null
        var contentMethod: Method? = null
        var sizeMethod: Method? = null

        var hazeSizeMethod: Method? = null
        var hazeOffsetMethod: Method? = null
        var hazeDrawMethod: Method? = null

        classDefForEach { classDef ->
            when (classDef.type.toString()) {
                TARGET_CLASS -> {
                    targetMethod = classDef.methods.firstOrNull { method ->
                        method.name == "a" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf(
                                "Landroidx/compose/runtime/internal/g;",
                                "Ldev/chrisbanes/haze/x0;",
                                "Lkotlin/jvm/functions/Function1;",
                                "Landroidx/compose/ui/Modifier;",
                                "Landroidx/compose/runtime/internal/g;",
                                "Z",
                                "Z",
                                "Z",
                                "Landroidx/compose/runtime/internal/g;",
                                "Landroidx/compose/runtime/Composer;",
                                "I"
                            )
                    }
                }

                VISIBILITY_CLASS -> {
                    visibilityMethod = classDef.methods.firstOrNull { method ->
                        method.name == "setVisible" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf("Z")
                    }

                    sizeMethod = classDef.methods.firstOrNull { method ->
                        method.name == "getSize" &&
                            method.returnType == "I" &&
                            method.parameterTypes.isEmpty()
                    }
                }

                CONTENT_CLASS -> {
                    contentMethod = classDef.methods.firstOrNull { method ->
                        method.name == "invoke" &&
                            method.returnType == "Ljava/lang/Object;" &&
                            method.parameterTypes.map { it.toString() } == listOf(
                                "Ljava/lang/Object;",
                                "Ljava/lang/Object;",
                                "Ljava/lang/Object;"
                            )
                    }
                }

                HAZE_NODE_CLASS -> {
                    hazeSizeMethod = classDef.methods.firstOrNull { method ->
                        method.name == "X1" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf("J")
                    }

                    hazeOffsetMethod = classDef.methods.firstOrNull { method ->
                        method.name == "W1" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf("J")
                    }

                    hazeDrawMethod = classDef.methods.firstOrNull { method ->
                        method.name == "W" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf(
                                "Landroidx/compose/ui/node/k0;"
                            )
                    }
                }
            }
        }

        // ============================================================
        // PHASE A — VALIDATED DIAGNOSTIC HOOKS
        // ============================================================

        // Hook 1: Initialize the navigation Haze extension.
        val originalTarget = targetMethod
            ?: error("FixNavigationBarHaze: p2.a() not found.")

        val mutableTarget = mutableClassDefBy(originalTarget.definingClass)
            .methods.firstOrNull { it.toString() == originalTarget.toString() }
            ?: error("FixNavigationBarHaze: mutable p2.a() not found.")

        require(mutableTarget.implementation?.registerCount == 37) {
            "FixNavigationBarHaze: unexpected p2.a() register layout."
        }

        mutableTarget.addInstructions(
            0,
            "invoke-static {}, ${EXTENSION_CLASS}->initialize()V"
        )

        // Hook 2: Monitor bottom bar visibility changes.
        val originalVisibility = visibilityMethod
            ?: error("FixNavigationBarHaze: o2.setVisible(Z) not found.")

        val mutableVisibility = mutableClassDefBy(originalVisibility.definingClass)
            .methods.firstOrNull { it.toString() == originalVisibility.toString() }
            ?: error("FixNavigationBarHaze: mutable o2.setVisible(Z) not found.")

        require(mutableVisibility.implementation?.registerCount == 2) {
            "FixNavigationBarHaze: unexpected o2.setVisible(Z) register layout."
        }

        mutableVisibility.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}->onBottomBarVisibilityChanged(Z)V"
        )

        // Hook 3: Monitor bottom bar content composition.
        val originalContent = contentMethod
            ?: error("FixNavigationBarHaze: m2.invoke() not found.")

        val mutableContent = mutableClassDefBy(originalContent.definingClass)
            .methods.firstOrNull { it.toString() == originalContent.toString() }
            ?: error("FixNavigationBarHaze: mutable m2.invoke() not found.")

        require(mutableContent.implementation?.registerCount == 22) {
            "FixNavigationBarHaze: unexpected m2.invoke() register layout."
        }

        mutableContent.addInstructions(
            0,
            "invoke-static {}, ${EXTENSION_CLASS}->onBottomBarContentComposed()V"
        )

        // Hook 4: Monitor the animated bottom bar size.
        val originalSize = sizeMethod
            ?: error("FixNavigationBarHaze: o2.getSize() not found.")

        val mutableSize = mutableClassDefBy(originalSize.definingClass)
            .methods.firstOrNull { it.toString() == originalSize.toString() }
            ?: error("FixNavigationBarHaze: mutable o2.getSize() not found.")

        val sizeImplementation = mutableSize.implementation
            ?: error("FixNavigationBarHaze: o2.getSize() has no implementation.")

        debugNavHaze(
            "o2.getSize() registerCount=${sizeImplementation.registerCount}"
        )

        val sizeInstructions = sizeImplementation.instructions.toList()

        val returnIndex = sizeInstructions.indexOfLast {
            it.opcode == Opcode.RETURN
        }

        require(returnIndex >= 0) {
            "FixNavigationBarHaze: o2.getSize() return not found."
        }

        val returnInstruction = sizeInstructions[returnIndex]
            as? OneRegisterInstruction
            ?: error("FixNavigationBarHaze: unexpected getSize() return instruction.")

        val resultRegister = returnInstruction.registerA

        mutableSize.addInstructions(
            returnIndex,
            "invoke-static {v$resultRegister}, ${EXTENSION_CLASS}->onBottomBarSizeChanged(I)V"
        )

        debugNavHaze("Four Phase A diagnostic hooks installed.")

        // ============================================================
        // PHASE B2 — HAZE EFFECT GEOMETRY DIAGNOSTICS
        // ============================================================

        fun installGeometryHook(
            original: Method?,
            methodName: String,
            fieldName: String,
            geometryLabel: String
        ) {
            val target = original
                ?: error(
                    "FixNavigationBarHaze: haze.x.$methodName(J) not found."
                )

            val mutable = mutableClassDefBy(target.definingClass)
                .methods.firstOrNull {
                    it.toString() == target.toString()
                }
                ?: error(
                    "FixNavigationBarHaze: mutable haze.x.$methodName(J) not found."
                )

            val implementation = mutable.implementation
                ?: error(
                    "FixNavigationBarHaze: haze.x.$methodName(J) has no implementation."
                )

            require(implementation.registerCount == 5) {
                "FixNavigationBarHaze: unexpected $methodName(J) register layout."
            }

            val instructions = implementation.instructions.toList()

            val writeIndices = instructions.indices.filter { index ->
                instructions[index].opcode == Opcode.IPUT_WIDE
            }

            require(writeIndices.size == 1) {
                "FixNavigationBarHaze: unexpected $methodName(J) geometry writes."
            }

            val writeIndex = writeIndices.single()

            val fieldReference =
                (instructions[writeIndex] as? ReferenceInstruction)
                    ?.reference
                    ?.toString()

            require(fieldReference == "$HAZE_NODE_CLASS->$fieldName:J") {
                "FixNavigationBarHaze: unexpected $methodName(J) field: $fieldReference"
            }

            mutable.addInstructions(
                writeIndex + 1,
                """
                new-instance v0, Ljava/lang/StringBuilder;
                invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

                const-string v1, "$geometryLabel node="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
                move-result v1

                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v1, " value="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;
                move-result-object v1

                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v0

                const-string v1, "$GEOMETRY_LOG_TAG"
                invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                """.trimIndent()
            )

            debugNavHaze(
                "$methodName(J) $geometryLabel diagnostic hook installed."
            )
        }

        // Hook 5: Track calculated HazeEffect size.
        installGeometryHook(
            original = hazeSizeMethod,
            methodName = "X1",
            fieldName = "U",
            geometryLabel = "Size"
        )

        // Hook 6: Track calculated HazeEffect offset.
        installGeometryHook(
            original = hazeOffsetMethod,
            methodName = "W1",
            fieldName = "V",
            geometryLabel = "Offset"
        )

        debugNavHaze("Phase B2 geometry diagnostics installed.")

        // ============================================================
        // PHASE B3 — HAZE EFFECT DRAW PATH DIAGNOSTICS
        // ============================================================

        val originalDraw = hazeDrawMethod
            ?: error("FixNavigationBarHaze: haze.x.W(k0) not found.")

        val mutableDraw = mutableClassDefBy(originalDraw.definingClass)
            .methods.firstOrNull { it.toString() == originalDraw.toString() }
            ?: error("FixNavigationBarHaze: mutable haze.x.W(k0) not found.")

        val drawImplementation = mutableDraw.implementation
            ?: error("FixNavigationBarHaze: haze.x.W(k0) has no implementation.")

        require(drawImplementation.registerCount == 10) {
            "FixNavigationBarHaze: unexpected haze.x.W(k0) register layout."
        }

        val drawInstructions = drawImplementation.instructions.toList()

        fun findDrawCallIndex(
            methodReference: String
        ): Int {
            val matches = drawInstructions.indices.filter { index ->
                val instruction = drawInstructions[index]

                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    (instruction as? ReferenceInstruction)
                        ?.reference
                        ?.toString() == methodReference
            }

            require(matches.size == 1) {
                "FixNavigationBarHaze: expected one call to $methodReference, found ${matches.size}."
            }

            return matches.single()
        }

        val g1Index = findDrawCallIndex(
            "${HAZE_NODE_CLASS}->G1(Landroidx/compose/ui/node/k0;Z)V"
        )

        val d1Index = findDrawCallIndex(
            "${HAZE_NODE_CLASS}->D1(Landroidx/compose/ui/node/k0;)V"
        )

        val drawContentReference =
            "Lcom/x/urt/items/post/e;->h(Landroidx/compose/ui/node/k0;)V"

        val drawContentIndices = drawInstructions.indices.filter { index ->
            val instruction = drawInstructions[index]

            instruction.opcode == Opcode.INVOKE_STATIC &&
                (instruction as? ReferenceInstruction)
                    ?.reference
                    ?.toString() == drawContentReference
        }

        require(drawContentIndices.size == 3) {
            "FixNavigationBarHaze: unexpected drawContent() call layout."
        }

        // The last drawContent() call is the fallback reached when
        // either T or U contains the packed NaN sentinel.
        val invalidGeometryIndex = drawContentIndices.last()

        // Generate logging code using only registers v3 and v4.
        // These registers are dead at the selected call sites.
        //
        // p0 is never modified, and p1/v0 retain their original
        // values for the subsequent drawing call.

        fun drawPathLog(path: String): String =
            """
            invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
            move-result v3

            invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
            move-result-object v3

            const-string v4, "$path node="
            invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v3

            const-string v4, "$DRAW_LOG_TAG"
            invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent()

        // Install hooks from the highest original index downward.
        // This avoids shifting the positions of earlier call sites.

        val drawHooks = listOf(
            invalidGeometryIndex to drawPathLog("INVALID_GEOMETRY"),
            d1Index to drawPathLog("D1"),
            g1Index to drawPathLog("G1")
        )

        drawHooks.sortedByDescending { it.first }.forEach { (index, code) ->
            mutableDraw.addInstructions(index, code)
        }

        // Entry hook: v0/v1 are safe because the original first
        // instruction initializes v0 immediately afterward.
        //
        // This records every invocation, including cases where the
        // node is detached and no rendering path is executed.

        mutableDraw.addInstructions(
            0,
            """
            invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
            move-result v0

            invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
            move-result-object v0

            const-string v1, "ENTER node="
            invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0

            const-string v1, "$DRAW_LOG_TAG"
            invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent()
        )

        debugNavHaze("Phase B3 draw diagnostics installed.")

        // ============================================================
        // SAFETY
        // ============================================================

        // Preserve the original bottom bar visibility animation.
        // Preserve native edge-to-edge behavior.
        // Preserve the original HazeEffect rendering implementation.
        // Do not modify k2.a() or inject additional Compose nodes.
        //
        // All Phase B3 changes are diagnostic only.

        debugNavHaze("All seven diagnostic hooks installed.")
    }
}
