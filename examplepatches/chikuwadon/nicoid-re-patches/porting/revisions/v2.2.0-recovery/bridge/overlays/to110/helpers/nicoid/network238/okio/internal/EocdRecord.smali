.class final Lnicoid/network238/okio/internal/EocdRecord;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0008\u0002\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/EocdRecord;",
        "",
        "entryCount",
        "",
        "centralDirectoryOffset",
        "commentByteCount",
        "",
        "<init>",
        "(JJI)V",
        "getEntryCount",
        "()J",
        "getCentralDirectoryOffset",
        "getCommentByteCount",
        "()I",
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


# instance fields
.field private final centralDirectoryOffset:J

.field private final commentByteCount:I

.field private final entryCount:J


# direct methods
.method public constructor <init>(JJI)V
    .registers 6

    .line 495
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 496
    iput-wide p1, p0, Lnicoid/network238/okio/internal/EocdRecord;->entryCount:J

    .line 497
    iput-wide p3, p0, Lnicoid/network238/okio/internal/EocdRecord;->centralDirectoryOffset:J

    .line 498
    iput p5, p0, Lnicoid/network238/okio/internal/EocdRecord;->commentByteCount:I

    return-void
.end method


# virtual methods
.method public final getCentralDirectoryOffset()J
    .registers 3

    .line 497
    iget-wide v0, p0, Lnicoid/network238/okio/internal/EocdRecord;->centralDirectoryOffset:J

    return-wide v0
.end method

.method public final getCommentByteCount()I
    .registers 2

    .line 498
    iget v0, p0, Lnicoid/network238/okio/internal/EocdRecord;->commentByteCount:I

    return v0
.end method

.method public final getEntryCount()J
    .registers 3

    .line 496
    iget-wide v0, p0, Lnicoid/network238/okio/internal/EocdRecord;->entryCount:J

    return-wide v0
.end method
