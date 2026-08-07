.class public Ll/bra0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xyl;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/xyl;",
        "Ll/iam<",
        "Ll/vqa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public e:Ll/vqa0;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

.field public h:I

.field public i:Lcom/p1/mobile/putong/data/User;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/bra0;->h:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/bra0;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p2, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/bra0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bra0;->w(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Ll/bra0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bra0;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/bra0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bra0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/bra0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bra0;->x(Ll/uxj0;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/bra0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bra0;->E()V

    return-void
.end method

.method private q()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 16
    .line 17
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 18
    .line 19
    if-ge v1, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    const-string v3, "normal"

    .line 46
    .line 47
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 54
    .line 55
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 62
    .line 63
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    return-object v0
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bra0;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_edit_lifestyle_save"

    .line 11
    .line 12
    invoke-static {v1, p0, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public B(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget p2, p0, Ll/bra0;->h:I

    .line 2
    .line 3
    if-gez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p2, 0x0

    .line 7
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 18
    .line 19
    iget p0, p0, Ll/bra0;->h:I

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z1(Lcom/p1/mobile/putong/data/Video;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    iget-object p2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 38
    .line 39
    iget p0, p0, Ll/bra0;->h:I

    .line 40
    .line 41
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 46
    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_0
    return-void
.end method

.method public final C()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 3
    .line 4
    iget v2, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 5
    .line 6
    if-ge v0, v2, :cond_1

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 13
    .line 14
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 31
    .line 32
    const-string v4, "normal"

    .line 33
    .line 34
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_0

    .line 39
    .line 40
    new-instance v3, Ll/yqa0;

    .line 41
    .line 42
    invoke-direct {v3, p0}, Ll/yqa0;-><init>(Ll/bra0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bra0;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 4
    .line 5
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 6
    .line 7
    if-ge v1, v3, :cond_7

    .line 8
    .line 9
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 14
    .line 15
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_3

    .line 22
    .line 23
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u:Lv/VImage;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    sget v4, Ll/kbc0;->z:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    sget v4, Ll/kbc0;->s1:I

    .line 45
    .line 46
    :goto_1
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    sget v4, Ll/kbc0;->x:I

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    sget v4, Ll/kbc0;->q1:I

    .line 68
    .line 69
    :goto_2
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_3
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 74
    .line 75
    .line 76
    :goto_3
    invoke-virtual {p0}, Ll/bra0;->u()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-eqz v3, :cond_4

    .line 81
    .line 82
    invoke-virtual {v2, v0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 83
    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_4
    invoke-static {}, Ll/xra;->m()Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    const/4 v4, 0x1

    .line 91
    if-eqz v3, :cond_6

    .line 92
    .line 93
    if-nez v1, :cond_5

    .line 94
    .line 95
    goto :goto_4

    .line 96
    :cond_5
    move v4, v0

    .line 97
    :goto_4
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    invoke-virtual {v2, v4, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 102
    .line 103
    .line 104
    goto :goto_5

    .line 105
    :cond_6
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {v2, v4, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 110
    .line 111
    .line 112
    :goto_5
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F1()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R1(I)V

    .line 116
    .line 117
    .line 118
    add-int/lit8 v1, v1, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    return-void
.end method

.method public final F()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/xra;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x6

    .line 14
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v1, 0x9

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    xor-int/2addr v3, v2

    .line 36
    iput-boolean v3, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e:Z

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 39
    .line 40
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 41
    .line 42
    new-instance v3, Ll/yqa0;

    .line 43
    .line 44
    invoke-direct {v3, p0}, Ll/yqa0;-><init>(Ll/bra0;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setSlideWithoutPress(Z)V

    .line 54
    .line 55
    .line 56
    move v1, v3

    .line 57
    :goto_1
    iget-object v4, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 58
    .line 59
    iget v5, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 60
    .line 61
    if-ge v1, v5, :cond_10

    .line 62
    .line 63
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-ge v1, v5, :cond_1

    .line 74
    .line 75
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_1
    const/4 v5, 0x0

    .line 83
    :goto_2
    invoke-virtual {v4, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setMediaOperation(Ll/xyl;)V

    .line 84
    .line 85
    .line 86
    iget-object v6, v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u:Lv/VImage;

    .line 87
    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-eqz v7, :cond_2

    .line 103
    .line 104
    sget v7, Ll/kbc0;->z:I

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_2
    sget v7, Ll/kbc0;->s1:I

    .line 108
    .line 109
    :goto_3
    invoke-virtual {v6, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 110
    .line 111
    .line 112
    goto :goto_5

    .line 113
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eqz v7, :cond_4

    .line 126
    .line 127
    sget v7, Ll/kbc0;->x:I

    .line 128
    .line 129
    goto :goto_4

    .line 130
    :cond_4
    sget v7, Ll/kbc0;->q1:I

    .line 131
    .line 132
    :goto_4
    invoke-virtual {v6, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 133
    .line 134
    .line 135
    :goto_5
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->o:Z

    .line 140
    .line 141
    invoke-static {}, Ll/xra;->m()Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-eqz v6, :cond_6

    .line 146
    .line 147
    if-nez v1, :cond_5

    .line 148
    .line 149
    move v6, v2

    .line 150
    goto :goto_6

    .line 151
    :cond_5
    move v6, v3

    .line 152
    :goto_6
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    invoke-virtual {v4, v6, v7}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 157
    .line 158
    .line 159
    sget-object v6, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->LIFE:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 160
    .line 161
    invoke-virtual {v4, v6}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCardDataType(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 165
    .line 166
    .line 167
    move-result v6

    .line 168
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 169
    .line 170
    goto :goto_9

    .line 171
    :cond_6
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    invoke-virtual {v4, v2, v6}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 176
    .line 177
    .line 178
    if-lez v1, :cond_7

    .line 179
    .line 180
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    if-eqz v6, :cond_7

    .line 185
    .line 186
    move v6, v2

    .line 187
    goto :goto_7

    .line 188
    :cond_7
    move v6, v3

    .line 189
    :goto_7
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 190
    .line 191
    if-nez v1, :cond_8

    .line 192
    .line 193
    invoke-virtual {p0}, Ll/bra0;->k()Z

    .line 194
    .line 195
    .line 196
    move-result v6

    .line 197
    if-eqz v6, :cond_8

    .line 198
    .line 199
    move v6, v2

    .line 200
    goto :goto_8

    .line 201
    :cond_8
    move v6, v3

    .line 202
    :goto_8
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 203
    .line 204
    :goto_9
    invoke-virtual {p0}, Ll/bra0;->u()Z

    .line 205
    .line 206
    .line 207
    move-result v6

    .line 208
    if-eqz v6, :cond_9

    .line 209
    .line 210
    invoke-virtual {v4, v3, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 211
    .line 212
    .line 213
    :cond_9
    iget-object v6, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 214
    .line 215
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 216
    .line 217
    sget-object v7, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 218
    .line 219
    if-eq v6, v7, :cond_b

    .line 220
    .line 221
    sget-object v7, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 222
    .line 223
    if-ne v6, v7, :cond_a

    .line 224
    .line 225
    goto :goto_a

    .line 226
    :cond_a
    sget-object v6, Ll/tr90;->i:Ljava/lang/String;

    .line 227
    .line 228
    goto :goto_b

    .line 229
    :cond_b
    :goto_a
    sget-object v6, Ll/tr90;->h:Ljava/lang/String;

    .line 230
    .line 231
    :goto_b
    invoke-virtual {v4, v6}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setDataFrom(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 235
    .line 236
    .line 237
    sget-object v6, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 238
    .line 239
    invoke-virtual {v4, v1, v6}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0(ILcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0}, Ll/bra0;->v()Z

    .line 243
    .line 244
    .line 245
    move-result v6

    .line 246
    if-eqz v6, :cond_d

    .line 247
    .line 248
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 249
    .line 250
    .line 251
    move-result v6

    .line 252
    if-nez v6, :cond_c

    .line 253
    .line 254
    goto :goto_c

    .line 255
    :cond_c
    move v6, v3

    .line 256
    goto :goto_d

    .line 257
    :cond_d
    :goto_c
    move v6, v2

    .line 258
    :goto_d
    invoke-static {v4, v6}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 259
    .line 260
    .line 261
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v6

    .line 265
    if-eqz v6, :cond_e

    .line 266
    .line 267
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 268
    .line 269
    const-string v7, "normal"

    .line 270
    .line 271
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 272
    .line 273
    .line 274
    move-result v6

    .line 275
    if-nez v6, :cond_e

    .line 276
    .line 277
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 278
    .line 279
    .line 280
    :cond_e
    invoke-virtual {p0}, Ll/bra0;->v()Z

    .line 281
    .line 282
    .line 283
    move-result v5

    .line 284
    if-eqz v5, :cond_f

    .line 285
    .line 286
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 287
    .line 288
    .line 289
    :cond_f
    add-int/lit8 v1, v1, 0x1

    .line 290
    .line 291
    goto/16 :goto_1

    .line 292
    .line 293
    :cond_10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 294
    .line 295
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 296
    .line 297
    iget-object v0, v0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 298
    .line 299
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    iget-object v1, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 304
    .line 305
    if-eqz v0, :cond_11

    .line 306
    .line 307
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 308
    .line 309
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 310
    .line 311
    iget-object v0, v0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 312
    .line 313
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    new-instance v1, Ll/zqa0;

    .line 322
    .line 323
    invoke-direct {v1, p0}, Ll/zqa0;-><init>(Ll/bra0;)V

    .line 324
    .line 325
    .line 326
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 331
    .line 332
    .line 333
    goto :goto_e

    .line 334
    :cond_11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 335
    .line 336
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 337
    .line 338
    iget-object v0, v0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 339
    .line 340
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    new-instance v1, Ll/ara0;

    .line 345
    .line 346
    invoke-direct {v1, p0}, Ll/ara0;-><init>(Ll/bra0;)V

    .line 347
    .line 348
    .line 349
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 354
    .line 355
    .line 356
    :goto_e
    iget-object v0, p0, Ll/bra0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 357
    .line 358
    iget-object v1, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 359
    .line 360
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 361
    .line 362
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 363
    .line 364
    if-eq v1, v4, :cond_13

    .line 365
    .line 366
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 367
    .line 368
    if-ne v1, v4, :cond_12

    .line 369
    .line 370
    goto :goto_f

    .line 371
    :cond_12
    move v2, v3

    .line 372
    :cond_13
    :goto_f
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 373
    .line 374
    .line 375
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 376
    .line 377
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-eqz v0, :cond_14

    .line 382
    .line 383
    iget-object v0, p0, Ll/bra0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 384
    .line 385
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->m()V

    .line 386
    .line 387
    .line 388
    :cond_14
    iget-object v0, p0, Ll/bra0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 389
    .line 390
    iget-object p0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 391
    .line 392
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 393
    .line 394
    .line 395
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u7167\u7247\u672a\u5b8c\u6210\u4e0a\u4f20"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "\u672a\u5b8c\u6210\u4e0a\u4f20\u7684\u7167\u7247\u5c06\u88ab\u79fb\u9664"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "\u7ee7\u7eed\u9000\u51fa"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/wqa0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/wqa0;-><init>(Ll/bra0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "\u91cd\u65b0\u4e0a\u4f20"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/xqa0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/xqa0;-><init>(Ll/bra0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public H()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 8
    .line 9
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 10
    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v0, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    iget-object p0, p0, Ll/bra0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->k()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public I()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    iget-object v3, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 28
    .line 29
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/yqa0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/yqa0;-><init>(Ll/bra0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public P3(I)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/bra0;->q()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    if-le p1, v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Ll/bra0;->q()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 22
    .line 23
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 24
    .line 25
    if-lt v0, v1, :cond_0

    .line 26
    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v0, "\u6700\u591a\u53ef\u4ee5\u4e0a\u4f20"

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 35
    .line 36
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p0, "\u7167\u7247"

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0

    .line 55
    :cond_0
    invoke-super {p0, p1}, Ll/xyl;->P3(I)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cra0;->b(Ll/bra0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f2(ILjava/lang/String;)V
    .locals 2

    .line 1
    iput p1, p0, Ll/bra0;->h:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/bra0;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/high16 v0, 0x42200000    # 40.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr p1, v0

    .line 16
    const/4 v0, 0x1

    .line 17
    const v1, 0x3f4ccccd    # 0.8f

    .line 18
    .line 19
    .line 20
    invoke-static {p0, p2, v1, p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FIZ)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/16 p2, 0x6000

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public getSelfActions()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->c:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 9
    .line 10
    iget-object p0, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z0()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vqa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bra0;->j(Ll/vqa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bra0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/vqa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bra0;->e:Ll/vqa0;

    .line 2
    .line 3
    return-void
.end method

.method public final k()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bra0;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bra0;->i:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public m()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    move v0, v1

    .line 11
    :goto_0
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 12
    .line 13
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 14
    .line 15
    if-ge v1, v3, :cond_1

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 40
    .line 41
    const-string v3, "normal"

    .line 42
    .line 43
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return v0

    .line 55
    :cond_2
    return v1
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Ll/bra0;->q()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public n0(IZZZ)V
    .locals 3

    .line 1
    iput p1, p0, Ll/bra0;->h:I

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    const/16 p2, 0x312

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    invoke-virtual {p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p0, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 46
    .line 47
    .line 48
    sget p2, Ll/z7c0;->h:I

    .line 49
    .line 50
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    const/high16 p3, 0x42200000    # 40.0f

    .line 55
    .line 56
    const v1, 0x3f4ccccd    # 0.8f

    .line 57
    .line 58
    .line 59
    if-eqz p4, :cond_1

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {}, Ll/bnl0;->y0()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    sub-int/2addr v2, p3

    .line 86
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    invoke-virtual {p0, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 111
    .line 112
    .line 113
    sget p2, Ll/z7c0;->h:I

    .line 114
    .line 115
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 120
    .line 121
    .line 122
    move-result-object p4

    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-static {}, Ll/bnl0;->y0()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    sub-int/2addr v2, p3

    .line 144
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 157
    .line 158
    .line 159
    move-result-object p4

    .line 160
    invoke-virtual {p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 161
    .line 162
    .line 163
    move-result-object p4

    .line 164
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 165
    .line 166
    .line 167
    move-result-object p4

    .line 168
    invoke-virtual {p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 169
    .line 170
    .line 171
    move-result-object p4

    .line 172
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 181
    .line 182
    .line 183
    move-result-object p3

    .line 184
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 185
    .line 186
    .line 187
    move-result-object p3

    .line 188
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 189
    .line 190
    .line 191
    move-result-object p3

    .line 192
    invoke-virtual {p0, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 193
    .line 194
    .line 195
    sget p2, Ll/z7c0;->h:I

    .line 196
    .line 197
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public p()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bra0;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/bra0;->p()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bra0;->p()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/bra0;->a:Landroid/widget/TextView;

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/bra0;->s()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/bra0;->i:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/bra0;->F()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 49
    .line 50
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 51
    .line 52
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 53
    .line 54
    const-string v5, "\u66f4\u591a\u771f\u5b9e\u7167\u7247\uff0c\u5982\u6237\u5916\u7167\u3001\u5168\u8eab\u7167\uff0c\u4e3a\u4f60\u63a8\u8350\u66f4\u591a\u771f\u5b9e\u7684\u4eba"

    .line 55
    .line 56
    const-string v6, "#a9a9a9"

    .line 57
    .line 58
    const/high16 v7, 0x41700000    # 15.0f

    .line 59
    .line 60
    const/high16 v8, 0x41400000    # 12.0f

    .line 61
    .line 62
    if-ne v2, v4, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    sub-int/2addr v1, v0

    .line 85
    iget-object v0, p0, Ll/bra0;->a:Landroid/widget/TextView;

    .line 86
    .line 87
    if-lez v1, :cond_1

    .line 88
    .line 89
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-string v3, "\u518d\u4e0a\u4f20%d\u5f20\u7167\u7247"

    .line 102
    .line 103
    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    const-string v1, "\u6211\u7684\u751f\u6d3b"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :goto_0
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 117
    .line 118
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/bra0;->a:Landroid/widget/TextView;

    .line 122
    .line 123
    const/high16 v1, 0x41100000    # 9.0f

    .line 124
    .line 125
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 133
    .line 134
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 142
    .line 143
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 147
    .line 148
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 153
    .line 154
    .line 155
    goto/16 :goto_1

    .line 156
    .line 157
    :cond_2
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 158
    .line 159
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 160
    .line 161
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 162
    .line 163
    if-ne v2, v4, :cond_3

    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->V4()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_3

    .line 170
    .line 171
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 172
    .line 173
    const-string v1, "\u5c55\u793a\u5174\u8da3\u7231\u597d\u3001\u751f\u6d3b\u65e5\u5e38\uff0c\u6536\u83b7\u66f4\u591a\u79f0\u8d5e"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    goto/16 :goto_1

    .line 179
    .line 180
    :cond_3
    invoke-static {}, Ll/xra;->k()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-nez v0, :cond_4

    .line 185
    .line 186
    invoke-static {}, Ll/xra;->m()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_5

    .line 191
    .line 192
    :cond_4
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->i5()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_5

    .line 199
    .line 200
    iget-object v0, p0, Ll/bra0;->a:Landroid/widget/TextView;

    .line 201
    .line 202
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 207
    .line 208
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 209
    .line 210
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 215
    .line 216
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    sub-int/2addr v1, v3

    .line 221
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    const-string v3, "\u518d\u4e0a\u4f20%d\u5f20\u7167\u7247\uff0c\u5373\u53ef\u67e5\u770b\u5168\u90e8\u7167\u7247"

    .line 230
    .line 231
    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 239
    .line 240
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Ll/bra0;->a:Landroid/widget/TextView;

    .line 244
    .line 245
    const/high16 v1, 0x42240000    # 41.0f

    .line 246
    .line 247
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 255
    .line 256
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 264
    .line 265
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 269
    .line 270
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 275
    .line 276
    .line 277
    goto :goto_1

    .line 278
    :cond_5
    invoke-static {}, Ll/xra;->f()Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    if-eqz v0, :cond_6

    .line 283
    .line 284
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 285
    .line 286
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-eqz v0, :cond_6

    .line 291
    .line 292
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 293
    .line 294
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 295
    .line 296
    invoke-static {v0}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iget-object v1, p0, Ll/bra0;->a:Landroid/widget/TextView;

    .line 301
    .line 302
    const/4 v2, 0x0

    .line 303
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 304
    .line 305
    .line 306
    iget-object v1, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 307
    .line 308
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 309
    .line 310
    .line 311
    move-result v2

    .line 312
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 313
    .line 314
    .line 315
    iget-object v1, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 316
    .line 317
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 318
    .line 319
    .line 320
    iget-object v1, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 321
    .line 322
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 323
    .line 324
    .line 325
    move-result v2

    .line 326
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 327
    .line 328
    .line 329
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    if-nez v1, :cond_6

    .line 334
    .line 335
    iget-object v1, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 336
    .line 337
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 338
    .line 339
    .line 340
    iget-object v1, p0, Ll/bra0;->b:Landroid/widget/TextView;

    .line 341
    .line 342
    const-string v2, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 343
    .line 344
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    .line 354
    .line 355
    :cond_6
    :goto_1
    iget-object v0, p0, Ll/bra0;->c:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 356
    .line 357
    new-instance v1, Ll/bra0$a;

    .line 358
    .line 359
    invoke-direct {v1, p0}, Ll/bra0$a;-><init>(Ll/bra0;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setReorderCardsCallback(Ll/t4m;)V

    .line 363
    .line 364
    .line 365
    return-void
.end method

.method public s()Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bra0;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->i5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    iget-object p0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GUIDE_UPLOAD_PIC_AND_TAG:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 20
    .line 21
    if-ne p0, v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-nez p0, :cond_2

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qe()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v2, "fake_risk_audit_default_"

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xc(Lcom/p1/mobile/putong/data/User;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    :cond_3
    :goto_0
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    if-nez p0, :cond_4

    .line 125
    .line 126
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p0, v0}, Ll/a2i0;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 143
    .line 144
    .line 145
    :cond_4
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0
.end method

.method public u()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->X5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "marryMode"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->E:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "from_complete_equity_guide"

    .line 40
    .line 41
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public final v()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_3

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->TAG_MATCH_PIC:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 12
    .line 13
    if-eq p0, v1, :cond_2

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PIC_MATCH_TAG:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 16
    .line 17
    if-ne p0, v1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    return v0

    .line 21
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_3
    :goto_1
    return v0
.end method

.method public final synthetic w(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bra0;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bra0;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->H()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
