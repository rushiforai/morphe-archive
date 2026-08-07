.class public final synthetic Ll/n7e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r7e;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;


# direct methods
.method public synthetic constructor <init>(Ll/r7e;Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n7e;->a:Ll/r7e;

    iput-object p2, p0, Ll/n7e;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n7e;->a:Ll/r7e;

    iget-object p0, p0, Ll/n7e;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;

    invoke-static {v0, p0}, Ll/r7e;->F(Ll/r7e;Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V

    return-void
.end method
