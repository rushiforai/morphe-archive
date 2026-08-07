.class public Ll/bse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/d0r;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xre;",
        ">;",
        "Ll/d0r;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/live/base/view/RectangleLayout;

.field public d:Landroid/widget/FrameLayout;

.field public e:Ll/xre;

.field public f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public g:Ll/dse;

.field public h:Ll/f2t;

.field public i:I


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

.method public static synthetic a(Ll/bse;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bse;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/bse;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bse;->l(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/bse;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bse;->k(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bse;->e:Ll/xre;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cse;->b(Ll/bse;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bse;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    iput-object v0, p0, Ll/bse;->b:Landroid/view/View;

    .line 8
    .line 9
    iput-object v0, p0, Ll/bse;->c:Lcom/p1/mobile/putong/live/base/view/RectangleLayout;

    .line 10
    .line 11
    iput-object v0, p0, Ll/bse;->d:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    return-void
.end method

.method public e(Ll/xre;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bse;->e:Ll/xre;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 5

    .line 1
    new-instance v0, Ll/c0s;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bse;->e:Ll/xre;

    .line 4
    .line 5
    sget v2, Ll/jgc0;->j:I

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {p0, v3, v4}, Ll/bse;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v0, v1, v2, v3}, Ll/c0s;-><init>(Ll/xzs;ILandroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    new-instance v1, Ll/yre;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/yre;-><init>(Ll/bse;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->EFFECTS_DANMAKU:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 41
    .line 42
    new-instance v1, Ll/zre;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/zre;-><init>(Ll/bse;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/bse;->b:Landroid/view/View;

    .line 51
    .line 52
    new-instance v1, Ll/ase;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/ase;-><init>(Ll/bse;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/bse;->c:Lcom/p1/mobile/putong/live/base/view/RectangleLayout;

    .line 61
    .line 62
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/bse;->C0()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->getMaxHeight(Landroid/content/Context;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/4 v2, -0x1

    .line 73
    invoke-direct {v1, v2, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    iget p2, p0, Ll/bse;->i:I

    .line 2
    .line 3
    if-eq p2, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/bse;->i:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/bse;->g:Ll/dse;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/dse;->g0(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/bse;->g:Ll/dse;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ll/dse;->w()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Ll/bse;->q(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xre;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bse;->e(Ll/xre;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic k(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bse;->h:Ll/f2t;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/f2t;->b()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Ll/bse;->h:Ll/f2t;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic l(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/bse;->h:Ll/f2t;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/f2t;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bse;->C0()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {p1, v0, v1}, Ll/f2t;-><init>(Landroid/content/Context;Landroid/view/Window;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/bse;->h:Ll/f2t;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ll/f2t;->g(Ll/d0r;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/bse;->h:Ll/f2t;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/f2t;->h()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bse;->e:Ll/xre;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xre;->M3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bse;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/bse;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p(Ll/dse;Ll/sre;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bse;->g:Ll/dse;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/dse;->w()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/bse;->g:Ll/dse;

    .line 9
    .line 10
    iget-object v0, p0, Ll/bse;->d:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/bse;->d:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-interface {p1}, Ll/dse;->K()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1, p2}, Ll/dse;->Y0(Ll/sre;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public q(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bse;->c:Lcom/p1/mobile/putong/live/base/view/RectangleLayout;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
