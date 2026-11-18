#!/usr/bin/env python3
"""Exercise durable queue/index IO, recovery, range transfers, and Vault query policies on a JVM."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
JAVA = ROOT / 'extensions/extension/src/main/java/app/afterglow/extension/downloads'
JDK = Path(os.environ.get('JDK', '/usr/lib/jvm/java-17-openjdk-amd64'))
SOURCES = ['DownloadRequest', 'DownloadCatalog', 'DownloadResolver', 'DownloadJob', 'LibraryItem',
           'DownloadPolicy', 'QueueRecord', 'DownloadStorage', 'DownloadTransfer', 'VaultQuery',
           'DownloadManager']
# Only the Android/UI/assembly boundaries are stubbed. Queue cleanup and startup recovery
# execute the production manager and durable storage implementation on real temporary files.
STUBS = {
    'android/content/Context.java': '''package android.content;
        public class Context {
            private final java.io.File files;
            public Context(java.io.File files) {this.files=files;}
            public Context getApplicationContext() {return this;}
            public java.io.File getFilesDir() {return files;}
        }''',
    'app/afterglow/extension/Afterglow.java': '''package app.afterglow.extension;
        public final class Afterglow {public static void runOnMain(Runnable action) {action.run();}}''',
    'app/afterglow/extension/diagnostics/DebugLog.java': '''package app.afterglow.extension.diagnostics;
        public final class DebugLog {public static void write(String category,String message) {}}''',
    'app/afterglow/extension/downloads/AfterglowDownloadResolver.java': '''package app.afterglow.extension.downloads;
        public final class AfterglowDownloadResolver {public static final DownloadResolver INSTANCE=null;}''',
    'app/afterglow/extension/downloads/DownloadLibrary.java': '''package app.afterglow.extension.downloads;
        public final class DownloadLibrary {
            DownloadLibrary(android.content.Context context,DownloadManager manager) {}
            void initialize(DownloadStorage storage) {}
            public LibraryItem item(String id) {return null;}
            LibraryItem accept(java.io.File file,QueueRecord record,String container) throws java.io.IOException {throw new java.io.IOException();}
            void exportBlocking(String id) throws java.io.IOException {throw new java.io.IOException();}
            void exportToMediaStore(String id,DownloadManager.Callback<Object> callback) {throw new UnsupportedOperationException();}
        }''',
    'app/afterglow/extension/downloads/DownloadAssembler.java': '''package app.afterglow.extension.downloads;
        final class DownloadAssembler {
            static final class Input {Input(java.io.File file,DownloadResolver.Role role) {}}
            static void assemble(java.util.List<Input> inputs,java.io.File file,String container,
                DownloadRequest.Kind kind,DownloadTransfer.Control control) throws java.io.IOException {throw new java.io.IOException();}
        }''',
    'app/afterglow/extension/downloads/DownloadService.java': '''package app.afterglow.extension.downloads;
        final class DownloadService {
            static void start(android.content.Context context) {}
            static void stop(android.content.Context context) {}
        }''',
}
with tempfile.TemporaryDirectory(prefix='afterglow-download-tests-') as directory:
    output = Path(directory)
    stubs = []
    for name, contents in STUBS.items():
        target = output / 'stubs' / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(contents)
        stubs.append(str(target))
    subprocess.run([str(JDK / 'bin/javac'), '-encoding', 'UTF-8', '-d', str(output)] +
                   [str(JAVA / (name + '.java')) for name in SOURCES] +
                   stubs + [str(ROOT / 'tools/jvm/DownloadEngineTest.java'),
                            str(ROOT / 'tools/jvm/DownloadManagerCleanupTest.java')], check=True)
    subprocess.run([str(JDK / 'bin/java'), '-ea', '-cp', str(output),
                    'app.afterglow.extension.downloads.DownloadEngineTest', str(output / 'data')], check=True)
    subprocess.run([str(JDK / 'bin/java'), '-ea', '-cp', str(output),
                    'app.afterglow.extension.downloads.DownloadManagerCleanupTest', str(output / 'manager')], check=True)
