/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.content.ContextWrapper;
import android.content.SharedPreferences;

import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.MessageLite;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import java.util.function.Supplier;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.shared.utils.Utils;

import static org.junit.Assert.*;

public class SmartShuffleKeepTest {
    private interface Fields {
        void write(CodedOutputStream output) throws IOException;
    }

    private static byte[] message(Fields fields) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        fields.write(output);
        output.flush();
        return bytes.toByteArray();
    }

    private static byte[] wrap(int field, byte[] bytes) throws IOException {
        return message(output -> output.writeByteArray(field, bytes));
    }


    private static byte[] action(String videoId, int action) throws IOException {
        return message(output -> {
            output.writeString(2, videoId);
            output.writeInt32(6, action);
        });
    }

    private static byte[] request(String playlistId, String videoId, int action) throws IOException {
        return message(output -> {
            output.writeByteArray(2, action(videoId, action));
            output.writeString(3, playlistId);
        });
    }

    private static byte[] response(int status, String videoId, String setVideoId) throws IOException {
        byte[] added = message(output -> {
            output.writeString(1, videoId);
            output.writeString(2, setVideoId);
        });
        return message(output -> {
            output.writeInt32(2, status);
            output.writeByteArray(12, wrap(138418859, added));
        });
    }

    private static byte[] noOpResponse() throws IOException {
        return message(output -> {
            output.writeByteArray(1, new byte[0]);
            output.writeInt32(2, 1);
            output.writeByteArray(7, wrap(123456, new byte[0]));
            output.writeByteArray(17, new byte[]{19, 0});
            output.writeByteArray(777, new byte[0]);
        });
    }

    private static Field field(Class<?> owner, String name) throws Exception {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private static Object selection(long occurrenceId, Consumer<Boolean> confirmed) throws Exception {
        Class<?> type = field(SmartShuffleKeep.class, "pending").getType();
        Constructor<?> constructor = type.getDeclaredConstructor(String.class, long.class, Consumer.class);
        constructor.setAccessible(true);
        return constructor.newInstance("suggestion", occurrenceId, confirmed);
    }

    private static MessageLite nativeMessage(Supplier<byte[]> bytes) {
        return (MessageLite) Proxy.newProxyInstance(SmartShuffleKeepTest.class.getClassLoader(),
                new Class<?>[]{MessageLite.class}, (proxy, method, arguments) -> {
                    if (method.getName().equals("toByteArray")) return bytes.get();
                    throw new AssertionError("Keep must not invoke native " + method.getName());
                });
    }

    /** Real in-memory preferences, so initializing shared Settings here does not poison later tests. */
    private static SharedPreferences preferences() {
        Map<String, Object> values = new HashMap<>();
        Map<String, Object> changes = new HashMap<>();
        SharedPreferences.Editor editor = (SharedPreferences.Editor) Proxy.newProxyInstance(
                SmartShuffleKeepTest.class.getClassLoader(), new Class<?>[]{SharedPreferences.Editor.class},
                (proxy, method, arguments) -> {
                    switch (method.getName()) {
                        case "commit":
                        case "apply":
                            changes.forEach((key, value) -> {
                                if (value == null) values.remove(key);
                                else values.put(key, value);
                            });
                            changes.clear();
                            return method.getName().equals("commit") ? Boolean.TRUE : null;
                        case "remove":
                            changes.put((String) arguments[0], null);
                            return proxy;
                        case "putBoolean":
                        case "putString":
                        case "putInt":
                        case "putLong":
                        case "putFloat":
                            changes.put((String) arguments[0], arguments[1]);
                            return proxy;
                        default:
                            throw new UnsupportedOperationException(method.getName());
                    }
                });
        return (SharedPreferences) Proxy.newProxyInstance(SmartShuffleKeepTest.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (proxy, method, arguments) -> switch (method.getName()) {
                    case "contains" -> values.containsKey(arguments[0]);
                    case "getAll" -> Map.copyOf(values);
                    case "getBoolean", "getString", "getInt", "getLong", "getFloat" ->
                            values.getOrDefault(arguments[0], arguments[1]);
                    case "edit" -> editor;
                    default -> throw new UnsupportedOperationException(method.getName());
                });
    }

    private static final class RuntimeState implements AutoCloseable {
        final Field pendingField = field(SmartShuffleKeep.class, "pending");
        final Field contextField = field(Utils.class, "context");
        final Field settingValue = field(Setting.class, "value");
        final Object previousPending = pendingField.get(null);
        final Object previousContext = contextField.get(null);
        final Object previousDebug;
        final List<Boolean> confirmations = new ArrayList<>();
        final Object selection;
        final long occurrenceId;

        RuntimeState(long occurrenceId, boolean debug) throws Exception {
            this.occurrenceId = occurrenceId;
            SharedPreferences storage = preferences();
            contextField.set(null, new ContextWrapper(null) {
                @Override
                public SharedPreferences getSharedPreferences(String name, int mode) {
                    return storage;
                }
            });
            previousDebug = settingValue.get(BaseSettings.DEBUG);
            settingValue.set(BaseSettings.DEBUG, debug);
            selection = selection(occurrenceId, confirmations::add);
            field(selection.getClass(), "dispatched").setBoolean(selection, true);
            pendingField.set(null, selection);
        }

        Object ownedRequest() throws Exception {
            return field(selection.getClass(), "request").get(selection);
        }

        void replace(Object replacement) {
            try {
                pendingField.set(null, replacement);
            } catch (IllegalAccessException exception) {
                throw new AssertionError(exception);
            }
        }


        String logs() {
            try {
                var lines = (java.util.Collection<?>) field(LogBufferManager.class, "logBuffer").get(null);
                return String.join("\n", lines.stream().map(String.class::cast)
                        .filter(line -> line.contains("occurrence=" + occurrenceId + " ")).toList());
            } catch (Exception exception) {
                throw new AssertionError(exception);
            }
        }

        @Override
        public void close() throws Exception {
            pendingField.set(null, previousPending);
            settingValue.set(BaseSettings.DEBUG, previousDebug);
            contextField.set(null, previousContext);
        }
    }

    @Test
    public void pickerCommandMatchesNativeClientAndR3FieldOneConstruction() throws Exception {
        byte[] expected = wrap(69487224, message(endpoint -> endpoint.writeString(1, "aaaaaaaaaaa")));
        assertEquals(19, expected.length);
        assertArrayEquals(expected, SmartShuffleKeep.pickerCommand("aaaaaaaaaaa"));
    }

    @Test
    public void editIdentityRequiresExactlyOneAddAndDestination() throws Exception {
        assertEquals(new SmartShuffleKeep.Edit("chosen-playlist", "suggestion"),
                SmartShuffleKeep.readEdit(request("chosen-playlist", "suggestion", 1)));
        assertNull(SmartShuffleKeep.readEdit(request("chosen-playlist", "suggestion", 2)));
        assertNull(SmartShuffleKeep.readEdit(request("", "suggestion", 1)));
        assertNull(SmartShuffleKeep.readEdit(request("chosen-playlist", "", 1)));
        for (int secondAction : new int[]{1, 2}) {
            byte[] twoActions = message(output -> {
                output.writeString(3, "chosen-playlist");
                output.writeByteArray(2, action("suggestion", 1));
                output.writeByteArray(2, action("neighbor", secondAction));
            });
            assertNull(SmartShuffleKeep.readEdit(twoActions));
        }
        byte[] destinations = message(output -> {
            output.writeString(3, "first");
            output.writeString(3, "second");
            output.writeByteArray(2, action("suggestion", 1));
        });
        assertNull(SmartShuffleKeep.readEdit(destinations));
    }

    @Test
    public void confirmationRequiresSuccessMatchingVideoNewEntryAndCorrectDestination() throws Exception {
        byte[] success = response(1, "suggestion", "new-entry");
        assertTrue(SmartShuffleKeep.confirmedEdit(success, "suggestion", "chosen-playlist"));
        byte[] withDestination = message(output -> {
            output.writeRawBytes(success);
            output.writeString(20, "chosen-playlist");
        });
        assertTrue(SmartShuffleKeep.confirmedEdit(withDestination, "suggestion", "chosen-playlist"));
        assertFalse(SmartShuffleKeep.confirmedEdit(withDestination, "suggestion", "wrong-playlist"));
        for (byte[] invalid : new byte[][]{
                response(0, "suggestion", "new-entry"),
                response(2, "suggestion", "new-entry"),
                response(1, "neighbor", "new-entry"),
                response(1, "suggestion", ""),
                noOpResponse(),
                message(output -> output.writeInt32(2, 1))
        }) {
            assertFalse(SmartShuffleKeep.confirmedEdit(invalid, "suggestion", "chosen-playlist"));
        }
        byte[] duplicateStatus = message(output -> {
            output.writeRawBytes(success);
            output.writeInt32(2, 1);
        });
        assertFalse(SmartShuffleKeep.confirmedEdit(duplicateStatus, "suggestion", "chosen-playlist"));
        byte[] duplicateResults = message(output -> {
            output.writeRawBytes(success);
            output.writeByteArray(12, new byte[0]);
        });
        assertFalse(SmartShuffleKeep.confirmedEdit(duplicateResults, "suggestion", "chosen-playlist"));
        assertThrows(IOException.class,
                () -> SmartShuffleKeep.confirmedEdit(new byte[]{98, 10, 1}, "suggestion", "chosen-playlist"));
    }

    @Test
    public void completedMatchingNativeRequestConfirmsExactlyOnceWithDebugOff() throws Exception {
        try (RuntimeState state = new RuntimeState(92001, false)) {
            byte[] request = request("chosen-playlist", "suggestion", 1);
            SmartShuffleKeep.Request owned = () -> request;
            SmartShuffleKeep.onEditStarted(owned);
            assertSame(owned, state.ownedRequest());
            byte[] response = response(1, "suggestion", "new-entry");
            AtomicInteger encodings = new AtomicInteger();
            MessageLite result = nativeMessage(() -> {
                encodings.incrementAndGet();
                return response;
            });
            SmartShuffleKeep.onEditCompleted(owned, result);
            SmartShuffleKeep.onEditCompleted(owned, result);
            assertEquals(1, encodings.get());
            assertNull(state.pendingField.get(null));
            assertEquals(List.of(true), state.confirmations);
        }
    }

    @Test
    public void missingPrehookCannotBindEvenMatchingSuccessfulCallbackRequest() throws Exception {
        try (RuntimeState state = new RuntimeState(92002, true)) {
            byte[] request = request("chosen-playlist", "suggestion", 1);
            SmartShuffleKeep.Request unowned = () -> request;
            byte[] success = response(1, "suggestion", "new-entry");
            SmartShuffleKeep.onEditCompleted(unowned, nativeMessage(() -> success));
            assertNull(state.ownedRequest());
            assertTrue(state.confirmations.isEmpty());
            assertSame(state.selection, state.pendingField.get(null));
            assertTrue(state.logs().contains("rejected=request-not-owned"));
        }
    }

    @Test
    public void unrelatedIdentityCannotEvenSerializeResponseForOwnedRequest() throws Exception {
        try (RuntimeState state = new RuntimeState(92003, true)) {
            byte[] bytes = request("chosen-playlist", "suggestion", 1);
            SmartShuffleKeep.Request owned = () -> bytes;
            SmartShuffleKeep.onEditStarted(owned);
            SmartShuffleKeep.onEditCompleted(owned, new Object());
            SmartShuffleKeep.Request unrelated = () -> {
                throw new AssertionError("Unrelated request must not be inspected");
            };
            SmartShuffleKeep.onEditCompleted(unrelated, nativeMessage(() -> {
                throw new AssertionError("Unrelated response must not be serialized");
            }));
            assertSame(owned, state.ownedRequest());
            assertSame(state.selection, state.pendingField.get(null));
            assertTrue(state.confirmations.isEmpty());
            assertTrue(state.logs().contains("rejected=request-identity-mismatch"));
            assertTrue(state.logs().contains("rejected=response-not-protobuf"));
        }
    }

    @Test
    public void invalidRequestsAndWrongVideoNeverAcquireOwnershipOrConfirm() throws Exception {
        try (RuntimeState state = new RuntimeState(92004, true)) {
            byte[] wrong = request("chosen-playlist", "neighbor", 1);
            byte[] remove = request("chosen-playlist", "suggestion", 2);
            byte[] missing = request("", "suggestion", 1);
            byte[] success = response(1, "suggestion", "new-entry");
            for (Object request : new Object[]{new Object(), (SmartShuffleKeep.Request) () -> null,
                    (SmartShuffleKeep.Request) () -> wrong, (SmartShuffleKeep.Request) () -> remove,
                    (SmartShuffleKeep.Request) () -> missing,
                    (SmartShuffleKeep.Request) () -> new byte[]{18, 10, 1}}) {
                SmartShuffleKeep.onEditStarted(request);
                SmartShuffleKeep.onEditCompleted(request, nativeMessage(() -> success));
                assertNull(state.ownedRequest());
                assertSame(state.selection, state.pendingField.get(null));
                assertTrue(state.confirmations.isEmpty());
            }
            assertTrue(state.logs().contains("rejected=request-video-mismatch"));
        }
    }

    @Test
    public void ownedDestinationAndVideoAreRevalidatedOnCompletion() throws Exception {
        byte[] original = request("chosen-playlist", "suggestion", 1);
        for (byte[] changed : new byte[][]{request("neighbor-playlist", "suggestion", 1),
                request("chosen-playlist", "neighbor", 1)}) {
            try (RuntimeState state = new RuntimeState(92005, false)) {
                AtomicInteger calls = new AtomicInteger();
                SmartShuffleKeep.Request owned = () -> calls.getAndIncrement() == 0 ? original : changed;
                SmartShuffleKeep.onEditStarted(owned);
                byte[] success = response(1, "suggestion", "new-entry");
                SmartShuffleKeep.onEditCompleted(owned, nativeMessage(() -> success));
                assertSame(state.selection, state.pendingField.get(null));
                assertTrue(state.confirmations.isEmpty());
            }
        }
    }

    @Test
    public void failedDuplicateNoOpAndMalformedResponsesKeepMarker() throws Exception {
        byte[] success = response(1, "suggestion", "new-entry");
        byte[] wrongDestination = message(output -> {
            output.writeRawBytes(success);
            output.writeString(20, "neighbor-playlist");
        });
        for (byte[] response : new byte[][]{response(0, "suggestion", "new-entry"),
                response(1, "neighbor", "new-entry"), response(1, "suggestion", ""), noOpResponse(),
                wrongDestination, new byte[]{98, 10, 1}}) {
            try (RuntimeState state = new RuntimeState(92006, false)) {
                byte[] bytes = request("chosen-playlist", "suggestion", 1);
                SmartShuffleKeep.Request owned = () -> bytes;
                SmartShuffleKeep.onEditStarted(owned);
                SmartShuffleKeep.onEditCompleted(owned, nativeMessage(() -> response));
                assertSame(state.selection, state.pendingField.get(null));
                assertTrue(state.confirmations.isEmpty());
                SmartShuffleKeep.cancelPending();
                assertEquals(List.of(false), state.confirmations);
            }
        }
    }

    @Test
    public void undispatchedAndAbsentPendingKeepDoNotInspectNativeObjects() throws Exception {
        try (RuntimeState state = new RuntimeState(92007, true)) {
            SmartShuffleKeep.Request request = () -> {
                throw new AssertionError("Inactive Keep must not inspect requests");
            };
            MessageLite response = nativeMessage(() -> {
                throw new AssertionError("Inactive Keep must not serialize responses");
            });
            field(state.selection.getClass(), "dispatched").setBoolean(state.selection, false);
            SmartShuffleKeep.onEditStarted(request);
            SmartShuffleKeep.onEditCompleted(request, response);
            assertNull(state.ownedRequest());
            state.replace(null);
            SmartShuffleKeep.onEditStarted(request);
            SmartShuffleKeep.onEditCompleted(request, response);
            assertTrue(state.confirmations.isEmpty());
        }
    }

    @Test
    public void replacementDuringRequestOrResponseParsingCannotConfirmNewOwner() throws Exception {
        try (RuntimeState state = new RuntimeState(92008, true)) {
            Object replacement = selection(92009, state.confirmations::add);
            byte[] bytes = request("chosen-playlist", "suggestion", 1);
            SmartShuffleKeep.Request stale = () -> {
                state.replace(replacement);
                return bytes;
            };
            SmartShuffleKeep.onEditStarted(stale);
            assertNull(state.ownedRequest());
            assertSame(replacement, state.pendingField.get(null));

            state.replace(state.selection);
            SmartShuffleKeep.Request owned = () -> bytes;
            SmartShuffleKeep.onEditStarted(owned);
            byte[] success = response(1, "suggestion", "new-entry");
            SmartShuffleKeep.onEditCompleted(owned, nativeMessage(() -> {
                state.replace(replacement);
                return success;
            }));
            assertSame(replacement, state.pendingField.get(null));
            assertTrue(state.confirmations.isEmpty());
        }
    }

    @Test
    public void staleSameVideoRequestCannotAdoptReplacementKeep() throws Exception {
        try (RuntimeState state = new RuntimeState(92013, true)) {
            byte[] bytes = request("chosen-playlist", "suggestion", 1);
            SmartShuffleKeep.Request previous = () -> bytes;
            SmartShuffleKeep.onEditStarted(previous);

            List<Boolean> replacementResults = new ArrayList<>();
            Object replacement = selection(92014, replacementResults::add);
            field(replacement.getClass(), "dispatched").setBoolean(replacement, true);
            state.replace(replacement);
            byte[] success = response(1, "suggestion", "new-entry");
            MessageLite result = nativeMessage(() -> success);
            SmartShuffleKeep.onEditCompleted(previous, result);
            assertNull(field(replacement.getClass(), "request").get(replacement));
            assertSame(replacement, state.pendingField.get(null));
            assertTrue(replacementResults.isEmpty());

            SmartShuffleKeep.Request current = () -> bytes;
            SmartShuffleKeep.onEditStarted(current);
            SmartShuffleKeep.onEditCompleted(previous, result);
            assertSame(replacement, state.pendingField.get(null));
            assertTrue(replacementResults.isEmpty());
            SmartShuffleKeep.onEditCompleted(current, result);
            assertNull(state.pendingField.get(null));
            assertEquals(List.of(true), replacementResults);
            assertTrue(state.confirmations.isEmpty());
        }
    }

    @Test
    public void cancellationClosesOnlyTheCurrentPendingWindowOnce() throws Exception {
        try (RuntimeState state = new RuntimeState(92010, true)) {
            byte[] bytes = request("chosen-playlist", "suggestion", 1);
            SmartShuffleKeep.Request old = () -> bytes;
            SmartShuffleKeep.onEditStarted(old);
            SmartShuffleKeep.cancelPending();
            SmartShuffleKeep.cancelPending();
            SmartShuffleKeep.onEditCompleted(old, nativeMessage(() -> {
                throw new AssertionError("Cancelled window must not inspect a response");
            }));
            assertNull(state.pendingField.get(null));
            assertEquals(List.of(false), state.confirmations);
        }
    }

    @Test
    public void pendingLogsContainOnlyLifecycleAndRejectionNotNativePayloads() throws Exception {
        try (RuntimeState state = new RuntimeState(92012, true)) {
            byte[] bytes = request("synthetic-private-destination", "suggestion", 1);
            SmartShuffleKeep.Request owned = () -> bytes;
            SmartShuffleKeep.onEditStarted(owned);
            SmartShuffleKeep.onEditStarted(owned);
            byte[] noOp = noOpResponse();
            SmartShuffleKeep.onEditCompleted(owned, nativeMessage(() -> noOp));
            String logs = state.logs();
            assertTrue(logs.contains("edit-started"));
            assertTrue(logs.contains("rejected=request-already-owned"));
            assertTrue(logs.contains("rejected=response-not-confirmed-add"));
            assertFalse(logs.contains("synthetic-private-destination"));
            assertFalse(logs.contains("base64"));
            assertFalse(logs.contains(" data="));
        }
    }

    @Test
    public void nativeCallbackWithoutAddedResultKeepsMarkerAndDumpsOncePerPending() throws Exception {
        try (RuntimeState state = new RuntimeState(92014, true)) {
            byte[] bytes = request("synthetic-private-destination", "suggestion", 1);
            SmartShuffleKeep.Request owned = () -> bytes;
            SmartShuffleKeep.onEditStarted(owned);
            byte[] noOp = noOpResponse();
            long previousHeaders = state.logs().lines()
                    .filter(line -> line.contains("role=request native-class=")).count();
            SmartShuffleKeep.onEditCompleted(owned, nativeMessage(() -> noOp));
            assertTrue(field(state.selection.getClass(), "confirmationDumped").getBoolean(state.selection));
            SmartShuffleKeep.onEditCompleted(owned, nativeMessage(() -> noOp));

            String logs = state.logs();
            assertEquals(logs, previousHeaders + 1,
                    logs.lines().filter(line -> line.contains("role=request native-class=")).count());
            assertTrue(logs.contains("kind=request"));
            assertTrue(logs.contains("kind=response"));
            assertTrue(logs.contains("field=777 wire=2"));
            assertFalse(logs.contains("synthetic-private-destination"));
            assertFalse(logs.contains(" data="));
            assertTrue(state.confirmations.isEmpty());
            assertSame(state.selection, state.pendingField.get(null));
        }
    }

    @Test
    public void confirmationShapeRedactsValuesAndNeverReserializesOrTraversesOpaqueContext() throws Exception {
        byte[] opaque = message(value -> value.writeString(1, "synthetic-private-token"));
        for (int index = 0; index < 40; index++) opaque = wrap(1, opaque);
        final byte[] context = opaque;
        byte[] input = message(root -> {
            root.writeByteArray(1, context);
            root.writeByteArray(2, action("suggestion", 1));
            root.writeString(3, "synthetic-private-destination");
        });
        byte[] output = response(1, "suggestion", "synthetic-private-entry");
        Object neverFormat = new Object() {
            @Override public String toString() { throw new AssertionError("No native formatting"); }
        };
        MessageLite neverSerialize = nativeMessage(() -> {
            throw new AssertionError("Reuse parsed response bytes");
        });
        try (RuntimeState state = new RuntimeState(92015, true)) {
            SmartShuffleKeepDiagnostics.dump(92015, "suggestion", "synthetic-private-destination", "test",
                    neverFormat, neverSerialize, input, output);
            String logs = state.logs();
            assertTrue(logs.contains("video-match=true"));
            assertTrue(logs.contains("destination-match=true"));
            assertTrue(logs.contains("has-entry=true"));
            assertTrue(logs.contains("field=138418859 wire=2"));
            assertFalse(logs.contains("synthetic-private"));
            assertFalse(logs.contains("TRUNCATED"));
            assertFalse(logs.contains("request/1[0]/"));
        }
    }

    @Test
    public void confirmationShapeIsDisabledWithoutDebugOrContext() throws Exception {
        byte[] input = request("chosen-playlist", "suggestion", 1);
        try (RuntimeState state = new RuntimeState(92016, false)) {
            SmartShuffleKeepDiagnostics.dump(92016, "suggestion", null, "test", null, null, input, null);
            assertFalse(state.logs().contains("Keep confirmation"));
        }
        try (RuntimeState state = new RuntimeState(92017, true)) {
            state.contextField.set(null, null);
            SmartShuffleKeepDiagnostics.dump(92017, "suggestion", null, "test", null, null, input, null);
            assertFalse(state.logs().contains("Keep confirmation"));
        }
    }

    @Test
    public void confirmationShapeDisclosesBoundsAndMalformedOrUnavailableEncoding() throws Exception {
        try (RuntimeState state = new RuntimeState(92018, true)) {
            SmartShuffleKeepDiagnostics.dump(92018, "suggestion", null, "test", null, null,
                    new byte[SmartShuffleKeepDiagnostics.MAX_BYTES + 1], null);
            assertTrue(state.logs().contains("TRUNCATED reason=bytes"));
        }
        byte[] wide = message(root -> {
            for (int index = 0; index < 1000; index++) root.writeByteArray(2, new byte[0]);
        });
        try (RuntimeState state = new RuntimeState(92019, true)) {
            SmartShuffleKeepDiagnostics.dump(92019, "suggestion", null, "test", null, null, wide, null);
            assertTrue(state.logs().contains("TRUNCATED"));
            assertTrue(state.logs().lines().count() <= SmartShuffleKeepDiagnostics.MAX_LINES);
        }
        try (RuntimeState state = new RuntimeState(92020, true)) {
            SmartShuffleKeepDiagnostics.dump(92020, "suggestion", null, "test", null, null,
                    new byte[]{18, 10, 1}, null);
            assertTrue(state.logs().contains("status=malformed"));
            assertTrue(state.logs().contains("status=encoding-unavailable"));
        }
    }
}
