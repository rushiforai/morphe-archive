.class public Ll/x3t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Ll/cm0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMedal;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/ner;


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/x3t;->e:Z

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/x3t;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/x3t;->q(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Ll/x3t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x3t;->r(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x3t;->v(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ll/ruf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic g(Ll/x3t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x3t;->s(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ll/ruf0;)V
    .locals 6

    .line 1
    instance-of v0, p1, Ll/oag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/oag;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-lez v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-lez v3, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/high16 v3, 0x41600000    # 14.0f

    .line 36
    .line 37
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    :goto_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    int-to-float v4, v4

    .line 46
    const/high16 v5, 0x3f800000    # 1.0f

    .line 47
    .line 48
    mul-float/2addr v4, v5

    .line 49
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    int-to-float v0, v0

    .line 54
    div-float/2addr v4, v0

    .line 55
    int-to-float v0, v3

    .line 56
    mul-float/2addr v4, v0

    .line 57
    float-to-int v0, v4

    .line 58
    new-array v2, v2, [Landroid/view/View;

    .line 59
    .line 60
    aput-object p0, v2, v1

    .line 61
    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const/high16 v0, 0x42480000    # 50.0f

    .line 67
    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    new-array v2, v2, [Landroid/view/View;

    .line 73
    .line 74
    aput-object p0, v2, v1

    .line 75
    .line 76
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic i(Lv/VDraweeView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic j(Lv/VDraweeView;Ll/ruf0;)V
    .locals 5

    .line 1
    instance-of v0, p1, Ll/oag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/oag;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-lez v3, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-float v3, v3

    .line 29
    const/high16 v4, 0x3f800000    # 1.0f

    .line 30
    .line 31
    mul-float/2addr v3, v4

    .line 32
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v0, v0

    .line 37
    div-float/2addr v3, v0

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    int-to-float v0, v0

    .line 43
    mul-float/2addr v3, v0

    .line 44
    float-to-int v0, v3

    .line 45
    new-array v2, v2, [Landroid/view/View;

    .line 46
    .line 47
    aput-object p0, v2, v1

    .line 48
    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/high16 v0, 0x42480000    # 50.0f

    .line 54
    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    new-array v2, v2, [Landroid/view/View;

    .line 60
    .line 61
    aput-object p0, v2, v1

    .line 62
    .line 63
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ll/ruf0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/n5g;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/n5g;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/n5g;->f()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Ll/dy4;->z(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public A(Lv/VDraweeView;I)V
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/hiv;->x(I)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    const/high16 v0, 0x42000000    # 32.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    new-array p2, p2, [Landroid/view/View;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    aput-object p1, p2, v1

    .line 35
    .line 36
    invoke-static {v0, p2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, p1, p0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public B(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMedal;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/x3t;->g:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public C(Ll/ner;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x3t;->h:Ll/ner;

    .line 2
    .line 3
    return-void
.end method

.method public D(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/zvk;

    .line 6
    .line 7
    iget-object v2, p0, Ll/x3t;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p2}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const-string v1, "#f79533"

    .line 17
    .line 18
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const-string v2, "#f7c333"

    .line 23
    .line 24
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    filled-new-array {v1, v2}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p2, v1}, Ll/zvk;->e([I)Ll/zvk;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {p2, v1}, Ll/zvk;->k(Z)Ll/zvk;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/16 v1, 0xc

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Ll/zvk;->t(I)Ll/zvk;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {p2, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    sget v1, Ll/qa00;->i:I

    .line 53
    .line 54
    sget v2, Ll/qa00;->f:I

    .line 55
    .line 56
    invoke-virtual {p2, v1, v2, v1, v2}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    sget v1, Ll/zvk;->A:I

    .line 61
    .line 62
    invoke-virtual {p2, v1}, Ll/zvk;->i(I)Ll/zvk;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    const-wide/16 v1, 0x1f40

    .line 67
    .line 68
    invoke-virtual {p2, v1, v2}, Ll/zvk;->a(J)Ll/zvk;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    new-instance v1, Ll/t3t;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/t3t;-><init>(Ll/x3t;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2, v1}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    new-instance v1, Ll/u3t;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/u3t;-><init>(Ll/x3t;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {v0, p2, p1}, Ll/fwk;->t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Ll/x3t;->d:Ljava/lang/String;

    .line 95
    .line 96
    iput-object p3, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 97
    .line 98
    return-void
.end method

.method public E(Ll/cm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x3t;->f:Ll/cm0;

    .line 2
    .line 3
    return-void
.end method

.method public varargs k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V
    .locals 2
    .param p2    # [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/l3t;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/l3t;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0, p2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/x3t;->a:Landroid/content/Context;

    .line 22
    .line 23
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/x3t;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x3t;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v2, p0, Ll/x3t;->d:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/x3t;->d:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    iput-object v1, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/UserMedal;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public o(Lcom/p1/mobile/putong/data/UserMedal;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public p(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p1, p4, p2, p3}, Ll/x3t;->t(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Landroid/view/View;ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x3t;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/x3t;->d:Ljava/lang/String;

    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Landroid/view/View;ZZ)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMedal;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->i18nMainDescription:Ljava/lang/String;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->i18nGuestDescription:Ljava/lang/String;

    .line 7
    .line 8
    :goto_0
    invoke-static {p3}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Ll/x3t;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/x3t;->m()V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/zeu;->e:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "p_audio_profile"

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    if-eqz p4, :cond_1

    .line 33
    .line 34
    iget-object p4, p0, Ll/x3t;->g:Ll/y20;

    .line 35
    .line 36
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p4

    .line 40
    if-eqz p4, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Ll/x3t;->g:Ll/y20;

    .line 43
    .line 44
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p2, p3, p1}, Ll/x3t;->D(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    invoke-virtual {p0}, Ll/x3t;->m()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V
    .locals 4

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p2, Lcom/p1/mobile/putong/data/UserMedal;->familyGrade:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->j(I)Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/nxp$a;->n()Ll/nxp$a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "family"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/nxp$a;->y(Ljava/lang/String;)Ll/nxp$a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget v2, p2, Lcom/p1/mobile/putong/data/UserMedal;->familyGrade:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ll/nxp$a;->s(I)Ll/nxp$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v2, p2, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/nxp$a;->z(Ljava/lang/String;)Ll/nxp$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->icon:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ll/nxp$a;->u(Ljava/lang/String;)Ll/nxp$a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/UserMedal;->familyLight:Z

    .line 48
    .line 49
    invoke-virtual {v1, p2}, Ll/nxp$a;->v(Z)Ll/nxp$a;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->startColor:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p2, v1}, Ll/nxp$a;->x(Ljava/lang/String;)Ll/nxp$a;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->endColor:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, v1}, Ll/nxp$a;->q(Ljava/lang/String;)Ll/nxp$a;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->borderColor:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Ll/nxp$a;->p(Ljava/lang/String;)Ll/nxp$a;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    const-string v0, "not_chat"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ll/nxp$a;->r(Ljava/lang/String;)Ll/nxp$a;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2}, Ll/nxp$a;->m()Ll/nxp;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    sget v0, Ll/obc0;->Na:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->setImageResource(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2}, Ll/nxp;->j()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p2}, Ll/nxp;->f()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    const/4 v2, 0x0

    .line 95
    invoke-static {v2, v0, v1}, Ll/n5g;->h(Landroid/graphics/Paint;Ljava/lang/String;I)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    const/4 v1, 0x1

    .line 100
    new-array v2, v1, [Landroid/view/View;

    .line 101
    .line 102
    const/4 v3, 0x0

    .line 103
    aput-object p1, v2, v3

    .line 104
    .line 105
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p2}, Ll/s5g;->e(Ll/nxp;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    if-eqz p2, :cond_1

    .line 113
    .line 114
    iget-object p0, p0, Ll/x3t;->h:Ll/ner;

    .line 115
    .line 116
    if-eqz p0, :cond_1

    .line 117
    .line 118
    invoke-interface {p0, p2}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    new-instance p2, Ll/r3t;

    .line 123
    .line 124
    invoke-direct {p2, p1}, Ll/r3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 125
    .line 126
    .line 127
    new-instance v0, Ll/s3t;

    .line 128
    .line 129
    invoke-direct {v0, p1}, Ll/s3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    :cond_1
    :goto_0
    return-void
.end method

.method public w(Lv/VDraweeView;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->P6()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/x3t;->f:Ll/cm0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget v0, Ll/obc0;->Na:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/x3t;->f:Ll/cm0;

    .line 21
    .line 22
    iget-object v1, v0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 23
    .line 24
    iget-object v0, v0, Ll/cm0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2, v1, v0}, Ll/vag;->i(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/x3t;->h:Ll/ner;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-interface {p0, p2}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p2, Ll/m3t;

    .line 41
    .line 42
    invoke-direct {p2, p1}, Ll/m3t;-><init>(Lv/VDraweeView;)V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/n3t;

    .line 46
    .line 47
    invoke-direct {v0, p1}, Ll/n3t;-><init>(Lv/VDraweeView;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V
    .locals 5

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->n(I)Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/high16 v2, 0x41a00000    # 20.0f

    .line 24
    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 28
    .line 29
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-gt v3, v4, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    :goto_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    :goto_1
    invoke-static {}, Ll/nxp$a;->n()Ll/nxp$a;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "voiceFanBase"

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ll/nxp$a;->y(Ljava/lang/String;)Ll/nxp$a;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget v3, p2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ll/nxp$a;->s(I)Ll/nxp$a;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v3, p2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ll/nxp$a;->z(Ljava/lang/String;)Ll/nxp$a;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v2, p2}, Ll/nxp$a;->w(Ljava/lang/String;)Ll/nxp$a;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->icon:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p2, v2}, Ll/nxp$a;->u(Ljava/lang/String;)Ll/nxp$a;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->startColor:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p2, v2}, Ll/nxp$a;->x(Ljava/lang/String;)Ll/nxp$a;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->endColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p2, v2}, Ll/nxp$a;->q(Ljava/lang/String;)Ll/nxp$a;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->borderStartColor:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p2, v2}, Ll/nxp$a;->p(Ljava/lang/String;)Ll/nxp$a;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->borderEndColor:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p2, v0}, Ll/nxp$a;->o(Ljava/lang/String;)Ll/nxp$a;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p2, v1}, Ll/nxp$a;->t(I)Ll/nxp$a;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    const-string v0, "not_chat"

    .line 106
    .line 107
    invoke-virtual {p2, v0}, Ll/nxp$a;->r(Ljava/lang/String;)Ll/nxp$a;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {p2}, Ll/nxp$a;->m()Ll/nxp;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    sget v0, Ll/obc0;->Na:I

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->setImageResource(I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2}, Ll/nxp;->j()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p2}, Ll/nxp;->f()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    const/4 v2, 0x0

    .line 129
    invoke-static {v2, v0, v1}, Ll/zdn0;->e(Landroid/graphics/Paint;Ljava/lang/String;I)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-virtual {p2}, Ll/nxp;->f()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    invoke-static {p1, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 138
    .line 139
    .line 140
    const/4 v1, 0x1

    .line 141
    new-array v2, v1, [Landroid/view/View;

    .line 142
    .line 143
    const/4 v3, 0x0

    .line 144
    aput-object p1, v2, v3

    .line 145
    .line 146
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    invoke-static {p2}, Ll/s5g;->e(Ll/nxp;)Lrx/c;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    if-eqz p2, :cond_3

    .line 154
    .line 155
    iget-object p0, p0, Ll/x3t;->h:Ll/ner;

    .line 156
    .line 157
    if-eqz p0, :cond_3

    .line 158
    .line 159
    invoke-interface {p0, p2}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    new-instance p2, Ll/v3t;

    .line 164
    .line 165
    invoke-direct {p2, p1}, Ll/v3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 166
    .line 167
    .line 168
    new-instance v0, Ll/w3t;

    .line 169
    .line 170
    invoke-direct {v0, p1}, Ll/w3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 171
    .line 172
    .line 173
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 178
    .line 179
    .line 180
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    :cond_3
    :goto_2
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/x3t;->z(Lcom/p1/mobile/putong/data/User;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 9
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Ll/x3t;->b:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_a

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserMedalWrapper;->singleRoomMedals:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserMedalWrapper;->multiRoomMedals:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    goto/16 :goto_5

    .line 57
    .line 58
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 59
    .line 60
    iget-object v1, v0, Lcom/p1/mobile/putong/data/UserMedalWrapper;->singleRoomMedals:Ljava/util/List;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserMedalWrapper;->multiRoomMedals:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v1, v0}, Ll/jlk0;->e(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_9

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Lcom/p1/mobile/putong/data/UserMedal;

    .line 83
    .line 84
    iget-object v4, p0, Ll/x3t;->b:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-lt v2, v4, :cond_2

    .line 91
    .line 92
    goto/16 :goto_4

    .line 93
    .line 94
    :cond_2
    iget-object v4, p0, Ll/x3t;->b:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Ll/x3t;->n(Lcom/p1/mobile/putong/data/UserMedal;)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_4

    .line 107
    .line 108
    invoke-virtual {p0, v4, v1}, Ll/x3t;->u(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    invoke-virtual {p0, v1}, Ll/x3t;->o(Lcom/p1/mobile/putong/data/UserMedal;)Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_5

    .line 119
    .line 120
    invoke-virtual {p0, v4, v1}, Ll/x3t;->x(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_5
    sget-object v5, Ll/htd0;->c:Ll/htd0;

    .line 125
    .line 126
    invoke-static {v5}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    check-cast v5, Ll/hiv;

    .line 131
    .line 132
    iget-object v6, v1, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 135
    .line 136
    iget-object v7, v7, Lcom/p1/mobile/putong/data/UserMedalWrapper;->version:Ljava/lang/String;

    .line 137
    .line 138
    const-string v8, "live"

    .line 139
    .line 140
    invoke-virtual {v5, v6, v8, v7}, Ll/hiv;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    if-nez v5, :cond_6

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_6
    const/4 v6, 0x1

    .line 148
    invoke-static {v4, v6}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-boolean v6, p0, Ll/x3t;->e:Z

    .line 152
    .line 153
    if-eqz v6, :cond_7

    .line 154
    .line 155
    new-instance v6, Ll/o3t;

    .line 156
    .line 157
    invoke-direct {v6, p0, v5, p1, p2}, Ll/o3t;-><init>(Ll/x3t;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Lcom/p1/mobile/putong/data/User;Z)V

    .line 158
    .line 159
    .line 160
    invoke-static {v4, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_7
    invoke-virtual {v4, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    :goto_3
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->isFanbaseMedal()Z

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    if-eqz v6, :cond_8

    .line 172
    .line 173
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v5}, Ll/vwt;->P6()Z

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    if-eqz v5, :cond_3

    .line 182
    .line 183
    iget-object v5, p0, Ll/x3t;->f:Ll/cm0;

    .line 184
    .line 185
    if-eqz v5, :cond_3

    .line 186
    .line 187
    sget v5, Ll/obc0;->Na:I

    .line 188
    .line 189
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->setImageResource(I)V

    .line 190
    .line 191
    .line 192
    iget v1, v1, Lcom/p1/mobile/putong/data/UserMedal;->fanbaseGrade:I

    .line 193
    .line 194
    iget-object v5, p0, Ll/x3t;->f:Ll/cm0;

    .line 195
    .line 196
    iget-object v6, v5, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 197
    .line 198
    iget-object v5, v5, Ll/cm0;->a:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {v1, v6, v5}, Ll/vag;->i(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/lang/String;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    if-eqz v1, :cond_3

    .line 205
    .line 206
    iget-object v5, p0, Ll/x3t;->h:Ll/ner;

    .line 207
    .line 208
    if-eqz v5, :cond_3

    .line 209
    .line 210
    invoke-interface {v5, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    new-instance v5, Ll/p3t;

    .line 215
    .line 216
    invoke-direct {v5, v4}, Ll/p3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 217
    .line 218
    .line 219
    new-instance v6, Ll/q3t;

    .line 220
    .line 221
    invoke-direct {v6, v4}, Ll/q3t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v5, v6}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 229
    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_8
    invoke-virtual {v4, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->getStaticUrl()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->getDynamicUrl()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v5

    .line 243
    invoke-static {v4, v1, v5}, Ll/biv;->j(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    goto/16 :goto_2

    .line 247
    .line 248
    :cond_9
    :goto_4
    sget-object p0, Ll/zeu;->e:Ljava/lang/String;

    .line 249
    .line 250
    const-string p1, "p_audio_profile"

    .line 251
    .line 252
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :cond_a
    :goto_5
    return-void
.end method
