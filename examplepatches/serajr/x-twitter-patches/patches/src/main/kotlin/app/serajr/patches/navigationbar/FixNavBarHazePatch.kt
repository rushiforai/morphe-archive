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
private const val HAZE_BLUR_CLASS = "Ldev/chrisbanes/haze/blur/f;"

private const val EXTENSION_CLASS =
    "Lapp/serajr/extension/navigationbar/PersistentNavigationHaze;"

private const val GEOMETRY_LOG_TAG = "NavHazeGeometry"

private fun debugNavHaze(message: String) {
    if (DEBUG) println("FixNavigationBarHaze -> $message")
}

/*
 * Uses only v3 and v4.
 *
 * W(): these registers are available at method entry and
 * immediately before the G1() invocation.
 *
 * G1(): these registers are available immediately before P1().
 *
 * No original argument registers are modified.
 */
/*
 * Entry-only geometry snapshot. W() has 10 registers (v0..v7 locals),
 * so v3..v7 are free before its original first instruction.
 * Does not modify T, U, V or any render-state field.
 */
private fun geometrySnapshotLog(): String = """
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "node="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, " T="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-wide v5, p0, Ldev/chrisbanes/haze/x;->T:J
    invoke-static {v5, v6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, " U="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-wide v5, p0, Ldev/chrisbanes/haze/x;->U:J
    invoke-static {v5, v6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, " V="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-wide v5, p0, Ldev/chrisbanes/haze/x;->V:J
    invoke-static {v5, v6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, " k0="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-boolean v4, p0, Ldev/chrisbanes/haze/x;->k0:Z
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    const-string v7, "NavHazeSnapshot"
    invoke-static {v7, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
""".trimIndent()

private fun rendererStateLog(): String = """
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "node="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, " I1="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v4, " p2="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v4, " k0="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-boolean v4, p0, Ldev/chrisbanes/haze/x;->k0:Z
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v4, " F="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-boolean v4, p0, Ldev/chrisbanes/haze/x;->F:Z
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v4, " rendererIsH0="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-object v5, p0, Ldev/chrisbanes/haze/x;->f0:Ldev/chrisbanes/haze/blur/f;
    const/4 v6, 0x0
    if-eqz v5, :b5_no_renderer
    iget-object v5, v5, Ldev/chrisbanes/haze/blur/f;->i:Ldev/chrisbanes/haze/blur/e;
    instance-of v6, v5, Ldev/chrisbanes/haze/blur/h0;
    :b5_no_renderer
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v4, " rendererIsC0="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    instance-of v6, v5, Ldev/chrisbanes/haze/blur/c0;
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    const-string v4, " rendererIsU="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    instance-of v6, v5, Ldev/chrisbanes/haze/blur/u;
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    invoke-static {v5}, ${EXTENSION_CLASS}->inspectHazeRenderer(Ljava/lang/Object;)V
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    const-string v5, "NavHazeState"
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
""".trimIndent()

private fun cleanupEntryLog(): String = """
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v0
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v1
    const-string v0, "NavHazeCleanup"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
""".trimIndent()

private fun safeDrawLog(tag: String): String = """
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v3
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v4
    const-string v3, "$tag"
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
""".trimIndent()

@Suppress("unused")
val fixNavigationBarHazePatch = bytecodePatch(
    name = "Fix Navigation Bar Haze",
    description = "Phase B6.2 diagnostics: B5.1 baseline plus read-only GraphicsLayer inspection through the navigation extension!",
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
        var hazeRenderMethod: Method? = null
        var hazeCleanupMethod: Method? = null

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
                                "Z", "Z", "Z",
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

                    hazeCleanupMethod = classDef.methods.firstOrNull { method ->
                        method.name == "B1" && method.returnType == "V" &&
                            method.parameterTypes.isEmpty()
                    }

                    hazeRenderMethod = classDef.methods.firstOrNull { method ->
                        method.name == "G1" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf(
                                "Landroidx/compose/ui/node/k0;",
                                "Z"
                            )
                    }
                }
            }
        }

        // PHASE A — ORIGINAL DIAGNOSTICS

        val originalTarget = targetMethod
            ?: error("FixNavigationBarHaze: p2.a() not found.")

        val mutableTarget = mutableClassDefBy(originalTarget.definingClass)
            .methods.firstOrNull { it.toString() == originalTarget.toString() }
            ?: error("FixNavigationBarHaze: mutable p2.a() not found.")

        require(mutableTarget.implementation?.registerCount == 37)
        mutableTarget.addInstructions(
            0,
            "invoke-static {}, ${EXTENSION_CLASS}->initialize()V"
        )

        val originalVisibility = visibilityMethod
            ?: error("FixNavigationBarHaze: o2.setVisible(Z) not found.")

        val mutableVisibility = mutableClassDefBy(originalVisibility.definingClass)
            .methods.firstOrNull { it.toString() == originalVisibility.toString() }
            ?: error("FixNavigationBarHaze: mutable o2.setVisible(Z) not found.")

        require(mutableVisibility.implementation?.registerCount == 2)
        mutableVisibility.addInstructions(
            0,
            "invoke-static {p1}, ${EXTENSION_CLASS}->onBottomBarVisibilityChanged(Z)V"
        )

        val originalContent = contentMethod
            ?: error("FixNavigationBarHaze: m2.invoke() not found.")

        val mutableContent = mutableClassDefBy(originalContent.definingClass)
            .methods.firstOrNull { it.toString() == originalContent.toString() }
            ?: error("FixNavigationBarHaze: mutable m2.invoke() not found.")

        require(mutableContent.implementation?.registerCount == 22)
        mutableContent.addInstructions(
            0,
            "invoke-static {}, ${EXTENSION_CLASS}->onBottomBarContentComposed()V"
        )

        val originalSize = sizeMethod
            ?: error("FixNavigationBarHaze: o2.getSize() not found.")

        val mutableSize = mutableClassDefBy(originalSize.definingClass)
            .methods.firstOrNull { it.toString() == originalSize.toString() }
            ?: error("FixNavigationBarHaze: mutable o2.getSize() not found.")

        val sizeImplementation = mutableSize.implementation
            ?: error("FixNavigationBarHaze: getSize() implementation missing.")

        val sizeInstructions = sizeImplementation.instructions.toList()
        val returnIndex = sizeInstructions.indexOfLast {
            it.opcode == Opcode.RETURN
        }

        require(returnIndex >= 0)

        val returnInstruction = sizeInstructions[returnIndex]
            as? OneRegisterInstruction
            ?: error("FixNavigationBarHaze: unexpected getSize() return.")

        mutableSize.addInstructions(
            returnIndex,
            "invoke-static {v${returnInstruction.registerA}}, " +
                "${EXTENSION_CLASS}->onBottomBarSizeChanged(I)V"
        )

        // PHASE B2 — GEOMETRY DIAGNOSTICS

        fun installGeometryHook(
            original: Method?,
            methodName: String,
            fieldName: String,
            geometryLabel: String
        ) {
            val target = original
                ?: error("FixNavigationBarHaze: $methodName not found.")

            val mutable = mutableClassDefBy(target.definingClass)
                .methods.firstOrNull { it.toString() == target.toString() }
                ?: error("FixNavigationBarHaze: mutable $methodName not found.")

            val implementation = mutable.implementation
                ?: error("FixNavigationBarHaze: $methodName implementation missing.")

            require(implementation.registerCount == 5)

            val instructions = implementation.instructions.toList()
            val writeIndices = instructions.indices.filter {
                instructions[it].opcode == Opcode.IPUT_WIDE
            }

            require(writeIndices.size == 1)

            val writeIndex = writeIndices.single()
            val reference = (instructions[writeIndex]
                as? ReferenceInstruction)?.reference?.toString()

            require(reference == "$HAZE_NODE_CLASS->$fieldName:J") {
                "FixNavigationBarHaze: unexpected field $reference"
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
        }

        installGeometryHook(hazeSizeMethod, "X1", "U", "Size")
        installGeometryHook(hazeOffsetMethod, "W1", "V", "Offset")

        // PHASE B3-SAFE — DRAW METHOD

        val originalDraw = hazeDrawMethod
            ?: error("FixNavigationBarHaze: haze.x.W() not found.")

        val mutableDraw = mutableClassDefBy(originalDraw.definingClass)
            .methods.firstOrNull { it.toString() == originalDraw.toString() }
            ?: error("FixNavigationBarHaze: mutable haze.x.W() not found.")

        require(mutableDraw.implementation?.registerCount == 10)

        val drawInstructions = mutableDraw.implementation!!
            .instructions.toList()

        val g1Indices = drawInstructions.indices.filter { index ->
            val instruction = drawInstructions[index]
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)
                    ?.reference?.toString()?.contains(
                        "$HAZE_NODE_CLASS->G1("
                    ) == true
        }

        require(g1Indices.size == 1) {
            "FixNavigationBarHaze: expected exactly one G1 call in W()."
        }

        // Insert at the later index first.
        mutableDraw.addInstructions(
            g1Indices.single(),
            safeDrawLog("NavHazeG1")
        )

        // Method-entry diagnostics; both snippets use only dead locals.
        mutableDraw.addInstructions(
            0,
            safeDrawLog("NavHazeEnter") + "\n" + geometrySnapshotLog()
        )

        // PHASE B3-SAFE — RENDER ACTIVATION

        val originalRender = hazeRenderMethod
            ?: error("FixNavigationBarHaze: haze.x.G1() not found.")

        val mutableRender = mutableClassDefBy(originalRender.definingClass)
            .methods.firstOrNull { it.toString() == originalRender.toString() }
            ?: error("FixNavigationBarHaze: mutable haze.x.G1() not found.")

        require(mutableRender.implementation?.registerCount == 12)

        val renderInstructions = mutableRender.implementation!!
            .instructions.toList()

        // B5: Read I1's EXISTING move-result. Do not call I1 again.
        val i1CallIndices = renderInstructions.indices.filter { index ->
            val instruction = renderInstructions[index]
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "$HAZE_NODE_CLASS->I1()Z"
        }
        require(i1CallIndices.size == 1) {
            "FixNavigationBarHaze: expected exactly one I1() call in G1()."
        }
        val i1ResultIndex = i1CallIndices.single() + 1
        require(i1ResultIndex < renderInstructions.size &&
            renderInstructions[i1ResultIndex].opcode == Opcode.MOVE_RESULT &&
            (renderInstructions[i1ResultIndex] as? OneRegisterInstruction)?.registerA == 0
        ) { "FixNavigationBarHaze: unexpected I1() result register in G1()." }

        // B4.1: Keep the verified P1 hook. E1/F1 instrumentation is
        // deferred until their exact call sites and register liveness
        // are verified in the target APK.
        val p1Indices = renderInstructions.indices.filter { index ->
            val instruction = renderInstructions[index]
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)
                    ?.reference?.toString()?.contains(
                        "$HAZE_NODE_CLASS->P1("
                    ) == true
        }

        require(p1Indices.size == 1) {
            "FixNavigationBarHaze: expected exactly one P1 call in G1()."
        }

        // Insert later index first to preserve original instruction positions.
        mutableRender.addInstructions(
            p1Indices.single(),
            safeDrawLog("NavHazeActive")
        )
        mutableRender.addInstructions(
            i1ResultIndex + 1,
            rendererStateLog()
        )

        val originalCleanup = hazeCleanupMethod
            ?: error("FixNavigationBarHaze: haze.x.B1() not found.")
        val mutableCleanup = mutableClassDefBy(originalCleanup.definingClass)
            .methods.firstOrNull { it.toString() == originalCleanup.toString() }
            ?: error("FixNavigationBarHaze: mutable haze.x.B1() not found.")
        require(mutableCleanup.implementation?.registerCount == 3)
        mutableCleanup.addInstructions(0, cleanupEntryLog())

        debugNavHaze("Phase B6.2 diagnostics installed.")
    }
}
