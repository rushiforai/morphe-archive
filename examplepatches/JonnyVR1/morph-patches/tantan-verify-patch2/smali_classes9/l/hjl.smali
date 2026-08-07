.class public final synthetic Ll/hjl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/uhl;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;


# direct methods
.method public synthetic constructor <init>(Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hjl;->a:Ll/uhl;

    iput-object p2, p0, Ll/hjl;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjl;->a:Ll/uhl;

    iget-object p0, p0, Ll/hjl;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardMainlandItemView;->h0(Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Landroid/view/View;)V

    return-void
.end method
