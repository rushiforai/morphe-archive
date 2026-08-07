.class public final synthetic Ll/us50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lrx/c;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;


# direct methods
.method public synthetic constructor <init>(Lrx/c;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/us50;->a:Lrx/c;

    iput-object p2, p0, Ll/us50;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/us50;->a:Lrx/c;

    iget-object p0, p0, Ll/us50;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->p(Lrx/c;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
