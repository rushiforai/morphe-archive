.class public Ll/jbf;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;",
            ">;"
        }
    .end annotation
.end field

.field public u:Landroid/view/View;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/jbf;->A:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic S(Ll/jbf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbf;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/jbf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbf;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ll/jbf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbf;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Ll/jbf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbf;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ll/jbf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jbf;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X(Ll/jbf;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbf;->a0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V

    return-void
.end method

.method public static bridge synthetic Y(Ll/jbf;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf;->A:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic Z(Ll/jbf;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbf;->g0(Ljava/util/List;)V

    return-void
.end method

.method private synthetic b0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameName;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameName;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final synthetic a0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Ll/qa00;->q:I

    .line 6
    .line 7
    mul-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    sget v1, Ll/qa00;->h:I

    .line 11
    .line 12
    mul-int/lit8 v2, v1, 0x2

    .line 13
    .line 14
    sub-int/2addr v0, v2

    .line 15
    mul-int/lit8 v1, v1, 0x2

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    div-int/lit8 v0, v0, 0x3

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 25
    .line 26
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/jbf;->l()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    new-instance v2, Ll/jbf$a;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/jbf$a;-><init>(Ll/jbf;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->L(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView$b;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameTogether;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameLevel;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameLevel;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameVoice;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputGameVoice;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/jbf;->A:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x3

    .line 16
    if-ge p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/jbf;->B:Ljava/util/List;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->S()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final g0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_2

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_1
    iget-object v2, p0, Ll/jbf;->B:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->getImageUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->R(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget-object v0, p0, Ll/jbf;->u:Landroid/view/View;

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v2, 0x1

    .line 55
    xor-int/2addr v1, v2

    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object p0, p0, Ll/jbf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    const-string p1, "\u6dfb\u52a0"

    .line 68
    .line 69
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->a()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public l()I
    .locals 0

    .line 1
    const/16 p0, 0xf

    .line 2
    .line 3
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6e38\u620f\u65e5\u5e38"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "game"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 5
    .line 6
    iget-object v0, p0, Ll/jbf;->u:Landroid/view/View;

    .line 7
    .line 8
    sget v1, Ll/adc0;->O5:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 20
    .line 21
    iget-object v0, p0, Ll/jbf;->u:Landroid/view/View;

    .line 22
    .line 23
    sget v1, Ll/adc0;->P5:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 35
    .line 36
    iget-object v0, p0, Ll/jbf;->u:Landroid/view/View;

    .line 37
    .line 38
    sget v1, Ll/adc0;->Q5:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 45
    .line 46
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/jbf;->B:Ljava/util/List;

    .line 50
    .line 51
    new-instance v0, Ll/dbf;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/dbf;-><init>(Ll/jbf;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public w(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    iget-object p0, p0, Ll/jbf;->B:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->getImageUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->Q(Lcom/p1/mobile/putong/data/Picture;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/jbf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    const-string v1, "\u6e38\u620f\u540d\u79f0"

    .line 13
    .line 14
    sget v2, Ll/dbc0;->ft:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/jbf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 29
    .line 30
    const-string v1, "\u60f3\u627e\u4eba\u4e00\u8d77"

    .line 31
    .line 32
    sget v2, Ll/dbc0;->rt:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/jbf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 47
    .line 48
    const-string v1, "\u6bb5\u4f4d"

    .line 49
    .line 50
    sget v2, Ll/dbc0;->gt:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Ll/jbf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 65
    .line 66
    const-string v1, "\u5f00\u9ea6"

    .line 67
    .line 68
    sget v2, Ll/dbc0;->tt:I

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Ll/jbf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 83
    .line 84
    const-string v1, "\u6e38\u620f\u622a\u56fe"

    .line 85
    .line 86
    sget v2, Ll/dbc0;->Dt:I

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Landroid/widget/LinearLayout;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 98
    .line 99
    .line 100
    const/4 v1, 0x1

    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Ll/jbf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Ll/jbf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/jbf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/jbf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/jbf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Ll/jbf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Ll/jbf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Ll/jbf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Ll/jbf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    sget v1, Ll/kec0;->C9:I

    .line 174
    .line 175
    const/4 v2, 0x0

    .line 176
    invoke-virtual {p1, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iput-object p1, p0, Ll/jbf;->u:Landroid/view/View;

    .line 181
    .line 182
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 183
    .line 184
    .line 185
    return-object v0
.end method

.method public z()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/ExtensionGame;->nullCheck()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/jbf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 53
    .line 54
    const-string v2, "\u3001"

    .line 55
    .line 56
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/jbf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 76
    .line 77
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/jbf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 97
    .line 98
    invoke-static {v1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/jbf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 143
    .line 144
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 145
    .line 146
    iput-object v0, p0, Ll/jbf;->A:Ljava/util/List;

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Ll/jbf;->g0(Ljava/util/List;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/jbf;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 152
    .line 153
    new-instance v1, Ll/ebf;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Ll/ebf;-><init>(Ll/jbf;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/jbf;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 162
    .line 163
    new-instance v1, Ll/fbf;

    .line 164
    .line 165
    invoke-direct {v1, p0}, Ll/fbf;-><init>(Ll/jbf;)V

    .line 166
    .line 167
    .line 168
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/jbf;->x:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 172
    .line 173
    new-instance v1, Ll/gbf;

    .line 174
    .line 175
    invoke-direct {v1, p0}, Ll/gbf;-><init>(Ll/jbf;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/jbf;->y:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 182
    .line 183
    new-instance v1, Ll/hbf;

    .line 184
    .line 185
    invoke-direct {v1, p0}, Ll/hbf;-><init>(Ll/jbf;)V

    .line 186
    .line 187
    .line 188
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Ll/jbf;->z:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 192
    .line 193
    new-instance v1, Ll/ibf;

    .line 194
    .line 195
    invoke-direct {v1, p0}, Ll/ibf;-><init>(Ll/jbf;)V

    .line 196
    .line 197
    .line 198
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method
