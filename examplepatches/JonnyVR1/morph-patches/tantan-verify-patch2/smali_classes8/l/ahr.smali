.class public Ll/ahr;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/LikedUser;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/fjr;

.field public e:Z


# direct methods
.method public constructor <init>(Ll/fjr;)V
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
    iput-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ahr;->d:Ll/fjr;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/ahr;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ahr;->N(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic F(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ahr;->P(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic G(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ahr;->M(Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method

.method public static synthetic H(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;IILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/ahr;->Q(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;IILcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic I(Ll/ahr;Lcom/p1/mobile/putong/data/User;IILcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/ahr;->O(Lcom/p1/mobile/putong/data/User;IILcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ahr;->J(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LikedUser;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

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
    invoke-static {}, Ll/rs9;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    :goto_0
    add-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    return p0

    .line 26
    :cond_1
    iget-boolean v0, p0, Ll/ahr;->e:Z

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/16 v1, 0x32

    .line 37
    .line 38
    if-le v0, v1, :cond_2

    .line 39
    .line 40
    const/16 p0, 0x33

    .line 41
    .line 42
    return p0

    .line 43
    :cond_2
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/16 v1, 0x1f4

    .line 50
    .line 51
    if-le v0, v1, :cond_3

    .line 52
    .line 53
    const/16 p0, 0x1f5

    .line 54
    .line 55
    return p0

    .line 56
    :cond_3
    iget-object p0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    goto :goto_0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ahr;->d:Ll/fjr;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/pec0;->c0:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget p2, Ll/pec0;->b0:I

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LikedUser;II)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    move-object v4, p1

    .line 5
    check-cast v4, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 6
    .line 7
    iget-object p1, p0, Ll/ahr;->d:Ll/fjr;

    .line 8
    .line 9
    iget-object p1, p1, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p3, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p0, p1, p3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v1, Ll/vgr;

    .line 26
    .line 27
    const/4 v6, 0x4

    .line 28
    move-object v2, p0

    .line 29
    move-object v3, p2

    .line 30
    move v5, p4

    .line 31
    invoke-direct/range {v1 .. v6}, Ll/vgr;-><init>(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;II)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    if-nez p3, :cond_1

    .line 43
    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserHeaderView;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserHeaderView;->b()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public K(I)Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    add-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final L(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahr;->d:Ll/fjr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fjr;->e1(Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ahr;->V(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/ahr;->L(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/data/User;IILcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahr;->d:Ll/fjr;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fjr;->D0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/ahr;->d:Ll/fjr;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/fjr;->F0(Lcom/p1/mobile/putong/data/User;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iget-object p1, p0, Ll/ahr;->d:Ll/fjr;

    .line 20
    .line 21
    iget-object p1, p1, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "e_iliked_photo"

    .line 28
    .line 29
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-boolean p1, p0, Ll/ahr;->e:Z

    .line 33
    .line 34
    if-nez p1, :cond_3

    .line 35
    .line 36
    if-le p2, p3, :cond_3

    .line 37
    .line 38
    invoke-static {}, Ll/rs9;->d()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    iget-object p0, p0, Ll/ahr;->d:Ll/fjr;

    .line 46
    .line 47
    const-string p1, "p_navigation_ilike,card_button_pull"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/fjr;->f1(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/ahr;->d:Ll/fjr;

    .line 54
    .line 55
    iput-object p5, p1, Ll/fjr;->d:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 56
    .line 57
    iput-object p4, p1, Ll/fjr;->c:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 58
    .line 59
    iget-object p1, p5, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 60
    .line 61
    const-string p2, "superliked"

    .line 62
    .line 63
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    iget-object p1, p5, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 70
    .line 71
    const-string p2, "lettered"

    .line 72
    .line 73
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_5

    .line 78
    .line 79
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 82
    .line 83
    iget-object p2, p5, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Ll/xf9;->f4(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-object p2, p0, Ll/ahr;->d:Ll/fjr;

    .line 97
    .line 98
    iget-object p2, p2, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    iget-object p3, p5, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 101
    .line 102
    new-instance p5, Ll/zgr;

    .line 103
    .line 104
    invoke-direct {p5, p0, p4}, Ll/zgr;-><init>(Ll/ahr;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Ll/y20;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ahr;->d:Ll/fjr;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p3, p1, p2, v0}, Ll/fjr;->d1(ZLcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;Z)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;IILcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object v0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 12
    .line 13
    const-string v1, "matched"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    new-instance p2, Ll/wgr;

    .line 22
    .line 23
    invoke-direct {p2, p0, p1}, Ll/wgr;-><init>(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Ll/rs9;->d()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-boolean v0, p0, Ll/ahr;->e:Z

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    if-le p3, p4, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    :cond_2
    :goto_0
    new-instance v2, Ll/xgr;

    .line 46
    .line 47
    move-object v3, p0

    .line 48
    move-object v7, p2

    .line 49
    move v5, p3

    .line 50
    move v6, p4

    .line 51
    move-object v4, p5

    .line 52
    invoke-direct/range {v2 .. v7}, Ll/xgr;-><init>(Ll/ahr;Lcom/p1/mobile/putong/data/User;IILcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V

    .line 53
    .line 54
    .line 55
    move-object p4, v2

    .line 56
    move-object p2, v4

    .line 57
    move-object p0, v7

    .line 58
    new-instance p5, Ll/ygr;

    .line 59
    .line 60
    invoke-direct {p5, v3, p1, p2}, Ll/ygr;-><init>(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;)V

    .line 61
    .line 62
    .line 63
    move p3, v1

    .line 64
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->h(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public R(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ahr;->e:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/ahr;->e:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/core/data/LikedUser;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr v0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    :goto_0
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-lez p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 40
    .line 41
    .line 42
    :goto_1
    return v2

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public T(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/ahr;->e:Z

    .line 2
    .line 3
    iget-object p2, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public U()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

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
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final V(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 10
    .line 11
    const-string v1, "superliked"

    .line 12
    .line 13
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;->k:Lv/VText;

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/ahr;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x2

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/ahr;->d:Ll/fjr;

    .line 20
    .line 21
    iget-boolean v0, p1, Ll/fjr;->g:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p1, p1, Ll/fjr;->a:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/ahr;->d:Ll/fjr;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/fjr;->X0()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ahr;->K(I)Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method
