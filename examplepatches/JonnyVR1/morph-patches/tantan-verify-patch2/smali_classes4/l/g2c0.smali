.class public final synthetic Ll/g2c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2c0;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;

    iput-object p2, p0, Ll/g2c0;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g2c0;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;

    iget-object p0, p0, Ll/g2c0;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;->q(Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;J)V

    return-void
.end method
