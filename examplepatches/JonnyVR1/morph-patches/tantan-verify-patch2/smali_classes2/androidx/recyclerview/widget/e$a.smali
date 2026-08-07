.class public Landroidx/recyclerview/widget/e$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:Landroidx/recyclerview/widget/e$a;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-lt p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sub-int/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e$a;->a(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void

    .line 14
    :cond_1
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 15
    .line 16
    const-wide/16 v2, 0x1

    .line 17
    .line 18
    shl-long/2addr v2, p1

    .line 19
    not-long v2, v2

    .line 20
    and-long/2addr v0, v2

    .line 21
    iput-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 22
    .line 23
    return-void
.end method

.method public b(I)I
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 2
    .line 3
    const/16 v1, 0x40

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-wide v4, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 10
    .line 11
    if-lt p1, v1, :cond_0

    .line 12
    .line 13
    invoke-static {v4, v5}, Ljava/lang/Long;->bitCount(J)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    shl-long p0, v2, p1

    .line 19
    .line 20
    sub-long/2addr p0, v2

    .line 21
    and-long/2addr p0, v4

    .line 22
    invoke-static {p0, p1}, Ljava/lang/Long;->bitCount(J)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    if-ge p1, v1, :cond_2

    .line 28
    .line 29
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 30
    .line 31
    shl-long p0, v2, p1

    .line 32
    .line 33
    sub-long/2addr p0, v2

    .line 34
    and-long/2addr p0, v0

    .line 35
    invoke-static {p0, p1}, Ljava/lang/Long;->bitCount(J)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    sub-int/2addr p1, v1

    .line 41
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/e$a;->b(I)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 46
    .line 47
    invoke-static {v0, v1}, Ljava/lang/Long;->bitCount(J)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    add-int/2addr p1, p0

    .line 52
    return p1
.end method

.method public final c()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/recyclerview/widget/e$a;

    .line 6
    .line 7
    invoke-direct {v0}, Landroidx/recyclerview/widget/e$a;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public d(I)Z
    .locals 4

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/e$a;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 9
    .line 10
    sub-int/2addr p1, v0

    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e$a;->d(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 17
    .line 18
    const-wide/16 v2, 0x1

    .line 19
    .line 20
    shl-long p0, v2, p1

    .line 21
    .line 22
    and-long/2addr p0, v0

    .line 23
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    cmp-long p0, p0, v0

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public e(IZ)V
    .locals 9

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/e$a;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 9
    .line 10
    sub-int/2addr p1, v0

    .line 11
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/e$a;->e(IZ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 16
    .line 17
    const-wide/high16 v2, -0x8000000000000000L

    .line 18
    .line 19
    and-long/2addr v2, v0

    .line 20
    const-wide/16 v4, 0x0

    .line 21
    .line 22
    cmp-long v2, v2, v4

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x1

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    move v2, v4

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v2, v3

    .line 31
    :goto_0
    const-wide/16 v5, 0x1

    .line 32
    .line 33
    shl-long v7, v5, p1

    .line 34
    .line 35
    sub-long/2addr v7, v5

    .line 36
    and-long v5, v0, v7

    .line 37
    .line 38
    not-long v7, v7

    .line 39
    and-long/2addr v0, v7

    .line 40
    shl-long/2addr v0, v4

    .line 41
    or-long/2addr v0, v5

    .line 42
    iput-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e$a;->h(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e$a;->a(I)V

    .line 51
    .line 52
    .line 53
    :goto_1
    if-nez v2, :cond_4

    .line 54
    .line 55
    iget-object p1, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_3
    return-void

    .line 61
    :cond_4
    :goto_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/e$a;->c()V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 65
    .line 66
    invoke-virtual {p0, v3, v2}, Landroidx/recyclerview/widget/e$a;->e(IZ)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public f(I)Z
    .locals 10

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/e$a;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 9
    .line 10
    sub-int/2addr p1, v0

    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e$a;->f(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const-wide/16 v0, 0x1

    .line 17
    .line 18
    shl-long v2, v0, p1

    .line 19
    .line 20
    iget-wide v4, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 21
    .line 22
    and-long v6, v4, v2

    .line 23
    .line 24
    const-wide/16 v8, 0x0

    .line 25
    .line 26
    cmp-long p1, v6, v8

    .line 27
    .line 28
    const/4 v6, 0x1

    .line 29
    const/4 v7, 0x0

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    move p1, v6

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move p1, v7

    .line 35
    :goto_0
    not-long v8, v2

    .line 36
    and-long/2addr v4, v8

    .line 37
    iput-wide v4, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 38
    .line 39
    sub-long/2addr v2, v0

    .line 40
    and-long v0, v4, v2

    .line 41
    .line 42
    not-long v2, v2

    .line 43
    and-long/2addr v2, v4

    .line 44
    invoke-static {v2, v3, v6}, Ljava/lang/Long;->rotateRight(JI)J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    or-long/2addr v0, v2

    .line 49
    iput-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 50
    .line 51
    iget-object v0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/e$a;->d(I)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    const/16 v0, 0x3f

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/e$a;->h(I)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 67
    .line 68
    invoke-virtual {p0, v7}, Landroidx/recyclerview/widget/e$a;->f(I)Z

    .line 69
    .line 70
    .line 71
    :cond_3
    return p1
.end method

.method public g()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/e$a;->g()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h(I)V
    .locals 4

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/e$a;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 9
    .line 10
    sub-int/2addr p1, v0

    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e$a;->h(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 16
    .line 17
    const-wide/16 v2, 0x1

    .line 18
    .line 19
    shl-long/2addr v2, p1

    .line 20
    or-long/2addr v0, v2

    .line 21
    iput-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 22
    .line 23
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Landroidx/recyclerview/widget/e$a;->b:Landroidx/recyclerview/widget/e$a;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroidx/recyclerview/widget/e$a;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, "xx"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-wide v1, p0, Landroidx/recyclerview/widget/e$a;->a:J

    .line 32
    .line 33
    invoke-static {v1, v2}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method
