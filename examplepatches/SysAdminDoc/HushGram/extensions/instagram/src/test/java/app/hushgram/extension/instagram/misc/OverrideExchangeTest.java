/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class OverrideExchangeTest {
    private static final byte[] NATIVE = bytes("{\"123:config\":[\"0: enabled: true\",\"1: count: -9223372036854775808\",\"2: text: left: right\\nnext\",\"3: ratio: 1.25\",\"4: nullable: __NULL_VALUE__\"]}");

    private static java.util.List<OverrideExchange.Parameter> schema() {
        return Arrays.asList(parameter(0, "enabled", 1), parameter(1, "count", 2), parameter(2, "text", 3),
                parameter(3, "ratio", 4), parameter(4, "nullable", 3));
    }

    private static OverrideExchange.Parameter parameter(int index, String name, int type) {
        return new OverrideExchange.Parameter(123, index, "config", name, type, 1000 + index);
    }

    private static OverrideExchange.Snapshot snapshot(byte[] nativeBytes) throws IOException {
        return new OverrideExchange.Snapshot("449.0.0.52.84", 385511871, schema(), nativeBytes);
    }

    @Test public void roundTripPreservesAllNativeTypesNullAndLiteralStringDelimiters() throws Exception {
        OverrideExchange.Snapshot current = snapshot(NATIVE);
        byte[] file = OverrideExchange.export(current);
        JSONObject root = new JSONObject(new String(file, StandardCharsets.UTF_8));
        assertEquals(1, root.getInt("format"));
        assertEquals("com.instagram.android", root.getJSONObject("host").getString("package"));
        assertEquals(385511871, root.getJSONObject("host").getLong("code"));
        assertEquals(5, root.getJSONObject("schema").getInt("parameters"));
        assertEquals(new JSONObject(new String(NATIVE, StandardCharsets.UTF_8)).toString(), root.getJSONObject("overrides").toString());
        assertEquals(5, OverrideExchange.validate(file, current));
        assertEquals(5, root.length());
        assertEquals(3, root.getJSONObject("host").length());
    }

    @Test public void schemaIdentityDoesNotDependOnNativeIterationOrderButBindsEveryRole() throws Exception {
        java.util.List<OverrideExchange.Parameter> reversed = new java.util.ArrayList<>(schema());
        Collections.reverse(reversed);
        OverrideExchange.Snapshot current = snapshot(NATIVE);
        byte[] file = OverrideExchange.export(current);
        assertEquals(5, OverrideExchange.validate(file, new OverrideExchange.Snapshot("449.0.0.52.84", 385511871, reversed, NATIVE)));
        reversed.set(0, new OverrideExchange.Parameter(123, 4, "config", "nullable", 3, 99999));
        refused(() -> OverrideExchange.validate(file, new OverrideExchange.Snapshot("449.0.0.52.84", 385511871, reversed, NATIVE)));
    }

    @Test public void malformedDuplicateOversizedAndUnknownNativeRecordsRefuseBeforeExport() throws Exception {
        String[] inputs = {
                "{\"123:config\":[],\"123:config\":[]}",
                "{\"123:config\":[\"0: enabled: true\",\"0: enabled: false\"]}",
                "{\"123:other\":[\"0: enabled: true\"]}",
                "{\"123:config\":[\"0: unknown: true\"]}",
                "{\"123:config\":[\"0: enabled: 1\"]}",
                "{\"123:config\":[\"1: count: 9223372036854775808\"]}",
                "{\"123:config\":[\"3: ratio: NaN\"]}",
                "{\"123:config\":[\"3: ratio: 1e9999\"]}",
                "{\"123:config\":[true]}", "{\"123:config\":true}",
                "{\"0:config\":[]}", "{\"1048576:config\":[]}", "{\"123:config\":[\"16384: enabled: true\"]}",
                "{\"123:config\":[\"-1: enabled: true\"]}", "{\"123:config\":[\"0: enabled\"]}", "{} {}"
        };
        for (String input : inputs) refused(() -> snapshot(bytes(input)));
        refused(() -> snapshot(new byte[OverrideExchange.MAX_BYTES + 1]));
        refused(() -> snapshot(new byte[]{(byte) 0xc3, 0x28}));
    }

    @Test public void exactHostSchemaAndEnvelopeAreRequiredDuringValidation() throws Exception {
        OverrideExchange.Snapshot current = snapshot(NATIVE);
        byte[] file = OverrideExchange.export(current);
        refused(() -> OverrideExchange.validate(file, new OverrideExchange.Snapshot("450", 385511871, schema(), NATIVE)));
        refused(() -> OverrideExchange.validate(file, new OverrideExchange.Snapshot("449.0.0.52.84", 385511872, schema(), NATIVE)));
        JSONObject root = new JSONObject(new String(file, StandardCharsets.UTF_8));
        root.getJSONObject("host").put("account", "unwanted");
        final byte[] extra = bytes(root.toString());
        refused(() -> OverrideExchange.validate(extra, current));
        root = new JSONObject(new String(file, StandardCharsets.UTF_8));
        root.getJSONObject("overrides").getJSONArray("123:config").put("0: enabled: false");
        final byte[] duplicate = bytes(root.toString());
        refused(() -> OverrideExchange.validate(duplicate, current));
        String duplicateFormat = new String(file, StandardCharsets.UTF_8).replace("\"format\":1", "\"format\":1,\"format\":1");
        refused(() -> OverrideExchange.validate(bytes(duplicateFormat), current));
        assertArrayEquals(file, OverrideExchange.export(current));
    }

    @Test public void changedValidOverridesAreValidatedOnlyWithoutChangingTheSnapshot() throws Exception {
        OverrideExchange.Snapshot current = snapshot(NATIVE);
        byte[] before = OverrideExchange.export(current);
        JSONObject root = new JSONObject(new String(OverrideExchange.export(current), StandardCharsets.UTF_8));
        root.put("overrides", new JSONObject().put("123:config", new JSONArray().put("0: enabled: false")));
        assertEquals(1, OverrideExchange.validate(bytes(root.toString()), current));
        assertArrayEquals(before, OverrideExchange.export(current));
    }

    @Test public void duplicateSchemaAndUnusableNamesOrTypesFailClosed() throws Exception {
        for (java.util.List<OverrideExchange.Parameter> entries : Arrays.asList(
                Arrays.asList(parameter(0, "enabled", 1), parameter(0, "enabled", 1)),
                Collections.singletonList(parameter(0, "enabled", 9)),
                Collections.singletonList(new OverrideExchange.Parameter(123, 0, "wrong:name", "enabled", 1, 1000)))) {
            refused(() -> new OverrideExchange.Snapshot("449", 1, entries, bytes("{}")));
        }
    }

    @Test public void readsAreBoundedAndZeroProgressCannotLoop() throws Exception {
        assertArrayEquals(NATIVE, OverrideExchange.read(new ByteArrayInputStream(NATIVE)));
        refused(() -> OverrideExchange.read(new ByteArrayInputStream(new byte[OverrideExchange.MAX_BYTES + 1])));
        refused(() -> OverrideExchange.read(new ByteArrayInputStream(NATIVE) {
            @Override public int read(byte[] buffer, int start, int count) { return 0; }
        }));
    }

    private static byte[] bytes(String value) { return value.getBytes(StandardCharsets.UTF_8); }
    private interface Work { void run() throws Exception; }
    private static void refused(Work work) throws Exception {
        try { work.run(); fail("input accepted"); }
        catch (IOException expected) { assertEquals("Invalid or unavailable native overrides", expected.getMessage()); }
    }
}
