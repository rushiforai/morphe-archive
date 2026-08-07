.class public final synthetic Ll/e1c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e1c0;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;

    iput-object p2, p0, Ll/e1c0;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    iput-object p3, p0, Ll/e1c0;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e1c0;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;

    iget-object v1, p0, Ll/e1c0;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    iget-object p0, p0, Ll/e1c0;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->B(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method
