.class public Ll/b690;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static z:Ll/b690;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Privilege;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/CharSequence;

.field public k:Ljava/lang/CharSequence;

.field public l:I

.field public m:Ljava/lang/CharSequence;

.field public n:I

.field public o:Ljava/lang/CharSequence;

.field public p:I

.field public q:Z

.field public r:I

.field public s:I

.field public t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public u:I

.field public v:I

.field public w:Z

.field public x:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public y:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/b690;
    .locals 2

    .line 1
    sget-object v0, Ll/b690;->z:Ll/b690;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/b690;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/b690;->z:Ll/b690;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/b690;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/b690;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/b690;->z:Ll/b690;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/b690;->z:Ll/b690;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/b690;->c()V

    .line 29
    .line 30
    .line 31
    sget-object v0, Ll/b690;->z:Ll/b690;

    .line 32
    .line 33
    return-object v0
.end method


# virtual methods
.method public a()Ll/a690;
    .locals 2

    .line 1
    new-instance v0, Ll/a690;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/a690;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/b690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/a690;->U(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Ll/b690;->b:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/a690;->F(I)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ll/b690;->c:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/a690;->J(I)V

    .line 19
    .line 20
    .line 21
    iget v1, p0, Ll/b690;->d:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/a690;->I(I)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Ll/b690;->e:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/a690;->O(I)V

    .line 29
    .line 30
    .line 31
    iget v1, p0, Ll/b690;->f:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/a690;->D(I)V

    .line 34
    .line 35
    .line 36
    iget v1, p0, Ll/b690;->g:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/a690;->X(I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/b690;->h:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/a690;->P(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/b690;->i:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/a690;->E(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/b690;->j:Ljava/lang/CharSequence;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/a690;->f0(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/b690;->k:Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/a690;->Y(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget v1, p0, Ll/b690;->l:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/a690;->g0(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/b690;->m:Ljava/lang/CharSequence;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/a690;->a0(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget v1, p0, Ll/b690;->n:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/a690;->b0(I)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/b690;->o:Ljava/lang/CharSequence;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/a690;->G(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget v1, p0, Ll/b690;->p:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/a690;->H(I)V

    .line 84
    .line 85
    .line 86
    iget v1, p0, Ll/b690;->r:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/a690;->N(I)V

    .line 89
    .line 90
    .line 91
    iget v1, p0, Ll/b690;->s:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ll/a690;->W(I)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/b690;->t:Ljava/util/List;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/a690;->C(Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    iget v1, p0, Ll/b690;->u:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ll/a690;->M(I)V

    .line 104
    .line 105
    .line 106
    iget v1, p0, Ll/b690;->v:I

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ll/a690;->V(I)V

    .line 109
    .line 110
    .line 111
    iget v1, p0, Ll/b690;->x:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ll/a690;->L(I)V

    .line 114
    .line 115
    .line 116
    iget-boolean v1, p0, Ll/b690;->w:Z

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/a690;->K(Z)V

    .line 119
    .line 120
    .line 121
    iget-boolean v1, p0, Ll/b690;->q:Z

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ll/a690;->c0(Z)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Ll/b690;->y:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Ll/a690;->R(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 129
    .line 130
    .line 131
    return-object v0
.end method

.method public final c()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/b690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Ll/b690;->b:I

    .line 6
    .line 7
    iput v1, p0, Ll/b690;->c:I

    .line 8
    .line 9
    iput v1, p0, Ll/b690;->d:I

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    iput-object v2, p0, Ll/b690;->h:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v2, p0, Ll/b690;->i:Ljava/lang/String;

    .line 16
    .line 17
    iput v1, p0, Ll/b690;->e:I

    .line 18
    .line 19
    iput v1, p0, Ll/b690;->f:I

    .line 20
    .line 21
    iput v1, p0, Ll/b690;->g:I

    .line 22
    .line 23
    iput-object v2, p0, Ll/b690;->j:Ljava/lang/CharSequence;

    .line 24
    .line 25
    iput-object v2, p0, Ll/b690;->k:Ljava/lang/CharSequence;

    .line 26
    .line 27
    iput v1, p0, Ll/b690;->l:I

    .line 28
    .line 29
    iput-object v2, p0, Ll/b690;->m:Ljava/lang/CharSequence;

    .line 30
    .line 31
    iput v1, p0, Ll/b690;->n:I

    .line 32
    .line 33
    iput-object v2, p0, Ll/b690;->o:Ljava/lang/CharSequence;

    .line 34
    .line 35
    iput v1, p0, Ll/b690;->p:I

    .line 36
    .line 37
    iput v1, p0, Ll/b690;->r:I

    .line 38
    .line 39
    iput-object v0, p0, Ll/b690;->t:Ljava/util/List;

    .line 40
    .line 41
    iput v1, p0, Ll/b690;->u:I

    .line 42
    .line 43
    iput v1, p0, Ll/b690;->v:I

    .line 44
    .line 45
    iput-boolean v1, p0, Ll/b690;->w:Z

    .line 46
    .line 47
    iput v1, p0, Ll/b690;->x:I

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    iput-boolean v1, p0, Ll/b690;->q:Z

    .line 51
    .line 52
    iput-object v0, p0, Ll/b690;->y:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 53
    .line 54
    return-void
.end method

.method public d(I)Ll/b690;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/b690;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Ll/b690;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/b690;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public f(I)Ll/b690;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/b690;->o:Ljava/lang/CharSequence;

    .line 8
    .line 9
    return-object p0
.end method

.method public g(Ljava/lang/CharSequence;)Ll/b690;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b690;->o:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(II)Ll/b690;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/b690;->c:I

    .line 2
    .line 3
    iput p2, p0, Ll/b690;->d:I

    .line 4
    .line 5
    return-object p0
.end method

.method public i(I)Ll/b690;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/b690;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/b690;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b690;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/b690;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/b690;->m:Ljava/lang/CharSequence;

    .line 8
    .line 9
    return-object p0
.end method

.method public m(Ljava/lang/CharSequence;)Ll/b690;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b690;->m:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(I)Ll/b690;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/b690;->j:Ljava/lang/CharSequence;

    .line 8
    .line 9
    return-object p0
.end method

.method public o(Ljava/lang/CharSequence;)Ll/b690;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b690;->j:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Ll/b690;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/b690;->l:I

    .line 2
    .line 3
    return-object p0
.end method
