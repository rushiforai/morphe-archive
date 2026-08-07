.class public Ll/cbf;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;


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
    return-void
.end method

.method public static synthetic S(Ll/cbf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cbf;->T(Landroid/view/View;)V

    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cbf;->U()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFoodFlavor;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFoodFlavor;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public U()V
    .locals 1

    .line 1
    const-string p0, "e_edit_flavor_preference_entrance"

    .line 2
    .line 3
    const-string v0, "p_edit_profile_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V()V
    .locals 1

    .line 1
    const-string p0, "e_edit_flavor_preference_entrance"

    .line 2
    .line 3
    const-string v0, "p_edit_profile_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u7f8e\u98df\u504f\u597d"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "food"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/cbf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    const-string p1, "\u98ce\u5473\u559c\u597d"

    .line 13
    .line 14
    sget v1, Ll/dbc0;->et:I

    .line 15
    .line 16
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/cbf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 20
    .line 21
    return-object p0
.end method

.method public z()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

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
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->taste:Ljava/util/List;

    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_0

    .line 49
    .line 50
    invoke-static {v2}, Ll/pu90;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_0

    .line 59
    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v0, p0, Ll/cbf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 65
    .line 66
    const-string v2, "\u3001"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/cbf;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 76
    .line 77
    new-instance v1, Ll/bbf;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/bbf;-><init>(Ll/cbf;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/cbf;->V()V

    .line 86
    .line 87
    .line 88
    return-void
.end method
