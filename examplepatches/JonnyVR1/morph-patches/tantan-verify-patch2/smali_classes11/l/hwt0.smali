.class public final Ll/hwt0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Ljava/lang/String;

.field public static final i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;

.field public static final m:Ll/mhy0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public a:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:I

.field public d:J

.field public e:J

.field public f:Z

.field public g:Ll/e4u0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x24

    .line 3
    .line 4
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/hwt0;->h:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/hwt0;->i:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Ll/hwt0;->j:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/hwt0;->k:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Ll/hwt0;->l:Ljava/lang/String;

    .line 37
    .line 38
    sget-object v0, Ll/zut0;->a:Ll/zut0;

    .line 39
    .line 40
    sput-object v0, Ll/hwt0;->m:Ll/mhy0;

    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/e4u0;->e:Ll/e4u0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Ll/p5t0;->b:I

    .line 8
    .line 9
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    iget p0, p0, Ll/e4u0;->a:I

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public final c(J)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public final d(J)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/e4u0;->b(I)Z

    .line 5
    .line 6
    .line 7
    return p1
.end method

.method public final e(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, -0x1

    .line 8
    invoke-virtual {p0, p1}, Ll/p5t0;->a(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/hwt0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    check-cast p1, Ll/hwt0;

    .line 22
    .line 23
    iget-object v2, p0, Ll/hwt0;->a:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v3, p1, Ll/hwt0;->a:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {v2, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    iget-object v2, p0, Ll/hwt0;->b:Ljava/lang/Object;

    .line 34
    .line 35
    iget-object v3, p1, Ll/hwt0;->b:Ljava/lang/Object;

    .line 36
    .line 37
    invoke-static {v2, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    iget v2, p0, Ll/hwt0;->c:I

    .line 44
    .line 45
    iget v3, p1, Ll/hwt0;->c:I

    .line 46
    .line 47
    if-ne v2, v3, :cond_2

    .line 48
    .line 49
    iget-wide v2, p0, Ll/hwt0;->d:J

    .line 50
    .line 51
    iget-wide v4, p1, Ll/hwt0;->d:J

    .line 52
    .line 53
    cmp-long v2, v2, v4

    .line 54
    .line 55
    if-nez v2, :cond_2

    .line 56
    .line 57
    iget-boolean v2, p0, Ll/hwt0;->f:Z

    .line 58
    .line 59
    iget-boolean v3, p1, Ll/hwt0;->f:Z

    .line 60
    .line 61
    if-ne v2, v3, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 64
    .line 65
    iget-object p1, p1, Ll/hwt0;->g:Ll/e4u0;

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    :goto_0
    return v1
.end method

.method public final f(II)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2}, Ll/p5t0;->a(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    iget p0, p0, Ll/e4u0;->c:I

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public final h(II)J
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p1, p0, Ll/p5t0;->b:I

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/p5t0;->f:[J

    .line 13
    .line 14
    aget-wide p1, p0, p2

    .line 15
    .line 16
    return-wide p1

    .line 17
    :cond_0
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    return-wide p0
.end method

.method public final hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hwt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    :goto_0
    iget-object v2, p0, Ll/hwt0;->b:Ljava/lang/Object;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    :goto_1
    add-int/lit16 v0, v0, 0xd9

    .line 22
    .line 23
    mul-int/lit8 v0, v0, 0x1f

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    mul-int/lit8 v0, v0, 0x1f

    .line 27
    .line 28
    iget v1, p0, Ll/hwt0;->c:I

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    iget-wide v1, p0, Ll/hwt0;->d:J

    .line 32
    .line 33
    const/16 v3, 0x20

    .line 34
    .line 35
    ushr-long v3, v1, v3

    .line 36
    .line 37
    xor-long/2addr v1, v3

    .line 38
    mul-int/lit8 v0, v0, 0x1f

    .line 39
    .line 40
    long-to-int v1, v1

    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit16 v0, v0, 0x3c1

    .line 43
    .line 44
    iget-boolean v1, p0, Ll/hwt0;->f:Z

    .line 45
    .line 46
    add-int/2addr v0, v1

    .line 47
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 48
    .line 49
    mul-int/lit8 v0, v0, 0x1f

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/e4u0;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    add-int/2addr v0, p0

    .line 56
    return v0
.end method

.method public final i(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-wide p0, p0, Ll/p5t0;->a:J

    .line 8
    .line 9
    const-wide/16 p0, 0x0

    .line 10
    .line 11
    return-wide p0
.end method

.method public final j()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/e4u0;->b:J

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0
.end method

.method public final k(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-wide p0, p0, Ll/p5t0;->g:J

    .line 8
    .line 9
    const-wide/16 p0, 0x0

    .line 10
    .line 11
    return-wide p0
.end method

.method public final l(Ljava/lang/Object;Ljava/lang/Object;IJJLl/e4u0;Z)Ll/hwt0;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/hwt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hwt0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iput p3, p0, Ll/hwt0;->c:I

    .line 6
    .line 7
    iput-wide p4, p0, Ll/hwt0;->d:J

    .line 8
    .line 9
    const-wide/16 p1, 0x0

    .line 10
    .line 11
    iput-wide p1, p0, Ll/hwt0;->e:J

    .line 12
    .line 13
    iput-object p8, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 14
    .line 15
    iput-boolean p9, p0, Ll/hwt0;->f:Z

    .line 16
    .line 17
    return-object p0
.end method

.method public final m(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hwt0;->b()I

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/e4u0;->b(I)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final n(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwt0;->g:Ll/e4u0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e4u0;->a(I)Ll/p5t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Ll/p5t0;->h:Z

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method
