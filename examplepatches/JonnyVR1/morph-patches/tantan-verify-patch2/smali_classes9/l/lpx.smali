.class public final synthetic Ll/lpx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mpx;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

.field public final synthetic d:Ll/cm0;

.field public final synthetic e:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;


# direct methods
.method public synthetic constructor <init>(Ll/mpx;Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lpx;->a:Ll/mpx;

    iput-object p2, p0, Ll/lpx;->b:Ljava/util/List;

    iput-object p3, p0, Ll/lpx;->c:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    iput-object p4, p0, Ll/lpx;->d:Ll/cm0;

    iput-object p5, p0, Ll/lpx;->e:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lpx;->a:Ll/mpx;

    iget-object v1, p0, Ll/lpx;->b:Ljava/util/List;

    iget-object v2, p0, Ll/lpx;->c:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    iget-object v3, p0, Ll/lpx;->d:Ll/cm0;

    iget-object v4, p0, Ll/lpx;->e:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    invoke-static/range {v0 .. v5}, Ll/mpx;->g(Ll/mpx;Ljava/util/List;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method
