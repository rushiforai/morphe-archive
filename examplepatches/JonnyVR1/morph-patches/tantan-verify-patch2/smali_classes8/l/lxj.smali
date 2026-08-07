.class public Ll/lxj;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/bwj;

.field public e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

.field public f:I

.field public g:I

.field public final h:[I


# direct methods
.method public constructor <init>(Ll/bwj;)V
    .locals 5

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
    iput-object v0, p0, Ll/lxj;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/lxj;->f:I

    .line 13
    .line 14
    const/4 v0, 0x6

    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x2

    .line 19
    const/4 v4, 0x4

    .line 20
    filled-new-array {v2, v3, v4, v0, v1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/lxj;->h:[I

    .line 25
    .line 26
    iput-object p1, p0, Ll/lxj;->d:Ll/bwj;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic E(Ll/lxj;Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lxj;->L(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/lxj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lxj;->K()V

    return-void
.end method

.method public static synthetic G(Ll/lxj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lxj;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic K()V
    .locals 1

    .line 1
    new-instance v0, Ll/kxj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kxj;-><init>(Ll/lxj;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p0, Ll/lxj;->d:Ll/bwj;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/bwj;->t()Ll/qvj;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/qvj;->N()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/lxj;->d:Ll/bwj;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/bwj;->x()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/lxj;->d:Ll/bwj;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    xor-int/lit8 p1, p1, 0x1

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ll/r97;->n3(Z)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/bwj;->w(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lxj;->I(Landroid/view/View;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lxj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/qec0;->Q:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;II)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 3
    .line 4
    iget p1, p0, Ll/lxj;->g:I

    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-gt p1, p4, :cond_0

    .line 9
    .line 10
    move v5, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v5, p3

    .line 13
    :goto_0
    iget-object v2, p0, Ll/lxj;->d:Ll/bwj;

    .line 14
    .line 15
    iget p1, p0, Ll/lxj;->f:I

    .line 16
    .line 17
    if-ne p4, p1, :cond_1

    .line 18
    .line 19
    move v4, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move v4, p3

    .line 22
    :goto_1
    new-instance v6, Ll/hxj;

    .line 23
    .line 24
    invoke-direct {v6, p0}, Ll/hxj;-><init>(Ll/lxj;)V

    .line 25
    .line 26
    .line 27
    move-object v1, p0

    .line 28
    move-object v3, p2

    .line 29
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->Z(Ll/lxj;Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZZLl/x20;)V

    .line 30
    .line 31
    .line 32
    iget p0, v1, Ll/lxj;->f:I

    .line 33
    .line 34
    if-ne p4, p0, :cond_2

    .line 35
    .line 36
    iput-object v0, v1, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 37
    .line 38
    :cond_2
    iget p0, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 39
    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    iget p0, v1, Ll/lxj;->g:I

    .line 43
    .line 44
    if-gt p0, p4, :cond_3

    .line 45
    .line 46
    new-instance p0, Ll/ixj;

    .line 47
    .line 48
    invoke-direct {p0, v1, v0, v3, p4}, Ll/ixj;-><init>(Ll/lxj;Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;I)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    new-instance p0, Ll/jxj;

    .line 56
    .line 57
    invoke-direct {p0, v1}, Ll/jxj;-><init>(Ll/lxj;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lxj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p4, p1, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_2

    .line 8
    .line 9
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->i:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    if-eqz p4, :cond_2

    .line 20
    .line 21
    iget-object p4, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 22
    .line 23
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_1

    .line 28
    .line 29
    iget p4, p0, Ll/lxj;->f:I

    .line 30
    .line 31
    if-eq p4, p3, :cond_2

    .line 32
    .line 33
    iget-object p4, p0, Ll/lxj;->d:Ll/bwj;

    .line 34
    .line 35
    invoke-virtual {p4}, Ll/bwj;->t()Ll/qvj;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    invoke-virtual {p4}, Ll/qvj;->F()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p4

    .line 43
    iget-object v0, p0, Ll/lxj;->d:Ll/bwj;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/bwj;->t()Ll/qvj;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/qvj;->L()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p4, v0, p2}, Ll/fyj;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 59
    .line 60
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->isChecked()Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_0

    .line 65
    .line 66
    iget-object p2, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->toggle()V

    .line 69
    .line 70
    .line 71
    :cond_0
    iput-object p1, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 72
    .line 73
    iput p3, p0, Ll/lxj;->f:I

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->isChecked()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    iget-object p0, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->toggle()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iget-object p4, p0, Ll/lxj;->d:Ll/bwj;

    .line 88
    .line 89
    invoke-virtual {p4}, Ll/bwj;->t()Ll/qvj;

    .line 90
    .line 91
    .line 92
    move-result-object p4

    .line 93
    invoke-virtual {p4}, Ll/qvj;->F()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    iget-object v0, p0, Ll/lxj;->d:Ll/bwj;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/bwj;->t()Ll/qvj;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ll/qvj;->L()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {p4, v0, p2}, Ll/fyj;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iput p3, p0, Ll/lxj;->f:I

    .line 113
    .line 114
    iput-object p1, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->isChecked()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_2

    .line 121
    .line 122
    iget-object p0, p0, Ll/lxj;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftInnerPagerItemView;->toggle()V

    .line 125
    .line 126
    .line 127
    :cond_2
    return-void
.end method

.method public N(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p2, p0, Ll/lxj;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/lxj;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/lxj;->d:Ll/bwj;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/bwj;->t()Ll/qvj;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/qvj;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string v0, "note"

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-ne p2, v0, :cond_1

    .line 35
    .line 36
    iget p2, p0, Ll/lxj;->f:I

    .line 37
    .line 38
    new-instance v0, Ll/gxj;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/gxj;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput p1, p0, Ll/lxj;->f:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object p1, p0, Ll/lxj;->d:Ll/bwj;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/qvj;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string p2, "greet"

    .line 65
    .line 66
    invoke-static {p2}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-ne p1, p2, :cond_2

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    iput p1, p0, Ll/lxj;->g:I

    .line 74
    .line 75
    const/4 p1, 0x1

    .line 76
    iput p1, p0, Ll/lxj;->f:I

    .line 77
    .line 78
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lxj;->J(I)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
