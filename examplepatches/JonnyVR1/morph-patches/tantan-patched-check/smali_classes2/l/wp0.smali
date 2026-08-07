.class public Ll/wp0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;
.implements Ll/hde;


# static fields
.field public static final r:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final s:Ll/lr0;


# instance fields
.field public a:Ll/yq0;

.field public b:Ll/u7j;

.field public volatile c:Z

.field public d:J

.field public e:J

.field public f:J

.field public g:I

.field public h:J

.field public i:J

.field public j:I

.field public k:J

.field public l:J

.field public m:I

.field public volatile n:Ll/lr0;

.field public final o:Ll/yq0$a;

.field public p:Ll/vce;

.field public final q:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Ll/wp0;

    .line 2
    .line 3
    sput-object v0, Ll/wp0;->r:Ljava/lang/Class;

    .line 4
    .line 5
    new-instance v0, Ll/ye2;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ye2;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/wp0;->s:Ll/lr0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, v0}, Ll/wp0;-><init>(Ll/yq0;)V

    return-void
.end method

.method public constructor <init>(Ll/yq0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x8

    .line 5
    .line 6
    iput-wide v0, p0, Ll/wp0;->k:J

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/wp0;->l:J

    .line 11
    .line 12
    sget-object v0, Ll/wp0;->s:Ll/lr0;

    .line 13
    .line 14
    iput-object v0, p0, Ll/wp0;->n:Ll/lr0;

    .line 15
    .line 16
    new-instance v0, Ll/vp0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/vp0;-><init>(Ll/wp0;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/wp0;->o:Ll/yq0$a;

    .line 22
    .line 23
    new-instance v1, Ll/wp0$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/wp0$a;-><init>(Ll/wp0;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/wp0;->q:Ljava/lang/Runnable;

    .line 29
    .line 30
    iput-object p1, p0, Ll/wp0;->a:Ll/yq0;

    .line 31
    .line 32
    invoke-static {p1}, Ll/wp0;->c(Ll/yq0;)Ll/u7j;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Ll/wp0;->b:Ll/u7j;

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-interface {p1, v0}, Ll/yq0;->e(Ll/yq0$a;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public static bridge synthetic b(Ll/wp0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp0;->q:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static c(Ll/yq0;)Ll/u7j;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ll/mfe;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/mfe;-><init>(Ll/kr0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/yq0;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d()Ll/yq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    iget-object v0, p0, Ll/wp0;->b:Ll/u7j;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/wp0;->f()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-boolean v2, p0, Ll/wp0;->c:Z

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget-wide v2, p0, Ll/wp0;->d:J

    .line 20
    .line 21
    sub-long v2, v0, v2

    .line 22
    .line 23
    iget-wide v4, p0, Ll/wp0;->l:J

    .line 24
    .line 25
    add-long/2addr v2, v4

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-wide v2, p0, Ll/wp0;->e:J

    .line 28
    .line 29
    const-wide/16 v4, 0x0

    .line 30
    .line 31
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    :goto_0
    iget-object v4, p0, Ll/wp0;->b:Ll/u7j;

    .line 36
    .line 37
    iget-wide v5, p0, Ll/wp0;->e:J

    .line 38
    .line 39
    invoke-interface {v4, v2, v3, v5, v6}, Ll/u7j;->b(JJ)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, -0x1

    .line 45
    if-ne v4, v6, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 48
    .line 49
    invoke-interface {v0}, Ll/kr0;->getFrameCount()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/lit8 v4, v0, -0x1

    .line 54
    .line 55
    iget-object v0, p0, Ll/wp0;->n:Ll/lr0;

    .line 56
    .line 57
    invoke-interface {v0, p0}, Ll/lr0;->b(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    iput-boolean v5, p0, Ll/wp0;->c:Z

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    if-nez v4, :cond_3

    .line 64
    .line 65
    iget v7, p0, Ll/wp0;->g:I

    .line 66
    .line 67
    if-eq v7, v6, :cond_3

    .line 68
    .line 69
    iget-wide v6, p0, Ll/wp0;->f:J

    .line 70
    .line 71
    cmp-long v0, v0, v6

    .line 72
    .line 73
    if-ltz v0, :cond_3

    .line 74
    .line 75
    iget-object v0, p0, Ll/wp0;->n:Ll/lr0;

    .line 76
    .line 77
    invoke-interface {v0, p0}, Ll/lr0;->onAnimationRepeat(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 81
    .line 82
    invoke-interface {v0, p0, p1, v4}, Ll/yq0;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;I)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    iget-object v0, p0, Ll/wp0;->n:Ll/lr0;

    .line 89
    .line 90
    invoke-interface {v0, p0, v4}, Ll/lr0;->a(Landroid/graphics/drawable/Drawable;I)V

    .line 91
    .line 92
    .line 93
    iput v4, p0, Ll/wp0;->g:I

    .line 94
    .line 95
    :cond_4
    if-nez p1, :cond_5

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/wp0;->g()V

    .line 98
    .line 99
    .line 100
    :cond_5
    invoke-virtual {p0}, Ll/wp0;->f()J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    iget-boolean p1, p0, Ll/wp0;->c:Z

    .line 105
    .line 106
    if-eqz p1, :cond_7

    .line 107
    .line 108
    iget-object p1, p0, Ll/wp0;->b:Ll/u7j;

    .line 109
    .line 110
    iget-wide v6, p0, Ll/wp0;->d:J

    .line 111
    .line 112
    sub-long/2addr v0, v6

    .line 113
    invoke-interface {p1, v0, v1}, Ll/u7j;->a(J)J

    .line 114
    .line 115
    .line 116
    move-result-wide v0

    .line 117
    const-wide/16 v6, -0x1

    .line 118
    .line 119
    cmp-long p1, v0, v6

    .line 120
    .line 121
    if-eqz p1, :cond_6

    .line 122
    .line 123
    iget-wide v4, p0, Ll/wp0;->k:J

    .line 124
    .line 125
    add-long/2addr v0, v4

    .line 126
    invoke-virtual {p0, v0, v1}, Ll/wp0;->h(J)V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_6
    iget-object p1, p0, Ll/wp0;->n:Ll/lr0;

    .line 131
    .line 132
    invoke-interface {p1, p0}, Ll/lr0;->b(Landroid/graphics/drawable/Drawable;)V

    .line 133
    .line 134
    .line 135
    iput-boolean v5, p0, Ll/wp0;->c:Z

    .line 136
    .line 137
    :cond_7
    :goto_2
    iput-wide v2, p0, Ll/wp0;->e:J

    .line 138
    .line 139
    :cond_8
    :goto_3
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/kr0;->getFrameCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final f()J
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public final g()V
    .locals 2

    .line 1
    iget v0, p0, Ll/wp0;->m:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/wp0;->m:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/wp0;->r:Ljava/lang/Class;

    .line 15
    .line 16
    iget p0, p0, Ll/wp0;->m:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v1, "Dropped a frame. Count: %s"

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Ll/huf;->o(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-interface {v0}, Ll/yq0;->b()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-interface {v0}, Ll/yq0;->a()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public final h(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/wp0;->d:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ll/wp0;->f:J

    .line 5
    .line 6
    iget-object p1, p0, Ll/wp0;->q:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, v1}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Ll/yq0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ll/yq0;->e(Ll/yq0$a;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Ll/wp0;->a:Ll/yq0;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    new-instance p1, Ll/mfe;

    .line 14
    .line 15
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ll/mfe;-><init>(Ll/kr0;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/wp0;->b:Ll/u7j;

    .line 21
    .line 22
    iget-object p1, p0, Ll/wp0;->a:Ll/yq0;

    .line 23
    .line 24
    iget-object v0, p0, Ll/wp0;->o:Ll/yq0$a;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Ll/yq0;->e(Ll/yq0$a;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/wp0;->a:Ll/yq0;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p1, v0}, Ll/yq0;->c(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/wp0;->p:Ll/vce;

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ll/vce;->a(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Ll/wp0;->a:Ll/yq0;

    .line 46
    .line 47
    invoke-static {p1}, Ll/wp0;->c(Ll/yq0;)Ll/u7j;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Ll/wp0;->b:Ll/u7j;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/wp0;->stop()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wp0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public j(Ll/lr0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    sget-object p1, Ll/wp0;->s:Ll/lr0;

    .line 5
    .line 6
    :goto_0
    iput-object p1, p0, Ll/wp0;->n:Ll/lr0;

    .line 7
    .line 8
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/wp0;->a:Ll/yq0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/yq0;->c(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onLevelChange(I)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/wp0;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-wide v2, p0, Ll/wp0;->e:J

    .line 8
    .line 9
    int-to-long v4, p1

    .line 10
    cmp-long p1, v2, v4

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iput-wide v4, p0, Ll/wp0;->e:J

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    return v1
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wp0;->p:Ll/vce;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/vce;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/vce;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/wp0;->p:Ll/vce;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/wp0;->p:Ll/vce;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/vce;->b(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/wp0;->a:Ll/yq0;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/yq0;->h(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wp0;->p:Ll/vce;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/vce;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/vce;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/wp0;->p:Ll/vce;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/wp0;->p:Ll/vce;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/vce;->c(Landroid/graphics/ColorFilter;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/wp0;->a:Ll/yq0;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/yq0;->d(Landroid/graphics/ColorFilter;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public start()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/wp0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/wp0;->a:Ll/yq0;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Ll/kr0;->getFrameCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-gt v0, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput-boolean v1, p0, Ll/wp0;->c:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wp0;->f()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Ll/wp0;->h:J

    .line 24
    .line 25
    sub-long v2, v0, v2

    .line 26
    .line 27
    iput-wide v2, p0, Ll/wp0;->d:J

    .line 28
    .line 29
    iput-wide v2, p0, Ll/wp0;->f:J

    .line 30
    .line 31
    iget-wide v2, p0, Ll/wp0;->i:J

    .line 32
    .line 33
    sub-long/2addr v0, v2

    .line 34
    iput-wide v0, p0, Ll/wp0;->e:J

    .line 35
    .line 36
    iget v0, p0, Ll/wp0;->j:I

    .line 37
    .line 38
    iput v0, p0, Ll/wp0;->g:I

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/wp0;->n:Ll/lr0;

    .line 44
    .line 45
    invoke-interface {v0, p0}, Ll/lr0;->onAnimationStart(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public stop()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/wp0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/wp0;->f()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Ll/wp0;->d:J

    .line 11
    .line 12
    sub-long v2, v0, v2

    .line 13
    .line 14
    iput-wide v2, p0, Ll/wp0;->h:J

    .line 15
    .line 16
    iget-wide v2, p0, Ll/wp0;->e:J

    .line 17
    .line 18
    sub-long/2addr v0, v2

    .line 19
    iput-wide v0, p0, Ll/wp0;->i:J

    .line 20
    .line 21
    iget v0, p0, Ll/wp0;->g:I

    .line 22
    .line 23
    iput v0, p0, Ll/wp0;->j:I

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Ll/wp0;->c:Z

    .line 27
    .line 28
    const-wide/16 v0, 0x0

    .line 29
    .line 30
    iput-wide v0, p0, Ll/wp0;->d:J

    .line 31
    .line 32
    iput-wide v0, p0, Ll/wp0;->f:J

    .line 33
    .line 34
    const-wide/16 v0, -0x1

    .line 35
    .line 36
    iput-wide v0, p0, Ll/wp0;->e:J

    .line 37
    .line 38
    const/4 v0, -0x1

    .line 39
    iput v0, p0, Ll/wp0;->g:I

    .line 40
    .line 41
    iget-object v0, p0, Ll/wp0;->q:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/wp0;->n:Ll/lr0;

    .line 47
    .line 48
    invoke-interface {v0, p0}, Ll/lr0;->b(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
