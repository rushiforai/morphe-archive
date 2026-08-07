.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/eao;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

.field public e:Ll/eao;

.field public f:Ll/y9o;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->l0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;->getCurrentShowView()Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->getEntryModel()Ll/y9o;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->getEntryModel()Ll/y9o;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Ll/y9o;->c:Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, ""

    .line 31
    .line 32
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->e:Ll/eao;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/eao;->b4(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->n0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->p0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hao;->a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eao;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->j0(Ll/eao;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j0(Ll/eao;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->e:Ll/eao;

    .line 2
    .line 3
    return-void
.end method

.method public final k0(Ll/y9o;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->f:Ll/y9o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p1, Ll/y9o;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, v0, Ll/y9o;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Ll/y9o;->b:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->f:Ll/y9o;

    .line 18
    .line 19
    iget-object p0, p0, Ll/y9o;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public m0(Ll/y9o;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;->getRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->k0(Ll/y9o;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->f:Ll/y9o;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->e:Ll/eao;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/oo2;->Z0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput-boolean v0, p1, Ll/y9o;->d:Z

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 32
    .line 33
    const/16 v1, 0xc8

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setAdapterViewAnimTime(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 39
    .line 40
    const-wide/16 v1, 0x190

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setNextAnim(J)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;->A(Ll/y9o;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;->reset()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/obc0;->P:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryRollView;->setVoiceLive(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/gao;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/gao;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public p0(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
