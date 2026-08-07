.class public final Ll/mkc0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/lang/String;

.field public d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;JJ)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p1, ""

    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/mkc0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-wide p2, p0, Ll/mkc0;->a:J

    .line 11
    .line 12
    iput-wide p4, p0, Ll/mkc0;->b:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ll/mkc0;Ljava/lang/String;)Ll/mkc0;
    .locals 12
    .param p1    # Ll/mkc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/mkc0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/mkc0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_3

    .line 19
    :cond_0
    iget-wide v2, p0, Ll/mkc0;->b:J

    .line 20
    .line 21
    const-wide/16 v4, -0x1

    .line 22
    .line 23
    cmp-long p2, v2, v4

    .line 24
    .line 25
    move-wide v6, v2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    iget-wide v2, p0, Ll/mkc0;->a:J

    .line 29
    .line 30
    add-long v8, v2, v6

    .line 31
    .line 32
    iget-wide v10, p1, Ll/mkc0;->a:J

    .line 33
    .line 34
    cmp-long p2, v8, v10

    .line 35
    .line 36
    if-nez p2, :cond_2

    .line 37
    .line 38
    new-instance v0, Ll/mkc0;

    .line 39
    .line 40
    iget-wide p0, p1, Ll/mkc0;->b:J

    .line 41
    .line 42
    cmp-long p2, p0, v4

    .line 43
    .line 44
    if-nez p2, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    add-long v4, v6, p0

    .line 48
    .line 49
    :goto_0
    invoke-direct/range {v0 .. v5}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_2
    iget-wide v2, p1, Ll/mkc0;->b:J

    .line 54
    .line 55
    cmp-long p2, v2, v4

    .line 56
    .line 57
    if-eqz p2, :cond_4

    .line 58
    .line 59
    iget-wide p1, p1, Ll/mkc0;->a:J

    .line 60
    .line 61
    add-long v8, p1, v2

    .line 62
    .line 63
    iget-wide v10, p0, Ll/mkc0;->a:J

    .line 64
    .line 65
    cmp-long p0, v8, v10

    .line 66
    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    new-instance v0, Ll/mkc0;

    .line 70
    .line 71
    cmp-long p0, v6, v4

    .line 72
    .line 73
    if-nez p0, :cond_3

    .line 74
    .line 75
    :goto_1
    move-wide v2, p1

    .line 76
    goto :goto_2

    .line 77
    :cond_3
    add-long v4, v2, v6

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :goto_2
    invoke-direct/range {v0 .. v5}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 81
    .line 82
    .line 83
    :cond_4
    :goto_3
    return-object v0
.end method

.method public b(Ljava/lang/String;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkc0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/h4k0;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkc0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/h4k0;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
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
    const-class v2, Ll/mkc0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/mkc0;

    .line 18
    .line 19
    iget-wide v2, p0, Ll/mkc0;->a:J

    .line 20
    .line 21
    iget-wide v4, p1, Ll/mkc0;->a:J

    .line 22
    .line 23
    cmp-long v2, v2, v4

    .line 24
    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    iget-wide v2, p0, Ll/mkc0;->b:J

    .line 28
    .line 29
    iget-wide v4, p1, Ll/mkc0;->b:J

    .line 30
    .line 31
    cmp-long v2, v2, v4

    .line 32
    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Ll/mkc0;->c:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p1, p1, Ll/mkc0;->c:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget v0, p0, Ll/mkc0;->d:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Ll/mkc0;->a:J

    .line 6
    .line 7
    long-to-int v0, v0

    .line 8
    const/16 v1, 0x20f

    .line 9
    .line 10
    add-int/2addr v1, v0

    .line 11
    mul-int/lit8 v1, v1, 0x1f

    .line 12
    .line 13
    iget-wide v2, p0, Ll/mkc0;->b:J

    .line 14
    .line 15
    long-to-int v0, v2

    .line 16
    add-int/2addr v1, v0

    .line 17
    mul-int/lit8 v1, v1, 0x1f

    .line 18
    .line 19
    iget-object v0, p0, Ll/mkc0;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr v1, v0

    .line 26
    iput v1, p0, Ll/mkc0;->d:I

    .line 27
    .line 28
    :cond_0
    iget p0, p0, Ll/mkc0;->d:I

    .line 29
    .line 30
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RangedUri(referenceUri="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/mkc0;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", start="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Ll/mkc0;->a:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", length="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Ll/mkc0;->b:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, ")"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
