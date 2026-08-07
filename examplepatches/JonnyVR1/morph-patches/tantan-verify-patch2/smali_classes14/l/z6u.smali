.class public Ll/z6u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/q4u;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

.field public c:Landroid/view/View;

.field public d:Lv/VLinear;

.field public e:Landroid/view/View;

.field public f:Lv/navigationbar/VNavigationBar;

.field public g:Lcom/google/android/material/tabs/TabLayout;

.field public h:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;

.field public i:Ll/q4u;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z6u;->a:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a7u;->b(Ll/z6u;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/q4u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z6u;->i:Ll/q4u;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q4u;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z6u;->b(Ll/q4u;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z6u;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z6u;->i:Ll/q4u;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/z6u;->i:Ll/q4u;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/z6u;->d:Lv/VLinear;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    new-array v0, v0, [Landroid/view/View;

    .line 30
    .line 31
    aput-object p0, v0, v1

    .line 32
    .line 33
    invoke-static {v0}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
