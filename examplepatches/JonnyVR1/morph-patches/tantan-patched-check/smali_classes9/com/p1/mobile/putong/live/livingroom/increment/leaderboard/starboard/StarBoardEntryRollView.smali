.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;
.super Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;->z()V

    return-void
.end method


# virtual methods
.method public A(Ll/t1g0;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;->i:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryItemView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryItemView;->j0(Ll/t1g0;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/c2g0;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/c2g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->w(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public getRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public makeView()Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/yec0;->R5:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryRollView;->i:Z

    .line 3
    .line 4
    return-void
.end method
