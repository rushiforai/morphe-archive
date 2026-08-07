.class public Ll/ene;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VImage;

.field public B:Lv/VImage;

.field public C:Lv/VLinear;

.field public D:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

.field public E:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

.field public F:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

.field public G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;",
            ">;"
        }
    .end annotation
.end field

.field public u:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

.field public y:Lv/VLinear;

.field public z:Lv/VLinear;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/ene;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ene;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/ene;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ene;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/ene;Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ene;->c0(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V

    return-void
.end method

.method public static synthetic U(Ll/ene;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ene;->b0()V

    return-void
.end method

.method public static synthetic V(Ll/ene;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ene;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ll/ene;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ene;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X(Ll/ene;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ene;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic Y(Ll/ene;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ene;->G:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic Z(Ll/ene;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ene;->j0(Ljava/util/List;)V

    return-void
.end method

.method private synthetic b0()V
    .locals 6

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42700000    # 60.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    const/4 v1, 0x3

    .line 13
    div-int/2addr v0, v1

    .line 14
    iget-object v2, p0, Ll/ene;->D:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 15
    .line 16
    iget-object v3, p0, Ll/ene;->E:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 17
    .line 18
    iget-object v4, p0, Ll/ene;->F:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 19
    .line 20
    new-array v1, v1, [Landroid/view/View;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    aput-object v2, v1, v5

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    aput-object v3, v1, v2

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    aput-object v4, v1, v2

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/ene;->D:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ene;->E:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/ene;->F:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic d0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic e0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private j0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ene;->H:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/ene;->G:Ljava/util/List;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    :goto_0
    const/4 v0, 0x3

    .line 14
    if-ge p1, v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Ll/ene;->G:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ge p1, v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/ene;->G:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    :goto_1
    iget-object v1, p0, Ll/ene;->H:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->getImageUrl()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->P(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    iget-object p1, p0, Ll/ene;->A:Lv/VImage;

    .line 59
    .line 60
    iget-object v0, p0, Ll/ene;->G:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/ene;->B:Lv/VImage;

    .line 70
    .line 71
    iget-object v0, p0, Ll/ene;->G:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    xor-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/ene;->C:Lv/VLinear;

    .line 83
    .line 84
    iget-object v0, p0, Ll/ene;->G:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    xor-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 108
    .line 109
    iget-object p0, p0, Ll/ene;->G:Ljava/util/List;

    .line 110
    .line 111
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 112
    .line 113
    return-void
.end method


# virtual methods
.method public a0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fne;->b(Ll/ene;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    new-instance v1, Ll/ene$a;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ene$a;-><init>(Ll/ene;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->G(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_LEVEL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_VOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic h0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ene;->G:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ene;->G:Ljava/util/List;

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
    iget-object p0, p0, Ll/ene;->D:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->Q()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public i0(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/ene;->H:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ene;->H:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->getImageUrl()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->O(Lcom/p1/mobile/putong/data/Picture;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ene;->C:Lv/VLinear;

    .line 5
    .line 6
    new-instance v0, Ll/cne;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/cne;-><init>(Ll/ene;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ene;->D:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 15
    .line 16
    iget-object v0, p0, Ll/ene;->E:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/ene;->F:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 19
    .line 20
    filled-new-array {p1, v0, v1}, [Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/ene;->H:Ljava/util/List;

    .line 29
    .line 30
    new-instance v0, Ll/dne;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/dne;-><init>(Ll/ene;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/ene;->u:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 39
    .line 40
    const-string v0, "\u6e38\u620f\u540d\u79f0"

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/ene;->v:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 46
    .line 47
    const-string v0, "\u8ddf\u4eba\u4e00\u8d77\u73a9"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/ene;->w:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 53
    .line 54
    const-string v0, "\u6bb5\u4f4d"

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/ene;->x:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 60
    .line 61
    const-string p1, "\u5f00\u9ea6"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setTitle(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/ene;->a0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 34
    .line 35
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/ExtensionGame;->nullCheck()V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Ll/ene;->G:Ljava/util/List;

    .line 58
    .line 59
    iget-object v0, p0, Ll/ene;->u:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

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
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 76
    .line 77
    const-string v2, "\u3001"

    .line 78
    .line 79
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/ene;->v:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 103
    .line 104
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/ene;->w:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 124
    .line 125
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 128
    .line 129
    invoke-static {v1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/ene;->x:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 151
    .line 152
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 153
    .line 154
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 155
    .line 156
    invoke-static {v1}, Ll/td8;->t0(Ljava/util/List;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    check-cast v1, Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;->setValue(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 174
    .line 175
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 180
    .line 181
    invoke-direct {p0, v0}, Ll/ene;->j0(Ljava/util/List;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Ll/ene;->u:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 185
    .line 186
    new-instance v1, Ll/xme;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Ll/xme;-><init>(Ll/ene;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Ll/ene;->v:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 195
    .line 196
    new-instance v1, Ll/yme;

    .line 197
    .line 198
    invoke-direct {v1, p0}, Ll/yme;-><init>(Ll/ene;)V

    .line 199
    .line 200
    .line 201
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/ene;->w:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 205
    .line 206
    new-instance v1, Ll/zme;

    .line 207
    .line 208
    invoke-direct {v1, p0}, Ll/zme;-><init>(Ll/ene;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/ene;->x:Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileItemTextView;

    .line 215
    .line 216
    new-instance v1, Ll/ane;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/ane;-><init>(Ll/ene;)V

    .line 219
    .line 220
    .line 221
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/ene;->z:Lv/VLinear;

    .line 225
    .line 226
    new-instance v1, Ll/bne;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/bne;-><init>(Ll/ene;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method
