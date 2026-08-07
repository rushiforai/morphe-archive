.class public Ll/qmd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rce;
.implements Ll/ejm;


# instance fields
.field public final a:Ll/bq0;

.field public final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public final c:Ljava/util/concurrent/ExecutorService;

.field public final d:Ll/l610;

.field public final e:Ll/xc80;

.field public final f:Ll/hsb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/bq0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/ExecutorService;Ll/l610;Ll/xc80;Ll/hsb;Ll/a7h0;Ll/a7h0;Ll/a7h0;Ll/a7h0;Ll/a7h0;Ll/a7h0;Ll/a7h0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bq0;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            "Ljava/util/concurrent/ExecutorService;",
            "Ll/l610;",
            "Ll/xc80;",
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/a7h0<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/d7h0;->b:Ll/a7h0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/qmd;->n:Ll/a7h0;

    .line 7
    .line 8
    iput-object p1, p0, Ll/qmd;->a:Ll/bq0;

    .line 9
    .line 10
    iput-object p2, p0, Ll/qmd;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 11
    .line 12
    iput-object p3, p0, Ll/qmd;->c:Ljava/util/concurrent/ExecutorService;

    .line 13
    .line 14
    iput-object p4, p0, Ll/qmd;->d:Ll/l610;

    .line 15
    .line 16
    iput-object p5, p0, Ll/qmd;->e:Ll/xc80;

    .line 17
    .line 18
    iput-object p6, p0, Ll/qmd;->f:Ll/hsb;

    .line 19
    .line 20
    iput-object p7, p0, Ll/qmd;->g:Ll/a7h0;

    .line 21
    .line 22
    iput-object p8, p0, Ll/qmd;->h:Ll/a7h0;

    .line 23
    .line 24
    iput-object p9, p0, Ll/qmd;->i:Ll/a7h0;

    .line 25
    .line 26
    iput-object p10, p0, Ll/qmd;->j:Ll/a7h0;

    .line 27
    .line 28
    iput-object p12, p0, Ll/qmd;->l:Ll/a7h0;

    .line 29
    .line 30
    iput-object p11, p0, Ll/qmd;->k:Ll/a7h0;

    .line 31
    .line 32
    iput-object p13, p0, Ll/qmd;->m:Ll/a7h0;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(Ll/db5;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Ll/za5;

    .line 2
    .line 3
    return p0
.end method

.method public b(Ll/db5;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    check-cast p1, Ll/za5;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/za5;->J()Ll/jq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ll/za5;->M()Ll/oq0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/oq0;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ll/jq0;->getAnimatedBitmapConfig()Landroid/graphics/Bitmap$Config;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-object v0, v1

    .line 26
    :goto_0
    invoke-virtual {p0, p1, v0, v1}, Ll/qmd;->e(Ll/oq0;Landroid/graphics/Bitmap$Config;Ll/djm;)Ll/yq0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/qmd;->n:Ll/a7h0;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    new-instance p0, Ll/zvq;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ll/zvq;-><init>(Ll/yq0;)V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    new-instance p0, Ll/wp0;

    .line 51
    .line 52
    invoke-direct {p0, p1}, Ll/wp0;-><init>(Ll/yq0;)V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public final c(Ll/oq0;)Ll/xp0;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/oq0;->d()Ll/jq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/jq0;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-interface {v0}, Ll/jq0;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v1, v3, v3, v2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/qmd;->a:Ll/bq0;

    .line 20
    .line 21
    invoke-interface {p0, p1, v1}, Ll/bq0;->a(Ll/oq0;Landroid/graphics/Rect;)Ll/xp0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final d(Ll/oq0;)Ll/iq0;
    .locals 3

    .line 1
    new-instance v0, Ll/iq0;

    .line 2
    .line 3
    new-instance v1, Ll/fr0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v2, p0, Ll/qmd;->i:Ll/a7h0;

    .line 10
    .line 11
    invoke-interface {v2}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-direct {v1, p1, v2}, Ll/fr0;-><init>(IZ)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/qmd;->f:Ll/hsb;

    .line 25
    .line 26
    invoke-direct {v0, v1, p0}, Ll/iq0;-><init>(Ll/by3;Ll/hsb;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public final e(Ll/oq0;Landroid/graphics/Bitmap$Config;Ll/djm;)Ll/yq0;
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Ll/qmd;->c(Ll/oq0;)Ll/xp0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v3, Ll/yp0;

    .line 6
    .line 7
    invoke-direct {v3, v0}, Ll/yp0;-><init>(Ll/xp0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/qmd;->f(Ll/oq0;)Ll/c23;

    .line 11
    .line 12
    .line 13
    move-result-object v7

    .line 14
    new-instance v4, Ll/zp0;

    .line 15
    .line 16
    iget-object v1, p0, Ll/qmd;->j:Ll/a7h0;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-direct {v4, v7, v0, v1}, Ll/zp0;-><init>(Ll/c23;Ll/xp0;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/qmd;->h:Ll/a7h0;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x0

    .line 44
    if-lez v0, :cond_0

    .line 45
    .line 46
    new-instance v2, Ll/lri;

    .line 47
    .line 48
    invoke-direct {v2, v0}, Ll/lri;-><init>(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v4, p2}, Ll/qmd;->g(Ll/f23;Landroid/graphics/Bitmap$Config;)Ll/e23;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    move-object v8, p2

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    move-object v2, v1

    .line 58
    move-object v8, v2

    .line 59
    :goto_0
    if-eqz p3, :cond_1

    .line 60
    .line 61
    invoke-virtual {p3}, Ll/yhd;->d()Ll/lnd0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    :cond_1
    move-object v9, v1

    .line 66
    iget-object p2, p0, Ll/qmd;->j:Ll/a7h0;

    .line 67
    .line 68
    invoke-interface {p2}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_2

    .line 79
    .line 80
    new-instance v1, Ll/d7j;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/oq0;->e()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    new-instance v5, Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/d;

    .line 87
    .line 88
    iget-object p1, p0, Ll/qmd;->e:Ll/xc80;

    .line 89
    .line 90
    iget-object p2, p0, Ll/qmd;->l:Ll/a7h0;

    .line 91
    .line 92
    invoke-interface {p2}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    check-cast p2, Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    iget-object p3, p0, Ll/qmd;->m:Ll/a7h0;

    .line 103
    .line 104
    invoke-interface {p3}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    check-cast p3, Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result p3

    .line 114
    invoke-direct {v5, p1, p2, p3}, Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/d;-><init>(Ll/xc80;II)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/qmd;->k:Ll/a7h0;

    .line 118
    .line 119
    invoke-interface {p1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Ljava/lang/Boolean;

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    invoke-direct/range {v1 .. v6}, Ll/d7j;-><init>(Ljava/lang/String;Ll/kr0;Ll/f23;Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/d;Z)V

    .line 130
    .line 131
    .line 132
    move-object v2, v1

    .line 133
    :cond_2
    new-instance v1, Ll/j13;

    .line 134
    .line 135
    move-object v5, v4

    .line 136
    move-object v4, v3

    .line 137
    move-object v3, v7

    .line 138
    move-object v7, v2

    .line 139
    iget-object v2, p0, Ll/qmd;->e:Ll/xc80;

    .line 140
    .line 141
    iget-object p1, p0, Ll/qmd;->j:Ll/a7h0;

    .line 142
    .line 143
    invoke-interface {p1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    invoke-direct/range {v1 .. v9}, Ll/j13;-><init>(Ll/xc80;Ll/c23;Ll/kr0;Ll/f23;ZLl/d23;Ll/e23;Ll/lnd0;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/qmd;->d:Ll/l610;

    .line 157
    .line 158
    iget-object p0, p0, Ll/qmd;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 159
    .line 160
    invoke-static {v1, p1, p0}, Ll/ar0;->o(Ll/yq0;Ll/l610;Ljava/util/concurrent/ScheduledExecutorService;)Ll/zq0;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    return-object p0
.end method

.method public final f(Ll/oq0;)Ll/c23;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qmd;->g:Ll/a7h0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    if-eq v0, p0, :cond_0

    .line 21
    .line 22
    new-instance p0, Ll/xs40;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/xs40;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    new-instance p0, Ll/jzq;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/jzq;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    new-instance v0, Ll/g9j;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/qmd;->d(Ll/oq0;)Ll/iq0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-direct {v0, p0, p1}, Ll/g9j;-><init>(Ll/iq0;Z)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_2
    new-instance v0, Ll/g9j;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/qmd;->d(Ll/oq0;)Ll/iq0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {v0, p0, v1}, Ll/g9j;-><init>(Ll/iq0;Z)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method public final g(Ll/f23;Landroid/graphics/Bitmap$Config;)Ll/e23;
    .locals 2

    .line 1
    new-instance v0, Ll/rmd;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qmd;->e:Ll/xc80;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 9
    .line 10
    :goto_0
    iget-object p0, p0, Ll/qmd;->c:Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    invoke-direct {v0, v1, p1, p2, p0}, Ll/rmd;-><init>(Ll/xc80;Ll/f23;Landroid/graphics/Bitmap$Config;Ljava/util/concurrent/ExecutorService;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
