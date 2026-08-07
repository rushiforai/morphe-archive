.class public final Ll/smr0;
.super Ljava/io/OutputStream;
.source "SourceFile"


# instance fields
.field public a:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/smr0;->a:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final k()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/smr0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final write(I)V
    .locals 4

    .line 25
    iget-wide v0, p0, Ll/smr0;->a:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Ll/smr0;->a:J

    return-void
.end method

.method public final write([B)V
    .locals 4

    .line 24
    iget-wide v0, p0, Ll/smr0;->a:J

    array-length p1, p1

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Ll/smr0;->a:J

    return-void
.end method

.method public final write([BII)V
    .locals 2
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    array-length p1, p1

    .line 4
    if-gt p2, p1, :cond_0

    .line 5
    .line 6
    if-ltz p3, :cond_0

    .line 7
    .line 8
    add-int/2addr p2, p3

    .line 9
    if-gt p2, p1, :cond_0

    .line 10
    .line 11
    if-ltz p2, :cond_0

    .line 12
    .line 13
    iget-wide p1, p0, Ll/smr0;->a:J

    .line 14
    .line 15
    int-to-long v0, p3

    .line 16
    add-long/2addr p1, v0

    .line 17
    iput-wide p1, p0, Ll/smr0;->a:J

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Ll/onl;->a()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
