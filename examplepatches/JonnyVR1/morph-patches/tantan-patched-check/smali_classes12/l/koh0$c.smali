.class Ll/koh0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/koh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field d:Ll/wr4;

.field e:I

.field f:I

.field final synthetic g:Ll/koh0;


# direct methods
.method private constructor <init>(Ll/koh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/koh0$c;->g:Ll/koh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/koh0$c;->c:I

    .line 8
    .line 9
    iput p1, p0, Ll/koh0$c;->e:I

    .line 10
    .line 11
    iput p1, p0, Ll/koh0$c;->f:I

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/koh0;Ll/koh0$a;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/koh0$c;-><init>(Ll/koh0;)V

    return-void
.end method

.method public static synthetic a(Ll/koh0$c;Ljava/util/List;Ll/aje;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/koh0$c;->f(Ljava/util/List;Ll/aje;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/koh0$c;Ll/wr4;Ll/aje;DF)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/koh0$c;->d(Ll/wr4;Ll/aje;DF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/koh0$c;IDLl/aje;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/koh0$c;->e(IDLl/aje;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d(Ll/wr4;Ll/aje;DF)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/koh0$c;->d:Ll/wr4;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/koh0$c;->c:I

    .line 6
    .line 7
    iget v1, p0, Ll/koh0$c;->e:I

    .line 8
    .line 9
    iget v2, p0, Ll/koh0$c;->f:I

    .line 10
    .line 11
    add-int/2addr v1, v2

    .line 12
    add-int/2addr v0, v1

    .line 13
    iput v0, p0, Ll/koh0$c;->c:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Ll/koh0$c;->e:I

    .line 17
    .line 18
    iput v0, p0, Ll/koh0$c;->f:I

    .line 19
    .line 20
    iput-object p1, p0, Ll/koh0$c;->d:Ll/wr4;

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/wr4;->c()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x1

    .line 27
    if-ne p1, v0, :cond_1

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    mul-float/2addr p1, p5

    .line 31
    iget p5, p0, Ll/koh0$c;->b:I

    .line 32
    .line 33
    int-to-float p5, p5

    .line 34
    div-float/2addr p1, p5

    .line 35
    const/high16 p5, 0x41200000    # 10.0f

    .line 36
    .line 37
    mul-float/2addr p1, p5

    .line 38
    float-to-int p1, p1

    .line 39
    iput p1, p0, Ll/koh0$c;->f:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    int-to-float p1, p1

    .line 43
    mul-float/2addr p1, p5

    .line 44
    iget p5, p0, Ll/koh0$c;->a:I

    .line 45
    .line 46
    int-to-float p5, p5

    .line 47
    div-float/2addr p1, p5

    .line 48
    const/high16 p5, 0x42b40000    # 90.0f

    .line 49
    .line 50
    mul-float/2addr p1, p5

    .line 51
    float-to-int p1, p1

    .line 52
    iput p1, p0, Ll/koh0$c;->e:I

    .line 53
    .line 54
    :goto_0
    iget p1, p0, Ll/koh0$c;->c:I

    .line 55
    .line 56
    iget p5, p0, Ll/koh0$c;->f:I

    .line 57
    .line 58
    add-int/2addr p1, p5

    .line 59
    iget p5, p0, Ll/koh0$c;->e:I

    .line 60
    .line 61
    add-int/2addr p1, p5

    .line 62
    invoke-direct {p0, p1, p3, p4, p2}, Ll/koh0$c;->e(IDLl/aje;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private e(IDLl/aje;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/koh0$c;->g:Ll/koh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/koh0;->a(Ll/koh0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object p0, p0, Ll/koh0$c;->g:Ll/koh0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/koh0;->e(Ll/koh0;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/util/List;

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/koh0$e;

    .line 41
    .line 42
    int-to-float v2, p1

    .line 43
    invoke-virtual {v1, v2, p2, p3, p4}, Ll/koh0$e;->e(FDLl/aje;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method

.method private f(Ljava/util/List;Ll/aje;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/wr4;",
            ">;",
            "Ll/aje;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Ll/wr4;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/wr4;->c()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, 0x1

    .line 24
    if-ne v4, v5, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v3}, Ll/wr4;->c()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    add-int/2addr v1, v3

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iput v1, p0, Ll/koh0$c;->a:I

    .line 36
    .line 37
    iput v2, p0, Ll/koh0$c;->b:I

    .line 38
    .line 39
    new-instance v0, Ll/koh0$c$a;

    .line 40
    .line 41
    invoke-direct {v0, p0, p2}, Ll/koh0$c$a;-><init>(Ll/koh0$c;Ll/aje;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Ll/wr4;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/wr4;->f(Ll/wr4$a;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    return-void
.end method
