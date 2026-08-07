.class public final synthetic Ll/r9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s9s;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;


# direct methods
.method public synthetic constructor <init>(Ll/s9s;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r9s;->a:Ll/s9s;

    iput-object p2, p0, Ll/r9s;->b:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r9s;->a:Ll/s9s;

    iget-object p0, p0, Ll/r9s;->b:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    invoke-static {v0, p0, p1}, Ll/s9s;->K3(Ll/s9s;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;)V

    return-void
.end method
