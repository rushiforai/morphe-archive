.class public Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"

# interfaces
.implements Ll/uxl0;


# instance fields
.field public B:Ll/tel;

.field public C:Ll/yfl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->X4(ZLandroid/os/Bundle;)V

    return-void
.end method

.method private synthetic X4(ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tel;->z2(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final Y4()V
    .locals 3

    .line 1
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/nh00;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/nh00;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "momentcard_contenttype"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    filled-new-array {v1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d2(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/sxl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/yfl;->y0(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/sxl0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tel;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tel;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 10
    .line 11
    new-instance v0, Ll/yfl;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Ll/yfl;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->DEFAULT_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 28
    .line 29
    invoke-static {v0}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {v0, v1, p0}, Ll/nql;->g(Landroid/content/Context;Ll/ner;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tel;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/yfl;->r()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->Y4()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/yfl;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 5
    .line 6
    const-string p1, "momentcard_contenttype"

    .line 7
    .line 8
    invoke-static {}, Ll/eui0;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/tel;->x2(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 19
    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-eq v0, v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 34
    .line 35
    if-eq v0, v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 42
    .line 43
    if-eq v0, v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 50
    .line 51
    if-eq v0, v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget-object v1, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 58
    .line 59
    if-eq v0, v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v1, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 66
    .line 67
    if-ne v0, v1, :cond_1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    new-instance v0, Ll/rcl;

    .line 71
    .line 72
    invoke-direct {v0, p0, p1}, Ll/rcl;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/tel;->z2(Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/app/AutoReleaseVideoFrag;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/yfl;->m1()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/cvl;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/cvl;->T()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MOMENT_THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/tel;->C2(I[Ljava/lang/String;[I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/cvl;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/cvl;->T()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MOMENT_THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yfl;->n1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->C:Ll/yfl;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yfl;->o1()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_activity_momentcard_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public y4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->y4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->B:Ll/tel;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tel;->D2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
