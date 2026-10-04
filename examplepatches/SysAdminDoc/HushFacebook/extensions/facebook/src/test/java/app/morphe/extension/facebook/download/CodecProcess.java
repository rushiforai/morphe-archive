/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import com.sun.jna.IntegerType;
import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.NativeLong;
import com.sun.jna.Platform;
import com.sun.jna.Pointer;
import com.sun.jna.Structure;
import com.sun.jna.WString;
import com.sun.jna.ptr.IntByReference;
import com.sun.jna.win32.StdCallLibrary;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/** Owns codec descendants before executing them. Linux callers in one worker must be sequential. */
public final class CodecProcess implements AutoCloseable {
    private static final int START = 'S', RELEASE = 'R', SIGKILL = 9, ESRCH = 3, ECHILD = 10;
    private final long deadline;
    private Path control;
    private Process launcher;
    private int pid;
    private WindowsJob job;
    private Posix posix;
    private Subreaper subreaper;
    private boolean ready, started, moved, groupGone, closed;

    private CodecProcess(long deadline) {
        this.deadline = deadline;
    }

    public static CodecProcess open(Path output, long deadlineNanos, String... command) throws Exception {
        if (command.length == 0) throw new IllegalArgumentException("codec command required");
        CodecProcess owned = new CodecProcess(deadlineNanos);
        try {
            owned.checkDeadline();
            if (Platform.isWindows()) owned.job = new WindowsJob();
            else {
                owned.posix = Native.load(Platform.C_LIBRARY_NAME, Posix.class);
                if (Platform.isLinux()) owned.subreaper = new Subreaper(owned.posix);
            }
            owned.checkDeadline();
            owned.control = Files.createTempDirectory(output.toAbsolutePath().getParent(), "codec-control-");
            for (String argument : command) {
                if (argument.indexOf('\0') >= 0) throw new IllegalArgumentException("NUL in codec argument");
            }
            // The outer Windows command line contains no codec arguments to quote a second time.
            publish(owned.control, "command", String.join("\0", command));
            owned.launcher = new ProcessBuilder(launcherCommand(owned.control))
                    .redirectErrorStream(true).redirectOutput(output.toFile()).start();
            // Process.pid() is absent from the Android boot API used to compile these tests.
            owned.pid = Math.toIntExact((Long) Process.class.getMethod("pid").invoke(owned.launcher));
            if (owned.job != null) owned.job.assign(owned.pid);
            owned.await("ready");
            owned.ready = true;
            owned.checkDeadline();
            owned.started = true;
            owned.launcher.getOutputStream().write(START);
            owned.launcher.getOutputStream().flush();
            owned.await("moved");
            owned.moved = true;
            owned.checkDeadline();
            return owned;
        } catch (Throwable failure) {
            try { owned.close(); }
            catch (Throwable cleanup) { failure.addSuppressed(cleanup); }
            throw failure;
        }
    }

    public boolean isRunning() throws Exception {
        if (closed) throw new IllegalStateException("codec process closed");
        checkLauncher();
        if (job != null) return !Files.exists(control.resolve("result")) || job.activeProcesses() > 1;
        reap();
        return groupExists() || !Files.exists(control.resolve("result"));
    }

    public int exitCode() throws Exception {
        if (isRunning()) throw new IllegalStateException("codec descendants still running");
        return Integer.parseInt(read(control.resolve("result")).trim());
    }

    private void await(String state) throws Exception {
        while (true) {
            checkDeadline();
            checkLauncher();
            if (Files.exists(control.resolve(state))) return;
            TimeUnit.NANOSECONDS.sleep(Math.min(deadline - System.nanoTime(), TimeUnit.MILLISECONDS.toNanos(5)));
        }
    }

    private void checkDeadline() throws TimeoutException {
        if (deadline - System.nanoTime() <= 0) throw new TimeoutException("codec launcher startup timed out");
    }

    private void checkLauncher() throws IOException {
        Path error = control.resolve("error");
        if (Files.exists(error)) throw new IOException("codec launcher failed: " + read(error));
        if (!launcher.isAlive()) throw new IOException("codec launcher exited before cleanup: " + launcher.exitValue());
    }

    private boolean groupExists() throws IOException {
        if (groupGone) return false;
        if (posix.kill(-pid, 0) == 0) return true;
        int error = Native.getLastError();
        if (error == ESRCH) { groupGone = true; return false; }
        throw nativeFailure("probe codec process group", error);
    }

    private void killGroup() throws IOException {
        if (groupGone) return;
        if (!launcher.isAlive()) throw new IOException("codec group anchor exited before termination");
        if (posix.kill(-pid, SIGKILL) == 0) return;
        int error = Native.getLastError();
        if (error == ESRCH) { groupGone = true; return; }
        throw nativeFailure("terminate codec process group", error);
    }

    /** Returns true once no adopted children in this group remain. Never waits for other groups. */
    private boolean reap() throws IOException {
        if (subreaper == null || groupGone) return true;
        IntByReference status = new IntByReference();
        for (int count = 0; count < 64; count++) {
            int child = posix.waitpid(-pid, status, 1); // WNOHANG. MOVED excludes Java's launcher child.
            if (child > 0) continue;
            if (child == 0) return false;
            int error = Native.getLastError();
            if (error == ECHILD) return true;
            if (error != 4) throw nativeFailure("reap codec process group", error); // EINTR
        }
        return false; // A continuously forking tool must not consume the worker's deadline here.
    }

    @Override
    public void close() throws Exception {
        if (closed) return;
        closed = true;
        boolean[] interrupted = {Thread.interrupted()};
        Throwable failure = null;
        long until = System.nanoTime() + TimeUnit.SECONDS.toNanos(1);
        try {
            if (launcher != null) {
                if (job != null) {
                    job.terminate();
                    while (job.activeProcesses() != 0 && System.nanoTime() < until) pause(interrupted);
                    if (job.activeProcesses() != 0) throw new IOException("codec job survived termination");
                } else if (ready) {
                    moved |= Files.exists(control.resolve("moved"));
                    killGroup();
                    if (moved) {
                        while (true) {
                            reap();
                            if (!groupExists()) break;
                            if (System.nanoTime() >= until) throw new IOException("codec group survived termination");
                            killGroup();
                            pause(interrupted);
                        }
                    } else {
                        // Before MOVED, SIGKILL includes the launcher. Let Java reap it first.
                        if (!waitLauncher(until, interrupted)) throw new IOException("codec launcher survived termination");
                        if (subreaper != null && started) {
                            while (!reap()) {
                                if (System.nanoTime() >= until) throw new IOException("codec children survived termination");
                                pause(interrupted);
                            }
                        }
                    }
                } else {
                    // No START token was released, so this managed child cannot have spawned a codec.
                    launcher.destroyForcibly();
                }
            }
        } catch (Throwable cleanup) { failure = cleanup; }
        if (launcher != null) {
            try {
                releaseLauncher(until, interrupted);
                launcher.getOutputStream().close();
                if (!waitLauncher(until, interrupted)) {
                    launcher.destroyForcibly();
                    if (!waitLauncher(until, interrupted)) throw new IOException("codec launcher did not stop");
                }
            } catch (Throwable cleanup) { failure = append(failure, cleanup); }
        }
        if (job != null) {
            try { job.close(); }
            catch (Throwable cleanup) { failure = append(failure, cleanup); }
        }
        if (subreaper != null) {
            try { subreaper.close(); }
            catch (Throwable cleanup) { failure = append(failure, cleanup); }
        }
        if (control != null) {
            try {
                for (String state : new String[]{"command", "ready", "moved", "result", "error"}) {
                    Files.deleteIfExists(control.resolve(state));
                    Files.deleteIfExists(control.resolve(state + ".tmp"));
                }
                Files.deleteIfExists(control);
            } catch (Throwable cleanup) { failure = append(failure, cleanup); }
        }
        if (interrupted[0]) {
            Thread.currentThread().interrupt();
            failure = append(failure, new InterruptedException("interrupted while closing codec process"));
        }
        if (failure != null) {
            if (failure instanceof Exception) throw (Exception) failure;
            throw (Error) failure;
        }
    }

    private void releaseLauncher(long until, boolean[] interrupted) throws IOException {
        if (!launcher.isAlive()) return;
        try {
            launcher.getOutputStream().write(RELEASE);
            launcher.getOutputStream().flush();
        } catch (IOException closed) {
            long soon = Math.min(until, System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(100));
            if (!waitLauncher(soon, interrupted)) throw closed;
        }
    }

    private boolean waitLauncher(long until, boolean[] interrupted) {
        while (launcher.isAlive() && System.nanoTime() < until) {
            try { launcher.waitFor(Math.min(until - System.nanoTime(), TimeUnit.MILLISECONDS.toNanos(10)), TimeUnit.NANOSECONDS); }
            catch (InterruptedException caught) { interrupted[0] = true; }
        }
        return !launcher.isAlive();
    }

    private static void pause(boolean[] interrupted) {
        try { Thread.sleep(5); }
        catch (InterruptedException caught) { interrupted[0] = true; }
    }

    private static Throwable append(Throwable failure, Throwable cleanup) {
        if (failure == null) return cleanup;
        failure.addSuppressed(cleanup);
        return failure;
    }

    private static IOException nativeFailure(String operation, int error) {
        return new IOException(operation + " failed (native error " + error + ")");
    }

    private static String read(Path path) throws IOException {
        return new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
    }

    private static void publish(Path directory, String state, String value) throws IOException {
        Path temporary = directory.resolve(state + ".tmp");
        Files.write(temporary, value.getBytes(StandardCharsets.UTF_8));
        Files.move(temporary, directory.resolve(state), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
    }

    private static List<String> launcherCommand(Path control) throws Exception {
        List<String> arguments = new ArrayList<>();
        arguments.add(new File(System.getProperty("java.home"), "bin/" + (Platform.isWindows() ? "java.exe" : "java")).getPath());
        arguments.add("--enable-native-access=ALL-UNNAMED");
        // https://github.com/openjdk/jdk/blob/jdk-25-ga/src/java.base/windows/classes/java/lang/ProcessImpl.java
        arguments.add("-Djdk.lang.Process.allowAmbiguousCommands=false");
        arguments.add("-cp");
        arguments.add(new File(CodecProcess.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getPath()
                + File.pathSeparator + new File(Native.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getPath()
                + File.pathSeparator + System.getProperty("java.class.path"));
        arguments.add(CodecProcess.class.getName());
        arguments.add(control.toString());
        return arguments;
    }

    private static void detachConsole() throws IOException {
        // Only the private launcher detaches. Its redirected file/pipe handles remain usable.
        // https://learn.microsoft.com/windows/console/freeconsole
        if (Platform.isWindows() && !Native.load("kernel32", Kernel.class).FreeConsole())
            throw nativeFailure("detach codec console", Native.getLastError());
    }

    /** Private child entry point. Its control pipe is never inherited by the codec. */
    public static void main(String[] arguments) throws Exception {
        Path control = Paths.get(arguments[0]);
        Posix api = Platform.isWindows() ? null : Native.load(Platform.C_LIBRARY_NAME, Posix.class);
        int ownPid = api == null ? 0 : api.getpid();
        int originalGroup = api == null ? 0 : api.getpgrp();
        CountDownLatch released = new CountDownLatch(1);
        try {
            detachConsole();
            if (api != null && api.setpgid(0, 0) != 0) throw nativeFailure("create codec process group", Native.getLastError());
            publish(control, "ready", "");
            if (System.in.read() != START) return;
            Thread watcher = new Thread(() -> {
                boolean cleanupComplete = false;
                try {
                    cleanupComplete = System.in.read() == RELEASE;
                } catch (IOException failure) { failure.printStackTrace(System.err); }
                finally {
                    if (!cleanupComplete && api != null) {
                        // Parent died. This live PID still pins the group, even after moving out.
                        if (api.kill(-ownPid, SIGKILL) != 0 && Native.getLastError() != ESRCH)
                            System.err.println("codec parent-death cleanup failed: " + Native.getLastError());
                    }
                    released.countDown();
                }
            }, "codec-control");
            watcher.setDaemon(true);
            watcher.start();
            Process codec = new ProcessBuilder(read(control.resolve("command")).split("\0", -1))
                    .redirectErrorStream(true).redirectOutput(ProcessBuilder.Redirect.INHERIT).start();
            codec.getOutputStream().close();
            // Keep our PID allocated outside the codec group until the worker completes cleanup.
            // https://man7.org/linux/man-pages/man2/setpgid.2.html
            if (api != null && api.setpgid(0, originalGroup) != 0) throw nativeFailure("pin codec process group", Native.getLastError());
            publish(control, "moved", "");
            int exit = codec.waitFor();
            // A tool can allocate a console. Do not keep its host alive through our anchor.
            detachConsole();
            publish(control, "result", Integer.toString(exit));
            released.await();
        } catch (Throwable failure) {
            failure.printStackTrace(System.err);
            try { publish(control, "error", failure.toString()); }
            catch (IOException publication) { failure.addSuppressed(publication); }
            // Preserve the anchor after errors too. The worker owns termination.
            while (System.in.read() >= 0) { }
        }
    }

    public interface Posix extends Library {
        int getpid();
        int getpgrp();
        int setpgid(int pid, int pgid);
        int kill(int pid, int signal);
        int waitpid(int pid, IntByReference status, int options);
        int prctl(int option, Object... arguments);
    }

    private static final class Subreaper implements AutoCloseable {
        private final Posix api;
        private final int previous;

        Subreaper(Posix api) throws IOException {
            this.api = api;
            IntByReference value = new IntByReference();
            if (api.prctl(37, value, new NativeLong(0), new NativeLong(0), new NativeLong(0)) != 0)
                throw nativeFailure("read child subreaper", Native.getLastError());
            previous = value.getValue();
            set(1);
        }

        // Process-wide, Linux-only. https://man7.org/linux/man-pages/man2/PR_SET_CHILD_SUBREAPER.2const.html
        private void set(int value) throws IOException {
            if (api.prctl(36, new NativeLong(value), new NativeLong(0), new NativeLong(0), new NativeLong(0)) != 0)
                throw nativeFailure("set child subreaper", Native.getLastError());
        }

        public void close() throws IOException { set(previous); }
    }

    public interface Kernel extends StdCallLibrary {
        boolean FreeConsole();
        Pointer CreateJobObjectW(Pointer security, WString name);
        boolean SetInformationJobObject(Pointer job, int kind, Pointer information, int size);
        Pointer OpenProcess(int access, boolean inherit, int pid);
        boolean AssignProcessToJobObject(Pointer job, Pointer process);
        boolean QueryInformationJobObject(Pointer job, int kind, Pointer information, int size, Pointer returned);
        boolean TerminateJobObject(Pointer job, int exitCode);
        boolean CloseHandle(Pointer handle);
    }

    private static final class WindowsJob implements AutoCloseable {
        private final Kernel api = Native.load("kernel32", Kernel.class);
        private Pointer handle;

        WindowsJob() throws IOException {
            handle = api.CreateJobObjectW(null, null);
            if (handle == null) throw nativeFailure("create codec job", Native.getLastError());
            ExtendedLimits limits = new ExtendedLimits();
            limits.basic.limitFlags = 0x2000; // KILL_ON_JOB_CLOSE; never allow breakaway.
            limits.write();
            if (!api.SetInformationJobObject(handle, 9, limits.getPointer(), limits.size())) {
                IOException failure = nativeFailure("configure codec job", Native.getLastError());
                try { close(); } catch (IOException cleanup) { failure.addSuppressed(cleanup); }
                throw failure;
            }
        }

        // https://learn.microsoft.com/windows/win32/api/jobapi2/nf-jobapi2-assignprocesstojobobject
        void assign(int pid) throws IOException {
            Pointer process = api.OpenProcess(0x0101, false, pid); // SET_QUOTA | TERMINATE
            if (process == null) throw nativeFailure("open codec launcher", Native.getLastError());
            IOException failure = null;
            try {
                if (!api.AssignProcessToJobObject(handle, process))
                    failure = nativeFailure("assign codec launcher", Native.getLastError());
            } finally {
                if (!api.CloseHandle(process)) {
                    IOException cleanup = nativeFailure("close codec launcher handle", Native.getLastError());
                    if (failure == null) failure = cleanup; else failure.addSuppressed(cleanup);
                }
            }
            if (failure != null) throw failure;
        }

        int activeProcesses() throws IOException {
            Accounting accounting = new Accounting();
            if (!api.QueryInformationJobObject(handle, 1, accounting.getPointer(), accounting.size(), null))
                throw nativeFailure("query codec job", Native.getLastError());
            accounting.read();
            return accounting.activeProcesses;
        }

        void terminate() throws IOException {
            if (!api.TerminateJobObject(handle, 1)) throw nativeFailure("terminate codec job", Native.getLastError());
        }

        public void close() throws IOException {
            if (handle != null) {
                Pointer owned = handle;
                handle = null;
                if (!api.CloseHandle(owned)) throw nativeFailure("close codec job", Native.getLastError());
            }
        }
    }

    public static final class SizeT extends IntegerType {
        public SizeT() { super(Native.SIZE_T_SIZE, 0, true); }
    }

    @Structure.FieldOrder({"processTime", "jobTime", "limitFlags", "minimumWorkingSet", "maximumWorkingSet", "activeLimit", "affinity", "priority", "scheduling"})
    public static class BasicLimits extends Structure {
        public long processTime, jobTime;
        public int limitFlags;
        public SizeT minimumWorkingSet = new SizeT(), maximumWorkingSet = new SizeT();
        public int activeLimit;
        public SizeT affinity = new SizeT();
        public int priority, scheduling;
        public BasicLimits() { super(ALIGN_MSVC); }
    }

    @Structure.FieldOrder({"readOperations", "writeOperations", "otherOperations", "readBytes", "writeBytes", "otherBytes"})
    public static class IoCounters extends Structure {
        public long readOperations, writeOperations, otherOperations, readBytes, writeBytes, otherBytes;
        public IoCounters() { super(ALIGN_MSVC); }
    }

    // SIZE_T and ULONG_PTR follow the host pointer width. LARGE_INTEGER and IO_COUNTERS stay 64-bit.
    // https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_extended_limit_information
    @Structure.FieldOrder({"basic", "io", "processMemory", "jobMemory", "peakProcessMemory", "peakJobMemory"})
    public static class ExtendedLimits extends Structure {
        public BasicLimits basic = new BasicLimits();
        public IoCounters io = new IoCounters();
        public SizeT processMemory = new SizeT(), jobMemory = new SizeT(), peakProcessMemory = new SizeT(), peakJobMemory = new SizeT();
        public ExtendedLimits() { super(ALIGN_MSVC); }
    }

    @Structure.FieldOrder({"userTime", "kernelTime", "periodUserTime", "periodKernelTime", "pageFaults", "totalProcesses", "activeProcesses", "terminatedProcesses"})
    public static class Accounting extends Structure {
        public long userTime, kernelTime, periodUserTime, periodKernelTime;
        public int pageFaults, totalProcesses, activeProcesses, terminatedProcesses;
        public Accounting() { super(ALIGN_MSVC); }
    }
}
