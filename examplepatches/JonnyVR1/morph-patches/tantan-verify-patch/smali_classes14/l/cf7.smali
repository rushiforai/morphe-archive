.class public Ll/cf7;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:J

.field public S:J

.field public T:I

.field public U:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/cf7;->R:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/cf7;->S:J

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Ll/cf7;->T:I

    .line 12
    .line 13
    iput p1, p0, Ll/cf7;->U:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a3(J)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/cf7;->S:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-lez v2, :cond_0

    .line 8
    .line 9
    sub-long/2addr p1, v0

    .line 10
    return-wide p1

    .line 11
    :cond_0
    iget-wide v0, p0, Ll/cf7;->R:J

    .line 12
    .line 13
    sub-long/2addr p1, v0

    .line 14
    return-wide p1
.end method
