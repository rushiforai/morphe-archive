.class public final synthetic Ll/qlp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/slp0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;


# direct methods
.method public synthetic constructor <init>(Ll/slp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qlp0;->a:Ll/slp0;

    iput-object p2, p0, Ll/qlp0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qlp0;->a:Ll/slp0;

    iget-object p0, p0, Ll/qlp0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    invoke-static {v0, p0, p1}, Ll/slp0;->I(Ll/slp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Landroid/view/View;)V

    return-void
.end method
