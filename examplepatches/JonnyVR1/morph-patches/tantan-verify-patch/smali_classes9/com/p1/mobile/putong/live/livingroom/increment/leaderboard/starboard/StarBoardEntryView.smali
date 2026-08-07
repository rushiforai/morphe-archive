.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/b2g0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;

.field public f:Ll/b2g0;

.field public g:Ll/t1g0;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->l0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->f:Ll/b2g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b2g0;->e4()V

    .line 4
    .line 5
    .line 6
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->n0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->o0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e2g0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b2g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->j0(Ll/b2g0;)V

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

.method public j0(Ll/b2g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->f:Ll/b2g0;

    .line 2
    .line 3
    return-void
.end method

.method public final k0(Ll/t1g0;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->g:Ll/t1g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p1, Ll/t1g0;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, v0, Ll/t1g0;->a:Ljava/lang/String;

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
    iget-object p1, p1, Ll/t1g0;->b:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->g:Ll/t1g0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/t1g0;->b:Ljava/lang/String;

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

.method public m0(Ll/t1g0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;->getRunning()Z

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->k0(Ll/t1g0;)Z

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->g:Ll/t1g0;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;

    .line 20
    .line 21
    const/16 v1, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setAdapterViewAnimTime(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;

    .line 27
    .line 28
    const-wide/16 v1, 0x190

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setNextAnim(J)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;->A(Ll/t1g0;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->reset()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/d2g0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/d2g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
