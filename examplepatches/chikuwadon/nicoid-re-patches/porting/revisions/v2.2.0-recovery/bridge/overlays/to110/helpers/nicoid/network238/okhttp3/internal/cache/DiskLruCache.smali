.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Companion;,
        Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;,
        Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;,
        Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0083\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0014\n\u0002\u0010)\n\u0002\u0008\u0005*\u00019\u0018\u0000 a2\u00020\u00012\u00020\u00022\u00020\u0003:\u0004^_`aB7\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0006\u0010\r\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0006\u0010;\u001a\u00020<J\u0008\u0010=\u001a\u00020<H\u0002J\u0008\u0010>\u001a\u00020!H\u0002J\u0010\u0010?\u001a\u00020<2\u0006\u0010@\u001a\u00020$H\u0002J\u0008\u0010A\u001a\u00020<H\u0002J\r\u0010B\u001a\u00020<H\u0000\u00a2\u0006\u0002\u0008CJ\u0017\u0010D\u001a\u0008\u0018\u00010ER\u00020\u00002\u0006\u0010F\u001a\u00020$H\u0086\u0002J \u0010G\u001a\u0008\u0018\u00010HR\u00020\u00002\u0006\u0010F\u001a\u00020$2\u0008\u0008\u0002\u0010I\u001a\u00020\u000cH\u0007J\u0006\u0010\u001f\u001a\u00020\u000cJ!\u0010J\u001a\u00020<2\n\u0010K\u001a\u00060HR\u00020\u00002\u0006\u0010L\u001a\u00020+H\u0000\u00a2\u0006\u0002\u0008MJ\u0008\u0010N\u001a\u00020+H\u0002J\u000e\u0010O\u001a\u00020+2\u0006\u0010F\u001a\u00020$J\u0019\u0010P\u001a\u00020+2\n\u0010Q\u001a\u00060%R\u00020\u0000H\u0000\u00a2\u0006\u0002\u0008RJ\u0008\u0010S\u001a\u00020<H\u0002J\u0008\u0010T\u001a\u00020<H\u0016J\u0006\u0010U\u001a\u00020+J\u0008\u0010V\u001a\u00020<H\u0016J\u0006\u0010W\u001a\u00020<J\u0008\u0010X\u001a\u00020+H\u0002J\u0006\u0010Y\u001a\u00020<J\u0006\u0010Z\u001a\u00020<J\u0010\u0010[\u001a\u00020<2\u0006\u0010F\u001a\u00020$H\u0002J\u0010\u0010\\\u001a\u000c\u0012\u0008\u0012\u00060ER\u00020\u00000]R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R$\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0017\u001a\u00020\u000c@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR\u000e\u0010\u001c\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010!X\u0082\u000e\u00a2\u0006\u0002\n\u0000R8\u0010\"\u001a&\u0012\u0004\u0012\u00020$\u0012\u0008\u0012\u00060%R\u00020\u00000#j\u0012\u0012\u0004\u0012\u00020$\u0012\u0008\u0012\u00060%R\u00020\u0000`&X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(R\u000e\u0010)\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010*\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010-\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010.\u001a\u00020+X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008/\u00100\"\u0004\u00081\u00102R\u000e\u00103\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00104\u001a\u00020+X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00105\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00106\u001a\u000207X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u00108\u001a\u000209X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010:\u00a8\u0006b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "Ljava/io/Closeable;",
        "Ljava/io/Flushable;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "fileSystem",
        "Lnicoid/network238/okio/FileSystem;",
        "directory",
        "Lnicoid/network238/okio/Path;",
        "appVersion",
        "",
        "valueCount",
        "maxSize",
        "",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "<init>",
        "(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;IIJLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V",
        "getDirectory",
        "()Lnicoid/network238/okio/Path;",
        "getValueCount$okhttp",
        "()I",
        "getFileSystem$okhttp",
        "()Lnicoid/network238/okio/FileSystem;",
        "value",
        "getMaxSize",
        "()J",
        "setMaxSize",
        "(J)V",
        "journalFile",
        "journalFileTmp",
        "journalFileBackup",
        "size",
        "journalWriter",
        "Lnicoid/network238/okio/BufferedSink;",
        "lruEntries",
        "Ljava/util/LinkedHashMap;",
        "",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
        "Lnicoid/network238/kotlin/collections/LinkedHashMap;",
        "getLruEntries$okhttp",
        "()Ljava/util/LinkedHashMap;",
        "redundantOpCount",
        "hasJournalErrors",
        "",
        "civilizedFileSystem",
        "initialized",
        "closed",
        "getClosed$okhttp",
        "()Z",
        "setClosed$okhttp",
        "(Z)V",
        "mostRecentTrimFailed",
        "mostRecentRebuildFailed",
        "nextSequenceNumber",
        "cleanupQueue",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "cleanupTask",
        "nicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;",
        "initialize",
        "",
        "readJournal",
        "newJournalWriter",
        "readJournalLine",
        "line",
        "processJournal",
        "rebuildJournal",
        "rebuildJournal$okhttp",
        "get",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "key",
        "edit",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "expectedSequenceNumber",
        "completeEdit",
        "editor",
        "success",
        "completeEdit$okhttp",
        "journalRebuildRequired",
        "remove",
        "removeEntry",
        "entry",
        "removeEntry$okhttp",
        "checkNotClosed",
        "flush",
        "isClosed",
        "close",
        "trimToSize",
        "removeOldestEntry",
        "delete",
        "evictAll",
        "validateKey",
        "snapshots",
        "",
        "Snapshot",
        "Editor",
        "Entry",
        "Companion",
        "okhttp"
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
.field public static final ANY_SEQUENCE_NUMBER:J

.field public static final CLEAN:Ljava/lang/String;

.field public static final Companion:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Companion;

.field public static final DIRTY:Ljava/lang/String;

.field public static final JOURNAL_FILE:Ljava/lang/String;

.field public static final JOURNAL_FILE_BACKUP:Ljava/lang/String;

.field public static final JOURNAL_FILE_TEMP:Ljava/lang/String;

.field public static final LEGAL_KEY_PATTERN:Lnicoid/network238/kotlin/text/Regex;

.field public static final MAGIC:Ljava/lang/String;

.field public static final READ:Ljava/lang/String;

.field public static final REMOVE:Ljava/lang/String;

.field public static final VERSION_1:Ljava/lang/String;


# instance fields
.field private final appVersion:I

.field private civilizedFileSystem:Z

.field private final cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

.field private final cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

.field private closed:Z

.field private final directory:Lnicoid/network238/okio/Path;

.field private final fileSystem:Lnicoid/network238/okio/FileSystem;

.field private hasJournalErrors:Z

.field private initialized:Z

.field private final journalFile:Lnicoid/network238/okio/Path;

.field private final journalFileBackup:Lnicoid/network238/okio/Path;

.field private final journalFileTmp:Lnicoid/network238/okio/Path;

.field private journalWriter:Lnicoid/network238/okio/BufferedSink;

.field private final lruEntries:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private maxSize:J

.field private mostRecentRebuildFailed:Z

.field private mostRecentTrimFailed:Z

.field private nextSequenceNumber:J

.field private redundantOpCount:I

.field private size:J

.field private final valueCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->Companion:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Companion;

    .line 1099
    const-string v0, "journal"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->JOURNAL_FILE:Ljava/lang/String;

    .line 1101
    const-string v0, "journal.tmp"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->JOURNAL_FILE_TEMP:Ljava/lang/String;

    .line 1103
    const-string v0, "journal.bkp"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->JOURNAL_FILE_BACKUP:Ljava/lang/String;

    .line 1105
    const-string v0, "libcore.io.DiskLruCache"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->MAGIC:Ljava/lang/String;

    .line 1107
    const-string v0, "1"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->VERSION_1:Ljava/lang/String;

    .line 1109
    const-wide/16 v0, -0x1

    sput-wide v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->ANY_SEQUENCE_NUMBER:J

    .line 1111
    new-instance v0, Lnicoid/network238/kotlin/text/Regex;

    const-string v1, "[a-z0-9_-]{1,120}"

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->LEGAL_KEY_PATTERN:Lnicoid/network238/kotlin/text/Regex;

    .line 1113
    const-string v0, "CLEAN"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->CLEAN:Ljava/lang/String;

    .line 1115
    const-string v0, "DIRTY"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->DIRTY:Ljava/lang/String;

    .line 1117
    const-string v0, "REMOVE"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->REMOVE:Ljava/lang/String;

    .line 1119
    const-string v0, "READ"

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->READ:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;IIJLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->directory:Lnicoid/network238/okio/Path;

    .line 92
    iput p3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->appVersion:I

    .line 93
    iput p4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    .line 102
    new-instance p3, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$fileSystem$1;

    invoke-direct {p3, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$fileSystem$1;-><init>(Lnicoid/network238/okio/FileSystem;)V

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    .line 116
    iput-wide p5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->maxSize:J

    .line 169
    new-instance p1, Ljava/util/LinkedHashMap;

    const/high16 p3, 0x3f400000    # 0.75f

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p1, v1, p3, v0}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 187
    invoke-virtual {p7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 189
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p3, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " Cache"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p3, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    invoke-direct {p3, p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;)V

    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    const-wide/16 v0, 0x0

    cmp-long p1, p5, v0

    if-lez p1, :cond_1

    if-lez p4, :cond_0

    .line 222
    sget-object p1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->JOURNAL_FILE:Ljava/lang/String;

    invoke-virtual {p2, p1}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    .line 223
    sget-object p1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->JOURNAL_FILE_TEMP:Ljava/lang/String;

    invoke-virtual {p2, p1}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileTmp:Lnicoid/network238/okio/Path;

    .line 224
    sget-object p1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->JOURNAL_FILE_BACKUP:Ljava/lang/String;

    invoke-virtual {p2, p1}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    return-void

    .line 220
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "valueCount <= 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 219
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "maxSize <= 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final synthetic access$getCivilizedFileSystem$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z
    .registers 1

    .line 88
    iget-boolean p0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->civilizedFileSystem:Z

    return p0
.end method

.method public static final synthetic access$getInitialized$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z
    .registers 1

    .line 88
    iget-boolean p0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z

    return p0
.end method

.method public static final synthetic access$getJournalWriter$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Lnicoid/network238/okio/BufferedSink;
    .registers 1

    .line 88
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    return-object p0
.end method

.method public static final synthetic access$journalRebuildRequired(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z
    .registers 1

    .line 88
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$setJournalWriter$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okio/BufferedSink;)V
    .registers 2

    .line 88
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    return-void
.end method

.method public static final synthetic access$setMostRecentRebuildFailed$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Z)V
    .registers 2

    .line 88
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentRebuildFailed:Z

    return-void
.end method

.method public static final synthetic access$setMostRecentTrimFailed$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Z)V
    .registers 2

    .line 88
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentTrimFailed:Z

    return-void
.end method

.method public static final synthetic access$setRedundantOpCount$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;I)V
    .registers 2

    .line 88
    iput p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    return-void
.end method

.method private final declared-synchronized checkNotClosed()V
    .registers 3

    monitor-enter p0

    .line 691
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 691
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public static synthetic edit$default(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;JILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 481
    sget-wide p2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->ANY_SEQUENCE_NUMBER:J

    .line 479
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->edit(Ljava/lang/String;J)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object p0

    return-object p0
.end method

.method private final journalRebuildRequired()Z
    .registers 3

    .line 622
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_0

    .line 623
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private final newJournalWriter()Lnicoid/network238/okio/BufferedSink;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 321
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/FileSystem;->appendingSink(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Sink;

    move-result-object v0

    .line 323
    new-instance v1, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;

    .line 322
    new-instance v2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$0;

    invoke-direct {v2, p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$0;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)V

    .line 323
    invoke-direct {v1, v0, v2}, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;-><init>(Lnicoid/network238/okio/Sink;Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    .line 327
    invoke-static {v1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    return-object v0
.end method

.method static final newJournalWriter$lambda$0(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1191
    sget-boolean p1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz p1, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 1192
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MUST hold lock on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    :cond_0
    nop

    .line 325
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->hasJournalErrors:Z

    .line 326
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private final processJournal()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 385
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileTmp:Lnicoid/network238/okio/Path;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    .line 386
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 387
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 388
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    .line 389
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 390
    iget v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    :goto_1
    if-ge v3, v2, :cond_0

    .line 391
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLengths$okhttp()[J

    move-result-object v6

    aget-wide v6, v6, v3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    nop

    .line 394
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setCurrentEditor$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 395
    iget v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    :goto_2
    if-ge v3, v2, :cond_2

    .line 396
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCleanFiles$okhttp()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnicoid/network238/okio/Path;

    invoke-static {v4, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    .line 397
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getDirtyFiles$okhttp()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnicoid/network238/okio/Path;

    invoke-static {v4, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 399
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private final readJournal()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, ", "

    .line 279
    const-string v1, "unexpected journal header: ["

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    .line 1129
    invoke-virtual {v2, v3}, Lnicoid/network238/okio/FileSystem;->source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v2

    .line 280
    :try_start_0
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v3

    .line 281
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v4

    .line 282
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v5

    .line 283
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v6

    .line 284
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v7

    .line 286
    sget-object v8, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->MAGIC:Ljava/lang/String;

    invoke-static {v8, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 287
    sget-object v8, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->VERSION_1:Ljava/lang/String;

    invoke-static {v8, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 288
    iget v8, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->appVersion:I

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 289
    iget v5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 290
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-gtz v5, :cond_3

    const/4 v0, 0x0

    .line 300
    :goto_0
    :try_start_1
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    .line 307
    :try_start_2
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    .line 310
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 311
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->rebuildJournal$okhttp()V

    goto :goto_1

    .line 313
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 314
    :cond_1
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->newJournalWriter()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    .line 316
    :goto_1
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v2, :cond_2

    .line 1136
    :try_start_3
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    .line 1128
    :cond_2
    :goto_2
    const/4 v0, 0x0

    goto :goto_3

    .line 292
    :cond_3
    :try_start_4
    new-instance v5, Ljava/io/IOException;

    .line 293
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 292
    invoke-direct {v5, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    if-eqz v2, :cond_4

    .line 1136
    :try_start_5
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v1

    .line 1128
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    if-nez v0, :cond_5

    return-void

    .line 1148
    :cond_5
    throw v0
.end method

.method private final readJournalLine(Ljava/lang/String;)V
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 332
    move-object/from16 v0, p0

    const/16 v2, 0x20

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x6

    const/4 v6, 0x0

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v7

    const-string v8, "unexpected journal line: "

    const/4 v9, -0x1

    if-eq v7, v9, :cond_6

    add-int/lit8 v3, v7, 0x1

    .line 336
    const/16 v2, 0x20

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v2

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-ne v2, v9, :cond_0

    .line 339
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 340
    sget-object v10, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->REMOVE:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-ne v7, v11, :cond_1

    invoke-static {v1, v10, v6, v4, v5}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 341
    iget-object v1, v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v3}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 345
    :cond_0
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 348
    :cond_1
    iget-object v10, v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v10, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    if-nez v10, :cond_2

    .line 350
    new-instance v10, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-direct {v10, v0, v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;)V

    .line 351
    iget-object v11, v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-interface {v11, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    if-eq v2, v9, :cond_3

    .line 355
    sget-object v3, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->CLEAN:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v11

    if-ne v7, v11, :cond_3

    invoke-static {v1, v3, v6, v4, v5}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    add-int/2addr v2, v3

    .line 358
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 359
    new-array v12, v3, [C

    const/16 v1, 0x20

    aput-char v1, v12, v6

    const/4 v15, 0x6

    const/16 v16, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static/range {v11 .. v16}, Lnicoid/network238/kotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 360
    invoke-virtual {v10, v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setReadable$okhttp(Z)V

    .line 361
    invoke-virtual {v10, v5}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setCurrentEditor$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 362
    invoke-virtual {v10, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setLengths$okhttp(Ljava/util/List;)V

    return-void

    :cond_3
    if-ne v2, v9, :cond_4

    .line 365
    sget-object v3, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->DIRTY:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v11

    if-ne v7, v11, :cond_4

    invoke-static {v1, v3, v6, v4, v5}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 366
    new-instance v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    invoke-direct {v1, v0, v10}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)V

    invoke-virtual {v10, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setCurrentEditor$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    return-void

    :cond_4
    if-ne v2, v9, :cond_5

    .line 369
    sget-object v2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->READ:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v7, v3, :cond_5

    invoke-static {v1, v2, v6, v4, v5}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    return-void

    .line 374
    :cond_5
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 333
    :cond_6
    move-object/from16 v1, p1

    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private final removeOldestEntry()Z
    .registers 4

    .line 739
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    .line 740
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getZombie$okhttp()Z

    move-result v2

    if-nez v2, :cond_0

    .line 741
    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private final validateKey(Ljava/lang/String;)V
    .registers 4

    .line 774
    sget-object v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->LEGAL_KEY_PATTERN:Lnicoid/network238/kotlin/text/Regex;

    invoke-virtual {v0, p1}, Lnicoid/network238/kotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "keys must match regex [a-z0-9_-]{1,120}: \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x22

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 711
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z

    if-nez v0, :cond_3

    .line 717
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1188
    const/4 v2, 0x0

    new-array v3, v2, [Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-interface {v0, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 717
    check-cast v0, [Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    array-length v3, v0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 718
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 719
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->detach$okhttp()V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 723
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->trimToSize()V

    .line 724
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    if-eqz v0, :cond_2

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 725
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    .line 726
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    nop

    .line 712
    :try_start_1
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 710
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public final declared-synchronized completeEdit$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Z)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 551
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->getEntry$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    move-result-object v0

    .line 552
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v1

    invoke-static {v1, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const/4 v1, 0x0

    if-eqz p2, :cond_2

    .line 555
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getReadable$okhttp()Z

    move-result v2

    if-nez v2, :cond_2

    .line 556
    iget v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_2

    .line 557
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->getWritten$okhttp()[Z

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_1

    .line 561
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getDirtyFiles$okhttp()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnicoid/network238/okio/Path;

    invoke-virtual {v4, v5}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 562
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->abort()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 558
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->abort()V

    .line 559
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Newly created entry didn\'t create value for index "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    nop

    .line 568
    iget p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    :goto_1
    if-ge v1, p1, :cond_6

    .line 569
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getDirtyFiles$okhttp()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/Path;

    if-eqz p2, :cond_4

    .line 570
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getZombie$okhttp()Z

    move-result v3

    if-nez v3, :cond_4

    .line 571
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v3, v2}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 572
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCleanFiles$okhttp()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/Path;

    .line 573
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v4, v2, v3}, Lnicoid/network238/okio/FileSystem;->atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V

    .line 574
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLengths$okhttp()[J

    move-result-object v2

    aget-wide v4, v2, v1

    .line 576
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {v2, v3}, Lnicoid/network238/okio/FileSystem;->metadata(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/FileMetadata;->getSize()Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_2

    :cond_3
    const-wide/16 v2, 0x0

    .line 577
    :goto_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLengths$okhttp()[J

    move-result-object v6

    aput-wide v2, v6, v1

    .line 578
    iget-wide v6, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    sub-long/2addr v6, v4

    add-long/2addr v6, v2

    iput-wide v6, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    goto :goto_3

    .line 581
    :cond_4
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-static {v3, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    :cond_5
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    nop

    .line 585
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setCurrentEditor$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    .line 586
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getZombie$okhttp()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 587
    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 591
    :cond_7
    :try_start_2
    iget p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    const/4 v1, 0x1

    add-int/2addr p1, v1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    .line 592
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 593
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getReadable$okhttp()Z

    move-result v2

    const/16 v3, 0xa

    const/16 v4, 0x20

    if-nez v2, :cond_8

    if-nez p2, :cond_8

    .line 603
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 604
    sget-object p2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->REMOVE:Ljava/lang/String;

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p2

    invoke-interface {p2, v4}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 605
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 606
    invoke-interface {p1, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto :goto_4

    :cond_8
    nop

    .line 594
    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setReadable$okhttp(Z)V

    .line 595
    sget-object v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->CLEAN:Ljava/lang/String;

    invoke-interface {p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v4}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 596
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 597
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->writeLengths$okhttp(Lnicoid/network238/okio/BufferedSink;)V

    .line 598
    invoke-interface {p1, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    if-eqz p2, :cond_9

    .line 600
    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->nextSequenceNumber:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    iput-wide v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->nextSequenceNumber:J

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setSequenceNumber$okhttp(J)V

    .line 608
    :cond_9
    :goto_4
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 611
    iget-wide p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->maxSize:J

    cmp-long p1, p1, v0

    if-gtz p1, :cond_a

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez p1, :cond_a

    monitor-exit p0

    return-void

    .line 612
    :cond_a
    :try_start_3
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    .line 552
    :cond_b
    :try_start_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Check failed."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 550
    :goto_5
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_5
.end method

.method public final delete()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 754
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->close()V

    .line 755
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->directory:Lnicoid/network238/okio/Path;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteContents(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    return-void
.end method

.method public final edit(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->edit$default(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;JILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object p1

    return-object p1
.end method

.method public final declared-synchronized edit(Ljava/lang/String;J)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 483
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 485
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->checkNotClosed()V

    .line 486
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 487
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    .line 488
    sget-wide v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->ANY_SEQUENCE_NUMBER:J

    cmp-long v1, p2, v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    if-eqz v0, :cond_3

    .line 489
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getSequenceNumber$okhttp()J

    move-result-wide v3

    cmp-long p2, v3, p2

    if-eqz p2, :cond_0

    goto :goto_1

    :cond_0
    if-eqz v0, :cond_1

    .line 494
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object p2

    goto :goto_0

    :cond_1
    move-object p2, v2

    :goto_0
    if-nez p2, :cond_3

    if-eqz v0, :cond_2

    .line 498
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLockingSourceCount$okhttp()I

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_1

    .line 502
    :cond_2
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentTrimFailed:Z

    if-nez p2, :cond_6

    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentRebuildFailed:Z

    if-nez p2, :cond_6

    .line 513
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 515
    sget-object p3, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->DIRTY:Ljava/lang/String;

    invoke-interface {p2, p3}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p3

    .line 516
    const/16 v1, 0x20

    invoke-interface {p3, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    move-result-object p3

    .line 517
    invoke-interface {p3, p1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p3

    .line 518
    const/16 v1, 0xa

    invoke-interface {p3, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 519
    invoke-interface {p2}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 521
    iget-boolean p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->hasJournalErrors:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_4

    :cond_3
    :goto_1
    monitor-exit p0

    return-object v2

    :cond_4
    if-nez v0, :cond_5

    .line 526
    :try_start_1
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;)V

    .line 527
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    :cond_5
    new-instance p1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    invoke-direct {p1, p0, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)V

    .line 530
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setCurrentEditor$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    .line 508
    :cond_6
    :try_start_2
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    const/4 v7, 0x2

    const/4 v8, 0x0

    const-wide/16 v5, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v2

    .line 482
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_2
.end method

.method public final declared-synchronized evictAll()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 765
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 767
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1190
    const/4 v1, 0x0

    new-array v2, v1, [Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 767
    check-cast v0, [Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 768
    invoke-virtual {p0, v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 770
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentTrimFailed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 764
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 698
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    .line 700
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->checkNotClosed()V

    .line 701
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->trimToSize()V

    .line 702
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 697
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized get(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 455
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 457
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->checkNotClosed()V

    .line 458
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 459
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    if-nez v0, :cond_0

    goto :goto_0

    .line 460
    :cond_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->snapshot$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    :goto_0
    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    .line 462
    :cond_1
    :try_start_1
    iget v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    .line 463
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 464
    sget-object v2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->READ:Ljava/lang/String;

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    .line 465
    const/16 v2, 0x20

    invoke-interface {v1, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    .line 466
    invoke-interface {v1, p1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    .line 467
    const/16 v1, 0xa

    invoke-interface {p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 468
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 469
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const-wide/16 v3, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-object v0

    .line 454
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_1
.end method

.method public final getClosed$okhttp()Z
    .registers 2

    .line 176
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z

    return v0
.end method

.method public final getDirectory()Lnicoid/network238/okio/Path;
    .registers 2

    .line 91
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->directory:Lnicoid/network238/okio/Path;

    return-object v0
.end method

.method public final getFileSystem$okhttp()Lnicoid/network238/okio/FileSystem;
    .registers 2

    .line 101
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    return-object v0
.end method

.method public final getLruEntries$okhttp()Ljava/util/LinkedHashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
            ">;"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public final declared-synchronized getMaxSize()J
    .registers 3

    monitor-enter p0

    .line 116
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->maxSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 116
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final getValueCount$okhttp()I
    .registers 2

    .line 93
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    return v0
.end method

.method public final declared-synchronized initialize()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 1124
    :try_start_0
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1125
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 232
    :cond_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    monitor-exit p0

    return-void

    .line 237
    :cond_1
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 239
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v0

    .line 242
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    if-eqz v0, :cond_2

    .line 240
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    invoke-virtual {v1, v0}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;)V

    goto :goto_0

    .line 242
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v1, v0, v2}, Lnicoid/network238/okio/FileSystem;->atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V

    .line 246
    :cond_3
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->isCivilized(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->civilizedFileSystem:Z

    .line 249
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v1, 0x1

    if-eqz v0, :cond_4

    .line 251
    :try_start_2
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->readJournal()V

    .line 252
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->processJournal()V

    .line 253
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    .line 256
    :try_start_3
    sget-object v2, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v2

    .line 257
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "DiskLruCache "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->directory:Lnicoid/network238/okio/Path;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is corrupt: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", removing"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 256
    const/4 v4, 0x5

    invoke-virtual {v2, v3, v4, v0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 266
    const/4 v0, 0x0

    :try_start_4
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->delete()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 268
    :try_start_5
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z

    goto :goto_1

    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z

    throw v1

    .line 272
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->rebuildJournal$okhttp()V

    .line 274
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    monitor-exit p0

    return-void

    .line 231
    :goto_2
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2
.end method

.method public final declared-synchronized isClosed()Z
    .registers 2

    monitor-enter p0

    .line 705
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 705
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized rebuildJournal$okhttp()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 411
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->close()V

    .line 413
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileTmp:Lnicoid/network238/okio/Path;

    .line 1153
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;Z)Lnicoid/network238/okio/Sink;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 414
    :try_start_1
    sget-object v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->MAGIC:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    const/16 v3, 0xa

    invoke-interface {v1, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 415
    sget-object v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->VERSION_1:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 416
    iget v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->appVersion:I

    int-to-long v4, v1

    invoke-interface {v0, v4, v5}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 417
    iget v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    int-to-long v4, v1

    invoke-interface {v0, v4, v5}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 418
    invoke-interface {v0, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 420
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v4, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    .line 421
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v5

    const/16 v6, 0x20

    if-eqz v5, :cond_1

    .line 422
    sget-object v5, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->DIRTY:Ljava/lang/String;

    invoke-interface {v0, v5}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v5

    invoke-interface {v5, v6}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 423
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 424
    invoke-interface {v0, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto :goto_1

    .line 426
    :cond_1
    sget-object v5, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->CLEAN:Ljava/lang/String;

    invoke-interface {v0, v5}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v5

    invoke-interface {v5, v6}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 427
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 428
    invoke-virtual {v4, v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->writeLengths$okhttp(Lnicoid/network238/okio/BufferedSink;)V

    .line 429
    invoke-interface {v0, v3}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    :goto_1
    goto :goto_0

    .line 432
    :cond_2
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v0, :cond_3

    .line 1160
    :try_start_2
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_4

    .line 1179
    :cond_3
    :goto_2
    const/4 v0, 0x0

    goto :goto_4

    .line 1160
    :catchall_1
    move-exception v1

    if-eqz v0, :cond_4

    :try_start_3
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v0

    .line 1179
    :try_start_4
    invoke-static {v1, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    move-object v0, v1

    :goto_4
    if-nez v0, :cond_7

    .line 434
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v0

    .line 439
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    if-eqz v0, :cond_5

    .line 435
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    invoke-virtual {v1, v0, v3}, Lnicoid/network238/okio/FileSystem;->atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V

    .line 436
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileTmp:Lnicoid/network238/okio/Path;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v0, v1, v3}, Lnicoid/network238/okio/FileSystem;->atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V

    .line 437
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileBackup:Lnicoid/network238/okio/Path;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    goto :goto_5

    .line 439
    :cond_5
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFileTmp:Lnicoid/network238/okio/Path;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalFile:Lnicoid/network238/okio/Path;

    invoke-virtual {v1, v0, v3}, Lnicoid/network238/okio/FileSystem;->atomicMove(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V

    .line 442
    :goto_5
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    if-eqz v0, :cond_6

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 443
    :cond_6
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->newJournalWriter()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    .line 444
    iput-boolean v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->hasJournalErrors:Z

    .line 445
    iput-boolean v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentRebuildFailed:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    monitor-exit p0

    return-void

    .line 1184
    :cond_7
    :try_start_5
    throw v0

    .line 410
    :goto_6
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v0

    :catchall_3
    move-exception v0

    goto :goto_6
.end method

.method public final declared-synchronized remove(Ljava/lang/String;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 635
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 637
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->checkNotClosed()V

    .line 638
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 639
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    monitor-exit p0

    return v0

    .line 640
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 641
    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->maxSize:J

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentTrimFailed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return p1

    .line 634
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public final removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 649
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->civilizedFileSystem:Z

    const/16 v1, 0xa

    const/16 v2, 0x20

    const/4 v3, 0x1

    if-nez v0, :cond_2

    .line 650
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLockingSourceCount$okhttp()I

    move-result v0

    if-lez v0, :cond_0

    .line 652
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    if-eqz v0, :cond_0

    .line 653
    sget-object v4, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->DIRTY:Ljava/lang/String;

    invoke-interface {v0, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 654
    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 655
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 656
    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 657
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    .line 660
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLockingSourceCount$okhttp()I

    move-result v0

    if-gtz v0, :cond_1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 661
    :cond_1
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setZombie$okhttp(Z)V

    return v3

    .line 666
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->detach$okhttp()V

    .line 668
    :cond_3
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->valueCount:I

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v0, :cond_4

    .line 669
    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->fileSystem:Lnicoid/network238/okio/FileSystem;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCleanFiles$okhttp()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnicoid/network238/okio/Path;

    invoke-static {v5, v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    .line 670
    iget-wide v5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLengths$okhttp()[J

    move-result-object v7

    aget-wide v7, v7, v4

    sub-long/2addr v5, v7

    iput-wide v5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    .line 671
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getLengths$okhttp()[J

    move-result-object v5

    const-wide/16 v6, 0x0

    aput-wide v6, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 674
    :cond_4
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    add-int/2addr v0, v3

    iput v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->redundantOpCount:I

    .line 675
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalWriter:Lnicoid/network238/okio/BufferedSink;

    if-eqz v0, :cond_5

    .line 676
    sget-object v4, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->REMOVE:Ljava/lang/String;

    invoke-interface {v0, v4}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 677
    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 678
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 679
    invoke-interface {v0, v1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 681
    :cond_5
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getKey$okhttp()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 684
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    const/4 v8, 0x2

    const/4 v9, 0x0

    const-wide/16 v6, 0x0

    invoke-static/range {v4 .. v9}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V

    :cond_6
    return v3
.end method

.method public final setClosed$okhttp(Z)V
    .registers 2

    .line 176
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->closed:Z

    return-void
.end method

.method public final declared-synchronized setMaxSize(J)V
    .registers 9

    monitor-enter p0

    .line 118
    :try_start_0
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->maxSize:J

    .line 119
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialized:Z

    if-eqz p1, :cond_0

    .line 120
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->cleanupTask:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$cleanupTask$1;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    .line 117
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_0
.end method

.method public final declared-synchronized size()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 541
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 542
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 540
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized snapshots()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 793
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->initialize()V

    .line 794
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$snapshots$1;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 792
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final trimToSize()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 731
    :cond_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->size:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->maxSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 732
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeOldestEntry()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_1
    nop

    .line 734
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->mostRecentTrimFailed:Z

    return-void
.end method
