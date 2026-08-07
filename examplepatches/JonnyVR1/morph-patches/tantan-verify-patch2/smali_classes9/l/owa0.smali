.class public Ll/owa0;
.super Ll/bpe;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/bpe;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Ll/owa0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/owa0;->b0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)I
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->updatedTime:J

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->updatedTime:J

    .line 4
    .line 5
    sub-long/2addr v0, p0

    .line 6
    long-to-int p0, v0

    .line 7
    return p0
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic a0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)I
    .locals 2

    .line 1
    new-instance v0, Ll/mwa0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/mwa0;-><init>(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 11
    .line 12
    new-instance v0, Ll/nwa0;

    .line 13
    .line 14
    invoke-direct {v0, p2}, Ll/nwa0;-><init>(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->updatedTime:J

    .line 36
    .line 37
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->updatedTime:J

    .line 38
    .line 39
    sub-long/2addr v0, p0

    .line 40
    long-to-int p0, v0

    .line 41
    return p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method


# virtual methods
.method public U()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/iwa0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/iwa0;-><init>(Ll/owa0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->k(Ljava/util/List;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/bpe;->E:Ljava/util/List;

    .line 69
    .line 70
    return-void
.end method

.method public final synthetic b0(Ljava/util/List;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Ll/bpe;->F:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    check-cast v4, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 33
    .line 34
    new-instance v5, Ll/jwa0;

    .line 35
    .line 36
    invoke-direct {v5, v4}, Ll/jwa0;-><init>(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    check-cast v5, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 44
    .line 45
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_0

    .line 50
    .line 51
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    new-instance v3, Ll/kwa0;

    .line 60
    .line 61
    invoke-direct {v3, p1}, Ll/kwa0;-><init>(Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ll/lwa0;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/lwa0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    iput-object v2, p0, Ll/bpe;->F:Ljava/util/List;

    .line 82
    .line 83
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/bpe;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/bpe;->v:Lv/VText;

    .line 5
    .line 6
    const/high16 v0, 0x41900000    # 18.0f

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/bpe;->v:Lv/VText;

    .line 12
    .line 13
    const-string p1, "#e6000000"

    .line 14
    .line 15
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public l()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H3()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ljava/util/List;

    .line 18
    .line 19
    iput-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return p0
.end method
