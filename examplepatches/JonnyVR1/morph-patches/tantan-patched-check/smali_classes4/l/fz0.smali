.class public Ll/fz0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:I

.field public c:Z

.field public d:I

.field public e:Z

.field public f:I

.field public g:I

.field private h:Ll/li80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/li80<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


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
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-boolean v0, p0, Ll/fz0;->a:Z

    .line 10
    .line 11
    iput v0, p0, Ll/fz0;->b:I

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/fz0;->c:Z

    .line 14
    .line 15
    iput v0, p0, Ll/fz0;->d:I

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/fz0;->e:Z

    .line 18
    .line 19
    const/16 v0, 0x64

    .line 20
    .line 21
    iput v0, p0, Ll/fz0;->f:I

    .line 22
    .line 23
    iput v0, p0, Ll/fz0;->g:I

    .line 24
    .line 25
    new-instance v0, Ll/li80;

    .line 26
    .line 27
    invoke-direct {v0, v1, v1}, Ll/li80;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/fz0;->h:Ll/li80;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a(Ll/v1e0;)Ll/li80;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v1e0;",
            ")",
            "Ll/li80<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/fz0;->c(Ll/v1e0;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0}, Ll/fz0;->d(Ll/v1e0;I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v1, p0, Ll/fz0;->h:Ll/li80;

    .line 10
    .line 11
    int-to-double v2, p1

    .line 12
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    mul-double/2addr v2, v4

    .line 17
    double-to-int p1, v2

    .line 18
    add-int/2addr v0, p1

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, v1, Ll/li80;->a:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object p1, p0, Ll/fz0;->h:Ll/li80;

    .line 26
    .line 27
    iget v0, p0, Ll/fz0;->d:I

    .line 28
    .line 29
    iget v1, p0, Ll/fz0;->g:I

    .line 30
    .line 31
    int-to-double v1, v1

    .line 32
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    mul-double/2addr v1, v3

    .line 37
    double-to-int v1, v1

    .line 38
    add-int/2addr v0, v1

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p1, Ll/li80;->b:Ljava/lang/Object;

    .line 44
    .line 45
    iget-object p0, p0, Ll/fz0;->h:Ll/li80;

    .line 46
    .line 47
    return-object p0
.end method

.method public b(Ll/v1e0;II)Ll/li80;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v1e0;",
            "II)",
            "Ll/li80<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/fz0;->a(Ll/v1e0;)Ll/li80;

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Ll/fz0;->c:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/fz0;->h:Ll/li80;

    .line 9
    .line 10
    iget-object v0, p1, Ll/li80;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/2addr v0, p2

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p1, Ll/li80;->a:Ljava/lang/Object;

    .line 24
    .line 25
    :cond_0
    iget-boolean p1, p0, Ll/fz0;->e:Z

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/fz0;->h:Ll/li80;

    .line 30
    .line 31
    iget-object p2, p1, Ll/li80;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p2, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    add-int/2addr p2, p3

    .line 40
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iput-object p2, p1, Ll/li80;->b:Ljava/lang/Object;

    .line 45
    .line 46
    :cond_1
    iget-object p0, p0, Ll/fz0;->h:Ll/li80;

    .line 47
    .line 48
    return-object p0
.end method

.method public c(Ll/v1e0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/fz0;->f:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p1, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 7
    .line 8
    iget v0, v0, Ll/fz0;->b:I

    .line 9
    .line 10
    iget-object v1, p1, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 11
    .line 12
    iget v1, v1, Ll/fz0;->b:I

    .line 13
    .line 14
    sub-int/2addr v0, v1

    .line 15
    int-to-float v0, v0

    .line 16
    iget p1, p1, Lcom/sunshine/engine/base/a;->g:F

    .line 17
    .line 18
    div-float/2addr v0, p1

    .line 19
    float-to-int p1, v0

    .line 20
    iget p0, p0, Ll/fz0;->b:I

    .line 21
    .line 22
    add-int/2addr p1, p0

    .line 23
    return p1

    .line 24
    :cond_0
    iget p0, p0, Ll/fz0;->b:I

    .line 25
    .line 26
    return p0
.end method

.method public d(Ll/v1e0;I)I
    .locals 0

    .line 1
    iget p0, p0, Ll/fz0;->f:I

    .line 2
    .line 3
    const/4 p2, -0x1

    .line 4
    if-ne p0, p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p1, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 7
    .line 8
    iget p0, p0, Ll/fz0;->f:I

    .line 9
    .line 10
    int-to-float p0, p0

    .line 11
    iget p1, p1, Lcom/sunshine/engine/base/a;->g:F

    .line 12
    .line 13
    div-float/2addr p0, p1

    .line 14
    float-to-int p0, p0

    .line 15
    :cond_0
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Ll/fz0;->c:Z

    .line 7
    .line 8
    const-string v2, "offset:"

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 13
    .line 14
    .line 15
    :cond_0
    iget v1, p0, Ll/fz0;->b:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 18
    .line 19
    .line 20
    const-string v1, ","

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 23
    .line 24
    .line 25
    iget-boolean v3, p0, Ll/fz0;->e:Z

    .line 26
    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 30
    .line 31
    .line 32
    :cond_1
    iget v2, p0, Ll/fz0;->d:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 38
    .line 39
    .line 40
    iget v2, p0, Ll/fz0;->f:I

    .line 41
    .line 42
    const/4 v3, -0x1

    .line 43
    if-ne v2, v3, :cond_2

    .line 44
    .line 45
    const-string v2, "match_parent"

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    .line 56
    .line 57
    iget p0, p0, Ll/fz0;->g:I

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
