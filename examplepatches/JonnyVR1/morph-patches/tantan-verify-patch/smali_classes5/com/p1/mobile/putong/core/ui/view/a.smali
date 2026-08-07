.class public Lcom/p1/mobile/putong/core/ui/view/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/view/a$d;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:Z

.field public g:Ll/syf0;

.field public h:Ll/syf0;

.field public i:Z

.field public j:Z

.field public k:Ljava/lang/Runnable;

.field public l:Ll/izf0;

.field public m:Ll/uyf0;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->i:Z

    .line 6
    .line 7
    new-instance v0, Ll/uyf0;

    .line 8
    .line 9
    const-wide v1, 0x405f400000000000L    # 125.0

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    const-wide/high16 v3, 0x4028000000000000L    # 12.0

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v4}, Ll/uyf0;-><init>(DD)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->m:Ll/uyf0;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->a:Landroid/view/View;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/view/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->l()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/view/a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->e:F

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/view/a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->a:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/view/a;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->b:F

    return-void
.end method

.method public static f(Landroid/view/View;)Landroid/graphics/RectF;
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Landroid/graphics/RectF;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v2, v0, v2

    .line 11
    .line 12
    int-to-float v3, v2

    .line 13
    const/4 v4, 0x1

    .line 14
    aget v5, v0, v4

    .line 15
    .line 16
    int-to-float v5, v5

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    add-int/2addr v2, v6

    .line 22
    int-to-float v2, v2

    .line 23
    aget v0, v0, v4

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    add-int/2addr v0, p0

    .line 30
    int-to-float p0, v0

    .line 31
    invoke-direct {v1, v3, v5, v2, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 32
    .line 33
    .line 34
    return-object v1
.end method


# virtual methods
.method public e()Ll/syf0;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->n()Ll/sr2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/sr2;->c()Ll/syf0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->m:Ll/uyf0;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/syf0;->p(Ll/uyf0;)Ll/syf0;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->b:F

    .line 19
    .line 20
    new-instance v2, Lcom/p1/mobile/putong/core/ui/view/a$c;

    .line 21
    .line 22
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/core/ui/view/a$c;-><init>(Lcom/p1/mobile/putong/core/ui/view/a;F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ll/syf0;->a(Ll/gzf0;)Ll/syf0;

    .line 26
    .line 27
    .line 28
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ll/syf0;->o(D)Ll/syf0;

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->h:Ll/syf0;

    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public final g()Ll/syf0;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->i:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->n()Ll/sr2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/sr2;->c()Ll/syf0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->m:Ll/uyf0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/syf0;->p(Ll/uyf0;)Ll/syf0;

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/core/ui/view/a$b;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/view/a$b;-><init>(Lcom/p1/mobile/putong/core/ui/view/a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/syf0;->a(Ll/gzf0;)Ll/syf0;

    .line 31
    .line 32
    .line 33
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Ll/syf0;->o(D)Ll/syf0;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-object v0

    .line 39
    :cond_1
    const/4 v1, 0x0

    .line 40
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->j:Z

    .line 41
    .line 42
    throw v0
.end method

.method public final h(Ll/syf0;)Ll/syf0;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/syf0;->k()Ll/syf0;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/syf0;->c()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public i(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    if-eq v0, v3, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x3

    .line 15
    if-eq v0, p1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/a;->h(Ll/syf0;)Ll/syf0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->g()Ll/syf0;

    .line 28
    .line 29
    .line 30
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 31
    .line 32
    :goto_0
    move v2, v1

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/a;->a:Landroid/view/View;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/view/a;->f(Landroid/view/View;)Landroid/graphics/RectF;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3, v0, p1}, Landroid/graphics/RectF;->contains(FF)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_6

    .line 53
    .line 54
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 55
    .line 56
    if-eqz p1, :cond_6

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/a;->h(Ll/syf0;)Ll/syf0;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->g()Ll/syf0;

    .line 67
    .line 68
    .line 69
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 73
    .line 74
    if-eqz p1, :cond_4

    .line 75
    .line 76
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->j:Z

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 79
    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/a;->h(Ll/syf0;)Ll/syf0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->h:Ll/syf0;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/a;->h(Ll/syf0;)Ll/syf0;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->h:Ll/syf0;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->e()Ll/syf0;

    .line 97
    .line 98
    .line 99
    move p1, v2

    .line 100
    goto :goto_1

    .line 101
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/a;->h(Ll/syf0;)Ll/syf0;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->g()Ll/syf0;

    .line 108
    .line 109
    .line 110
    :cond_4
    move p1, v1

    .line 111
    :goto_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 112
    .line 113
    move v2, p1

    .line 114
    goto :goto_2

    .line 115
    :cond_5
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/view/a;->j:Z

    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->a:Landroid/view/View;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->k:Ljava/lang/Runnable;

    .line 120
    .line 121
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    int-to-long v3, v3

    .line 126
    invoke-virtual {p1, v0, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 127
    .line 128
    .line 129
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->m()Ll/syf0;

    .line 132
    .line 133
    .line 134
    :cond_6
    :goto_2
    xor-int/lit8 p0, v2, 0x1

    .line 135
    .line 136
    return p0
.end method

.method public j()F
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->b:F

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->d:F

    .line 4
    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float v2, p0, v1

    .line 8
    .line 9
    cmpl-float v2, v0, v2

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    div-float/2addr p0, v1

    .line 14
    return p0

    .line 15
    :cond_0
    return v0
.end method

.method public k(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->d:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpg-float v1, p1, v0

    .line 5
    .line 6
    if-gez v1, :cond_0

    .line 7
    .line 8
    move p1, v0

    .line 9
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->d:F

    .line 10
    .line 11
    const v0, 0x3f666666    # 0.9f

    .line 12
    .line 13
    .line 14
    mul-float/2addr p1, v0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->c:F

    .line 16
    .line 17
    const v0, 0x3f4ccccd    # 0.8f

    .line 18
    .line 19
    .line 20
    mul-float/2addr v0, p1

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->e:F

    .line 22
    .line 23
    const/high16 v0, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr p1, v0

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->b:F

    .line 27
    .line 28
    new-instance p1, Ll/kqh0;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/kqh0;-><init>(Lcom/p1/mobile/putong/core/ui/view/a;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->k:Ljava/lang/Runnable;

    .line 34
    .line 35
    return-void
.end method

.method public final synthetic l()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    :goto_0
    return-void

    .line 14
    :cond_1
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/a;->j:Z

    .line 16
    .line 17
    throw v0
.end method

.method public final m()Ll/syf0;
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->n()Ll/sr2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/sr2;->c()Ll/syf0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/uyf0;

    .line 14
    .line 15
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 16
    .line 17
    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    .line 18
    .line 19
    invoke-direct {v1, v2, v3, v4, v5}, Ll/uyf0;-><init>(DD)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/syf0;->p(Ll/uyf0;)Ll/syf0;

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/core/ui/view/a$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/view/a$a;-><init>(Lcom/p1/mobile/putong/core/ui/view/a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/syf0;->a(Ll/gzf0;)Ll/syf0;

    .line 31
    .line 32
    .line 33
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Ll/syf0;->o(D)Ll/syf0;

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->g:Ll/syf0;

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public final n()Ll/sr2;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->l:Ll/izf0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-static {}, Ll/izf0;->h()Ll/izf0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a;->l:Ll/izf0;

    .line 11
    .line 12
    return-object v0
.end method
