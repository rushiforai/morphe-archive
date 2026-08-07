.class public final synthetic Ll/i36;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/j36;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;


# direct methods
.method public synthetic constructor <init>(Ll/j36;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i36;->a:Ll/j36;

    iput-object p2, p0, Ll/i36;->b:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i36;->a:Ll/j36;

    iget-object p0, p0, Ll/i36;->b:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    invoke-static {v0, p0, p1}, Ll/j36;->I(Ll/j36;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Landroid/view/View;)V

    return-void
.end method
