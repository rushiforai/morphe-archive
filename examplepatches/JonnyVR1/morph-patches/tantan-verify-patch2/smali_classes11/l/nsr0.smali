.class public final Ll/nsr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/sgr0;

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:I

.field public f:I

.field public g:J

.field public h:J


# direct methods
.method public constructor <init>(Ll/sgr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nsr0;->a:Ll/sgr0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a([BII)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nsr0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    add-int/lit8 v0, p2, 0x1

    .line 6
    .line 7
    iget v1, p0, Ll/nsr0;->f:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    if-ge v0, p3, :cond_1

    .line 11
    .line 12
    aget-byte p1, p1, v0

    .line 13
    .line 14
    and-int/lit16 p1, p1, 0xc0

    .line 15
    .line 16
    shr-int/lit8 p1, p1, 0x6

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p1, p2

    .line 24
    :goto_0
    iput-boolean p1, p0, Ll/nsr0;->d:Z

    .line 25
    .line 26
    iput-boolean p2, p0, Ll/nsr0;->c:Z

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    sub-int/2addr p3, p2

    .line 30
    add-int/2addr v1, p3

    .line 31
    iput v1, p0, Ll/nsr0;->f:I

    .line 32
    .line 33
    :cond_2
    return-void
.end method

.method public final b(JIZ)V
    .locals 9

    .line 1
    iget-wide v0, p0, Ll/nsr0;->h:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/nsr0;->e:I

    .line 19
    .line 20
    const/16 v1, 0xb6

    .line 21
    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    if-eqz p4, :cond_1

    .line 25
    .line 26
    iget-boolean p4, p0, Ll/nsr0;->b:Z

    .line 27
    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    iget-wide v0, p0, Ll/nsr0;->g:J

    .line 31
    .line 32
    sub-long v0, p1, v0

    .line 33
    .line 34
    iget-boolean v5, p0, Ll/nsr0;->d:Z

    .line 35
    .line 36
    iget-object v2, p0, Ll/nsr0;->a:Ll/sgr0;

    .line 37
    .line 38
    iget-wide v3, p0, Ll/nsr0;->h:J

    .line 39
    .line 40
    long-to-int v6, v0

    .line 41
    const/4 v8, 0x0

    .line 42
    move v7, p3

    .line 43
    invoke-interface/range {v2 .. v8}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget p3, p0, Ll/nsr0;->e:I

    .line 47
    .line 48
    const/16 p4, 0xb3

    .line 49
    .line 50
    if-eq p3, p4, :cond_2

    .line 51
    .line 52
    iput-wide p1, p0, Ll/nsr0;->g:J

    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public final c(IJ)V
    .locals 4

    .line 1
    iput p1, p0, Ll/nsr0;->e:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ll/nsr0;->d:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/16 v2, 0xb6

    .line 8
    .line 9
    if-eq p1, v2, :cond_0

    .line 10
    .line 11
    const/16 v3, 0xb3

    .line 12
    .line 13
    if-ne p1, v3, :cond_1

    .line 14
    .line 15
    move p1, v3

    .line 16
    :cond_0
    move v3, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v3, v0

    .line 19
    :goto_0
    iput-boolean v3, p0, Ll/nsr0;->b:Z

    .line 20
    .line 21
    if-ne p1, v2, :cond_2

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    move v1, v0

    .line 25
    :goto_1
    iput-boolean v1, p0, Ll/nsr0;->c:Z

    .line 26
    .line 27
    iput v0, p0, Ll/nsr0;->f:I

    .line 28
    .line 29
    iput-wide p2, p0, Ll/nsr0;->h:J

    .line 30
    .line 31
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/nsr0;->b:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/nsr0;->c:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/nsr0;->d:Z

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/nsr0;->e:I

    .line 10
    .line 11
    return-void
.end method
