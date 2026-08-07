.class public final synthetic Ll/l0s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ve4;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/LiveBridgeImpl;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/LiveBridgeImpl;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l0s;->a:Lcom/p1/mobile/putong/live/LiveBridgeImpl;

    iput-object p2, p0, Ll/l0s;->b:Ll/aqq;

    iput-object p3, p0, Ll/l0s;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l0s;->a:Lcom/p1/mobile/putong/live/LiveBridgeImpl;

    iget-object v1, p0, Ll/l0s;->b:Ll/aqq;

    iget-object p0, p0, Ll/l0s;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->B(Lcom/p1/mobile/putong/live/LiveBridgeImpl;Ll/aqq;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-void
.end method
