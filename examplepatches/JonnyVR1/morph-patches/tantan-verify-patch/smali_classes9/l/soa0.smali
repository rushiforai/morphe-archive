.class public Ll/soa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/poa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VLinear;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public e:Ll/poa0;

.field public f:Landroid/content/Context;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

.field public h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public i:Ljava/lang/String;

.field public j:I

.field public k:I

.field public l:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/soa0;->k:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/soa0;->f:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/soa0;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/soa0;->m(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Ll/soa0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soa0;->n(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/soa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/soa0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/tr90;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v0, v1, v2}, Ll/tr90;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/soa0;->c:Lv/VLinear;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/tr90;->u(Landroid/view/ViewGroup;Z)Landroid/util/Pair;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/soa0;->l:Landroid/util/Pair;

    .line 39
    .line 40
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v0, Landroid/view/View;

    .line 43
    .line 44
    sget v1, Ll/gdc0;->l:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/soa0;->a:Landroid/widget/TextView;

    .line 55
    .line 56
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/soa0;->l:Landroid/util/Pair;

    .line 62
    .line 63
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 66
    .line 67
    iput-object v0, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 73
    .line 74
    const-string v1, "p_upload_photos"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Ll/xra;->l()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_0

    .line 84
    .line 85
    :goto_0
    const/4 v0, 0x6

    .line 86
    if-ge v2, v0, :cond_0

    .line 87
    .line 88
    iget-object v0, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0(I)V

    .line 97
    .line 98
    .line 99
    add-int/lit8 v2, v2, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    return-void
.end method

.method private s(Ljava/util/List;)V
    .locals 5
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
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x6

    .line 5
    if-ge v1, v3, :cond_2

    .line 6
    .line 7
    iget-object v3, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 8
    .line 9
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-ge v1, v4, :cond_0

    .line 20
    .line 21
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    :cond_0
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 37
    .line 38
    new-instance v3, Ll/roa0;

    .line 39
    .line 40
    invoke-direct {v3, p0}, Ll/roa0;-><init>(Ll/soa0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 53
    .line 54
    const-string v3, "p_upload_photos"

    .line 55
    .line 56
    invoke-virtual {v2, v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-ne v1, v2, :cond_1

    .line 64
    .line 65
    iget-object v2, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P1()V

    .line 74
    .line 75
    .line 76
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-ge p1, v3, :cond_3

    .line 84
    .line 85
    iget-object v1, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 86
    .line 87
    invoke-direct {p0, p1, v2, v1}, Ll/soa0;->x(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object p1, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 91
    .line 92
    const-string v1, "from_card_upload_photo"

    .line 93
    .line 94
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_5

    .line 99
    .line 100
    iget-object p1, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 101
    .line 102
    const-string v1, "from_profile_upload_photo"

    .line 103
    .line 104
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_4

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    invoke-virtual {p0, v0}, Ll/soa0;->e(Z)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    :goto_1
    const/4 p1, 0x1

    .line 116
    invoke-virtual {p0, p1}, Ll/soa0;->e(Z)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method private x(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;)V
    .locals 2

    .line 1
    const/4 p0, 0x6

    .line 2
    const/4 v0, 0x5

    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    if-ge p1, v0, :cond_1

    .line 26
    .line 27
    add-int/lit8 p0, p1, 0x1

    .line 28
    .line 29
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    if-lez p1, :cond_2

    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x1

    .line 41
    .line 42
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/soa0;->f:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/toa0;->b(Ll/soa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/poa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/soa0;->e:Ll/poa0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/soa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/soa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/soa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget v0, Ll/kbc0;->f:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/soa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/soa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 52
    .line 53
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget v0, Ll/kbc0;->r1:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/soa0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    const/4 v3, 0x6

    .line 17
    if-ge v1, v3, :cond_1

    .line 18
    .line 19
    iget-object v3, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 20
    .line 21
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    iget-object v3, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 34
    .line 35
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 40
    .line 41
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    const-string v4, "normal"

    .line 46
    .line 47
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    iget-object v3, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 56
    .line 57
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    if-lez v2, :cond_2

    .line 72
    .line 73
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 74
    .line 75
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/poa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/soa0;->d(Ll/poa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/soa0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/soa0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/soa0;->f:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public l()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "from_card_upload_photo"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "from_profile_upload_photo"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/soa0;->f()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 36
    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    iget-object v0, p0, Ll/soa0;->e:Ll/poa0;

    .line 40
    .line 41
    iget-object v2, p0, Ll/soa0;->n:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v3, p0, Ll/soa0;->o:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    iget-object p0, p0, Ll/soa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v2, v3, p0}, Ll/poa0;->n0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v1
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/soa0;->v()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 13
    .line 14
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z1(Lcom/p1/mobile/putong/data/Video;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 31
    .line 32
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 37
    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/soa0;->v()I

    .line 44
    .line 45
    .line 46
    :goto_1
    const/4 p1, 0x6

    .line 47
    if-ge v0, p1, :cond_2

    .line 48
    .line 49
    iget-object p1, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 56
    .line 57
    const-string p2, "p_upload_photos"

    .line 58
    .line 59
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/soa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iput-object p2, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/soa0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/soa0;->n:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/soa0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->y0()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/soa0;->o:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Ll/soa0;->j:I

    .line 40
    .line 41
    iget-object p1, p0, Ll/soa0;->n:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Ll/soa0;->s(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->f5()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/soa0;->k()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->e1()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    iget-object p0, p0, Ll/soa0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPicFrag;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->d5()V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public u()V
    .locals 3

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
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->d4:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->c4:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->b4:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/qoa0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/qoa0;-><init>(Ll/soa0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public v()I
    .locals 9

    .line 1
    iget-object v0, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "from_profile_upload_photo"

    .line 8
    .line 9
    const-string v2, "from_card_upload_photo"

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    move v5, v4

    .line 21
    move v6, v5

    .line 22
    :goto_0
    const/4 v7, 0x6

    .line 23
    if-ge v4, v7, :cond_2

    .line 24
    .line 25
    iget-object v8, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 26
    .line 27
    invoke-virtual {v8, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    check-cast v8, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 32
    .line 33
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    if-nez v8, :cond_2

    .line 38
    .line 39
    if-lez v4, :cond_0

    .line 40
    .line 41
    move v6, v3

    .line 42
    :cond_0
    iget-object v7, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 43
    .line 44
    invoke-virtual {v7, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    check-cast v7, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 49
    .line 50
    iget-object v7, v7, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget-object v7, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 56
    .line 57
    invoke-virtual {v7, v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    check-cast v7, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 62
    .line 63
    iget-object v7, v7, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 66
    .line 67
    const-string v8, "normal"

    .line 68
    .line 69
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-nez v7, :cond_1

    .line 74
    .line 75
    add-int/lit8 v5, v5, 0x1

    .line 76
    .line 77
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-lez v4, :cond_4

    .line 85
    .line 86
    iget-object v8, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v8, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    if-nez v8, :cond_3

    .line 93
    .line 94
    iget-object v8, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v8, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    if-eqz v8, :cond_4

    .line 101
    .line 102
    :cond_3
    iget-object v8, p0, Ll/soa0;->n:Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    iput-object v0, v8, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 105
    .line 106
    :cond_4
    if-gt v4, v7, :cond_5

    .line 107
    .line 108
    const/4 v0, 0x0

    .line 109
    iget-object v7, p0, Ll/soa0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 110
    .line 111
    invoke-direct {p0, v4, v0, v7}, Ll/soa0;->x(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    move v4, v6

    .line 115
    goto :goto_1

    .line 116
    :cond_6
    move v5, v4

    .line 117
    :goto_1
    iget-object v0, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_8

    .line 124
    .line 125
    iget-object v0, p0, Ll/soa0;->i:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_7

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_7
    invoke-virtual {p0, v4}, Ll/soa0;->e(Z)V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_8
    :goto_2
    invoke-virtual {p0, v3}, Ll/soa0;->e(Z)V

    .line 139
    .line 140
    .line 141
    :goto_3
    iput v5, p0, Ll/soa0;->k:I

    .line 142
    .line 143
    return v5
.end method

.method public w()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/soa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "specific_edit_page_name"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v1, "e_edit_specific_profile_next"

    .line 18
    .line 19
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
