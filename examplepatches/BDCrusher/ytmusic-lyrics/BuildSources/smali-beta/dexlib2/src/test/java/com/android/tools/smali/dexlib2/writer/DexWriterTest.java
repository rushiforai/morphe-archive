/*
 * Copyright 2014, Google LLC
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Google LLC nor the names of its
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

package com.android.tools.smali.dexlib2.writer;

import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.AnnotationVisibility;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.dexbacked.raw.ProtoIdItem;
import com.android.tools.smali.dexlib2.iface.Annotation;
import com.android.tools.smali.dexlib2.iface.AnnotationElement;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodProtoReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.value.AnnotationEncodedValue;
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue;
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation;
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableAnnotationEncodedValue;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableNullEncodedValue;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.util.CollectionUtils;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.TreeMap;

public class DexWriterTest {
    @Test
    public void testAnnotationElementOrder() {
        // Elements are out of order wrt to the element name
        ImmutableSet<ImmutableAnnotationElement> elements =
                ImmutableSet.of(new ImmutableAnnotationElement("zabaglione", ImmutableNullEncodedValue.INSTANCE),
                        new ImmutableAnnotationElement("blah", ImmutableNullEncodedValue.INSTANCE));

        ImmutableAnnotation annotation = new ImmutableAnnotation(AnnotationVisibility.RUNTIME,
                "Lorg/test/anno;", elements);

        ImmutableClassDef classDef = new ImmutableClassDef("Lorg/test/blah;",
                0, "Ljava/lang/Object;", null, null, ImmutableSet.of(annotation), null, null);

        MemoryDataStore dataStore = new MemoryDataStore();

        try {
            DexPool.writeTo(dataStore, new ImmutableDexFile(Opcodes.getDefault(), ImmutableSet.of(classDef)));
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }

        DexBackedDexFile dexFile = new DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(dataStore.getBuffer()));
        ClassDef dbClassDef = Iterables.getFirst(dexFile.getClasses(), null);
        Assert.assertNotNull(dbClassDef);
        Annotation dbAnnotation = Iterables.getFirst(dbClassDef.getAnnotations(), null);
        Assert.assertNotNull(dbAnnotation);
        List<AnnotationElement> dbElements = Lists.newArrayList(dbAnnotation.getElements());

        // Ensure that the elements were written out in sorted order
        Assert.assertEquals(2, dbElements.size());
        Assert.assertEquals("blah", dbElements.get(0).getName());
        Assert.assertEquals("zabaglione", dbElements.get(1).getName());
    }

    @Test
    public void testEncodedAnnotationElementOrder() {
        // Elements are out of order wrt to the element name
        ImmutableSet<ImmutableAnnotationElement> encodedElements =
                ImmutableSet.of(new ImmutableAnnotationElement("zabaglione", ImmutableNullEncodedValue.INSTANCE),
                        new ImmutableAnnotationElement("blah", ImmutableNullEncodedValue.INSTANCE));

        ImmutableAnnotationEncodedValue encodedAnnotations =
                new ImmutableAnnotationEncodedValue("Lan/encoded/annotation", encodedElements);

        ImmutableSet<ImmutableAnnotationElement> elements =
                ImmutableSet.of(new ImmutableAnnotationElement("encoded_annotation", encodedAnnotations));

        ImmutableAnnotation annotation = new ImmutableAnnotation(AnnotationVisibility.RUNTIME,
                "Lorg/test/anno;", elements);

        ImmutableClassDef classDef = new ImmutableClassDef("Lorg/test/blah;",
                0, "Ljava/lang/Object;", null, null, ImmutableSet.of(annotation), null, null);

        MemoryDataStore dataStore = new MemoryDataStore();

        try {
            DexPool.writeTo(dataStore, new ImmutableDexFile(Opcodes.getDefault(), ImmutableSet.of(classDef)));
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }

        DexBackedDexFile dexFile = new DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(dataStore.getBuffer()));
        ClassDef dbClassDef = Iterables.getFirst(dexFile.getClasses(), null);
        Assert.assertNotNull(dbClassDef);
        Annotation dbAnnotation = Iterables.getFirst(dbClassDef.getAnnotations(), null);
        Assert.assertNotNull(dbAnnotation);

        AnnotationElement element = Iterables.getFirst(dbAnnotation.getElements(), null);
        AnnotationEncodedValue dbAnnotationEncodedValue = (AnnotationEncodedValue)element.getValue();

        List<AnnotationElement> dbElements = Lists.newArrayList(dbAnnotationEncodedValue.getElements());

        // Ensure that the elements were written out in sorted order
        Assert.assertEquals(2, dbElements.size());
        Assert.assertEquals("blah", dbElements.get(0).getName());
        Assert.assertEquals("zabaglione", dbElements.get(1).getName());
    }

    private static DexBackedDexFile writeClasses(List<ImmutableClassDef> classDefs) throws IOException {
        MemoryDataStore dataStore = new MemoryDataStore();
        DexPool.writeTo(dataStore, new ImmutableDexFile(Opcodes.getDefault(), classDefs));
        return new DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(dataStore.getBuffer()));
    }

    @Test
    public void testReferenceOrder() throws IOException {
        // Names, types and parameter lists that sort differently by value, length and prefix.
        List<String> names = Arrays.asList("b", "a", "aa", "B", "z", "ab");
        List<String> returnTypes = Arrays.asList("V", "I", "Lb;", "La;", "[I");
        List<List<String>> parameterLists = Arrays.asList(
                Collections.<String>emptyList(),
                Arrays.asList("I"),
                Arrays.asList("I", "I"),
                Arrays.asList("J"),
                Arrays.asList("I", "J"),
                Arrays.asList("La;", "I"),
                Arrays.asList("Ljava/lang/String;"),
                Arrays.asList("[I"));

        List<ImmutableClassDef> classDefs = new ArrayList<>();
        int expectedMethods = 0;
        int expectedFields = 0;
        for (String type: Arrays.asList("Lb;", "La;", "Lc/a;")) {
            List<ImmutableMethod> methods = new ArrayList<>();
            List<ImmutableField> fields = new ArrayList<>();
            for (String name: names) {
                for (String returnType: returnTypes) {
                    for (List<String> parameterTypes: parameterLists) {
                        List<ImmutableMethodParameter> parameters = new ArrayList<>();
                        for (String parameterType: parameterTypes) {
                            parameters.add(new ImmutableMethodParameter(parameterType, null, null));
                        }
                        methods.add(new ImmutableMethod(type, name, parameters, returnType, 0, null, null, null));
                    }
                    fields.add(new ImmutableField(type, name, returnType.equals("V") ? "J" : returnType, 0,
                            null, null, null));
                }
            }
            expectedMethods += methods.size();
            expectedFields += fields.size();
            classDefs.add(new ImmutableClassDef(type, 0, "Ljava/lang/Object;", null, null, null, fields, methods));
        }

        DexBackedDexFile dexFile = writeClasses(classDefs);

        List<? extends MethodReference> methods = dexFile.getMethodSection();
        Assert.assertEquals(expectedMethods, methods.size());
        for (int i = 1; i < methods.size(); i++) {
            Assert.assertTrue(methods.get(i - 1) + " " + methods.get(i), methods.get(i - 1).compareTo(methods.get(i)) < 0);
        }

        List<? extends FieldReference> fields = dexFile.getFieldSection();
        Assert.assertEquals(expectedFields, fields.size());
        for (int i = 1; i < fields.size(); i++) {
            Assert.assertTrue(fields.get(i - 1) + " " + fields.get(i), fields.get(i - 1).compareTo(fields.get(i)) < 0);
        }

        List<? extends MethodProtoReference> protos = dexFile.getProtoSection();
        Assert.assertEquals(returnTypes.size() * parameterLists.size(), protos.size());
        for (int i = 1; i < protos.size(); i++) {
            Assert.assertTrue(protos.get(i - 1) + " " + protos.get(i), protos.get(i - 1).compareTo(protos.get(i)) < 0);
        }

        // Type lists are written sorted by their types, so the parameter lists are at increasing offsets.
        TreeMap<List<String>, Integer> parameterListOffsets = new TreeMap<>(
                CollectionUtils::compareAsIterable);
        for (int i = 0; i < protos.size(); i++) {
            List<String> parameterTypes = new ArrayList<>();
            for (CharSequence parameterType: protos.get(i).getParameterTypes()) {
                parameterTypes.add(parameterType.toString());
            }
            if (!parameterTypes.isEmpty()) {
                int offset = dexFile.getBuffer().readSmallUint(
                        dexFile.getProtoSection().getOffset(i) + ProtoIdItem.PARAMETERS_OFFSET);
                Integer previousOffset = parameterListOffsets.put(parameterTypes, offset);
                Assert.assertTrue(previousOffset == null || previousOffset == offset);
            }
        }
        Assert.assertEquals(parameterLists.size() - 1, parameterListOffsets.size());
        int previousOffset = 0;
        for (int offset: parameterListOffsets.values()) {
            Assert.assertTrue(parameterListOffsets.toString(), offset > previousOffset);
            previousOffset = offset;
        }
    }

    @Test
    public void testStaticInitializers() throws IOException {
        List<ImmutableClassDef> classDefs = new ArrayList<>();
        for (String type: Arrays.asList("La;", "Lb;")) {
            // Static and instance fields in mixed order, with a default value and fields without a value.
            List<ImmutableField> fields = Arrays.asList(
                    new ImmutableField(type, "x", "I", 0, null, null, null),
                    new ImmutableField(type, "c", "I", AccessFlags.STATIC.getValue(),
                            new ImmutableIntEncodedValue(3), null, null),
                    new ImmutableField(type, "a", "I", AccessFlags.STATIC.getValue(),
                            new ImmutableIntEncodedValue(1), null, null),
                    new ImmutableField(type, "y", "I", 0, null, null, null),
                    new ImmutableField(type, "b", "I", AccessFlags.STATIC.getValue(),
                            new ImmutableIntEncodedValue(0), null, null),
                    new ImmutableField(type, "d", "I", AccessFlags.STATIC.getValue(), null, null, null));
            classDefs.add(new ImmutableClassDef(type, 0, "Ljava/lang/Object;", null, null, null, fields, null));
        }

        DexBackedDexFile dexFile = writeClasses(classDefs);

        Assert.assertEquals(2, dexFile.getClasses().size());
        for (ClassDef classDef: dexFile.getClasses()) {
            List<String> names = new ArrayList<>();
            List<Integer> values = new ArrayList<>();
            for (Field field: classDef.getStaticFields()) {
                names.add(field.getName());
                values.add(field.getInitialValue() == null ? null :
                        ((IntEncodedValue) field.getInitialValue()).getValue());
            }
            Assert.assertEquals(Arrays.asList("a", "b", "c", "d"), names);
            Assert.assertEquals(Arrays.asList(1, 0, 3, null), values);
        }
    }

    @Test
    public void testDexBackedReferenceEquality() throws IOException {
        ImmutableMethod method = new ImmutableMethod("La;", "foo",
                Collections.singletonList(new ImmutableMethodParameter("I", null, null)), "V", 0, null, null, null);
        ImmutableMethod otherMethod = new ImmutableMethod("La;", "foo", null, "V", 0, null, null, null);
        ImmutableField field = new ImmutableField("La;", "bar", "I", 0, null, null, null);
        DexBackedDexFile dexFile = writeClasses(Collections.singletonList(new ImmutableClassDef("La;", 0,
                "Ljava/lang/Object;", null, null, null, Collections.singletonList(field),
                Arrays.asList(method, otherMethod))));

        ImmutableMethodReference methodReference = new ImmutableMethodReference("La;", "foo",
                Collections.singletonList("I"), "V");
        MethodReference first = null;
        MethodReference second = null;
        for (int i = 0; i < dexFile.getMethodSection().size(); i++) {
            if (dexFile.getMethodSection().get(i).equals(methodReference)) {
                first = dexFile.getMethodSection().get(i);
                second = dexFile.getMethodSection().get(i);
            }
        }
        Assert.assertNotNull(first);
        Assert.assertNotSame(first, second);
        Assert.assertEquals(first, second);
        Assert.assertEquals(first.hashCode(), second.hashCode());
        Assert.assertEquals(methodReference, first);
        Assert.assertEquals(methodReference.hashCode(), first.hashCode());
        for (MethodReference other: dexFile.getMethodSection()) {
            if (other.getParameterTypes().isEmpty()) {
                Assert.assertNotEquals(first, other);
                Assert.assertNotEquals(other, first);
            }
        }

        ImmutableFieldReference fieldReference = new ImmutableFieldReference("La;", "bar", "I");
        FieldReference dexField = dexFile.getFieldSection().get(0);
        Assert.assertEquals(dexField, dexFile.getFieldSection().get(0));
        Assert.assertEquals(fieldReference, dexField);
        Assert.assertEquals(dexField, fieldReference);
        Assert.assertEquals(fieldReference.hashCode(), dexField.hashCode());
        Assert.assertNotEquals(new ImmutableFieldReference("La;", "bar", "J"), dexField);
    }
}
