.class public abstract Lcom/sunshine/engine/base/s;
.super Ll/ydr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/sunshine/engine/base/a;",
        ">",
        "Ll/ydr;"
    }
.end annotation


# static fields
.field public static final g:Landroid/os/Handler;


# instance fields
.field protected c:Landroid/view/View;

.field protected d:Ll/fz0;

.field public e:Lcom/sunshine/engine/base/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/sunshine/engine/base/s;->g:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ydr;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 6
    .line 7
    new-instance v1, Ll/fz0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/fz0;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/sunshine/engine/base/s;->d:Ll/fz0;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic f(Lcom/sunshine/engine/base/s;Lcom/sunshine/engine/base/a;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->e()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private m(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Ll/ydr;->d(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p0, p2, p3, p4}, Lcom/sunshine/engine/base/s;->h(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/sunshine/engine/base/a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 16
    .line 17
    new-instance p2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string p3, "buildEntity entity.hashCode()="

    .line 20
    .line 21
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p3, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 25
    .line 26
    invoke-virtual {p3}, Ljava/lang/Object;->hashCode()I

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p0, p2}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/sunshine/engine/base/s;->o()V

    .line 41
    .line 42
    .line 43
    return p1

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method private o()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->d:Ll/fz0;

    .line 8
    .line 9
    iget v2, p0, Ll/fz0;->f:I

    .line 10
    .line 11
    iput v2, v1, Ll/fz0;->f:I

    .line 12
    .line 13
    iget v2, p0, Ll/fz0;->g:I

    .line 14
    .line 15
    iput v2, v1, Ll/fz0;->g:I

    .line 16
    .line 17
    iget v2, p0, Ll/fz0;->b:I

    .line 18
    .line 19
    iput v2, v1, Ll/fz0;->b:I

    .line 20
    .line 21
    iget p0, p0, Ll/fz0;->d:I

    .line 22
    .line 23
    iput p0, v1, Ll/fz0;->d:I

    .line 24
    .line 25
    invoke-static {v0}, Ll/n9r;->a(Lcom/sunshine/engine/base/a;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Landroid/app/Activity;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->j()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p0, Landroid/app/Activity;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Landroid/app/Activity;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    check-cast p0, Landroid/content/ContextWrapper;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/a2j0;->h()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/ydr;->b:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0xfa

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const-wide/16 v0, 0x28

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->postInvalidateDelayed(J)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "stop entity.hashCode()="

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/s;->g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 30
    .line 31
    invoke-static {v0}, Ll/xo0;->f(Lcom/sunshine/engine/base/a;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/sunshine/engine/base/a;->b()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->b()V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Ll/ydr;->d(Z)V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 49
    .line 50
    return-void
.end method

.method public g(Ljava/lang/String;)Lcom/sunshine/engine/base/s;
    .locals 5

    .line 1
    const-string v0, " in ["

    .line 2
    .line 3
    sget-boolean v1, Ll/a2j0;->a:Z

    .line 4
    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    iget-object v1, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/16 v3, 0x64

    .line 17
    .line 18
    if-le v2, v3, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 29
    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-ne p1, v4, :cond_1

    .line 47
    .line 48
    const-string p1, ""

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v0, "]"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    :goto_1
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {v2, p1}, Ll/a2j0;->b(Ljava/util/List;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    monitor-exit v1

    .line 87
    return-object p0

    .line 88
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    throw p0

    .line 90
    :cond_2
    return-object p0
.end method

.method public abstract h(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/sunshine/engine/base/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sunshine/engine/base/s;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public i(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getDrawFilter()Landroid/graphics/DrawFilter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1}, Lcom/sunshine/engine/base/r;->e(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/a2j0;->h()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iget-object v3, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 21
    .line 22
    invoke-virtual {v3, p1, v1, v2}, Lcom/sunshine/engine/base/a;->d(Landroid/graphics/Canvas;J)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-boolean v1, p0, Ll/ydr;->a:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->b()V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public j()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->c:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/a2j0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/a2j0;->a(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/s;->l(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->f:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public varargs n(Landroid/view/View;[Ljava/lang/String;)Z
    .locals 5

    .line 1
    array-length v0, p2

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x1

    .line 5
    if-eq v0, v3, :cond_2

    .line 6
    .line 7
    const/4 v4, 0x2

    .line 8
    if-eq v0, v4, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    return v2

    .line 14
    :cond_0
    aget-object v0, p2, v2

    .line 15
    .line 16
    aget-object v1, p2, v3

    .line 17
    .line 18
    aget-object p2, p2, v4

    .line 19
    .line 20
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/sunshine/engine/base/s;->m(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    aget-object v0, p2, v2

    .line 26
    .line 27
    aget-object p2, p2, v3

    .line 28
    .line 29
    invoke-direct {p0, p1, v0, p2, v1}, Lcom/sunshine/engine/base/s;->m(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    aget-object p2, p2, v2

    .line 35
    .line 36
    if-nez p2, :cond_3

    .line 37
    .line 38
    return v2

    .line 39
    :cond_3
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_4

    .line 46
    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    :cond_4
    const-string v0, "config.xml"

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v2, "pic"

    .line 69
    .line 70
    invoke-virtual {p2, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-direct {p0, p1, v0, p2, v1}, Lcom/sunshine/engine/base/s;->m(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0
.end method

.method public p(IIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->d:Ll/fz0;

    .line 2
    .line 3
    iput p1, v0, Ll/fz0;->b:I

    .line 4
    .line 5
    iput p2, v0, Ll/fz0;->d:I

    .line 6
    .line 7
    sub-int/2addr p3, p1

    .line 8
    iput p3, v0, Ll/fz0;->f:I

    .line 9
    .line 10
    sub-int/2addr p4, p2

    .line 11
    iput p4, v0, Ll/fz0;->g:I

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/sunshine/engine/base/s;->o()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public q(Ll/bdj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bdj<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public r(Lcom/sunshine/engine/base/a;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/sunshine/engine/base/s;->g:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/fll0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/fll0;-><init>(Lcom/sunshine/engine/base/s;Lcom/sunshine/engine/base/a;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
