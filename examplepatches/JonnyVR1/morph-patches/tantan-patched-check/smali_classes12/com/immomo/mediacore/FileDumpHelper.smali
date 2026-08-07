.class public Lcom/immomo/mediacore/FileDumpHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static playbackStream:Ljava/io/FileOutputStream;

.field static recorderStream:Ljava/io/FileOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static clear()V
    .locals 0

    return-void
.end method

.method public static writePlaybackSample(Ljava/lang/String;[B)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/io/FileOutputStream;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, v1, v0}, Ljava/io/FileOutputStream;->write([BII)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_1
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static writeRecorderSample(Ljava/lang/String;[B)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/immomo/mediacore/FileDumpHelper;->recorderStream:Ljava/io/FileOutputStream;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/io/FileOutputStream;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/mediacore/FileDumpHelper;->recorderStream:Ljava/io/FileOutputStream;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/immomo/mediacore/FileDumpHelper;->recorderStream:Ljava/io/FileOutputStream;

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, v1, v0}, Ljava/io/FileOutputStream;->write([BII)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/immomo/mediacore/FileDumpHelper;->recorderStream:Ljava/io/FileOutputStream;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_1
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static writeSample(Ljava/lang/String;[B)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/io/FileOutputStream;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, v1, v0}, Ljava/io/FileOutputStream;->write([BII)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/immomo/mediacore/FileDumpHelper;->playbackStream:Ljava/io/FileOutputStream;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_1
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
