.class public abstract Lnicoid/network238/okio/FileSystem;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/FileSystem$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u000f\u0008&\u0018\u0000 D2\u00060\u0001j\u0002`\u0002:\u0001DB\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0017\u0010\u0007\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\n\u001a\u00020\t2\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0019\u0010\u000c\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u001d\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00112\u0006\u0010\u0010\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001f\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00112\u0006\u0010\u0010\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008\u0014\u0010\u0013J\'\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00162\u0006\u0010\u0010\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0015\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u001b\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00162\u0006\u0010\u0010\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0017\u0010\u0019J\u0017\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001a\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ+\u0010 \u001a\u00020\u001b2\u0006\u0010\u001a\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001e\u001a\u00020\r2\u0008\u0008\u0002\u0010\u001f\u001a\u00020\rH&\u00a2\u0006\u0004\u0008 \u0010!J\u0015\u0010 \u001a\u00020\u001b2\u0006\u0010\u001a\u001a\u00020\u0005\u00a2\u0006\u0004\u0008 \u0010\u001dJ\u0017\u0010#\u001a\u00020\"2\u0006\u0010\u001a\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008#\u0010$JB\u0010+\u001a\u00028\u0000\"\u0004\u0008\u0000\u0010%2\u0006\u0010\u001a\u001a\u00020\u00052\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00020\'\u0012\u0004\u0012\u00028\u00000&H\u0087\u0008\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0002 \u0001\u00a2\u0006\u0004\u0008)\u0010*J!\u0010-\u001a\u00020,2\u0006\u0010\u001a\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001e\u001a\u00020\rH&\u00a2\u0006\u0004\u0008-\u0010.J\u0015\u0010-\u001a\u00020,2\u0006\u0010\u001a\u001a\u00020\u0005\u00a2\u0006\u0004\u0008-\u0010/JL\u00104\u001a\u00028\u0000\"\u0004\u0008\u0000\u0010%2\u0006\u0010\u001a\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001e\u001a\u00020\r2\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u000200\u0012\u0004\u0012\u00028\u00000&H\u0087\u0008\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0003 \u0001\u00a2\u0006\u0004\u00082\u00103J!\u00105\u001a\u00020,2\u0006\u0010\u001a\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001f\u001a\u00020\rH&\u00a2\u0006\u0004\u00085\u0010.J\u0015\u00105\u001a\u00020,2\u0006\u0010\u001a\u001a\u00020\u0005\u00a2\u0006\u0004\u00085\u0010/J!\u00107\u001a\u0002062\u0006\u0010\u0010\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001e\u001a\u00020\rH&\u00a2\u0006\u0004\u00087\u00108J\u0015\u00107\u001a\u0002062\u0006\u0010\u0010\u001a\u00020\u0005\u00a2\u0006\u0004\u00087\u00109J\u001f\u0010:\u001a\u0002062\u0006\u0010\u0010\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001e\u001a\u00020\r\u00a2\u0006\u0004\u0008:\u00108J\u0015\u0010:\u001a\u0002062\u0006\u0010\u0010\u001a\u00020\u0005\u00a2\u0006\u0004\u0008:\u00109J\u001f\u0010<\u001a\u0002062\u0006\u0010#\u001a\u00020\u00052\u0006\u0010;\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008<\u0010=J\u001f\u0010>\u001a\u0002062\u0006\u0010#\u001a\u00020\u00052\u0006\u0010;\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008>\u0010=J!\u0010?\u001a\u0002062\u0006\u0010\u0006\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001f\u001a\u00020\rH&\u00a2\u0006\u0004\u0008?\u00108J\u0015\u0010?\u001a\u0002062\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008?\u00109J!\u0010A\u001a\u0002062\u0006\u0010@\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u001f\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008A\u00108J\u0015\u0010A\u001a\u0002062\u0006\u0010@\u001a\u00020\u0005\u00a2\u0006\u0004\u0008A\u00109J\u001f\u0010B\u001a\u0002062\u0006\u0010#\u001a\u00020\u00052\u0006\u0010;\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008B\u0010=J\u000f\u0010C\u001a\u000206H\u0016\u00a2\u0006\u0004\u0008C\u0010\u0004\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006E"
    }
    d2 = {
        "Lnicoid/network238/okio/FileSystem;",
        "Ljava/io/Closeable;",
        "Lnicoid/network238/okio/Closeable;",
        "<init>",
        "()V",
        "Lnicoid/network238/okio/Path;",
        "path",
        "canonicalize",
        "(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;",
        "Lnicoid/network238/okio/FileMetadata;",
        "metadata",
        "(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;",
        "metadataOrNull",
        "",
        "exists",
        "(Lnicoid/network238/okio/Path;)Z",
        "dir",
        "",
        "list",
        "(Lnicoid/network238/okio/Path;)Ljava/util/List;",
        "listOrNull",
        "followSymlinks",
        "Lnicoid/network238/kotlin/sequences/Sequence;",
        "listRecursively",
        "(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;",
        "(Lnicoid/network238/okio/Path;)Lnicoid/network238/kotlin/sequences/Sequence;",
        "file",
        "Lnicoid/network238/okio/FileHandle;",
        "openReadOnly",
        "(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;",
        "mustCreate",
        "mustExist",
        "openReadWrite",
        "(Lnicoid/network238/okio/Path;ZZ)Lnicoid/network238/okio/FileHandle;",
        "Lnicoid/network238/okio/Source;",
        "source",
        "(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;",
        "T",
        "Lnicoid/network238/kotlin/Function1;",
        "Lnicoid/network238/okio/BufferedSource;",
        "readerAction",
        "-read",
        "(Lnicoid/network238/okio/Path;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "read",
        "Lnicoid/network238/okio/Sink;",
        "sink",
        "(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;",
        "(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Sink;",
        "Lnicoid/network238/okio/BufferedSink;",
        "writerAction",
        "-write",
        "(Lnicoid/network238/okio/Path;ZLnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "write",
        "appendingSink",
        "",
        "createDirectory",
        "(Lnicoid/network238/okio/Path;Z)V",
        "(Lnicoid/network238/okio/Path;)V",
        "createDirectories",
        "target",
        "atomicMove",
        "(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V",
        "copy",
        "delete",
        "fileOrDirectory",
        "deleteRecursively",
        "createSymlink",
        "close",
        "Companion",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/okio/FileSystem$Companion;

.field public static final RESOURCES:Lnicoid/network238/okio/FileSystem;

.field public static final SYSTEM:Lnicoid/network238/okio/FileSystem;

.field public static final SYSTEM_TEMPORARY_DIRECTORY:Lnicoid/network238/okio/Path;


# direct methods
.method public static synthetic -write$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZLnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p0, "$this"    # Lnicoid/network238/okio/FileSystem;
    .param p1, "file"    # Lnicoid/network238/okio/Path;
    .param p2, "mustCreate"    # Z
    .param p3, "writerAction"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    if-nez p5, :cond_4

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 191
    const/4 p2, 0x0

    .line 86
    :cond_0
    const-string p4, "file"

    invoke-static {p1, p4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "writerAction"

    invoke-static {p3, p4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p4, 0x0

    .line 95
    .local p4, "$i$f$-write":I
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object p5

    invoke-static {p5}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p5

    check-cast p5, Ljava/io/Closeable;

    .local p5, "$this$use$iv":Ljava/io/Closeable;
    const/4 v0, 0x0

    .line 214
    .local v0, "$i$f$use":I
    const/4 v1, 0x0

    .line 216
    .local v1, "thrown$iv":Ljava/lang/Throwable;
    nop

    .line 217
    :try_start_0
    move-object v2, p5

    check-cast v2, Lnicoid/network238/okio/BufferedSink;

    .local v2, "it":Lnicoid/network238/okio/BufferedSink;
    const/4 v3, 0x0

    .line 96
    .local v3, "$i$a$-use-FileSystem$write$1":I
    invoke-interface {p3, v2}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 217
    .end local v2    # "it":Lnicoid/network238/okio/BufferedSink;
    .end local v3    # "$i$a$-use-FileSystem$write$1":I
    nop

    .line 222
    nop

    .line 223
    if-eqz p5, :cond_1

    :try_start_1
    invoke-interface {p5}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 224
    :catchall_0
    move-exception v2

    .line 225
    .local v2, "t$iv":Ljava/lang/Throwable;
    nop

    .line 226
    move-object v1, v2

    .end local v2    # "t$iv":Ljava/lang/Throwable;
    :cond_1
    :goto_0
    nop

    .line 231
    goto :goto_2

    .line 218
    :catchall_1
    move-exception v2

    .line 219
    .restart local v2    # "t$iv":Ljava/lang/Throwable;
    move-object v1, v2

    .line 220
    nop

    .line 222
    .end local v2    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 223
    if-eqz p5, :cond_2

    :try_start_2
    invoke-interface {p5}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 224
    :catchall_2
    move-exception v2

    .line 225
    .restart local v2    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 228
    invoke-static {v1, v2}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .end local v2    # "t$iv":Ljava/lang/Throwable;
    :cond_2
    :goto_1
    nop

    .line 231
    const/4 v4, 0x0

    .line 216
    :goto_2
    nop

    .line 233
    .local v4, "result$iv":Ljava/lang/Object;
    if-nez v1, :cond_3

    .line 235
    nop

    .line 95
    .end local v0    # "$i$f$use":I
    .end local v1    # "thrown$iv":Ljava/lang/Throwable;
    .end local v4    # "result$iv":Ljava/lang/Object;
    .end local p5    # "$this$use$iv":Ljava/io/Closeable;
    return-object v4

    .line 233
    .restart local v0    # "$i$f$use":I
    .restart local v1    # "thrown$iv":Ljava/lang/Throwable;
    .restart local v4    # "result$iv":Ljava/lang/Object;
    .restart local p5    # "$this$use$iv":Ljava/io/Closeable;
    :cond_3
    throw v1

    .line 86
    .end local v0    # "$i$f$use":I
    .end local v1    # "thrown$iv":Ljava/lang/Throwable;
    .end local v4    # "result$iv":Ljava/lang/Object;
    .end local p4    # "$i$f$-write":I
    .end local p5    # "$this$use$iv":Ljava/io/Closeable;
    :cond_4
    new-instance p4, Ljava/lang/UnsupportedOperationException;

    const-string p5, "Super calls with default arguments not supported in this target, function: write"

    invoke-direct {p4, p5}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p4
.end method

.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lnicoid/network238/okio/FileSystem$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/FileSystem$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/FileSystem;->Companion:Lnicoid/network238/okio/FileSystem$Companion;

    .line 154
    :try_start_0
    const-string v0, "java.nio.file.Files"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 155
    new-instance v0, Lnicoid/network238/okio/NioSystemFileSystem;

    invoke-direct {v0}, Lnicoid/network238/okio/NioSystemFileSystem;-><init>()V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 157
    new-instance v0, Lnicoid/network238/okio/JvmSystemFileSystem;

    invoke-direct {v0}, Lnicoid/network238/okio/JvmSystemFileSystem;-><init>()V

    .line 152
    :goto_0
    sput-object v0, Lnicoid/network238/okio/FileSystem;->SYSTEM:Lnicoid/network238/okio/FileSystem;

    .line 162
    sget-object v0, Lnicoid/network238/okio/Path;->Companion:Lnicoid/network238/okio/Path$Companion;

    const-string v2, "java.io.tmpdir"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v0, v2, v3, v4, v1}, Lnicoid/network238/okio/Path$Companion;->get$default(Lnicoid/network238/okio/Path$Companion;Ljava/lang/String;ZILjava/lang/Object;)Lnicoid/network238/okio/Path;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okio/FileSystem;->SYSTEM_TEMPORARY_DIRECTORY:Lnicoid/network238/okio/Path;

    .line 175
    new-instance v1, Lnicoid/network238/okio/internal/ResourceFileSystem;

    .line 176
    const-class v0, Lnicoid/network238/okio/internal/ResourceFileSystem;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lnicoid/network238/okio/internal/ResourceFileSystem;-><init>(Ljava/lang/ClassLoader;ZLnicoid/network238/okio/FileSystem;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v1, Lnicoid/network238/okio/FileSystem;->RESOURCES:Lnicoid/network238/okio/FileSystem;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic appendingSink$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 101
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->appendingSink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: appendingSink"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic createDirectories$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 113
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->createDirectories(Lnicoid/network238/okio/Path;Z)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: createDirectories"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic createDirectory$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 107
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->createDirectory(Lnicoid/network238/okio/Path;Z)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: createDirectory"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic delete$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 126
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;Z)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: delete"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic deleteRecursively$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 132
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->deleteRecursively(Lnicoid/network238/okio/Path;Z)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: deleteRecursively"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final get(Ljava/nio/file/FileSystem;)Lnicoid/network238/okio/FileSystem;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/FileSystem;->Companion:Lnicoid/network238/okio/FileSystem$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/FileSystem$Companion;->get(Ljava/nio/file/FileSystem;)Lnicoid/network238/okio/FileSystem;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic listRecursively$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 5

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 48
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->listRecursively(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: listRecursively"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic openReadWrite$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZZILjava/lang/Object;)Lnicoid/network238/okio/FileHandle;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p5, :cond_2

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move p3, v0

    .line 57
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/FileSystem;->openReadWrite(Lnicoid/network238/okio/Path;ZZ)Lnicoid/network238/okio/FileHandle;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: openReadWrite"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic sink$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 79
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: sink"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final -read(Lnicoid/network238/okio/Path;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 10
    .param p1, "file"    # Lnicoid/network238/okio/Path;
    .param p2, "readerAction"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okio/Path;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    const-string v0, "file"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "readerAction"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 73
    .local v0, "$i$f$-read":I
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    check-cast v1, Ljava/io/Closeable;

    .local v1, "$this$use$iv":Ljava/io/Closeable;
    const/4 v2, 0x0

    .line 192
    .local v2, "$i$f$use":I
    const/4 v3, 0x0

    .line 194
    .local v3, "thrown$iv":Ljava/lang/Throwable;
    nop

    .line 195
    :try_start_0
    move-object v4, v1

    check-cast v4, Lnicoid/network238/okio/BufferedSource;

    .local v4, "it":Lnicoid/network238/okio/BufferedSource;
    const/4 v5, 0x0

    .line 74
    .local v5, "$i$a$-use-FileSystem$read$1":I
    invoke-interface {p2, v4}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 195
    .end local v4    # "it":Lnicoid/network238/okio/BufferedSource;
    .end local v5    # "$i$a$-use-FileSystem$read$1":I
    nop

    .line 200
    nop

    .line 201
    if-eqz v1, :cond_0

    :try_start_1
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 202
    :catchall_0
    move-exception v4

    .line 203
    .local v4, "t$iv":Ljava/lang/Throwable;
    nop

    .line 204
    move-object v3, v4

    .end local v4    # "t$iv":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    nop

    .line 209
    goto :goto_2

    .line 196
    :catchall_1
    move-exception v4

    .line 197
    .restart local v4    # "t$iv":Ljava/lang/Throwable;
    move-object v3, v4

    .line 198
    nop

    .line 200
    .end local v4    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 201
    if-eqz v1, :cond_1

    :try_start_2
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 202
    :catchall_2
    move-exception v4

    .line 203
    .restart local v4    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 206
    invoke-static {v3, v4}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .end local v4    # "t$iv":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    nop

    .line 209
    const/4 v6, 0x0

    .line 194
    :goto_2
    nop

    .line 211
    .local v6, "result$iv":Ljava/lang/Object;
    if-nez v3, :cond_2

    .line 213
    nop

    .line 73
    .end local v1    # "$this$use$iv":Ljava/io/Closeable;
    .end local v2    # "$i$f$use":I
    .end local v3    # "thrown$iv":Ljava/lang/Throwable;
    .end local v6    # "result$iv":Ljava/lang/Object;
    return-object v6

    .line 211
    .restart local v1    # "$this$use$iv":Ljava/io/Closeable;
    .restart local v2    # "$i$f$use":I
    .restart local v3    # "thrown$iv":Ljava/lang/Throwable;
    .restart local v6    # "result$iv":Ljava/lang/Object;
    :cond_2
    throw v3
.end method

.method public final -write(Lnicoid/network238/okio/Path;ZLnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 11
    .param p1, "file"    # Lnicoid/network238/okio/Path;
    .param p2, "mustCreate"    # Z
    .param p3, "writerAction"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okio/Path;",
            "Z",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 228
    const-string v0, "file"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "writerAction"

    invoke-static {p3, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 95
    .local v0, "$i$f$-write":I
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    check-cast v1, Ljava/io/Closeable;

    .local v1, "$this$use$iv":Ljava/io/Closeable;
    const/4 v2, 0x0

    .line 214
    .local v2, "$i$f$use":I
    const/4 v3, 0x0

    .line 216
    .local v3, "thrown$iv":Ljava/lang/Throwable;
    nop

    .line 217
    :try_start_0
    move-object v4, v1

    check-cast v4, Lnicoid/network238/okio/BufferedSink;

    .local v4, "it":Lnicoid/network238/okio/BufferedSink;
    const/4 v5, 0x0

    .line 96
    .local v5, "$i$a$-use-FileSystem$write$1":I
    invoke-interface {p3, v4}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 217
    .end local v4    # "it":Lnicoid/network238/okio/BufferedSink;
    .end local v5    # "$i$a$-use-FileSystem$write$1":I
    nop

    .line 222
    nop

    .line 223
    if-eqz v1, :cond_0

    :try_start_1
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 224
    :catchall_0
    move-exception v4

    .line 225
    .local v4, "t$iv":Ljava/lang/Throwable;
    nop

    .line 226
    move-object v3, v4

    .end local v4    # "t$iv":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    nop

    .line 231
    goto :goto_2

    .line 218
    :catchall_1
    move-exception v4

    .line 219
    .restart local v4    # "t$iv":Ljava/lang/Throwable;
    move-object v3, v4

    .line 220
    nop

    .line 222
    .end local v4    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 223
    if-eqz v1, :cond_1

    :try_start_2
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 224
    :catchall_2
    move-exception v4

    .line 225
    .restart local v4    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 228
    invoke-static {v3, v4}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .end local v4    # "t$iv":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    nop

    .line 231
    const/4 v6, 0x0

    .line 216
    :goto_2
    nop

    .line 233
    .local v6, "result$iv":Ljava/lang/Object;
    if-nez v3, :cond_2

    .line 235
    nop

    .line 95
    .end local v1    # "$this$use$iv":Ljava/io/Closeable;
    .end local v2    # "$i$f$use":I
    .end local v3    # "thrown$iv":Ljava/lang/Throwable;
    .end local v6    # "result$iv":Ljava/lang/Object;
    return-object v6

    .line 233
    .restart local v1    # "$this$use$iv":Ljava/io/Closeable;
    .restart local v2    # "$i$f$use":I
    .restart local v3    # "thrown$iv":Ljava/lang/Throwable;
    .restart local v6    # "result$iv":Ljava/lang/Object;
    :cond_2
    throw v3
.end method

.method public final appendingSink(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Sink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->appendingSink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public abstract appendingSink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract canonicalize(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public copy(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-FileSystem;->commonCopy(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V

    return-void
.end method

.method public final createDirectories(Lnicoid/network238/okio/Path;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->createDirectories(Lnicoid/network238/okio/Path;Z)V

    return-void
.end method

.method public final createDirectories(Lnicoid/network238/okio/Path;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-FileSystem;->commonCreateDirectories(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)V

    return-void
.end method

.method public final createDirectory(Lnicoid/network238/okio/Path;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->createDirectory(Lnicoid/network238/okio/Path;Z)V

    return-void
.end method

.method public abstract createDirectory(Lnicoid/network238/okio/Path;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createSymlink(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final delete(Lnicoid/network238/okio/Path;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;Z)V

    return-void
.end method

.method public abstract delete(Lnicoid/network238/okio/Path;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final deleteRecursively(Lnicoid/network238/okio/Path;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->deleteRecursively(Lnicoid/network238/okio/Path;Z)V

    return-void
.end method

.method public deleteRecursively(Lnicoid/network238/okio/Path;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-FileSystem;->commonDeleteRecursively(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)V

    return-void
.end method

.method public final exists(Lnicoid/network238/okio/Path;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-FileSystem;->commonExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Z

    move-result p1

    return p1
.end method

.method public abstract list(Lnicoid/network238/okio/Path;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract listOrNull(Lnicoid/network238/okio/Path;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation
.end method

.method public final listRecursively(Lnicoid/network238/okio/Path;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            ")",
            "Lnicoid/network238/kotlin/sequences/Sequence;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->listRecursively(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p1

    return-object p1
.end method

.method public listRecursively(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            "Z)",
            "Lnicoid/network238/kotlin/sequences/Sequence;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-FileSystem;->commonListRecursively(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p1

    return-object p1
.end method

.method public final metadata(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-FileSystem;->commonMetadata(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object p1

    return-object p1
.end method

.method public abstract metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract openReadOnly(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final openReadWrite(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileHandle;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lnicoid/network238/okio/FileSystem;->openReadWrite(Lnicoid/network238/okio/Path;ZZ)Lnicoid/network238/okio/FileHandle;

    move-result-object p1

    return-object p1
.end method

.method public abstract openReadWrite(Lnicoid/network238/okio/Path;ZZ)Lnicoid/network238/okio/FileHandle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final sink(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Sink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1
.end method

.method public abstract sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
