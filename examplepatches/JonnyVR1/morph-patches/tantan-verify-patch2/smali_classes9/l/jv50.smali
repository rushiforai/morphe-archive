.class public final synthetic Ll/jv50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Question;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jv50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

    iput-object p2, p0, Ll/jv50;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/jv50;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/jv50;->d:Lcom/p1/mobile/putong/core/data/Question;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jv50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

    iget-object v1, p0, Ll/jv50;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/jv50;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/jv50;->d:Lcom/p1/mobile/putong/core/data/Question;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->q(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V

    return-void
.end method
