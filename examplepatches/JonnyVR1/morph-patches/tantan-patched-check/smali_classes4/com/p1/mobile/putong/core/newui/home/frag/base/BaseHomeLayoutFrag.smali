.class public Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

.field public final B:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public z:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->z:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 11
    .line 12
    new-instance v0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->B:Ljava/util/Map;

    .line 18
    .line 19
    new-instance v0, Ll/fm2;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/fm2;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->a5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Z4(Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

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

.method public R4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 14
    .line 15
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v2, p1

    .line 29
    :goto_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0, v3}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->W4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Landroid/os/Bundle;)Lcom/p1/mobile/android/app/Frag;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    sget v4, Ll/adc0;->Q1:I

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v1, v4, v3, v5}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v3, v4}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v3}, Landroidx/fragment/app/k;->y(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 65
    .line 66
    .line 67
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->B:Ljava/util/Map;

    .line 68
    .line 69
    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->X4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Landroidx/fragment/app/k;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Landroidx/fragment/app/k;->j()I

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->f5()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final S4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isStateSaved()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Landroidx/fragment/app/k;->r(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroidx/fragment/app/k;->l()V

    .line 40
    .line 41
    .line 42
    :cond_0
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public T4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->n1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->z:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->b5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    const-string v0, "frag_tag"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    :goto_0
    return-void

    .line 48
    :cond_3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->find(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->b5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public U4()Landroidx/fragment/app/FragmentManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public V4()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 24
    .line 25
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->B:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget v0, Ll/adc0;->Q1:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 55
    .line 56
    return-object p0
.end method

.method public W4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Landroid/os/Bundle;)Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/jj40;->g(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Landroid/os/Bundle;)Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final X4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Landroidx/fragment/app/k;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->find(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eq v1, p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroidx/fragment/app/k;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method

.method public Y4(Lcom/p1/mobile/android/app/Frag;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-eq p1, v0, :cond_2

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-eq p1, v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-eq p1, v0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-eq p1, v0, :cond_2

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 30
    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return p0

    .line 35
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public final synthetic Z4(Lcom/p1/mobile/putong/app/PutongFrag;ZLandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Y4(Lcom/p1/mobile/android/app/Frag;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance p0, Ll/km2;

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Ll/km2;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic a5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 1

    .line 1
    const-string v0, "homepage"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->c5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->U4()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "mExecutingActions"

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/td8;->s0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    instance-of v1, v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/gm2;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/gm2;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const-string v0, "homepage"

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->c5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public c5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->a8()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MARRY_MODE:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    invoke-static {}, Ll/gra;->J3()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    :cond_3
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->e5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->R4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v0, "temp_tag_show_list"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    sget-object v0, Ll/jj40;->f:Ljava/util/Set;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 29
    .line 30
    .line 31
    sget-object v0, Ll/jj40;->f:Ljava/util/Set;

    .line 32
    .line 33
    new-instance v1, Ll/jm2;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/jm2;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public d5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "frag_tag"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->find(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 48
    .line 49
    if-eq p1, v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->find(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    move-object p1, p3

    .line 65
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-static {p3}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->find(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 76
    .line 77
    if-ne p3, v0, :cond_3

    .line 78
    .line 79
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->z:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 80
    .line 81
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->c5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public e5(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "frag_tag"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "from"

    .line 29
    .line 30
    invoke-virtual {p1, v0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Ll/jj40;->f:Ljava/util/Set;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget-object p1, Ll/jj40;->f:Ljava/util/Set;

    .line 46
    .line 47
    new-instance p2, Ll/lm2;

    .line 48
    .line 49
    invoke-direct {p2}, Ll/lm2;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, p2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string p2, "temp_tag_show_list"

    .line 57
    .line 58
    invoke-virtual {p0, p2, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    new-instance p2, Landroid/os/Bundle;

    .line 63
    .line 64
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->S4(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    :cond_1
    return-void

    .line 81
    :cond_2
    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public f5()V
    .locals 0

    .line 1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Q4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/adc0;->Q1:I

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/view/View;->setId(I)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "tantanFrag_saved_tag"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->find(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->f5()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->V4()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Y4(Lcom/p1/mobile/android/app/Frag;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->Y4(Lcom/p1/mobile/android/app/Frag;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance p0, Ll/hm2;

    .line 31
    .line 32
    invoke-direct {p0, v0, p1}, Ll/hm2;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    new-instance v1, Ll/im2;

    .line 40
    .line 41
    invoke-direct {v1, p0, v0, p1}, Ll/im2;-><init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/app/PutongFrag;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "temp_tag_show_list"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    sget-object v1, Ll/jj40;->f:Ljava/util/Set;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 26
    .line 27
    .line 28
    sget-object v1, Ll/jj40;->f:Ljava/util/Set;

    .line 29
    .line 30
    new-instance v2, Ll/jm2;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/jm2;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->A:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "tantanFrag_saved_tag"

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
