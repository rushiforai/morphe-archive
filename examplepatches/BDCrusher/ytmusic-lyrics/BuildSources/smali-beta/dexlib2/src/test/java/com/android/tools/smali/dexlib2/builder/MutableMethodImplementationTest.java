/*
 * Copyright 2015, Google LLC
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 * Neither the name of Google LLC nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package com.android.tools.smali.dexlib2.builder;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.builder.Label;
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderArrayPayload;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction32x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderPackedSwitchPayload;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderSparseSwitchPayload;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedMethodImplementation;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.debug.DebugItem;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class MutableMethodImplementationTest {

    @Test
    public void testTryEndAtEndOfMethod() {
        MethodImplementationBuilder builder = new MethodImplementationBuilder(10);

        Label startLabel = builder.addLabel("start");
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction32x(Opcode.MOVE_16, 0, 0));
        Label endLabel = builder.addLabel("end");

        builder.addCatch(startLabel, endLabel, startLabel);

        MethodImplementation methodImplementation = builder.getMethodImplementation();

        Assert.assertEquals(0, methodImplementation.getTryBlocks().get(0).getStartCodeAddress());
        Assert.assertEquals(8, methodImplementation.getTryBlocks().get(0).getCodeUnitCount());

        methodImplementation = new MutableMethodImplementation(methodImplementation);

        Assert.assertEquals(0, methodImplementation.getTryBlocks().get(0).getStartCodeAddress());
        Assert.assertEquals(8, methodImplementation.getTryBlocks().get(0).getCodeUnitCount());
    }

    @Test
    public void testNewLabelByAddress() {
        MethodImplementationBuilder builder = new MethodImplementationBuilder(10);

        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction32x(Opcode.MOVE_16, 0, 0));

        MutableMethodImplementation mutableMethodImplementation =
                new MutableMethodImplementation(builder.getMethodImplementation());

        mutableMethodImplementation.addCatch(
                mutableMethodImplementation.newLabelForAddress(0),
                mutableMethodImplementation.newLabelForAddress(8),
                mutableMethodImplementation.newLabelForAddress(1));

        Assert.assertEquals(0, mutableMethodImplementation.getTryBlocks().get(0).getStartCodeAddress());
        Assert.assertEquals(8, mutableMethodImplementation.getTryBlocks().get(0).getCodeUnitCount());
        Assert.assertEquals(1, mutableMethodImplementation.getTryBlocks().get(0).getExceptionHandlers().get(0)
                .getHandlerCodeAddress());
    }

    @Test
    public void testNewLabelByIndex() {
        MethodImplementationBuilder builder = new MethodImplementationBuilder(10);

        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction10x(Opcode.NOP));
        builder.addInstruction(new BuilderInstruction32x(Opcode.MOVE_16, 0, 0));

        MutableMethodImplementation mutableMethodImplementation =
                new MutableMethodImplementation(builder.getMethodImplementation());

        mutableMethodImplementation.addCatch(
                mutableMethodImplementation.newLabelForIndex(0),
                mutableMethodImplementation.newLabelForIndex(6),
                mutableMethodImplementation.newLabelForIndex(1));

        Assert.assertEquals(0, mutableMethodImplementation.getTryBlocks().get(0).getStartCodeAddress());
        Assert.assertEquals(8, mutableMethodImplementation.getTryBlocks().get(0).getCodeUnitCount());
        Assert.assertEquals(1, mutableMethodImplementation.getTryBlocks().get(0).getExceptionHandlers().get(0)
                .getHandlerCodeAddress());
    }

    private static MethodImplementation buildPayloadMethod(List<String> payloadOrder) {
        MethodImplementationBuilder builder = new MethodImplementationBuilder(2);
        builder.addLineNumber(1);
        builder.addInstruction(new BuilderInstruction11n(Opcode.CONST_4, 0, 1));
        builder.addLineNumber(2);
        builder.addInstruction(new BuilderInstruction31t(Opcode.PACKED_SWITCH, 0, builder.getLabel("packed")));
        builder.addInstruction(new BuilderInstruction31t(Opcode.SPARSE_SWITCH, 0, builder.getLabel("sparse")));
        builder.addInstruction(new BuilderInstruction31t(Opcode.FILL_ARRAY_DATA, 1, builder.getLabel("array")));
        Label caseLabel = builder.addLabel("case");
        builder.addLineNumber(3);
        builder.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));

        for (String payload: payloadOrder) {
            builder.addLabel(payload);
            switch (payload) {
                case "packed":
                    builder.addInstruction(new BuilderPackedSwitchPayload(0, Arrays.asList(caseLabel, caseLabel)));
                    break;
                case "sparse":
                    builder.addInstruction(new BuilderSparseSwitchPayload(Arrays.asList(
                            new SwitchLabelElement(5, caseLabel), new SwitchLabelElement(9, caseLabel))));
                    break;
                default:
                    builder.addInstruction(new BuilderArrayPayload(4, Arrays.<Number>asList(1, 2, 3)));
                    break;
            }
        }
        return builder.getMethodImplementation();
    }

    private static List<String> debugItemsString(Iterable<? extends DebugItem> debugItems) {
        List<String> result = new ArrayList<>();
        for (DebugItem debugItem: debugItems) {
            result.add(debugItem.getDebugItemType() + "@" + debugItem.getCodeAddress());
        }
        return result;
    }

    @Test
    public void testDexBackedPayloadAtEndOfMethod() throws IOException {
        List<List<String>> payloadOrders = Arrays.asList(
                Arrays.asList("packed", "sparse", "array"),
                Arrays.asList("array", "packed", "sparse"),
                Arrays.asList("sparse", "array", "packed"));

        for (List<String> payloadOrder: payloadOrders) {
            ImmutableMethod method = new ImmutableMethod("Ltest;", "method", null, "V",
                    AccessFlags.STATIC.getValue(), null, null, buildPayloadMethod(payloadOrder));
            MemoryDataStore dataStore = new MemoryDataStore();
            DexPool.writeTo(dataStore, new ImmutableDexFile(Opcodes.getDefault(), Collections.singletonList(
                    new ImmutableClassDef("Ltest;", 0, "Ljava/lang/Object;", null, null, null, null,
                            Collections.singletonList(method)))));
            DexBackedDexFile dexFile = new DexBackedDexFile(Opcodes.getDefault(),
                    ByteBuffer.wrap(dataStore.getBuffer()));
            DexBackedMethodImplementation implementation = (DexBackedMethodImplementation)
                    dexFile.getClasses().iterator().next().getMethods().iterator().next().getImplementation();
            Assert.assertNotNull(implementation);

            int lastInstructionAddress = 0;
            int codeAddress = 0;
            for (Instruction instruction: implementation.getInstructions()) {
                lastInstructionAddress = codeAddress;
                codeAddress += instruction.getCodeUnits();
            }
            Assert.assertEquals(lastInstructionAddress, implementation.getLastInstructionCodeAddress());

            List<String> debugItems = debugItemsString(implementation.getDebugItems());
            Assert.assertEquals(payloadOrder.toString(), 3, debugItems.size());
            Assert.assertEquals(debugItems, debugItemsString(
                    new MutableMethodImplementation(implementation).getDebugItems()));
        }
    }
}
