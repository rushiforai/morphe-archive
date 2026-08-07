.class public final synthetic Ll/t0s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/LiveBridgeImpl;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/LiveBridgeImpl;Ll/aqq;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t0s;->a:Lcom/p1/mobile/putong/live/LiveBridgeImpl;

    iput-object p2, p0, Ll/t0s;->b:Ll/aqq;

    iput-object p3, p0, Ll/t0s;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/t0s;->d:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t0s;->a:Lcom/p1/mobile/putong/live/LiveBridgeImpl;

    iget-object v1, p0, Ll/t0s;->b:Ll/aqq;

    iget-object v2, p0, Ll/t0s;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/t0s;->d:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->n(Lcom/p1/mobile/putong/live/LiveBridgeImpl;Ll/aqq;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-void
.end method
