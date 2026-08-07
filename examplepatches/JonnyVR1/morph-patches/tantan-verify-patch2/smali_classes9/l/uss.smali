.class public final synthetic Ll/uss;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ats;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;


# direct methods
.method public synthetic constructor <init>(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uss;->a:Ll/ats;

    iput-object p2, p0, Ll/uss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uss;->a:Ll/ats;

    iget-object p0, p0, Ll/uss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->h0(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;Landroid/view/View;)V

    return-void
.end method
