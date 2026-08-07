.class public final synthetic Ll/at50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/at50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/at50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method
