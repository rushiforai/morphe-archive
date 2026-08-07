.class public final synthetic Ll/pjn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qjn0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;


# direct methods
.method public synthetic constructor <init>(Ll/qjn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjn0;->a:Ll/qjn0;

    iput-object p2, p0, Ll/pjn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pjn0;->a:Ll/qjn0;

    iget-object p0, p0, Ll/pjn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    invoke-static {v0, p0, p1}, Ll/qjn0;->J3(Ll/qjn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V

    return-void
.end method
