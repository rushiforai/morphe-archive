.class public Ll/goe;
.super Ll/az90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/az90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ll/goe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->s0()V

    return-void
.end method

.method public static synthetic i0(Ll/goe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->t0()V

    return-void
.end method

.method public static synthetic j0(Ll/goe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->p0()V

    return-void
.end method

.method public static synthetic k0(Ll/goe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->r0()V

    return-void
.end method

.method public static synthetic l0(Ll/goe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->u0()V

    return-void
.end method

.method public static synthetic m0(Ll/goe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->q0()V

    return-void
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/az90;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/goe;->n0()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/goe;->o0()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public n0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 2
    .line 3
    iget-object v1, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 4
    .line 5
    iget-object v2, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 6
    .line 7
    iget-object v3, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 8
    .line 9
    iget-object v4, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 10
    .line 11
    iget-object v5, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 12
    .line 13
    const/4 v6, 0x6

    .line 14
    new-array v6, v6, [Lv/VText;

    .line 15
    .line 16
    const/4 v7, 0x0

    .line 17
    aput-object v0, v6, v7

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aput-object v1, v6, v0

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    aput-object v2, v6, v0

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    aput-object v3, v6, v0

    .line 27
    .line 28
    const/4 v0, 0x4

    .line 29
    aput-object v4, v6, v0

    .line 30
    .line 31
    const/4 v0, 0x5

    .line 32
    aput-object v5, v6, v0

    .line 33
    .line 34
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-ge v7, v1, :cond_0

    .line 43
    .line 44
    sget-object v1, Ll/q8g0;->f:[I

    .line 45
    .line 46
    add-int/lit8 v2, v7, 0x1

    .line 47
    .line 48
    aget v1, v1, v2

    .line 49
    .line 50
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-virtual {p0, v1, v3}, Ll/ep90;->C(ILandroid/widget/TextView;)V

    .line 57
    .line 58
    .line 59
    move v7, v2

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    return-void
.end method

.method public o0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goe;->v0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_my_interests"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "sports"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->F(Ljava/lang/String;Landroidx/fragment/app/Fragment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic q0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_my_interests"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "music"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->F(Ljava/lang/String;Landroidx/fragment/app/Fragment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic r0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_my_interests"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "literature"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->F(Ljava/lang/String;Landroidx/fragment/app/Fragment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic s0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_my_interests"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "movies"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->F(Ljava/lang/String;Landroidx/fragment/app/Fragment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

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
    invoke-virtual {p0, v0}, Ll/az90;->f0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic t0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_my_interests"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "food"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->F(Ljava/lang/String;Landroidx/fragment/app/Fragment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic u0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_my_interests"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "places"

    .line 28
    .line 29
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->F(Ljava/lang/String;Landroidx/fragment/app/Fragment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final v0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 2
    .line 3
    new-instance v1, Ll/aoe;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/aoe;-><init>(Ll/goe;)V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 13
    .line 14
    new-instance v1, Ll/boe;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/boe;-><init>(Ll/goe;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 23
    .line 24
    new-instance v1, Ll/coe;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/coe;-><init>(Ll/goe;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 33
    .line 34
    new-instance v1, Ll/doe;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/doe;-><init>(Ll/goe;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 43
    .line 44
    new-instance v1, Ll/eoe;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/eoe;-><init>(Ll/goe;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 53
    .line 54
    new-instance v1, Ll/foe;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/foe;-><init>(Ll/goe;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
