.class public final Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ!\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u000f\u0010\r\u001a\u00020\u000cH\u0014\u00a2\u0006\u0004\u0008\r\u0010\u0003J\r\u0010\u000e\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u0003J\u000f\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0003R\"\u0010\u001a\u001a\u00020\u00138\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\"\u0010\"\u001a\u00020\u001b8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u001f\"\u0004\u0008 \u0010!\u00a8\u0006#"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "<init>",
        "()V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "Z1",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "inflateView",
        "",
        "initSubscription",
        "r",
        "",
        "shouldSwitchToTransparentStatus",
        "()Z",
        "setTransparentStatusBar",
        "Landroid/widget/FrameLayout;",
        "c",
        "Landroid/widget/FrameLayout;",
        "get_picks_content__layout",
        "()Landroid/widget/FrameLayout;",
        "set_picks_content__layout",
        "(Landroid/widget/FrameLayout;)V",
        "_picks_content__layout",
        "Lv/navigationbar/VNavigationBar;",
        "d",
        "Lv/navigationbar/VNavigationBar;",
        "a2",
        "()Lv/navigationbar/VNavigationBar;",
        "set_navigation_bar",
        "(Lv/navigationbar/VNavigationBar;)V",
        "_navigation_bar",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/navigationbar/VNavigationBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Y1(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final Z1(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/o5j0;->b(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final a2()Lv/navigationbar/VNavigationBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_navigation_bar"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;->Z1(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;->setTransparentStatusBar()V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/m5j0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/m5j0;-><init>(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    sget v1, Ll/adc0;->ka:I

    .line 13
    .line 14
    new-instance v2, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;

    .line 15
    .line 16
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroidx/fragment/app/k;->i()I

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setTransparentStatusBar()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;->a2()Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/n5j0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/n5j0;-><init>(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;->a2()Lv/navigationbar/VNavigationBar;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "#00ffffff"

    .line 18
    .line 19
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
