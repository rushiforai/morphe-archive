.class public Ll/fyx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:I

.field public final c:I

.field public final d:J

.field public final e:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2

    const-wide/16 v0, -0x1

    .line 28
    invoke-direct {p0, p1, v0, v1}, Ll/fyx;-><init>(Ljava/lang/Object;J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;IIJ)V
    .locals 7

    const/4 v6, -0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-wide v4, p4

    .line 27
    invoke-direct/range {v0 .. v6}, Ll/fyx;-><init>(Ljava/lang/Object;IIJI)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;IIJI)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 31
    iput p2, p0, Ll/fyx;->b:I

    .line 32
    iput p3, p0, Ll/fyx;->c:I

    .line 33
    iput-wide p4, p0, Ll/fyx;->d:J

    .line 34
    iput p6, p0, Ll/fyx;->e:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;J)V
    .locals 7

    const/4 v3, -0x1

    const/4 v6, -0x1

    const/4 v2, -0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v4, p2

    .line 25
    invoke-direct/range {v0 .. v6}, Ll/fyx;-><init>(Ljava/lang/Object;IIJI)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;JI)V
    .locals 7

    const/4 v2, -0x1

    const/4 v3, -0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v4, p2

    move v6, p4

    .line 26
    invoke-direct/range {v0 .. v6}, Ll/fyx;-><init>(Ljava/lang/Object;IIJI)V

    return-void
.end method

.method public constructor <init>(Ll/fyx;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object v0, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iget v0, p1, Ll/fyx;->b:I

    .line 9
    .line 10
    iput v0, p0, Ll/fyx;->b:I

    .line 11
    .line 12
    iget v0, p1, Ll/fyx;->c:I

    .line 13
    .line 14
    iput v0, p0, Ll/fyx;->c:I

    .line 15
    .line 16
    iget-wide v0, p1, Ll/fyx;->d:J

    .line 17
    .line 18
    iput-wide v0, p0, Ll/fyx;->d:J

    .line 19
    .line 20
    iget p1, p1, Ll/fyx;->e:I

    .line 21
    .line 22
    iput p1, p0, Ll/fyx;->e:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Ll/fyx;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v1, Ll/fyx;

    .line 11
    .line 12
    iget v3, p0, Ll/fyx;->b:I

    .line 13
    .line 14
    iget v4, p0, Ll/fyx;->c:I

    .line 15
    .line 16
    iget-wide v5, p0, Ll/fyx;->d:J

    .line 17
    .line 18
    iget v7, p0, Ll/fyx;->e:I

    .line 19
    .line 20
    move-object v2, p1

    .line 21
    invoke-direct/range {v1 .. v7}, Ll/fyx;-><init>(Ljava/lang/Object;IIJI)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method

.method public b()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/fyx;->b:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
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
    instance-of v1, p1, Ll/fyx;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/fyx;

    .line 12
    .line 13
    iget-object v1, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object v3, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget v1, p0, Ll/fyx;->b:I

    .line 24
    .line 25
    iget v3, p1, Ll/fyx;->b:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget v1, p0, Ll/fyx;->c:I

    .line 30
    .line 31
    iget v3, p1, Ll/fyx;->c:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-wide v3, p0, Ll/fyx;->d:J

    .line 36
    .line 37
    iget-wide v5, p1, Ll/fyx;->d:J

    .line 38
    .line 39
    cmp-long v1, v3, v5

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    iget p0, p0, Ll/fyx;->e:I

    .line 44
    .line 45
    iget p1, p1, Ll/fyx;->e:I

    .line 46
    .line 47
    if-ne p0, p1, :cond_2

    .line 48
    .line 49
    return v0

    .line 50
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x20f

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    mul-int/lit8 v1, v1, 0x1f

    .line 11
    .line 12
    iget v0, p0, Ll/fyx;->b:I

    .line 13
    .line 14
    add-int/2addr v1, v0

    .line 15
    mul-int/lit8 v1, v1, 0x1f

    .line 16
    .line 17
    iget v0, p0, Ll/fyx;->c:I

    .line 18
    .line 19
    add-int/2addr v1, v0

    .line 20
    mul-int/lit8 v1, v1, 0x1f

    .line 21
    .line 22
    iget-wide v2, p0, Ll/fyx;->d:J

    .line 23
    .line 24
    long-to-int v0, v2

    .line 25
    add-int/2addr v1, v0

    .line 26
    mul-int/lit8 v1, v1, 0x1f

    .line 27
    .line 28
    iget p0, p0, Ll/fyx;->e:I

    .line 29
    .line 30
    add-int/2addr v1, p0

    .line 31
    return v1
.end method
