.class public Ll/i9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/h8v;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lv/VPullDownRefreshLayout;

.field public e:Lcom/google/android/material/appbar/AppBarLayout;

.field public f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

.field public g:Lcom/google/android/material/tabs/TabLayout;

.field public h:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

.field public i:Ll/h8v;


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

.method public static synthetic a(Ll/i9v;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i9v;->e(Ll/mvc0;)V

    return-void
.end method

.method private e(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i9v;->i:Ll/h8v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h8v;->X2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i9v;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/i9v;->i:Ll/h8v;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/h8v;->K2()Ll/nus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m9v;->b(Ll/i9v;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/h8v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i9v;->i:Ll/h8v;

    .line 2
    .line 3
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i9v;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/raw/bd5067f0-fa5a-4faf-bd72-06636f0c4d5610.pdf"

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/i9v;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v0, Ll/bnl0;->e:I

    .line 13
    .line 14
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/bnl0;->F0()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    .line 23
    iget-object v0, p0, Ll/i9v;->b:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    sget v0, Ll/bnl0;->e:I

    .line 31
    .line 32
    const/high16 v1, 0x42b80000    # 92.0f

    .line 33
    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-static {}, Ll/bnl0;->F0()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-int/2addr v1, v2

    .line 43
    invoke-direct {p1, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/i9v;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/h8v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i9v;->c(Ll/h8v;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i9v;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/i9v;->i:Ll/h8v;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/h8v;->M2()V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i9v;->d:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    new-instance v1, Ll/h9v;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h9v;-><init>(Ll/i9v;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method
