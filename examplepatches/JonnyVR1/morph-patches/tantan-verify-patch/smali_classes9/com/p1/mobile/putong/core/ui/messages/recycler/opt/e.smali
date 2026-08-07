.class public Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;
    }
.end annotation


# static fields
.field public static p:I = 0x0

.field public static q:I = 0x1

.field public static r:I = 0x2


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:J

.field public g:F

.field public h:J

.field public i:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z

.field public k:I

.field public l:J

.field public m:I

.field public n:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field public o:Landroid/view/animation/DecelerateInterpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j:Z

    .line 9
    .line 10
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->n:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 16
    .line 17
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 18
    .line 19
    const v1, 0x3fd9999a    # 1.7f

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->o:Landroid/view/animation/DecelerateInterpolator;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(F)F
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->o:Landroid/view/animation/DecelerateInterpolator;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    sub-float/2addr p0, p1

    .line 15
    float-to-double p0, p0

    .line 16
    const-wide/high16 v0, 0x4010000000000000L    # 4.0

    .line 17
    .line 18
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 19
    .line 20
    .line 21
    move-result-wide p0

    .line 22
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 23
    .line 24
    sub-double/2addr v0, p0

    .line 25
    double-to-float p0, v0

    .line 26
    return p0
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-static {}, Ll/fxi0;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->f()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->b(Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->l:J

    .line 2
    .line 3
    const-wide/32 v2, 0xf4240

    .line 4
    .line 5
    .line 6
    mul-long/2addr v0, v2

    .line 7
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->f:J

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->k:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b:I

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->m:I

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j:Z

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->c:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->c:I

    .line 26
    .line 27
    :goto_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 31
    .line 32
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->a:Z

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->h:J

    .line 39
    .line 40
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

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

.method public doFrame(J)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->h:J

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->f:J

    .line 8
    .line 9
    add-long/2addr v0, v2

    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->a:Z

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    move-object v0, p2

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b:I

    .line 29
    .line 30
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 31
    .line 32
    sub-int v3, v1, p2

    .line 33
    .line 34
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 35
    .line 36
    const/high16 p2, 0x42c80000    # 100.0f

    .line 37
    .line 38
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 39
    .line 40
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    const/high16 v2, 0x42c80000    # 100.0f

    .line 44
    .line 45
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->c(IFIIZ)V

    .line 46
    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    invoke-interface {v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->b(Z)V

    .line 50
    .line 51
    .line 52
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    move-object v1, v0

    .line 62
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->h:J

    .line 67
    .line 68
    sub-long/2addr p1, v2

    .line 69
    long-to-double p1, p1

    .line 70
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->f:J

    .line 71
    .line 72
    long-to-double v2, v2

    .line 73
    div-double/2addr p1, v2

    .line 74
    double-to-float p1, p1

    .line 75
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    cmpg-float v0, p1, p2

    .line 79
    .line 80
    if-gez v0, :cond_1

    .line 81
    .line 82
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const/high16 p2, 0x3f800000    # 1.0f

    .line 86
    .line 87
    cmpl-float p1, p1, p2

    .line 88
    .line 89
    if-lez p1, :cond_2

    .line 90
    .line 91
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 92
    .line 93
    :cond_2
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->a(F)F

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 100
    .line 101
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b:I

    .line 102
    .line 103
    int-to-float p1, p1

    .line 104
    mul-float/2addr p1, v3

    .line 105
    float-to-int v2, p1

    .line 106
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 107
    .line 108
    sub-int v4, v2, p1

    .line 109
    .line 110
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 111
    .line 112
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 113
    .line 114
    const/4 v6, 0x0

    .line 115
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->c(IFIIZ)V

    .line 116
    .line 117
    .line 118
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->a:Z

    .line 119
    .line 120
    if-nez p1, :cond_3

    .line 121
    .line 122
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 127
    .line 128
    .line 129
    :cond_3
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->f()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public final g()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    :cond_0
    return v0
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public i(J)Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->l:J

    .line 2
    .line 3
    return-object p0
.end method

.method public final j()V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->a:Z

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b:I

    .line 5
    .line 6
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 7
    .line 8
    sub-int v6, v1, v2

    .line 9
    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->d:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 13
    .line 14
    const/high16 v0, 0x42c80000    # 100.0f

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g:F

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->g()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    move-object v3, v0

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 32
    .line 33
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->b:I

    .line 34
    .line 35
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->e:I

    .line 36
    .line 37
    const/4 v8, 0x1

    .line 38
    const/high16 v5, 0x42c80000    # 100.0f

    .line 39
    .line 40
    invoke-interface/range {v3 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->c(IFIIZ)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public k(II)Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->k:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->m:I

    .line 4
    .line 5
    return-object p0
.end method

.method public l()V
    .locals 2

    .line 1
    invoke-static {}, Ll/fxi0;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->j:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->c()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e;->i:Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/e$a;->a()V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
