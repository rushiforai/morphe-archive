package com.google.firebase.crashlytics.internal.metadata;

import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.common.CommonUtils;
import com.google.firebase.crashlytics.internal.metadata.QueueFile;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
class QueueFileLogStore implements FileLogStore {
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private QueueFile logFile;
    private final int maxLogSize;
    private final File workingFile;

    /* loaded from: classes3.dex */
    public static class LogBytes {
        public final byte[] bytes;
        public final int offset;

        public LogBytes(byte[] bArr, int i5) {
            this.bytes = bArr;
            this.offset = i5;
        }
    }

    public QueueFileLogStore(File file, int i5) {
        this.workingFile = file;
        this.maxLogSize = i5;
    }

    private void doWriteToLog(long j11, String str) {
        if (this.logFile == null) {
            return;
        }
        if (str == null) {
            str = AbstractJsonLexerKt.NULL;
        }
        try {
            int i5 = this.maxLogSize / 4;
            if (str.length() > i5) {
                str = "..." + str.substring(str.length() - i5);
            }
            this.logFile.add(String.format(Locale.US, "%d %s%n", Long.valueOf(j11), str.replaceAll("\r", " ").replaceAll("\n", " ")).getBytes(UTF_8));
            while (!this.logFile.isEmpty() && this.logFile.usedBytes() > this.maxLogSize) {
                this.logFile.remove();
            }
        } catch (IOException e3) {
            Logger.getLogger().e("There was a problem writing to the Crashlytics log.", e3);
        }
    }

    private LogBytes getLogBytes() {
        if (!this.workingFile.exists()) {
            return null;
        }
        openLogFile();
        QueueFile queueFile = this.logFile;
        if (queueFile == null) {
            return null;
        }
        final int[] iArr = {0};
        final byte[] bArr = new byte[queueFile.usedBytes()];
        try {
            this.logFile.forEach(new QueueFile.ElementReader() { // from class: com.google.firebase.crashlytics.internal.metadata.QueueFileLogStore.1
                @Override // com.google.firebase.crashlytics.internal.metadata.QueueFile.ElementReader
                public void read(InputStream inputStream, int i5) throws IOException {
                    try {
                        inputStream.read(bArr, iArr[0], i5);
                        int[] iArr2 = iArr;
                        iArr2[0] = iArr2[0] + i5;
                    } finally {
                        inputStream.close();
                    }
                }
            });
        } catch (IOException e3) {
            Logger.getLogger().e("A problem occurred while reading the Crashlytics log file.", e3);
        }
        return new LogBytes(bArr, iArr[0]);
    }

    private void openLogFile() {
        if (this.logFile == null) {
            try {
                this.logFile = new QueueFile(this.workingFile);
            } catch (IOException e3) {
                Logger.getLogger().e("Could not open log file: " + this.workingFile, e3);
            }
        }
    }

    @Override // com.google.firebase.crashlytics.internal.metadata.FileLogStore
    public void closeLogFile() throws IOException {
        CommonUtils.closeOrLog(this.logFile, "There was a problem closing the Crashlytics log file.");
        this.logFile = null;
    }

    @Override // com.google.firebase.crashlytics.internal.metadata.FileLogStore
    public void deleteLogFile() throws IOException {
        closeLogFile();
        this.workingFile.delete();
    }

    @Override // com.google.firebase.crashlytics.internal.metadata.FileLogStore
    public byte[] getLogAsBytes() {
        LogBytes logBytes = getLogBytes();
        if (logBytes == null) {
            return null;
        }
        int i5 = logBytes.offset;
        byte[] bArr = new byte[i5];
        System.arraycopy(logBytes.bytes, 0, bArr, 0, i5);
        return bArr;
    }

    @Override // com.google.firebase.crashlytics.internal.metadata.FileLogStore
    public String getLogAsString() {
        byte[] logAsBytes = getLogAsBytes();
        if (logAsBytes != null) {
            return new String(logAsBytes, UTF_8);
        }
        return null;
    }

    @Override // com.google.firebase.crashlytics.internal.metadata.FileLogStore
    public void writeToLog(long j11, String str) {
        openLogFile();
        doWriteToLog(j11, str);
    }
}
