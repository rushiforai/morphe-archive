package com.pgl.ssdk;

import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;

/* loaded from: classes4.dex */
public abstract class r {
    public static q a(RandomAccessFile randomAccessFile, long j11, long j12) {
        return a(randomAccessFile.getChannel(), j11, j12);
    }

    public static q a(FileChannel fileChannel, long j11, long j12) {
        fileChannel.getClass();
        return new m(fileChannel, j11, j12);
    }
}
