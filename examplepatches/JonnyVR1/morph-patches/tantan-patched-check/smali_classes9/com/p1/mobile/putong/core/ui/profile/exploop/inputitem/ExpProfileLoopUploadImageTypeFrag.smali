.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public F:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

.field public G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

.field public H:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->H:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->e5(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->f5(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->d5(Z)V

    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->c5(ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method


# virtual methods
.method public O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 17
    .line 18
    sget v0, Ll/qa00;->h:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardPadding(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->h5()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 27
    .line 28
    new-instance v0, Ll/wjf;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/wjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;->setUploadDataCallback(Ll/okf;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 37
    .line 38
    const/16 v0, 0x9

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setSlideWithoutPress(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 50
    .line 51
    const-string v1, "p_edit_profile_view"

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    move v1, v0

    .line 63
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 64
    .line 65
    if-ge v1, p1, :cond_2

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setEnableLowPhoto(Z)V

    .line 74
    .line 75
    .line 76
    if-lez v1, :cond_0

    .line 77
    .line 78
    move v3, p2

    .line 79
    goto :goto_1

    .line 80
    :cond_0
    move v3, v0

    .line 81
    :goto_1
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 82
    .line 83
    if-nez v1, :cond_1

    .line 84
    .line 85
    move v3, p2

    .line 86
    goto :goto_2

    .line 87
    :cond_1
    move v3, v0

    .line 88
    :goto_2
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 89
    .line 90
    add-int/lit8 v1, v1, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    return-object v2
.end method

.method public Q4(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->Q4(Ljava/util/List;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Ll/vjf;

    .line 34
    .line 35
    invoke-direct {p2, p0}, Ll/vjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public Z2()I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/NullPointerException;

    .line 17
    .line 18
    const-string v2, "The first pic cannot be empty\uff01"

    .line 19
    .line 20
    invoke-direct {v0, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    move v2, v1

    .line 32
    move v3, v2

    .line 33
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-ge v2, v4, :cond_2

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 42
    .line 43
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 48
    .line 49
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-nez v4, :cond_2

    .line 54
    .line 55
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 56
    .line 57
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 62
    .line 63
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 69
    .line 70
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 75
    .line 76
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 77
    .line 78
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 79
    .line 80
    const-string v5, "normal"

    .line 81
    .line 82
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-nez v4, :cond_1

    .line 87
    .line 88
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 94
    .line 95
    iput-object v0, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 96
    .line 97
    if-nez v3, :cond_3

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 104
    .line 105
    iget v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->needCount:I

    .line 106
    .line 107
    if-lt v0, v2, :cond_3

    .line 108
    .line 109
    const/4 v1, 0x1

    .line 110
    :cond_3
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 111
    .line 112
    .line 113
    return v3
.end method

.method public final b5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-static {p3}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ll/xjf;

    .line 6
    .line 7
    invoke-direct {v0, p0, p3}, Ll/xjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {p1, p2, p0, v0, p0}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->w2(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic c5(ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->g5(ILcom/p1/mobile/putong/data/Media;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->b5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic d5(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->Z2()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e5(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->Z2()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f5(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->g5(ILcom/p1/mobile/putong/data/Media;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getData()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getImageType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 19
    .line 20
    const/high16 v1, 0x41200000    # 10.0f

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 32
    .line 33
    new-instance v2, Ll/sjf;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/sjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCatchListener(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$c;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 42
    .line 43
    new-instance v2, Ll/tjf;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/tjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    move v3, v2

    .line 55
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    const/4 v5, 0x2

    .line 60
    const/4 v6, 0x1

    .line 61
    if-ge v3, v4, :cond_3

    .line 62
    .line 63
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 64
    .line 65
    sget-object v7, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 66
    .line 67
    if-ne v4, v7, :cond_0

    .line 68
    .line 69
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 74
    .line 75
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setStyle(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    sget-object v5, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 80
    .line 81
    if-ne v4, v5, :cond_1

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 88
    .line 89
    const/4 v5, 0x3

    .line 90
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setStyle(I)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 99
    .line 100
    invoke-virtual {v4, v6}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setStyle(I)V

    .line 101
    .line 102
    .line 103
    :goto_1
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 108
    .line 109
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-ge v3, v5, :cond_2

    .line 114
    .line 115
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_2
    move-object v5, v1

    .line 123
    :goto_2
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->d1(Lcom/p1/mobile/putong/data/Media;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 131
    .line 132
    new-instance v5, Ll/ujf;

    .line 133
    .line 134
    invoke-direct {v5, p0}, Ll/ujf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setChangeAction(Ll/a30;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 145
    .line 146
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x0(I)V

    .line 147
    .line 148
    .line 149
    add-int/lit8 v3, v3, 0x1

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 153
    .line 154
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->needCount:I

    .line 155
    .line 156
    if-lez v0, :cond_5

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 159
    .line 160
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 161
    .line 162
    if-ne v1, v3, :cond_4

    .line 163
    .line 164
    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 165
    .line 166
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    sub-int/2addr v0, p1

    .line 171
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    const-string v0, "\u518d\u4e0a\u4f20%d\u5f20\u7167\u7247"

    .line 184
    .line 185
    invoke-static {v1, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    goto :goto_3

    .line 190
    :cond_4
    sget-object p1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 191
    .line 192
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const-string v1, "\u8bf7\u4e0a\u4f20\u81f3\u5c11%d\u5f20\u7167\u7247"

    .line 201
    .line 202
    invoke-static {p1, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    goto :goto_3

    .line 207
    :cond_5
    const-string p1, ""

    .line 208
    .line 209
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->M4()Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;->i2(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->H:Z

    .line 217
    .line 218
    if-nez p1, :cond_6

    .line 219
    .line 220
    invoke-static {}, Ll/xra;->k()Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_6

    .line 225
    .line 226
    iput-boolean v6, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->H:Z

    .line 227
    .line 228
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 229
    .line 230
    invoke-virtual {p1, v6}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 235
    .line 236
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 237
    .line 238
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0()V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0()V

    .line 248
    .line 249
    .line 250
    :cond_6
    return-void
.end method

.method public g5(ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/yjf;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/yjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final h5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setZ(F)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/graphics/PointF;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 11
    .line 12
    .line 13
    const/high16 v1, 0x3f000000    # 0.5f

    .line 14
    .line 15
    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 20
    .line 21
    sget v2, Ll/adc0;->N5:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/wlj;

    .line 34
    .line 35
    sget-object v2, Ll/h1e0;->j:Ll/h1e0;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/wlj;->w(Ll/h1e0;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 41
    .line 42
    sget v1, Ll/adc0;->N5:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ll/wlj;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
