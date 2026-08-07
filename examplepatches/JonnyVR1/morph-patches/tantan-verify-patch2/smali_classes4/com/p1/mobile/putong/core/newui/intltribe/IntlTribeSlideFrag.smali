.class public Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"

# interfaces
.implements Ll/uxl0;


# instance fields
.field public B:Ll/hjp;

.field public C:Ll/pkp;


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

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->X4(ZLandroid/os/Bundle;)V

    return-void
.end method

.method private synthetic X4(ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hjp;->p2(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private Y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public W4()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/pkp;->u0(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/sxl0;

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
    new-instance v0, Ll/hjp;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hjp;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 10
    .line 11
    new-instance v0, Ll/pkp;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Ll/pkp;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->W4()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hjp;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/pkp;->D0(Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->Y4()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/pkp;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/hjp;->n2(IILandroid/content/Intent;)V

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
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 17
    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 25
    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 33
    .line 34
    if-eq v0, v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 41
    .line 42
    if-eq v0, v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v1, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 49
    .line 50
    if-ne v0, v1, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    new-instance v0, Ll/ohp;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Ll/ohp;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;Z)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/hjp;->p2(Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/app/AutoReleaseVideoFrag;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pkp;->o1()V

    .line 7
    .line 8
    .line 9
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/hjp;->s2(I[Ljava/lang/String;[I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/pkp;->p1()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->onHiddenChanged(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pkp;->q1()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->onHiddenChanged(Z)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->y4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->B:Ll/hjp;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hjp;->t2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
