package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.zip.ZipFile;
import software.santodan.extension.nuviointro.*;

public final class VerifyNuvioIntroDb {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try { action.run(); } catch (IllegalArgumentException | IllegalStateException expected) { return; }
        throw new AssertionError("Invalid input accepted");
    }
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (ClassDef c : DexBackedDexFile.fromInputStream(null, input).getClasses()) check(classes.put(c.getType(), c) == null);
                }
        }
        ClassDef originalMain = classes.get("Lab/cj;"), originalMore = classes.get("Lab/ij;"), originalActivity = classes.get("Lcom/nuvio/tv/MainActivity;");
        MutableClass main = new MutableClass(originalMain), activity = new MutableClass(originalActivity);
        NuvioIntroDbPatch.validateState(new MutableClass(classes.get("Lab/nm;")));
        MutableClass timers = new MutableClass(classes.get("Lab/zf;"));
        var nativeTimer = NuvioIntroDbPatch.require(timers, "Lab/zf;->F(Lab/mc;)V");
        NuvioIntroDbPatch.validateTimer(nativeTimer);
        check(NuvioPlaybackButtonsPatch.fingerprint(NuvioIntroDbPatch.require(timers, NuvioIntroDbPatch.CANCEL_PAUSE))
            .equals(NuvioIntroDbPatch.CANCEL_PAUSE_HASH));
        MutableClass missingTimer = new MutableClass(timers);
        missingTimer.getMethods().removeIf(m -> m.getName().equals("F"));
        rejected(() -> NuvioIntroDbPatch.hookTimer(missingTimer));
        MutableClass changedTimer = new MutableClass(timers);
        NuvioIntroDbPatch.require(changedTimer, nativeTimer.toString()).getImplementation()
            .replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioIntroDbPatch.hookTimer(changedTimer));
        MutableClass missingPauseTimer = new MutableClass(timers);
        missingPauseTimer.getMethods().removeIf(m -> m.getName().equals("H"));
        rejected(() -> NuvioIntroDbPatch.hookTimer(missingPauseTimer));
        MutableClass changedPauseTimer = new MutableClass(timers);
        NuvioIntroDbPatch.require(changedPauseTimer, NuvioIntroDbPatch.PAUSE_TIMER).getImplementation()
            .replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioIntroDbPatch.hookTimer(changedPauseTimer));
        NuvioIntroDbPatch.hookTimer(timers);
        rejected(() -> NuvioIntroDbPatch.hookTimer(timers));
        check(java.util.stream.StreamSupport.stream(classes.get("Lkotlinx/coroutines/Job$DefaultImpls;").getMethods().spliterator(), false)
            .filter(m -> m.getName().equals("cancel$default") && m.getParameterTypes().size() == 4).count() == 2);
        for (String signature : NuvioIntroDbPatch.UI) {
            MutableClass owner = new MutableClass(classes.get(signature.substring(0, signature.indexOf("->"))));
            MutableMethod method = NuvioIntroDbPatch.require(owner, signature);
            if (!method.getName().equals("<init>") && !method.getName().equals("cancel$default"))
                check(owner.getMethods().stream().filter(m -> m.getName().equals(method.getName()) && m.getParameterTypes().size() == method.getParameterTypes().size()).count() == 1);
        }
        NuvioIntroDbPatch.validate(main, activity);
        MutableClass missing = new MutableClass(originalMain);
        missing.getMethods().removeIf(m -> m.getName().equals("invoke"));
        rejected(() -> NuvioIntroDbPatch.hook(missing, new MutableClass(originalActivity)));
        MutableClass changed = new MutableClass(originalMain);
        NuvioPlaybackButtonsPatch.invoke(changed, 2).getImplementation().replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioIntroDbPatch.hook(changed, new MutableClass(originalActivity)));
        MutableClass ambiguous = new MutableClass(originalMain);
        Method nativeInvoke = NuvioPlaybackButtonsPatch.invoke(ambiguous, 2);
        ambiguous.getMethods().add(new MutableMethod(new ImmutableMethod(ambiguous.getType(), "invoke",
            List.of(new ImmutableMethodParameter("Ljava/lang/String;", Set.of(), null), nativeInvoke.getParameters().get(1)),
            nativeInvoke.getReturnType(), nativeInvoke.getAccessFlags(), nativeInvoke.getAnnotations(), nativeInvoke.getHiddenApiRestrictions(), nativeInvoke.getImplementation())));
        rejected(() -> NuvioIntroDbPatch.hook(ambiguous, new MutableClass(originalActivity)));
        MutableClass badState = new MutableClass(classes.get("Lab/nm;"));
        badState.getFields().removeIf(f -> f.getName().equals("A0"));
        rejected(() -> NuvioIntroDbPatch.validateState(badState));
        NuvioIntroDbPatch.hook(main, activity);
        rejected(() -> NuvioIntroDbPatch.hook(main, activity));
        // Both patch orders collect IntroDB immediately before the native row is flushed.
        for (boolean first : List.of(false, true)) {
            MutableClass combined = new MutableClass(originalMain), more = new MutableClass(originalMore), a = new MutableClass(originalActivity);
            if (first) NuvioIntroDbPatch.hook(combined, a);
            NuvioPlaybackButtonsPatch.hook(combined, more);
            if (!first) NuvioIntroDbPatch.hook(combined, a);
            check(NuvioPlaybackButtonsPatch.fingerprint(NuvioIntroDbPatch.originalMain(NuvioPlaybackButtonsPatch.invoke(combined, 2))).equals("f85add171d7abfd57224e7f09c2846646f4da568717bd400d53e04de9b1800f3"));
            var instructions = NuvioAiringSeriesPatch.instructions(NuvioPlaybackButtonsPatch.invoke(combined, 2));
            int introAt = -1, finishAt = -1;
            for (int i = 0; i < instructions.size(); i++) {
                String ref = NuvioPlaybackButtonsPatch.reference(instructions.get(i));
                if (ref.equals(NuvioIntroDbPatch.RENDER)) { check(introAt == -1); introAt = i; }
                if (ref.startsWith(NuvioPlaybackButtonsPatch.EXTENSION + "->finish(")) finishAt = i;
            }
            check(introAt >= 0 && finishAt == introAt + 1);
        }
        File output = new File(args[1]); output.getParentFile().mkdirs();
        DexPool.writeTo(output.getPath(), new ImmutableDexFile(Opcodes.getDefault(), List.of(main, activity, timers)));
        int hooks = 0;
        try (var input = new BufferedInputStream(new FileInputStream(output))) {
            for (ClassDef c : DexBackedDexFile.fromInputStream(null, input).getClasses()) for (Method m : c.getMethods()) {
                boolean guardedTimer = m.toString().equals(nativeTimer.toString()) || m.toString().equals(NuvioIntroDbPatch.PAUSE_TIMER);
                if (guardedTimer) {
                    MutableMethod restored = new MutableMethod(m);
                    var body = NuvioAiringSeriesPatch.instructions(restored);
                    check(NuvioPlaybackButtonsPatch.reference(body.get(0)).equals(NuvioIntroDbPatch.HOLD_TIMER));
                    var call = (com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) body.get(0);
                    check(call.getStartRegister() == m.getImplementation().getRegisterCount() - 1 && call.getRegisterCount() == 1);
                    check(body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ && body.get(3).getOpcode() == Opcode.RETURN_VOID);
                    check(NuvioAnchors.branchTarget(body, 2) == 4);
                    for (int n = 0; n < 4; n++) restored.getImplementation().removeInstruction(0);
                    check(NuvioPlaybackButtonsPatch.fingerprint(restored).equals(m.getName().equals("F") ? NuvioIntroDbPatch.TIMER_HASH : NuvioIntroDbPatch.PAUSE_TIMER_HASH));
                    check(restored.getImplementation().getTryBlocks().isEmpty());
                }
                if (c.getType().equals("Lab/zf;") && !guardedTimer) {
                    Method original = java.util.stream.StreamSupport.stream(classes.get(c.getType()).getMethods().spliterator(), false)
                        .filter(candidate -> candidate.toString().equals(m.toString())).findFirst().orElseThrow();
                    if (m.getImplementation() != null) check(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(m))
                        .equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(original))));
                }
                if (m.getImplementation() != null) for (var i : m.getImplementation().getInstructions())
                    if (NuvioPlaybackButtonsPatch.reference(i).startsWith(NuvioIntroDbPatch.EXT)) hooks++;
            }
        }
        check(hooks == 5);
        SegmentCapture capture = new SegmentCapture();
        check(!capture.mark(12345) && capture.start == 12345);
        rejected(() -> capture.mark(12300));
        check(capture.mark(23456) && capture.end == 23456);
        check(SegmentCapture.time(12345).equals("00:00:12.345"));
        Submission target = new Submission("tt12345:2:3", 2, 3);
        var exact = new org.json.JSONObject(target.json(12345, 23456, "intro"));
        check(exact.getLong("start_ms") == 12345 && exact.getDouble("end_sec") == 23.456);
        String json = target.json("01:02", "01:12", "intro");
        var parsed = new org.json.JSONObject(json);
        check(parsed.getString("imdb_id").equals("tt12345") && parsed.getLong("start_ms") == 62000 && parsed.getLong("end_ms") == 72000);
        check(parsed.getInt("season") == 2 && parsed.getInt("episode") == 3 && parsed.getLong("start_sec") == 62 && parsed.length() == 8);
        check(Submission.time("01:02:03") == 3723);
        new Submission("tt12345", 0, 1).json("00:00", "00:01", "recap");
        target.json("02:00", "02:10", "outro");
        rejected(() -> new Submission("tmdb:123", 2, 3));
        rejected(() -> new Submission("tt12345:1:3", 2, 3));
        rejected(() -> new Submission("tt12345", null, null));
        rejected(() -> target.json("00:60", "01:20", "intro"));
        rejected(() -> target.json("00:20", "00:10", "intro"));
        rejected(() -> target.json("00:10", "00:10", "intro"));
        rejected(() -> target.json("-01:00", "01:20", "intro"));
        rejected(() -> target.json("00:00", "00:10", "bad"));
        for (int status : List.of(200, 201, 400, 401, 403, 429, 500, 302)) {
            Connection connection = new Connection(status);
            check(IntroDbClient.send(() -> connection, "test-key", json, () -> false, c -> {}) == status);
            check(connection.disconnected && connection.bytes.toString("UTF-8").equals(json));
            check(connection.getRequestMethod().equals("POST") && !connection.getInstanceFollowRedirects());
            check(connection.getRequestProperty("Authorization").equals("Bearer test-key"));
            check(connection.getConnectTimeout() == 10000 && connection.getReadTimeout() == 15000);
        }
        Connection cancelled = new Connection(200);
        for (String error : List.of("{\"error\":\"intro duration out of range\"}", "not JSON", "{\"error\":42}", "{\"error\":\"test-key\\ninvalid\"}", "x".repeat(5000))) {
            Connection validation = new Connection(400) {
                public InputStream getErrorStream() { return new ByteArrayInputStream(error.getBytes(java.nio.charset.StandardCharsets.UTF_8)); }
            };
            IntroDbClient.Result result = IntroDbClient.sendResult(() -> validation, "test-key", json, () -> false, c -> {});
            check(result.code == 400 && validation.disconnected && !result.error.contains("test-key") && !result.error.contains("\n"));
            check(result.error.equals(error.contains("duration") ? "intro duration out of range" : error.contains("test-key") ? "[redacted] invalid" : ""));
        }
        Connection unreadable = new Connection(400) { public InputStream getErrorStream() { return new InputStream() { public int read() throws IOException { throw new IOException(); } }; } };
        check(IntroDbClient.sendResult(() -> unreadable, "test-key", json, () -> false, c -> {}).code == 400 && unreadable.disconnected);
        try { IntroDbClient.send(() -> { throw new AssertionError("Cancelled request opened a connection"); }, "key", json, () -> true, c -> {}); throw new AssertionError(); }
        catch (java.util.concurrent.CancellationException expected) { }
        final boolean[] cancel = {false};
        try { IntroDbClient.send(() -> cancelled, "key", json, () -> cancel[0], c -> cancel[0] = true); throw new AssertionError(); }
        catch (java.util.concurrent.CancellationException expected) { check(cancelled.disconnected && cancelled.bytes.size() == 0); }
        Connection failed = new Connection(200) { public int getResponseCode() throws IOException { throw new SocketTimeoutException(); } };
        try { IntroDbClient.send(() -> failed, "key", json, () -> false, c -> {}); throw new AssertionError(); }
        catch (SocketTimeoutException expected) { check(failed.disconnected); }
        System.out.println("PASS: latest APK contracts, hook rejection, both playback patch orders, DEX reload, payload/timestamp validation, HTTP statuses, auth, redirects, timeouts and cancellation");
    }
    static class Connection extends HttpURLConnection {
        final int status; boolean disconnected; ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        Connection(int status) throws MalformedURLException { super(new URL("https://example.invalid")); this.status = status; }
        public void disconnect() { disconnected = true; }
        public boolean usingProxy() { return false; }
        public void connect() {}
        public OutputStream getOutputStream() { return bytes; }
        public int getResponseCode() throws IOException { return status; }
    }
}
