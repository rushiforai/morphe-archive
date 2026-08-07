.class public final Ll/tgr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public b:Z

.field public c:I

.field public d:J

.field public e:I

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Ll/tgr0;->a:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/sgr0;Ll/ggr0;)V
    .locals 8
    .param p2    # Ll/ggr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/tgr0;->c:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-wide v2, p0, Ll/tgr0;->d:J

    .line 6
    .line 7
    iget v4, p0, Ll/tgr0;->e:I

    .line 8
    .line 9
    iget v5, p0, Ll/tgr0;->f:I

    .line 10
    .line 11
    iget v6, p0, Ll/tgr0;->g:I

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    move-object v7, p2

    .line 15
    invoke-interface/range {v1 .. v7}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Ll/tgr0;->c:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tgr0;->b:Z

    .line 3
    .line 4
    iput v0, p0, Ll/tgr0;->c:I

    .line 5
    .line 6
    return-void
.end method

.method public final c(Ll/sgr0;JIIILl/ggr0;)V
    .locals 2
    .param p7    # Ll/ggr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/tgr0;->g:I

    .line 2
    .line 3
    add-int v1, p5, p6

    .line 4
    .line 5
    if-gt v0, v1, :cond_3

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/tgr0;->b:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Ll/tgr0;->c:I

    .line 13
    .line 14
    add-int/lit8 v1, v0, 0x1

    .line 15
    .line 16
    iput v1, p0, Ll/tgr0;->c:I

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iput-wide p2, p0, Ll/tgr0;->d:J

    .line 21
    .line 22
    iput p4, p0, Ll/tgr0;->e:I

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    iput p2, p0, Ll/tgr0;->f:I

    .line 26
    .line 27
    :cond_1
    iget p2, p0, Ll/tgr0;->f:I

    .line 28
    .line 29
    add-int/2addr p2, p5

    .line 30
    iput p2, p0, Ll/tgr0;->f:I

    .line 31
    .line 32
    iput p6, p0, Ll/tgr0;->g:I

    .line 33
    .line 34
    const/16 p2, 0x10

    .line 35
    .line 36
    if-lt v1, p2, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1, p7}, Ll/tgr0;->a(Ll/sgr0;Ll/ggr0;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void

    .line 42
    :cond_3
    const-string p0, "TrueHD chunk samples must be contiguous in the sample queue."

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final d(Ll/qer0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/tgr0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/tgr0;->a:[B

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/16 v2, 0xa

    .line 10
    .line 11
    invoke-interface {p1, v0, v1, v2}, Ll/qer0;->i([BII)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/tgr0;->a:[B

    .line 18
    .line 19
    sget-object v0, Ll/fdr0;->a:[I

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    aget-byte v0, p1, v0

    .line 23
    .line 24
    const/4 v1, -0x8

    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x5

    .line 28
    aget-byte v0, p1, v0

    .line 29
    .line 30
    const/16 v1, 0x72

    .line 31
    .line 32
    if-ne v0, v1, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x6

    .line 35
    aget-byte v0, p1, v0

    .line 36
    .line 37
    const/16 v1, 0x6f

    .line 38
    .line 39
    if-ne v0, v1, :cond_1

    .line 40
    .line 41
    const/4 v0, 0x7

    .line 42
    aget-byte p1, p1, v0

    .line 43
    .line 44
    and-int/lit16 p1, p1, 0xfe

    .line 45
    .line 46
    const/16 v0, 0xba

    .line 47
    .line 48
    if-ne p1, v0, :cond_1

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    iput-boolean p1, p0, Ll/tgr0;->b:Z

    .line 52
    .line 53
    :cond_1
    :goto_0
    return-void
.end method
