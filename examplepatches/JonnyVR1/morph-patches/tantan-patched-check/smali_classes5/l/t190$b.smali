.class public Ll/t190$b;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:I

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/cf60;-><init>()V

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
    iput-object v0, p0, Ll/t190$b;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    new-array v1, v0, [Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Ll/t190$b;->d:Ljava/util/List;

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    iput v1, p0, Ll/t190$b;->f:I

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/t190$b;->g:Z

    .line 24
    .line 25
    iput-object p1, p0, Ll/t190$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iput-object p2, p0, Ll/t190$b;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    iput-boolean p3, p0, Ll/t190$b;->e:Z

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t190$b;->c:Ljava/util/List;

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

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t190$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ll/a690;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/t190$b;->j(Landroid/view/ViewGroup;Ll/a690;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public j(Landroid/view/ViewGroup;Ll/a690;)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t190$b;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->t(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/t190$b;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_4

    .line 31
    .line 32
    iget-object v0, p0, Ll/t190$b;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object v0, p0, Ll/t190$b;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 42
    .line 43
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    iget-boolean v0, p0, Ll/t190$b;->e:Z

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/t190$b;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p2}, Ll/a690;->v()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/t190$b;->k()Landroid/view/LayoutInflater;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget v0, Ll/rec0;->O2:I

    .line 73
    .line 74
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    move-object p1, p0

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/VipIntroGroupPage;

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroGroupPage;->b(Ll/a690;)V

    .line 82
    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_2
    invoke-virtual {p0}, Ll/t190$b;->k()Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget v2, Ll/rec0;->Q2:I

    .line 90
    .line 91
    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    move-object v0, p1

    .line 96
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;

    .line 97
    .line 98
    iget-object p0, p0, Ll/t190$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c(Lcom/p1/mobile/android/app/Act;Ll/a690;)V

    .line 101
    .line 102
    .line 103
    return-object p1

    .line 104
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/t190$b;->k()Landroid/view/LayoutInflater;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget v0, Ll/rec0;->q2:I

    .line 109
    .line 110
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    move-object p1, p0

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->b(Ll/a690;)V

    .line 118
    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_4
    :goto_1
    invoke-virtual {p0}, Ll/t190$b;->k()Landroid/view/LayoutInflater;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget v0, Ll/rec0;->r2:I

    .line 126
    .line 127
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    move-object p1, p0

    .line 132
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage3;

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage3;->b(Ll/a690;)V

    .line 135
    .line 136
    .line 137
    return-object p0
.end method

.method public k()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t190$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/t190$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/t190$b;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/t190$b;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t190$b;->d:Ljava/util/List;

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
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Ll/t190$b;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 3
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p3, Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/t190$b;->g:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget v0, p0, Ll/t190$b;->f:I

    .line 24
    .line 25
    if-eq p2, v0, :cond_1

    .line 26
    .line 27
    iput p2, p0, Ll/t190$b;->f:I

    .line 28
    .line 29
    move-object v0, p3

    .line 30
    check-cast v0, Landroid/view/View;

    .line 31
    .line 32
    sget v1, Ll/fdc0;->I0:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    check-cast v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V

    .line 46
    .line 47
    .line 48
    :cond_0
    sget v1, Ll/fdc0;->D0:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->t0()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move-object v0, p3

    .line 65
    check-cast v0, Landroid/view/View;

    .line 66
    .line 67
    sget v1, Ll/fdc0;->J0:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 74
    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->k()V

    .line 80
    .line 81
    .line 82
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2, p3}, Ll/cf60;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
