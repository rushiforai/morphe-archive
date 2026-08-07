.class public Lcom/p1/mobile/putong/feed/newui/camera/a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MusicCategory;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

.field public h:I

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->m:Z

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->c:Landroid/content/Context;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/camera/a;Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->T(Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/camera/a;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/a;->S(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/feed/newui/camera/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    return p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/feed/newui/camera/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->l:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/feed/newui/camera/a;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/feed/newui/camera/a;)Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/feed/newui/camera/a;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->d0(I)Z

    move-result p0

    return p0
.end method

.method private U(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 7

    .line 1
    sget v0, Ll/lbc0;->j6:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->R()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    const/16 v3, 0x3c

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->u1:I

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->m:Z

    .line 33
    .line 34
    const/16 v5, 0x8

    .line 35
    .line 36
    const/16 v6, 0x78

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->X0:I

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :goto_0
    move v2, v4

    .line 51
    move v3, v5

    .line 52
    move v4, v6

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->Q()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->u0:I

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->v1:I

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    goto :goto_0

    .line 90
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    if-eqz v2, :cond_3

    .line 96
    .line 97
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 100
    .line 101
    .line 102
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    int-to-float p0, v3

    .line 108
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    invoke-static {p1, p0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 113
    .line 114
    .line 115
    int-to-float p0, v4

    .line 116
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-static {p1, p0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 121
    .line 122
    .line 123
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/camera/a;->M(Landroid/view/View;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/lit8 v0, v0, 0x3

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v0, v1

    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->b0()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    add-int/2addr v0, p0

    .line 33
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p2, v0, :cond_4

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p2, v0, :cond_3

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-eq p2, v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    if-eq p2, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x5

    .line 15
    if-eq p2, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/tec0;->e:I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget p2, Ll/tec0;->W4:I

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    sget v0, Ll/tec0;->X4:I

    .line 58
    .line 59
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    .line 64
    .line 65
    iput-object p0, p2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->n:Ll/jic0;

    .line 66
    .line 67
    iput-object p1, p2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q:Landroid/view/ViewGroup;

    .line 68
    .line 69
    return-object p2

    .line 70
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    sget v0, Ll/tec0;->Y4:I

    .line 79
    .line 80
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->f:Ll/y20;

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->f(Ll/y20;)V

    .line 89
    .line 90
    .line 91
    return-object p1

    .line 92
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget p2, Ll/tec0;->Z4:I

    .line 101
    .line 102
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0
.end method

.method public final L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->c:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public M(Landroid/view/View;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)V
    .locals 1

    .line 1
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/camera/a;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p3, v0, :cond_3

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p3, v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p3, v0, :cond_1

    .line 13
    .line 14
    const/4 p2, 0x5

    .line 15
    if-eq p3, p2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->U(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    .line 25
    .line 26
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->g:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 27
    .line 28
    iput-object p3, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 29
    .line 30
    new-instance p3, Ll/mx10;

    .line 31
    .line 32
    invoke-direct {p3, p0}, Ll/mx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/a;)V

    .line 33
    .line 34
    .line 35
    iput-object p3, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/data/Music;

    .line 44
    .line 45
    invoke-virtual {p1, p0, p4}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->L(Lcom/p1/mobile/putong/data/Music;I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->h(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;->d(Lcom/p1/mobile/putong/feed/data/MusicCategory;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->P(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->P(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 33
    .line 34
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 37
    .line 38
    .line 39
    const/4 v0, -0x1

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->l:Ljava/lang/String;

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public O(I)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final P(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    return p1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ne p1, v0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->c0()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ge p1, v0, :cond_2

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    sub-int/2addr p1, p0

    .line 33
    add-int/lit8 p1, p1, -0x1

    .line 34
    .line 35
    return p1

    .line 36
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->c0()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sub-int/2addr p1, p0

    .line 41
    return p1
.end method

.method public final Q()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->k:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "fav"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final R()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->k:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "local"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->i:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->l:Ljava/lang/String;

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

.method public V(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public W(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MusicCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public X(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/a;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->g:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 7
    .line 8
    return-void
.end method

.method public Y(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->i:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->m:Z

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->l:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 24
    .line 25
    if-eq v0, v1, :cond_2

    .line 26
    .line 27
    new-instance v0, Ll/lx10;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/lx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/a;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    const/4 v1, 0x3

    .line 45
    iput v1, v0, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->l:Ljava/lang/String;

    .line 50
    .line 51
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 52
    .line 53
    :cond_2
    :goto_0
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->k:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->j:Ljava/lang/String;

    .line 56
    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 60
    .line 61
    .line 62
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-nez p2, :cond_3

    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    :cond_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->m:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final b0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->R()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final c0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x4

    .line 8
    .line 9
    return p0
.end method

.method public final d0(I)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, p1, :cond_0

    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    if-ltz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->P(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->e:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    .line 23
    .line 24
    iput v1, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 25
    .line 26
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->h:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public e(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->R()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x5

    .line 11
    :goto_0
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v1, v0

    .line 16
    if-le p1, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->r2()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public e0(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->j:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->k:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/a;->Z(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->O(I)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ge p1, v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/a;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    return p0

    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->c0()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-ge p1, v0, :cond_2

    .line 26
    .line 27
    const/4 p0, 0x2

    .line 28
    return p0

    .line 29
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->b0()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    sub-int/2addr p0, v1

    .line 40
    if-ne p1, p0, :cond_3

    .line 41
    .line 42
    const/4 p0, 0x5

    .line 43
    return p0

    .line 44
    :cond_3
    const/4 p0, 0x3

    .line 45
    return p0
.end method
