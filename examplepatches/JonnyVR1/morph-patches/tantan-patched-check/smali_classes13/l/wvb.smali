.class public Ll/wvb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:F

.field public g:I

.field public h:I

.field public i:I

.field public j:Z

.field public k:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dw5;",
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
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/wvb;->e:Z

    .line 6
    .line 7
    const/high16 v1, -0x1000000

    .line 8
    .line 9
    iput v1, p0, Ll/wvb;->g:I

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/wvb;->j:Z

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/wvb;->l:Ljava/util/List;

    .line 19
    .line 20
    return-void
.end method

.method public static c()Ll/wvb;
    .locals 2

    .line 1
    new-instance v0, Ll/wvb;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wvb;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x40400000    # 3.0f

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/wvb;->t(F)Ll/wvb;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const v1, 0x3f333333    # 0.7f

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/wvb;->u(F)Ll/wvb;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Ll/wvb;->s(Z)Ll/wvb;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, v1}, Ll/wvb;->r(Z)Ll/wvb;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/high16 v1, -0x40800000    # -1.0f

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/wvb;->v(F)Ll/wvb;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    return-object v0
.end method

.method public static d(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/wvb;
    .locals 3

    .line 1
    invoke-static {}, Ll/wvb;->c()Ll/wvb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Ll/hhc0;->C:[I

    .line 9
    .line 10
    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :try_start_0
    sget p1, Ll/hhc0;->T:I

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/wvb;->i()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {v0, p1}, Ll/wvb;->t(F)Ll/wvb;

    .line 25
    .line 26
    .line 27
    sget p1, Ll/hhc0;->Y:I

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/wvb;->n()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {v0, p1}, Ll/wvb;->s(Z)Ll/wvb;

    .line 38
    .line 39
    .line 40
    sget p1, Ll/hhc0;->X:I

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/wvb;->m()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-virtual {v0, p1}, Ll/wvb;->r(Z)Ll/wvb;

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;->values()[Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget v1, Ll/hhc0;->S:I

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-virtual {p0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    aget-object p1, p1, v1

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ll/wvb;->q(Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;)Ll/wvb;

    .line 67
    .line 68
    .line 69
    sget p1, Ll/hhc0;->K:I

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/wvb;->l()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-virtual {v0, p1}, Ll/wvb;->o(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :catchall_0
    move-exception p1

    .line 87
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 88
    .line 89
    .line 90
    throw p1
.end method


# virtual methods
.method public a(Ll/dw5;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/wvb;->l:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wvb;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/dw5;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/dw5;->a()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wvb;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wvb;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wvb;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wvb;->k:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, Ll/wvb;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget p0, p0, Ll/wvb;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public k()F
    .locals 0

    .line 1
    iget p0, p0, Ll/wvb;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wvb;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wvb;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wvb;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wvb;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public p(II)Ll/wvb;
    .locals 0

    .line 1
    iput p1, p0, Ll/wvb;->i:I

    .line 2
    .line 3
    iput p2, p0, Ll/wvb;->h:I

    .line 4
    .line 5
    return-object p0
.end method

.method public q(Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;)Ll/wvb;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wvb;->k:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Z)Ll/wvb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wvb;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Z)Ll/wvb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wvb;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public t(F)Ll/wvb;
    .locals 0
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.001
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/wvb;->a:F

    .line 2
    .line 3
    return-object p0
.end method

.method public u(F)Ll/wvb;
    .locals 0
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.001
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/wvb;->b:F

    .line 2
    .line 3
    return-object p0
.end method

.method public v(F)Ll/wvb;
    .locals 0
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.01
            to = 1.0
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/wvb;->f:F

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wvb;->j:Z

    .line 2
    .line 3
    return p0
.end method
