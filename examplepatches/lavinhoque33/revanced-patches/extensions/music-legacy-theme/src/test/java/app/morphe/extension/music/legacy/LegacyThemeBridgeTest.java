/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-16
 */
package app.morphe.extension.music.legacy;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;

public class LegacyThemeBridgeTest {
    private static final byte[] UPDATE;
    private static final byte[] IDENTIFIER;
    private static final byte[] LIGHT;
    private static final byte[] DARK;
    private static final byte[] EMPTY = new byte[0];

    static {
        try (InputStream stream = LegacyThemeBridgeTest.class.getResourceAsStream("/theme-update-804.pb")) {
            if (stream == null) throw new IllegalStateException("Missing captured theme update");
            UPDATE = stream.readAllBytes();
            IDENTIFIER = fieldValue(UPDATE, 1);
            byte[] bundle = fieldValue(UPDATE, 4);
            byte[][] variants = new byte[3][];
            int[] offset = {0};
            while (offset[0] < bundle.length) {
                long tag = read(bundle, offset);
                int size = (int) read(bundle, offset);
                byte[] entry = copy(bundle, offset[0], size);
                offset[0] += size;
                if ((tag >>> 3) == 1) variants[scalarValue(entry, 3)] = fieldValue(entry, 2);
            }
            LIGHT = variants[1];
            DARK = variants[2];
        } catch (Exception exception) {
            throw new ExceptionInInitializerError(exception);
        }
    }

    @Test
    public void darkAppearanceSuppliesTheCompleteOriginalTheme() {
        byte[] key = field(1, IDENTIFIER);
        byte[] original = response(key, 4, EMPTY, true);
        byte[] hydrated = LegacyThemeBridge.hydrate(original, true);

        assertNotSame(original, hydrated);
        assertArrayEquals(response(key, 4, DARK, true), hydrated);
    }

    @Test
    public void lightAppearanceDoesNotReceiveTheDarkPalette() {
        byte[] key = field(1, IDENTIFIER);
        assertArrayEquals(response(key, 4, LIGHT, true),
                LegacyThemeBridge.hydrate(response(key, 4, EMPTY, true), false));
    }

    @Test
    public void explicitlyPinnedAppearanceOverridesTheAppDefault() {
        byte[] lightKey = message(field(1, IDENTIFIER), scalar(2, 1));
        byte[] darkKey = message(field(1, IDENTIFIER), scalar(2, 2));

        assertArrayEquals(response(lightKey, 3, LIGHT, true),
                LegacyThemeBridge.hydrate(response(lightKey, 3, EMPTY, true), true));
        assertArrayEquals(response(darkKey, 3, DARK, true),
                LegacyThemeBridge.hydrate(response(darkKey, 3, EMPTY, true), false));
    }

    @Test
    public void explicitComponentThemesRemainUntouched() {
        byte[] original = response(field(1, IDENTIFIER), 4, LIGHT, true);
        assertSame(original, LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void subscriptionDestinationIsNotAClosedModelOrFieldWhitelist() {
        byte[] key = field(1, IDENTIFIER);
        for (int destination : new int[]{3, 4, 6, 17}) {
            assertArrayEquals(response(key, destination, DARK, true),
                    LegacyThemeBridge.hydrate(response(key, destination, EMPTY, true), true));
        }
    }

    @Test
    public void secondPassIsAnIdentityOperation() {
        byte[] first = LegacyThemeBridge.hydrate(response(field(1, IDENTIFIER), 4, EMPTY, true), true);
        assertSame(first, LegacyThemeBridge.hydrate(first, true));
    }

    @Test
    public void unknownIdentifiersDoNotBorrowAnotherResponsesTheme() {
        LegacyThemeBridge.hydrate(response(field(1, IDENTIFIER), 4, EMPTY, true), true);
        byte[] other = response(field(1, "theme|other".getBytes(StandardCharsets.UTF_8)), 4, EMPTY, true);
        assertSame(other, LegacyThemeBridge.hydrate(other, true));
    }

    @Test
    public void missingUpdatesDoNotUseAPreviouslySeenTheme() {
        LegacyThemeBridge.hydrate(response(field(1, IDENTIFIER), 4, EMPTY, true), true);
        byte[] next = response(field(1, IDENTIFIER), 4, EMPTY, false);
        assertSame(next, LegacyThemeBridge.hydrate(next, true));
    }

    @Test
    public void malformedAndNonUiMessagesRemainUnmodified() {
        byte[] malformed = {(byte) 0xff};
        byte[] nonUi = scalar(1, 123);
        assertSame(malformed, LegacyThemeBridge.hydrate(malformed, true));
        assertSame(nonUi, LegacyThemeBridge.hydrate(nonUi, true));
    }

    @Test
    public void unknownMappingEncodingsAreNotGuessed() {
        byte[] response = response(field(1, IDENTIFIER), 4, EMPTY, true, field(3, new byte[]{4}));
        assertSame(response, LegacyThemeBridge.hydrate(response, true));
    }

    @Test
    public void resolvedThemeSwitchesGeneratedChildrenToInlinePropagation() {
        byte[] key = field(1, IDENTIFIER);
        byte[] metadata = field(1007, scalar(1, 21));
        byte[] context = message(metadata, field(470784583, key), field(42, new byte[]{0, (byte) 0xff}));
        byte[] cleared = message(metadata, field(42, new byte[]{0, (byte) 0xff}));
        byte[] original = response(key, 4, EMPTY, true, EMPTY, field(13, context));
        byte[] expected = response(key, 4, DARK, true, EMPTY, field(13, cleared));

        assertArrayEquals(expected, LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void resolvedLightContextRetainsEveryLightThemeByte() {
        byte[] key = message(field(1, IDENTIFIER), scalar(2, 1));
        byte[] original = response(key, 4, EMPTY, true, EMPTY, field(13, field(470784583, key)));
        byte[] expected = response(key, 4, LIGHT, true, EMPTY, field(13, EMPTY));

        assertArrayEquals(expected, LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void explicitThemeIsPreservedWhenItsContextUsesTheInlineRoute() {
        byte[] key = field(1, IDENTIFIER);
        byte[] original = response(key, 4, LIGHT, true, EMPTY, field(13, field(470784583, key)));
        byte[] expected = response(key, 4, LIGHT, true, EMPTY, field(13, EMPTY));

        assertArrayEquals(expected, LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void unrelatedOrDifferentlyPinnedContextKeysAreNotErased() {
        byte[] key = field(1, IDENTIFIER);
        for (byte[] other : new byte[][]{
                field(1, "theme|other".getBytes(StandardCharsets.UTF_8)),
                message(key, scalar(2, 1)),
        }) {
            byte[] context = field(13, field(470784583, other));
            byte[] original = response(key, 4, EMPTY, true, EMPTY, context);
            byte[] expected = response(key, 4, DARK, true, EMPTY, context);
            assertArrayEquals(expected, LegacyThemeBridge.hydrate(original, true));
        }
    }

    @Test
    public void contextCutoverIsIdempotent() {
        byte[] key = field(1, IDENTIFIER);
        byte[] original = response(key, 4, EMPTY, true, EMPTY, field(13, field(470784583, key)));
        byte[] first = LegacyThemeBridge.hydrate(original, true);
        assertSame(first, LegacyThemeBridge.hydrate(first, true));
    }

    @Test
    public void capabilitiesExposeOnlyServerDeclaredNative620MultirowFeatures() {
        byte[] key = "capabilities|fixture".getBytes(StandardCharsets.UTF_8);
        byte[] source = message(capabilityGroup(404917441, 405782140, true),
                capabilityGroup(258876563, 17, true), capabilityGroup(625307769, 1002, true));
        byte[] expected = message(capabilityGroup(404917441, 405782140, true),
                capabilityGroup(258876563, 17, true));
        byte[] original = capabilityResponse(key, source, EMPTY, field(516665666, key));

        assertArrayEquals(capabilityResponse(key, source, expected, EMPTY),
                LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void unsupportedFeaturesWithinAKnownCapabilityGroupAreRemoved() {
        byte[] key = "capabilities|fixture".getBytes(StandardCharsets.UTF_8);
        byte[] flags = message(capabilityFlag(405782140, true), capabilityFlag(505142249, true));
        byte[] source = field(1, message(scalar(1, 404917441), field(2, flags)));
        byte[] expected = capabilityGroup(404917441, 405782140, true);

        assertArrayEquals(capabilityResponse(key, source, expected, EMPTY),
                LegacyThemeBridge.hydrate(capabilityResponse(key, source, EMPTY, EMPTY), true));
    }

    @Test
    public void capabilityProjectionDoesNotFabricateMissingOrDisabledSupport() {
        byte[] key = "capabilities|fixture".getBytes(StandardCharsets.UTF_8);
        byte[] source = message(capabilityGroup(404917441, 505142249, true),
                capabilityGroup(258876563, 17, false));
        byte[] expected = capabilityGroup(258876563, 17, false);

        assertArrayEquals(capabilityResponse(key, source, expected, EMPTY),
                LegacyThemeBridge.hydrate(capabilityResponse(key, source, EMPTY, field(516665666, key)), true));
    }

    @Test
    public void unknownCapabilityKeysRemainUnresolved() {
        byte[] key = "capabilities|other".getBytes(StandardCharsets.UTF_8);
        byte[] source = capabilityGroup(404917441, 405782140, true);
        byte[] original = capabilityResponse(key, source, EMPTY, field(516665666, key));
        assertSame(original, LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void explicitCapabilitiesArePreservedAndCutoverIsIdempotent() {
        byte[] key = "capabilities|fixture".getBytes(StandardCharsets.UTF_8);
        byte[] source = capabilityGroup(404917441, 405782140, true);
        byte[] explicit = capabilityGroup(258876563, 17, false);
        byte[] first = LegacyThemeBridge.hydrate(
                capabilityResponse(key, source, explicit, field(516665666, key)), true);
        assertArrayEquals(capabilityResponse(key, source, explicit, EMPTY), first);
        assertSame(first, LegacyThemeBridge.hydrate(first, true));
    }

    @Test
    public void playlistMetadataDefaultsOnlyUnspecifiedRunColorsToTheSecondaryRole() {
        byte[] text = metadataText(metadataRun(0), metadataRun(0xff000000L),
                metadataRun(0x20000000L), metadataRun(0x00ffffffL));
        byte[] expected = metadataText(metadataRun(secondaryToken(DARK)), metadataRun(0xff000000L),
                metadataRun(0x20000000L), metadataRun(0x00ffffffL));
        byte[] key = field(1, IDENTIFIER);
        byte[] original = metadataResponse(373186255, EMPTY, text, field(470784583, key));

        assertArrayEquals(metadataResponse(373186255, DARK, expected, EMPTY),
                LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void absentMetadataRunColorGetsTheSameRoleDefaultWithoutChangingItsFontOrRange() {
        byte[] run = message(scalar(1, 18), scalar(2, 13), fixed32(4, 0x41400000), scalar(77, 123));
        byte[] expected = message(run, scalar(5, secondaryToken(DARK)));
        byte[] original = metadataResponse(373186255, EMPTY, metadataText(run), EMPTY);

        assertArrayEquals(metadataResponse(373186255, DARK, metadataText(expected), EMPTY),
                LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void explicitLightHeaderThemeSelectsItsOwnSecondaryColor() {
        byte[] original = metadataResponse(373186255, LIGHT, metadataText(metadataRun(0)), EMPTY);
        byte[] expected = metadataText(metadataRun(secondaryToken(LIGHT)));
        assertArrayEquals(metadataResponse(373186255, LIGHT, expected, EMPTY),
                LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void metadataColorDefaultDoesNotApplyToOtherModelRoles() {
        byte[] text = metadataText(metadataRun(0));
        byte[] original = metadataResponse(123456789, EMPTY, text, EMPTY);
        assertArrayEquals(metadataResponse(123456789, DARK, text, EMPTY),
                LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void missingSecondaryRoleDoesNotInventAColor() {
        byte[] explicit = scalar(6, 2);
        byte[] original = metadataResponse(373186255, explicit, metadataText(metadataRun(0)), EMPTY);
        assertSame(original, LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void unsupportedMetadataColorEncodingsArePreserved() {
        byte[] run = message(scalar(1, 0), scalar(2, 18), field(5, new byte[]{1, 2, 3}));
        byte[] original = metadataResponse(373186255, EMPTY, metadataText(run), EMPTY);
        assertArrayEquals(metadataResponse(373186255, DARK, metadataText(run), EMPTY),
                LegacyThemeBridge.hydrate(original, true));
    }

    @Test
    public void metadataRoleDefaultIsIdempotent() {
        byte[] first = LegacyThemeBridge.hydrate(
                metadataResponse(373186255, EMPTY, metadataText(metadataRun(0)), EMPTY), true);
        assertSame(first, LegacyThemeBridge.hydrate(first, true));
    }

    private static byte[] metadataResponse(int model, byte[] theme, byte[] text, byte[] context) {
        byte[] key = field(1, IDENTIFIER);
        byte[] subscription = message(field(1, message(field(1, key), scalar(2, 3))), scalar(2, model));
        byte[] data = message(field(2, context), field(3, theme),
                field(14, message(field(30, text), field(77, new byte[]{0, (byte) 0xff}))));
        byte[] component = message(field(5, field(model, data)), field(6, field(386334485, subscription)));
        return message(field(9, field(1, field(168777401, component))),
                field(777, field(2, field(1, field(421320458, UPDATE)))));
    }

    private static byte[] metadataText(byte[]... runs) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        byte[] content = field(1, "1B views • 13 hr • 3mo ago".getBytes(StandardCharsets.UTF_8));
        stream.write(content, 0, content.length);
        for (byte[] run : runs) {
            byte[] field = field(6, run);
            stream.write(field, 0, field.length);
        }
        return stream.toByteArray();
    }

    private static byte[] metadataRun(long color) {
        return message(scalar(1, 0), scalar(2, 18), fixed32(4, 0x41400000),
                scalar(5, color), scalar(77, 123));
    }

    private static byte[] fixed32(int field, int value) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        write(stream, ((long) field << 3) | 5);
        for (int shift = 0; shift < 32; shift += 8) stream.write((value >>> shift) & 0xff);
        return stream.toByteArray();
    }

    private static long secondaryToken(byte[] theme) {
        byte[] tokens = fieldValue(theme, 7);
        int[] offset = {0};
        while (offset[0] < tokens.length) {
            long tag = read(tokens, offset);
            int size = (int) read(tokens, offset);
            byte[] entry = copy(tokens, offset[0], size);
            offset[0] += size;
            if ((tag >>> 3) == 108 && scalarValue(entry, 1) == 72) {
                return scalarValue(entry, 2) & 0xffffffffL;
            }
        }
        throw new IllegalArgumentException("Missing secondary colour token");
    }

    private static byte[] capabilityResponse(byte[] key, byte[] source, byte[] inline, byte[] context) {
        byte[] identifier = "capabilities|fixture".getBytes(StandardCharsets.UTF_8);
        byte[] update = message(field(1, identifier), field(2, source), scalar(3, 123));
        byte[] mapping = message(field(1, key), scalar(2, 9));
        byte[] subscription = message(field(1, mapping), scalar(2, 123456789));
        byte[] data = message(scalar(7, 4), field(9, inline), field(13, context));
        byte[] component = message(field(5, field(123456789, data)), field(6, field(386334486, subscription)));
        return message(field(9, field(1, field(168777401, component))),
                field(777, field(2, field(1, field(423179876, update)))));
    }

    private static byte[] capabilityGroup(int type, int feature, boolean supported) {
        return field(1, message(scalar(1, type), field(2, capabilityFlag(feature, supported))));
    }

    private static byte[] capabilityFlag(int feature, boolean supported) {
        return field(1, message(scalar(1, feature), scalar(2, supported ? 1 : 0)));
    }

    private static byte[] response(byte[] key, int destination, byte[] theme, boolean updates) {
        return response(key, destination, theme, updates, EMPTY);
    }

    private static byte[] response(byte[] key, int destination, byte[] theme, boolean updates, byte[] extra) {
        return response(key, destination, theme, updates, extra, EMPTY);
    }

    private static byte[] response(byte[] key, int destination, byte[] theme, boolean updates,
                                   byte[] extra, byte[] modelExtra) {
        byte[] mapping = message(field(1, key), scalar(2, destination), extra);
        byte[] subscription = message(field(1, mapping), scalar(2, 123456789));
        byte[] data = message(field(99, new byte[]{0, (byte) 0xff, 2, 1}), field(destination, theme), modelExtra);
        byte[] component = message(field(3, field(172035250, field(1, "fixture.eml".getBytes()))),
                field(5, field(123456789, data)), field(6, field(386334485, subscription)));
        byte[] contents = field(9, field(21, field(1, field(168777401, component))));
        byte[] framework = updates ? field(777, field(2, field(1, field(421320458, UPDATE)))) : EMPTY;
        return message(contents, framework, field(42, new byte[]{3, 0, 0, (byte) 0xff}));
    }

    private static byte[] field(int number, byte[] value) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        write(stream, ((long) number << 3) | 2);
        write(stream, value.length);
        stream.write(value, 0, value.length);
        return stream.toByteArray();
    }

    private static byte[] scalar(int number, long value) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        write(stream, (long) number << 3);
        write(stream, value);
        return stream.toByteArray();
    }

    private static byte[] message(byte[]... fields) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        for (byte[] field : fields) stream.write(field, 0, field.length);
        return stream.toByteArray();
    }

    private static void write(ByteArrayOutputStream stream, long value) {
        while ((value & ~0x7fL) != 0) {
            stream.write((int) ((value & 0x7f) | 0x80));
            value >>>= 7;
        }
        stream.write((int) value);
    }

    private static long read(byte[] bytes, int[] offset) {
        long value = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            int next = bytes[offset[0]++] & 0xff;
            value |= (long) (next & 0x7f) << shift;
            if ((next & 0x80) == 0) return value;
        }
        throw new IllegalArgumentException();
    }

    private static byte[] copy(byte[] bytes, int start, int size) {
        byte[] result = new byte[size];
        System.arraycopy(bytes, start, result, 0, size);
        return result;
    }

    private static byte[] fieldValue(byte[] message, int number) {
        int[] offset = {0};
        while (offset[0] < message.length) {
            long tag = read(message, offset);
            if ((tag & 7) == 0) {
                read(message, offset);
            } else if ((tag & 7) == 2) {
                int size = (int) read(message, offset);
                int start = offset[0];
                offset[0] += size;
                if ((tag >>> 3) == number) return copy(message, start, size);
            } else {
                throw new IllegalArgumentException();
            }
        }
        throw new IllegalArgumentException("Missing field " + number);
    }

    private static int scalarValue(byte[] message, int number) {
        int[] offset = {0};
        while (offset[0] < message.length) {
            long tag = read(message, offset);
            if ((tag & 7) == 0) {
                int value = (int) read(message, offset);
                if ((tag >>> 3) == number) return value;
            } else if ((tag & 7) == 2) {
                int size = (int) read(message, offset);
                offset[0] += size;
            } else {
                throw new IllegalArgumentException();
            }
        }
        return 0;
    }
}
