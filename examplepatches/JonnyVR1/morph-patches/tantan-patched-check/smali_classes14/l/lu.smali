.class public abstract Ll/lu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vv$a;


# instance fields
.field public a:I

.field public b:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/lu;->a:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/lu;->b:J

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
            to = 0x167L
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/lu;->b:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-virtual {p0}, Ll/lu;->d()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget v0, p0, Ll/lu;->a:I

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-eq v0, v1, :cond_2

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    :goto_0
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0, p1}, Ll/lu;->g(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-virtual {p0, p1}, Ll/lu;->e(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    invoke-virtual {p0, p1}, Ll/lu;->f(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public abstract b()V
.end method

.method public abstract c()V
.end method

.method public d()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public final e(I)V
    .locals 2

    .line 1
    const/16 v0, 0x122

    .line 2
    .line 3
    if-le p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Ll/lu;->a:I

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Ll/lu;->b:J

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/lu;->i()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/16 v0, 0x6e

    .line 19
    .line 20
    if-gt p1, v0, :cond_1

    .line 21
    .line 22
    const/4 p1, 0x2

    .line 23
    iput p1, p0, Ll/lu;->a:I

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Ll/lu;->b:J

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/lu;->b()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final f(I)V
    .locals 2

    .line 1
    const/16 v0, 0x122

    .line 2
    .line 3
    const/16 v1, 0xb4

    .line 4
    .line 5
    if-gt p1, v0, :cond_0

    .line 6
    .line 7
    if-le p1, v1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Ll/lu;->a:I

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Ll/lu;->b:J

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/lu;->h()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/16 v0, 0x46

    .line 23
    .line 24
    if-lt p1, v0, :cond_1

    .line 25
    .line 26
    if-ge p1, v1, :cond_1

    .line 27
    .line 28
    const/4 p1, 0x2

    .line 29
    iput p1, p0, Ll/lu;->a:I

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    iput-wide v0, p0, Ll/lu;->b:J

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/lu;->j()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final g(I)V
    .locals 2

    .line 1
    const/16 v0, 0x46

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Ll/lu;->a:I

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Ll/lu;->b:J

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/lu;->i()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/16 v0, 0xfa

    .line 19
    .line 20
    if-lt p1, v0, :cond_1

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput p1, p0, Ll/lu;->a:I

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Ll/lu;->b:J

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/lu;->c()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public abstract h()V
.end method

.method public abstract i()V
.end method

.method public abstract j()V
.end method
